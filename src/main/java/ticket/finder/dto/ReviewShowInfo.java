package ticket.finder.dto;

public class ReviewShowInfo {
	private Review review;
	private ShowDetail showDetail;
	private TfShow tfShow;
	
	public ReviewShowInfo() {
		// TODO Auto-generated constructor stub
	}

	public Review getReview() {
		return review;
	}

	public void setReview(Review review) {
		this.review = review;
	}

	public ShowDetail getShowDetail() {
		return showDetail;
	}

	public void setShowDetail(ShowDetail showDetail) {
		this.showDetail = showDetail;
	}

	public TfShow getTfShow() {
		return tfShow;
	}

	public void setTfShow(TfShow tfShow) {
		this.tfShow = tfShow;
	}
}
