package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ticket.finder.dao.TfUserDAO;
import ticket.finder.dto.TfUser;
import ticket.finder.exception.LoginAuthFailException;
import ticket.finder.exception.UserIdExistsException;
import ticket.finder.exception.UserNotFoundException;
import ticket.finder.exception.WrongJoinException;

@Service
public class TfUserServiceImpl implements TfUserService {
	
	@Autowired
	private TfUserDAO tfUserDAO;

	@Transactional
	@Override
	public void addUser(TfUser user) throws UserIdExistsException, WrongJoinException {
		//���̵� �ߺ� ���� �˻�
		if(tfUserDAO.selectUser(user.getUserId())!=null) {
			throw new UserIdExistsException(user, "�̹� ������� ���̵��Դϴ�.");
		}
		
		user.setUserPw(BCrypt.hashpw(user.getUserPw(), BCrypt.gensalt(10)));
		user.setUserState("Ȱ��");
		
		tfUserDAO.insertUser(user);
	}

	@Transactional
	@Override
	public void modifyUser(TfUser user) throws UserNotFoundException {
		//ȸ�� ���� �˻�
		if(tfUserDAO.selectUser(user.getUserId())==null) {
			throw new UserNotFoundException("�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		user.setUserPw(BCrypt.hashpw(user.getUserPw(), BCrypt.gensalt(10)));
		tfUserDAO.updateUser(user);
	}

	@Transactional
	@Override
	public void modifyUserToDormant(String id) throws UserNotFoundException {
		if(tfUserDAO.selectUser(id)==null) {
			throw new UserNotFoundException("�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		tfUserDAO.dormantUser(id);
	}
	
	@Transactional
	@Override
	public void modifyUserLastLogin(String id) throws UserNotFoundException {
		if(tfUserDAO.selectUser(id)==null) {
			throw new UserNotFoundException("�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		tfUserDAO.updateLastDate(id);
	}

	@Override
	public String getFindIdUser(Map<String, String> map) throws UserNotFoundException {
		if(tfUserDAO.selectFindIdUser(map)==null || tfUserDAO.selectFindIdUser(map).equals("")) {
			throw new UserNotFoundException("�ش� ȸ���� �������� �ʽ��ϴ�.");
		}
		
		return tfUserDAO.selectFindIdUser(map);
	}

	@Override
	public TfUser getUser(String id) throws UserNotFoundException {
		if(tfUserDAO.selectUser(id)==null) {
			throw new UserNotFoundException("�ش� ���̵��� ȸ���� �������� �ʽ��ϴ�.");
		}
		return tfUserDAO.selectUser(id);
	}

	@Override
	public List<TfUser> getUserList() {
		return tfUserDAO.selectUserList();
	}

	@Override
	public List<TfUser> getDormantUserList() {
		return tfUserDAO.dormantUserList();
	}

	@Override
	public List<TfUser> getDormantedUserList() {
		return tfUserDAO.dormantedUserList();
	}

	//����ó�� �޼ҵ� : ���ܰ� �߻��Ǹ� ��������, ���ܰ� �߻����� ������ ���� ����
	@Override
	public void loginAuth(TfUser tfUser) throws LoginAuthFailException {
		TfUser authUserinfo=tfUserDAO.selectUser(tfUser.getUserId());
		//���̵� �˻�
		if(authUserinfo==null) {
			throw new LoginAuthFailException(tfUser.getUserId(), "���̵��� ȸ�������� �������� �ʽ��ϴ�.");
		}
		
		//��й�ȣ �˻�
		if(!BCrypt.checkpw(tfUser.getUserPw(), authUserinfo.getUserPw())) {
			throw new LoginAuthFailException(tfUser.getUserId(), "���̵� ���ų� ��й�ȣ�� ���� �ʽ��ϴ�.");
		}

	}

	@Override
	public int getIdCheck(String userId) {
		return tfUserDAO.selectIdCheck(userId);
	}


}