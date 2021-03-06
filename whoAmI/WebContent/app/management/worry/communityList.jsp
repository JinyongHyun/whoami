<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>고민/사연 게시글 관리</title>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/expert/solo/expert.css">
<style>
.management_wrapper table tr td:nth-child(6) {
	text-align: right;
	font-size: 0.8em;
	display: flex;
	flex-direction: row;
	justify-content: flex-end;
	margin-top: 8px;
}
</style>
</head>

<body>
	<c:set var="worryManagermentList" value="${worryManagermentList}" />
	<c:set var="page" value="${page}" />
	<c:set var="startPage" value="${startPage}" />
	<c:set var="endPage" value="${endPage}" />
	<c:set var="realEndPage" value="${realEndPage}" />
	<c:set var="total" value="${total}" />


	<div id="admin-whole-wrapper">
		<div id="navigation">
			<div id="padding-div">
				<div class="logo-wrapper-manager">
					<img
						src="${pageContext.request.contextPath}/images/expert/solo/로고대두.png">
					<span>Who Am I</span>
				</div>
				<div id="first-a-wrapper">
					<br>
					<div class="a-wrapper">
						<a href="${pageContext.request.contextPath}/admin/AdminDetail.mg"
							class="admin-a">메인 페이지</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a
							href="${pageContext.request.contextPath}/managerMbti/TestInfoListOk.ns"
							class="admin-a">심리검사 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a
							href="${pageContext.request.contextPath}/expert/ManagerExpertListOk.me"
							class="admin-a">전문가 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a
							href="${pageContext.request.contextPath}/worry/WorryManagermentListOK.bo"
							class="admin-a">고민/사연 관리</a>
					</div>
					<div id="hr-tag3"></div>
					<div class="a-wrapper">
						<a
							href="${pageContext.request.contextPath}/userMyPage/UserListOk.dy"
							class="admin-a">이용자 관리</a>
					</div>
					<div id="hr-tag3"></div>
				</div>

			</div>
		</div>
		<div id="first-wrapper">
			<div id="second-wrapper">
				<div class="upper-wrapper1">
					<div class="loginJoin-send-wrapper-position">
						<div class="loginJoin-wrapper">
							<div class="loginJoin-send-wrapper">
								<c:choose>
									<c:when test="${managerNumber eq null}">
										<a
											href="${pageContext.request.contextPath }/admin/AdminLogin.mg">
											로그인 </a>/ 
                  <a
											href="${pageContext.request.contextPath}/admin/AdminJoin.mg">
											회원가입 </a>
									</c:when>

									<c:otherwise>
                  관리자 아이디: ${managerId}
               <a
											href="${pageContext.request.contextPath}/admin/AdminLogout.mg">로그아웃</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
				</div>
				<div class="upper-wrapper2">
					<div class="manager-title-wrapper">
						<span class="marks">"</span><span>길을 잃는 다는 것은 곧 길을 알게 된다는
							것이다. </span><span class="marks">"</span>
					</div>
				</div>
				<section class="management_wrapper managelist">
					<table class="management_profileList">
						<caption>고민 사연 게시글 관리</caption>
						<colgroup>
							<col width="8%">
							<col width="15%">
							<col width="15%">
							<col width="%">
							<col width="45%">
							<col width="13%">
							<col width="13%">
						</colgroup>
						<thead>
							<tr>
								<th>번호</th>
								<th>작성일</th>
								<th>아이디</th>
								<th></th>
								<th>고민 제목</th>
								<th colspan="2"></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:choose>
								<c:when
									test="${worryManagermentList != null and fn:length(worryManagermentList) > 0}">
									<c:forEach var="worry" items="${worryManagermentList}">
										<tr>
											<td>${worry.getWorryNumber()}</td>
											<td>${worry.getWorryDate()}</td>
											<td>${worry.getUserEmail()}</td>
											<td></td>
											<td>${worry.getWorryTitle()}</td>
											<td colspan="2">
												<div class="management-delete-img"
													onclick="location.href='${pageContext.request.contextPath }/worry/WorryDetailOK.bo?worryNumber=${worry.getWorryNumber()}'">
													<img
														src="${pageContext.request.contextPath}/images/management/상세보기.png">
												</div>
												<div class="management-delete-img"
													onclick="location.href = '${pageContext.request.contextPath}/worry/WorryManagermentDeleteOK.bo?worryNumber=${worry.getWorryNumber()}'">
													<img
														src="${pageContext.request.contextPath}/images/management/휴지통.png">
												</div> <%-- <input type="button" value="상세 보기" class="worry-management-input"
									onclick="location.href='${pageContext.request.contextPath }/worry/WorryDetailOK.bo?worryNumber=${worry.getWorryNumber()}'">
									<input type="button" value="삭제" class="worry-management-input"
									onclick="location.href = '${pageContext.request.contextPath}/worry/WorryManagermentDeleteOK.bo?worryNumber=${worry.getWorryNumber()}'"> --%>
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
					</table>
					<!-- 페이징 처리 -->
					<table style="font-size: 1.3rem" class="expert_page_table">
						<tr align="center" valign="middle">
							<td class="web-view"><c:if test="${startPage > 1}">
									<a
										href="${pageContext.request.contextPath}/worry/WorryManagermentListOK.bo?page=${startPage - 1}">&lt;</a>
								</c:if> <c:forEach var="i" begin="${startPage}" end="${endPage}">
									<c:choose>
										<c:when test="${i eq page}">
											<c:out value="${i}" />&nbsp;&nbsp;
                                             </c:when>
										<c:otherwise>
											<a
												href="${pageContext.request.contextPath}/worry/WorryManagermentListOK.bo?page=${i}">
												<c:out value="${i}" />
											</a>&nbsp;&nbsp;
                                             </c:otherwise>
									</c:choose>
								</c:forEach> <c:if test="${endPage < realEndPage}">
									<a
										href="${pageContext.request.contextPath}/worry/WorryManagermentListOK.bo?page=${endPage + 1}">&gt;</a>
								</c:if></td>
						</tr>
					</table>

				</section>
			</div>
		</div>
	</div>
</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="${pageContext.request.contextPath}/js/management/profileList.js"></script>
</html>