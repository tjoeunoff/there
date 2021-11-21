<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<script type="text/javascript">
$(document).ready(function(){
	$('#ConfirmBtn').click(function() {
		$('#myModal').modal('show');
		var member_id=$('#inputId3').val();
		var member_tel=$('#inputCellNum3').val();
		if(member_id.length==0){
			$('#modal-body').text('아이디를 입력해 주십시오.');
			return;
		} else if(member_tel.length==0){
			$('#modal-body').text('전화번호를 입력해 주십시오.');
			return;
		}
		$.post('./getpwans',{
			member_id: member_id,
			member_tel: member_tel
		},function(data){
			if(data.length==0){
				$('#modal-body').text('아이디와 전화번호를 정확히 입력해 주십시오.');
			} else{
				$('#modal-body').html('다음 비밀번호로 로그인 한 뒤 본 비밀번호를 변경해 주십시오.<br/>'+data);
			}
		});
		
    });
	
});
</script>
</head>

<body>
<%@ include file="../template/header.jspf" %>


	<main class="login-util-page">
        <div class="content-wrap">
	        <div class="tit-sect tac">
	            <div class="container">
	                <h2 class="sect-tit mb30">비밀번호 찾기 <span class="emoji">🤔</span></h2>
	            </div>
	        </div>

			<div class="container">
				<form class="form-horizontal" id="findPwForm">
				  <div class="form-group">
				    <label for="inputId3" class="col-sm-3 control-label">아이디</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="inputId3" placeholder="ID" />
				    </div>
				  </div>
				  <div class="form-group">
				    <label for="inputCellNum3" class="col-sm-3 control-label">전화번호</label>
				    <div class="col-sm-6">
				      <input type="text" class="form-control" id="inputCellNum3" placeholder="전화번호" />
				    </div>
				  </div>
				    <div class="form-group text-center">
						<button type="button" class="abtn abtn-mint" id="ConfirmBtn">비밀번호 찾기</button>
				  </div>
				</form>  
			</div>
		</div>
	</main>
	
	
    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">비밀번호 찾기</h4>
	      </div>
	      <div class="modal-body" id="modal-body">
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">
	        확인
	        </button>
	      </div>
	    </div>
	  </div>
	</div>

<%@ include file="../template/footer.jspf" %>
</body>
</html>