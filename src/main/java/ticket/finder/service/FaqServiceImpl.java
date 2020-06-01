package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.FaqDAO;
import ticket.finder.dto.Faq;
import ticket.finder.dto.FaqPage;
import ticket.finder.exception.FaqNotFoundException;

@Service
public class FaqServiceImpl implements FaqService {

	@Autowired
	private FaqDAO faqDAO;
	
	@Override
	public void addFaq(Faq faq) {
		faqDAO.insertFaq(faq);
	}

	@Override
	public void modifyFaq(Faq faq) throws FaqNotFoundException {
		if(faqDAO.selectFaq(faq.getFaqNum())==null) {
			throw new FaqNotFoundException("해당하는 FAQ가 존재하지 않습니다.");
		}
		faqDAO.updateFaq(faq);
	}

	@Override
	public void removeFaq(int faqNum) throws FaqNotFoundException {
		if(faqDAO.selectFaq(faqNum)==null) {
			throw new FaqNotFoundException("해당하는 FAQ가 존재하지 않습니다.");
		}
		faqDAO.deleteFaq(faqNum);
	}

	@Override
	public Faq getFaq(int faqNum) throws FaqNotFoundException {
		if(faqDAO.selectFaq(faqNum)==null) {
			throw new FaqNotFoundException("해당하는 FAQ가 존재하지 않습니다.");
		}
		return faqDAO.selectFaq(faqNum);
	}

	@Override
	public List<Faq> getCategoryFaq(String faqCategory) {
		return faqDAO.selectCategoryFaq(faqCategory);
	}

	@Override
	public List<Faq> getKeywordFaq(String faq) {
		return faqDAO.selectKeywordFaq(faq);
	}

	@Override
	public List<Faq> getFaqList() {
		return faqDAO.selectFaqList();
	}

	@Override
	public List<Faq> getCountFaq() {
		return faqDAO.selectCountFaq();
	}

	@Override
	public List<Faq> getCategoryFaqOne() {
		return faqDAO.selectCategoryFaqOne();
	}

	@Override
	public List<Faq> getCategoryFaqTwo() {
		return faqDAO.selectCategoryFaqTwo();
	}

	@Override
	public List<Faq> getCategoryFaqThree() {
		return faqDAO.selectCategoryFaqThree();
	}

	@Override
	public List<FaqPage> getFaqBoardList(Map<String, Object> map) {
		return faqDAO.selectFaqBoardList(map);
	}
}
