<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/search.js"></script>
<style>
table a{
	text-decoration: none;
	display: block;
}
table a:hover{
	text-decoration: none;
}
</style>
</head>
<body>
<%@ include file="../template/header.jspf" %>

<section class="admin_contents" id="form_link05">
    <div class="container col-md-12">
        <div class="page-header">
            <h2>플레이스 목록 <SMALL>Place List</SMALL></h2>
        </div>
        
        <div class="form-group form-inline">
            <select class="form-control searchSelect"></select>
            <input type="text" class="form-control searchInput" placeholder="Search for ..."/>
            <button type="button" class="btn btn-default searchButton">검색</button>
            <a class="btn btn-default" href="${pageContext.request.contextPath}/admin/place" role="button">전체보기</a>
        </div>
        
        <div class="panel panel-default">
            <div class="panel-heading">
                현재 기준으로 등록된 플레이스들을 관리할 수 있습니다.
            </div>
        </div>            
        <table class="table table-bordered table-hover searchTable tableWithPage">
            <thead>
                <tr>
                    <th class="col-md-1">번호</th>
                    <th>카테고리</th>
                    <th class="col-md-2">플레이스명</th>
                    <th class="col-md-3">주소</th>
                    <th>전화번호</th>
                    <th>영업시간</th>
                    <th>조회수</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }" var="plbean">
            	<c:url value="${plbean.place_idx }" var="row"></c:url>
                <tr>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_idx }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_category }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_name }</a></td> 
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_addr }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_tel }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_opentime } - ${plbean.place_endtime }</a></td>
                    <td><a href="${pageContext.request.contextPath}/admin/place/${plbean.place_idx }">${plbean.place_viewcnt }</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <a class="btn btn-primary pull-right btn-margin" href="${pageContext.request.contextPath}/admin/place/form">입력</a>
    </div> 
</section>
</body>
</html>