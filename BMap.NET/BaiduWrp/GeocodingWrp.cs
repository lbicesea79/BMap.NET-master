using BMap.NET.HTTPService;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public class GeocodingWrp
    {
        public static GeocodingWrp Geocoding(string address)
        {
            GeocodingService geSv = new GeocodingService();
            JObject jObj = geSv.Geocoding(address);

            GeocodingWrp rslt = jObj.ToObject<GeocodingWrp>();

            return rslt;
        }

        public int status { get; set; }
        public Result result { get; set; }

        public class Result
        {
            public LocationXY location { get; set; }
            public int precise { get; set; }
            public int confidence { get; set; }
            public string level { get; set; }
        }
    }

    public class GeoDecodingServiceWrp
    {
        public static GeoDecodingServiceWrp GeoDecoding(LocationXY loc)
        {
            GeocodingService geSv = new GeocodingService();
            JObject jObj = geSv.DeGeocoding(loc.ToString());

            GeoDecodingServiceWrp rslt = jObj.ToObject<GeoDecodingServiceWrp>();

            return rslt;
        }

        public int status { get; set; }
        public Result result { get; set; }

        public class Result
        {
            public LocationXY location { get; set; }
            public string formatted_address { get; set; }
            public string business { get; set; }
            public AddressComponent addressComponent { get; set; }
            public List<Pois> pois { get; set; }
            public List<object> poiRegions { get; set; }
            public string sematic_description { get; set; }
            public int cityCode { get; set; }
        }

        public class AddressComponent
        {
            public string country { get; set; }
            public int country_code { get; set; }
            public string province { get; set; }
            public string city { get; set; }
            public string district { get; set; }
            public string adcode { get; set; }
            public string street { get; set; }
            public string street_number { get; set; }
            public string direction { get; set; }
            public string distance { get; set; }
        }

        public class Pois
        {
            public string addr { get; set; }
            public string cp { get; set; }
            public string direction { get; set; }
            public string distance { get; set; }
            public string name { get; set; }
            public string poiType { get; set; }

            /// <summary>
            /// may be wrong
            /// </summary>
            public LocationXY point { get; set; }
            public string tag { get; set; }
            public string tel { get; set; }
            public string uid { get; set; }
            public string zip { get; set; }
        }
    }
}
