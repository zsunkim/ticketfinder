package ticket.finder.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.Cs;
import ticket.finder.dto.CsPage;
import ticket.finder.mapper.CsMapper;

@Repository
public class CsDAOImpl implements CsDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int insertCs(Cs cs) {
		return sqlSession.getMapper(CsMapper.class).insertCs(cs);
	}

	@Override
	public int deleteCs(int csNum) {
		return sqlSession.getMapper(CsMapper.class).deleteCs(csNum);
	}

	@Override
	public int updateCs(Cs cs) {
		return sqlSession.getMapper(CsMapper.class).updateCs(cs);
	}

	@Override
	public Cs selectCs(int csNum) {
		return sqlSession.getMapper(CsMapper.class).selectCs(csNum);
	}

	@Override
	public List<Cs> selectCategoryCs(String csCategory) {
		return sqlSession.getMapper(CsMapper.class).selectCategoryCs(csCategory);
	}

	@Override
	public List<Cs> selectCsList() {
		return sqlSession.getMapper(CsMapper.class).selectCsList();
	}

	@Override
	public int selectCsCount(Map<String, String> map) {
		return sqlSession.getMapper(CsMapper.class).selectCsCount(map);
	}

	@Override
	public List<CsPage> selectCsBoardList(Map<String, Object> map) {
		return sqlSession.getMapper(CsMapper.class).selectCsBoardList(map);
	}

}
