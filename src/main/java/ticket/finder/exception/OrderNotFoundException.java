package ticket.finder.exception;

//�ֹ� ������ ���� ��� �߻��Ǵ� ���� Ŭ���� 
public class OrderNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public OrderNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public OrderNotFoundException(String message) {
		super(message);
	}
}