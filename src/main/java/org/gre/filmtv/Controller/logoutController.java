package org.gre.filmtv.Controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller

public class logoutController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public String handleSessionExpired(){        
//	  return "login";
//	}
	
	@RequestMapping(value="logout", method = RequestMethod.GET)
	
	public String logout(HttpServletRequest request, HttpServletResponse response){
		request.getSession().invalidate();
		
		Cookie cookie = new Cookie("myCookie", null);
		response.addCookie(cookie);
		
		return "login";
	}
}
