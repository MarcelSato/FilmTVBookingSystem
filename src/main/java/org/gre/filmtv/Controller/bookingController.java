package org.gre.filmtv.Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.gre.filmtv.Course;
import org.gre.filmtv.Tutor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "bookings")
public class bookingController {
	
//	@ExceptionHandler(HttpSessionRequiredException.class)   
//	public String handleSessionExpired(){        
//	  return "login";
//	}
	
	@RequestMapping(method = RequestMethod.GET)
	
	public String home(HttpServletRequest request) {
		if(request.getSession(false).getAttribute("nameSession") == null){
			return "login";
		} else {
		HttpSession bkSession = request.getSession();
		bkSession.setAttribute("bookingSubmitted", false);
		bkSession.setMaxInactiveInterval(30*60);
		return "bookings";
		}
	}

	
	@RequestMapping(value="courses", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	
	public List<Object[]> courses(@RequestParam("sId") String jsonInfo) 
			throws JsonParseException, JsonMappingException, IOException{
		
		
		Object myInfo = new ObjectMapper().readValue(jsonInfo, Object.class);
		return Course.findAllCoursesByStudent(myInfo);
		
	}	
	
	@RequestMapping(value="tutors", method = RequestMethod.GET, produces="application/json")
	@ResponseBody
	public List<Object[]> tuts(@RequestParam("cId") String jsonInfo) 
			throws JsonMappingException, JsonParseException, IOException {
		
			    Object myInfo = new ObjectMapper().readValue(jsonInfo, Object.class);
			        return Tutor.getTut(myInfo);
	}
			
}
