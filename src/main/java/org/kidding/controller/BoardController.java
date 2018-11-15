package org.kidding.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.kidding.domain.BoardAttachVO;
import org.kidding.domain.BoardVO;
import org.kidding.domain.PageParam;
import org.kidding.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@PreAuthorize("isAuthenticated()")
	public void list(@ModelAttribute("pageObj") PageParam param, Model model) {
		log.info("list page....");
		
		param.setTotal(service.getTotal(param));
		model.addAttribute("list", service.getList(param));
	}
	
	@GetMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public void registerGET(@ModelAttribute("pageObj") PageParam param){
		log.info("register page.....");	
	}
	
	@PostMapping("/remove")
	public String delete(PageParam param, RedirectAttributes rttr){
		log.info("REMOVED....");
		log.info(param);
		List<BoardAttachVO> attachList = service.getAttachList(param.getBno());
		
		if(service.deleteAll(param)){
			deleteFiles(attachList);
		
		rttr.addFlashAttribute("result", "success");
		}		
	
		return "redirect:/board/list?page="+param.getPage();
	}
	
	
	@PostMapping("/register")
	@PreAuthorize("isAuthenticated()")
	public String register(BoardVO vo, RedirectAttributes rttr){
		log.info("POST REGISTER..........");
		
		if (vo.getAttachList() != null) {
			vo.getAttachList().forEach(attach -> log.info(attach));
		}
		
		int result = service.register(vo);
		
		rttr.addFlashAttribute("result", result==1?"SUCCESS":"FAIL");
		
		return "redirect:/board/list";
	}
	
	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
	@ResponseBody
	public ResponseEntity<List<BoardAttachVO>> getAttachList(int bno){
		log.info("getAttachList " + bno );
		return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
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
	
	private void deleteFiles(List<BoardAttachVO> attachList) {
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		log.info("delete attach files.........");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\" + attach.getUuid() + "_" + attach.getFileName());
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					Path thumbNail = Paths.get("C:\\upload\\" + attach.getUploadPath() + "\\s_" + attach.getUuid() + "_" + attach.getFileName());
					
					Files.delete(thumbNail);
				}
			}catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			}
		});//end foreach
	
	}
}
