package ticket.finder.dao;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.ShowDetail;

public interface ShowDetailDAO {
	int insertShowDetail(ShowDetail showDetail);
	int updateShowDetail(ShowDetail showDetail);
	int updateStateShowDetail(@Param("date") String date);
}
