package ticket.finder.exception;

import ticket.finder.dto.TfUser;

//회원가입 시 사용자가 입력한 ID가 이미 존재할 경우 발생되는 예외 클래스 
public class UserIdExistsException extends Exception{
	private static final long serialVersionUID = 1L;
	
	//예외처리 메소드(ExceptionHandler)에게 예외관련정보를 전달하기 위한 필드
	private TfUser tfUser;
	
	public UserIdExistsException() {
		// TODO Auto-generated constructor stub
	}

	public UserIdExistsException(TfUser tfUser, String message) {
		super(message);
		this.tfUser = tfUser;
	}

	public TfUser getTfUser() {
		return tfUser;
	}

	public void setTfUser(TfUser tfUser) {
		this.tfUser = tfUser;
	}
}
