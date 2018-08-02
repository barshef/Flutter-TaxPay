using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace FlutterwaveTechnicalHeroes.SqlDbUtilities
{
    public static class SessionNullCheckers
    {
        public static string ObjectToString(this object value)
        {
            if (value == null) return null;
            return Convert.ToString(value);
        }
    }
}