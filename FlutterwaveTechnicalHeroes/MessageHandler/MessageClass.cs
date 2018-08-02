using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlutterwaveTechnicalHeroes.MessageHandler
{
    public class MessageClass
    {
        //This is the class that allow me to get the return messages from store procedure 
        public int StatusId { get; set; }
        public string StatusMessage { get; set; }
        public bool IsSuccessful => StatusId == 1;
    }
}