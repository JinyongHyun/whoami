package com.whoAmI.worry.vo;

public class WorryCommentVO {

	private int worryCommentNumber ;
	   private String worryCommentContent ;
	   private String  worryCommentDate ;
	   private int   worryCommentLikeNumber ;
	   private int  userNumber ;
	   private int  worryNumber ;

	   public WorryCommentVO() {;}

	public int getWorryCommentNumber() {
		return worryCommentNumber;
	}

	public void setWorryCommentNumber(int worryCommentNumber) {
		this.worryCommentNumber = worryCommentNumber;
	}

	public String getWorryCommentContent() {
		return worryCommentContent;
	}

	public void setWorryCommentContent(String worryCommentContent) {
		this.worryCommentContent = worryCommentContent;
	}

	public String getWorryCommentDate() {
		return worryCommentDate;
	}

	public void setWorryCommentDate(String worryCommentDate) {
		this.worryCommentDate = worryCommentDate;
	}

	public int getWorryCommentLikeNumber() {
		return worryCommentLikeNumber;
	}

	public void setWorryCommentLikeNumber(int worryCommentLikeNumber) {
		this.worryCommentLikeNumber = worryCommentLikeNumber;
	}

	public int getUserNumber() {
		return userNumber;
	}

	public void setUserNumber(int userNumber) {
		this.userNumber = userNumber;
	}

	public int getWorryNumber() {
		return worryNumber;
	}

	public void setWorryNumber(int worryNumber) {
		this.worryNumber = worryNumber;
	}
	   
	   
}
