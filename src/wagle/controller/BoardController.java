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
import wagle.review.BoardDataBean;
import wagle.review.ReviewMyBatis;


@Controller
@RequestMapping("/board")
public class BoardController{
	String wboardid="1";
	String pageNum="1";
	
	WaglelistDBMybatis dbWagle = wagle.board.WaglelistDBMybatis.getInstance();
	ReviewMyBatis dbReview = ReviewMyBatis.getInstance();
	
	@ModelAttribute
	public void addAttributes(String wboardid,String pageNum) {
		if (wboardid!=null) {
			this.wboardid = wboardid;
		}
		
		if (pageNum!=null  && pageNum !="") {
			this.pageNum = pageNum;
		}
	}
	
	//���� ������
	@RequestMapping("/index")
	public String index(Model model) {
		
		List imgslide=dbWagle.imgslide();
		model.addAttribute("imgslide",imgslide);
		System.out.println(imgslide);
		
		return "boardindex";
	}
	
	// ����������-�׷츮��Ʈ
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
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date mTime = new Date ();
		String today = sdf.format(mTime);
		
		model.addAttribute("today", today);
		
		return "/board/mylist";
	}

	// �ͱۿͱ�
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
	
	// ���¿ͱ�
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
		
		String ctype=".jpg";
		
		int chk=0;
		
		// �̹��� Ȯ���� üũ
		if (filename!=null) {
		ctype= filename.substring(filename.lastIndexOf(".")+1);
		
		if (!(ctype.equalsIgnoreCase("jpg")||ctype.equalsIgnoreCase("jpeg")||ctype.equalsIgnoreCase("png")||ctype.equalsIgnoreCase("gif"))) {
			chk=1;
			model.addAttribute("chk", chk);
			return  "/board/typechk";
			}
		}
		
		model.addAttribute("chk", chk);
		return "/board/typechk";
	}
	
	
	//������Ʈ �ͱ�
	@RequestMapping("/wagleUpdate")
	public String wagleUpdate(int wboardid,Model mv) throws Throwable {

		 WagleDataBean wagle = dbWagle.getWagle(wboardid); 
		 int all = dbWagle.getWagleCount3(wboardid);
		 SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		 Date mTime = new Date ();
		 String today = sdf.format(mTime);
		 
		 mv.addAttribute("wagle", wagle);
		 mv.addAttribute("all", all);
		 mv.addAttribute("today", today);
		 
	 return  "/board/wagleUpdate"; 
	}
	
	
	@RequestMapping("/wagleUpdatePro")
	public String wagleUpdatePro(MultipartHttpServletRequest request,String name,int size, int wboardid,WagleDataBean wagle,Model model) throws Throwable {
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
			wagle.setFilename(name);
			wagle.setFilesize(size);
		}
		
		
		int chk=dbWagle.updateWagle(wagle); 
		model.addAttribute("wagle",wagle);
		
		
		if (chk==1) {

			return "/board/wagleUpdatePro";
		}
			 return  null;  
	}
	
	//�ͱ� ����
	@RequestMapping("/wagleDelete")
	public ModelAndView wagleDelete(int wboardid)  throws Throwable { 
			 
		ModelAndView mv = new ModelAndView();

		int check=dbWagle.deleteWagle(wboardid);
		mv.addObject("wboardid",wboardid);
		mv.addObject("check",check);
		mv.setViewName("/board/wagleDelete");
		
		return  mv;
		}
	
	
	//�ͱ� ���� Ȯ��
	@RequestMapping("/wagleContent")
	public String wagleContent(HttpServletRequest req,int wboardid,Model mv)  throws Throwable {
		

		WagleDataBean wagle = dbWagle.getWagle(wboardid);
		
		HttpSession session=req.getSession();
		String name=(String)session.getAttribute("name");
		
		if (name==null) {
			name="nosession";
		}
	
		Boolean chk=dbWagle.waglechk(wboardid, name);
		
		int all=dbWagle.getWagleCount3(wboardid);
		
		mv.addAttribute("chk", chk);
		mv.addAttribute("wagle", wagle);
		mv.addAttribute("all",all);
		mv.addAttribute("wagler", name);
		
		
	
		int pageSize =10;
		int currentPage = Integer.parseInt(pageNum);
		int startRow = (currentPage - 1)*pageSize+1;
		int count = 0;
		int endRow = currentPage*pageSize;
		int number = 0;
		List articleList = null;

	
		String boardid = String.valueOf(wboardid);

		count = dbReview.getArticleCount(boardid);
		
		if(count > 0) {
			articleList = dbReview.getArticles(startRow, endRow, boardid);
		}
		number = count -(currentPage-1)*pageSize;
		
		int bottomLine =3; 
		
		int pageCount = count/pageSize +(count%pageSize == 0 ? 0 : 1);
		int startPage = 1 +(currentPage -1) /bottomLine*bottomLine;
		int endPage = startPage + bottomLine -1;

		
		if (endPage > pageCount) endPage = pageCount;
		
		mv.addAttribute("count", count);
		mv.addAttribute("boardid", boardid);
		mv.addAttribute("count", count);
		mv.addAttribute("articleList", articleList);
		mv.addAttribute("currentPage", currentPage);
		mv.addAttribute("startPage", startPage);
		mv.addAttribute("bottomLine", bottomLine);
		mv.addAttribute("endPage", endPage);
		mv.addAttribute("pageCount", pageCount);
		
		return "/board/wagleContent";
	}
	
	
	//�ͱۿ� ����
	@RequestMapping("/wagleJoin")
	public String wagleJoin(HttpServletRequest req,
			 String wname,int wboardid)  throws Throwable {

		HttpSession session=req.getSession();
		String wagler=(String)session.getAttribute("name");
	
		dbWagle.wagleJoin(wboardid,wagler,wname);

		return "/board/wagleJoin";
				
	}
	
	//�ͱۿ��� Ż��
	@RequestMapping("/wagleOut")
	public String wagleOut(HttpServletRequest req,
			int wboardid,Model mv)  throws Throwable {

	
		HttpSession session=req.getSession();
		String wagler=(String)session.getAttribute("name");
		int chk=1;
		dbWagle.wagleOut(wboardid,wagler);
		mv.addAttribute("chk", chk);

		
		return "/board/wagleOut";
	}
	
	//�ͱۿ��� ���� ����
	@RequestMapping("/wagleOut2")
	public String wagleOut2(HttpServletRequest req,
			int wboardid,String wagler,Model mv)  throws Throwable {

		int chk=2;
		dbWagle.wagleOut(wboardid,wagler);
		mv.addAttribute("chk",chk);

		
		return "/board/wagleOut";
	}
	
	// FAQ
	@RequestMapping("/faqlist")
	public String faqlist() throws Throwable {
		return "/board/faqlist";
	}
	
	
	//���� �ۼ�
	@RequestMapping("/reviewinsert")
	public String reviewinsert(BoardDataBean article) throws Throwable {
	
		dbReview.insertArticle(article);
	
		return "redirect:mylist";
	}
	
	//���� ����
	@RequestMapping("/reviewdelete")
	public String reviewdelete(BoardDataBean article,int num,int boardid) throws Throwable {

		dbReview.deleteArticle(num);
		
		return "redirect:wagleContent?wboardid="+boardid;
	}
	
	//���� ������Ʈ
	@RequestMapping("/reviewupdate")
	public String reviewupdate(BoardDataBean article,int boardid) throws Throwable {
		

		dbReview.updateArticle(article);
		
		
		return "redirect:wagleContent?wboardid="+boardid;
	}
	

}
		