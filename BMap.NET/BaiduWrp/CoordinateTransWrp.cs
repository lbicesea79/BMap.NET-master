using BMap.NET.HTTPService;
using Newtonsoft.Json;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public class CoordinateTransWrp
    {
        public static CoordinateTransWrp CoordinateTransform(LocationXY loc, MapCoordinateType from, MapCoordinateType to)
        {
            CoordinateTransService cTrSv = new CoordinateTransService();
            JObject cdRslt = 
                cTrSv.CoordinateTransform(loc.GetStrX(), loc.GetStrY(), (int)from, (int)to);

            CoordinateTransWrp rslt = cdRslt.ToObject<CoordinateTransWrp>();
            return rslt;
        }

        public static LocationXY Transform(LocationXY loc, MapCoordinateType from, MapCoordinateType to)
        {
            return CoordinateTransform(loc, from, to).result[0];
        }

        public int status { get; set; }
        public List<LocationXY> result { get; set; }
    }
}
