<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script>
$(function(){
	
	// show hashtag
	var tagsArr = new Array();
	$.each($('.hidden-tags'), function(idx, ele){
		tagsArr[idx] = $(this).text();
	});
	$('.hidden-tags').hide();
	
	const hashArr = new Array();
	tagsArr.forEach(function(ele, idx){
		hashArr[idx] = ele.split(';');
		
		hashArr[idx].forEach(function(ele2, idx2){
			$('.list-item').eq(idx).find('p.tags').append('<span>#' + ele2 + '</span>');
		});
	});
	
	
    // place category filter
    var cate = window.location.hash.split('#')[1];								
	var cateBtnLi = $('.cate-filter-btns').children('li');
	var btnIdx = 0;
    
    filterSelection("all", btnIdx);

    $('.cate-filter-btns li button').on('click', function(){  					// 카테고리 페이지에서 버튼 클릭시
    	var filterName = $(this).data('filter');
    	btnIdx = $(this).parent('li').index();
        filterSelection(filterName, btnIdx);
    });
	
	
	if(typeof cate != "undefined") {											// 메인페이지에서 각 카테고리 클릭하여 접근 시
		switch(cate) {
		case "food"	: cate = "맛집"; btnIdx = 1;
			break;
		case "cafe"	: cate = "카페"; btnIdx = 2;
			break;
		case "play"	: cate = "놀거리"; btnIdx = 3;
			break;
		case "bar"	: cate = "술집"; btnIdx = 4;
			break;
		}
		filterSelection(cate, btnIdx);
	}
		
    function filterSelection(cate, btnIdx) {
        var item = document.getElementsByClassName("list-item");
              
        for (var i = 0; i < item.length; i++) {
            if (cate == "all") {
                item[i].style.display = "block";
            } else if (item[i].dataset.cate == cate) {
                item[i].style.display = "block";
            } else {
                item[i].style.display = "none";
            }
        }
        
        cateBtnLi.eq(btnIdx).addClass('on').siblings('li').removeClass('on');
        
    }

});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

 <main class="place-cate-page">
        <div class="content-wrap">
            <div class="top-banr-sect">
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="${pageContext.request.contextPath }">Home</a></li>
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
                                    <p class="tags"></p>
                                    <p class="hidden-tags">${plbean.place_hashtag }</p>
                                </div>
                                <ul>
                                    <li class="util-show">👁️‍🗨️ <span>${plbean.place_viewcnt }</span></li>
                                    <li class="util-like">❤️ <span>${plbean.placeLikeCnt }</span></li>
                                </ul>
                            </a>
                        </div>
                        </c:forEach>
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