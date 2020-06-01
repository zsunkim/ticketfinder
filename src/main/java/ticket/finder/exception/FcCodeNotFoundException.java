package ticket.finder.exception;


//공연시설 검색 시  공연시설코드가 존재하지 않을 경우 발생되는 예외클래스
public class FcCodeNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public FcCodeNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public FcCodeNotFoundException(String message) {
		super(message);
	}
	
}
