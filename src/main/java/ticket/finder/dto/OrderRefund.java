package ticket.finder.dto;

public class OrderRefund {
	private TfOrder tfOrder;
	private Refund refund;
	
	public OrderRefund() {
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
	
}
