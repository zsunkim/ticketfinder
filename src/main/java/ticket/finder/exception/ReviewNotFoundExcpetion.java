package ticket.finder.exception;

public class ReviewNotFoundExcpetion extends Exception {
	private static final long serialVersionUID = 1L;
	
	public ReviewNotFoundExcpetion() { }
	
	public ReviewNotFoundExcpetion(String message) {
		super(message);
	}
}
