<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/include.jspf" %>
<script>
$(function(){
	// 해시태그 출력
	var tagsArr = new Array();
	$.each($('.hidden-tags'), function(idx, ele){
		tagsArr[idx] = $(this).text();
	});
	$('.hidden-tags').hide();
	
	const hashArr = new Array();
	tagsArr.forEach(function(ele, idx){
		hashArr[idx] = ele.split(';');
		
		hashArr[idx].forEach(function(ele2, idx2){
			$('.top20-place-sect .list-item').eq(idx).find('p.tags').append('<span>#' + ele2 + '</span>');
		});
	});
	
	// 슬라이드
    var magazineSlider = new Swiper(".magazine-slider", {
	     slidesPerView: 1.2,
	     spaceBetween: 20,
	     centeredSlides: true,
	     loop: true,
	     navigation: {
	         nextEl: ".slide-next",
	         prevEl: ".slide-prev",
	     },
	     breakpoints: {
	         // when window width is >= 480px
	         480: {
	             slidesPerView: 1.4,
	             spaceBetween: 20,
	             centeredSlides: true
	         },
	         // when window width is >= 640px
	         640: {
	             slidesPerView: 1.8,
	             spaceBetween: 20,
	             centeredSlides: true
	         },
	         // when window width is >= 992px
	         992: {
	             slidesPerView: 1.8,
	             spaceBetween: 20,
	             centeredSlides: true
	         },
	         // when window width is >= 1320px
	         1200: {
	             slidesPerView: 2.8,
	             spaceBetween: 20,
	             centeredSlides: false
	         },
	     }

 	});

	 var placeSlider = new Swiper(".place-slider", {
        slidesPerView: 2.4,
        spaceBetween: 20,
        loop: true,
        navigation: {
            nextEl: ".slide-next",
            prevEl: ".slide-prev",
        },
        breakpoints: {
            // when window width is >= 480px
            480: {
                slidesPerView: 1.4,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 640px
            640: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 992px
            992: {
                slidesPerView: 1.8,
                spaceBetween: 20,
                centeredSlides: true
            },
            // when window width is >= 1320px
            1200: {
                slidesPerView: 2.8,
                spaceBetween: 20,
                centeredSlides: false
            },
        }

    });

});
</script>
</head>
<body>
<%@ include file="template/header.jspf" %>

<main class="main-page">
    <div class="content-wrap">
        <div class="weekly-magazine-sect">
            <div class="container">
                <h2 class="sect-tit mb20"><span class="emoji">❗</span> 이번 주 추천 매거진</h2>
                <p class="wm-tag mb40"><span>#이번주말</span><span>#뭐하고놀지🤔</span></p>
            </div>
            <div class="swiper magazine-slider top20-place-sect"> <!-- 관리자에서 매거진 게시판에 등록한 게시글의 썸네일, 제목, #태그가 슬라이드로 노출 (최근게시글 10개) -->
                <div class="swiper-wrapper">
                	<c:forEach items="${mzList }" var="mzbean" begin="0" end="4">
                    <div class="swiper-slide list-item"> 
                        <a href="${pageContext.request.contextPath}/magazine/${mzbean.magazine_idx }">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/${mzbean.magazine_thumb });"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>${mzbean.magazine_subject }</strong> <!-- 게시글 제목 -->
                                <p class="tags"></p>
								<p class="hidden-tags">${mzbean.magazine_hashtag }</p>
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="slide-next">👉</div>
                <div class="slide-prev">👈</div>
            </div>
        </div>
        <!-- // weekly-magazine-sect  -->


        <div class="place-cate-sect">
            <div class="container">
                <div class="tac">
                    <h2 class="sect-tit tac mb80">카테고리별 추천 PLACE <span class="emoji">👀</span></h2>
                    <ul class="cate-btns mb100">
                        <li><a href="${pageContext.request.contextPath}/place/category#food"><span>맛집</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/place/category#cafe"><span>카페</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/place/category#play"><span>놀거리</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/place/category#bar"><span>술집</span></a></li>
                    </ul>
                    <a class="abtn abtn-mint big" href="${pageContext.request.contextPath}/place/category">더보기</a>
                </div>
            </div>
        </div>
        <!-- // place-cate-sect -->


        <div class="place-location-sect">
            <div class="container">
                <h2 class="sect-tit mb40">지역별 <span class="emoji">📍</span> 추천 PLACE</h2>
                <div class="map-btns tac mb20">
                    <button class="around-btn abtn abtn-gray">내 주변 보기</button>
                    <a class="abtn abtn-mint" href="${pageContext.request.contextPath}/place/location">자세히 보기</a>
                </div>
                <div id="map"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf"></script>
                <script>
                $(function(){
                	// 맵 생성
                    var mapContainer = document.getElementById('map'),
                    mapOption = { 
                        center: new kakao.maps.LatLng(37.5642135, 127.0016985),
                        level: 7
                    };
					var map = new kakao.maps.Map(mapContainer, mapOption);

                    $.get("${pageContext.request.contextPath }/place/json", function(data) {
                    	var place = $(data.positions)[0];
                    	var placeIdxArr = Object.keys(place);
                    	
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
                            
                            kakao.maps.event.addListener(marker, 'click', makeClickListener(map, marker, infowindow, positions));
                    	}
                    });

                    function makeClickListener(map, marker, infowindow, positions) {
                        return function() {
                            infowindow.open(map, marker);
                        };
                    }
                        
                        
                    // 내 주변 보기 클릭
                    $('.around-btn').on('click', function(){
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
        </div>
        <!-- // place-location-sect -->


        <div class="top20-place-sect">
            <div class="container">
                <h2 class="sect-tit mb40"><span class="emoji">❤️</span> 좋아요 많은 장소 TOP 20</h2>
            </div>
            <div class="swiper place-slider">   <!-- 관리자에서 등록한 장소 중 좋아요 눌린 수가 많은 상위 20개 장소를 썸네일, 장소명, #태그가 슬라이드로 노출 -->
                <div class="swiper-wrapper">
                	<c:forEach items="${plLikesList }" var="plLikesbean" begin="0" end="19">
                    <div class="swiper-slide list-item"> 
                        <a href="${pageContext.request.contextPath}/place/${plLikesbean.place_idx }">
                            <div class="thumb-img" style="background-image: url(${imgPath }/place/${plLikesbean.place_thumb });"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>${plLikesbean.place_name }</strong>   <!-- 장소명 -->
                                <p class="tags">
                                	<span class="hidden-tags">${plLikesbean.place_hashtag }</span>
                                </p><!-- 장소 관련태그 => 게시물 등록시 작성필요 -->
                            </div>
                        </a>
                    </div>
                    </c:forEach>
                </div>
                <div class="slide-next">👉</div>
                <div class="slide-prev">👈</div>
            </div>
        </div>
        <!-- // weekly-magazine-sect  -->

    </div>
    <!-- // content-wrap  -->

  
</main>
<!-- // main -->

    
<%@ include file="template/footer.jspf" %>
</body>
</html>