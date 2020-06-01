package ticket.finder.dto;

public class OrderRefundShowDetail {
	private TfOrder tfOrder;
	private Refund refund;
	private ShowDetail showDetail;
	
	public OrderRefundShowDetail() {
		// TODO Auto-generated constructor stub
	}

	public TfOrder getTfOrder() {
		return tfOrder;
	}

	public void setTfOrder(TfOrder tfOrder) {
		this.tfOrder = tfOrder;
	}

	public Refund getRefund() {
		return refund;
	}

	public void setRefund(Refund refund) {
		this.refund = refund;
	}

	public ShowDetail getShowDetail() {
		return showDetail;
	}

	public void setShowDetail(ShowDetail showDetail) {
		this.showDetail = showDetail;
	}
	
	
}
