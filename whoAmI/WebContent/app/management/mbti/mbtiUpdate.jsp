<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE HTML>
<html>
<head>
<meta charset="UTF-8">
<title>Insert 심리검사 수정</title>
<style>
.management_wrapper .my input {
    color: #848484;
    text-decoration: none;
    white-space: nowrap;
    text-align: center;
    line-height: 2.5em;
    padding: 0 2.25em;
    letter-spacing: 0.075em;
    height: 2.5em;
    font-size: 0.8em !important;
    font-weight: 700;
    display: inline-block;
    cursor: pointer;
    border-radius: 0.375em;
    background-color: white;
    border-color: #dee2e4;
}

.management_wrapper .my input[type="text"] {
	border: none;
	border-bottom: 1px solid black;
	border-radius: 0;
}

.adjustment p{
	font-weight: bold;
}

#admin-whole-wrapper .management_wrapper .adjustment{
	display: flex;
    margin-top: 17px;
    justify-content: center;
    margin-left: 0;
}
</style>
</head>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/expert/solo/expert.css">
<body>
	<c:set var="page" value="${page}" />
	<c:set var="testInfo" value="${testInfo}" />

		<!-- Header -->
	<div id="admin-whole-wrapper">

		<div id="navigation" style="height: 136vh;">
			<div id="padding-div">
				<div class="logo-wrapper-manager">
					<img src="${pageContext.request.contextPath}/images/expert/solo/로고대두.png">
					<span>Who Am I</span>
				</div>
				<div id="first-a-wrapper">
					<br>
					<div class="a-wrapper">
						<a href="" class="admin-a">메인 페이지</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a href="${pageContext.request.contextPath}/managerMbti/TestInfoListOk.ns" class="admin-a">심리검사 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a href="${pageContext.request.contextPath}/expert/ManagerExpertListOk.me" class="admin-a">전문가 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a href="${pageContext.request.contextPath}/worry/WorryManagermentListOK.bo" class="admin-a">고민/사연 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a href="${pageContext.request.contextPath}/userMyPage/UserListOk.dy" class="admin-a">이용자 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a href="" class="admin-a">공지사항 및 쿠폰 관리</a>
					</div>
				</div>

			</div>
		</div>
		
		
		<div id="first-wrapper">
			<div id="second-wrapper"style="    height: 136vh;">
				<div class="upper-wrapper1">
					<div class="loginJoin-wrapper">
					<div class="loginJoin-send-wrapper">
						<a href="#"> 로그인 </a>/ <a href="#"> 회원가입 </a>
					</div>
				</div>
				</div>
				<div class="upper-wrapper2">
					<div class="manager-title-wrapper">
						<h3></h3>
					</div>
				</div>	
	
	<section class="management_wrapper" style="height: 121%;">
		<div class="management_header">
			<ul class="my">
				<li>심리상담 수정</li>
				<li><input type="button" value="목록" onclick="location.href = '${pageContext.request.contextPath}/managerMbti/TestInfoListOk.ns'"/>
				</li>
			</ul>
		</div>
		<div class="innerMyWrap" style="margin-top: 64px; text-align: center;">
		<form action="${pageContext.request.contextPath}/managerMbti/TestInfoUpdateOk.ns" name="updateForm" method="post" enctype="multipart/form-data" class="my">
			<input type="hidden" name="testInfoNumber" value="${testInfo.getTestInfoNumber()}">
			<input type="hidden" name="page" value="${page}">
			<div style="display: flex; text-align: center; justify-content: space-evenly;">
				
				<div class="files">
					썸네일사진추가
					<div style="margin-top: 9px;">
						<label for="board_file1" style="display: inline;"> <img
							id="board_file1Img"
							src="${pageContext.request.contextPath}/upload/${testInfoPictures.getTestInfoPicturePosterNameOrignal()}"
							width="50px" height="50px" style="display: inline;">
						</label>
					</div>
					<input id="board_file1" name="board_file1" type="file"> <input
						type="button"  style="    margin-top: 9px;"  onclick="cancelFile('board_file1')" value="첨부 삭제">
				</div>
				<div class="files">
					내용포스터추가
					<div style="margin-top: 9px;">
						<label for="board_file2" style="display: inline;"> <img
							id="board_file2Img"
							src="${pageContext.request.contextPath}/upload/${testInfoPictures.getTestInfoPictureSumnailNameOrignal()}"
							width="50px" height="50px" style="display: inline;">
						</label>
					</div>
					<input id="board_file2" name="board_file2" type="file"> <input
						type="button"  style="    margin-top: 9px;"  onclick="cancelFile('board_file2')" value="첨부 삭제">
				</div>
			</div>
			<br>
			<p style="    margin-top: 20px;">상담제목</p>
			<input type="text" placeholder="제목을 입력해주세요" value="${testInfo.getTestInfoTitle()}" id="testInfoTitle" name="testInfoTitle">
			<br>
			<p style="    margin-top: 20px;">소요시간</p>
			<input type="text" placeholder="소요시간 입력해주세요" value="${testInfo.getTestInfoUsetime()}" id="testInfoUsetime" name="testInfoUsetime">
			<br>
			<p style="    margin-top: 20px;">실행링크</p>
			<input type="text" placeholder="실행링크 입력해주세요" value="${testInfo.getTestInfoPath()}" id="testInfoPath" name="testInfoPath">
			<br>


			<div class="management_footer">
				<ul class="my"style=" margin-left: -19px; display: flex; justify-content: center;">
					<li><input type="button" value="수정완료"  onclick="send()"/>
					</li>
					<li><input type="button" value="취소" onclick="history.back()"/>
					</li>
				</ul>
			</div>
		</form>
		</div>
	</section>
</div>
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
function send(){
	 if(!updateForm.testInfoTitle.value){
		alert("제목을 작성해주세요.");
		return;
	}
	
	if(!updateForm.testInfoUsetime.value){
		alert("소요시간 을입력해주세요.");
		return;
	}
	if(!updateForm.testInfoPath.value){
		alert("실행링크를 입력해주세요.");
		return;
	} 
	updateForm.submit();
}
// 파일 첨부시 썸네일 변화 기능
     	$(".files").change(function(e){
     		var file = e.target.files[0];
     		var img = $(this).find("img");
     		var reader = new FileReader();
     		reader.readAsDataURL(file);
     		
	   		reader.onload = function(e){
	   			if(e.target.result.indexOf("image") != -1){
		   			img.attr("src", e.target.result)
		   			$(img).css("width", "122px");
		   			$(img).css("height", "180px");
	   			}else{
	   				img.attr("src", "${pageContext.request.contextPath}/app/management/images/bin.png");
	   				img.css("width", "50px");
	   				img.css("height", "50px");
	   			}
	   		}
	   	});
     	
     	// 파일 첨부 삭제시
     	function cancelFile(fileName){
     		$("input#" + fileName).val("");
     		$("img#" + fileName + "Img").attr("src", "${pageContext.request.contextPath}/app/management/images/filePlus.png");
     		$("img#" + fileName + "Img").css("width", "50px");
     		$("img#" + fileName + "Img").css("height", "50px");
     	}
     	
     	
     	
//     	textarea 높이 조절
     	function adjustHeight() {
     		  var $textEle = $('textarea');
     		  
     		  $.each($textEle, function(index, item) {
     			$(item).css("height", "auto");
     			var textEleHeight = $(item).prop('scrollHeight');
     			console.log(textEleHeight);
     			$(item).css('height', textEleHeight);
     			$(item).css('height', textEleHeight);
     			if(textEleHeight > 191){
     				$(item).css('height', 191);
     			}
     		  });
     	};

     adjustHeight(); // 함수를 실행하면 자동으로 textarea의 높이 조절
     
//     타자시 함수 작동
     var $textEle = $('textarea');
     
     $.each($textEle, function(index, item) {
		$(item).on('keyup', function() {
	           adjustHeight();
         });
	});
   </script>
</html>