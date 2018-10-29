package org.kidding.controller;

import org.kidding.domain.PageParam;
import org.kidding.service.BoardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

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
		log.info(service.getList(param));
		
		param.setTotal(service.getTotal());
		model.addAttribute("list", service.getList(param));
	}
	
	@GetMapping("/register")
	public void register(Model model){
		log.info("register page.....");
	}
}
