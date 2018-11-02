package org.kidding.controller;

import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;
import org.kidding.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/board/*")
@Log4j
public class BoardController {

	
	@Setter(onMethod_=@Autowired)
	private BoardService service;
	
	@GetMapping("/list")
	public void list(@ModelAttribute("pageObj") PageParam param, Model model) {
		log.info("list page....");
		
		param.setTotal(service.getTotal(param));
		model.addAttribute("list", service.getList(param));
	}
	
	@GetMapping("/register")
	public void registerGET(@ModelAttribute("pageObj") PageParam param){
		log.info("register page.....");	
	}
	
	@PostMapping("/remove")
	public String delete(PageParam param){
		log.info("REMOVED....");
		service.delete(param);
	
		return "redirect:/board/list?page="+param.getPage();
	}
	
	
	@PostMapping("/register")
	public String register(BoardVO vo, RedirectAttributes rttr){
		log.info("POST REGISTER..........");
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		int result = service.register(vo);
		
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
	
	@GetMapping({"/read", "/modify"})
	public void read(@ModelAttribute("pageObj") PageParam param, Model model) {
		log.info("read page...");
		log.info(service.getRead(param));
		
		model.addAttribute("board", service.getRead(param));
	}
	
	@PostMapping("/modify")
	public String modify(RedirectAttributes rttr, BoardVO vo, PageParam param) {
		log.info("POST MODIFY.......");
		log.info(vo);
		int result = service.modify(vo);
		
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAIL");

		return "redirect:/board/read?page=" + param.getPage() + "&bno=" + vo.getBno();
	}
}
