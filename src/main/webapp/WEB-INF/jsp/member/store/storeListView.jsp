<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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

.searchSelect{
    width: 100%;
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
    padding: 32px;
    border-bottom: 1px solid #ddd;
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
        var container = document.getElementById('map');
        var options = {
            center: new kakao.maps.LatLng(37.533951, 126.896989),
            level: 4
        };
        var map = new kakao.maps.Map(container, options);
        var markerPosition  = new kakao.maps.LatLng(37.533951, 126.896989); 
        var marker = new kakao.maps.Marker({
            position: markerPosition
        });
        marker.setMap(map);

    </script>
    <!-- 사이드바 -->
    <div id="mySidebar" class="sidebar">
        <form action="" >
            <div class="header">
                <span>친환경 매장찾기</span>
            </div>
            <div>
                <div class="dropdown dropdownCate">
                    <button class="btn btn-secondary searchSelect" type="button" data-bs-toggle="dropdown" aria-expanded="false">
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
                <span> 1,677개의 결과</span>
            </div>
            <hr>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동)</h4>
                <h5>02-3317-2240</h5>
            </div>
            <div class="searchList">
                <h3>(주)봉구통상</h3>
                <h4>서울특별시 마포구 큰우물로 10(대흥동) 마지막이요</h4>
                <h5>02-3317-2240</h5>
                <div>
                    
                </div>
            </div>
            
        </div>
    </div>

    <!-- 사이드바 버튼 -->
    <div id="sideBtn" >
        <button id="sidebarButton" class="openbtn" onclick="toggleNav()">&gt;</button>  
    </div>
    
    <script>
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
    var content = '<div class="wrap">' + 
    '    <div class="info">' + 
    '        <div class="title">' + 
    '            카카오 스페이스닷원' + 
    '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
    '        </div>' + 
    '        <div class="body">' + 
    '            <div class="img">' +
    '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
    '           </div>' + 
    '            <div class="desc">' + 
    '                <div class="ellipsis">제주특별자치도 제주시 첨단로 242</div>' + 
    '                <div class="jibun ellipsis">(우) 63309 (지번) 영평동 2181</div>' + 
    '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
    '            </div>' + 
    '        </div>' + 
    '    </div>' +    
    '</div>';

//마커 위에 커스텀오버레이를 표시합니다
//마커를 중심으로 커스텀 오버레이를 표시하기위해 CSS를 이용해 위치를 설정했습니다
var overlay = new kakao.maps.CustomOverlay({
content: content,
map: map,
position: marker.getPosition()       
});

//마커를 클릭했을 때 커스텀 오버레이를 표시합니다
kakao.maps.event.addListener(marker, 'click', function() {
overlay.setMap(map);
});

//커스텀 오버레이를 닫기 위해 호출되는 함수입니다 
function closeOverlay() {
overlay.setMap(null);     
}
    </script>
</body>
</html>