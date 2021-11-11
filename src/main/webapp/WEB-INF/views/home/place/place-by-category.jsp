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
                            <li><button data-filter="food">맛집</button></li>
                            <li><button data-filter="cafe">카페</button></li>
                            <li><button data-filter="entertainment">놀거리</button></li>
                            <li><button data-filter="alcohol">술집</button></li>
                        </ul>
                    </div>
                    <div class="row">
                        <div class="list-item col-sm-6 col-md-4" data-cate="cafe">
                            <a href="${pageContext.servletContext.contextPath }/place/detail">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb01.jpg);"></div>
                                </div>
                                <div class="caption">
                                    <h4>성수 OO카페 👫</h4>
                                    <p><span>#성수 카페</span><span>#야간명소</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>256</span></li>
                                    <li class="util-like">❤️ <span>84</span></li>
                                </ul>
                            </a>
                        </div>
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
                        <div class="list-item col-sm-6 col-md-4" data-cate="food">
                            <a href="">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb03.jpg);"></div>
                                </div>
                                <div class="caption">
                                    <h4>OO오션 식당💙</h4>
                                    <p><span>#서울근교</span><span>#맛집</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>256</span></li>
                                    <li class="util-like">❤️ <span>84</span></li>
                                </ul>
                            </a>
                        </div>
                        <div class="list-item col-sm-6 col-md-4" data-cate="alcohol">
                            <a href="">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb04.jpg);"></div>
                                </div>
                                <div class="caption">
                                    <h4>잠실 노천 영화상영장 🎬</h4>
                                    <p><span>#가을밤 노천 영화상영제</span><span>#무비</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>256</span></li>
                                    <li class="util-like">❤️ <span>84</span></li>
                                </ul>
                            </a>
                        </div>
                        <div class="list-item col-sm-6 col-md-4" data-cate="entertainment">
                            <a href="">
                                <div class="thumb">
                                    <div class="thumb-img" style="background-image: url(${imgPath }/place/palce_thumb05.jpg);"></div>
                                </div>
                                <div class="caption">
                                    <h4>야외 스케이트장 🎬</h4>
                                    <p><span>#야외 스케이트장</span><span>#겨울</span></p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>256</span></li>
                                    <li class="util-like">❤️ <span>84</span></li>
                                </ul>
                            </a>
                        </div>
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