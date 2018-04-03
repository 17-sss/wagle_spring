package wagle.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;



import wagle.board.WagleDataBean;
import wagle.board.WaglelistDBMybatis;


@Controller
@RequestMapping("/board")
public class BoardController{
	String wboardid="1";

	WaglelistDBMybatis dbWagle = wagle.board.WaglelistDBMybatis.getInstance();
	
	@ModelAttribute
	public void addAttributes(String wboardid) {
		if (wboardid!=null) {
			this.wboardid = wboardid;
		}
	}
	
	// 마이페이지-그룹리스트
	@RequestMapping("/mylist")
	public String mylist(HttpServletRequest req,Model model) throws Throwable {
		
		int count = 0;

		List mylist = null;
		
		HttpSession session=req.getSession();
		String name=(String)session.getAttribute("name");
		
		count = dbWagle.getWagleCount1(name);
		if (count >0){
			mylist = dbWagle.getWagles1(name);
			}
			
		model.addAttribute("mylist",mylist);
		model.addAttribute("count", count);

		int count2 = 0;

		List mylist2 = null;
		
		count2 = dbWagle.getWagleCount2(name);
		if (count2 >0){
			mylist2 = dbWagle.getWagles2(name);
			}
		
		model.addAttribute("mylist2",mylist2);
		model.addAttribute("count2", count2);
		
		return "/board/mylist";
	}

	// 와글와글
	@RequestMapping("/waglelist")
	public String waglelist(HttpServletRequest req, Model model) throws Throwable {

		
		List waglelist = null;

		HttpSession session=req.getSession();
		
		String name=(String)session.getAttribute("name");
		waglelist = dbWagle.getWaglelist();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date mTime = new Date ();
		String today = sdf.format(mTime);
		
		
		model.addAttribute("waglelist",waglelist);
		model.addAttribute("today",today);
	
		return "/board/waglelist";
	}
	
	
	// 오픈와글
	@RequestMapping("/wagleOpen")
	public ModelAndView wagleOpen(HttpServletRequest req, WagleDataBean wagle) throws Throwable {
		HttpSession  session = req.getSession();
		String whost=(String)session.getAttribute("name");
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("whost", whost);
		mv.setViewName("/board/wagleOpen");
		
		return mv;
	}
	
	@RequestMapping("/wagleOpenPro")
	public String wagleOpenPro(MultipartHttpServletRequest request, WagleDataBean wagle,Model model) throws Throwable {
		
		ModelAndView mv = new ModelAndView();
		MultipartFile multi = request.getFile("uploadfile");
		String filename = multi.getOriginalFilename();
		System.out.println("filename:["+filename+"]");
		if (filename != null && !filename.equals("")) {
			String uploadPath = request.getRealPath("/")+"wagleimg";
			System.out.println(uploadPath);
			FileCopyUtils.copy(multi.getInputStream(),new FileOutputStream(uploadPath+"/"+multi.getOriginalFilename()));
			
			wagle.setFilename(filename);
			wagle.setFilesize((int)multi.getSize());
			
		}else {
			wagle.setFilename("");
			wagle.setFilesize(0);
		}

		dbWagle.wagleOpen(wagle);
		
		return "redirect:mylist";
	}
	
	/*
	
	//업데이트 와글
	public String groupUpdate(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		int wboardid=Integer.parseInt(req.getParameter("wboardid"));
		int pageNum=Integer.parseInt(req.getParameter("pageNum"));
		WagleDataBean wagle = dbWagle.getWagle(wboardid);
		 
		 int all = dbWagle.getWagleCount3(wboardid);
		 req.setAttribute("wagle", wagle);
		 req.setAttribute("pageNum", pageNum);
		 req.setAttribute("all", all);
		 
	 return  "/1/groupUpdate.jsp"; 
	}
	
	public String groupUpdatePro(HttpServletRequest req, HttpServletResponse res) throws Throwable {
		
		String realFolder="";
		String encType="euc-kr";
		int maxSize = 10*1024*1024;
		ServletContext context = req.getServletContext();
		realFolder = context.getRealPath("wagleimg");
		MultipartRequest multi = null;
		multi = new MultipartRequest(req,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
		Enumeration files = multi.getFileNames();
		String filename="";
		File file = null;
		
		
		if (files.hasMoreElements()) { 
			String name = (String) files.nextElement();
			filename=multi.getFilesystemName(name);
			String original = multi.getOriginalFileName(name); 
			String type = multi.getContentType(name);
			file = multi.getFile(name);
			
		}
	
		WagleDataBean wagle = new WagleDataBean();
	
		if (multi.getParameter("wboardid")!=null&&!multi.getParameter("wboardid").equals("")) {
			wagle.setWboardid(Integer.parseInt(multi.getParameter("wboardid")));}
		
		wagle.setWname(multi.getParameter("wname"));
		wagle.setWhost(multi.getParameter("whost"));
		wagle.setWprofile(multi.getParameter("wprofile"));
		wagle.setWintro(multi.getParameter("wintro"));
		wagle.setWmax(Integer.parseInt(multi.getParameter("wmax")));
		wagle.setWcategory(multi.getParameter("wcategory"));
		wagle.setWloc(multi.getParameter("wloc"));
		wagle.setWstart(multi.getParameter("wstart"));
		wagle.setWend(multi.getParameter("wend"));
		
		if (file!=null) {
			wagle.setFilename(filename);
			wagle.setFilesize((int)file.length());
			
			
		}
		else {
			String name=multi.getParameter("filename");
			int size=Integer.parseInt(multi.getParameter("filesize"));
			wagle.setFilename(name);
			wagle.setFilesize(size);
		}
		
		
		int chk=dbWagle.updateWagle(wagle); 
		req.setAttribute("wagle", wagle);
		
		int pageNum=Integer.parseInt(multi.getParameter("pageNum"));
		req.setAttribute("pageNum", pageNum);
		if (chk==1) {

			return "/1/groupUpdatePro.jsp";
		}
			 return  null;  
	}
	
	//와글 삭제
	public String deleteWagle(HttpServletRequest req,
			 HttpServletResponse res)  throws Throwable { 
			 
		String pageNum = req.getParameter("pageNum");
		 if(pageNum == null || pageNum == "") {
			 pageNum = "1";
		 }
		 
		 
		 int wboardid = Integer.parseInt(req.getParameter("wboardid"));


		int check=dbWagle.deleteWagle(wboardid);
		req.setAttribute("check", check);
		return  "/1/groupDelete.jsp";
		
		}
	
	//와글 내용 확인
	public String wagleContent(HttpServletRequest req,
			 HttpServletResponse res)  throws Throwable {
		
		int wboardid = Integer.parseInt(req.getParameter("wboardid"));
		WagleDataBean wagle = dbWagle.getWagle(wboardid);
		
		HttpSession session=req.getSession();
		String wagler=(String)session.getAttribute("name");
		if (wagler==null) {
			wagler="nosession";
		}
	
		Boolean chk=dbWagle.waglechk(wboardid, wagler);
		
		int all=dbWagle.getWagleCount3(wboardid);
		
		req.setAttribute("chk", chk);
		req.setAttribute("wagle", wagle);
		req.setAttribute("all",all);
		req.setAttribute("wagler", wagler);
		
		
		//대빈쓰
		 * int wboardid = Integer.parseInt(req.getParameter("wboardid"));
		WaglelistDBMybatis dbPro = WaglelistDBMybatis.getInstance();

		WagleDataBean wagle = dbPro.getWagle(wboardid);
		req.setAttribute("wagle", wagle);
		String pageNum = req.getParameter("pageNum");
		if(pageNum == null || pageNum == ""){
		pageNum = "1";
		}
		int pageSize =10;
		
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*pageSize+1;
		int count = 0;
		int endRow = currentPage*pageSize;
		int number = 0;
		
		List articleList = null;
		ReviewMyBatis dbPro2 = ReviewMyBatis.getInstance();
		
		String boardid = req.getParameter("wboardid");
		
		count = dbPro2.getArticleCount(boardid);
		
		if(count > 0) {
			articleList = dbPro2.getArticles(startRow, endRow, boardid);
		}
		number = count -(currentPage-1)*pageSize;
		
		int bottomLine =3; 
		
		int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
		int startPage = 1 +(currentPage -1) /bottomLine*bottomLine;
		int endPage = startPage + bottomLine -1;

		
		if (endPage > pageCount) endPage = pageCount;
		
		req.setAttribute("count", count);
		req.setAttribute("boardid", boardid);
		req.setAttribute("count", count);
		req.setAttribute("articleList", articleList);
		req.setAttribute("currentPage", currentPage);
		req.setAttribute("startPage", startPage);
		req.setAttribute("bottomLine", bottomLine);
		req.setAttribute("endPage", endPage);
		req.setAttribute("pageCount", pageCount);
		//
		return "/1/wagleContent.jsp";
	}
	
	//와글에 가입
	public String wagleJoin(HttpServletRequest req,
			 HttpServletResponse res)  throws Throwable {
		int wboardid = Integer.parseInt(req.getParameter("wboardid"));
		String wname=req.getParameter("wname");
		HttpSession session=req.getSession();
		String wagler=(String)session.getAttribute("name");
		dbWagle.wagleJoin(wboardid,wagler,wname);

		return "/1/wagleJoin.jsp";
				
	}
	
	//와글에서 탈퇴
	public String wagleOut(HttpServletRequest req,
			 HttpServletResponse res)  throws Throwable {
		int wboardid = Integer.parseInt(req.getParameter("wboardid"));
		HttpSession session=req.getSession();
		String wagler=(String)session.getAttribute("name");
		dbWagle.wagleOut(wboardid,wagler);
		
		return "/1/wagleOut.jsp";
	}
	
*/
	/*// FAQ
		public String faqlist(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			return "/1/faq/faqlist.jsp";
		}
		
		public String reviewinsert(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			BoardDataBean article = new BoardDataBean();
			article.setNum(Integer.parseInt(req.getParameter("num")));
			article.setBoardid(req.getParameter("boardid"));
			article.setContent(req.getParameter("content"));
			article.setWriter(req.getParameter("writer"));

			ReviewMyBatis dbPro = ReviewMyBatis.getInstance();
			dbPro.insertArticle(article);

			return "mylist";
		}
		public void reviewdelete(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			BoardDataBean article = new BoardDataBean();
			
			int num = Integer.parseInt(req.getParameter("num"));
			
			String boardid = req.getParameter("boardid");
			ReviewMyBatis dbPro = ReviewMyBatis.getInstance();
			dbPro.deleteArticle(num);
			
			res.sendRedirect(req.getContextPath() + "/wagle/wagleContent?wboardid="+boardid);
		}
		public void reviewupdate(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			
			BoardDataBean article = new BoardDataBean();
			
			article.setContent(req.getParameter("content"));
			article.setNum(Integer.parseInt(req.getParameter("num")));
			
			String boardid =req.getParameter("boardid");
		
			
			ReviewMyBatis dbPro = ReviewMyBatis.getInstance();
			dbPro.updateArticle(article);
			
			
			res.sendRedirect(req.getContextPath() + "/wagle/wagleContent?wboardid="+boardid);
		}
		public String message(HttpServletRequest req, HttpServletResponse res) throws Throwable {
			
			
			
			return "/1/message/message.jsp";
		}*/
		
}
		