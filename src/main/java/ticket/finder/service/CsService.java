package ticket.finder.service;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Cs;
import ticket.finder.dto.CsPage;
import ticket.finder.exception.CsNotFoundException;

public interface CsService {
	void addCs(Cs cs);
	void modifyCs(Cs cs) throws CsNotFoundException;
	void removeCs(int csNum) throws CsNotFoundException;
	Cs getCs(int csNum) throws CsNotFoundException;
	int getCsCount(Map<String, String> map);
	List<Cs> getCategoryCs(String csCategory);
	List<Cs> getCsList();
	List<CsPage> getCsBoardList(Map<String, Object> map);
}
