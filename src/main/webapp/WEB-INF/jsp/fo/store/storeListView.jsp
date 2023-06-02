<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">


<style>
html, body{
    height: 100%;
    width: 100%;
}

#map {
    height: 100%;
    width: 100%;
    z-index: 0;
}
.sidebar {
    height: 100%;
    width: 450px;
    position: fixed;
    z-index: 1;
    top: 0;
    left: -480px;
    background-color: #fff;
    transition: 0.5s;
}

form{
    padding: 32px; height: 30%;
}

form>div{
    font-size: 40px
}
.header {
    margin-bottom: 20px;
}

.dropdown button {
    height: 50px;
    border-radius: 30px;
    margin: 5px;
    width: 98%;
    margin-right: 20px;
}

.dropdownCate input{
    margin: 5px;
    height: 50px;
    border-radius: 30px;
    width: 116px;
    background-color: black;
    border: 1px solid black;
}

hr{
    margin: 0px;
}

#searchResult{
    padding: 15px 32px;
}

.searchList{
    padding: 17px 32px;
    border-bottom: 1px solid #ddd;
}

.storeTitle{
    font-size: 25px;
    font-weight: bold;
}
.storeInfo{
    font-size: 15px;
    color: #888;
}
.searchList:hover{
    cursor: pointer;
    background-color: #ddd;
}
.openbtn {
    font-size: 20px;
    cursor: pointer;
    background-color: #111;
    color: white;
    padding: 10px 15px;
    border: none;
    position: fixed;
    left: 0;
    transition: .5s;
    border-radius: 0 15px 15px 0;
    top: 210px;
    height: 80px;
}

.openbtn:hover {
  background-color: #444;
}

#sideBtn {
    transition: margin-left .5s;
    
}
 .wrap {position: absolute;left: 0;bottom: 40px;width: 288px;height: 132px;margin-left: -144px;text-align: left;overflow: hidden;font-size: 12px;font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;line-height: 1.5;}
    .wrap * {padding: 0;margin: 0;}
    .wrap .info {width: 286px;height: 120px;border-radius: 5px;border-bottom: 2px solid #ccc;border-right: 1px solid #ccc;overflow: hidden;background: #fff;}
    .wrap .info:nth-child(1) {border: 0;box-shadow: 0px 1px 2px #888;}
    .info .title {padding: 5px 0 0 10px;height: 30px;background: #eee;border-bottom: 1px solid #ddd;font-size: 18px;font-weight: bold;}
    .info .close {position: absolute;top: 10px;right: 10px;color: #888;width: 17px;height: 17px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/overlay_close.png');}
    .info .close:hover {cursor: pointer;}
    .info .body {position: relative;overflow: hidden;}
    .info .desc {position: relative;margin: 13px 0 0 90px;height: 75px;}
    .desc .ellipsis {overflow: hidden;text-overflow: ellipsis;white-space: nowrap;}
    .desc .jibun {font-size: 11px;color: #888;margin-top: -2px;}
    .info .img {position: absolute;top: 6px;left: 5px;width: 73px;height: 71px;border: 1px solid #ddd;color: #888;overflow: hidden;}
    .info:after {content: '';position: absolute;margin-left: -12px;left: 50%;bottom: 0;width: 22px;height: 12px;background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
    .info .link {color: #5085BB;}

</style>
</head>
<body>
    <!-- 지도부분 -->
    <div id="map"></div>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4ce7a8706f16f48bba913a5def2af6a"></script>
    <script>
        var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
            mapOption = { 
                center: new kakao.maps.LatLng(37.7640377730442, 126.771117387211),
                level: 3
            };
        var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
        
        // 마커를 표시할 위치와 title 객체 배열입니다 
        var positions = [
            <c:forEach var="s" items="${ list }">
                {
                    title: '${s.storeName}',
                    latlng: new kakao.maps.LatLng(${s.storeLat}, ${s.storeLon}),
                    address : '${s.storeAddress}',
                    businessHours : '${s.businessHours}',
                    jibunAddress : '${s.jibunAddress}'
                },
            </c:forEach>
        ];

    // 마커 이미지의 이미지 주소입니다
    var imageSrc = "https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/markerStar.png"; 
    
    var markers = []; // 지도에 표시된 마커 객체를 가지고 있을 배열입니다
    var contents = [];
    var overlays = [];


    
    for(let i=0; i < positions.length; i++){
        var data = positions[i];
        displayMarker(data);
    }

    // 지도에 마커를 표시하는 함수입니다    
    function displayMarker(data) { 
        var marker = new kakao.maps.Marker({
            map: map,
            position: data.latlng
        });
        var overlay = new kakao.maps.CustomOverlay({
            yAnchor: 3,
            position: marker.getPosition()
        });
        
        var contentDiv = document.createElement('div');
        contentDiv.className = 'wrap';

        var infoDiv = document.createElement('div');
        infoDiv.className = 'info';

        var titleDiv = document.createElement('div');
        titleDiv.className = 'title';
        titleDiv.innerHTML = data.title;

        var closeBtn = document.createElement('div');
        closeBtn.innerHTML = '닫기';
        closeBtn.style.position = 'absolute';  // 닫기 버튼 위치 설정
        closeBtn.style.top = '5px';           // 상단으로부터 10px 떨어뜨림
        closeBtn.style.right = '10px';  
        closeBtn.style.border = '1px solid #999';
        closeBtn.style.backgroundColor = '#fff';
        closeBtn.style.cursor = 'pointer';
        closeBtn.style.fontSize = '15px';
        closeBtn.style.color = '#888';
        closeBtn.style.height = '19px';
        

        closeBtn.onclick = function () {
            overlay.setMap(null);
        };
        titleDiv.appendChild(closeBtn);

        var bodyDiv = document.createElement('div');
        bodyDiv.className = 'body';

        var imgDiv = document.createElement('div');
        imgDiv.className = 'img';
        imgDiv.innerHTML = '<img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">';
        bodyDiv.appendChild(imgDiv);

        var descDiv = document.createElement('div');
        descDiv.className = 'desc';

        var ellipsisDiv = document.createElement('div');
        ellipsisDiv.className = 'ellipsis';
        ellipsisDiv.innerHTML = data.address;
        descDiv.appendChild(ellipsisDiv);

        var jibunDiv = document.createElement('div');
        jibunDiv.className = 'jibun ellipsis';
        jibunDiv.innerHTML = '(지번) ' + data.jibunAddress;
        descDiv.appendChild(jibunDiv);

        var businessHoursDiv = document.createElement('div');
        businessHoursDiv.className = 'businessHours';
        businessHoursDiv.innerHTML = data.businessHours;
        descDiv.appendChild(businessHoursDiv);

        var linkDiv = document.createElement('div');
        linkDiv.innerHTML = '<a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a>';
        descDiv.appendChild(linkDiv);

        bodyDiv.appendChild(descDiv);

        infoDiv.appendChild(titleDiv);
        infoDiv.appendChild(closeBtn);
        infoDiv.appendChild(bodyDiv);

        contentDiv.appendChild(infoDiv);

        overlay.setContent(contentDiv);

        kakao.maps.event.addListener(marker, 'click', function() {
            overlay.setMap(map);
        });
    }

    window.onload = function() {
        // 'searchList' 클래스를 가진 모든 div 요소를 가져옵니다.
        var divs = document.querySelectorAll('.searchList');

        // 각 div 요소에 대하여
        for (var i = 0; i < divs.length; i++) {
            var div = divs[i];

            // 클릭 이벤트 리스너를 설정합니다.
            div.addEventListener('click', function(event) {
                // 클릭된 div 요소의 'StoreLat' 및 'StoreLon' 값을 가져옵니다.
                var lat = parseFloat(event.target.getAttribute('data-storelat'));
                var lon = parseFloat(event.target.getAttribute('data-storelon'));

                // 지도의 중심을 해당 위도, 경도로 변경합니다.
                var coords = new kakao.maps.LatLng(lat, lon);
                map.setCenter(coords);
            });
        }
    };

    function openNav() {
    document.getElementById("mySidebar").style.left = "0";
    document.getElementById("sideBtn").style.marginLeft = "450px";
    document.getElementById("sidebarButton").style.left = "450px";
    document.getElementById("sidebarButton").innerHTML = "&lt;";
    }

    function closeNav() {
    document.getElementById("mySidebar").style.left = "-450px";
    document.getElementById("sideBtn").style.marginLeft= "0";
    document.getElementById("sidebarButton").style.left = "0";
    document.getElementById("sidebarButton").innerHTML = "&gt;";
    }

    function toggleNav() {
        if (document.getElementById("mySidebar").style.left == "0px") {
            closeNav();
        } else {
            openNav();
        }
    }
    </script>
    <!-- 사이드바 -->
    <div id="mySidebar" class="sidebar">
        <form action="" >
            <div class="header">
                <span>친환경 매장찾기</span>
            </div>
            <div>
                <div class="dropdown dropdownCate">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        지역 검색
                    </button>
                    <ul class="dropdown-menu" style="width: 100%;">
                        <li><a class="dropdown-item" href="#">지역 검색</a></li>
                        <li><a class="dropdown-item" href="#">주소/매장명 검색</a></li>
                    </ul>
                </div>
            </div>

            <div style="display: flex;">

                <div class="dropdown citySearch">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        시/도 선택
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">서울특별시</a></li>
                        <li><a class="dropdown-item" href="#">인천광역시</a></li>
                    </ul>
                </div>

                <div class="dropdown regionSearch">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        구/군 선택
                    </button>
                    <ul class="dropdown-menu">
                        <li><a class="dropdown-item" href="#">동작구</a></li>
                        <li><a class="dropdown-item" href="#">관악구</a></li>
                    </ul>
                </div>

                <div class="dropdown dropdownCate">
                    <input class="btn btn-primary" type="submit" value="검색">
                </div>

            </div>
        </form>

        <div style="overflow-y: scroll; position:relative; height: 70%;">
            <hr>
            <div id="searchResult">
                <span>총 </span>
                <span> ${ pi.listCount }개의 결과</span>
            </div>
            <hr>
            <c:forEach var="s" items="${ list }">
                <div class="searchList" data-storelat="${ s.storeLat }" data-storelon="${ s.storeLon }">
                    <span class="storeTitle">${ s.storeName }</span> <br>
                    <span class="storeInfo">${ s.storeAddress }</span> <br>
                    <span class="storeInfo">${ s.storePhone }</span> <br>
                    <span class="storeInfo">영업시간 ${ s.businessHours }</span>
                    <i class="xi-heart xi-2x" style="width: 20px;"></i>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 사이드바 버튼 -->
    <div id="sideBtn" >
        <button id="sidebarButton" class="openbtn" onclick="toggleNav()">&gt;</button>  
    </div>
</body>
</html>