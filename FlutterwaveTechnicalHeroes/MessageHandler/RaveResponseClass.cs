using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlutterwaveTechnicalHeroes.MessageHandler
{
    public abstract class RaveResponseClass
    {
        public class Data
        {
            public string Link { get; set; }
            public string Chargecode { get; set; }
            public string Chargemessage { get; set; }
        }

        public class ResponseObject
        {
            public string Status { get; set; }
            public string Message { get; set; }
            public Data Data { get; set; }
        }
    }
}