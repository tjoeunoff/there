<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
<%@ include file="../template/include.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	//var contextPath=window.location.href.split('/')[window.location.href.split('/').length-3];
	//var magazine_idx=window.location.href.split('/')[window.location.href.split('/').length-1];
	var magazine_idx=${mzbean.magazine_idx};
	var member_id='${mbrbean.member_id}';
	$('#likeButton').click(function(){
		$.post("./likes/"+magazine_idx,{
			magazine_idx: magazine_idx,
			member_id: "user01"	
		},function(data){
			if(data){
				$('#likeButton').text("이 포스팅 좋아요 ❤️");
				var numLikes=parseInt($('#numLikes').text());
				$('#numLikes').text(numLikes+1);
			}
			else{
				$('#likeButton').text("이 포스팅 좋아요 🤍");
				var numLikes=parseInt($('#numLikes').text());
				$('#numLikes').text(numLikes-1);
			}
		});
	});
});
</script>
<style>
#clear{
	clear:both;
}
</style>
</head>
<body>
<%@ include file="../template/header.jspf" %>

    <main class="magazine-page magazine-view-page">
        <div class="content-wrap">
            <div class="top-banr-sect" style="background-image: url(${pageContext.request.contextPath }/resources/img/magazine/${mzbean.magazine_thumb});"> <!-- 각 view페이지는 게시글작성 시 등록한 썸네일이 배경이미지로 들어감 -->
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="">매거진</a></li>
                        <li class="active">떠나자 단풍 구경! 🍁</li>    <!-- 게시물 제목 breadcrumb으로 넣기 -->
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
                        <h3>${mzbean.magazine_subject }</h3>  <!-- 게시글 제목 -->
                        <p><span>${mzbean.magazine_hashtag }</span></p>  <!-- 게시글 관련태그 -->
                        <div class="view-util">
                            <ul>
                                <li class="util-show">👁️‍🗨️ <span>${mzbean.magazine_viewcnt }</span></li> <!-- span안에 조회수 넣기 -->
                                <li class="util-like">
									❤️<span id="numLikes">${mzNumlikes }</span>
                                </li> <!-- span안에 좋아요 수 넣기 / 클릭 시 바로 숫자 올라가야함  -->
                                <li class="share"><a href="">🔗</a></li> <!-- 공유하기 => 이부분은 시간여유 있으면 진행 -->
                            </ul>
                            <p>작성일&nbsp;&nbsp;&nbsp;<span class="date">${mzbean.magazine_date.getYear()+1900}.${mzbean.magazine_date.getMonth()+1 }.${mzbean.magazine_date.getDate() }</span></p>  <!-- 게시글 작성일 -->
                        </div>
                    </div>

                    <div class="view-content">
                        <!-- 게시글 등록시 내용으로 입력한 contenct (ckeditor 사용?) -->
						${mzbean.magazine_content }
                        <!-- // 게시글 등록시 입력한 내용 -->
                    </div>

                    <div class="bbs-action mb40" id="clear">
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
                    </div>

                    <div class="view-foot">
                        <ul class="list-nav-btns">
							<c:choose>
								<c:when test="${mzPrevidx ne -1 }">
                            		<li><a href="${pageContext.request.contextPath }/magazine/${mzPrevidx}">좌측글(이전글)</a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li><a href="${pageContext.request.contextPath }/magazine/${mzOldestidx}">처음글</a></li>
                            	</c:otherwise>
							</c:choose>
                            <li><a href="${pageContext.request.contextPath}/magazine">목록</a></li>
                            <c:choose>
                            	<c:when test="${mzNextidx ne -1 }">
                            		<li><a href="${pageContext.request.contextPath }/magazine/${mzNextidx}">다음글(우측글)</a></li>
                            	</c:when>
                            	<c:otherwise>
                            		<li><a href="${pageContext.request.contextPath }/magazine/${mzNewestidx}">최신글</a></li>
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


    <!-- 좋아요 클릭 시 알림창
            로그인O 상태 : ❤️+1 이 게시글을 좋아합니다.
            로그인X 상태 : 로그인이 필요한 서비스입니다.    
    -->
    <div class="modal fade like-modal" id="likeModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <!-- 로그인O 시 -->
                    
                    <h4 class="modal-title" id="myModalLabel">❤️ + 1</h4>
                    <p>이 게시글을 좋아합니다.</p>
                    
                    <!-- // 로그인O 시 -->

                    <!-- 로그인X 시 -->
                    <!-- <h4 class="modal-title" id="myModalLabel">🤗 로그인이 필요한 서비스입니다.</h4> -->
                    <!-- // 로그인X 시 -->
                </div>
                <div class="modal-footer">
                    <!-- 로그인O 시 -->
                    <button type="button" class="abtn abtn-mint" data-dismiss="modal">확인</button>
                    <!-- // 로그인O 시 -->

                    <!-- 로그인X 시 -->
                    <!-- <a class="abtn abtn-mint" href="../member/login.html">로그인페이지로 이동</a>
                    <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button> -->
                    <!-- // 로그인X 시 -->

                </div>
            </div>
        </div>
    </div>
</body>
</html>