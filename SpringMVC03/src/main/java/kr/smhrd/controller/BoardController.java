package kr.smhrd.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.entity.Board;
import kr.smhrd.repository.BoardMapper;

@Controller
public class BoardController{  // POJO  new BoardController()
   // 메서드
   // 리스트요청(list.do)을 처리하는 메서드(DI)
   @Autowired
   private BoardMapper mapper; 
   // @RequestMapping->HandlerMapping 동작한다.	
   @RequestMapping("/list.do")  
   public String list(Model model) {	   
	   List<Board> list=mapper.getList();
	   model.addAttribute("list", list);	   
	   return "board/list"; // redirect, forward(JSP)
   }
   @RequestMapping("/register.do")
   public String register() {
	   return "board/register"; // register.jsp
   }
   @RequestMapping("/insert.do") // title, content, writer
   public String insert(Board vo) { // 파라메터수집(VO)
	   //request.setCharacterEncoding("utf-8");
	   mapper.register(vo); //등록
	   return "redirect:/list.do";
   }
   @RequestMapping("/get.do") 
   public String get(@RequestParam("idx") int idx, Model model) {  // ?idx=10
	   Board vo=mapper.get(idx);
	   model.addAttribute("vo", vo);
	   // 조회수 누적
	   mapper.countUpdate(idx);
	   return "board/get";
   }
   @RequestMapping("/remove.do")
   public String remove(int idx) {
	   mapper.remove(idx);
	   return "redirect:/list.do";
   }
   @GetMapping("/updateForm.do")
   public String updateForm(int idx, Model model) {
	   Board vo=mapper.get(idx);
	   model.addAttribute("vo", vo); // ${vo}
	   return "board/update";
   }
   @PostMapping("/update.do")
   public String update(Board vo) {
	   mapper.update(vo);
	   return "redirect:/list.do";
   }
   @RequestMapping("/replyForm.do")
   public String replyForm(int idx, Model model) { // ?idx=3
	   // idx에 해당하는 글을 읽어서 답글 화면에 보여주기
	   Board vo=mapper.get(idx);
	   model.addAttribute("vo", vo);
	   return "board/reply"; // reply.jsp
   }
   @RequestMapping("/reply.do")
   public String reply(Board vo) {  // vo->idx(부모의)
	   // 1. 부모의 정보를 가져오기
	   Board parent=mapper.get(vo.getIdx().intValue());
	   // 2. 부모의 bgroup의 값을 답글의 bgroup을 저장
	   vo.setBgroup(parent.getBgroup());
	   // 3. 부모의 bseq에+1을 해서 답글의 bseq에 저장
	   vo.setBseq(parent.getBseq()+1);
	   // 4. 부모의 blevel에+1을 해서 답글의 blevel에 저장
	   vo.setBlevel(parent.getBlevel()+1);
	   // 5. 부모와 같은 bgroup에 있는 답글중에서 부모의 bseq보다 큰 bseq를 모두 1씩 증가시킨다.
	   mapper.replySeqUpdate(parent);
	   // 6. 답글저장(vo)
	   mapper.replyInsert(vo);	   
	   return "redirect:/list.do";
   }
}
