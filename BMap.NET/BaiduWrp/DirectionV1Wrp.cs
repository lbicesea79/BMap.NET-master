using BMap.NET.HTTPService;
using Newtonsoft.Json.Linq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public class DirectionV1Wrp
    {
        public static DirectionV1Wrp DirectionByTransit(LocationLL origin, LocationLL dest, string region)
        {
            DirectionV1Service dSv = new DirectionV1Service();
            JObject jObj = dSv.DirectionByTransit(origin.ToString(), dest.ToString(), region);

            DirectionV1Wrp wrp = jObj.ToObject<DirectionV1Wrp>();

            return wrp;
        }

        public class Copyright
        {
            /// <summary>
            /// 
            /// </summary>
            public string text { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string imageUrl { get; set; }
        }

        public class Info
        {
            /// <summary>
            /// 
            /// </summary>
            public Copyright copyright { get; set; }
        }

        public class Line_priceItem
        {
            /// <summary>
            /// 
            /// </summary>
            public int line_price { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int line_type { get; set; }
        }

        public class StepOriginLocation
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class StepDestinationLocation
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class StepsItemItem
        {
            /// <summary>
            /// 
            /// </summary>
            public int distance { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int duration { get; set; }
            /// <summary>
            ///  12入口
            /// </summary>
            public string ename { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<string> pois { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string sname { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int type { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string vehicle { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public StepOriginLocation stepOriginLocation { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public StepDestinationLocation stepDestinationLocation { get; set; }
            /// <summary>
            /// 步行332米
            /// </summary>
            public string stepInstruction { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string path { get; set; }
        }

        public class OriginLocation
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class DestinationLocation
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class SchemeItem
        {
            /// <summary>
            /// 
            /// </summary>
            public string arrive_time { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int distance { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int duration { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<Line_priceItem> line_price { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int plan_trans_type { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int price { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public List<List<object>> steps { get; set; }
            // public List<List<StepsItemItem>> steps { get; set; }
            /// <summary>
            /// 最快
            /// </summary>
            public string tip_label { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string tip_label_background { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int tip_label_type { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int traffic_type { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public OriginLocation originLocation { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public DestinationLocation destinationLocation { get; set; }
        }

        public class RoutesItem
        {
            /// <summary>
            /// 
            /// </summary>
            public List<SchemeItem> scheme { get; set; }
        }

        public class OriginPt
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class Origin
        {
            /// <summary>
            /// 
            /// </summary>
            public OriginPt originPt { get; set; }
        }

        public class DestinationPt
        {
            /// <summary>
            /// 
            /// </summary>
            public double lng { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public double lat { get; set; }
        }

        public class Destination
        {
            /// <summary>
            /// 
            /// </summary>
            public DestinationPt destinationPt { get; set; }
        }

        public class DetailItem
        {
            /// <summary>
            /// 白天（05:00-23:00）
            /// </summary>
            public string desc { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string km_price { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string start_price { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public string total_price { get; set; }
        }

        public class Taxi
        {
            /// <summary>
            /// 
            /// </summary>
            public List<DetailItem> detail { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int distance { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int duration { get; set; }
            /// <summary>
            /// 全程13.5公里;3.0公里起步；燃油附加费1.0元；里程超过10.0公里，超过部分每公里收3.6元。
            /// </summary>
            public string remark { get; set; }
        }

        public class Result
        {
            /// <summary>
            /// 
            /// </summary>
            public List<RoutesItem> routes { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int traffic_condition { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public int error { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public Origin origin { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public Destination destination { get; set; }
            /// <summary>
            /// 
            /// </summary>
            public Taxi taxi { get; set; }
        }

        /// <summary>
        /// 
        /// </summary>
        public int status { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public string message { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public int type { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Info info { get; set; }
        /// <summary>
        /// 
        /// </summary>
        public Result result { get; set; }
    }
}
