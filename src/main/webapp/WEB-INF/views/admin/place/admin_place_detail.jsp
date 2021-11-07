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

<section class="admin_contents" id="form_link04" style="">
	<div class="container col-md-12">
		<div class="page-header">
        	<h2>장소 상세보기 <small>Place Detail</small></h2>
        </div>

        <div class="panel panel-default">
        	<div class="panel-heading">
            	선택하신 <strong>${plbean.place_name}</strong>에 대한 상세보기 페이지 입니다.
            </div>
        </div>
        <div class="table-responsive">
            <table class="table table-hover table-condensed table-bordered">
            	<tr>
                	<th class="col-md-1">장소 번호</th>
                    <th>장소 이름</th>
                    <th class="col-md-3">장소 주소</th>
                    <th>개점 시각</th>
                    <th>폐점 시각</th>
                    <th>전화 번호</th>
                    <th class="col-md-2">상세 정보</th>
                    <th class="col-md-2">카테고리</th>
                </tr>
	            <tr>
	                <td>${plbean.place_idx}</td>
	                <td>${plbean.place_name}</td>
	                <td>${plbean.place_addr}</td>
	                <td>${plbean.place_opentime}</td>
	                <td>${plbean.place_endtime}</td>
	                <td>${plbean.place_tel}</td>
	                <td>${plbean.place_content}</td>
	                <td>${plbean.place_category}</td>
	            </tr>
            </table>
        </div>

        <!--삭제 기능 미구현 시 삭제 버튼을 삭제-->
        <button type="submit" class="btn btn-primary pull-right btn-margin">입력</button>
        <button type="reset" class="btn btn-default pull-right btn- margin">취소</button>
        <button type="button" class="btn btn-default pull-right btn-margin" onclick="history.back();">뒤로가기</button>
  
	</div> 
</section>
</body>
</html>