package org.gre.filmtv.Controller;

import org.gre.filmtv.Student;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class studentController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public String handleSessionExpired(){        
//	  return "login";
//	}
	
	@RequestMapping(value = "students", method = RequestMethod.GET)
	
	public String students(Model model) {
		model.addAttribute("stu", Student.findAllStudents());
		return "students";
	}
}
