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

   <main class="place-detail-page">
        <div class="content-wrap">
            <div class="top-banr-sect" style="background-image: url(${imgPath }/place/palce_thumb01.jpg);"> <!-- 장소detail 페이지는 장소등록 시 등록한 썸네일이 배경이미지로 들어감 -->
                <div class="container">
                    <ol class="breadcrumb">
                        <li><a href="#">Home</a></li>
                        <li><a href="">카테고리별</a></li>
                        <li class="active">야외 극장 👫</li>    <!-- 장소명 breadcrumb으로 넣기 -->
                    </ol>
                    </ol>
                    <div class="page-header mb40">
                        <h2 class="sect-tit mb30">카테고리별 추천 PLACE</h2>
                        <p class="sect-desc mb10">오늘은 이거어때 ❓</p>
                        <p></p>
                    </div>
                </div>
            </div>
            <!-- // top-banr-sect -->

            <div class="container">    
                <div class="place-view-wrap">
                    <div class="container">
                        <div class="view-util">
                            <p class="tags"><span>#성수 카페</span><span>#야간명소</span><span>#대형스크린</span><span>#성수핫플</span></p>  <!-- 장소 관련태그 -->
                            <ul>
                                <li class="util-show">👁️‍🗨️ <span>256</span></li> <!-- span안에 조회수 넣기 -->
                                <li class="util-like">❤️ <span>84</span></li> <!-- span안에 좋아요 수 넣기 / 클릭 시 바로 숫자 올라가야함  -->
                                <li class="util-star">⭐ <span>4.6</span></li> <!-- span안에 평점 넣기 -->
                                <li class="util-reivew">📝 <span>102</span></li> <!-- span안에 리뷰갯수 넣기 -->
                                <li><a href="">🔗</a></li> <!-- 공유하기 => 이부분은 시간여유 있으면 진행 -->
                            </ul>
                        </div>
                        <div class="place-info">
                            <div class="thumb">
                                <img src="../img/place/palce_thumb01_480x480.jpg" alt=""> <!-- 업로드하는 이미지 사이즈 고정 480x480 -->
                            </div>
                            <strong>카페</strong>  <!-- 해당 장소의 카테고리명 -->
                            <h3>성수 OO카페 👫</h3>  <!-- 장소명 -->
                            <p>하프 성수 플래그쉽 스토어인 '하프 언더바(halff underbar)'는 <br>
                                하프커피 아래의 바(bar), 공백을 채우는 기호 '_'언더바 두개의 중의적 의미를 내포하는 공간으로 
                                커피와 베이커리, 와인과 간단한 푸드까지 다양한 음식과 문화를 즐길 수 있는 공간입니다.
                            </p> <!-- 간단소개 -->
                            <div class="desc">
                                <ul>
                                    <li>📌<span>서울 성동구 서울숲4길 12 1층</span></li> <!-- 주소 -->
                                    <li>📞<span>070-7704-4877</span></li> <!-- 전화번호 -->
                                    <li>⏰<span>매일 11:00 - 22:00 L.O 21시 00분</span></li> <!-- 영업시간 -->
                                    <li>🏠<span>http://www.instagram.com/halff_coffeeroasters</span></li> <!-- 대표링크 -->
                                </ul>
                            </div>
                        </div>

                        <div class="place-action mb40">
                            <button type="button" class="" data-toggle="modal" data-target="#likeModal">이 장소 좋아요 ❤️</button>
                            <button>공유하기🔗</button>
                        </div>

                        <div class="place-review mb60">
                            <h4>📝 다녀온 회원 리뷰 <span>102</span>개</h4>  <!-- span안에 리뷰갯수 넣기 -->
                            <p>이 PLACE에 다녀온 사람들은 <strong>⭐<span>4.6</span></strong>만큼 만족했어요!</p> <!-- span안에 평점 넣기 -->
                            <div class="review-list">
                                <ul>
                                    <li>  <!-- 리뷰 불러오기 리뷰 1개마다 li로 생성 페이징처리할지 스크롤 처리할지 정하기 / 스크롤이 간단하긴함.. -->                         
                                        <span>⭐⭐⭐⭐</span>    <!-- 평점-->
                                        <p>아주 좋았어요 :D</p>     <!-- 리뷰내용 -->
                                        <p>2021-10-31</p>          <!-- 방문날짜 -->
                                    </li>
                                    <li>                   
                                        <span>⭐⭐⭐⭐</span>
                                        <p>아주 좋았어요 :D</p>
                                        <p>2021-10-31</p>
                                    </li>
                                    <li>
                                        <span>⭐⭐⭐⭐⭐</span>
                                        <p>아주아주아주아주아주 좋았어요 :D</p>
                                        <p>2021-10-31</p>
                                    </li>
                                    <li>
                                        <span>⭐⭐⭐⭐⭐</span>
                                        <p>아주아주아주아주아주 좋았어요 :D</p>
                                        <p>2021-10-31</p>
                                    </li>
                                    <li>
                                        <span>⭐⭐⭐⭐⭐</span>
                                        <p>아주아주아주아주아주 좋았어요 :D</p>
                                        <p>2021-10-31</p>
                                    </li>
                                </ul>
                            </div>
                            <div class="review-btns"> <!-- 리뷰버튼은 로그인O 일때만 노출됨 -->
                                <button type="button" class="abtn abtn-mint" data-toggle="modal" data-target="#reviewWriteModal">리뷰 작성하기</button>
                            </div>
                        </div>

                        <!-- 아래 지도 스크립트 수정 필요 => 장소등록시 설정한 좌표로 지도표현 -->
                        <div class="place-map mb40">
                            <div id="map" style="width:100%;height:300px;"></div>
                            <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f5bb9115d812a34ed32b190bd82edf"></script>
                            <script>
                            var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
                                mapOption = { 
                                    center: new kakao.maps.LatLng(37.54699, 127.09598), // 지도의 중심좌표
                                    level: 4 // 지도의 확대 레벨
                                };

                            var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

                            var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_red.png', // 마커이미지의 주소입니다    
                                imageSize = new kakao.maps.Size(64, 69), // 마커이미지의 크기입니다
                                imageOption = {offset: new kakao.maps.Point(27, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
                                
                            // 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
                            var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
                                markerPosition = new kakao.maps.LatLng(37.54699, 127.09598); // 마커가 표시될 위치입니다

                            // 마커를 생성합니다
                            var marker = new kakao.maps.Marker({
                                position: markerPosition, 
                                image: markerImage // 마커이미지 설정 
                            });

                            // 마커가 지도 위에 표시되도록 설정합니다
                            marker.setMap(map);  
                            </script>
                        </div>
    
                        <div class="view-foot">
                            <ul class="list-nav-btns">
                                <li><a href="">이전글</a></li>
                                <li><a href="">목록</a></li>
                                <li><a href="">다음글</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- container -->
                </div>
                <!-- // place-view-wrap -->

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


    <!-- 좋아요 클릭 시 알림창
            로그인O 상태 : ❤️+1 이 게시글을 좋아합니다.
            로그인X 상태 : 로그인이 필요한 서비스입니다.    
    -->
    <div class="modal fade like-modal" id="likeModal" tabindex="-1" role="dialog" aria-labelledby="likeModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <!-- 로그인O 시 -->
                    <h4 class="modal-title" id="likeModalLabel">❤️ + 1</h4>
                    <p>이 플레이스를 좋아합니다.</p>
                    <!-- // 로그인O 시 -->

                    <!-- 로그인X 시 -->
                    <!-- <h4 class="modal-title" id="likeModalLabel">🤗 로그인이 필요한 서비스입니다.</h4> -->
                    <!-- // 로그인X 시 -->
                </div>
                <div class="modal-footer">
                    <!-- 로그인O 시 -->
                    <button type="button" class="abtn abtn-mint" data-dismiss="modal">확인</button>
                    <!-- // 로그인O 시 -->

                    <!-- 로그인X 시 -->
                    <!-- <a class="abtn abtn-mint" href="../member/login.html">로그인페이지로 이동</a>
                    <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button> -->
                    <!-- // 로그인X 시 -->

                </div>
            </div>
        </div>
    </div>


    <!-- 리뷰작성 모달 -->
    <div class="modal fade like-modal" id="reviewWriteModal" tabindex="-1" role="dialog" aria-labelledby="reviewWriteModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">✏️ 리뷰 작성하기</h4>
                </div>
                <form action="" method="post">
                    <div class="modal-body">
                        <div class="form-group">
                            <span>방문 장소</span>
                            <p>성수 OO 카페</p> <!-- 해당페이지의 플레이스명 -->
                        </div>
                        <div class="form-group">
                            <label for="visitDate">방문 날짜</label>
                            <input type="text" id="visitDate" name="visitDate"> <!-- datepicker로 날짜 선택 -->
                            <span class="date-icon">📅 날짜선택</span>
                            <script>
                                $(function(){ 
                                    $('#visitDate').datepicker({
                                        format: "yyyy-mm-dd DD",
                                        language: "ko",
                                        endDate: "0d"
                                    });

                                    $('.date-icon').on('click', function(){
                                        $('#visitDate').focus();
                                    });

                                });
                            </script>
                        </div>
                        <div class="form-group">
                            <span>평점</span>
                            <div class="select-star">
                                <label class="radio-star" for="star1">
                                    <input type="radio" name="star" id="star1" value="1">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star2">
                                    <input type="radio" name="star" id="star2" value="2">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star3">
                                    <input type="radio" name="star" id="star3" value="3">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star4">
                                    <input type="radio" name="star" id="star4" value="4">
                                    <span></span>
                                </label>
                                <label class="radio-star" for="star5">
                                    <input type="radio" name="star" id="star5" value="5">
                                    <span></span>
                                </label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="reviewCnt">리뷰</label>
                            <textarea name="reviewCnt" id="reviewCnt"></textarea>
                        </div>

       
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="abtn abtn-gray" data-dismiss="modal">취소</button>
                        <button type="submit" class="abtn abtn-mint">리뷰 등록</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    
<%@ include file="../template/footer.jspf" %>
</body>
</html>