package ticket.finder.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import ticket.finder.dto.OrderRate;
import ticket.finder.dto.ShowDetail;
import ticket.finder.dto.ShowXShow;
import ticket.finder.dto.TfUser;
import ticket.finder.exception.LoginAuthFailException;
import ticket.finder.exception.UserIdExistsException;
import ticket.finder.exception.UserNotFoundException;
import ticket.finder.exception.WrongJoinException;
import ticket.finder.service.ShowXShowService;
import ticket.finder.service.TfOrderService;
import ticket.finder.service.TfUserService;

@Controller
public class SunController {
	@Autowired
	private TfUserService tfUserService;
	
	@Autowired
	private TfOrderService tfOrderService;
	
	@Autowired
	private ShowXShowService showXShowService;
	
	@Autowired
	private JavaMailSender mailSender;
	
	@RequestMapping(value = "/search", method = RequestMethod.POST)
	public String search(@RequestParam String search, Model model) {
		System.out.println("search="+search);
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("search", search);
		map.put("search", search);
		map.put("search", search);
		List<ShowXShow> srchList = showXShowService.getSearch(map);
		model.addAttribute("search", search);
		model.addAttribute("srchList", srchList);
		return "user/include/search";
	}
	
	@RequestMapping(value = "/service", method = RequestMethod.GET)
	public String service() {
		return "user/include/service";
	}
	@RequestMapping(value = "/privacypolicy", method = RequestMethod.GET)
	public String privacypolicy() {
		return "user/include/privacypolicy";
	}
	@RequestMapping(value = "/youth", method = RequestMethod.GET)
	public String youth() {
		return "user/include/youth";
	}
	
	@RequestMapping(value = "/service1", method = RequestMethod.GET)
	public String service1() {
		return "user/include/terms/service";
	}
	@RequestMapping(value = "/privacypolicy1", method = RequestMethod.GET)
	public String privacypolicy1() {
		return "user/include/terms/privacypolicy";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login() {
		return "user/include/login";
	}
	
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ModelAttribute TfUser tfUser, @RequestParam String userPw, HttpSession session, Model model) throws LoginAuthFailException, UserNotFoundException {
		//tfUserService.loginAuth(tfUser);
		tfUserService.modifyUserLastLogin(tfUser.getUserId());
		
		TfUser loginUserInfo=tfUserService.getUser(tfUser.getUserId());
		session.setAttribute("loginUserInfo", loginUserInfo);
		
		if(loginUserInfo==null || !BCrypt.checkpw(userPw, loginUserInfo.getUserPw())) {
			model.addAttribute("message", "���̵� ���ų� ��й�ȣ�� ���� �ʽ��ϴ�.");
			return "user/include/login";
		}
		return "redirect:/";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.GET)
	public String join() {
		return "user/include/join";
	}
	
	@RequestMapping(value = "/join", method = RequestMethod.POST)
	public String join(@ModelAttribute TfUser tfUser, @RequestParam(required = false) String phone1, @RequestParam(required = false) String phone2, @RequestParam(required = false) String phone3,
			@RequestParam(required = false) String year, @RequestParam(required = false) String month, @RequestParam(required = false) String date) throws UserIdExistsException, WrongJoinException {
		
		//TfUser user = new TfUser();
		String userBirth=year+"�� "+month+"�� "+date+"��";
		String userTel=phone1+"-"+phone2+"-"+phone3;
		tfUser.setUserBirth(userBirth);
		tfUser.setUserTel(userTel);
		/*
		int result = tfUserService.getIdCheck(tfUser.getUserId());
		if(result==1) {
			//System.out.println("���̵� �ߺ�");
			return "user/include/join";			
		} else if(result==0) {
			//System.out.println("���̵� ��� ����");
			tfUserService.addUser(tfUser);
		}
		*/
		tfUserService.addUser(tfUser);
		return "user/include/login";
	}
	
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	@ResponseBody
	public int idCheck(String userId) {
		return tfUserService.getIdCheck(userId);
	}
	
	@RequestMapping(value = "/findId", method = RequestMethod.GET)
	public String findId() {
		return "user/include/findId";
	}
	
	@ResponseBody
	@RequestMapping(value = "/findId1", method = RequestMethod.GET)
	public String findId1(String userName, String userEmail, Model model, HttpSession session) throws UserNotFoundException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		String userId = tfUserService.getFindIdUser(map);
		
		model.addAttribute("userId", userId);
		return userId;
	}

	@RequestMapping(value = "/id", method = RequestMethod.GET)
	public String id(String userId, Model model) {
		model.addAttribute("userId", userId);
		return "user/include/id";
	}
	
	
	@RequestMapping(value = "/email", method = RequestMethod.GET)
	@ResponseBody
	public String email(@RequestParam String email, Model model, HttpSession session) {
		String authNum = AuthNumber();
		//System.out.println(email);
		
		String sender = "jisun124918@gmail.com";
		String user = email;
		String title = "���������� ������ �Խ��ϴ�^^";
		String content = "������ȣ : "+authNum+"\n������ȣ�� �Է����ּ���.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");
			messageHelper.setFrom(sender);
			messageHelper.setTo(user);
			messageHelper.setSubject(title);
			messageHelper.setText(content);
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		//model.addAttribute("authNum", authNum);
		session.setAttribute("authNum", authNum);
		return authNum;
	}
	
	public String AuthNumber() {
        Random rand = new Random();
        String num = "";
        
        for(int i=0;i<6;i++) {
            String ran = Integer.toString(rand.nextInt(10));
            num += ran;
        }
        return num;
    }
	
	
	
	@RequestMapping(value = "/findPw", method = RequestMethod.GET)
	public String findPw() {
		return "user/include/findPw";
	}
	
	@RequestMapping(value = "/findPw", method = RequestMethod.POST)
	public String findPw(@RequestParam(required = false) String userName, @RequestParam(required = false) String userEmail, Model model) throws UserNotFoundException {
		Map<String, String> map = new HashMap<String, String>();
		map.put("userName", userName);
		map.put("userEmail", userEmail);
		String userId = tfUserService.getFindIdUser(map);
		//System.out.println("map="+map);
		System.out.println("userId="+userId);
		if(userId!=null) {
			String pwnum = pwNumber(); //�ӽ� ��й�ȣ ����
			//System.out.println("pwnum="+pwnum);
			TfUser user=new TfUser();
			user.setUserPw(pwnum);
			user.setUserId(userId);
			tfUserService.modifyUser(user);
			
			model.addAttribute("pwnum", pwnum);
		} else if(userId==null) {
			model.addAttribute("message", "�Է¹��� �̸��� �̸����� ȸ�������� ��ġ�ϴ� ���̵� �������� �ʽ��ϴ�.");
		}
		
		return "user/include/pw";
	}
	
	public String pwNumber() {
		Random ran = new Random();
	    String pwnum = "";
	    int i;

	    for (i=0;i<9;i++) {
	       int num = (int)48+(int)(ran.nextDouble()*74);
	       pwnum = pwnum+(char)num;
	    }
	    return pwnum;
	}
	
	
	
	
	@RequestMapping(value = "/modifyPw", method = RequestMethod.GET)
	public String modifyPw() {
		return "user/include/passwordCheck";
	}
	
	@RequestMapping(value = "/modifyPw", method = RequestMethod.POST)
	public String modifyPw(@RequestParam String userPw, HttpSession session) throws UserNotFoundException {
		TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		String userId = loginUserInfo.getUserId();
		//System.out.println("userId="+userId);
		
		TfUser user = new TfUser();
		user.setUserPw(userPw);
		user.setUserId(userId);
		tfUserService.modifyUser(user);
		session.invalidate();
		return "user/include/login";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/pwCheck", method = RequestMethod.GET)
	public String pwCheck() {
		return "user/include/passwordCheck";
	}
	
	@RequestMapping(value = "/pwCheck", method = RequestMethod.POST)
	public String pwCheck(@RequestParam String userPw, HttpSession session, Model model) {
		TfUser loginUserInfo = (TfUser)session.getAttribute("loginUserInfo");
		String pw = loginUserInfo.getUserPw(); //���ǿ� ����� ��й�ȣ
		String passwd = userPw; //�Է¹��� ��й�ȣ
		
		boolean pass = BCrypt.checkpw(passwd, pw);
		System.out.println("pass="+pass);
		
		if(pass==false) {
			model.addAttribute("message", "��й�ȣ�� Ʋ���ϴ�.");
			return "user/include/passwordCheck";		
		} else if(pass==true) {
			return "user/include/modifyPw";			
		}
		return "user/include/modifyPw";			
	}
	
	
	
	
	@RequestMapping(value = "/userinfo", method = RequestMethod.GET)
	public String userinfo() {
		return "user/include/userinfo";
	}
	
	@RequestMapping(value = "/userinfo", method = RequestMethod.POST)
	public String userinfo(@RequestParam String userId, @RequestParam String userPost, @RequestParam String userAddr1, @RequestParam String userAddr2, 
			@RequestParam String userEmail, HttpSession session) throws UserNotFoundException {
		TfUser user=new TfUser();
		user.setUserPost(userPost);
		user.setUserAddr1(userAddr1);
		user.setUserAddr2(userAddr2);
		user.setUserEmail(userEmail);
		user.setUserId(userId);
		tfUserService.modifyUser(user);
		
		if(session.getAttribute("URI")!=null) {
			String URI=(String)session.getAttribute("URI");
			session.removeAttribute("URI");
			return "redirect:"+URI;
		}
		session.invalidate();
		return "user/include/main";
	}
	
	
	//��ŷ ���(�帣:��ü/�ϰ�)
	@RequestMapping(value = "/rank", method = RequestMethod.GET)
	public String rank(Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("date", "30");
		List<OrderRate> cntList = tfOrderService.getRankGenre(map);
		//System.out.println(cntList);
		/*
		int count=0;
		for(OrderRate cnt:cntList) {
			count+=cnt.getCnt();
		}
		*/
		//System.out.println("count="+count);
		
		List<ShowXShow> rankList = new ArrayList<ShowXShow>();
		ShowXShow showList = null;
		for(OrderRate show:cntList) {
			showList = showXShowService.getShowName(show.getsName());
			rankList.add(showList);
		}
		model.addAttribute("rankList", rankList);
		
		return "user/include/rank";
	}
	
	//��ŷ ���(����)
	@ResponseBody
	@RequestMapping(value = "/rank1", method = RequestMethod.GET)
	public List<ShowXShow> rank1(@RequestParam String sGenre, @RequestParam String date, Model model) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("date", date);
		map.put("sGenre", sGenre);
		List<OrderRate> cntList = tfOrderService.getRankGenre(map);
		
		List<ShowXShow> rankList = new ArrayList<ShowXShow>();
		ShowXShow showList = null;
		for(OrderRate show:cntList) {
			showList = showXShowService.getShowName(show.getsName());
			
			
			rankList.add(showList);
		}
		//model.addAttribute("rankList", rankList);
		
		return rankList;
	}
	
	//������ Ŭ����
	@RequestMapping(value = "/region", method = RequestMethod.GET)
	public String region(Model model) {
		//������ �Ż�ǰ�� - ��ü
		Map<String, String> map = new HashMap<String, String>();
		List<ShowXShow> areaList1 = showXShowService.getAreaNew(map);
		model.addAttribute("areaList1", areaList1);
		
		return "user/include/region";
	}
	
	//�Ż�ǰ��
	@ResponseBody
	@RequestMapping(value = "/region1", method = RequestMethod.GET)
	public Map<String, Object> region1(@RequestParam String showArea) {
		//������ �Ż�ǰ�� - ��ü
		Map<String, String> map = new HashMap<String, String>();
		map.put("showArea", showArea);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("areaList", showXShowService.getAreaNew(map));
		
		return map1;
	}
	
	//�����ӹڼ�
	@ResponseBody
	@RequestMapping(value = "/region2", method = RequestMethod.GET)
	public Map<String, Object> region2(@RequestParam String showArea) {
		//������ �Ż�ǰ�� - ��ü
		Map<String, String> map = new HashMap<String, String>();
		map.put("showArea", showArea);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("areaList", showXShowService.getAreaEnd(map));
		
		return map1;
	}
	
	//��ǰ����
	@ResponseBody
	@RequestMapping(value = "/region3", method = RequestMethod.GET)
	public Map<String, Object> region3(@RequestParam String showArea) {
		//������ �Ż�ǰ�� - ��ü
		Map<String, String> map = new HashMap<String, String>();
		map.put("showArea", showArea);
		
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("areaList", showXShowService.getAreaName(map));
		
		return map1;
	}
	
	
	
	

}