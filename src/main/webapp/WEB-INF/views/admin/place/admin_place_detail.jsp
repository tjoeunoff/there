<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf&libraries=services"></script>
<script>
var lat = ${plbean.place_latitude},
	lng = ${plbean.place_longitude};

$(function(){
	var mapContainer = document.getElementById('map'),
    mapOption = { 
        center: new kakao.maps.LatLng(lat, lng),
        level: 3
    };

	var map = new kakao.maps.Map(mapContainer, mapOption);
	var markerPosition  = new kakao.maps.LatLng(lat, lng);	// 저장된 lat lng값 불러와서 넣기
	var marker = new kakao.maps.Marker({
	    position: markerPosition
	});
	
	marker.setMap(map);
	
	var iwContent = '<div style="padding:10px;">${plbean.place_name}</div>',
	    iwPosition = new kakao.maps.LatLng(lat, lng);	// 저장된 lat lng값 불러와서 넣기

	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	infowindow.open(map, marker); 
	
});
</script>
</head>
<body>
<%@ include file="../template/header.jspf" %>

<section class="admin_contents" id="form_link04" style="">
	<div class="container col-md-12">
		<div class="page-header">
        	<h2>플레이스 상세정보 <small>Place Detail</small></h2>
        </div>

        <div class="panel panel-default">
        	<div class="panel-heading">
            	선택하신 <strong>${plbean.place_name}</strong>에 대한 상세보기 페이지 입니다.
            </div>
        </div>
        <div class="place-detail-table">
       		<div>
       			<span>카테고리</span>
       			<p>${plbean.place_category}</p>
       		</div>
       		<div>
       			<span>플레이스명</span>
       			<p>${plbean.place_name}</p>
       		</div>
       		<div>
       			<span>주소</span>
       			<p>${plbean.place_addr}</p>
       			<div id="map" style="width:100%;height:350px;"></div>
       		</div>
       		<div>
       			<span>전화번호</span>
       			<p>${plbean.place_tel}</p>
       		</div>
       		<div>
       			<span>영업시간</span>
       			<p>${plbean.place_opentime} - ${plbean.place_endtime}</p>
       		</div>
       		<div>
       			<span>간략설명</span>
       			<p>${plbean.place_content}</p>
       		</div>
       		<div>
       			<span>썸네일</span>
       			<p>${plbean.place_thumb}</p>
       		</div>
        </div>

		<div class="btn-box">
	        <a class="btn btn-primary btn-margin" href="">수정</a>
	        <a class="btn btn-danger btn-margin" href="">삭제</a>
	        <a class="btn btn-default btn-margin" href="${pageContext.request.contextPath}/admin/place">목록</a>
		</div>
  
	</div> 
</section>
</body>
</html>