package org.gre.filmtv.Controller;

import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class TandCController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public void handleSessionExpired(){   
//	  System.out.println("Session Handled");
//	}

	@RequestMapping(value = "tc", method = RequestMethod.GET)

	public String tandc(HttpServletRequest request) {
		if(request.getSession(false).getAttribute("nameSession") == null){
			return "login";
		} else {
		return "tc";
		}
	}
		

}
