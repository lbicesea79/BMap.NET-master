using BMap.NET.HTTPService;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public class PlaceSuggestionWrp
    {
        public static PlaceSuggestionWrp Suggest(string query, string region)
        {
            PlaceSuggestionService pSSv = new PlaceSuggestionService();
            JObject jObj = pSSv.Suggestion(query, region);

            PlaceSuggestionWrp rslt = jObj.ToObject<PlaceSuggestionWrp>();

            return rslt;
        }

        public int status { get; set; }
        public string message { get; set; }
        public List<Result> result { get; set; }

        public class Result
        {
            public string name { get; set; }
            public LocationLL location { get; set; }
            public string uid { get; set; }
            public string city { get; set; }
            public string district { get; set; }
        }
    }
}
