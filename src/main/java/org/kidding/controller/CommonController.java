package org.kidding.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	@GetMapping("/customLogin")
	public void customLogin() {
		log.info("custom login page");
	}
	
	@RequestMapping("/accessError")
	public void accessError(Authentication auth, Model model) {
		
		log.info(auth);
		model.addAttribute("msg", "Access Error");
		
	}
	
	@GetMapping("/customLogout")
	public void logoutGET() {
		
		log.info("custom logout");
	}
	
	@PostMapping("/customLogout")
	public void logoutPOST() {
		
		log.info("post custom logout");
	}
	
}
