package ticket.finder.exception;

import ticket.finder.dto.TfOrder;

//주문정보 입력 시 동일한 주문 번호가 있을 경우 발생되는 예외 클래스 
public class SameOrderCodeException extends Exception{
	private static final long serialVersionUID = 1L;
	
	private TfOrder tfOrder;
	
	public SameOrderCodeException() {
		// TODO Auto-generated constructor stub
	}

	public SameOrderCodeException(TfOrder tfOrder, String message) {
		super(message);
		this.tfOrder = tfOrder;
	}

	public TfOrder getTfOrder() {
		return tfOrder;
	}

	public void setTfOrder(TfOrder tfOrder) {
		this.tfOrder = tfOrder;
	}
}
