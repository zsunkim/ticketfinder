package ticket.finder.dao;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.ShowDetail;
import ticket.finder.mapper.ShowDetailMapper;

@Repository
public class ShowDetailDAOImpl implements ShowDetailDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertShowDetail(ShowDetail showDetail) {
		return sqlSession.getMapper(ShowDetailMapper.class).insertShowDetail(showDetail);
	}

	@Override
	public int updateShowDetail(ShowDetail showDetail) {
		return sqlSession.getMapper(ShowDetailMapper.class).updateShowDetail(showDetail);
	}

	@Override
	public int updateStateShowDetail(@Param("date") String date) {
		return sqlSession.getMapper(ShowDetailMapper.class).updateStateShowDetail(date);
	}

}
