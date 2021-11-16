<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script>
$(function(){
	// 해시태그 출력
	const tag = '${plbean.place_hashtag}';
	const hashArr = tag.split(';');
	
	hashArr.forEach(function(ele, idx){
		$('.view-util p.tags').append('<span>#' + ele + '</span>');
	});
	
	
	// 좋아요 클릭
	var place_idx = ${plbean.place_idx};
	
	$('#likeButton').click(function() {
		$.post("./likes/" + place_idx, {
			place_idx : place_idx,
			member_id : "${sessionScope.sessionId}"
		}, function(data) {
			if (data) {
				$('#likeButton').text("이 포스팅 좋아요 ❤️");
				var numLikes = parseInt($('#numLikes').text());
				$('#numLikes').text(numLikes + 1);
			} else {
				$('#likeButton').text("이 포스팅 좋아요 🤍");
				var numLikes = parseInt($('#numLikes').text());
				$('#numLikes').text(numLikes - 1);
			}
		});
	});
	
	
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

   <main class="place-detail-page">
        <div class="content-wrap">
            <div class="top-banr-sect" style="background-image: url(${imgPath }/place/${plbean.place_thumb });"> <!-- 장소detail 페이지는 장소등록 시 등록한 썸네일이 배경이미지로 들어감 -->
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="">카테고리별</a></li>
                        <li class="active">${plbean.place_name }</li>    <!-- 장소명 breadcrumb으로 넣기 -->
                    </ol>
                    </ol>
                    <div class="page-header mb40">
                        <h2 class="sect-tit mb30">카테고리별 추천 PLACE</h2>
                        <p class="sect-desc mb10">오늘은 이거어때 ❓</p>
                        <p></p>
                    </div>
                </div>
            </div>
            <!-- // top-banr-sect -->

            <div class="container">    
                <div class="place-view-wrap">
                    <div class="container">
                        <div class="view-util">
                            <p class="tags"></p>  <!-- 장소 관련태그 -->
                            <ul>
                                <li class="util-show">👁️‍🗨️ <span>${plbean.place_viewcnt }</span></li> <!-- span안에 조회수 넣기 -->
                                <li class="util-like">❤️ <span id="numLikes">${likeCnt }</span></li> <!-- span안에 좋아요 수 넣기 / 클릭 시 바로 숫자 올라가야함  -->
                                <li class="util-star">⭐ <span>${scoreAvg }</span></li> <!-- span안에 평점 넣기 -->
                                <li class="util-reivew">📝 <span>${reviewCnt }</span></li> <!-- span안에 리뷰갯수 넣기 -->
                                <li><a href="">🔗</a></li> <!-- 공유하기 => 이부분은 시간여유 있으면 진행 -->
                            </ul>
                        </div>
                        <div class="place-info">
                            <div class="thumb">
                                <img src="${imgPath }/place/${plbean.place_thumb }" alt=""> <!-- 업로드하는 이미지 사이즈 고정 480x480 -->
                            </div>
                            <strong>${plbean.place_category }</strong>  <!-- 해당 장소의 카테고리명 -->
                            <h3>${plbean.place_name }</h3>  <!-- 장소명 -->
                            <p>${plbean.place_content }</p> <!-- 간단소개 -->
                            <div class="desc">
                                <ul>
                                    <li>📌<span>${plbean.place_addr }</span></li> <!-- 주소 -->
                                    <li>📞<span>${plbean.place_tel }</span></li> <!-- 전화번호 -->
                                    <li>⏰<span>${plbean.place_opentime } - ${plbean.place_endtime }</span></li> <!-- 영업시간 -->
                                    <li>🏠<span><a href="${plbean.place_url }" target="_blank">${plbean.place_url }</a></span></li> <!-- 대표링크 -->
                                </ul>
                            </div>
                        </div>

                        <div class="place-action mb40">
                            <c:if test="${not empty sessionScope.success }">
							<button type="button" class="" id="likeButton">
								<c:choose>
									<c:when test="${placeHasliked }">
		                        			이 포스팅 좋아요 ❤️
		                        	</c:when>
									<c:otherwise>
		                        			이 포스팅 좋아요 🤍
		                        	</c:otherwise>
								</c:choose>
							</button>
							<button>공유하기🔗</button>
							</c:if>
							<c:if test="${empty sessionScope.success }">
							<button type="button" class="" data-toggle="modal" data-target="#likeModal" id="likeButton">
								<c:choose>
									<c:when test="${mzHasliked }">
		                        			이 포스팅 좋아요 ❤️
		                        		</c:when>
									<c:otherwise>
		                        			이 포스팅 좋아요 🤍
		                        		</c:otherwise>
								</c:choose>
							</button>
							<button>공유하기🔗</button>
							</c:if>
                        </div>

                        <div class="place-review mb60">
                            <h4>📝 다녀온 회원 리뷰 <span>${reviewCnt }</span>개</h4>  <!-- span안에 리뷰갯수 넣기 -->
                            <p>이 PLACE에 다녀온 사람들은 <strong>⭐<span>${scoreAvg }</span></strong>만큼 만족했어요!</p> <!-- span안에 평점 넣기 -->
                            <div class="review-list">
                                <ul>
                                <c:choose> 
                                	<c:when test="${fn:length(rvlist) eq 0}">
	                					<li style="padding: 30px; color: #aaa; text-align: center;">
	                						등록된 리뷰가 없습니다.
	                					</li>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${rvlist }" var="rvbean">
		                                	<li>                   
		                                        <div class="rv-score">
			                                        <c:forEach begin="1" end="${rvbean.review_score }">
			                                        	<span>⭐</span>
			                                        </c:forEach>
		                                        </div>
		                                        <p>${rvbean.review_content }</p>
		                                        <p>${rvbean.review_date }</p>
		                                    </li>
		                                </c:forEach>
                                	</c:otherwise>
                                </c:choose>
                              </ul>
                            </div>
                            <c:if test="${sessionScope.sessionId ne null}">
                            <div class="review-btns">
                            <c:choose>
								<c:when test="${placeHasReview }">
	                        			<button type="button" class="abtn abtn-disabled" disabled>리뷰 작성완료</button>
	                        	</c:when>
								<c:otherwise>
	                        			<button type="button" class="abtn abtn-mint" data-toggle="modal" data-target="#reviewWriteModal">리뷰 작성하기</button>
	                        	</c:otherwise>
							</c:choose>
                            </div>
                            </c:if>
                        </div>
                        
                        <div class="place-map mb40">
                            <div id="map" style="width:100%;height:300px;"></div>
                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf"></script>
                            <script>
                            var lat = ${plbean.place_latitude},
                            	lng = ${plbean.place_longitude};
                            
                            var mapContainer = document.getElementById('map'),
                                mapOption = { 
                                    center: new kakao.maps.LatLng(lat, lng),
                                    level: 4
                                };

                            var map = new kakao.maps.Map(mapContainer, mapOption);

                            // 마커이미지 변경필요
                            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png',
                                imageSize = new kakao.maps.Size(64, 69),
                                imageOption = {offset: new kakao.maps.Point(27, 69)};
                                
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                                markerPosition = new kakao.maps.LatLng(lat, lng);

                            var marker = new kakao.maps.Marker({
                                position: markerPosition, 
                                image: markerImage
                            });

                            marker.setMap(map);  
                            </script>
                        </div>
    
                        <div class="view-foot">
                            <ul class="list-nav-btns">
                            	<!-- 맨첫글, 맨 마지막글에서 버튼 비활성화 기능 추가필요 -->
                                <li><a href="${pageContext.servletContext.contextPath }/place/${idxList.prevIdx }">이전글</a></li>
                                <li><a href="${pageContext.servletContext.contextPath }/place/category">목록</a></li>
                                <li><a href="${pageContext.servletContext.contextPath }/place/${idxList.nextIdx }">다음글</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- container -->
                </div>
                <!-- // place-view-wrap -->
            </div>


        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->


	<div class="modal fade like-modal" id="likeModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<!-- 로그인O 시 -->

					<!-- // 로그인O 시 -->

					<!-- 로그인X 시 -->
					<h4 class="modal-title" id="myModalLabel">🤗 로그인이 필요한 서비스입니다.</h4>
					<!-- // 로그인X 시 -->
				</div>
				<div class="modal-footer">
					<!-- 로그인O 시 -->
					<button type="button" class="abtn abtn-mint" data-dismiss="modal">확인</button>
					<button type="button" class="abtn abtn-mint" data-dismiss="modal" onclick="location.href='${pageContext.request.contextPath}/member/login'">로그인 화면으로 이동</button>
					<!-- // 로그인O 시 -->

					<!-- 로그인X 시 -->
					<!-- <a class="abtn abtn-mint" href="../member/login.html">로그인페이지로 이동</a>
                    <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button> -->
					<!-- // 로그인X 시 -->

				</div>
			</div>
		</div>
	</div>


    <!-- 리뷰작성 모달 -->
    <div class="modal fade like-modal" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="reviewWriteModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">✏️ 리뷰 작성하기</h4>
                </div>
                <form action="" method="post">
                	<input type="hidden" name="review_placeidx" value="${plbean.place_idx }">
                	<input type="hidden" name="review_memberid" value="user01" >  <!-- 현재 더미에넣은 사용자 아이디 -->
                    <div class="modal-body"> 
                        <div class="form-group">
                            <span>방문 장소</span>
                            <p>${plbean.place_name }</p> <!-- 해당페이지의 플레이스명 -->
                        </div>
                        <!-- 
                        <div class="form-group">
                            <label for="visitDate">방문 날짜</label>
                            <input type="text" id="visitDate" name="visitDate">  datepicker로 날짜 선택
                            <span class="date-icon">📅 날짜선택</span>
                            <script>
                                $(function(){ 
                                    $('#visitDate').datepicker({
                                        format: "yyyy-mm-dd DD",
                                        language: "ko",
                                        endDate: "0d"
                                    });

                                    $('.date-icon').on('click', function(){
                                        $('#visitDate').focus();
                                    });

                                });
                            </script>
                        </div>
                        -->
                        <div class="form-group">
                            <span>평점</span>
                            <div class="select-star">
                                <label class="radio-star" for="star1">
                                    <input type="radio" name="review_score" id="star1" value="1">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star2">
                                    <input type="radio" name="review_score" id="star2" value="2">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star3">
                                    <input type="radio" name="review_score" id="star3" value="3">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star4">
                                    <input type="radio" name="review_score" id="star4" value="4">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star5">
                                    <input type="radio" name="review_score" id="star5" value="5">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reviewCnt">리뷰</label>
                            <textarea name="review_content" id="reviewCnt"></textarea>
                        </div>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button>
                        <button type="submit" class="abtn abtn-mint">리뷰 등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
<%@ include file="../template/footer.jspf" %>
</body>
</html>