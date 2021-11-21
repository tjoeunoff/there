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
    	
    	// 슬라이더
    	var listSlider = new Swiper(".list-slider", {
	        slidesPerView: 1,
	        spaceBetween: 20,
	        navigation: {
	            nextEl: ".slide-next",
	            prevEl: ".slide-prev",
	        },
	        breakpoints: {
	            // when window width is >= 480px
	            480: {
	                slidesPerView: 1.4,
	                spaceBetween: 20,
	            },
	            // when window width is >= 640px
	            640: {
	                slidesPerView: 1.8,
	                spaceBetween: 20,
	            },
	            // when window width is >= 992px
	            992: {
	                slidesPerView: 1.8,
	                spaceBetween: 20,
	            },
	            // when window width is >= 1320px
	            1200: {
	                slidesPerView: 3.5,
	                spaceBetween: 20,
	            },
	        }
	
	    });
    	
    	
    	// show hashtag
    	var tagsArr = new Array();
    	$.each($('.hidden-tags'), function(idx, ele){
    		tagsArr[idx] = $(this).text();
    	});
    	$('.hidden-tags').hide();
    	
    	const hashArr = new Array();
    	tagsArr.forEach(function(ele, idx){
    		hashArr[idx] = ele.split(';');
    		
    		hashArr[idx].forEach(function(ele2, idx2){
    			$('.list-item').eq(idx).find('p.tags').append('<span>#' + ele2 + '</span>');
    		});
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
                        <h2 class="sect-tit mb30">마이페이지 <span class="emoji">🧐</span></h2>
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
                        <div style="width:450px; margin:0 auto;">
	                        <button type="button" class="btn btn-modi" data-toggle="modal" data-target="#myModal">개인정보수정 ⚙️</button> <!-- 모달창 띄워서 수정하기 -->
	                        <c:if test="${sessionScope.sessionAuth ne 1}">
	                        	<button type="button" class="btn btn-modi" data-toggle="modal" data-target="#delModal">회원 탈퇴 ⚙️</button>
	                        </c:if>
	                    </div>    
                    </div>
                </div>
                <!-- // my-info-sect -->

                <div class="my-activity-sect">
                    <div class="container">
                        <div class="my-like-places mb100">
                            <div class="my-tit">
                                <h3 class="mb30">내가 <span class="emoji">❤️</span>좋아하는 장소</h3> <!-- 최근 좋아요누른 장소 4개만 노출 -->
                            </div>
							<div class="weekly-magazine-sect">
								<div class="swiper list-slider">
									<div class="swiper-wrapper">
										<c:forEach items="${myPlList }" var="plbean" begin="0" end="3">
											<div class="swiper-slide list-item">
												<a
													href="${pageContext.request.contextPath}/place/${plbean.place_idx }">
													<!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
													<div class="thumb-img" style="background-image: url(${imgPath }/place/${plbean.place_thumb });"></div>
													<div class="thumb-desc">
														<strong>${plbean.place_name }</strong>
														<!-- 게시글 제목 -->
														<p class="tags"></p>
														<p class="hidden-tags">${plbean.place_hashtag }</p>
														<!-- 게시글 관련태그 => 게시물 등록시 작성필요 -->
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
									<div class="slide-next">👉</div>
									<div class="slide-prev">👈</div>
								</div>
							</div>
						</div>
						<!-- // my-like-places -->
						
						<div class="my-like-magazines mb100">
							<div class="my-tit">
								<h3 class="mb30">내가 <span class="emoji">❤️</span>좋아하는 매거진</h3>
								<!-- 최근 좋아요누른 매거진 4개만 노출 -->
							</div>
							<div class="weekly-magazine-sect">
								<div class="swiper list-slider">
									<div class="swiper-wrapper">
										<c:forEach items="${myMzList }" var="mzbean" begin="0" end="3">
											<div class="swiper-slide list-item">
												<a
													href="${pageContext.request.contextPath}/magazine/${mzbean.magazine_idx }">
													<!-- 썸네일의 경우 img태그가 아닌 background-image로 -->
													<div class="thumb-img" style="background-image: url(${imgPath }/magazine/${mzbean.magazine_thumb });"></div>
													<div class="thumb-desc">
														<strong>${mzbean.magazine_subject }</strong>
														<!-- 게시글 제목 -->
														<p class="tags"></p>
														<p class="hidden-tags">${mzbean.magazine_hashtag }</p>
														<!-- 게시글 관련태그 => 게시물 등록시 작성필요 -->
													</div>
												</a>
											</div>
										</c:forEach>
									</div>
									<div class="slide-next">👉</div>
									<div class="slide-prev">👈</div>
								</div>
							</div>
						</div>
						<!-- // my-like-magazines -->

						<div class="my-reviews">
							<div class="my-tit">
								<h3 class="mb30">내가 작성한 리뷰 <span class="emoji">📝</span></h3>  <!-- 최근 작성한 리뷰 3개만 노출 -->
	                        </div>
	                        <div class="review-list">
								<ul>
									<c:forEach items="${myRvList}" var="rvbean">
									<li>
	                                	<span><c:forEach var="i" begin="1" end="${rvbean.review_score}">⭐</c:forEach></span>
	                               		<p>${rvbean.review_content }</p>
	                            	</li>
	                             	</c:forEach>
	                            </ul>
	                        </div>
	                    </div>
	                    <!-- // my-reviews -->
                   	</div>
                   	<!-- // container -->
        		</div>
        		<!-- // my-activity-sect -->
        		
        <!-- // content-wrap  -->

    </main>
    <!-- // main -->


    <%@ include file ="../template/footer.jspf" %>
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
	        <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
    </div>
	
	<!-- 개인정보 삭제 모달 -->
	<div class="my-info-edit modal fade" tabindex="-1" role="dialog" id="delModal" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title">확인</h4>
				</div>
				<div class="modal-body">
					<p>${mbrbean.member_id } 회원 탈퇴를 하시겠습니까?</p>
				</div>
				<form method="post" action="${pageContext.request.contextPath }/member/out">
					<input type="hidden" name="member_id" value="${mbrbean.member_id }"/>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
						<button type="submit" class="btn btn-danger">탈퇴</button>
					</div>
				</form>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>

</body>
</html>