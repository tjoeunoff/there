<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="template/include.jspf" %>
<style>
	#plTable a{
		display:block;
	}
	#mzTable a{
		display:block;
	}
</style>
</head>
<body>

<%@ include file="template/header.jspf" %>
	
        <!-- 메인 -->
        <section class="admin_contents" id="form_link01">
            <div class="page-header">
                <h2>관리자 메인 <SMALL>Admin Main</SMALL></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    매거진 글 목록, 장소 관리, 회원 리스트를 한 번에 볼 수 있습니다.<br /> <strong>수정 및 관리는 각각의 관리자 메뉴에서 실행해주세요.</strong>
                </div>
            </div>


            <!--장소 목록-->
            <div class="container col-md-6" id="plDiv">
                <div class="page-header">
                     <h3><a href="${pageContext.request.contextPath}/admin/place">장소 목록현황</a> <SMALL>현재까지 등록된 장소</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="plTable">
                    <thead>
                        <tr>
                            <th class="col-md-2">장소 번호</th>
                            <th>장소 이름</th> 
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${plList }" var="plbean" begin="0" end="3">
                        <tr>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_idx }</a></td>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_name }</a></td>
                        <td><a href="${pageContext.request.contextPath }/admin/place/${plbean.place_idx }">${plbean.place_tel }</a></td>
                        </tr>
					</c:forEach>
                    </tbody>
                </table>
            </div> 


            <!--회원 목록-->
            <div class="container col-md-6" id="mbrDiv">
                <div class="page-header">
                    <h3><a href="${pageContext.request.contextPath}/admin/member">회원 현황</a> <SMALL>현재까지 가입한 회원 목록</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="mbrTable">
                    <thead>
                        <tr>
                            <th class="col-md-2">회원 번호</th> 
                            <th>회원 아이디</th>
                            <th>회원 이름</th>
                            <th>회원 구분</th>
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${mbrList }" var="mbrbean" begin="0" end="3">
						<tr>
						<td>${mbrbean.member_idx }</td>
						<td>${mbrbean.member_id }</td>
						<td>${mbrbean.member_name }</td>
						<td>${mbrbean.member_authid }</td>
						<td>${mbrbean.member_registdate.getYear()+1900 }/${mbrbean.member_registdate.getMonth()+1 }/${mbrbean.member_registdate.getDate() }</td>
						</tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>         

            <!--매거진 글목록 -->
            <div class="container clear col-md-12 margin-b" id="mzDiv">
                <div class="page-header">
                    <h3><a href="${pageContext.request.contextPath}/admin/magazine">매거진 글 현황</a> <SMALL>현재까지 등록된 매거진 게시글</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover" id="mzTable">
                    <thead>
                        <tr>
                            <th class="col-md-1">글 번호</th> 
                            <th>매거진 제목</th>
                            <th>매거진 조회수</th>
                            <th>매거진 작성일</th>
                        </tr>
                    </thead>

                    <tbody>
                    <c:forEach items="${mzList }" var="mzbean" begin="0" end="3">
                    	<tr>
                    	<td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_idx }</a></td>
                    	<td><a href="${pageContext.request.contextPath}/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_subject }</a></td>
                    	<td><a href="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_viewcnt }</a></td>
                    	<td><a href="${pageContext.request.contextPath }/admin/magazine/${mzbean.magazine_idx }">${mzbean.magazine_date.getYear()+1900 }/${mzbean.magazine_date.getMonth()+1 }/${mzbean.magazine_date.getDate() }</a></td>
                    	</tr>
					</c:forEach>
                    </tbody>
                </table>
            </div>
        </section>
        
</body>
</html>