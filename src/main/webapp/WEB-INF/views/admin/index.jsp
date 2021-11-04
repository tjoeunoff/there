<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<%@ include file="template/include.jspf" %>
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
            <div class="container col-md-6">
                <div class="page-header">
                    <h3>장소 목록현황 <SMALL>현재까지 등록된 장소</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="col-md-2">장소 번호</th>
                            <th>장소 이름</th> 
                            <th>전화번호</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="#">4</a></td> <td><a href="#">location4</a></td> <td><a href="#">tel4</a></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td>location3</td>
                            <td>tel3</td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td>location2</td>
                            <td>tel2</td>
                        </tr>
                        <tr>
                            <td>1</td> 
                            <td>location1</td> 
                            <td>tel1</td>
                        </tr>
                    </tbody>
                </table>
            </div> 


            <!--회원 목록-->
            <div class="container col-md-6">
                <div class="page-header">
                    <h3>회원 현황 <SMALL>현재까지 가입한 회원 목록</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="col-md-2">회원 번호</th> 
                            <th>회원 아이디</th> 
                            <th>가입일</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td><a href="#">4</a></td> 
                            <td><a href="#">id04</a></td> 
                            <td><a href="#">1999-11-11</a></td>
                        </tr>
                        <tr>
                            <td>3</td> 
                            <td>id03</td>
                            <td>sign up</td>
                        </tr>
                        <tr>
                            <td>2</td> 
                            <td>id02</td> 
                            <td>sign up</td>
                        </tr>
                        <tr>
                            <td>1</td> 
                            <td>id01</td> 
                            <td>sign up</td>
                        </tr>
                    </tbody>
                </table>
            </div>         

            <!--매거진 글목록 -->
            <div class="container clear col-md-12 margin-b">
                <div class="page-header">
                    <h3>매거진 글 현황 <SMALL>현재까지 등록된 매거진 게시글</SMALL></h3>
                </div>

                <table class="table table-bordered table-hover">
                    <thead>
                        <tr>
                            <th class="col-md-1">글 번호</th> 
                            <th>매거진 제목</th>
                        </tr>
                    </thead>

                    <tbody>
                        <tr>
                            <td><a href="#">4</a></td>
                            <td><a href="#">magazine title 4</a></td>
                        </tr>
                        <tr>
                            <td>3</td> <td>magazine title 3</td> 
                        </tr>
                        <tr>
                            <td>2</td> <td>magazine title 2</td> 
                        </tr>
                        <tr>
                            <td>1</td> <td>magazine title 1</td> 
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>

        
</body>
</html>