package wagle.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import wagle.members.MemberDBMybatis;
import wagle.members.MemberDataBean;
import wagle.message.MessageMyBatis;

@Controller
@RequestMapping("/member")
public class MemberController {

	MemberDBMybatis dbMember = MemberDBMybatis.getInstance();
	MessageMyBatis dbMessage = MessageMyBatis.getInstance();
	
	// ȸ������ ��
	@RequestMapping("/joinForm")
	public ModelAndView joinForm(MemberDataBean member)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("num", member.getNum());
		mv.setViewName("joinForm");
		return mv;
	}
	
	//ȸ������ pro
	@RequestMapping("/joinPro")
	public String joinPro(MemberDataBean member)throws Throwable {	
		/*member = new MemberDataBean();  --> ���� ��ü�� �޾ƿ��� null�� ���´�!!*/
		System.out.println(member);
		dbMember.insertMember(member);	
		return "index";
	}

	
	//�̸��� �ߺ�Ȯ��
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
	
	//�α���
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
	  			MemberDataBean user = dbMember.getUser2(sessionEmail, pwcheck);
	  			session.setAttribute("name", user.getName());//name�޾ƿ���
	  			
	  			int count = dbMessage.count(user.getName());
	  			session.setAttribute("count", count);
	  			return "redirect:/index";
	  	   }		
	} 
	   
	
	//�α׾ƿ�
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
	
	//update
	@RequestMapping("/updateForm")
	public String updateForm(Model model, HttpServletRequest request)
			throws Exception{
		String sessionEmail = request.getParameter("email");
		
		HttpSession session = request.getSession();	
				
		MemberDataBean member = dbMember.getUser(sessionEmail, "update");
		model.addAttribute("member", member);
		
		return "updateForm";
	} 
	
	@RequestMapping("/updatePro")
	public String updatePro(MemberDataBean member,Model mv)
			throws Exception {

		dbMember.updateMember(member);
		int chk= dbMember.updateMember(member); 
		mv.addAttribute("member", member);
		mv.addAttribute("chk", chk);
		
		if (chk==1){ 
			return "updatePro";
		}else{ 
			return "updatePro";
		}
	}
	
	@RequestMapping(value="deleteForm")
	public String deleteForm(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		String sessionEmail = (String)session.getAttribute("email");  //�α��ε� ���� ���̵� �ش��ϴ� �н������ delete�ϱ� ���� �ʿ�

		sessionEmail = request.getParameter("email");	//admin���� delete�ϱ����� �ʿ�
		
		mv.addAttribute("email", sessionEmail);
		return  "deleteForm"; 
	} 
	
	@RequestMapping(value="deletePro")
	public String deletePro(MemberDataBean member, Model mv, HttpServletRequest request)  throws Throwable { 
		HttpSession session = request.getSession();
		
		String sessionEmail = request.getParameter("email");
		String pwd = request.getParameter("pwd");
		
		dbMember = MemberDBMybatis.getInstance();
		int check = dbMember.deleteMember(sessionEmail, pwd, (String) session.getAttribute("sessionEmail"));
		
		mv.addAttribute("check", check);
		if(check==1) {
			session.invalidate();
		}
		return "deletePro";
		
	} 
	
}
