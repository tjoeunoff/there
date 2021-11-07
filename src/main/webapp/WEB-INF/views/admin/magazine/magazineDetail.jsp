<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="../template/include.jspf" %>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
  $('#summernote').summernote();
});
</script>
</head>
<body>
	<%@ include file="../template/header.jspf" %>
    <!-- 매거진 등록 -->
    <section class="admin_contents" id="#">
        <div class="container col-md-12">
            <div class="page-header">
                <h2>매거진 수정 <SMALL>Modify Magazine</SMALL></h2>
            </div>
            <div class="panel panel-default">
                <div class="panel-heading">
                    관리자가 작성하는 매거진 게시판입니다.
                </div>
            </div>
            
            <form action="#" method="POST" class="form-horizontal col-md-12">
                
                <div class="form-group">
                    <label for="magazineSubject" class="col-sm-2 control-label">매거진 제목</label>
                    <div class="col-sm-10">
                        <input type="text" pattern=".{1,45}" id="magazineSubject" class="form-control" value="${bean.magazineSubject}" placeholder="45자이내" required />
                    </div>
                </div>
                <div class="form-group">
                    <label for="magazineContent" class="col-sm-2 control-label">매거진 내용</label>
                    <div class="col-sm-10">
						<textarea id="summernote" name="editordata" required></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label for="magazineThumb" class="col-sm-2 control-label">썸네일 업로드</label>
                    <input type="file" id="magazineThumb" value="${bean.magazineThumb}">
                </div>                   

                <div class="form-group">
                    <label for="magazineHashtag" class="col-sm-2 control-label">해시태그</label>
                    <div class="input-group-addon col-sm-1" id="magazineHashtag">#</div>
                    <div class="col-sm-9">
                        <input type="text" pattern=".{1,50}" id="magazineHashtag" class="form-control" value="${bean.magazineHashtag}" placeholder="50자 이내" aria-describedby="basic-addon1" required>
                    </div>
                </div>  
                
	            <div class="btn-group btn-group-justified" role="group" aria-label="...">
	                <div class="btn-group"><button type="submit" class="btn btn-primary">수정</button></div>
	                <div class="btn-group"><button type="button" class="btn btn-danger" data-toggle="modal" data-target="#mzDelModal">삭제</button></div>
	                <div class="btn-group"><button type="button" class="btn btn-default" onclick="history.back();">뒤로</button></div>
	            </div>                   
            </form>
            
            <!--삭제 기능을 위한 Modal 시작-->
	        <div class="modal fade" id="mzDelModal" tabindex="-1" role="dialog" aria-describedby="mzDelModalLabel">
	            <div class="modal-dialog" role="document">
	                <div class="modal-content">
	                    <div class="modal-header">
	                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span area-hidden="ture">&times;</span></button>
	                        <h4 class="modal-title" id="mzDelModalLabel">${bean.magazine_idx} 번 목록을 삭제하시겠습니까?</h4>
	                    </div>
	                    <form action="#" method="POST">
	                        <input type="hidden" name="_method" value="DELETE" />
	                        <input type="hidden" name="magazine_idx" value="${bean.magazine_idx}" />
	                        <div class="modal-footer">
	                            <div class="btn-group btn-group-justified" role="group" aria-label="...">
	                                <div class="btn-group"><button type="button" class="btn btn-default" data-dismiss="modal">취소</button></div>
	                                <div class="btn-group"><button type="submit" class="btn btn-danger">삭제</button></div>
	                            </div>
	                        </div>
	                    </form>
	                </div>
	            </div>
	        </div>
	        <!--삭제 기능을 위한 Modal 끝-->
        </div>
            
    </section>
</body>
</html>