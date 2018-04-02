package wagle.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.members.MemberDBMybatis;
import wagle.members.MemberDataBean;

@Controller
@RequestMapping("/member")
public class MemberController {

	/*WaglelistDBMybatis dbPro= WaglelistDBMybatis.getInstance();*/
	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();

	
	// 메인
	@RequestMapping("/index")
	public String index(Model model) {
		/*List imgslide=dbPro.imgslide();
		model.addAttribute("imgslide", imgslide);*/
		return "index";
	}
	
	// 회원가입 폼
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(MemberDataBean member)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", member.getNum());
		mv.setViewName("joinForm");
		return mv;
	}
	
	//회원가입 pro
	@RequestMapping("/joinPro")
	public String joinPro(MemberDataBean member)throws Throwable {	
		/*member = new MemberDataBean();  --> 새로 객체를 받아오면 null만 들어온다!!*/
		System.out.println(member);
		dbMember.insertMember(member);	
		return "index";
	}

	
	//이메일 중복확인
	/*@RequestMapping("/confirmId")
	public boolean confirmId(String email) {
		boolean result = false;
		
		Map map = new HashMap();
		map.put("email", email);
		Map map2 = sqlSession.selectOne(namespace+".confirmId", map);
		
		if(map2!=null) {
			result=true;
		}
		sqlSession.close();
		return result;
	}*/
	
	//로그인
	@RequestMapping("/login")
	      public String login(HttpServletRequest request)
	    		  throws Throwable { 
	  		
		
	  		String sessionEmail = request.getParameter("email");
	  		String pwd = request.getParameter("pwd");
	  		
	  		
	  		int pwcheck = dbMember.login(sessionEmail, pwd);	
	  		
	  		request.setAttribute("pwcheck", pwcheck);
	  		
	  		if (pwcheck==-1) {
	  			return "loginPro";
	  		}else if (pwcheck==0) {
	  			return "loginPro";
	  		}else{
	  			HttpSession session = request.getSession();
	  			session.setAttribute("sessionEmail", sessionEmail);	
	  			/*session.setAttribute("name", name);//name받아오기
	  			System.out.println(name);*/
	  			return "redirect:/index";
	  	   }		
	} 
	   
	
	//로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	//update
	@RequestMapping("/updateForm")
	public String updateForm(int num, Model model, HttpServletRequest request)
			throws Exception{
		HttpSession session = request.getSession();	
		
		String email = (String) session.getAttribute("email");
		
		MemberDataBean member = dbMember.getUser(num, email, "update");
		model.addAttribute("member", member);
		
		return "updateForm";
	} 
	
	/* public String updateForm(int num, HttpServletRequest request, Model mv)throws Throwable { 
		
		HttpSession session = request.getSession();
		String email = (String)session.getAttribute("email");
		
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null || pageNum ==""){
			pageNum="1";} 
		try{
			MemberDataBean member = dbMember.getUser(num, email, "update");
			mv.addAttribute("member", member);
			mv.addAttribute("pageNum", pageNum);
		}catch(Exception e){}
		return  "/updateForm"; 
			}*/
	
	/*
	public String updatePro(HttpServletRequest req,
			 HttpServletResponse res)  throws Throwable { 
			 
		HttpSession session = req.getSession();
		String id = (String)session.getAttribute("id"); 
		
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum ==""){
			pageNum="1";} 
	
		
		JoinDataBean info= new JoinDataBean();
		
		
		info.setId(req.getParameter("id"));
		info.setName(req.getParameter("name"));
		info.setPwd(req.getParameter("pwd"));
		info.setGender(req.getParameter("gender"));
		info.setBirthdate(req.getParameter("birthdate"));
		info.setTel(req.getParameter("tel"));
		info.setEmail(req.getParameter("email"));
		info.setCon_past(req.getParameter("con_past"));
		info.setCon_date(req.getParameter("con_date"));
		info.setCon_cat(req.getParameter("con_cat"));
		info.setPosition(req.getParameter("position"));
		
		System.out.println(info); 
		JoinDBMybatis dbPro = JoinDBMybatis.getInstance(); 
		int chk = dbPro.updateData(info);
		
		req.setAttribute("id", id);
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("chk", chk);
		
		if (chk==1){ 
			return "/members/updatePro.jsp";
		}else{ 
			return "/members/updatePro.jsp";
		}
	} 
	
	 */
	
	//delete
	
}
