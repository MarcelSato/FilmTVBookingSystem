package org.gre.filmtv.Controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;


@Controller
@RequestMapping(value = "ra")
public class riskAssessmentController {
	
	@RequestMapping(method = RequestMethod.POST)
	
	public String ra(HttpServletRequest request, @RequestParam("bookingModel") String bkngModel,@RequestParam("basketModel") String bsktModel, Model model){

		if(request.getSession(false).getAttribute("nameSession") == null){
			return "login";
		} else {
//			System.out.println("IN basket - " + bsktModel);
//			System.out.println("IN booking - " + bkngModel);
			JSONObject bookingJson = null;
			JSONArray basketJson = null;
			try {
				bookingJson = (JSONObject)new JSONParser().parse(bkngModel);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("booking failed");
			}
			try {
				basketJson = (JSONArray)new JSONParser().parse(bsktModel);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				System.out.println("basket failed");
				e.printStackTrace();
			}
			model.addAttribute("Booking", bookingJson);
			model.addAttribute("Basket", basketJson);
//			System.out.println("Model - " + model);

			return "ra";
		}
	}
}
