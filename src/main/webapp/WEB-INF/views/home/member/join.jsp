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
                <input type="text" name="member_id" pattern=".{1,16}" class="form-control" id="inputId3" placeholder="중복확인필수, 최대 16 자">
            </div>
            <button type="button" class="btn btn-primary col-sm-1" id="inputIdConfirm3">확인</button>
        </div>
        <div class="form-group">
            <div class="alert alert-success col-sm-5 col-sm-offset-2" id="id-alert-success">사용할 수 있는 아이디입니다.</div>
            <div class="alert alert-danger col-sm-5 col-sm-offset-2" id="id-alert-danger">사용할 수 없는 아이디입니다.</div>
            <div class="alert alert-warning col-sm-5 col-sm-offset-2" id="id-alert-warning">아이디 중복 체크를 수행하여 주십시오.</div>
        </div>
        <div class="form-group">
            <label for="inputPassword3" class="col-sm-2 control-label">비밀번호</label>
            <div class="col-sm-5">
                <input type="password" name="member_pw" pattern=".{1,16}" class="form-control" id="inputPassword3" placeholder="Password, 최대 16 자">
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
            <label for="inputName3" class="col-sm-2 control-label">이름</label>
            <div class="col-sm-5">
                <input type="text" name="member_name" pattern=".{1,16}" class="form-control" id="inputName3" placeholder="이름, 최대 16 자">
            </div>
        </div>
        <div class="form-group">
            <label for="inputEmail3" class="col-sm-2 control-label">이메일</label>
            <div class="col-sm-5">
                <input type="email" name="member_email" pattern=".{1,32}" class="form-control" id="inputEmail3" placeholder="중복확인필수, E-mail, 최대 32 자">
            </div>
            <button type="button" class="btn btn-primary col-sm-1" id="inputEmailConfirm3">확인</button>
        </div>
        <div class="form-group">
            <div class="alert alert-success col-sm-5 col-sm-offset-2" id="email-alert-success">사용할 수 있는 이메일입니다.</div>
            <div class="alert alert-danger col-sm-5 col-sm-offset-2" id="email-alert-danger">사용할 수 없는 이메일입니다.</div>
            <div class="alert alert-warning col-sm-5 col-sm-offset-2" id="email-alert-warning">이메일 중복 체크를 수행하여 주십시오.</div>
        </div>
        <div class="form-group">
            <label for="inputCellNum3" class="col-sm-2 control-label">전화번호</label>
            <div class="col-sm-5">
                <input type="te" class="form-control" pattern=".{1,16}" id="inputCellNum3" placeholder="중복확인필수, 전화번호, 최대 16 자" name="member_tel" />
            </div>
            <button type="button" class="btn btn-primary col-sm-1" id="inputTelConfirm3">확인</button>
        </div>
        <div class="form-group">
            <div class="alert alert-success col-sm-5 col-sm-offset-2" id="tel-alert-success">사용할 수 있는 전화번호입니다.</div>
            <div class="alert alert-danger col-sm-5 col-sm-offset-2" id="tel-alert-danger">사용할 수 없는 전화번호입니다.</div>
            <div class="alert alert-warning col-sm-5 col-sm-offset-2" id="tel-alert-warning">전화번호 중복 체크를 수행하여 주십시오.</div>
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
		var validityArr=[false,false,false,false];
		const ID_IDX=0;
		const PW_IDX=1;
		const EMAIL_IDX=2;
		const TEL_IDX=3;
		$('#id-alert-success').hide();
		$('#id-alert-danger').hide();
		$('#id-alert-warning').hide();
		$('#email-alert-success').hide();
		$('#email-alert-danger').hide();
		$('#email-alert-warning').hide();
		$('#tel-alert-success').hide();
		$('#tel-alert-danger').hide();
		$('#tel-alert-warning').hide();
		$("#alert-success").hide();
		$("#alert-danger").hide();
		$('#completionBtn').attr('disabled', true);
		$("input").keyup(function(){
			var inputPassword3=$("#inputPassword3").val();
			var inputPasswordConfirm3=$("#inputPasswordConfirm3").val(); 
			if(inputPassword3 != "" || inputPasswordConfirm3 != ""){ 
				if(inputPassword3 == inputPasswordConfirm3){
					$("#alert-success").show();
                	$("#alert-danger").hide(); 
                	//$("#submit").removeAttr("disabled");
                	validityArr[PW_IDX]=true;
            	}else{ 
                	$("#alert-success").hide();
                	$("#alert-danger").show();
                	//$("#submit").attr("disabled", "disabled");
                	validityArr[PW_IDX]=false;
        		}
			} 
     	});
		
		//아이디 타당성 점검
		$('#inputId3').keyup(function(){
			validityArr[ID_IDX]=false;
			$('#id-alert-success').hide();
			$('#id-alert-danger').hide();
			$('#id-alert-warning').show();
		});
		$('#inputIdConfirm3').click(function(){
			var member_id=$('#inputId3').val();
			if(member_id.length==0){
				validityArr[ID_IDX]=false;
				$('#id-alert-danger').show();
				return;
			}
			$('#id-alert-success').hide();
			$('#id-alert-danger').hide();
			$('#id-alert-warning').hide();
			$.post("./checkid",{
				member_id: member_id
			},function(data){
				if(data){ //if the id input is valid
					validityArr[ID_IDX]=true;
					$('#id-alert-success').show();
				} else{ //if the id input is invalid
					validityArr[ID_IDX]=false;
					$('#id-alert-danger').show();
				}
				if ($('#inputId3').val() && $('#inputPassword3').val() && $('#inputPasswordConfirm3').val() && $('#inputEmail3').val() &&
	                	$('#inputName3').val() && $('#inputCellNum3').val() && isArrValid(validityArr)) {
	                    $('#completionBtn').attr('disabled', false);
	            } else {
	            	$('input').keyup(function() {
	                	if (!$('#inputId3').val() || !$('#inputPassword3').val() || !$('#inputPasswordConfirm3').val() || !$('#inputEmail3').val() ||
	                    	!$('#inputName3').val() || !$('#inputCellNum3').val() || !isArrValid(validityArr)){
	                    	$('#completionBtn').attr('disabled', true);
	                    }
	               	});
	            }
			});
		});
		
		//이메일 타당성 점검
		$('#inputEmail3').keyup(function(){
			validityArr[EMAIL_IDX]=false;
			$('#email-alert-success').hide();
			$('#email-alert-danger').hide();
			$('#email-alert-warning').show();
		});
		$('#inputEmailConfirm3').click(function(){
			var member_email=$('#inputEmail3').val();
			if(member_email.length==0){
				validityArr[EMAIL_IDX]=false;
				$('#email-alert-danger').show();
				return;
			}
			$('#email-alert-success').hide();
			$('#email-alert-danger').hide();
			$('#email-alert-warning').hide();
			$.post("./checkemail",{
				member_email: member_email
			},function(data){
				if(data){ //if the email input is valid
					validityArr[EMAIL_IDX]=true;
					$('#email-alert-success').show();
				} else{ //if the email input is invalid
					validityArr[EMAIL_IDX]=false;
					$('#email-alert-danger').show();
				}
				if ($('#inputId3').val() && $('#inputPassword3').val() && $('#inputPasswordConfirm3').val() && $('#inputEmail3').val() &&
	                	$('#inputName3').val() && $('#inputCellNum3').val() && isArrValid(validityArr)) {
	                $('#completionBtn').attr('disabled', false);
	            } else {
	            	$('input').keyup(function() {
	                	if (!$('#inputId3').val() || !$('#inputPassword3').val() || !$('#inputPasswordConfirm3').val() || !$('#inputEmail3').val() ||
	                    	!$('#inputName3').val() || !$('#inputCellNum3').val() || !isArrValid(validityArr)){
	                    	$('#completionBtn').attr('disabled', true);
	                    }
	               	});
	            }
			});
		});
		
		//전화번호 타당성 점검
		$('#inputCellNum3').keyup(function(){
			validityArr[TEL_IDX]=false;
			$('#tel-alert-success').hide();
			$('#tel-alert-danger').hide();
			$('#tel-alert-warning').show();
		});
		$('#inputTelConfirm3').click(function(){
			var member_tel=$('#inputCellNum3').val();
			if(member_tel.length==0){
				validityArr[TEL_IDX]=false;
				$('#tel-alert-danger').show();
				return;
			}
			$('#tel-alert-success').hide();
			$('#tel-alert-danger').hide();
			$('#tel-alert-warning').hide();
			$.post("./checktel",{
				member_tel: member_tel
			},function(data){
				if(data){ //if the tel input is valid
					validityArr[TEL_IDX]=true;
					$('#tel-alert-success').show();
				} else{ //if the tel input is invalid
					validityArr[TEL_IDX]=false;
					$('#tel-alert-danger').show();
				}
				if ($('#inputId3').val() && $('#inputPassword3').val() && $('#inputPasswordConfirm3').val() && $('#inputEmail3').val() &&
	                	$('#inputName3').val() && $('#inputCellNum3').val() && isArrValid(validityArr)) {
	                    $('#completionBtn').attr('disabled', false);
	            } else {
	            	$('input').keyup(function() {
	                	if (!$('#inputId3').val() || !$('#inputPassword3').val() || !$('#inputPasswordConfirm3').val() || !$('#inputEmail3').val() ||
	                    	!$('#inputName3').val() || !$('#inputCellNum3').val() || !isArrValid(validityArr)){
	                    	$('#completionBtn').attr('disabled', true);
	                    }
	               	});
	            }
			});
		});
		
		$('input').keyup(function() {
        	if ($('#inputId3').val() && $('#inputPassword3').val() && $('#inputPasswordConfirm3').val() && $('#inputEmail3').val() &&
            	$('#inputName3').val() && $('#inputCellNum3').val() && isArrValid(validityArr)) {
                $('#completionBtn').attr('disabled', false);
            } else {
                $('input').keyup(function() {
                	if (!$('#inputId3').val() || !$('#inputPassword3').val() || !$('#inputPasswordConfirm3').val() || !$('#inputEmail3').val() ||
                        !$('#inputName3').val() || !$('#inputCellNum3').val() || !isArrValid(validityArr)){
                    	$('#completionBtn').attr('disabled', true);
                    }
                });
            }
       	});
	});
	
	function isArrValid(validityArr){
		for(var i=0;i<validityArr.length;i++){
			if(!validityArr[i]) return false;
		}
		return true;
	}
	

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