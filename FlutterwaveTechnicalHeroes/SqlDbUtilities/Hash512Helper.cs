using System;
using System.Security.Cryptography;
using System.Text;

namespace FlutterwaveTechnicalHeroes.SqlDbUtilities
{
    public static class Hash512Helper
    {
            public static string GenerateSha256String(string inputString)
            {
                var sha256 = SHA256.Create();
                byte[] bytes = Encoding.UTF8.GetBytes(inputString);
                byte[] hash = sha256.ComputeHash(bytes);
                return GetStringFromHash(hash);
            }
            public static string GenerateSha512String(string inputString)
            {
                var sha512 = SHA512.Create();
                var bytes = Encoding.UTF8.GetBytes(inputString);
                var hash = sha512.ComputeHash(bytes);
                return GetStringFromHash(hash);
            }
            private static string GetStringFromHash(byte[] hash)
        {
            var result = new StringBuilder();
            for (int i = 0; i < hash.Length; i++)
            {
                result.Append(hash[i].ToString("X2"));
            }
            return result.ToString();
        }
        public static string GetDigitRandomNumbers()
        {
            Random generator = new Random();
            return generator.Next(1, 900000000).ToString("D5");
        }

    }
 }
