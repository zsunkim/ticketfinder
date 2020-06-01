package ticket.finder.exception;

public class FaqNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public FaqNotFoundException() {	}
	
	public FaqNotFoundException(String message) {
		super(message);
	}
}
