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
   <!-- email select style -->
    <style type="text/css">
        form>div>select {
            font-weight: normal;
            width: auto;
            height: 32px;
        }
    </style>

    <main class="mypage-page">
        <div class="content-wrap">
                <div class="tit-sect tac">
                    <div class="container">
                        <h2 class="sect-tit mb30">회원가입 🥳</h2>
                    </div>
                </div>
           <!-- 회원가입 입력 -->
    <form class="form-horizontal" method="post">
        <div class="form-group">
            <label for="inputId3" class="col-sm-2 control-label">아이디</label>
            <div class="col-sm-5">
                <input type="text" name="member_id" pattern=".{1,16}" class="form-control" id="inputId3" placeholder="중복확인필수">
            </div>
            <button type="button" class="btn btn-primary col-sm-1" id="inputIdConfirm3">확인</button>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-5">
                <input type="password" name="member_pw" pattern=".{1,16}" class="form-control" id="inputPassword3" placeholder="Password">
            </div>
        </div>
        <div class="form-group">
            <label for="inputPasswordConfirm3" class="col-sm-2 control-label">비밀번호확인</label>
            <div class="col-sm-5">
                <input type="password" class="form-control" id="inputPasswordConfirm3" placeholder="위의 비밀번호와 일치">
            </div>
        </div>
        <div class="form-group">
            <div class="alert alert-success col-sm-5 col-sm-offset-2" id="alert-success">비밀번호가 일치합니다.</div>
            <div class="alert alert-danger col-sm-5 col-sm-offset-2" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
            <div class="col-sm-2">
                <input type="text" name="member_email" pattern=".{1,32}" class="form-control" id="inputEmail3" placeholder="주소만 입력">
            </div>
        </div>
        <div class="form-group">
            <label for="inputName3" class="col-sm-2 control-label">이름</label>
            <div class="col-sm-5">
                <input type="text" name="member_name" pattern=".{1,16}" class="form-control" id="inputName3" placeholder="이름">
            </div>
        </div>
        <div class="form-group">
            <label for="inputCellNum3" class="col-sm-2 control-label">전화번호</label>
            <div class="col-sm-5">
                <input type="text" class="form-control" pattern=".{1,16}" id="inputCellNum3" placeholder="전화번호" name="member_tel" />
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button type="submit" class="btn btn-primary" id="completionBtn">완료</button>
                <button type="button" class="btn btn-defalut" onclick="history.back();">돌아가기</button>
            </div>
        </div>

    </form>
    <script type="text/javascript">
    $(function(){ 
     $("#alert-success").hide();
     $("#alert-danger").hide();
     $("input").keyup(function(){
         var inputPassword3=$("#inputPassword3").val();
         var inputPasswordConfirm3=$("#inputPasswordConfirm3").val(); 
         if(inputPassword3 != "" || inputPasswordConfirm3 != ""){ 
             if(inputPassword3 == inputPasswordConfirm3){
                 $("#alert-success").show();
                 $("#alert-danger").hide(); $("#submit").removeAttr("disabled");
                          
             }else{ 
                 $("#alert-success").hide();
                 $("#alert-danger").show();
                 $("#submit").attr("disabled", "disabled");
        
             }
         } 
     });
 });   
        $(function() {
            $('#completionBtn').attr('disabled', true);
            $('input').keyup(function() {
                    if ($('#inputId3').val() && $('#inputPassword3').val() && $('#inputPasswordConfirm3').val() && $('#inputEmail3').val() &&
                        $('#inputName3').val() && $('#inputCellNum3')) {
                        $('#completionBtn').attr('disabled', false);
                    } else {
                        $('input').keyup(function() {
                                if (!$('#inputId3').val() || !$('#inputPassword3').val() || !$('#inputPasswordConfirm3').val() || !$('#inputEmail3').val() ||
                                    !$('#inputName3').val() || !$('#inputCellNum3').val()){
                                  $('#completionBtn').attr('disabled', true);
                                }
                        });
                }
            });
        });
     
        $('#completionBtn').click(function(){
           alert('환영합니다.'); 
        });
    </script>
                </div>

        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->



<%@ include file="../template/footer.jspf" %>
</body>
</html>