package ticket.finder.exception;

import ticket.finder.dto.TfUser;

//입력한 회원정보가 유효하지 않을 경우 발생되는 예외클래스
public class WrongJoinException extends Exception{
	private static final long serialVersionUID = 1L;
	
	private TfUser tfUser;
	
	public WrongJoinException() {
		// TODO Auto-generated constructor stub
	}

	public WrongJoinException(TfUser tfUser, String message) {
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
