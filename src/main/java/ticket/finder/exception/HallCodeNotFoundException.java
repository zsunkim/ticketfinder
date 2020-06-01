package ticket.finder.exception;


//공연장 검색 시  공연장코드가 존재하지 않을 경우 발생되는 예외클래스
public class HallCodeNotFoundException extends Exception{
	private static final long serialVersionUID = 1L;
	
	public HallCodeNotFoundException() {
		// TODO Auto-generated constructor stub
	}
	
	public HallCodeNotFoundException(String message) {
		super(message);
	}
	
}
