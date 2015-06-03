package org.gre.filmtv.Controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class homeController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public String handleSessionExpired(){        
//	  return "login";
//	}
	
	@RequestMapping(value = "home", method = RequestMethod.GET)

	public String home(HttpServletRequest request) {
		if(request.getSession(false).getAttribute("nameSession") == null){
			return "login";
		} else {
		return "home";
		}
	}
}
