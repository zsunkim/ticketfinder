package ticket.finder.mapper;

import java.util.List;
import java.util.Map;

import ticket.finder.dto.Faq;
import ticket.finder.dto.FaqPage;

public interface FaqMapper {
	int insertFaq(Faq faq);
	int updateFaq(Faq faq);
	int deleteFaq(int faqNum);
	Faq selectFaq(int faqNum);
	List<Faq> selectCategoryFaq(String faqCategory);
	List<Faq> selectKeywordFaq(String faq);
	List<Faq> selectFaqList();
	List<Faq> selectCountFaq();
	List<Faq> selectCategoryFaqOne();
	List<Faq> selectCategoryFaqTwo();
	List<Faq> selectCategoryFaqThree();
	List<FaqPage> selectFaqBoardList(Map<String, Object> map);
}
