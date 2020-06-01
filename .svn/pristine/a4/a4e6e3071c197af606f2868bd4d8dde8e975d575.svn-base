package ticket.finder.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import ticket.finder.dto.Fclty;
import ticket.finder.dto.FcltyHall;
import ticket.finder.dto.FcltyX;
import ticket.finder.mapper.FcltyXMapper;

@Repository
public class FcltyXDAOImpl implements FcltyXDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public FcltyHall selectHall(String hallCode) {
		return sqlSession.getMapper(FcltyXMapper.class).selectHall(hallCode);
	}

	@Override
	public Fclty selectFclty(String fcCode) {
		return sqlSession.getMapper(FcltyXMapper.class).selectFclty(fcCode);
	}

	@Override
	public List<FcltyX> selectFcltyXList() {
		return sqlSession.getMapper(FcltyXMapper.class).selectFcltyXList();
	}

	@Override
	public List<Fclty> selectFcltyList() {
		return sqlSession.getMapper(FcltyXMapper.class).selectFcltyList();
	}
	
}
