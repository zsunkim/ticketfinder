package ticket.finder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.TfShow;
import ticket.finder.mapper.TfShowMapper;

@Repository
public class TfShowDAOImpl implements TfShowDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int insertTfShow(TfShow tfShow) {
		return sqlSession.getMapper(TfShowMapper.class).insertTfShow(tfShow);
	}

	@Override
	public int updateTfShow(TfShow tfShow) {
		return sqlSession.getMapper(TfShowMapper.class).updateTfShow(tfShow);
	}

	@Override
	public List<TfShow> selectEndTfShow() {
		return sqlSession.getMapper(TfShowMapper.class).selectEndTfShow();
	}

	@Override
	public List<TfShow> selectTfShowList() {
		return sqlSession.getMapper(TfShowMapper.class).selectTfShowList();
	}
}
