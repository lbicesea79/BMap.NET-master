using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace BMap.NET.BaiduWrp
{
    public enum MapCoordinateType
    {
        /// <summary>  
        /// 未知类型  
        /// </summary>  
        UNKNOWN = 0,

        /// <summary>  
        ///GPS设备获取的角度坐标;  
        /// </summary>  
        GPS_ANGLE = 1,

        /// <summary>  
        ///GPS获取的米制坐标、sogou地图所用坐标;  
        /// </summary>  
        GPS_METER_OR_SOGOU = 2,

        /// <summary>  
        ///google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标  
        /// </summary>  
        GOOGLE_SOSO_ALIYUN_MAPABC_AMAP = 3,

        /// <summary>  
        /// google地图、soso地图、aliyun地图、mapabc地图和amap地图所用坐标对应的米制坐标  
        /// </summary>  
        GOOGLE_SOSO_ALIYUN_MAPABC_AMAP_METER = 4,

        /// <summary>  
        ///百度地图采用的经纬度坐标  
        /// </summary>  
        BAIDU = 5,

        /// <summary>  
        ///百度地图采用的米制坐标  
        /// </summary>  
        BAIDU_METER = 6,

        /// <summary>  
        /// mapbar地图坐标  
        /// </summary>  
        MAPBAR = 7,

        /// <summary>  
        /// 51地图坐标  
        /// </summary>  
        _51 = 8
    }
}
