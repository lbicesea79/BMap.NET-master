using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

using BMap.NET.HTTPService;
using Newtonsoft.Json.Linq;
using BMap.NET.BaiduWrp;
using Newtonsoft.Json;
using System.IO;

namespace Test
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            PlaceSuggestionService pSSv = new PlaceSuggestionService();
            JObject jObj = pSSv.Suggestion("WeWork", "上海");

            PlaceSuggestionWrp rslt = jObj.ToObject<PlaceSuggestionWrp>();
            LocationLL loc = rslt.result[1].location;

            double diffLat = LocationBase.Get1KMLat();
            double diffLng = LocationBase.Get1KMLng(loc.lat);

            LocationTravelData data = new LocationTravelData();
            TravelFullData fullData = new TravelFullData();

            StringBuilder sb = new StringBuilder();

            {
                LocationLL eastOceanLoc = new LocationLL(121.487487, 31.236564);
                LocationLL yunnanLoc = new LocationLL(121.487264, 31.233405);
                loc = yunnanLoc;
            }

            int range = 10;
            double gap = 0.5;

            for (int i = -range; i < range; i++)
            {
                for (int j = -range; j < range; j++)
                {
                    if(i==0 && j==0)
                    {
                        continue;
                    }

                    try
                    {
                        LocationLL loc2 = loc.Clone<LocationLL>();
                        loc2.lat += diffLat * i * gap;
                        loc2.lng += diffLng * j * gap;

                        DirectionV1Wrp dirV1 = DirectionV1Wrp.DirectionByTransit(loc, loc2, "上海");

                        LocationTravelData.Data dataItem = new LocationTravelData.Data();
                        dataItem.Loc = loc2;
                        dataItem.Distance = dirV1.result.routes[0].scheme[0].distance;
                        dataItem.Duration = dirV1.result.routes[0].scheme[0].duration;

                        data.DataList.Add(dataItem);

                        GeoDecodingServiceWrp deCdWrp = GeoDecodingServiceWrp.GeoDecoding(loc2.Clone<LocationXY>());

                        sb.AppendLine(deCdWrp.result.addressComponent.street + deCdWrp.result.addressComponent.street_number + "; " +
                            dataItem.Distance.ToString() + "; " + dataItem.Duration.ToString() + "//r");

                        TravelFullData.Data dataItemB = new TravelFullData.Data();
                        dataItemB.Target = loc2;
                        dataItemB.TargetAddress = deCdWrp.result.addressComponent;
                        dataItemB.OneTravelScheme = dirV1.result.routes[0].scheme[0];
                        fullData.DataList.Add(dataItemB);
                    }
                    catch { }
                }

                rTxBx.Text = sb.ToString();
            }  

            JsonSerializer serializer = new JsonSerializer();
            serializer.NullValueHandling = NullValueHandling.Ignore;
            using (StreamWriter sw0 = new StreamWriter(@"C:\dev\baidu\json0.txt"))
            using (StreamWriter sw1 = new StreamWriter(@"C:\dev\baidu\json1.txt"))
            using (JsonWriter writer0 = new JsonTextWriter(sw0))
            using (JsonWriter writer1 = new JsonTextWriter(sw1))
            {
                serializer.Serialize(writer0, fullData);
                serializer.Serialize(writer1, data);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            TravelFullData data = null;

            using (StreamReader sr = new StreamReader(@"C:\dev\baidu\json0.txt"))
            using (JsonReader reader = new JsonTextReader(sr))
            {
                JsonSerializer jSerializer = new JsonSerializer();
                data = jSerializer.Deserialize<TravelFullData>(reader);
            }

            StringBuilder sb = new StringBuilder();
            sb.AppendLine("title,address,longitude,latitude,coord_type,,time");
            foreach(TravelFullData.Data item in data.DataList)
            {
                GeoDecodingServiceWrp.AddressComponent address = item.TargetAddress;
                sb.Append(address.street + " " + address.street_number + ",");
                sb.Append(address.city + address.district + address.street + address.street_number + ",");
                sb.Append(item.Target.GetStrY() + "," + item.Target.GetStrX() + ",");
                sb.Append("3,,");
                sb.Append((item.OneTravelScheme.duration / 60).ToString());
                sb.AppendLine();
            }

            using (StreamWriter sw = new StreamWriter(@"C:\dev\baidu\data01.csv"))
            {
                sw.Write(sb.ToString());
            }
        }
    }
}
