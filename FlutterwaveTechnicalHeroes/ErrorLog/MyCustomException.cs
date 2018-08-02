using System;
using System.Text;

namespace FlutterwaveTechnicalHeroes.ErrorLog
{
    public static class MyCustomException
    {
        public static T FindInnerException<T>(this Exception ex) where T : Exception
        {
            if (!ex.GetType().Equals(typeof(T)))
            {
                var inner = ex.InnerException;
                if (inner == null)
                {
                    return null;
                }
                else
                {
                    if (inner.GetType().Equals(typeof(T)))
                    {
                        return (T)inner;
                    }
                    else
                    {
                        return inner.FindInnerException<T>();
                    }
                }
            }
            else
            {
                return (T)ex;
            }
        }
    }

    //public static class ExceptionExtension
    //{
        
    //}

    public static class ExceptionExtensions
    {
        public static string GetFullMessage(this Exception ex)
        {
            return ex.InnerException == null
                ? ex.Message
                : ex.Message + " --> " + ex.InnerException.GetFullMessage();
        }

        public static string Output(this Exception ex)
        {
            if (ex == null) return String.Empty;

            var res = new StringBuilder();
            res.AppendFormat("Exception of type '{0}': {1}", ex.GetType().Name, ex.Message);
            res.AppendLine();

            if (!String.IsNullOrEmpty(ex.StackTrace))
            {
                res.AppendLine(ex.StackTrace);
            }

            if (ex.InnerException != null)
            {
                res.AppendLine(ex.InnerException.Output());
            }

            return res.ToString();
        }
    }
}