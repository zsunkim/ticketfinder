package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.TfUser;

public interface TfUserDAO {
	int insertUser(TfUser user);
	int updateUser(TfUser user);
	int dormantUser(String id);
	int updateLastDate(String userId);
	String selectFindIdUser(Map<String, String> map);
	TfUser selectUser(String userId);
	List<TfUser> selectUserList();
	List<TfUser> dormantUserList();
	List<TfUser> dormantedUserList();
	int selectIdCheck(String userId);
}
