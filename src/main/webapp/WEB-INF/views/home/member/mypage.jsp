<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <%@ include file="../template/include.jspf" %>
    
    <script type="text/javascript">
    $(document).ready(function(){
    	$('#tel-alert-danger').hide();
    	$('#email-alert-danger').hide();
    	$('#modalSubmit').attr('disabled',false);
    	
    	$('#myModal input').keyup(function(){
    		
    		var member_id='${mbrbean.member_id}';
    		var member_pw=$('#modal_pw').val();
        	var member_tel=$('#modal_tel').val();
        	var member_email=$('#modal_email').val();
        	if(member_pw.length==0 || member_tel.length==0 || member_email.length==0){
        		$('#modalSubmit').attr('disabled',true);
        		return;
        	}
        	
        	$.post('./checknewemail',{
				member_id: member_id,
				member_email: member_email
			},function(data){
				if(!data){
					$('#email-alert-danger').show();
					$('#modalSubmit').attr('disabled',true);
					return;
				} else{
					$('#email-alert-danger').hide();	
				}
			});
        	
        	$.post('./checknewtel',{
				member_id: member_id,
				member_tel: member_tel
			},function(data){
				if(!data){
					$('#tel-alert-danger').show();
					$('#modalSubmit').attr('disabled',true);
					return;
				} else{
					$('#tel-alert-danger').hide();
				}
			});
        	
			$('#modalSubmit').attr('disabled',false);
        		
    	});
    	
    });
    
    </script>

</head>
<body>
	<%@ include file="../template/header.jspf" %> 


    <main class="mypage-page">
        <div class="content-wrap">
                <div class="tit-sect tac">
                    <div class="container">
                        <h2 class="sect-tit mb30">마이페이지 🧐</h2>
                        <p class="sect-desc mb10">개인정보 조회/수정</p>
                    </div>
                </div>

                <div class="my-info-sect mb100">
                    <div class="container">
                        <div>
                            <ul>
                                <li>
                                    <span>아이디</span>
                                    <p>${mbrbean.member_id }</p>
                                </li>
                                <li>
                                    <span>비밀번호</span>
                                    <p><c:forEach var="i" begin="1" end="${mbrbean.member_pw.length()}">*</c:forEach></p>
                                </li>
                                <li>
                                    <span>이름</span>
                                    <p>${mbrbean.member_name} </p>
                                </li>
                                <li>
                                    <span>전화번호</span>
                                    <p>${mbrbean.member_tel }</p>
                                </li>
                                <li>
                                    <span>이메일</span>
                                    <p>${mbrbean.member_email }</p>
                                </li>
                            </ul>
                        </div>
                        <button type="button" class="btn btn-modi" data-toggle="modal" data-target="#myModal">개인정보수정 ⚙️</button> <!-- 모달창 띄워서 수정하기 -->
                    </div>
                </div>

                <div class="my-activity-sect">
                    <div class="container">
                        <div class="my-like-places mb100">
                            <div class="my-tit">
                                <h3 class="mb30">내가 ❤️좋아하는 장소</h3> <!-- 최근 좋아요누른 장소 4개만 노출 -->
                                <a class="abtn abtn-mint" href="">더보기</a> <!-- 더보기 구현하면 좋으나 우선 버튼만 있는걸로 -->
                            </div>
                            <div>
                                <ul class="row">
                                <c:forEach items="${myPlList}" var="plbean" begin="0" end="4">
                                
                                    <li class="col-md-3">
                                        <div class="img-wrap">
                                            <div style="background-image: url(${pageContext.request.contextPath}/resources/img/place/${plbean.place_thumb} );"></div>  <!-- 내가 좋아요한 장소 썸네일, 장소명 가져오기 -->
                                        </div>
                                        <strong>${plbean.place_name} </strong>
                                    </li>
                                 </c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="my-like-magazines mb100">
                            <div class="my-tit">
                                <h3 class="mb30">내가 ❤️좋아하는 매거진</h3>  <!-- 최근 좋아요누른 매거진 4개만 노출 -->
                                <a class="abtn abtn-mint" href="">더보기</a> <!-- 더보기 구현하면 좋으나 우선 버튼만 있는걸로 -->
                            </div>
                            <div>
                                <ul class="row">
                                <c:forEach items="${myMzList}" var="mzbean" begin="0" end="4">
                                    <li class="col-md-3">
                                        <div class="img-wrap">
                                            <div style="background-image: url(${pageContext.request.contextPath}/resources/img/magazine/${mzbean.magazine_thumb});"></div>  <!-- 내가 좋아요한 포스팅 썸네일, 제목 가져오기 -->
                                        </div>
                                        <strong>${mzbean.magazine_subject }</strong>
                                    </li>
								</c:forEach>
                                </ul>
                            </div>
                        </div>
                        <div class="my-reviews">
                            <div class="my-tit">
                                <h3 class="mb30">내가 작성한 리뷰 📝</h3>  <!-- 최근 작성한 리뷰 3개만 노출 -->
                                <a class="abtn abtn-mint" href="">더보기</a> <!-- 더보기 구현하면 좋으나 우선 버튼만 있는걸로 -->
                            </div>
                            <div class="review-list">
                                <ul>
                                <c:forEach items="${myRvList}" var="rvbean" begin="0" end="3">
                                    <li>
                                        <span><c:forEach var="i" begin="1" end="${rvbean.review_score}">⭐</c:forEach></span>
                                        <p>${rvbean.review_content }</p>
                                    </li>
                             	</c:forEach>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>





        </div>
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->


    <footer id="footer">
    <div class="container">
        <div class="foot-info-link">
            <p>&copy; 2021 OFFLineTeam All Rights Reserved.</p>
        </div>

    </div>
    </footer>
    <!-- // footer -->




    <!-- 개인정보 수정 모달 -->
    <div class="my-info-edit modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <h4 class="modal-title" id="myModalLabel">개인정보 수정</h4>
            </div>
            
            <form action="${pageContext.request.contextPath }/member/change" method="post" class="form-horizontal">
            	<input type="hidden" name="member_id" value="${mbrbean.member_id }" />
            	<input type="hidden" name="member_name" value="${mbrbean.member_name }" />
            	<div class="modal-body">
					<div class="form-group">
						<label for="inputId3" class="col-sm-2 control-label">아이디</label>
						<div class="col-sm-5">${mbrbean.member_id }</div>
					</div>
					<div class="form-group">
						<label for="modal_pw" class="col-sm-2 control-label">비밀번호</label>
						<div class="col-sm-5"><input type="password" name="member_pw" value="${mbrbean.member_pw }" id="modal_pw" pattern=".{1,16}" placeholder="비밀번호, 최대 16 자" /></div>
					</div>
					<div class="form-group">
						<label for="inputName3" class="col-sm-2 control-label">이름</label>
						<div class="col-sm-5">${mbrbean.member_name }</div>
					</div>
					<div class="form-group">
						<label for="modal_tel" class="col-sm-2 control-label">전화번호</label>
						<div class="col-sm-5"><input type="tel" name="member_tel" value="${mbrbean.member_tel }" id="modal_tel" pattern=".{1,16}" placeholder="전화번호, 최대 16 자" /></div>
						
					</div>
					<div class="alert alert-danger" id="tel-alert-danger">사용할 수 없는 전화번호입니다.</div>
					<div class="form-group">
						<label for="modal_email" class="col-sm-2 control-label">이메일</label>
						<div class="col-sm-5"><input type="email" name="member_email" value="${mbrbean.member_email }" id="modal_email" pattern=".{1,32}" placeholder="이메일, 최대 32 자" /></div>
					</div>
					<div class="alert alert-danger" id="email-alert-danger">사용할 수 없는 이메일입니다.</div>
				</div>

	            
	            <div class="modal-footer">
	                <button type="button" class="btn" data-dismiss="modal">Close</button>
	                <button type="submit" class="btn" id="modalSubmit">Save changes</button>
	            </div>
            </form>
            
        </div>
        </div>
    </div>



</body>
</html>