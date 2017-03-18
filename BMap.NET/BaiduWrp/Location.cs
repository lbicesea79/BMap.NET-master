using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public class LocationBase
    {
        protected double m_x;
        protected double m_y;

        public T Clone<T>()
            where T : LocationBase, new()
        {
            T xy = new T();
            xy.m_x = m_x;
            xy.m_y = m_y;
            return xy;
        }

        public static string ToStr(double v)
        {
            return v.ToString("0.000000");
        }

        public string GetStrX()
        {
            return LocationLL.ToStr(m_x);
        }

        public string GetStrY()
        {
            return LocationLL.ToStr(m_y);
        }

        public override string ToString()
        {
            return GetStrX() + "," + GetStrY(); 
        }

        public static double Get1KMLng(double lng)
        {
            return 1.0 / (111.0 * Math.Cos(ToRadian(lng)));
        }

        public static double Get1KMLat()
        {
            return 1.0 / 111.0;
        }

        public static double ToRadian(double deg)
        {
            return deg * Math.PI / 180.0;
        }
    }

    public class LocationTravelData
    {
        public List<Data> DataList { get; set; } = new List<Data>();

        public class Data
        {
            public LocationBase Loc { get; set; }
            public int Distance { get; set; }
            public int Duration { get; set; }
        }
    }

    public class TravelFullData
    {
        public List<Data> DataList { get; set; } = new List<Data>();

        public class Data
        {
            public LocationLL Target { get; set; }
            public GeoDecodingServiceWrp.AddressComponent TargetAddress { get; set; }
            public DirectionV1Wrp.SchemeItem OneTravelScheme { get; set; }
        }
    }

    public class LocationXY : LocationBase
    {
        public double x { get { return m_x; } set { m_x = value; } }
        public double y { get { return m_y; } set { m_y = value; } }

        public LocationXY() { }
    }

    public class LocationLL : LocationBase
    {
        public double lat { get { return m_x; } set { m_x = value; } }
        public double lng { get { return m_y; } set { m_y = value; } }

        public LocationLL() { }

        public LocationLL(double _lng, double _lat)
        {
            lat = _lat;
            lng = _lng;
        }
    }
}