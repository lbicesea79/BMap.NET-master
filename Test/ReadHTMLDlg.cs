using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Net;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Test
{
    public partial class ReadHTMLDlg : Form
    {
        public ReadHTMLDlg()
        {
            InitializeComponent();
        }

        const string POS_DOUBLE = @"\d*.\d*|\d*";
        const string POS_INT = @"[1-9]\d*";
        const string Base_URL = @"D:\05 - BIM\diandianzu\";
        const string WRONG_STR = "47年前有户型更新";

        private void btnRead_Click(object sender, EventArgs e)
        {
            double maxPrice = 0;
            StringBuilder sb = new StringBuilder();
            BuildingInfoList bInfoList = new BuildingInfoList();

            string[] files = Directory.GetFiles(Base_URL, "*.html", SearchOption.AllDirectories);

            foreach(string uri in files)
            {
                BuildingInfo info = null;
                if (File.Exists(uri) && BuildingInfo.GetBuildingInfo(uri, out info))
                {
                    sb.AppendLine(info.ToString());
                    rTxBx.Text = sb.ToString();
                    bInfoList.List.Add(info);

                    if(info.count > maxPrice)
                    {
                        maxPrice = info.count;
                    }
                }
            }

            rTxBx.AppendText("---MAX---" + maxPrice.ToString());

            JsonSerializer serializer = new JsonSerializer();
            using (StreamWriter sw0 = new StreamWriter(@"C:\dev\baidu\PriceData.txt"))
            using (JsonWriter writer0 = new JsonTextWriter(sw0))
            {
                serializer.Serialize(writer0, bInfoList);
            }
        }

        public class BuildingInfoList
        {
            public List<BuildingInfo> List { get; set; } = new List<BuildingInfo>();
        }

        static bool GetHTMLPart(string html, string head, ref string rslt)
        {
            string reLng = "<" + head + @"\.\*>([\s\S]*)" + POS_DOUBLE + "</" + head + ">";
            Match mch = Regex.Match(html, head);
            if(!mch.Success)
            {
                return false;
            }
            rslt = mch.Groups[0].Value;
            return true;
        }

        public class BuildingInfo
        {
            public double lng { get; set; }
            public double lat { get; set; }
            public double count { get; set; }
            public int Level { get; set; }

            public string ExtMsg { get; set; }

            public override string ToString()
            {
                return lng.ToString() + "," + lat.ToString() + "; Level: " + Level.ToString() + "; Price: " + count.ToString();
            }

            public static bool GetBuildingInfo(string uri, out BuildingInfo bInfo)
            {
                bInfo = new BuildingInfo();

                WebClient wCl = new WebClient();
                wCl.Encoding = Encoding.GetEncoding("GB2312");
                string htmlCode = Encoding.UTF8.GetString(wCl.DownloadData(uri));

                if(htmlCode.Contains(WRONG_STR))
                {
                    bInfo.ExtMsg = "Empty Page";
                }

                string reLng = "<span class=\"hide\" id=\"longitude\">(" + POS_DOUBLE + ")</span>";
                string reLat = "<span class=\"hide\" id=\"latitude\">(" + POS_DOUBLE + ")</span>";
                string reLv = "<span class=\"f-con\">(" + POS_INT + ")层</span>";
                string rePrice = "<span class=\"price-num\">(" + POS_DOUBLE + ")</span>";

                Match mchLng = Regex.Match(htmlCode, reLng);
                Match mchLat = Regex.Match(htmlCode, reLat);
                Match mchLv = Regex.Match(htmlCode, reLv);
                Match mchPrice = Regex.Match(htmlCode, rePrice);

                if(!mchLng.Success || !mchLat.Success || !mchLv.Success || !mchPrice.Success)
                {
                    bInfo = null;
                    return false;
                }

                try
                {
                    bInfo.lng = double.Parse(mchLng.Groups[1].Value);
                    bInfo.lat = double.Parse(mchLat.Groups[1].Value);
                    bInfo.Level = int.Parse(mchLv.Groups[1].Value);
                    bInfo.count = double.Parse(mchPrice.Groups[1].Value);
                }
                catch { return false; }
                return true;
            } 
        }
    }
}
