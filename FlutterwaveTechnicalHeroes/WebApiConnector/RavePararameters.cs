using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Newtonsoft.Json;

namespace FlutterwaveTechnicalHeroes.WebApiConnector
{
    public class RavePararameters
    {
        [JsonProperty("txref")]
        public string Txref { get; set; }

        [JsonProperty("PBFPubKey")]
        public string PbfPubKey { get; set; }

        [JsonProperty("customer_email")]
        public string CustomerEmail { get; set; }

        [JsonProperty("amount")]
        public string Amount { get; set; }

        [JsonProperty("currency")]
        public string Currency { get; set; }

        [JsonProperty("redirect_url")]
        public string Redirecturl { get; set; }

        [JsonProperty("pay_button_text")]
        public string Paybuttontext { get; set; }

        [JsonProperty("SECKEY")]
        public string Secretkey { get; set; }
    }
}