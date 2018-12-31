package oracle.java.s20181202.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import oracle.java.s20181202.model.Book;
import oracle.java.s20181202.model.BookPhoto;
import oracle.java.s20181202.model.Member;
import oracle.java.s20181202.model.Message;
import oracle.java.s20181202.service.BookPhotoService;
import oracle.java.s20181202.service.BookService;
import oracle.java.s20181202.service.MessageService;
import oracle.java.s20181202.service.Paging;

@Controller
public class BookController {
private static final Logger logger = LoggerFactory.getLogger(BookController.class);

	@Autowired
	private BookService bs;
	
	@Autowired 
	private BookPhotoService bps;
	
	@Autowired
	private MessageService ms;
	
	@Resource(name="uploadPath")
	String uploadPath;
	
	ArrayList<String> tmpPath = new ArrayList<String>();

	
	@RequestMapping(value="booksellList")
	public String booksellList(Book book, String currentPage, Model model) {
		
		int booktotal = bs.booktotal();
		
		/*System.out.println("booktotal ? > " + booktotal);
		System.out.println("currentPage ? > " + currentPage);*/

		String tmpMet	 = "";
		int tmpSt 		 = 0;
		ArrayList<Integer> states 	= new ArrayList<Integer>();
		
		Paging pg = new Paging(booktotal, currentPage);
		
		book.setStart(pg.getStart());
		book.setEnd(pg.getEnd());
		
		List<Book> booksellList = bs.booksellList(book);
		
		for (int i=0;i<booksellList.size(); i++) {
		
			tmpMet 	= booksellList.get(i).getBook_met();
			tmpSt 	= booksellList.get(i).getBook_state();
			
			if(tmpMet.equals("10")) {
				booksellList.get(i).setBook_met("택배: 가능");
			} else if(tmpMet.equals("01")) {
				booksellList.get(i).setBook_met("직거래: 가능");
			} else {
				booksellList.get(i).setBook_met("택배: 가능 | 직거래: 가능");
			}
			
			if(tmpSt == 0) {
				states.add(0);
			} else {
				states.add(1);
			}
		}
		
		model.addAttribute("booksellList", booksellList);
		model.addAttribute("pg", pg);
		model.addAttribute("states", states);
		
		return "/book/booksellList";
		
	}
	
	@RequestMapping(value="bookDetailMsg")
	public String bookDetailMsg(HttpSession session, Member member, HttpServletRequest request, Model model) {
		 
		Message message = new Message();
		
		//보내는사람 번호
		int send_member_no 	= Integer.parseInt(request.getParameter("send_member_no"));
		
		//받는 사람 번호
		int reci_member_no = Integer.parseInt(request.getParameter("reci_member_no"));
				
		//닉네임 찾아야함
		String send_member_nic = bs.bookFindMemNic(send_member_no);
		String reci_member_nic = bs.bookFindMemNic(reci_member_no);
		
		message.setMsg_sender(send_member_nic);
		message.setMsg_reci(reci_member_nic);
		
		session.setAttribute("message", message);
		
		model.addAttribute("send_member_nic", send_member_nic);
		model.addAttribute("reci_member_nic", reci_member_nic);

		
		return "/book/bookDetailMsg";
	}

	
	@RequestMapping(value="bookDetailSend")
	public String bookDetailSend(HttpSession session, Member member, HttpServletRequest request, Model model) {
		
		Message message = new Message();

		//보내는사람 번호
		int send_member_no 	= Integer.parseInt(request.getParameter("send_member_no"));
				
		//받는 사람 번호
		int reci_member_no = Integer.parseInt(request.getParameter("reci_member_no"));
						
		//닉네임 찾아야함
		String send_member_nic = bs.bookFindMemNic(send_member_no);
		String reci_member_nic = bs.bookFindMemNic(reci_member_no);
		
		message.setMsg_sender(send_member_nic);
		message.setMsg_reci(reci_member_nic);
		
		String msg_cont = request.getParameter("msg_cont");
		message.setMsg_cont(msg_cont);
		
		/*System.out.println(msg_cont);
		System.out.println(message.getMsg_reci());
		System.out.println(message.getMsg_sender());*/
		
		int result = ms.bookSendMsg(message);
		
		
		if(result > 0 ) {
			return "redirect:booksellList.do";
		} else {
						
			return "forward:booksellList.do";
		}
	}
	
	@RequestMapping(value="bookDetail")
	public String bookDetail(int book_no, Model model) {
		
		Book book 		= bs.detail(book_no);
		BookPhoto bp 	= bps.bookphoto(book_no);
		
		String note1 	= book.getBook_cont1(); // ex( 0000 )
		String note2 	= book.getBook_cont2(); // ex( 0000 )
		String met		= book.getBook_met();
		
		ArrayList<Integer> note_st 	= new ArrayList<Integer>(Arrays.asList(0,0,0,0,0,0,0));
		
		String s1 = note1.substring(0, 2);
		String s2 = note1.substring(2, 4);
		
		if( note1.equals("0000")) {
			note_st.set(0, 1);
		} else {
			if((Character.toString(note1.charAt(0)).equals("1"))) {
				note_st.set(1,1);
			}
			if((Character.toString(note1.charAt(1)).equals("1"))) {
				note_st.set(2,1);
			}
			if((Character.toString(note1.charAt(2)).equals("1"))) {
				note_st.set(3,1);
			}
			if((Character.toString(note1.charAt(3)).equals("1"))) {
				note_st.set(4,1);
			}
		}
		if(s1.equals("00")) {
			note_st.set(5, 1);
		}
		if(s2.equals("00")) {
			note_st.set(6, 1);
		}

		ArrayList<Integer> damage_st = new ArrayList<Integer>(Arrays.asList(0,0,0,0));

		if((Character.toString(note2.charAt(0)).equals("1"))) {
			damage_st.set(0,1);
		}
		if((Character.toString(note2.charAt(1)).equals("1"))) {
			damage_st.set(1,1);
		}
		if((Character.toString(note2.charAt(2)).equals("1"))) {
			damage_st.set(2,1);
		}
		if((Character.toString(note2.charAt(3)).equals("1"))) {
			damage_st.set(3,1);
		}
		
		ArrayList<Integer> met_st = new ArrayList<Integer>(Arrays.asList(0,0));
		
		if((Character.toString(met.charAt(0)).equals("1"))) {
			met_st.set(0,1);
		}
		if((Character.toString(met.charAt(1)).equals("1"))) {
			met_st.set(1,1);
		}

	
		System.out.println(met_st);
		
		model.addAttribute("book", book);
		model.addAttribute("note_st", note_st);
		model.addAttribute("damage_st", damage_st);
		model.addAttribute("met_st", met_st);

		model.addAttribute("bp", bp);
		
		return "/book/bookDetail";
	}

	@RequestMapping(value="bookSearch", method=RequestMethod.POST)
	public String bookSearch(String search, Model model) {
		
		String searchObj = search;
						
		List<Book> bookSearchList = bs.bookSearchList(searchObj);
	
		for (int i=0;i<bookSearchList.size(); i++) {
			
			String tmpMet = bookSearchList.get(i).getBook_met();
			
			if(tmpMet.equals("10")) {
				bookSearchList.get(i).setBook_met("택배: 가능");
			} else if(tmpMet.equals("01")) {
				bookSearchList.get(i).setBook_met("직거래: 가능");
			} else {
				bookSearchList.get(i).setBook_met("택배: 가능 | 직거래: 가능");
			}
		
		}
		
		
		model.addAttribute("bookSearchList", bookSearchList);
		
		return "/book/bookSearchList";
		
	}
    
	@RequestMapping(value="bookSellForm")
	public String bookSellForm(Model model) {
				
		return "/book/bookSellForm";
	}
	
	@RequestMapping(value="bookSellUpload", method = RequestMethod.GET)
	public void bookSellUpload(Book book, Model model) {
		System.out.println("bookSellUploadForm Get Start...");		
	}
	
	@RequestMapping(value="bookSellUpload", method = RequestMethod.POST)
	public String bookSellUpload(Member member, Book book, BookPhoto bookP, String path0, String path1, String path2, HttpServletRequest request, MultipartFile file0, 
		MultipartFile file1, MultipartFile file2,  Model model) throws Exception {
		
		System.out.println("****************");
		
		BookPhoto bookphoto = new BookPhoto();

		System.out.println("bookSellUpload start");

		

		String cont1 	= request.getParameter("seletedValue");
		String cont2 	= request.getParameter("seletedValue2");
		String met 		= request.getParameter("seletedValue3");
		int	member_no   = Integer.parseInt(request.getParameter("member_no"));
		
		cont1 			= cont1.replaceAll(",", "");
		cont2 			= cont2.replaceAll(",", "");
		met 			= met.replaceAll(",","");
		
		
		String[] tmp = new String[]{request.getParameter("path0"),
									request.getParameter("path1"),
									request.getParameter("path2")};
		
		MultipartFile[] files = new MultipartFile[] {file0, file1, file2};
		
		
		System.out.println(tmp[0] + " " +  tmp[1] + " " + tmp[2]);
		
		for(int i=0; i<3; i++) {
			if(tmp[i].contains("/s20181202/")) {
				
				//String uploadPath = request.getSession().getServletContext().getRealPath("/bs");
				//System.out.println("uploadPath...  > " + uploadPath);	
			
				//logger.info("originalName : " + files[i].getOriginalFilename());
				//logger.info("size : " + file.getSize());
				//logger.info("contentType : " + file.getContentType());
				
				String savedName = uploadFile(files[i].getOriginalFilename(), files[i].getBytes(), uploadPath);
		
				String dbSaveName = "resources/bs/" + savedName;
				
				tmpPath.add(dbSaveName);

				//logger.info("savedName : " + savedName);	
			}
		}
		
		if(tmpPath.isEmpty()) {
			bookphoto.setBook_photo1("");
			bookphoto.setBook_photo2("");
			bookphoto.setBook_photo3("");
		} else if(tmpPath.size() == 1) {
			bookphoto.setBook_photo1(tmpPath.get(0));
			bookphoto.setBook_photo2("");
			bookphoto.setBook_photo3("");
		} else if(tmpPath.size() == 2) {
			bookphoto.setBook_photo1(tmpPath.get(0));
			bookphoto.setBook_photo2(tmpPath.get(1));
			bookphoto.setBook_photo3("");
		} else if(tmpPath.size() == 3) {
			bookphoto.setBook_photo1(tmpPath.get(0));
			bookphoto.setBook_photo2(tmpPath.get(1));
			bookphoto.setBook_photo3(tmpPath.get(2));
		} 
		
		book.setMember_no(member_no);
		book.setBook_cont1(cont1);
		book.setBook_cont2(cont2);
		book.setBook_met(met);
		

		// db 삽입
		int result = bs.insert(book);
		bps.insert(bookphoto);
		
		if(result > 0 ) {
			return "redirect:booksellList.do";
		} else {
			
			model.addAttribute("msg", "책방등록에 실패하였습니다.");
			
			return "forward:bookSellForm.do";
		}
		
	}
	
	private String uploadFile(String originalName, byte[] fileData, String uploadPath) throws Exception {
		
		//UUID uid = UUID.randomUUID();
		
		//겹치지 않기 위해 선언
		long time 					= System.currentTimeMillis(); 
		SimpleDateFormat dayTime 	= new SimpleDateFormat("yyyy-mm-dd hh:mm:ss");
		String str 					= dayTime.format(new Date(time));
		
		str = str.replaceAll("-", "");
		str = str.replaceAll(":", "");
		str = str.replaceAll(" ", "_");
		
		File fileDirectory = new File(uploadPath);
		
		if(!fileDirectory.exists()) {
			
			fileDirectory.mkdirs();
			System.out.println("upload용 폴더 생성 : " + uploadPath);
		}
		
//		String savedName = uid.toString() + "_" + originalName;
		String savedName = str + "_" + originalName;

		File target = new File(uploadPath, savedName);
		FileCopyUtils.copy(fileData, target);
		
		return savedName;
	}
	

	@RequestMapping(value="updateSelling", method=RequestMethod.POST)
	public String updateSelling(HttpServletRequest request, Model model) {

		int book_no 		= Integer.parseInt(request.getParameter("book_no"));
		int book_selling 	= Integer.parseInt(request.getParameter("book_selling"));

		
		System.out.println(book_no);
		System.out.println(book_selling);

		Book book = new Book();

		book.setBook_no(book_no);
		book.setBook_selling(book_selling);

		int result = bs.updateSelling(book);
		
		model.addAttribute("book_no", book_no);
		
		if(result > 0 ) {
			return "redirect:bookDetail.do";
		} else {
			
			model.addAttribute("msg", "책방등록에 실패하였습니다.");
			
			return "forward:bookDetail.do";
		}
	}
	
	@RequestMapping(value="updateCont", method=RequestMethod.POST)
	public String updateCont(HttpServletRequest request, Model model) {

		int book_no 		= Integer.parseInt(request.getParameter("book_no"));
		String book_cont 	= request.getParameter("book_cont");

		
		System.out.println(book_no);
		System.out.println(book_cont);

		Book book = new Book();

		book.setBook_no(book_no);
		book.setBook_cont(book_cont);

		int result = bs.updateCont(book);
		
		model.addAttribute("book_no", book_no);
		
		if(result > 0 ) {
			return "redirect:bookDetail.do";
		} else {
			
			model.addAttribute("msg", "책방등록에 실패하였습니다.");
			
			return "forward:bookDetail.do";
		}
	}
	
	@RequestMapping(value="updateBookState", method=RequestMethod.GET)
	public String updateBookState(int book_no, HttpServletRequest request, Model model) {

		System.out.println(book_no);

		Book book = new Book();

		book.setBook_no(book_no);
		book.setBook_state(1);

		int result = bs.updateBookState(book);
		
		model.addAttribute("book_no", book_no);
		
		if(result > 0 ) {
			return "redirect:bookDetail.do";
		} else {
			
			model.addAttribute("msg", "책방등록에 실패하였습니다.");
			
			return "forward:bookDetail.do";
		}
	}
}
