//댓글 목록
var infos;
var check = false;

// ajax
function getCommentList() {
	$.ajax({
		async: false,
		url : contextPath + "/userMyPage/MyCommentListOk.dy",
		type : "get",
		dataType : "json",
		success : showMyCommemntList
	    ,error:function(a, b, c) {
			console.log("오류" + c);
	    }
	});
};

// 목록+수정+삭제+보기
function showMyCommemntList(infos) {
	var text = "";
	if (infos != null && infos.length != 0) {
		$ .each( infos, function(index, info) {
							
							text += '<div id="story-comments" class="Comments__CommentsWrapper-sc-1m6x198-0 jzhOmf" style="padding-top: 40px; margin-top: -40px;">'
							text += '    <div class="story-comments">'
							text += '        <div class="Comment__CommentWrapper-sc-1u7skh9-2 ZXrVs commentModifyParent">'
							text += '            <div class="header">'
							text += '                <div class="profile ">'
							text += '                    <div class="profile-img"></div>'
							text += '                   <div class="nickname ">😺:'
									+ info.userNickName + '님의 댓글</div>'
							text += '                </div>'
							text += '                <div class="info">'
							text += '                    <div class="from-now">'
							text += '                        <svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">'
							text += '                            <path d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8zm0 448c-110.5 0-200-89.5-200-200S145.5 56 256 56s200 89.5 200 200-89.5 200-200 200zm61.8-104.4l-84.9-61.7c-3.1-2.3-4.9-5.9-4.9-9.7V116c0-6.6 5.4-12 12-12h32c6.6 0 12 5.4 12 12v141.7l66.8 48.6c5.4 3.9 6.5 11.4 2.6 16.8L334.6 349c-3.9 5.3-11.4 6.5-16.8 2.6z"></path>'
							text += '                        </svg>'
							text += '                        '
									+ info.worryCommentDate + '</div>'
							text += '                        <div class="more">'
							text += '                            <svg  class="commentOptionToggleBF" data-index="' + index + '" id="commentOptionToggleBF" stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" '
							text += '								xmlns="http://www.w3.org/2000/svg"><path d="M296 136c0-22.002-17.998-40-40-40s-40 17.998-40 40 17.998 40 40 40 40-17.998 40-40zm0 240c0-22.002-17.998-40-40-40s-40 17.998-40 40 17.998 40 40 40 40-17.998 40-40zm0-120c0-22.002-17.998-40-40-40s-40 17.998-40 40 17.998 40 40 40 40-17.998 40-40z"></path>'
							text += '                            </svg>'
							text += '                         <div class="More__MoreWrapper-indjn2-0 cLrShV commentOptionToggleAF" id="commentOptionToggleAF" >'
							text += '                            	<div class="action commentDetail" data-index="' + index + '" >보기</div>'
							text += '                            	<div class="action commentModifyOk" id="commentModifyOk" data-index="' + index + '">수정</div>'
							text += '                            	<div class="action commentDelete" data-index="' + index + '" >삭제</div>'
							text += '                         </div>'
							text += '                      </div>'
							text += '                </div>'
							text += '            </div>'
							text += '                <div class="commentModifyBF">'
							text += '                    <div class="comment">' + info.worryCommentContent + '</div>'
							text += '                </div>'
							text += '                <div class="commentModifyAF" style="display:none">'
							text += '                	<div class="CommentWrite__CommentWriteWrapper-sc-1lrpcsu-0 ikBDcZ" >'
							text += '						<textarea data-index="' + index + '" placeholder="따뜻한 관심을 보여주세요" class="contents EditContent" style="height: 36px;">'
									+ info.worryCommentContent + '</textarea>'
							text += '							<button class="btn submit commentUpdateOk" data-index="' + index + '" type="button">'
							text +='									<input data-index="' + index + '" type="hidden" class="worryCommentNumber" name="worryCommentNumber" value="'+ info.worryCommentNumber +'"> '
							text += '							<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 512 512" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">'
							text += '							<path d="M186.301 339.893L96 249.461l-32 30.507L186.301 402 448 140.506 416 110z"></path>'
							text += '							</svg>'
							text += '							</button>'
							text += '								<button class="btn cancle commentUpdateBack" data-index="' + index + '" type="button">'
							text += '								<svg stroke="currentColor" fill="currentColor" stroke-width="0" viewBox="0 0 24 24" height="1em" width="1em" xmlns="http://www.w3.org/2000/svg">'
							text += '								<path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path>'
							text += '								</svg>'
							text += '							</button>'
							text += '						</div>'
							text += '            	</div>'
							text += '                <div class="footer">'
							text += '                </div>'
							text += '            </div>'
							text += '        </div>'
							text += '    </div>'

						});
	} else {
		text = "<p>댓글이 없습니다</p>";
	}
	$("#wrap_myComment").html(text);	
	//댓글 기능
	const $commentOptionToggleBF = $('svg#commentOptionToggleBF');
	const $commentOptionToggleAF = $('div#commentOptionToggleAF');
	const $commentModifyOk = $('div.commentModifyOk');
	const $commentUpdateBack = $('div.commentUpdateBack');
	const $commentDelete = $("div.commentDelete");
	const $commentModifyBF=$('div.commentModifyBF');
	const $commentModifyAF=$('div.commentModifyAF');


			//밖 토글
			$(".commentOptionToggleBF").each(function(index, item){
				$(item).click(function(){
					$($commentOptionToggleAF[index]).toggle();	
				})
			});
			//안 토글
			$(".commentUpdateBack").each(function(index, item){
				$(item).click(function(){
					console.log("닫기")
					$($commentModifyBF[index]).find(".comment").show();		
					$($commentModifyAF[index]).hide();	
				})
			});
			$(".commentModifyOk").each(function(index, item){
				$(item).click(function(){
					console.log("열기")
					$($commentModifyBF[index]).find(".comment").hide();		
					$($commentModifyAF[index]).show();
					$($commentOptionToggleAF).hide();
				})
			});
			//수정완료버튼
			$(".commentUpdateOk").each(function(index, item){
				$(item).click(function(){
					console.log("수정완료버튼 들어옴?");
					const worryCommentNumber=$($(".worryCommentNumber")[index]).val();
					const EditContent=$($(".EditContent")[index]).val();
					console.log(worryCommentNumber);
					if (confirm("정말 수정하시겠습니까 ?")) {
						$.ajax({
							url : contextPath + "/userMyPage/MyCommentUpDateOk.dy",
							type : 'get',
							data : { "worryCommentNumber" : worryCommentNumber,"CommentContent" : EditContent  },
							datatype:"JSON",
							success : function(res){
								alert('수정 완료');
								getCommentList();
							},
					        error: function(){console.log("오류");}
						})
					}	
				})
			});
			//삭제버튼
			$(".commentDelete").each(function(index, item){
				$(item).click(function(){
					console.log("삭제버튼 들어옴?");
					const worryCommentNumber=$($(".worryCommentNumber")[index]).val();
					console.log(worryCommentNumber);
					if (confirm("정말 삭제하시겠습니까 ?")) {
						$.ajax({
							url : contextPath + "/userMyPage/MyCommentDeleteOk.dy",
							type : 'get',
							data : { "worryCommentNumber" : worryCommentNumber },
							datatype:"JSON",
							success : 
								function(res){
								alert('삭제 완료');
								getCommentList();
							},
							error: function(){console.log("오류");}
						})
					}	
				})
			});
			//상세보기버튼
			$(".commentDetail").each(function(index, item){
				$(item).click(function(){
					console.log("상세열기")
					const worryCommentNumber=$($(".worryCommentNumber")[index]).val();
					console.log(worryCommentNumber);
					location.href = contextPath +'/worry/WorryDetailOK.bo?worryNumber=' + worryCommentNumber;
				})
			});
}













