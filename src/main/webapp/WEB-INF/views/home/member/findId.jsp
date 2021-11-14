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


    <main class="login-util-page">
        <div class="content-wrap">
                <div class="tit-sect tac">
                    <div class="container">
                        <h2 class="sect-tit mb30">아이디 찾기 🤔</h2>
                    </div>
                </div>

                 <form class="form-horizontal">
        <div class="form-group">
            <label for="inputName3" class="col-sm-2 control-label">이름</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="inputName3" placeholder="이름">
            </div>
        </div>
        <div class="form-group">
            <label for="inputCellNum3" class="col-sm-2 control-label">전화번호</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" id="inputCellNum3" placeholder="주민번호">
            </div>
        </div>

        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="button" class="btn btn-primary" id="ConfirmBtn">확인</button>
                <button type="submit" class="btn btn-default">취소</button>
                <button type="submit" class="btn btn-defalut"><a href="/dept/login.html">돌아가기</a></button>
            </div>
        </div>
    </form>

    <!-- model -->
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">아이디 찾기</h4>
                </div>
                <div class="modal-body">
                    회원님의 아이디는 ... 입니다.
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">
                        확인
                    </button>
                </div>
            </div>
        </div>
    </div>

    <script>
        $('#ConfirmBtn').click(function() {
            if($('#inputName3').val() && $('#inputCellNum3').val()){
                $('#myModal').modal('show');
            } 
              else {

                $('#inputName3').each(function() {
                        if (!$(this).val()) {
                            is_empty = true;
                            alert('이름을 입력하세요');
                        }
                    
                        $('#inputCellNum3').each(function() {
                            if (!$(this).val()) {
                                is_empty = true;
                                alert('전화번호를 입력하세요');
                            }
                        });

                });
            } 
        });
    </script>
        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->

<%@ include file="../template/footer.jspf" %>
</body>
</html>