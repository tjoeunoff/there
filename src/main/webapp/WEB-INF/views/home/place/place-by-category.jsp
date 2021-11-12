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

 <main class="place-cate-page">
        <div class="content-wrap">
            <div class="top-banr-sect">
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li class="active">카테고리별</li>
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
            
            
            <div class="place-list-wrap">
                <div class="container">
                    <div class="row">
                        <p class="tac mb10 bold">카테고리 선택</p>
                        <ul class="cate-filter-btns mb60">
                            <li><button data-filter="all">All</button></li>
                            <li><button data-filter="맛집">맛집</button></li>
                            <li><button data-filter="카페">카페</button></li>
                            <li><button data-filter="놀거리">놀거리</button></li>
                            <li><button data-filter="술집">술집</button></li>
                        </ul>
                    </div>
                    <div class="row">
                    	<c:forEach items="${list }" var="plbean">
                        <div class="list-item col-sm-6 col-md-4" data-cate="${plbean.place_category }">
                            <a href="${pageContext.servletContext.contextPath }/place/${plbean.place_idx }">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/${plbean.place_thumb });"></div>
                                </div>
                                <div class="caption">
                                    <h4>${plbean.place_name }</h4>
                                    <p><span>${plbean.place_hashtag }</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>${plbean.place_viewcnt }</span></li>
                                    <li class="util-like">❤️ <span>${plbean.placeLikeCnt }</span></li>
                                </ul>
                            </a>
                        </div>
                        </c:forEach>
                        
                        
                        <!-- 샘플 -->
                        <div class="list-item col-sm-6 col-md-4" data-cate="cafe">
                            <a href="">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb02.jpg);"></div>
                                </div>
                                <div class="caption">
                                    <h4>🌄OO 마운틴 카페</h4>
                                    <p><span>#마운틴뷰 카페</span><span>#힐링카페</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>256</span></li>
                                    <li class="util-like">❤️ <span>84</span></li>
                                </ul>
                            </a>
                        </div>
                        <!-- // 샘플 -->
                    </div>

                </div>
                <!-- // container -->
            </div>
            <!-- // place-list-wrap -->

        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->

    
<%@ include file="../template/footer.jspf" %>
</body>
</html>