using System;
using System.Globalization;
using System.Security.Cryptography;
using System.Text;

namespace FlutterwaveTechnicalHeroes.SqlDbUtilities
{
    public class Sha256HmacEncode
    {
        public static void Main()
        {
            var message = "amount=50.0&callback-url=http://localhost:8080/xp-gateway/demo-response&currency=NGN&customer-email=scaihai@gmail.com&merchant-id=00001&product-desc=MTN Top-up&product-id=mtn5&public-key=1d8c210a3b1a5d32496204618cf5bd5a&trans-id=261020178370";
            var expectedHex = "87C3DCA331226CA945DC0D2E6F78089457F25ABCF0949A10167AC6ED9CC0B5DB";
            Console.WriteLine("Ref : " + expectedHex);

            // Test out the HMAC hash method
            var key = "fbf1f5bbf7d4bfcaead84b46022286e4";
            var hashHmacHex = HashHmacHex(key, message).ToUpper();
            Console.WriteLine("HMAC: " + hashHmacHex);

            //// Test out the SHA hash method
            //string innerKey = "61574d6b157f757d02457573556645750e0341481b127a07476303136c005145436c7b46651c6e4f4f040e1569464a794e534309097258550c17616075060950";
            //string outerKey = "0b3d27017f151f17682f1f193f0c2f1f64692b227178106d2d096979066a3b2f2906112c0f760425256e647f032c2013243929636318323f667d0b0a1f6c633a";
            //string hashSHAHex = HashSHAHex(innerKey, outerKey, message);
            //Console.WriteLine("SHA : " + hashSHAHex);

            Console.ReadLine();
        }

        #region Hash Hex Functions
        public static string HashHmacHex(string keyHex, string message)
        {
            var hash = HashHmac(HexDecode(keyHex), StringEncode(message));
            return HashEncode(hash);
        }

        private static string HashShaHex(string innerKeyHex, string outerKeyHex, string message)
        {
            var hash = HashSha(HexDecode(innerKeyHex), HexDecode(outerKeyHex), StringEncode(message));
            return HashEncode(hash);
        }
        #endregion

        #region Hash Functions
        private static byte[] HashHmac(byte[] key, byte[] message)
        {
            var hash = new HMACSHA256(key);
            return hash.ComputeHash(message);
        }

        private static byte[] HashSha(byte[] innerKey, byte[] outerKey, byte[] message)
        {
            var hash = new SHA256Managed();

            // Compute the hash for the inner data first
            var innerData = new byte[innerKey.Length + message.Length];
            Buffer.BlockCopy(innerKey, 0, innerData, 0, innerKey.Length);
            Buffer.BlockCopy(message, 0, innerData, innerKey.Length, message.Length);
            var innerHash = hash.ComputeHash(innerData);

            // Compute the entire hash
            var data = new byte[outerKey.Length + innerHash.Length];
            Buffer.BlockCopy(outerKey, 0, data, 0, outerKey.Length);
            Buffer.BlockCopy(innerHash, 0, data, outerKey.Length, innerHash.Length);
            var result = hash.ComputeHash(data);

            return result;
        }
        #endregion

        #region Encoding Helpers
        private static byte[] StringEncode(string text)
        {
            var encoding = new ASCIIEncoding();
            return encoding.GetBytes(text);
        }

        private static string HashEncode(byte[] hash)
        {
            return BitConverter.ToString(hash).Replace("-", "").ToLower();
        }

        private static byte[] HexDecode(string hex)
        {
            var bytes = new byte[hex.Length / 2];
            for (var i = 0; i < bytes.Length; i++)
            {
                bytes[i] = byte.Parse(hex.Substring(i * 2, 2), NumberStyles.HexNumber);
            }
            return bytes;
        }
        #endregion
    }
}