package org.gre.filmtv.Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gre.filmtv.Student;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "login")
public class loginController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public String handleSessionExpired(){        
//	  return "login";
//	}
	
	@RequestMapping(method = RequestMethod.POST)
	public String login(HttpServletRequest request, @RequestParam("uName") String userName, @RequestParam("password") String userPassword){
		
		if(!Student.checkStudentLogin(userName, userPassword).equals("error")){
//			request.getSession().setAttribute("nameSession", "Welcome " + Student.checkStudentLogin(userName, userPassword));
//			request.getSession().setAttribute("stuId", Student.getStuId(userName, userPassword));
			HttpSession stuSession = request.getSession();
			stuSession.setAttribute("nameSession", "Welcome " + Student.checkStudentLogin(userName, userPassword));
			stuSession.setMaxInactiveInterval(30*60);
			HttpSession idSession = request.getSession();
			idSession.setAttribute("stuId", Student.getStuId(userName, userPassword));
			idSession.setMaxInactiveInterval(30*60);
			HttpSession userNSession = request.getSession();
			userNSession.setAttribute("userName", userName);
			userNSession.setMaxInactiveInterval(30*60);
			return "home";
			
		} else {
		
		return "login";		
		
		}
	}
	
	@RequestMapping(value = "checkName", method = RequestMethod.GET) // might have to delete , not necessary
	public String checkName(@RequestParam String uName){
		if(Student.findAllStudentsUserNames().contains(uName)){
			
			return "notAvailable";
					
		} else {
		
		return "available";
		
		}
	}
	
}


