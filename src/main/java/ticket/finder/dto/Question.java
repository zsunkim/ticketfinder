package ticket.finder.dto;

import org.springframework.web.multipart.MultipartFile;

public class Question {
	private int questionNum;
	private String questionUserId;
	private String questionTitle;
	private String questionContents;
	private String questionDate;
	private String questionCategory;
	private String questionState;
	private int questionRef;
	private int questionStep;
	private String questionFile;
	private String questionFileName;
	private String questionShow;
	private MultipartFile file;
	
	public Question() {
		// TODO Auto-generated constructor stub
	}

	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionUserId() {
		return questionUserId;
	}

	public void setQuestionUserId(String questionUserId) {
		this.questionUserId = questionUserId;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionContents() {
		return questionContents;
	}

	public void setQuestionContents(String questionContents) {
		this.questionContents = questionContents;
	}

	public String getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(String questionDate) {
		this.questionDate = questionDate;
	}

	public String getQuestionCategory() {
		return questionCategory;
	}

	public void setQuestionCategory(String questionCategory) {
		this.questionCategory = questionCategory;
	}

	public String getQuestionState() {
		return questionState;
	}

	public void setQuestionState(String questionState) {
		this.questionState = questionState;
	}

	public int getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}

	public int getQuestionStep() {
		return questionStep;
	}

	public void setQuestionStep(int questionStep) {
		this.questionStep = questionStep;
	}

	public String getQuestionFile() {
		return questionFile;
	}

	public void setQuestionFile(String questionFile) {
		this.questionFile = questionFile;
	}

	public String getQuestionFileName() {
		return questionFileName;
	}

	public void setQuestionFileName(String questionFileName) {
		this.questionFileName = questionFileName;
	}

	public String getQuestionShow() {
		return questionShow;
	}

	public void setQuestionShow(String questionShow) {
		this.questionShow = questionShow;
	}

	public MultipartFile getFile() {
		return file;
	}

	public void setFile(MultipartFile file) {
		this.file = file;
	}
}
