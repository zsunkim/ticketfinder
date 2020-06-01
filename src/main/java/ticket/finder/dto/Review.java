package ticket.finder.dto;

public class Review {

	private int reviewNum;
	private int reviewShowCode;
	private String reviewUserId;
	private String reviewGrade;
	private String reviewContents;
	private String reviewDate;
	private String reviewViewDate;
	private String reviewState;
	
	public int getReviewNum() {
		return reviewNum;
	}
	
	public void setReviewNum(int reviewNum) {
		this.reviewNum = reviewNum;
	}
	
	public int getReviewShowCode() {
		return reviewShowCode;
	}
	
	public void setReviewShowCode(int reviewShowCode) {
		this.reviewShowCode = reviewShowCode;
	}
	
	public String getReviewUserId() {
		return reviewUserId;
	}
	
	public void setReviewUserId(String reviewUserId) {
		this.reviewUserId = reviewUserId;
	}
	
	public String getReviewGrade() {
		return reviewGrade;
	}
	
	public void setReviewGrade(String reviewGrade) {
		this.reviewGrade = reviewGrade;
	}
	
	public String getReviewContents() {
		return reviewContents;
	}
	
	public void setReviewContents(String reviewContents) {
		this.reviewContents = reviewContents;
	}
	
	public String getReviewDate() {
		return reviewDate;
	}
	
	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}
	
	public String getReviewViewDate() {
		return reviewViewDate;
	}
	
	public void setReviewViewDate(String reviewViewDate) {
		this.reviewViewDate = reviewViewDate;
	}
	
	public String getReviewState() {
		return reviewState;
	}
	
	public void setReviewState(String reviewState) {
		this.reviewState = reviewState;
	}
}
