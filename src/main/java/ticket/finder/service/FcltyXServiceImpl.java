package ticket.finder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.FcltyXDAO;
import ticket.finder.dto.Fclty;
import ticket.finder.dto.FcltyHall;
import ticket.finder.dto.FcltyX;
import ticket.finder.exception.FcCodeNotFoundException;
import ticket.finder.exception.HallCodeNotFoundException;

@Service
public class FcltyXServiceImpl implements FcltyXService {
	@Autowired
	private FcltyXDAO fcltyXDAO;

	@Override
	public FcltyHall getHall(String hallCode) throws HallCodeNotFoundException {
		FcltyHall hallinfo = fcltyXDAO.selectHall(hallCode);
		if(hallinfo==null) {
			throw new HallCodeNotFoundException("입력된 공연장 코드를 찾을 수 없습니다.");
		}
		return hallinfo;
	}

	@Override
	public Fclty getFclty(String fcCode) throws FcCodeNotFoundException {
		Fclty fcinfo = fcltyXDAO.selectFclty(fcCode);
		if(fcinfo==null) {
			throw new FcCodeNotFoundException("입력된 공연시설 코드를 찾을 수 없습니다.");
		}
		return fcinfo;
	}

	@Override
	public List<FcltyX> getFcltyXList() {
		return fcltyXDAO.selectFcltyXList();
	}

	@Override
	public List<Fclty> getFcltyList() {
		return fcltyXDAO.selectFcltyList();
	}

	

}
