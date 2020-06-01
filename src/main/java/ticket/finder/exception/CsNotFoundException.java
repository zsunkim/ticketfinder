package ticket.finder.exception;

// 공지사항이 없을 경우 발생하는 예외클래스
public class CsNotFoundException extends Exception {
	private static final long serialVersionUID = 1L;
	
	public CsNotFoundException() {	}
	
	public CsNotFoundException(String message) {
		super(message);
	}
	
}
