using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlutterwaveTechnicalHeroes.MessageHandler
{
    public class RaveVerifyResponseClass
    {
        public class CardToken
        {
            public string embedtoken { get; set; }
            public string shortcode { get; set; }
            public string expiry { get; set; }
        }

        public class Card
        {
            public string expirymonth { get; set; }
            public string expiryyear { get; set; }
            public string cardBIN { get; set; }
            public string last4digits { get; set; }
            public string brand { get; set; }
            public List<CardToken> card_tokens { get; set; }
            public string life_time_token { get; set; }
        }

        public class Meta
        {
            public int id { get; set; }
            public string metaname { get; set; }
            public string metavalue { get; set; }
            public DateTime createdAt { get; set; }
            public DateTime updatedAt { get; set; }
            public object deletedAt { get; set; }
            public int getpaidTransactionId { get; set; }
        }

        public class Data
        {
            public int txid { get; set; }
            public string txref { get; set; }
            public string flwref { get; set; }
            public string devicefingerprint { get; set; }
            public string cycle { get; set; }
            public int amount { get; set; }
            public string currency { get; set; }
            public int chargedamount { get; set; }
            public int appfee { get; set; }
            public int merchantfee { get; set; }
            public int merchantbearsfee { get; set; }
            public string chargecode { get; set; }
            public string chargemessage { get; set; }
            public string authmodel { get; set; }
            public string ip { get; set; }
            public string narration { get; set; }
            public string status { get; set; }
            public string vbvcode { get; set; }
            public string vbvmessage { get; set; }
            public string authurl { get; set; }
            public object acctcode { get; set; }
            public object acctmessage { get; set; }
            public string paymenttype { get; set; }
            public string paymentid { get; set; }
            public string fraudstatus { get; set; }
            public string chargetype { get; set; }
            public int createdday { get; set; }
            public string createddayname { get; set; }
            public int createdweek { get; set; }
            public int createdmonth { get; set; }
            public string createdmonthname { get; set; }
            public int createdquarter { get; set; }
            public int createdyear { get; set; }
            public bool createdyearisleap { get; set; }
            public int createddayispublicholiday { get; set; }
            public int createdhour { get; set; }
            public int createdminute { get; set; }
            public string createdpmam { get; set; }
            public DateTime created { get; set; }
            public int customerid { get; set; }
            public string custphone { get; set; }
            public string custnetworkprovider { get; set; }
            public string custname { get; set; }
            public string custemail { get; set; }
            public string custemailprovider { get; set; }
            public DateTime custcreated { get; set; }
            public int accountid { get; set; }
            public string acctbusinessname { get; set; }
            public string acctcontactperson { get; set; }
            public string acctcountry { get; set; }
            public int acctbearsfeeattransactiontime { get; set; }
            public int acctparent { get; set; }
            public string acctvpcmerchant { get; set; }
            public string acctalias { get; set; }
            public int acctisliveapproved { get; set; }
            public string orderref { get; set; }
            public int paymentplan { get; set; }
            public object paymentpage { get; set; }
            public string raveref { get; set; }
            public int amountsettledforthistransaction { get; set; }
            public Card card { get; set; }
            public List<Meta> meta { get; set; }
        }

        public class ResponseObject
        {
            public string Status { get; set; }
            public string Message { get; set; }
            public Data Data { get; set; }
        }
    }
}