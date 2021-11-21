<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<%@ include file="../template/include.jspf"%>
<script type="text/javascript">
	$(document).ready(function() {
		var magazine_idx = ${mzbean.magazine_idx};
		var member_id = '${mbrbean.member_id}';
		$('#likeButton').click(function() {
			$.post("./likes/" + magazine_idx, {
				magazine_idx : magazine_idx,
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
		
		// 해시태그 출력
		/*
		const tag = '${mzbean.magazine_hashtag}';
		const hashArr = tag.split(';');
		
		hashArr.forEach(function(ele, idx){
			var hash=$('<span>#' + ele + '</span>');
			hash.css('background','#bbb');
			hash.css('border-radius','5px');
			hash.css('font-size','17px');
			hash.css('color','white');
			hash.css('padding','2px 7px 4px');
			$('.view-head p.tags').append(hash);
		});
		*/
		// 해시태그 출력
		const tag = '${mzbean.magazine_hashtag}';
		const hashArr = tag.split(';');
		
		hashArr.forEach(function(ele, idx){
			$('.view-head p.tags').append('<span>#' + ele + '</span>');
		});
	});
	
	function saveUrl(){
		var currentUrl=window.location.pathname.substring(window.location.pathname.indexOf('/',1));
		var todayDate=new Date();
		todayDate.setDate(todayDate.getDate()+1);
		document.cookie="url"+"="+escape(currentUrl)+"; path=/; expires="+todayDate.toGMTString()+";";
	}
</script>
<style>
#clear {
	clear: both;
}
</style>
</head>
<body>
	<%@ include file="../template/header.jspf"%>

	<main class="magazine-page magazine-view-page">
		<div class="content-wrap">
			<div class="top-banr-sect"
				style="background-image: url(${pageContext.request.contextPath }/resources/img/magazine/${mzbean.magazine_thumb});">
				<!-- 각 view페이지는 게시글작성 시 등록한 썸네일이 배경이미지로 들어감 -->
				<div class="container">
					<ol class="breadcrumb">
						<li><a href="${pageContext.request.contextPath }">Home</a></li>
						<li><a href="${pageContext.request.contextPath }/magazine">매거진</a></li>
						<li class="active">${mzbean.magazine_subject }</li>
					</ol>
					</ol>
					<div class="page-header mb40">
						<h2 class="sect-tit mb30">이번 주 추천 매거진</h2>
						<p class="sect-desc mb10">오늘은 어디가지? 🙄</p>
						<p></p>
					</div>
				</div>
			</div>
			<!-- // top-banr-sect -->

			<div class="bbs-view-wrap">
				<div class="container">
					<div class="view-head">
						<!-- 게시글 제목 -->
						<h3>${mzbean.magazine_subject }</h3>
						<!-- 게시글 관련태그 -->
						<p class="tags"></p>
						<div class="view-util">
							
							<ul>
								<!-- span안에 조회수 넣기 -->
								<li class="util-show">👁️‍🗨️ <span>${mzbean.magazine_viewcnt }</span></li>
								<!-- span안에 좋아요 수 넣기 / 클릭 시 바로 숫자 올라감(ajax)  -->
								<li class="util-like">❤️<span id="numLikes">${mzNumlikes }</span>
								<!-- 공유하기 => 이부분은 시간여유 있으면 진행 -->
								</li><li class="share"><a href="">🔗</a></li>
							</ul>
							<p>
								작성일&nbsp;&nbsp;&nbsp;<span class="date">${mzbean.magazine_date.getYear()+1900}.${mzbean.magazine_date.getMonth()+1 }.${mzbean.magazine_date.getDate() }</span>
							</p>
							<!-- 게시글 작성일 -->
						</div>
					</div>

					<div class="view-content">
						<!-- 게시글 등록시 내용으로 입력한 content -->
						${mzbean.magazine_content }
						<!-- // 게시글 등록시 입력한 내용 -->
					</div>

					<div class="bbs-action mb40" id="clear">
						<c:if test="${not empty sessionScope.success }">
							<button type="button" class="" id="likeButton">
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

					<div class="view-foot">
						<ul class="list-nav-btns">
							<c:choose>
								<c:when test="${mzPrevidx ne -1 }">
									<li><a
										href="${pageContext.request.contextPath }/magazine/${mzPrevidx}">이전글</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/magazine/${mzOldestidx}">처음글</a></li>
								</c:otherwise>
							</c:choose>
							<li><a href="${pageContext.request.contextPath}/magazine">목록</a></li>
							<c:choose>
								<c:when test="${mzNextidx ne -1 }">
									<li><a
										href="${pageContext.request.contextPath }/magazine/${mzNextidx}">다음글</a></li>
								</c:when>
								<c:otherwise>
									<li><a
										href="${pageContext.request.contextPath }/magazine/${mzNewestidx}">최신글</a></li>
								</c:otherwise>
							</c:choose>
						</ul>
					</div>
				</div>
				<!-- container -->
			</div>
			<!-- // bbs-view-wrap -->
		</div>
		<!-- // content-wrap  -->
	</main>
	<!-- // main -->

	<footer id="footer">
		<div class="container">
			<div class="foot-info-link">
				<p>&copy; 2021 OFFLineTeam All Rights Reserved.</p>
			</div>
		</div>
	</footer>
	<!-- // footer -->


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
</body>
</html>