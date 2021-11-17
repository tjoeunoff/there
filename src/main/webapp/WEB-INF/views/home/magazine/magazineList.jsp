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
</head>
<body>
<%@ include file="../template/header.jspf" %>

    <main class="magazine-page magazine-list-page">
        <div class="content-wrap">
            <div class="top-banr-sect">
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath }">Home</a></li>
                        <li class="active">매거진</li>
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

            <div class="bbs-list-wrap">
                <div class="container">
                    <div class="row">
                        <c:forEach items="${mzList }" var="mzbean">
                        <div class="list-item col-sm-6 col-md-4">
                            <a href="${pageContext.request.contextPath }/magazine/${mzbean.magazine_idx }">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${pageContext.request.contextPath }/resources/img/magazine/${mzbean.magazine_thumb});"></div>  <!-- 게시글 썸네일 -->
                                    <span>VIEW MORE</span>
                                </div>
                                <div class="caption">
                                    <h4>${mzbean.magazine_subject }</h4>   <!-- 게시글 제목 -->
                                    <p><span>${mzbean.magazine_hashtag }</span></p>   <!-- 게시글 관련태그. -->
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>${mzbean.magazine_viewcnt }</span></li>
                                    <li class="util-like">❤️ <span>${empty mzNumlikesMap[mzbean.magazine_idx]?0:mzNumlikesMap[mzbean.magazine_idx] }</span></li>
                                </ul>
                            </a>
                        </div>
                        </c:forEach>
                    </div>
                </div>
                <!-- // container -->
            </div>
            <!-- // bbs-list-wrap -->

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


</body>
</html>