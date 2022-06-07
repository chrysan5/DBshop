package com.company.shop;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.company.shop.orderbean.OrderDto;
import com.company.shop.orderdao.OrderDao;
import com.company.shop.productbean.ProductDto;
import com.company.shop.productdao.ProductDao;
import com.company.shop.qnaAnswerbean.QnaAnswerDto;
import com.company.shop.qnaAnswerdao.QnaAnswerDao;
import com.company.shop.qnabean.QnaDto;
import com.company.shop.qnadao.QnaDao;
import com.company.shop.usersbean.UsersDto;
import com.company.shop.usersdao.UsersDao;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

//	@Autowired
//	private CartDao cartDao;
	@Autowired
	private OrderDao orderDao;
	@Autowired
	private ProductDao productDao;
	@Autowired
	private QnaDao qnaDao;
	@Autowired
	private QnaAnswerDao qnaAnswerDao;
	@Autowired
	private UsersDao usersDao;
	@Autowired
	ServletContext context;

	// =========================메인=====================
	@RequestMapping("Main.do")
	public String home(Model model, HttpServletRequest request) {

		String insertText = request.getParameter("search");

		if (insertText == null || insertText.equals("")) {
			model.addAttribute("data", productDao.productAll());
		} else {
			model.addAttribute("data", productDao.productSearch(insertText));
		}

		return "main";
	}

	// 메인 종류별 조회
	@RequestMapping("MainKind.do")
	public String mainKind(Model model, HttpServletRequest request) {

		String kind = request.getParameter("kind");

		model.addAttribute("data", productDao.productSelectKind(kind));
		return "main";
	}

	// =========================로그인=====================
	// 로그인 폼
	@RequestMapping("Login.do")
	public String login() {
		return "login";
	}

	// 로그인 처리
	@RequestMapping("LoginProc.do")
	public String loginProc(String id, String pw, String save, HttpSession session, HttpServletRequest request,
			HttpServletResponse response) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("pw", pw);

		UsersDto usersDto = usersDao.login(map);
		String goPage = null;
		if (usersDto != null) {
			session = request.getSession();

			// 아이디 저장을 안하고 로그인했을때
			if (save == null && usersDto.getIdx() != 0) { // 0이 아니란 말은 로그인할때 id와 pw가 맞다는말
				Cookie cookie = new Cookie("saveid", usersDto.getId()); // 쿠키 객체를 생성하고
				cookie.setMaxAge(0);
				response.addCookie(cookie); // 쿠키 객체를 웹브라우저로 보낸다
				session.setAttribute("logindata", usersDto);
			} else if (save != null && save.equals("true") && usersDto.getIdx() != 0) { // 아이디 저장을 하고 로그인 했을때
				Cookie cookie = new Cookie("saveid", usersDto.getId());
				cookie.setMaxAge(60 * 60 * 24 * 7);
				response.addCookie(cookie);
				session.setAttribute("logindata", usersDto);
			}

			if (usersDto.getUseyn() == 2) {
				goPage = "/userDrop";
			} else {
				session.setAttribute("userInfo", usersDto);
				goPage = "redirect:/Main.do";
			}
		} else {
			goPage = "/loginerr";
		}

		return goPage;
	}

	// 로그아웃
	@RequestMapping("Logout.do")
	public String loginout(HttpSession session, HttpServletResponse response) {
		session.invalidate();
		return "redirect:/Main.do";
	}

	// =========================회원가입=====================
	// 회원가입 이용약관
	@RequestMapping("Tos.do")
	public String editmember() {
		return "tos";
	}

	// 회원가입 폼
	@RequestMapping("Join.do")
	public String join() {
		return "join";
	}

	// 회원가입 처리
	@RequestMapping("JoinProc.do")
	public String joinProc(UsersDto usersDto) {
		Map<String, String> map = new HashMap<>();
		map.put("id", usersDto.getId());
		map.put("pw", usersDto.getPw());
		map.put("name", usersDto.getName());
		map.put("email", usersDto.getEmail());
		map.put("zipCode", usersDto.getZipCode());
		map.put("address", usersDto.getAddress());
		map.put("address2", usersDto.getAddress2());
		map.put("phone", usersDto.getPhone());

		usersDao.insertUser(map);

		return "main";
	}

	// 아이디 중복체크
	@RequestMapping(value = "CheckIdAjax.do", method = RequestMethod.POST)
	@ResponseBody
	public int CheckIdAjax(String id) throws IOException, ServletException {

		return usersDao.CheckDataJSon(id);
	}

	// =========================마이페이지=====================
	// 마이페이지
	@RequestMapping("PwChk.do")
	public String pwchk() {
		return "/pwchkupdate";
	}

	// 마이페이지 넘어가기전 비밀번호 체크
	@RequestMapping("MyPage.do")
	public String mypage(String idx, String pw, HttpSession session, Model model) {

		String goPage = "";

		UsersDto usersDto = (UsersDto) session.getAttribute("userInfo");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("idx", Integer.parseInt(idx));
		map.put("id", usersDto.getId());
		map.put("pw", pw);

		int result = usersDao.pwChk(map);

		if (result > 0) { // 비밀번호가 맞다면

			usersDto = usersDao.getMyInfo(usersDto.getId());
			model.addAttribute("usersDto", usersDto);

			goPage = "/myPage";
		} else { // 비밀번호가 틀리다면
			goPage = "/pwchkerr";
		}

		return goPage;
	}

	// 회원탈퇴
	@RequestMapping("Deletemember.do")
	public String deletemember(HttpSession session) {
		UsersDto usersDto = (UsersDto) session.getAttribute("userInfo");

		int result = usersDao.deleteUsers(usersDto.getId());

		if (result == 1) {
			session.invalidate();
		}

		return "redirect:/Main.do";
	}

	// 회원정보 수정 페이지
	@RequestMapping("Editmember.do")
	public String editmember(HttpSession session, Model model) {
		UsersDto usersDto = (UsersDto) session.getAttribute("userInfo");

		// 재사용
		usersDto = usersDao.getMyInfo(usersDto.getId());
		model.addAttribute("usersDto", usersDto);

		return "/editmember";
	}

	// 회원정보 수정처리
	@RequestMapping("UsersUpdateProc.do")
	public String usersUpdateProc(String id, String pw, String name, String email, String zipCode, String address,
			String address2, String phone) {
		Map<String, String> map = new HashMap<>();
		map.put("id", id);
		map.put("pw", pw);
		map.put("name", name);
		map.put("email", email);
		map.put("zipCode", zipCode);
		map.put("address", address);
		map.put("address2", address2);
		map.put("phone", phone);

		usersDao.updateUsers(map);

		return "redirect:/Main.do";
	}

	// =========================게시판=====================
	// 메인에서 게시물 조회
	@RequestMapping("ProductRead.do")
	public String poductRead(int productNum, Model model) {
		productDao.productHit(productNum);
		model.addAttribute("productData", productDao.productSelect(productNum));
		return "productRead";
	}

	// 게시판 조회
	@RequestMapping("Board.do")
	public String board(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageSize = 5;
		int totalCount = productDao.productCount();
		int pageCount = totalCount / pageSize;// 더블이 아니기 때문에 12일경우 12/10 이면 1이됨.
		if (totalCount % pageSize > 0)
			pageCount++;
		int numTmp = (Integer.parseInt(strNum) - 1) * pageSize;
		Map<String, Integer> map = new HashMap<>();
		map.put("numTmp", numTmp);
		map.put("pageCount", pageSize);

		model.addAttribute("board", productDao.productPaging(map));
		model.addAttribute("pageCount", pageCount);
		// model.addAttribute("board", productDao.productAll());

		return "board";
	}

	// 관리자 게시판 조회
	@RequestMapping("BoardRead.do")
	public String boardRead(int productNum, Model model) {
		model.addAttribute("board", productDao.productSelect(productNum));
		return "boardRead";
	}

	// 게시판 작성 페이지 이동
	@RequestMapping("BoardWrite.do")
	public String boardWirte() {
		return "boardWrite";
	}

	// 게시판 작성 Proc
	@RequestMapping("BoardWriteProc.do")
	public String boardWriteProc(MultipartHttpServletRequest mrequest) {
		MultipartFile file = mrequest.getFile("image");// 넘어온 파일 객체

		String filename = file.getOriginalFilename();// 객체에서 이름 뽑아냄

		String path = context.getRealPath("/resources/upload/");

		try {
			file.transferTo(new File(path + filename));

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, String> map = new HashMap<>();
		map.put("kind", mrequest.getParameter("kind"));
		map.put("price", mrequest.getParameter("price"));
		map.put("name", mrequest.getParameter("name"));
		map.put("contents", mrequest.getParameter("contents"));
		map.put("image", filename);

		productDao.productWriteProc(map);

		return "redirect:/Board.do";
	}

	// 관리자 게시판 삭제
	@RequestMapping("BoardDelete.do")
	public String boardDelete(int productNum) {
		productDao.productDelete(productNum);
		return "redirect:/Board.do";
	}

	// 게시판 수정 조회
	@RequestMapping("BoardUpadte.do")
	public String boardUpdate(Model model, int productNum) {
		model.addAttribute("boardUpdate", productDao.productSelect(productNum));
		return "boardUpdate";
	}

	// 게시판 수정 proc
	@RequestMapping("BoardUpadteProc.do")
	public String boardUpdateProc(MultipartHttpServletRequest mrequest) {
		MultipartFile file = mrequest.getFile("image");// 넘어온 파일 객체

		String filename = file.getOriginalFilename();// 객체에서 이름 뽑아냄

		String path = context.getRealPath("/resources/upload/");

		try {
			file.transferTo(new File(path + filename));

		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Map<String, String> map = new HashMap<>();
		map.put("productNum", mrequest.getParameter("productNum"));
		map.put("kind", mrequest.getParameter("kind"));
		map.put("price", mrequest.getParameter("price"));
		map.put("name", mrequest.getParameter("name"));
		map.put("contents", mrequest.getParameter("contents"));
		map.put("image", filename);

		productDao.productUpdateProc(map);

		return "redirect:/Board.do";
	}

	// =========================QnA=====================
	@RequestMapping("Qna.do")
	public String qna(@RequestParam(value = "pageNum", required = false, defaultValue = "1") String strNum,
			Model model) {
		int pageSize = 6;
		int totalCount = productDao.productCount();
		int pageCount = totalCount / pageSize;// 더블이 아니기 때문에 12일경우 12/10 이면 1이됨.
		if (totalCount % pageSize > 0)
			pageCount++;
		int numTmp = (Integer.parseInt(strNum) - 1) * pageSize;
		Map<String, Integer> map = new HashMap<>();
		map.put("numTmp", numTmp);
		map.put("pageCount", pageSize);

		model.addAttribute("qnaList", qnaDao.selectAllQnaPaging(map));
		model.addAttribute("pageCount", pageCount);
		// model.addAttribute("qnaList", qnaDao.qnaList());
		return "qnaPage";
	}

	@RequestMapping("QnaWrite.do")
	public String QnaWrite() {
		return "qnaWrite";
	}

	@RequestMapping("QnaInsert.do")
	public String qnaInsert(QnaDto dto) {
		qnaDao.qnaInsert(dto);
		return "redirect:/Qna.do";
	}

	@RequestMapping("QnaRead.do")
	public String qnaRead(int qnaNum, Model model) { //여기 qnaNum은 qnaRead.jsp에서 받는것임
		model.addAttribute("read", qnaDao.qnaRead(qnaNum));
		model.addAttribute("prevRead", qnaDao.qnaPrevRead(qnaNum));
		model.addAttribute("nextRead", qnaDao.qnaNextRead(qnaNum));
		
		//댓글 있을경우 -댓글 가져오기 
		/*
		boolean result = qnaAnswerDao.checkExistAns(qnaNum);
		if(result == true) { //qnaNum과 같은 answerNum이 qnaAnswer 테이블에 있으면 = 답변이 있으면
			model.addAttribute("qaRead", qnaAnswerDao.qnaAnswerRead(qnaNum));
	    }*/
		
		return "qnaRead";
	}

	@RequestMapping("QnaUpdateProc.do")
	public String usersUpdateProc(String qnaNum, String title, String content) {
		Map<String, Object> map = new HashMap<>();
		map.put("qnaNum", Integer.parseInt(qnaNum));
		map.put("title", title);
		map.put("content", content);
		qnaDao.qnaUpdate(map);
		return "redirect:/Qna.do";
	}

	@RequestMapping("PwChkForQna.do") // 이페이지는 비번체크만.
	public String qnaUpdate(String qnaNum, String insertPw, String qnaId, HttpServletRequest request, Model model,
			HttpSession session) {
		String qnaNum1 = request.getParameter("qnaNum");
		String insertPw1 = request.getParameter("insertPw");
		String qnaId1 = request.getParameter("qnaId");

		// 아이디를 위해 세션정보를 불러옴, 비번으 알기 위해서도 불러옴
		session = request.getSession();
		UsersDto usersDto = (UsersDto) session.getAttribute("logindata");

		// 비번을 위해 내정보 불러옴
		// QnaDao qnaDao = new QnaDao(); 이거 여기있으면 안됨!!!
		usersDto = usersDao.getMyInfo(usersDto.getId());
		String myPw = usersDto.getPw();
		String myId = usersDto.getId();

		String goPage = "";
		if (myId.equals(qnaId1) && myPw.equals(insertPw1)) { // 내글이 맞고, 비번이 맞다면
			model.addAttribute("read", qnaDao.qnaRead(Integer.parseInt(qnaNum1))); // 이걸 qnaUpdate.jsp로 전달

			goPage = "/qnaUpdate";
		} else {
			goPage = "/pwchkerr";
		}
		return goPage;
	}

	@RequestMapping("QnaDelete.do")
	public String qnaDelete(String qnaNum, String qnaId, HttpSession session, HttpServletRequest request)
			throws ServletException, IOException {
		String qnaNum1 = request.getParameter("qnaNum");
		String qnaId1 = request.getParameter("qnaId");

		session = request.getSession();
		UsersDto usersDto = (UsersDto) session.getAttribute("logindata");
		String myId = usersDto.getId();

		if (myId.equals(qnaId1) || usersDto.getLv() == 10) {
			qnaDao.qnaDelete(Integer.parseInt(qnaNum1));
			return "redirect:/Qna.do";
		} else {
			return "qnaDeleteNot";
		}
	}

	// =========================QnaAnswer=====================
	   @RequestMapping("QnaAnswerInsert.do")
		public String qnaAnswerInsert(QnaAnswerDto qnaAnswerdto) {
			qnaAnswerDao.qnaAnswerInsert(qnaAnswerdto);
			return "redirect:/Qna.do";
			//return "redirect:/QnaRead.do"; //여기로갈때 qnum을 들고가야함
		}
	   
	   @RequestMapping("QnaAnswerDelete.do")
		public String qnaAnswerDelete(int qnaNum) {
			qnaAnswerDao.qnaAnswerDelete(qnaNum);
			//return "redirect:/QnaRead.do"; //여기로갈때 qnum을 들고가야함
			return "redirect:/Qna.do";
		}
	   
	// ========================주문조회=======================
	// 회원 주문조회
	@RequestMapping("Orderchk.do")
	public String orderch(HttpSession session, Model model) {
		UsersDto usersDto = (UsersDto) session.getAttribute("userInfo");

		String id = usersDto.getId();

		model.addAttribute("orderData", orderDao.orderChk(id));
		model.addAttribute("productData", productDao.productAll());
		return "orderchk";
	}

	// 관리자 주문조회
	@RequestMapping("Delivery.do")
	public String delivery(@RequestParam(value = "result", required = false, defaultValue = "0") int result,
			Model model) {
		if (result == 1) {
			model.addAttribute("orderData", orderDao.deliveryReady());
		} else if (result == 2) {
			model.addAttribute("orderData", orderDao.deliveryOnly());
		} else {
			model.addAttribute("orderData", orderDao.delivery());
		}
		model.addAttribute("productData", productDao.productAll());
		return "deliveryPage";
	}

	// 한개 배송으로 변경
	@RequestMapping("DeliveryProc.do")
	public String deliveryProc(int orderNum) {
		orderDao.deliveryProc(orderNum);
		return "redirect:/Delivery.do";
	}

	// 한개 배송준비중으로 변경
	@RequestMapping("DeliveryCancelProc.do")
	public String deliveryCancelProc(int orderNum) {
		orderDao.deliveryCancelProc(orderNum);
		return "redirect:/Delivery.do";
	}

	// 선택 배송으로 변경
	@RequestMapping("DeliverySelProc.do")
	public String deliverySelProc(HttpServletRequest request) {
		int count = Integer.parseInt(request.getParameter("count"));
		int orderNum = 0;
		for(int i=1; i<count ; i++){
			if(request.getParameter("sel"+i)!=null) {
				orderDao.deliveryProc(i);
			}
		}
		return "redirect:/Delivery.do";
	}
	
	// 선택 배송중으로 변경
		@RequestMapping("DeliverySelCancel.do")
		public String deliverySelCancel(HttpServletRequest request) {
			int count = Integer.parseInt(request.getParameter("count"));
			for(int i=1; i<count ; i++){
				if(request.getParameter("sel"+i)!=null) {
					orderDao.deliveryCancelProc(i);
				}
			}
			return "redirect:/Delivery.do";
		}

	// ========================주문 =======================
	// ===================== 배송/결제 페이지 ==========================
	@RequestMapping("OrderPage.do")
	public String orderProduct(String productNum, Model model) {

		List<ProductDto> productDto = productDao.readProduct(Integer.parseInt(productNum));

		if (!productDto.isEmpty()) {
			model.addAttribute("productData", productDto.get(0));
		}

		return "orderPage";
	}

	// ======================== 주문완료 =======================
	@RequestMapping("OrderConf.do")
	public String orderProduct(String prodnum, String quantity, HttpSession session, Model model) {
		UsersDto usersDto = (UsersDto) session.getAttribute("userInfo");

		String id = usersDto.getId();

		Map<String, Object> map = new HashMap<>();
		map.put("prodNum", Integer.parseInt(prodnum));
		map.put("quantity", Integer.parseInt(quantity));
		map.put("id", id);

		OrderDto orderDto = new OrderDto();

		int result = orderDao.insertOrder(map);

		String goPage = "";
		if (result > 0) {

			List<OrderDto> odto = orderDao.readOrder(orderDto.getOrderNum());

			if (!odto.isEmpty()) {
				model.addAttribute("orderData", odto.get(0));
			}

			model.addAttribute("userData", usersDto);

			goPage = "/orderConf";
		} else {
			goPage = "/orderErr";
		}

		return goPage;
	}
}
