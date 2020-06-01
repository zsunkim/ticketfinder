package ticket.finder.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import ticket.finder.dto.DateCount;

public interface DateCountMapper {
	List<DateCount> selectOrderCount(@Param("param1") String param1, @Param("param2") String param2, @Param("period") int period);
	List<DateCount> selectSalesDay(String param1);
	List<DateCount> selectGenreSum(@Param("startDate") String startDate, @Param("endDate") String endDate);
	List<DateCount> selectFcltySum(@Param("startDate") String startDate, @Param("endDate") String endDate);
}
