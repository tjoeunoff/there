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

<section class="admin_contents" id="form_link05">
    <div class="container col-md-12">
        <div class="page-header">
            <h2>장소 목록 <SMALL>Location List</SMALL></h2>
        </div>
        <div class="panel panel-default">
            <div class="panel-heading">
                현재 기준으로 등록된 장소만을 관리할 수 있습니다.
            </div>
        </div>            
        <table class="table table-bordered table-hover">
            <thead>
                <tr>
                    <th class="col-md-1">장소 번호</th> <th class="col-md-9">장소 이름</th> <th>전화번호</th>
                </tr>
            </thead>
            <tbody>
            	<c:forEach items="${list }" var="bean">
                <tr>
                    <td><a href="#">${bean.placeIdx }</a></td> <td><a href="#">location4</a></td> <td><a href="#">tel4</a></td>
                </tr>
                </c:forEach>
            </tbody>
        </table>
        <button type="submit" class="btn btn-primary pull-right btn-margin">입력</button>
    </div> 
</section>
</body>
</html>