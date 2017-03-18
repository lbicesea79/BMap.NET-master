<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=paeVU6Gg0AouiXiKZvtkKH1Q5U1ecWUn"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
    <script type="text/javascript" src="jquery-3.1.1.min.js"></script>
    <title>Office Rent Fee in Shanghai</title>
    <style type="text/css">
        ul, li {
            list-style: none;
            margin: 0;
            padding: 0;
            float: left;
        }

        html {
            height: 100%;
        }

        body {
            height: 100%;
            margin: 0px;
            padding: 0px;
            font-family: "微软雅黑";
        }

        #container {
            height: 95%;
            width: 100%;
        }

        #r-result {
            width: 100%;
        }
    </style>
</head>
<body>
    <div id="container"></div>
    <div id="r-result">
        <input type="button" onclick="openHeatmap();" value="Turn On" /><input type="button" onclick="closeHeatmap();" value="Turn Off" />
    </div>
</body>
</html>
<script type="text/javascript">
    var map = new BMap.Map("container");          // 创建地图实例

    var point = new BMap.Point(121.508043,31.216236);
    map.centerAndZoom(point, 14);             // 初始化地图，设置中心点坐标和地图级别
    map.enableScrollWheelZoom(); // 允许滚轮缩放

    var points = [{ "lng": 121.508043, "lat": 31.216236, "count": 3.0 }];

    $.ajaxSettings.async = false;

    var test = LoadData();

    function LoadData() {
        var dataroot = "1.json";
        $.getJSON(dataroot, function (data) {
            for (x in data.List) {
                var obj = data.List[x];
                //var p = new APoint(obj.lng, obj.lat, obj.count);
                var p = { "lng": obj.lng, "lat": obj.lat, "count": obj.count };
                points[x] = (p);
            }
        });
    }

    function APoint(lng, lat, count)
    {
        this.lng = lng;
        this.lat = lat;
        this.count = count;
    }

    console.trace(points);

    //var points =[{"lng":121.508043,"lat":31.216236,"count":3.0,"Level":24},{"lng":121.494546,"lat":31.217448,"count":4.5,"Level":30},{"lng":121.507664,"lat":31.216745,"count":4.0,"Level":17},{"lng":121.494784,"lat":31.212838,"count":4.9,"Level":6},{"lng":121.50952,"lat":31.212429,"count":8.8,"Level":5},{"lng":121.506782,"lat":31.230317,"count":5.0,"Level":5},{"lng":121.466589,"lat":31.24821,"count":4.7,"Level":28},{"lng":121.42227,"lat":31.24435,"count":6.3,"Level":44},{"lng":121.477007,"lat":31.21063,"count":6.0,"Level":23},{"lng":121.407272,"lat":31.204785,"count":7.0,"Level":15},{"lng":121.44888,"lat":31.194584,"count":7.7,"Level":30},{"lng":121.515691,"lat":31.243285,"count":9.0,"Level":26},{"lng":121.447551,"lat":31.200808,"count":5.8,"Level":30},{"lng":121.438538,"lat":31.186946,"count":3.2,"Level":29},{"lng":121.440094,"lat":31.221578,"count":5.8,"Level":28},{"lng":121.497594,"lat":31.254168,"count":5.5,"Level":40},{"lng":121.488332,"lat":31.234486,"count":3.0,"Level":28},{"lng":121.44628,"lat":31.284084,"count":4.0,"Level":18},{"lng":121.539961,"lat":31.229823,"count":10.5,"Level":37},{"lng":121.445856,"lat":31.198036,"count":3.5,"Level":28},{"lng":121.536449,"lat":31.228812,"count":5.5,"Level":27},{"lng":121.537113,"lat":31.2477,"count":4.9,"Level":33},{"lng":121.447605,"lat":31.234887,"count":4.2,"Level":31},{"lng":121.488473,"lat":31.238199,"count":6.5,"Level":31},{"lng":121.428392,"lat":31.193109,"count":6.5,"Level":23},{"lng":121.454903,"lat":31.204306,"count":6.5,"Level":17},{"lng":121.44694,"lat":31.199341,"count":8.0,"Level":26},{"lng":121.43417,"lat":31.188916,"count":5.48,"Level":26},{"lng":121.489456,"lat":31.244196,"count":4.5,"Level":18},{"lng":121.448652,"lat":31.249174,"count":5.48,"Level":25},{"lng":121.485844,"lat":31.231645,"count":7.0,"Level":45},{"lng":121.477011,"lat":31.23525,"count":9.0,"Level":26},{"lng":121.522203,"lat":31.233374,"count":9.5,"Level":22},{"lng":121.531342,"lat":31.245724,"count":8.5,"Level":15},{"lng":121.517067,"lat":31.244968,"count":5.6,"Level":27},{"lng":121.485994,"lat":31.235721,"count":6.5,"Level":27},{"lng":121.430881,"lat":31.189811,"count":5.8,"Level":28},{"lng":121.473058,"lat":31.234123,"count":6.3,"Level":26},{"lng":121.53914,"lat":31.230896,"count":4.9,"Level":17},{"lng":121.530927,"lat":31.234092,"count":5.5,"Level":29},{"lng":121.53197,"lat":31.244705,"count":5.5,"Level":27},{"lng":121.426502,"lat":31.243007,"count":5.22,"Level":25},{"lng":121.473696,"lat":31.238276,"count":4.2,"Level":38},{"lng":121.470585,"lat":31.251281,"count":3.2,"Level":21},{"lng":121.52381,"lat":31.234725,"count":5.7,"Level":18},{"lng":121.416169,"lat":31.228086,"count":4.5,"Level":2},{"lng":121.523857,"lat":31.232077,"count":7.5,"Level":31},{"lng":121.453932,"lat":31.194561,"count":4.4,"Level":30},{"lng":121.445061,"lat":31.284686,"count":4.65,"Level":15},{"lng":121.511308,"lat":31.2455,"count":16.8,"Level":46},{"lng":121.44854,"lat":31.192484,"count":4.06,"Level":26},{"lng":121.437236,"lat":31.239982,"count":5.2,"Level":22},{"lng":121.526786,"lat":31.235142,"count":6.4,"Level":41},{"lng":121.541684,"lat":31.231066,"count":10.5,"Level":26},{"lng":121.463203,"lat":31.251374,"count":5.0,"Level":38},{"lng":121.443492,"lat":31.203233,"count":5.5,"Level":27},{"lng":121.529124,"lat":31.214637,"count":4.5,"Level":37},{"lng":121.526694,"lat":31.236176,"count":5.9,"Level":22},{"lng":121.414099,"lat":31.202994,"count":5.5,"Level":31},{"lng":121.484103,"lat":31.230888,"count":7.0,"Level":36},{"lng":121.48745,"lat":31.236261,"count":6.5,"Level":26},{"lng":121.529713,"lat":31.234563,"count":6.5,"Level":30},{"lng":121.473929,"lat":31.210599,"count":4.9,"Level":31},{"lng":121.463429,"lat":31.23075,"count":4.8,"Level":29},{"lng":121.4373,"lat":31.21788,"count":5.41,"Level":34},{"lng":121.48079,"lat":31.221123,"count":7.15,"Level":31},{"lng":121.485569,"lat":31.22686,"count":15.0,"Level":25},{"lng":121.490145,"lat":31.231372,"count":5.26,"Level":28},{"lng":121.488795,"lat":31.23772,"count":4.5,"Level":20},{"lng":121.484598,"lat":31.239804,"count":6.5,"Level":21},{"lng":121.506292,"lat":31.229337,"count":10.0,"Level":22},{"lng":121.496029,"lat":31.237288,"count":4.2,"Level":35},{"lng":121.491509,"lat":31.2365,"count":5.26,"Level":24},{"lng":121.484236,"lat":31.238531,"count":8.0,"Level":26},{"lng":121.487028,"lat":31.229869,"count":9.5,"Level":28},{"lng":121.487742,"lat":31.231552,"count":6.8,"Level":20},{"lng":121.476978,"lat":31.224813,"count":8.3,"Level":19},{"lng":121.479585,"lat":31.216923,"count":12.0,"Level":27},{"lng":121.48545,"lat":31.228279,"count":3.8,"Level":26},{"lng":121.487239,"lat":31.23992,"count":4.2,"Level":29},{"lng":121.493122,"lat":31.236176,"count":6.0,"Level":8},{"lng":121.496551,"lat":31.238739,"count":6.0,"Level":30},{"lng":121.487605,"lat":31.232795,"count":5.0,"Level":18},{"lng":121.477357,"lat":31.215911,"count":4.0,"Level":9},{"lng":121.47767,"lat":31.216544,"count":7.5,"Level":9},{"lng":121.489254,"lat":31.224203,"count":5.4,"Level":28},{"lng":121.493963,"lat":31.235373,"count":3.58,"Level":23},{"lng":121.487943,"lat":31.232378,"count":3.5,"Level":16},{"lng":121.499917,"lat":31.23701,"count":8.0,"Level":12},{"lng":121.474921,"lat":31.233999,"count":3.7,"Level":30},{"lng":121.488343,"lat":31.239858,"count":5.0,"Level":33},{"lng":121.492431,"lat":31.220127,"count":4.0,"Level":20},{"lng":121.478809,"lat":31.23992,"count":12.0,"Level":22},{"lng":121.49331,"lat":31.214437,"count":5.6,"Level":20},{"lng":121.471903,"lat":31.210885,"count":3.9,"Level":10},{"lng":121.488981,"lat":31.232085,"count":6.0,"Level":22},{"lng":121.480226,"lat":31.227152,"count":6.0,"Level":21},{"lng":121.47864,"lat":31.215618,"count":5.2,"Level":15},{"lng":121.478679,"lat":31.214576,"count":4.0,"Level":23},{"lng":121.509306,"lat":31.22716,"count":7.0,"Level":42},{"lng":121.488973,"lat":31.202515,"count":7.2,"Level":39},{"lng":121.482882,"lat":31.203712,"count":4.0,"Level":28},{"lng":121.514561,"lat":31.200901,"count":3.5,"Level":26},{"lng":121.492399,"lat":31.205009,"count":2.79,"Level":35},{"lng":121.513589,"lat":31.217911,"count":7.9,"Level":20},{"lng":121.48203,"lat":31.222142,"count":5.2,"Level":19},{"lng":121.511562,"lat":31.196955,"count":4.0,"Level":12},{"lng":121.489902,"lat":31.207434,"count":3.8,"Level":3},{"lng":121.509331,"lat":31.227307,"count":6.5,"Level":38},{"lng":121.493993,"lat":31.2149,"count":4.5,"Level":19},{"lng":121.483557,"lat":31.219996,"count":5.5,"Level":8},{"lng":121.485069,"lat":31.239881,"count":4.5,"Level":26},{"lng":121.476315,"lat":31.212105,"count":4.9,"Level":24},{"lng":121.488233,"lat":31.23877,"count":3.8,"Level":23},{"lng":121.488544,"lat":31.237226,"count":4.9,"Level":20},{"lng":121.47765,"lat":31.210476,"count":8.5,"Level":46},{"lng":121.489016,"lat":31.23711,"count":4.2,"Level":30},{"lng":121.484236,"lat":31.240028,"count":6.5,"Level":11},{"lng":121.478144,"lat":31.211974,"count":4.0,"Level":12},{"lng":121.473384,"lat":31.240013,"count":4.2,"Level":21},{"lng":121.47159,"lat":31.210314,"count":2.7,"Level":8},{"lng":121.49009,"lat":31.239781,"count":3.8,"Level":15},{"lng":121.489653,"lat":31.207874,"count":3.6,"Level":4},{"lng":121.482814,"lat":31.22069,"count":3.0,"Level":4},{"lng":121.486916,"lat":31.213549,"count":16.44,"Level":5},{"lng":121.467597,"lat":31.232926,"count":7.0,"Level":25},{"lng":121.484363,"lat":31.245014,"count":5.0,"Level":33},{"lng":121.472497,"lat":31.246056,"count":3.5,"Level":18},{"lng":121.467307,"lat":31.236547,"count":7.5,"Level":22},{"lng":121.463106,"lat":31.247268,"count":4.5,"Level":24},{"lng":121.484667,"lat":31.242151,"count":5.8,"Level":18},{"lng":121.470949,"lat":31.224659,"count":7.0,"Level":20},{"lng":121.481482,"lat":31.243216,"count":3.3,"Level":20},{"lng":121.463693,"lat":31.218374,"count":3.2,"Level":18},{"lng":121.481787,"lat":31.241703,"count":5.5,"Level":22},{"lng":121.489684,"lat":31.241471,"count":8.0,"Level":29},{"lng":121.479642,"lat":31.245724,"count":3.2,"Level":26},{"lng":121.491644,"lat":31.241695,"count":6.3,"Level":18},{"lng":121.469456,"lat":31.237504,"count":17.1,"Level":25},{"lng":121.431865,"lat":31.197279,"count":3.0,"Level":8},{"lng":121.517606,"lat":31.244435,"count":7.77,"Level":24},{"lng":121.445438,"lat":31.201789,"count":9.0,"Level":36},{"lng":121.458958,"lat":31.252315,"count":6.3,"Level":29},{"lng":121.535661,"lat":31.246257,"count":4.5,"Level":29},{"lng":121.42687,"lat":31.241039,"count":4.44,"Level":28},{"lng":121.422995,"lat":31.24645,"count":3.4,"Level":31},{"lng":121.520756,"lat":31.244273,"count":6.0,"Level":28},{"lng":121.452146,"lat":31.20182,"count":5.0,"Level":24},{"lng":121.448183,"lat":31.201264,"count":5.5,"Level":19},{"lng":121.538289,"lat":31.228403,"count":7.0,"Level":25},{"lng":121.535781,"lat":31.227978,"count":5.71,"Level":26},{"lng":121.532655,"lat":31.232124,"count":6.5,"Level":28},{"lng":121.463656,"lat":31.250016,"count":6.41,"Level":32},{"lng":121.477908,"lat":31.207511,"count":4.11,"Level":28},{"lng":121.456291,"lat":31.252153,"count":4.0,"Level":27},{"lng":121.440567,"lat":31.207704,"count":5.5,"Level":28},{"lng":121.536827,"lat":31.229638,"count":5.3,"Level":20},{"lng":121.455034,"lat":31.233729,"count":4.7,"Level":25},{"lng":121.530708,"lat":31.234779,"count":6.5,"Level":25},{"lng":121.470812,"lat":31.205619,"count":3.35,"Level":28},{"lng":121.407503,"lat":31.176496,"count":4.5,"Level":21},{"lng":121.426714,"lat":31.198793,"count":2.25,"Level":22},{"lng":121.45057,"lat":31.249915,"count":6.0,"Level":24},{"lng":121.426917,"lat":31.247438,"count":3.52,"Level":34},{"lng":121.435431,"lat":31.239897,"count":2.84,"Level":26},{"lng":121.526118,"lat":31.233544,"count":7.0,"Level":26},{"lng":121.438917,"lat":31.221424,"count":4.5,"Level":21},{"lng":121.474987,"lat":31.250108,"count":3.5,"Level":28},{"lng":121.441451,"lat":31.204306,"count":4.2,"Level":24},{"lng":121.477118,"lat":31.270543,"count":3.0,"Level":26},{"lng":121.426193,"lat":31.194221,"count":4.5,"Level":20},{"lng":121.541672,"lat":31.228704,"count":4.5,"Level":15},{"lng":121.441038,"lat":31.243671,"count":3.8,"Level":28},{"lng":121.494785,"lat":31.256923,"count":4.8,"Level":23},{"lng":121.498239,"lat":31.250162,"count":4.3,"Level":32},{"lng":121.519703,"lat":31.265906,"count":6.2,"Level":23},{"lng":121.534769,"lat":31.217108,"count":3.0,"Level":28},{"lng":121.440391,"lat":31.176597,"count":3.21,"Level":12},{"lng":121.43906,"lat":31.191812,"count":5.13,"Level":21},{"lng":121.537672,"lat":31.230055,"count":7.0,"Level":30},{"lng":121.458293,"lat":31.25328,"count":2.92,"Level":26},{"lng":121.525282,"lat":31.236315,"count":5.5,"Level":30},{"lng":121.417972,"lat":31.24002,"count":4.7,"Level":18},{"lng":121.544247,"lat":31.243795,"count":3.53,"Level":12},{"lng":121.439302,"lat":31.25761,"count":4.9,"Level":25},{"lng":121.498094,"lat":31.237789,"count":6.5,"Level":4},{"lng":121.50209,"lat":31.233197,"count":7.0,"Level":15},{"lng":121.487757,"lat":31.235296,"count":4.7,"Level":5},{"lng":121.485882,"lat":31.230418,"count":10.5,"Level":30},{"lng":121.48513,"lat":31.23515,"count":7.5,"Level":36},{"lng":121.494403,"lat":31.243416,"count":4.0,"Level":15},{"lng":121.484225,"lat":31.240398,"count":7.5,"Level":14},{"lng":121.479392,"lat":31.243,"count":6.5,"Level":18},{"lng":121.469877,"lat":31.236439,"count":8.2,"Level":31},{"lng":121.468109,"lat":31.232857,"count":7.0,"Level":23},{"lng":121.494133,"lat":31.240661,"count":4.46,"Level":13},{"lng":121.478085,"lat":31.245037,"count":5.2,"Level":10},{"lng":121.465798,"lat":31.223578,"count":6.8,"Level":25},{"lng":121.480267,"lat":31.241587,"count":4.8,"Level":9},{"lng":121.466516,"lat":31.236168,"count":6.3,"Level":20},{"lng":121.468772,"lat":31.232841,"count":6.8,"Level":20},{"lng":121.465914,"lat":31.236663,"count":6.0,"Level":18},{"lng":121.496409,"lat":31.243826,"count":5.0,"Level":6},{"lng":121.495289,"lat":31.24273,"count":4.8,"Level":15},{"lng":121.476689,"lat":31.24195,"count":4.0,"Level":15},{"lng":121.495888,"lat":31.243169,"count":3.2,"Level":5},{"lng":121.467296,"lat":31.237172,"count":5.5,"Level":19},{"lng":121.495004,"lat":31.241826,"count":12.0,"Level":19},{"lng":121.47304,"lat":31.24574,"count":4.5,"Level":12},{"lng":121.510369,"lat":31.227662,"count":6.0,"Level":13},{"lng":121.427061,"lat":31.214468,"count":5.6,"Level":20},{"lng":121.425255,"lat":31.246982,"count":3.8,"Level":17},{"lng":121.539272,"lat":31.220853,"count":5.1,"Level":12},{"lng":121.454181,"lat":31.204368,"count":5.0,"Level":30},{"lng":121.413034,"lat":31.212831,"count":6.0,"Level":22},{"lng":121.433466,"lat":31.236964,"count":4.15,"Level":26},{"lng":121.502434,"lat":31.252246,"count":8.5,"Level":27},{"lng":121.450777,"lat":31.231853,"count":6.0,"Level":30},{"lng":121.438624,"lat":31.198368,"count":5.0,"Level":28},{"lng":121.526593,"lat":31.246897,"count":6.5,"Level":30},{"lng":121.438305,"lat":31.25524,"count":3.0,"Level":28},{"lng":121.458553,"lat":31.241742,"count":4.1,"Level":24},{"lng":121.491569,"lat":31.252532,"count":4.1,"Level":28},{"lng":121.43422,"lat":31.20097,"count":5.0,"Level":12},{"lng":121.419084,"lat":31.19175,"count":3.8,"Level":21},{"lng":121.528448,"lat":31.234293,"count":5.2,"Level":27},{"lng":121.452345,"lat":31.187456,"count":3.65,"Level":18},{"lng":121.491876,"lat":31.257525,"count":6.6,"Level":17},{"lng":121.413626,"lat":31.184544,"count":3.5,"Level":17},{"lng":121.447909,"lat":31.183363,"count":3.2,"Level":22},{"lng":121.465384,"lat":31.211341,"count":3.5,"Level":23},{"lng":121.539583,"lat":31.24848,"count":2.68,"Level":25},{"lng":121.525499,"lat":31.248896,"count":4.0,"Level":38},{"lng":121.438944,"lat":31.255595,"count":3.1,"Level":32},{"lng":121.445063,"lat":31.221347,"count":4.5,"Level":18},{"lng":121.432171,"lat":31.216066,"count":4.1,"Level":24},{"lng":121.442748,"lat":31.193271,"count":3.0,"Level":14},{"lng":121.420485,"lat":31.250648,"count":2.9,"Level":26},{"lng":121.522183,"lat":31.256799,"count":5.3,"Level":28},{"lng":121.525989,"lat":31.234432,"count":5.5,"Level":16},{"lng":121.510882,"lat":31.29237,"count":3.7,"Level":17},{"lng":121.523589,"lat":31.235783,"count":5.0,"Level":24},{"lng":121.422193,"lat":31.180003,"count":3.1,"Level":18},{"lng":121.517318,"lat":31.241232,"count":6.6,"Level":41},{"lng":121.45023,"lat":31.226079,"count":4.3,"Level":26},{"lng":121.548641,"lat":31.245192,"count":5.2,"Level":18},{"lng":121.461082,"lat":31.236925,"count":3.6,"Level":28},{"lng":121.427993,"lat":31.238314,"count":3.92,"Level":31},{"lng":121.44613,"lat":31.284917,"count":5.0,"Level":16},{"lng":121.449442,"lat":31.262317,"count":6.0,"Level":18},{"lng":121.508614,"lat":31.292408,"count":3.8,"Level":24},{"lng":121.530001,"lat":31.233281,"count":6.0,"Level":46},{"lng":121.461979,"lat":31.251906,"count":3.3,"Level":22},{"lng":121.436082,"lat":31.218814,"count":3.04,"Level":32},{"lng":121.538948,"lat":31.266314,"count":2.09,"Level":17},{"lng":121.436649,"lat":31.217232,"count":9.2,"Level":58},{"lng":121.527692,"lat":31.292609,"count":3.5,"Level":16},{"lng":121.43999,"lat":31.257826,"count":5.0,"Level":28},{"lng":121.435868,"lat":31.22963,"count":4.5,"Level":20},{"lng":121.492447,"lat":31.243432,"count":4.5,"Level":21},{"lng":121.494453,"lat":31.24293,"count":4.2,"Level":6},{"lng":121.49067,"lat":31.244675,"count":6.0,"Level":8},{"lng":121.491736,"lat":31.241471,"count":4.5,"Level":7},{"lng":121.469683,"lat":31.225021,"count":4.5,"Level":7},{"lng":121.475141,"lat":31.244474,"count":3.0,"Level":8},{"lng":121.482735,"lat":31.248418,"count":5.0,"Level":21},{"lng":121.45294,"lat":31.204734,"count":4.4,"Level":12},{"lng":121.479714,"lat":31.203611,"count":3.45,"Level":22},{"lng":121.466367,"lat":31.210499,"count":6.0,"Level":6},{"lng":121.477019,"lat":31.209171,"count":4.0,"Level":26},{"lng":121.462298,"lat":31.205897,"count":3.0,"Level":19},{"lng":121.47161,"lat":31.205781,"count":4.17,"Level":22},{"lng":121.478799,"lat":31.203557,"count":2.5,"Level":5},{"lng":121.4671,"lat":31.209827,"count":4.0,"Level":7},{"lng":121.4599,"lat":31.207534,"count":4.6,"Level":26},{"lng":121.463876,"lat":31.208654,"count":5.2,"Level":18},{"lng":121.471081,"lat":31.209148,"count":4.3,"Level":22},{"lng":121.467743,"lat":31.208646,"count":5.5,"Level":24},{"lng":121.507912,"lat":31.242259,"count":12.0,"Level":64},{"lng":121.410421,"lat":31.169907,"count":5.2,"Level":38},{"lng":121.470279,"lat":31.237871,"count":7.2,"Level":10},{"lng":121.49218,"lat":31.24344,"count":5.5,"Level":6},{"lng":121.457574,"lat":31.215687,"count":6.4,"Level":9},{"lng":121.468733,"lat":31.216436,"count":4.81,"Level":8},{"lng":121.416864,"lat":31.248835,"count":4.0,"Level":4},{"lng":121.47724,"lat":31.207534,"count":3.73,"Level":7},{"lng":121.477366,"lat":31.198144,"count":5.52,"Level":19},{"lng":121.478673,"lat":31.208746,"count":4.5,"Level":6},{"lng":121.466396,"lat":31.208399,"count":4.5,"Level":12},{"lng":121.476905,"lat":31.199766,"count":5.2,"Level":14},{"lng":121.537573,"lat":31.228148,"count":6.9,"Level":30},{"lng":121.43013,"lat":31.21798,"count":3.4,"Level":11},{"lng":121.414969,"lat":31.182745,"count":3.0,"Level":12},{"lng":121.51177,"lat":31.256167,"count":2.8,"Level":28},{"lng":121.512897,"lat":31.25683,"count":7.89,"Level":17},{"lng":121.452643,"lat":31.289708,"count":2.9,"Level":6},{"lng":121.538598,"lat":31.23058,"count":7.0,"Level":10},{"lng":121.517732,"lat":31.262186,"count":3.8,"Level":28},{"lng":121.502192,"lat":31.17655,"count":3.0,"Level":24},{"lng":121.409116,"lat":31.173553,"count":3.7,"Level":6},{"lng":121.408997,"lat":31.211256,"count":4.9,"Level":16},{"lng":121.422187,"lat":31.249946,"count":4.0,"Level":31},{"lng":121.541789,"lat":31.271531,"count":3.0,"Level":30},{"lng":121.43699,"lat":31.193796,"count":6.3,"Level":22},{"lng":121.430348,"lat":31.216645,"count":3.95,"Level":24},{"lng":121.432216,"lat":31.188892,"count":3.0,"Level":11},{"lng":121.526794,"lat":31.239874,"count":3.2,"Level":8},{"lng":121.516769,"lat":31.229939,"count":5.5,"Level":15},{"lng":121.544039,"lat":31.270937,"count":4.97,"Level":32},{"lng":121.455856,"lat":31.218289,"count":5.0,"Level":24},{"lng":121.459139,"lat":31.287186,"count":2.39,"Level":14},{"lng":121.45549,"lat":31.205858,"count":5.6,"Level":9},{"lng":121.447976,"lat":31.234277,"count":3.9,"Level":21},{"lng":121.52571,"lat":31.234517,"count":4.5,"Level":9},{"lng":121.449008,"lat":31.175345,"count":4.2,"Level":14},{"lng":121.45214,"lat":31.205804,"count":3.8,"Level":14},{"lng":121.44818,"lat":31.199395,"count":4.6,"Level":18},{"lng":121.409445,"lat":31.177933,"count":4.2,"Level":22},{"lng":121.432446,"lat":31.190051,"count":3.81,"Level":15},{"lng":121.434653,"lat":31.238268,"count":2.8,"Level":22},{"lng":121.496205,"lat":31.271299,"count":3.5,"Level":25},{"lng":121.446476,"lat":31.186081,"count":9.86,"Level":22},{"lng":121.431244,"lat":31.232919,"count":4.1,"Level":12},{"lng":121.43677,"lat":31.253519,"count":2.5,"Level":24},{"lng":121.434345,"lat":31.217,"count":3.5,"Level":6},{"lng":121.476857,"lat":31.207634,"count":4.7,"Level":6},{"lng":121.461606,"lat":31.208044,"count":4.5,"Level":24},{"lng":121.444249,"lat":31.192738,"count":15.12,"Level":14},{"lng":121.52904,"lat":31.272642,"count":4.5,"Level":21},{"lng":121.449225,"lat":31.228449,"count":4.4,"Level":10},{"lng":121.515144,"lat":31.277295,"count":3.5,"Level":12},{"lng":121.47674,"lat":31.256807,"count":3.5,"Level":26},{"lng":121.511672,"lat":31.292061,"count":4.0,"Level":15},{"lng":121.53888,"lat":31.286507,"count":2.67,"Level":24},{"lng":121.500861,"lat":31.2921,"count":3.4,"Level":14},{"lng":121.490303,"lat":31.260812,"count":5.5,"Level":8},{"lng":121.449826,"lat":31.231143,"count":5.5,"Level":21},{"lng":121.438168,"lat":31.19626,"count":3.3,"Level":4},{"lng":121.428872,"lat":31.238739,"count":4.0,"Level":24},{"lng":121.512688,"lat":31.266847,"count":2.8,"Level":5},{"lng":121.505722,"lat":31.277989,"count":3.0,"Level":24},{"lng":121.449668,"lat":31.193055,"count":4.5,"Level":9},{"lng":121.465273,"lat":31.270883,"count":3.2,"Level":22},{"lng":121.488607,"lat":31.291953,"count":2.0,"Level":12},{"lng":121.496228,"lat":31.268136,"count":3.2,"Level":25},{"lng":121.49769,"lat":31.269363,"count":3.8,"Level":24},{"lng":121.542696,"lat":31.248665,"count":3.5,"Level":28},{"lng":121.423848,"lat":31.209155,"count":5.3,"Level":6},{"lng":121.493702,"lat":31.256444,"count":4.1,"Level":16},{"lng":121.498163,"lat":31.277796,"count":3.5,"Level":16},{"lng":121.515313,"lat":31.257008,"count":6.5,"Level":30},{"lng":121.443867,"lat":31.244713,"count":6.0,"Level":25},{"lng":121.453311,"lat":31.23305,"count":3.58,"Level":27},{"lng":121.414282,"lat":31.17845,"count":3.0,"Level":6},{"lng":121.494055,"lat":31.28933,"count":3.5,"Level":7},{"lng":121.426342,"lat":31.214151,"count":3.8,"Level":6},{"lng":121.55116,"lat":31.211804,"count":3.5,"Level":24},{"lng":121.418014,"lat":31.169513,"count":4.08,"Level":25},{"lng":121.420647,"lat":31.192762,"count":4.0,"Level":6},{"lng":121.497419,"lat":31.26937,"count":2.7,"Level":26},{"lng":121.48697,"lat":31.292779,"count":2.5,"Level":4},{"lng":121.465554,"lat":31.261684,"count":4.5,"Level":17},{"lng":121.496946,"lat":31.251034,"count":7.0,"Level":20},{"lng":121.444066,"lat":31.239503,"count":3.4,"Level":20},{"lng":121.503703,"lat":31.276145,"count":3.2,"Level":25},{"lng":121.451881,"lat":31.197133,"count":4.5,"Level":18},{"lng":121.440183,"lat":31.218521,"count":4.5,"Level":6},{"lng":121.487397,"lat":31.28035,"count":3.75,"Level":16},{"lng":121.49715,"lat":31.268552,"count":4.0,"Level":24},{"lng":121.456663,"lat":31.236307,"count":3.2,"Level":6},{"lng":121.449247,"lat":31.240283,"count":3.8,"Level":29},{"lng":121.442904,"lat":31.24726,"count":3.29,"Level":20},{"lng":121.509342,"lat":31.255611,"count":4.0,"Level":18},{"lng":121.445822,"lat":31.246921,"count":4.0,"Level":24}];

    if(!isSupportCanvas()){
    	alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
	//详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
	//参数说明如下:
	/* visible 热力图是否显示,默认为true
     * opacity 热力的透明度,1-100
     * radius 势力图的每个点的半径大小
     * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
     *	{
			.2:'rgb(0, 255, 255)',
			.5:'rgb(0, 110, 255)',
			.8:'rgb(100, 0, 255)'
		}
		其中 key 表示插值的位置, 0~1.
		    value 为颜色值.
     */
	heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20});
	map.addOverlay(heatmapOverlay);
	heatmapOverlay.setDataSet({data:points,max:15});
	//是否显示热力图
    function openHeatmap(){
        heatmapOverlay.show();
    }
	function closeHeatmap(){
        heatmapOverlay.hide();
    }
	closeHeatmap();
    function setGradient(){
     	/*格式如下所示:
		{
	  		0:'rgb(102, 255, 0)',
	 	 	.5:'rgb(255, 170, 0)',
		  	1:'rgb(255, 0, 0)'
		}*/
     	var gradient = {};
     	var colors = document.querySelectorAll("input[type='color']");
     	colors = [].slice.call(colors,0);
     	colors.forEach(function(ele){
			gradient[ele.getAttribute("data-key")] = ele.value;
     	});
        heatmapOverlay.setOptions({"gradient":gradient});
    }
	//判断浏览区是否支持canvas
    function isSupportCanvas(){
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
</script>