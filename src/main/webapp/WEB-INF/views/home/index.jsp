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

});
</script>
</head>
<body>
<%@ include file="template/header.jspf" %>

<main class="main-page">
    <div class="content-wrap">
        <div class="weekly-magazine-sect">
            <div class="container">
                <h2 class="sect-tit mb20">❗ 이번 주 추천 매거진</h2>
                <p class="wm-tag mb40"><span>#이번주말</span><span>#뭐하고놀지🤔</span></p>
            </div>
            <div class="swiper magazine-slider"> <!-- 관리자에서 매거진 게시판에 등록한 게시글의 썸네일, 제목, #태그가 슬라이드로 노출 (최근게시글 10개) -->
                <div class="swiper-wrapper">
                	<c:forEach items="${mzList }" var="mzbean" begin="0" end="4">
                    <div class="swiper-slide"> 
                        <a href="${pageContext.request.contextPath}/magazine/${mzbean.magazine_idx }">
                            <div class="thumb-img" style="background-image: url(${imgPath }/magazine/${mzbean.magazine_thumb });"></div> <!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
                            <div class="thumb-desc">
                                <strong>${mzbean.magazine_subject }</strong> <!-- 게시글 제목 -->
                                <p><span>${mzbean.magazine_hashtag }</span></p> <!-- 게시글 관련태그 => 게시물 등록시 작성필요 -->
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
                    <h2 class="sect-tit tac mb80">카테고리별 추천 PLACE 👀</h2>
                    <ul class="cate-btns mb100">
                        <li><a href="${pageContext.request.contextPath}/categroy#food"><span>맛집</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/categroy#cafe"><span>카페</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/categroy#play"><span>놀거리</span></a></li>
                        <li><a href="${pageContext.request.contextPath}/categroy#bar"><span>술집</span></a></li>
                    </ul>
                    <a class="abtn abtn-mint big" href="${pageContext.request.contextPath}/categroy">더보기</a>
                </div>
            </div>
        </div>
        <!-- // place-cate-sect -->


        <div class="place-location-sect">
            <div class="container">
                <h2 class="sect-tit mb40">지역별 📍 추천 PLACE</h2>
                <div class="map-btns tac mb20">
                    <button class="abtn abtn-gray">내 주변 보기</button>
                    <a class="abtn abtn-mint" href="${pageContext.request.contextPath}/location">자세히 보기</a>
                </div>
                <div id="map"></div>
                <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf&libraries=clusterer"></script>
                <script>
                    var map = new kakao.maps.Map(document.getElementById('map'), {
                        center : new kakao.maps.LatLng(37.564079, 126.980046),
                        level : 7
                    });
                    var clusterer = new kakao.maps.MarkerClusterer({
                        map: map,
                        averageCenter: true,
                        minLevel: 10,
                        disableClickZoom: true
                    });
    
                    $.get("/chicken.json", function(data) {
                        var markers = $(data.positions).map(function(i, position) {
                            return new kakao.maps.Marker({
                                position : new kakao.maps.LatLng(position.lat, position.lng)
                            });
                        });
                        clusterer.addMarkers(markers);
                    });

                    kakao.maps.event.addListener(clusterer, 'clusterclick', function(cluster) {
                        var level = map.getLevel()-1;
                        map.setLevel(level, {anchor: cluster.getCenter()});
                    });
                </script>
            </div>
        </div>
        <!-- // place-location-sect -->


        <div class="top20-place-sect">
            <div class="container">
                <h2 class="sect-tit mb40">❤️ 좋아요 많은 장소 TOP 20</h2>
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