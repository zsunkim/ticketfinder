package ticket.finder.mapper;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.TfUser;

public interface TfUserMapper {
	int insertUser(TfUser tfuser);
	int updateUser(TfUser tfuser);
	int dormantUser(String userId);
	int updateLastDate(String userId);
	String selectFindIdUser(Map<String, String> map);
	TfUser selectUser(String userId);
	List<TfUser> selectUserList();
	List<TfUser> dormantUserList();
	List<TfUser> dormantedUserList();
	int selectIdCheck(String userId);
}
