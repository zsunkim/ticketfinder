package ticket.finder.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.DateCount;
import ticket.finder.mapper.DateCountMapper;

@Repository
public class DateCountDAOImpl implements DateCountDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<DateCount> selectOrderCount(@Param("param1") String param1, @Param("param2") String param2, @Param("period") int period) {
		return sqlSession.getMapper(DateCountMapper.class).selectOrderCount(param1, param2, period);
	}

	@Override
	public List<DateCount> selectSalesDay(String param1) {
		return sqlSession.getMapper(DateCountMapper.class).selectSalesDay(param1);
	}

	@Override
	public List<DateCount> selectGenreSum(@Param("startDate") String startDate, @Param("endDate") String endDate) {
		return sqlSession.getMapper(DateCountMapper.class).selectGenreSum(startDate, endDate);
	}

	@Override
	public List<DateCount> selectFcltySum(@Param("startDate") String startDate, @Param("endDate") String endDate) {
		return sqlSession.getMapper(DateCountMapper.class).selectFcltySum(startDate, endDate);
	}
	
}
