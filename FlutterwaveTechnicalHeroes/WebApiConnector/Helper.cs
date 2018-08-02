using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Net.Http.Headers;
using System.Threading.Tasks;

namespace FlutterwaveTechnicalHeroes.WebApiConnector
{
    public class Helper
    {
        private readonly string _apiBaseUri = Global.Raveconfigs.RaveBaseUrl;
        public HttpClient InitializeClient()
        {
            var client = new HttpClient { BaseAddress = new Uri(_apiBaseUri) };
            //Passing service base url  

            client.DefaultRequestHeaders.Clear();
            //Define request data format  
            client.DefaultRequestHeaders.Accept.Add(new MediaTypeWithQualityHeaderValue("application/json"));

            //Adding Headers to service
            const string username = "";
            const string password = "";
            client.DefaultRequestHeaders.Add("UCC", username);
            client.DefaultRequestHeaders.Add("PCC", password);

            return client;
        }
    }
}