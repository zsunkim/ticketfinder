package ticket.finder.mapper;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Cs;
import ticket.finder.dto.CsPage;

public interface CsMapper {
	int insertCs(Cs cs);
	int updateCs(Cs cs);
	int deleteCs(int csNum);
	Cs selectCs(int csNum);
	int selectCsCount(Map<String, String> map);
	List<Cs> selectCategoryCs(String csCategory);
	List<Cs> selectCsList();
	List<CsPage> selectCsBoardList(Map<String, Object> map);
}