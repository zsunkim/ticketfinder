package ticket.finder.service;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.ShowDetail;

public interface ShowDetailService {
	void addShowDetail(ShowDetail showDetail);
	void modifyShowDetail(ShowDetail showDetail);
	void modifyStateShowDetail(@Param("date") String date);
}
