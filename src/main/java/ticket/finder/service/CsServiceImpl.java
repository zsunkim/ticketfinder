package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.CsDAO;
import ticket.finder.dto.Cs;
import ticket.finder.dto.CsPage;
import ticket.finder.exception.CsNotFoundException;

@Service
public class CsServiceImpl implements CsService {

	@Autowired
	private CsDAO csDAO;
	
	@Override
	public void addCs(Cs cs) {
		csDAO.insertCs(cs);
	}

	@Override
	public void modifyCs(Cs cs) throws CsNotFoundException {
		if(csDAO.selectCs(cs.getCsNum())==null) {
			throw new CsNotFoundException("선택하신 공지사항이 존재하지 않습니다.");
		}
		csDAO.updateCs(cs);
	}

	@Override
	public void removeCs(int csNum) throws CsNotFoundException {
		if(csDAO.selectCs(csNum)==null) {
			throw new CsNotFoundException("선택하신 공지사항이 존재하지 않습니다.");
		}
		csDAO.deleteCs(csNum);
	}

	@Override
	public Cs getCs(int csNum) throws CsNotFoundException {
		if(csDAO.selectCs(csNum)==null) {
			throw new CsNotFoundException("선택하신 공지사항이 존재하지 않습니다.");
		}
		return csDAO.selectCs(csNum);
	}

	@Override
	public List<Cs> getCategoryCs(String csCategory) {
		return csDAO.selectCategoryCs(csCategory);
	}

	@Override
	public List<Cs> getCsList() {
		return csDAO.selectCsList();
	}

	@Override
	public int getCsCount(Map<String, String> map) {
		return csDAO.selectCsCount(map);
	}

	@Override
	public List<CsPage> getCsBoardList(Map<String, Object> map) {
		return csDAO.selectCsBoardList(map);
	}

}
