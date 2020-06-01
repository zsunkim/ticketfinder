package ticket.finder.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ticket.finder.dao.TfShowDAO;
import ticket.finder.dto.TfShow;

@Service
public class TfShowServiceImpl implements TfShowService {
	@Autowired
	private TfShowDAO tfShowDAO;

	@Transactional
	@Override
	public int addTfShow(TfShow tfShow) {
		return tfShowDAO.insertTfShow(tfShow);
	}

	@Transactional
	@Override
	public int modifyTfShow(TfShow tfShow) {
		return tfShowDAO.updateTfShow(tfShow);
	}

	@Override
	public List<TfShow> getEndTfShow() {
		return tfShowDAO.selectEndTfShow();
	}

	@Override
	public List<TfShow> getTfShowList() {
		return tfShowDAO.selectTfShowList();
	}
	
	
}
