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
	const tag = '${plbean.placeInfo.place_hashtag}';
	const hashArr = tag.split(';');
	
	hashArr.forEach(function(ele, idx){
		$('.view-util p.tags').append('<span>#' + ele + '</span>');
	});
	
	
	// 좋아요 클릭
	var place_idx = ${plbean.placeInfo.place_idx};
	
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
	
	
	// 리뷰수정모달 기존평점 불러오기
	var myScore = ${empty plbean.reviewOne.review_score ? 0 : plbean.reviewOne.review_score };
	$('#reviewModifyModal .select-star label').eq(myScore-1).children('input[type="radio"]').prop('checked', 'checked');
	
	function saveUrl(){
		var currentUrl=window.location.pathname.substring(window.location.pathname.indexOf('/',1));
		var todayDate=new Date();
		todayDate.setDate(todayDate.getDate()+1);
		document.cookie="url"+"="+escape(currentUrl)+"; path=/; expires="+todayDate.toGMTString()+";";
	}
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

   <main class="place-detail-page">
        <div class="content-wrap">
            <div class="top-banr-sect" style="background-image: url(${imgPath }/place/${plbean.placeInfo.place_thumb });"> <!-- 장소detail 페이지는 장소등록 시 등록한 썸네일이 배경이미지로 들어감 -->
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath }">Home</a></li>
                        <li><a href="${pageContext.request.contextPath }/place/category">카테고리별</a></li>
                        <li class="active">${plbean.placeInfo.place_name }</li>    <!-- 장소명 breadcrumb으로 넣기 -->
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
                                <li class="util-show">👁️‍🗨️ <span>${plbean.placeInfo.place_viewcnt }</span></li> <!-- span안에 조회수 넣기 -->
                                <li class="util-like">❤️ <span id="numLikes">${plbean.likeCnt }</span></li> <!-- span안에 좋아요 수 넣기 / 클릭 시 바로 숫자 올라가야함  -->
                                <li class="util-star">⭐ <span>${plbean.scoreAvg }</span></li> <!-- span안에 평점 넣기 -->
                                <li class="util-reivew">📝 <span>${plbean.reviewCnt }</span></li> <!-- span안에 리뷰갯수 넣기 -->
                                <li><a href="">🔗</a></li> <!-- 공유하기 => 이부분은 시간여유 있으면 진행 -->
                            </ul>
                        </div>
                        <div class="place-info">
                            <div class="thumb">
                                <img src="${imgPath }/place/${plbean.placeInfo.place_thumb }" alt=""> <!-- 업로드하는 이미지 사이즈 고정 480x480 -->
                            </div>
                            <strong>${plbean.placeInfo.place_category }</strong>  <!-- 해당 장소의 카테고리명 -->
                            <h3>${plbean.placeInfo.place_name }</h3>  <!-- 장소명 -->
                            <p>${plbean.placeInfo.place_content }</p> <!-- 간단소개 -->
                            <div class="desc">
                                <ul>
                                    <li>📌<span>${plbean.placeInfo.place_addr }</span></li> <!-- 주소 -->
                                    <li>📞<span>${plbean.placeInfo.place_tel }</span></li> <!-- 전화번호 -->
                                    <li>⏰<span>${plbean.placeInfo.place_opentime } - ${plbean.placeInfo.place_endtime }</span></li> <!-- 영업시간 -->
                                    <li>🏠<span><a href="${plbean.placeInfo.place_url }" target="_blank">${plbean.placeInfo.place_url }</a></span></li> <!-- 대표링크 -->
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
                            <h4>📝 다녀온 회원 리뷰 <span>${plbean.reviewCnt }</span>개</h4>  <!-- span안에 리뷰갯수 넣기 -->
                            <p>이 PLACE에 다녀온 사람들은 <strong>⭐<span>${plbean.scoreAvg }</span></strong>만큼 만족했어요!</p> <!-- span안에 평점 넣기 -->
                            <div class="review-list">
                                <ul>
                                <c:choose> 
                                	<c:when test="${fn:length(plbean.reviewList) eq 0}">
	                					<li style="padding: 30px; color: #aaa; text-align: center;">
	                						등록된 리뷰가 없습니다.
	                					</li>
                                	</c:when>
                                	<c:otherwise>
                                		<c:forEach items="${plbean.reviewList }" var="rvbean">
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
			                        			<button type="button" class="abtn abtn-mint" data-toggle="modal" data-target="#reviewModifyModal">리뷰 수정하기</button>
			                        			<button type="button" class="abtn abtn-mint" data-toggle="modal" data-target="#reviewDeleteModal">리뷰 삭제하기</button>
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
                            var lat = ${plbean.placeInfo.place_latitude},
                            	lng = ${plbean.placeInfo.place_longitude};
                            
                            var mapContainer = document.getElementById('map'),
                                mapOption = { 
                                    center: new kakao.maps.LatLng(lat, lng),
                                    level: 4
                                };

                            var map = new kakao.maps.Map(mapContainer, mapOption);

                            var imageSrc = '${imgPath }/pin.png',
                                imageSize = new kakao.maps.Size(32, 32),
                                imageOption = {offset: new kakao.maps.Point(32, 32)};
                                
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

	<!-- 
    로그인O 상태 : ❤️+1 이 게시글을 좋아합니다.
    로그인X 상태 : 로그인이 필요한 서비스입니다. + 로그인화면으로 이동 버튼 
    -->
	<div class="modal fade like-modal" id="likeModal" tabindex="-1"
		role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">🤗 로그인이 필요한 서비스입니다.</h4>
				</div>
				<div class="modal-footer">
					<button type="button" class="abtn abtn-mint" data-dismiss="modal">확인</button>
					<button type="button" class="abtn abtn-mint" data-dismiss="modal" onclick="saveUrl(); location.href='${pageContext.request.contextPath}/member/login'">로그인 화면으로 이동</button>

				</div>
			</div>
		</div>
	</div>

    <!-- 리뷰작성 모달 -->
    <div class="modal fade review-modal" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="reviewWriteModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">✏️ 리뷰 작성하기</h4>
                </div>
                <form action="" method="post">
                	<input type="hidden" name="review_placeidx" value="${plbean.placeInfo.place_idx }">
                	<input type="hidden" name="review_memberid" value="${sessionScope.sessionId}" >  <!-- 현재 로그인한 사용자 아이디 -->
                    <div class="modal-body"> 
                        <div class="form-group">
                            <span>방문 장소</span>
                            <p>${plbean.placeInfo.place_name }</p> <!-- 해당페이지의 플레이스명 -->
                        </div>
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
					<script>
						$('.radio-star').on('click', function(){
							console.log($(this).children('input').prop('checked'));
						});
					</script>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button>
                        <button type="submit" class="abtn abtn-mint">리뷰 등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    
        <!-- 리뷰 수정 모달 -->
	<div class="modal fade review-modal" id="reviewModifyModal" tabindex="-1" role="dialog" aria-labelledby="reviewModifyModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">✏️ 리뷰 수정하기</h4>
				</div>
				<form action="" method="post">
					<input type="hidden" name="_method" value="put">
					<input type="hidden" name="review_placeidx"	value="${plbean.placeInfo.place_idx }">
					<input type="hidden" name="review_memberid" value="${sessionScope.sessionId}">
					<!-- 현재 더미에넣은 사용자 아이디 -->
					<div class="modal-body">
						<div class="form-group">
							<span>방문 장소</span>
							<p>${plbean.placeInfo.place_name }</p>
							<!-- 해당페이지의 플레이스명 -->
						</div>
                       <div class="form-group">
                            <span>평점</span>
                            <div class="select-star">
                                <label class="radio-star" for="star11">
                                    <input type="radio" name="review_score" id="star11" value="1">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star21">
                                    <input type="radio" name="review_score" id="star21" value="2">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star31">
                                    <input type="radio" name="review_score" id="star31" value="3">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star41">
                                    <input type="radio" name="review_score" id="star41" value="4">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star51">
                                    <input type="radio" name="review_score" id="star51" value="5">
                                    <span></span>
                                </label>
                            </div>
                        </div>
						<div class="form-group">
							<label for="reviewCnt">리뷰</label>
							<textarea name="review_content" id="reviewCnt">${plbean.reviewOne.review_content }</textarea>
						</div>

					</div>
					<div class="modal-footer">
						<button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button>
						<button type="submit" class="abtn abtn-mint" id="modifyBtn">수정</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<!-- 리뷰 삭제 모달 -->
	<div class="modal fade review-modal" id="reviewDeleteModal" tabindex="-1" role="dialog" aria-labelledby="reviewDeleteModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="myModalLabel">✏️ 리뷰 삭제하기</h4>
				</div>
				<form action="${pageContext.request.contextPath }/place/${plbean.placeInfo.place_idx}" method="post">
                	<input type="hidden" name="review_placeidx" value="${plbean.placeInfo.place_idx }">
                	<input type="hidden" name="review_memberid" value="${sessionScope.sessionId}">
					<input type="hidden" name="_method" value="delete">
					<!-- 현재 더미에넣은 사용자 아이디 -->
					<input type="hidden" id="delBtn" name="review_content"
						value="${plbean.placeInfo.place_idx }" />
					<div class="modal-body">
						리뷰를 삭제하시겠습니까?


					</div>
					<div class="modal-footer">
						<button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button>
						<button type="submit" class="abtn abtn-mint" id="delBtn">리뷰 삭제</button>
					</div>
				</form>
			</div>
		</div>
	</div>

	<%@ include file="../template/footer.jspf" %>
</body>
</html>