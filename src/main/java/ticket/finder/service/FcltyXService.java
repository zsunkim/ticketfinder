package ticket.finder.service;

import java.util.List;

import ticket.finder.dto.Fclty;
import ticket.finder.dto.FcltyHall;
import ticket.finder.dto.FcltyX;
import ticket.finder.exception.FcCodeNotFoundException;
import ticket.finder.exception.HallCodeNotFoundException;

public interface FcltyXService {
	FcltyHall getHall(String hallCode) throws HallCodeNotFoundException;
	Fclty getFclty(String fcCode) throws FcCodeNotFoundException;
	List<FcltyX> getFcltyXList();
	List<Fclty> getFcltyList();
}
