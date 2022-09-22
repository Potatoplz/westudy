<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeStudy | 스터디 모집 상세</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<link rel="stylesheet" href="/resources/study/study_detail.css">
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>

		<div class="cnt_wrapper">
			<section class="cnt_header">
				<div class="cnt_title" id="study_name">경력 실무자 사이트 프로젝트 멤버 모집</div>
				<div class="cnt_userdate">
					<div class="cnt_user">
						<img class="cnt_userImg" src="https://hola-post-image.s3.ap-northeast-2.amazonaws.com/default.PNG" alt="userImg">
						<div class="cnt_userName" id="member_nick">똘똘이</div>
					</div>
					<div class="cnt_registeredDate" id="study_writedate">2022.09.21</div>
				</div>
				
				<ul class="studyInfo_studyGrid__38Lfj"><!-- 주의:ul은 class명바꾸면 적용안됨. 왜지? -->
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">스터디 종류</span>
						<span class="studyInfo_Cnt" id="study_type">출석/인증</span>
					</li>
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">모집 인원</span>
						<span class="studyInfo_Cnt" id="recruit_cnt">5명</span>
					</li>
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">진행 방식</span>
						<span class="studyInfo_Cnt" id="onoff">온라인</span>
					</li>
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">시작 예정일</span>
						<span class="studyInfo_Cnt" id="start_date">2022.09.21</span>
					</li>
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">종료 예정일</span>
						<span class="studyInfo_Cnt" id="end_date">2022.09.21</span>
					</li>
					<li class="studyInfo_CntWrapper">
						<span class="studyInfo_title">희망 지역</span>
						<span class="studyInfo_Cnt" id="study_city">선택안함(온라인)</span>
					</li>
				</ul>
			</section>
			
			<!-- 내용 -->
			<div class="studyCnt_postCntWrapper">
			<h2 class="studyCnt_postInfo">스터디 소개</h2>
			<div class="studyCnt_postCnt" id="study_content"><p>안녕하세요.</p></div>
			</div>
			
			<br>
			<div class="commentInput_buttonWrapper">
				<button class="btn btn-info" name="register">지원하기</button>
				<button class="btn btn-warning" name="register">지원취소</button>
			</div>
			
			
			<!-- 댓글 -->
			
			<section class="studyContent_commentAndViews">
				<div class="studyContent_postComment">
					<div class="commentInput_commentInput">
						<h1 class="commentInput_commentCount">0개의 댓글이 있습니다.</h1>
						<textarea class="commentInput_commentText" placeholder="댓글을 입력하세요."></textarea>
						<div class="commentInput_buttonWrapper">
							<button class="commentInput_buttonComplete" name="register">댓글 등록</button>
						</div>
					</div>
						<ul class="commentList_CommentList"></ul>
				</div>
			</section>
			
			
		</div><!-- cnt-wrapper -->
		
		
		
		
		
		

		
		
		
		
		
		
		<div id="delete_div" class="text-right">
			<button class="btn btn-danger" id="delete_btn"> 게 시 글 삭 제 </button>
		</div>
<%-- 		<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#delete_btn").click(function() {

				$.ajax({
					type : "DELETE"
					, url : "${pageContext.request.contextPath}/study_rest/${study_id}"
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result, status, xhr) {
						if(result > 0) {
							alert("삭제 성공");
							location.href = "${pageContext.request.contextPath}/study/list";
						}//if
					}//success
				});//ajax

			});//click
		});//ready
		</script>

		<script type="text/javascript">
		$("#delete_div").hide();
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/${study_id}"
					, {}
					, function( data, status ) {
						$("#study_name").text( data.study_name );
						$("#study_type").text( data.study_type );
						$("#study_writedate").text( data.study_writedate);
						$("#onoff").text( data.study_onoff );
						$("#member_nick").text( data.member_nick );
						$("#start_date ").text( data.start_date );
						$("#end_date ").text( data.end_date );
						$("#study_content").text( data.study_content);

						if("${login_info.member_id}" == data.member_id){
							$("#delete_div").show();
						}
					}//call back function
					, "json"
			);//get
		});//ready
		</script>

	</body>
</html>
