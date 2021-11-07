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
                    <h2>장소 상세보기 <small>Add Location</small></h2>
                </div>

                <div class="panel panel-default">
                    <div class="panel-heading">
                        등록하고자 하는 장소의 정보와 전화번호 등을 입력해주세요.
                    </div>
                </div>

                <form action="#" method="POST" class="form-horizontal col-md-12">
                    <div class="form-group">
                        <label for="place_name" class="col-sm-2 control-label">장소 이름</label>
                        <div class="col-sm-10">
                            <input type="text" id="place_name" class="form-control" name="place_name" value="${plbean.place_name}" pattern=".{1,50}" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place_addr" class="col-sm-2 control-label">장소 주소</label>
                        <div class="col-sm-10">
                            <input type="text" id="place_addr" class="form-control" name="place_addr" value="${plbean.place_addr}" placeholder="128 자 이하" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place_opentime" class="col-sm-2 control-label">개점 시각</label>
                        <div class="col-sm-10">
                            <input type="text" id="place_opentime" class="form-control" name="place_opentime" value="${plbean.place_opentime}" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place_endtime" class="col-sm-2 control-label">폐점 시각</label>
                        <div class="col-sm-10">
                            <input type="text" id="place_endtime" class="form-control" name="place_endtime" value="${plbean.place_endtime}" pattern="[\d]{1,2}(:|시)\s?[\d]{1,2}분?" placeholder="OO시OO분" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place_tel" class="col-sm-2 control-label">전화 번호</label>
                        <div class="col-sm-10">
                            <input type="text" id="place_tel" class="form-control" name="place_tel" value="${plbean.place_tel}" required="">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="place_content" class="col-sm-2 control-label">상세 정보</label>
                        <div class="col-sm-10">
                            <textarea id="place_content" class="form-control" name="place_content" rows="10" required="">${bean.place_content}</textarea>
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="col-sm-2 control-label">카테고리</label>
                        <div class="form-check">
                            <span class="checkSpacer"></span>
                            <input class="form-check-input" type="text" value="${place_cateogry }" id="defaultCheck0" name="place_cateogry" ${isboxchecked[0]?"checked":""}="">
                            <label class="form-check-label" for="defaultCheck0">도서</label>

                        </div>
                    </div>

                    <!--삭제 기능 미구현 시 삭제 버튼을 삭제-->
                    <button type="submit" class="btn btn-primary pull-right btn-margin">입력</button>
                    <button type="reset" class="btn btn-default pull-right btn- margin">취소</button>
                    <button type="button" class="btn btn-default pull-right btn-margin" onclick="history.back();">뒤로가기</button>
                </form>
            </div> 
        </section>



</body>
</html>