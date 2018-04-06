<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
    <title>�ͱ� ���ϼ��� ��</title>
    <script src="/wagle/1/mapAPI/docs/js/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="/wagle/1/mapAPI/docs/js/examples-base.js"></script>
    <script type="text/javascript" src="/wagle/1/mapAPI/docs/js/highlight.min.js"></script>
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?clientId=rGDUUxt5TW5mX2jV3HBL&submodules=geocoder"></script>
    <link rel="stylesheet" type="text/css" href="/wagle/1/mapAPI/docs/css/examples-base.css" />
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    
    <script>
        var HOME_PATH = '/wagle/1/mapAPI/docs';
    </script>
</head>
<body>

<!-- @category Overlay/Infowindow -->

<div id="wrap" class="section">
    <div id="map" style="width:700px;height:500px; margin-top: 350px;" class="w3-center w3-display-middle"></div>
    <code id="snippet" class="snippet"></code>
</div>
<script id="code">
var HOME_PATH = window.HOME_PATH || '.';

var wagleN = new naver.maps.LatLng(37.5566276,126.9192912),
    map = new naver.maps.Map('map', {
        center: wagleN.destinationPoint(0, 300),
        zoom: 10,
        zoomControl: true,
        zoomControlOptions: {
            style: naver.maps.ZoomControlStyle.SMALL,
            position: naver.maps.Position.TOP_RIGHT
        },
        
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: wagleN
    });

var contentString = [
        '<div class="iw_inner" style="200px;">',
        '   <p><b>Wagle ���� ����</b><br/>����Ư���� ������ �����źϷ� 21(2��)<br /></p>',
        '</div>'
    ].join('');

var infowindow = new naver.maps.InfoWindow({

    content: contentString,
    maxWidth: 500,
    backgroundColor: "#ffffff",
    borderColor: "#ffd11a",
    borderWidth: 2,
    disableAnchor: true
});

naver.maps.Event.addListener(marker, "click", function(e) {
    if (infowindow.getMap()) {
        infowindow.close();
    } else {
        infowindow.open(map, marker);
    }
});

infowindow.open(map, marker);
</script>

</body>
</html>
