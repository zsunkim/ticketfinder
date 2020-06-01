package ticket.finder.service;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Faq;
import ticket.finder.dto.FaqPage;
import ticket.finder.exception.FaqNotFoundException;

public interface FaqService {
	void addFaq(Faq faq);
	void modifyFaq(Faq faq) throws FaqNotFoundException;
	void removeFaq(int faqNum) throws FaqNotFoundException;
	Faq getFaq(int faqNum) throws FaqNotFoundException;
	List<Faq> getCategoryFaq(String faqCategory);
	List<Faq> getKeywordFaq(String faq);
	List<Faq> getFaqList();
	List<Faq> getCountFaq();
	List<Faq> getCategoryFaqOne();
	List<Faq> getCategoryFaqTwo();
	List<Faq> getCategoryFaqThree();
	List<FaqPage> getFaqBoardList(Map<String, Object> map);
}
