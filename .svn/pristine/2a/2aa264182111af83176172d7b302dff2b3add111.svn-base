package ticket.finder.service;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.TfUser;
import ticket.finder.exception.LoginAuthFailException;
import ticket.finder.exception.UserIdExistsException;
import ticket.finder.exception.UserNotFoundException;
import ticket.finder.exception.WrongJoinException;

public interface TfUserService {
	void addUser(TfUser user) throws UserIdExistsException, WrongJoinException;
	void modifyUser(TfUser user) throws UserNotFoundException;
	void modifyUserToDormant(String id) throws UserNotFoundException;
	void modifyUserLastLogin(String id) throws UserNotFoundException;
	String getFindIdUser(Map<String, String> map) throws UserNotFoundException;
	TfUser getUser(String id) throws UserNotFoundException;
	List<TfUser> getUserList();
	List<TfUser> getDormantUserList();
	List<TfUser> getDormantedUserList();
	int getIdCheck(String userId);
	void loginAuth(TfUser tfUser) throws LoginAuthFailException; //인증처리 메소드
}
