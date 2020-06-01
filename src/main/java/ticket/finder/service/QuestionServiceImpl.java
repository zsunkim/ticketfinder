package ticket.finder.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ticket.finder.dao.QuestionDAO;
import ticket.finder.dto.Question;
import ticket.finder.dto.QuestionRe;
import ticket.finder.exception.QuestionNotFoundException;

@Service
public class QuestionServiceImpl implements QuestionService {
	@Autowired
	private QuestionDAO questionDAO;

	@Override
	public void addQuestion(Question question) {
		questionDAO.insertQuestion(question);
	}
	

	@Override
	public void addQuestionAdmin(Question question) {
		questionDAO.insertQuestionAdmin(question);
	}

	@Override
	public void modifyStateQuestion(int questionNum) throws QuestionNotFoundException {
		if(questionDAO.selectQuestion(questionNum)==null) {
			throw new QuestionNotFoundException("선택한 문의는 존재하지 않습니다.");
		}
		questionDAO.updateStateQuestion(questionNum);
	}

	@Override
	public Question getQuestion(int questionNum) throws QuestionNotFoundException {
		if(questionDAO.selectQuestion(questionNum)==null) {
			throw new QuestionNotFoundException("선택한 문의는 존재하지 않습니다.");
		}
		return questionDAO.selectQuestion(questionNum);
	}

	@Override
	public List<Question> getRefQuestion(int questionRef, String questionUserId) {
		return questionDAO.selectRefQuestion(questionRef, questionUserId);
	}

	@Override
	public List<Question> getIdQuestion(String questionUserId) {
		return questionDAO.selectIdQuestion(questionUserId);
	}

	@Override
	public List<QuestionRe> getQuestionList() {
		return questionDAO.selectQuestionList();
	}
	
	@Override
	public List<QuestionRe> getUserQuestionIdList(String questionUserId) {
		return questionDAO.selectUserQuestionIdList(questionUserId);
	}

	@Override
	public List<Question> getUserQuestionList(Map<String, String> map) {
		return questionDAO.selectUserQuestionList(map);
	}

	@Override
	public int getQuestionCount(String questionUserId) {
		return questionDAO.selectQuestionCount(questionUserId);
	}
}
