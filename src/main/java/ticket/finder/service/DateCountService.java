package ticket.finder.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.DateCount;

public interface DateCountService {
	List<DateCount> getOrderCount(@Param("param1") String param1, @Param("param2") String param2, @Param("period") int period);
	List<DateCount> getSalesDay(String param1);
	List<DateCount> getGenreSum(@Param("startDate") String startDate, @Param("endDate") String endDate);
	List<DateCount> getFcltySum(@Param("startDate") String startDate, @Param("endDate") String endDate);
}
