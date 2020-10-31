package ticket.finder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.finder.dto.OrderRefund;
import ticket.finder.dto.Question;
import ticket.finder.dto.Refund;
import ticket.finder.dto.ReviewShowInfo;
import ticket.finder.dto.ShowXShow;
import ticket.finder.dto.TfOrder;
import ticket.finder.dto.TfUser;
import ticket.finder.exception.OrderNotFoundException;
import ticket.finder.exception.ShowNumNotFoundException;
import ticket.finder.service.CsService;
import ticket.finder.service.FaqService;
import ticket.finder.service.FcltyXService;
import ticket.finder.service.QuestionService;
import ticket.finder.service.RefundService;
import ticket.finder.service.ReviewService;
import ticket.finder.service.ShowDetailService;
import ticket.finder.service.ShowXShowService;
import ticket.finder.service.TfOrderService;
import ticket.finder.service.TfUserService;
import ticket.finder.util.Pager;
import ticket.finder.util.Tf_utility;

@Controller
public class UserController {
	@Autowired
	private CsService csService;
	
	@Autowired
	private FaqService faqService;
	
	@Autowired
	private FcltyXService fcltyXService;
	
	@Autowired
	private QuestionService questionService;
	
	@Autowired
	private RefundService refundService;
	
	@Autowired
	private ReviewService reviewService;
	
	@Autowired
	private ShowXShowService showXShowService;
	
	@Autowired
	private ShowDetailService showDetailService;
	
	@Autowired
	private TfOrderService tfOrderService;
	
	@Autowired
	private TfUserService tfUserService;
	
	@RequestMapping(value = "/", method = {RequestMethod.GET, RequestMethod.POST})
	public String index(@ModelAttribute TfUser tfUser, HttpSession session, Model model) {
		//TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		//model.addAttribute("loginUserInfo", loginUserInfo);
		
		List<ShowXShow> whatshot = showXShowService.getShowHot();
		model.addAttribute("whatshot", whatshot);
		
		Map<String, String> hotGenre1 = new HashMap<String, String>();
		hotGenre1.put("genre1", "musical");
		hotGenre1.put("genre2", "play");
		List<ShowXShow> hotGenreList1 = showXShowService.getHotGenre(hotGenre1);
		model.addAttribute("hotGenreList1", hotGenreList1);
		
		Map<String, String> hotGenre2 = new HashMap<String, String>();
		hotGenre2.put("genre1", "concert");
		hotGenre2.put("genre2", "classic");
		List<ShowXShow> hotGenreList2 = showXShowService.getHotGenre(hotGenre2);
		model.addAttribute("hotGenreList2", hotGenreList2);
		
		return "user/include/main";
	}
	
	@RequestMapping(value = "/rankTop3", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> rankTop3(@RequestParam String genre) {
		Map<String, String> selectedGenre = new HashMap<String, String>();
		selectedGenre.put("genre1", genre);
		
		Map<String, Object> returnMap = new HashMap<String, Object>();
		returnMap.put("returnMap", showXShowService.getHotGenre(selectedGenre));
		
		return returnMap;
	}

	/*
	@RequestMapping(value = "/perform/{genre}", method = RequestMethod.GET)
	public String perform(@PathVariable String genre) {
		return "user/include/perform";
	}
	@RequestMapping(value = "/perform_detail", method = RequestMethod.GET)
	public String performDetail() {
		return "user/include/perform_detail";
	}
	 */
	
	
	
	@RequestMapping(value = "/myticket", method = RequestMethod.GET)
	public String myticket(HttpSession session, Model model) throws OrderNotFoundException, ShowNumNotFoundException {
		//�������� ����
		TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		String loginUserId = loginUserInfo.getUserId();
		
		//�ֹ����� ����
		Map<String, String> orderKeywordMap = new HashMap<String, String>();
		orderKeywordMap.put("userId", loginUserId);
		orderKeywordMap.put("startRn", "1");
		orderKeywordMap.put("endRn", "3");
		
		List<OrderRefund> orderList = tfOrderService.getUserOrderList(orderKeywordMap);
		model.addAttribute("orderList", orderList);
		
		int orderCount = tfOrderService.getOrderCount(loginUserId);
		model.addAttribute("orderCount", orderCount);
		
		//�ֹ��� ���� ���� ���� ����
		List<ShowXShow> showList=new ArrayList<ShowXShow>();
		for(OrderRefund order:orderList) {
			ShowXShow show=showXShowService.getShowDetail(order.getTfOrder().getOrderShowNum());
			showList.add(show);
		}
		model.addAttribute("showList", showList);
		
		//�ı����� ����
		Map<String, String> reviewKeywordMap = new HashMap<String, String>();
		reviewKeywordMap.put("reviewUserId", loginUserId);
		reviewKeywordMap.put("startRn", "1");
		reviewKeywordMap.put("endRn", "3");
		
		List<ReviewShowInfo> reviewShowList = reviewService.getUserReviewList(reviewKeywordMap);
		model.addAttribute("reviewShowList", reviewShowList);
		
		int reviewCount = reviewService.getReviewCount(loginUserId);
		model.addAttribute("reviewCount", reviewCount);
		
		//�ı⿡ ���� ���� ���� ����
		/*
		List<ShowXShow> reviewShowList=new ArrayList<ShowXShow>();
		for(Review review:reviewList) {
			ShowXShow show=showXShowService.getShowDetail(review.getReviewShowCode());
			reviewShowList.add(show);
		}
		model.addAttribute("reviewShowList", reviewShowList);
		*/
		
		//���� ���� ����
		Map<String, String> qnaKeywordMap = new HashMap<String, String>();
		qnaKeywordMap.put("questionUserId", loginUserId);
		qnaKeywordMap.put("startRn", "1");
		qnaKeywordMap.put("endRn", "3");
		
		List<Question> qnaList = questionService.getUserQuestionList(qnaKeywordMap);
		model.addAttribute("qnaList", qnaList);
		
		int qnaCount = questionService.getQuestionCount(loginUserId);
		model.addAttribute("qnaCount", qnaCount);
		
		return "user/include/myPage";
	}
	
	/*
	@RequestMapping(value = "/cs", method = RequestMethod.GET)
	public String cs() {
		return "user/include/cs";
	}
	
	@RequestMapping(value = "/cs_info", method = RequestMethod.GET)
	public String csInfo() {
		return "user/include/csInfo";
	}
	*/
	
	
	@RequestMapping(value = "/book_detail/{orderCode}", method = RequestMethod.GET)
	public String bookDetail(@PathVariable String orderCode, Model model) throws OrderNotFoundException, ShowNumNotFoundException {
		TfOrder userOrder=tfOrderService.getOrder(orderCode);
		ShowXShow userShow=showXShowService.getShowDetail(userOrder.getOrderShowNum());
		if(!userOrder.getOrderShState().equals("�Ա�")) {
			Refund userRefund=refundService.getRefundByOrder(userOrder.getOrderCode());
			model.addAttribute("userRefund", userRefund);
		}
		
		model.addAttribute("userOrder", userOrder);
		model.addAttribute("userShow", userShow);
		
		return "user/include/bookDetail";
	}
	
	@RequestMapping(value = "/book_more", method = RequestMethod.GET)
	public String bookMore(){
		return "user/include/bookMore";
	}
	
	@RequestMapping(value = "/book_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> bookMore(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "6") int month
			,String state, HttpSession session) throws OrderNotFoundException, ShowNumNotFoundException {
		System.out.println(pageNum);
		System.out.println(month);
		//ȸ����������
		TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		String userId = loginUserInfo.getUserId();
		
		//ȸ�� ���� ���� ��ȯ
		int totalBoard=tfOrderService.getOrderCount(userId);
		int pageSize=5; //�������� ��µ� �Խñ��� ����
		int blockSize=5; //������ ������ ��µ� �������� ����
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service Ŭ������ �޼ҵ带 ȣ���ϱ� ���� �Ű������� ���޵� Map ��ü ����
		Map<String, String> pagerMap=new HashMap<String, String>();
		pagerMap.put("userId", userId);
		pagerMap.put("period", ""+(month*4*30));
		pagerMap.put("startRn", ""+pager.getStartRow());
		pagerMap.put("endRn", ""+pager.getEndRow());
		if(state.equals("0")) {
			pagerMap.put("state", "ȯ��");
		}
		
		//��û ó�� �޼ҵ��� ��ȯ������ ���� Map ��ü ����
		// => �������� Map��ü�� ��Ʈ��(Entry)�� �����Ͽ� ��ȯ - Entry >> JSON(JS ��ü)
		Map<String, Object> returnMap=new HashMap<String, Object>();
		List<OrderRefund> userOrderList = tfOrderService.getUserOrderList(pagerMap);
		returnMap.put("userOrderList", userOrderList); //�ֹ����� ����Ʈ
		returnMap.put("pager", pager); //����¡ ���� ��
		
		//�ֹ��� ���� ���� ����
		List<ShowXShow> userShowList=new ArrayList<ShowXShow>();
		for(OrderRefund order:userOrderList) {
			ShowXShow show=showXShowService.getShowDetail(order.getTfOrder().getOrderShowNum());
			userShowList.add(show);
		}
		returnMap.put("userShowList", userShowList);
		
		//return "user/include/bookMore";
		return returnMap;
	}
	
	
	/*
	@RequestMapping(value = "/qna", method = RequestMethod.GET)
	public String qna() {
		return "user/include/qna";
	}
	
	@RequestMapping(value = "/review_write", method = RequestMethod.GET)
	public String reviewWrite() {
		return "user/include/review_write";
	}
	*/
	
	@RequestMapping(value = "/review_list", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Object> reviewMore(@RequestParam(defaultValue = "1") int pageNum, @RequestParam(defaultValue = "6") int month
			,HttpSession session) {
		//ȸ����������
		TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		String userId = loginUserInfo.getUserId();
		
		//ȸ�� ���� ���� ��ȯ
		int totalBoard=reviewService.getReviewCount(userId);
		int pageSize=5; //�������� ��µ� �Խñ��� ����
		int blockSize=5; //������ ������ ��µ� �������� ����
		Pager pager=new Pager(pageNum, totalBoard, pageSize, blockSize);
		
		//Service Ŭ������ �޼ҵ带 ȣ���ϱ� ���� �Ű������� ���޵� Map ��ü ����
		Map<String, String> pagerMap=new HashMap<String, String>();
		pagerMap.put("userId", userId);
		pagerMap.put("period", ""+(month*4*30));
		pagerMap.put("startRn", ""+pager.getStartRow());
		pagerMap.put("endRn", ""+pager.getEndRow());
		
		//��û ó�� �޼ҵ��� ��ȯ������ ���� Map ��ü ����
		Map<String, Object> returnMap=new HashMap<String, Object>();
		List<ReviewShowInfo> userReviewList = reviewService.getUserReviewList(pagerMap);
		returnMap.put("userReviewList", userReviewList); //�ֹ����� ����Ʈ
		returnMap.put("pager", pager); //����¡ ���� ��
		
		return returnMap;
	}
	
	@RequestMapping(value = "/review_more", method = RequestMethod.GET)
	public String reviewMore(){
		return "user/include/reviewMore";
	}
	
	@RequestMapping(value = "/cancle_book", method = RequestMethod.POST)
	//@RequestMapping(value = "/cancle_book", method = RequestMethod.GET)
	public String cancleBook(@RequestParam String showNum, @RequestParam String orderCode) throws Exception {
		Tf_utility uti = new Tf_utility();
		
		//�ֹ� ��ȣ�� ���޹޾� �ֹ� ���� ����
		TfOrder order = tfOrderService.getOrder(orderCode);
		//�ֹ� ���� ����
		order.setOrderDpState("ȯ��");
		tfOrderService.modifyOrder(order);	
		
		//���� ��ȣ�� ���޹޾� ���� ���� ����
		ShowXShow show=showXShowService.getShowDetail(Integer.parseInt(showNum));
		//�� �����¼� ���� ��ȯ�޾� ����
		List<String[]> oldSeatTable=uti.seatsTable(show.getShowDetail().getShowSeat());
		//�ֹ� �������� ���� �¼��� ������ ���� �¼� ���� ��ȯ�޾� ����(X-XX ����) 
		List<String> bookSeatList=uti.changeSeatNameToNum(order.getOrderSeat());
		
		System.out.println(order.getOrderSeat());
		for(String bokseat:bookSeatList) {
			System.out.println(bokseat);
		}
		
		System.out.println(show.getShowDetail().getShowSeat());
		System.out.println(uti.modifySeatTable(oldSeatTable, bookSeatList, "1"));
		
		//�� �����¼���, �����¼��� ������ �����¼� �� �¼����� ����
		show.getShowDetail().setShowSeat(uti.modifySeatTable(oldSeatTable, bookSeatList, "1"));
		
		
		//�ٲ� �����¼� ������ ���޹޾� ������ ����
		show.getShowDetail().setShowRate(uti.bookedRate(show.getShowDetail().getShowSeat()));
		
		showDetailService.modifyShowDetail(show.getShowDetail());
		
		
		//��� ���� ����
		Refund refund=new Refund();
		refund.setRefundOrderCode(orderCode);
		refund.setRefundPenalty(1000);
		refund.setRefundPay(order.getOrderPrice());
		refund.setRefundState("ȯ�ҿ�û");
		refund.setRefundUserId(order.getOrderUserId());
		
		refundService.addRefund(refund);
		
		return "redirect:/book_detail/"+orderCode;
	}
	
}