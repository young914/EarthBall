<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=d4ce7a8706f16f48bba913a5def2af6a"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
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

.dropdown-menu{
    border-radius: 10px;
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

    .pagination {
        display: flex;
        list-style-type: none;
        padding-top: 7px;
    }

    .pagination li {
        margin-right: 5px;
    }

    .pagination li a {
        display: inline-block;
        padding: 5px 10px;
        background-color: #f1f1f1;
        color: #333;
        text-decoration: none;
    }

    .pagination li a.active {
        background-color: #333;
        color: #fff;
    }
    .pagination li a:hover {
        background-color: #333;
        color: #fff;
    }

    .pageN {
        display: grid;
        justify-content: center;
    }
</style>
</head>
<body>
    <!-- 지도부분 -->
    <div id="map"></div>
 
    <!-- 사이드바 -->
    <div id="mySidebar" class="sidebar">
        <form action="">
            <div class="header">
                <span>친환경 매장찾기</span>
            </div>
            <div>
                <div class="dropdown dropdownCate">
                    <button class="btn btn-secondary dropdown-toggle" type="button" data-bs-toggle="dropdown" aria-expanded="false">
                        지역 검색
                    </button>
                    <ul class="dropdown-menu" style="width: 100%; border-radius: 10px;">
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

        <div style="overflow-y: scroll; position:relative; height: 65%;">
            <hr>
            <div id="searchResult">
                
            </div>
            <hr>
            <div id="store-list-area">
            </div>
        </div>
        <div class="pageN">
            <ul class="pagination">
                <li><a href="#" onclick="goToPage(1)">&lt;&lt;</a></li>
                <li><a href="#" onclick="goToPage(currentPage - 1)">&lt;</a></li>
                <li><a href="#" onclick="goToPage(1)">1</a></li>
                <li><a href="#" onclick="goToPage(2)">2</a></li>
                <li><a href="#" onclick="goToPage(3)">3</a></li>
                <li><a href="#" onclick="goToPage(4)">4</a></li>
                <li><a href="#" onclick="goToPage(5)">5</a></li>
                <li><a href="#" onclick="goToPage(currentPage + 1)">&gt;</a></li>
                <li><a href="#" onclick="goToPage(totalPages)">&gt;&gt;</a></li>
            </ul>
        </div>
    </div>

    <!-- 사이드바 버튼 -->
    <div id="sideBtn" >
        <button id="sidebarButton" class="openbtn" onclick="toggleNav();">&gt;</button>  
    </div>

    <script>

        let storeList = []; // [{}, {}, ..]
        let markerList = []; // 각 매장에 대한 마커들 담기
        let overlayList = []; // 각 매장에 대한 오버레이들 담기

        // 1. 모든 요소들이 화면에 다 로딩된 후 로직 시작
        $(function() {

            // 2. 지도 셋팅하기 & 데이터 불러오기
            settingMap();
        });

        function settingMap() {
            
            // 2_1. 지도 셋팅 완료
            var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
                mapOption = { 
                    center: new kakao.maps.LatLng(37.516232759035965, 126.97701521248901),
                    level: 8
                };
            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

            // 2_2. ajax 로 전체 매장 조회해오기
            $.ajax({
                url : "getStores.st",
                type : "get",
                success : function(result) {

                    // return 값 다 담기
                    storeList = result;
                    
                    // 2_3. 조회해온 매장 수를 storeCount에 담기
                    storeCount = storeList.length;
                    let storeCountStr = "<span>총 </span>" + storeCount + "<span>개의 결과</span>";
                    $("#searchResult").html(storeCountStr);
                    // 2_3_2. 조회해온 매장 데이터를 storeList에 담기
                    let resultStr = "";
                    for(let i = 0; i < storeList.length; i++) {

                        // 동적으로 리스트 요소 생성
                        resultStr += "<div class='searchList " + i + "' data-storelat='" + storeList[i].storeLat + "' data-storelon='" + storeList[i].storeLon + "'>"
                                  +    "<span class='storeTitle'>" + storeList[i].storeName + "</span> <br>"
                                  +    "<span class='storeInfo'>" + storeList[i].storeAddress + "</span> <br>"
                                  +    "<span class='storeInfo'>" + storeList[i].storePhone + "</span> <br>"
                                  +    "<span class='storeInfo'>영업시간 " + storeList[i].businessHours + "</span>"
                                  +    "<i class='xi-heart xi-2x' style='width: 20px;'></i>"
                                  + "</div>";
                        
                        // 각 매장에 대한 마커 생성
                        
                        var imageSrc = '/resources/fo/img/shop.png', // 마커이미지의 주소입니다    
                            imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                            imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                            
                        // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                        var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                            markerPosition = new kakao.maps.LatLng(storeList[i].storeLat, storeList[i].storeLon); // 마커가 표시될 위치입니다

                        // 마커를 생성합니다
                        var marker = new kakao.maps.Marker({
                            position: markerPosition, 
                            image: markerImage // 마커이미지 설정 
                        });

                        // 마커가 지도 위에 표시되도록 설정합니다
                        marker.setMap(map);  

                        markerList.push(marker);

                        // 각 매장에 대한 오버레이 생성
                        var content = 
                            '<div class="wrap">' + 
                            '    <div class="info">' + 
                            '        <div class="title">' + storeList[i].storeName + 
                            '            <div class="close" onclick="closeOverlay(' + i + ')" title="닫기"></div>' + 
                            '        </div>' + 
                            '        <div class="body">' + 
                            '            <div class="img">' +
                            '                <img src="https://cfile181.uf.daum.net/image/250649365602043421936D" width="73" height="70">' +
                            '           </div>' + 
                            '            <div class="desc">' + 
                            '                <div class="ellipsis">'+ storeList[i].storeAddress + '</div>' + 
                            '                <div class="jibun ellipsis"> (지번) ' + storeList[i].jibunAddress +'</div>' + 
                            '                <div class="businessHours">'+ storeList[i].businessHours + ' </div>' + 
                            '                <div><a href="https://www.kakaocorp.com/main" target="_blank" class="link">홈페이지</a></div>' + 
                            '            </div>' + 
                            '        </div>' + 
                            '    </div>' +    
                            '</div>';
                            

                        var overlay = new kakao.maps.CustomOverlay({
                            position: marker.getPosition(),
                            content: content
                        });

                        overlayList.push(overlay);

                        // 마커에 클릭이벤트 걸기
                        // 마커에 클릭이벤트를 등록합니다
                        kakao.maps.event.addListener(marker, 'click', clickListener(map, marker, overlay));

                    }

                    markerList.forEach(function(marker, index) {
                        kakao.maps.event.addListener(marker, 'click', function() {
                            // 다른 오버레이 닫기
                            overlayList.forEach(function(item, idx) {
                                if (idx !== index) {
                                    item.setMap(null);
                                    isClosed[idx] = true;
                                }
                            });

                            if (isClosed[index]) { // 닫혀있음
                                overlayList[index].setMap(map);

                            } else { // 열려있음
                                overlayList[index].setMap(null);
                            }

                            // 오버레이가 열려있는 경우에만 closeOverlay 함수 호출
                            if (!isClosed[index]) {
                                closeOverlay(index);
                            }

                            isClosed[index] = !isClosed[index];
                        });
                    });

                    $("#store-list-area").html(resultStr);

                    // 오버레이가 닫혔는지 열렸는지 검사하는 배열
                    let isClosed = [];
                    for(let i = 0; i < storeList.length; i++) {
                        isClosed.push(true);
                    }

                    // 리스트에 클릭 걸기
                    // 리스트에 클릭 걸기
                    $("#store-list-area").on("click", ".searchList", function() {
                        let index = $(this).attr("class").split(" ")[1];

                        if (isClosed[index]) { // 닫혀있음
                            // 다른 창 다 닫기
                            overlayList.forEach(function(item, idx) {
                                item.setMap(null);
                                isClosed[idx] = true;
                            });

                            overlayList[index].setMap(map);

                            var moveLatLon = new kakao.maps.LatLng(storeList[index].storeLat, storeList[index].storeLon);
                            console.log(moveLatLon);
                            map.panTo(moveLatLon);
                        } else { // 열려있음
                            overlayList[index].setMap(null);
                        }

                        isClosed[index] = !isClosed[index];
                    });

                }, 
                error : function() {
                    console.log("ajax 통신 실패!");
                }

            });
        }

        // 마커 클릭이벤트에 대한 이벤트핸들러함수
        function clickListener(map, marker, overlay) {
            return function() {
                overlay.setMap(map);
            };
        }

        // 오버레이 닫는 함수
        function closeOverlay(index) {
            
            if (overlayList[index]) {
                overlayList[index].setMap(null);
            }
        }

        

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

        var currentPage = 1; // 현재 페이지 번호
        var totalPages = 5; // 전체 페이지 수

        function goToPage(page) {
            if (page < 1) {
                page = 1;
            } else if (page > totalPages) {
                page = totalPages;
            }

            currentPage = page;
            console.log('선택한 페이지:', currentPage);
            // 페이지 이동 또는 다른 동작 수행
            // ...
        }
    </script>
</body>
</html>