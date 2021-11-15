<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
</head>
<body>
<%@ include file="../template/header.jspf" %>

 <main class="place-loc-page">
        <div class="content-wrap">
            <div class="top-banr-sect">
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">지역별</li>
                    </ol>
                    </ol>
                    <div class="page-header mb40">
                        <h2 class="sect-tit mb30">지역별 추천 PLACE</h2>
                        <p class="sect-desc mb10">오늘은 거기서 보자! 👇</p>
                        <p></p>
                    </div>
                </div>
            </div>
            <!-- // top-banr-sect -->

            <div class="map-warp">
                <div class="map-controll-box">
                    <div class="around-btn">
                        <button>📌 내 주변 보기</button>
                    </div>
                    <div class="option">
                        <div>
                            <form onsubmit="searchPlaces(); return false;">
                                <input type="text" placeholder="주소를 검색하세요" value="강남" id="keyword" size="15"> 
                                <button type="submit">검색 🔎</button> 
                            </form>
                        </div>
                    </div>
                </div>

                <div class="map_wrap">
                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>
                    <div id="menu_wrap">
                        <ul id="placesList"></ul>
                        <div id="pagination"></div>
                    </div>
                </div>
            
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf"></script>
                <script>
                $(function(){
                    var mapContainer = document.getElementById('map'),
                        mapOption = { 
                            center: new kakao.maps.LatLng(37.5642135, 127.0016985),
                            level: 7
                        };
                    var map = new kakao.maps.Map(mapContainer, mapOption);

                    $.get("${jsonPath }/place.json", function(data) {
                        var place = $(data.positions)[0];
                    	var placeIdxArr = Object.keys(place);
                        var listEl = document.getElementById('placesList');
                        
                    	for(var i = 0; i < placeIdxArr.length; i++) {
                    		
                    		// json데이터 변수설정
                    		var plIdx = placeIdxArr[i];
                            var positions = new kakao.maps.LatLng(place[plIdx].lat, place[plIdx].lng);
                            var plName = place[plIdx].name,
                            	plAddr =place[plIdx].addr,
                            	plTel = place[plIdx].tel;
                            
                         	// 마커, 윈포윈도우 출력
                            var marker = new kakao.maps.Marker({
                                map: map,
                                position: positions,
                                image: new kakao.maps.MarkerImage('${imgPath }/pin.png', new kakao.maps.Size(32, 32), {offset: new kakao.maps.Point(32, 32)})
                            });

                            var infowindow = new kakao.maps.InfoWindow({
                                content: '<div style="padding: 10px; font-size: 14px;"><a href="${pageContext.request.contextPath}/place/'+ plIdx +'">'+ plName +'</a></div>',
                                removable: true
                            });
                            
                            
                            // 플레이스 리스트 생성
                            var eleLi = document.createElement('li');
                            	eleLi.classList.add('item');
                            	var tag = '<span class="markerbg marker_1"></span><div class="info"><h5>'
                        			+ plName + '</h5><span>' + plAddr + '</span><span class="tel">' + plTel + '</span></div>';
                            	eleLi.innerHTML = tag;
                        		listEl.append(eleLi);	// append에 tag 직접넣으면 텍스트로 출려되서 우선 이렇게 구현
                            

                            kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow, positions));
                            eleLi.onclick = makeClickListener(map, marker, infowindow, positions);
                    	}
                     
      	
                        });

                        function makeClickListener(map, marker, infowindow, positions) {
                            return function() {
                                infowindow.open(map, marker);
                                map.setCenter(positions);
                            };
                        }
                        
                        
                        // 내 주변 보기 클릭
                        $('.around-btn button').on('click', function(){
                        	if (navigator.geolocation) {
                                navigator.geolocation.getCurrentPosition(function(position) {
                                    
                                	var lat = position.coords.latitude, // 위도
                                    	lon = position.coords.longitude; // 경도
                                    var locPosition = new kakao.maps.LatLng(lat, lon);
                                	
                                    var marker = new kakao.maps.Marker({  
                                        map: map, 
                                        position: locPosition,
                                        image: new kakao.maps.MarkerImage('${imgPath }/me.png', new kakao.maps.Size(64, 64), {offset: new kakao.maps.Point(64, 64)})
                                    }); 
                                    
                                    map.setCenter(locPosition);  
                                });
                            }
                        });
                });
                </script>
            </div>
            <!-- // map-warp -->



        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->

    
<%@ include file="../template/footer.jspf" %>
</body>
</html>