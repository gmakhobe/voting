package com.bbd.Voting;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class NavigationController {
	@Autowired
	RegistrationRepo regRepo;
	
	@RequestMapping("/")
	public ModelAndView home() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("landing");
		return mv;
	}
	@RequestMapping("register")
	public ModelAndView register() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("register");
		return mv;
	} 
	@RequestMapping("login")
	public ModelAndView login() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("login");
		return mv;
	}
	@RequestMapping("registration")
	public ResponseEntity<Object> registerUser(Registration reg) {
		regRepo.save(reg);
		return new ResponseEntity<>("success", HttpStatus.CREATED);
	}
	@RequestMapping("logon")
	public ResponseEntity<Object> loginUser(Login login) {
		Registration reg = regRepo.findById(login.getIdnumber()).orElse(null);
		System.out.println("Id Number: " + login.getIdnumber());
		if (reg == null)
			return new ResponseEntity<>("{ \"regId\": \"0\"}", HttpStatus.CREATED) ;
		else {
			if (reg.getPassword().equals(login.getPassword()))
				return new ResponseEntity<>(reg, HttpStatus.CREATED);
			else
				return new ResponseEntity<>("{ \"regId\": \"0\"}", HttpStatus.CREATED) ;
		}
	}
	@RequestMapping("dashboard")
	public ModelAndView dashboard() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("dashboard");
		return mv;
	}
}
