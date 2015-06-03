package org.gre.filmtv.Controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import org.gre.filmtv.Booking;
import org.gre.filmtv.BookingEquipment;
import org.gre.filmtv.Equipment;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class myBookingsController {

	@RequestMapping(value = "myBookings", method= RequestMethod.GET)
	public String myBookings(Model model, HttpServletRequest request){
		int stuId = (int) request.getSession().getAttribute("stuId");
		model.addAttribute("Bookings", Booking.findBookingsByStudent(stuId)); // Need to sort a way of passing basket at the same time as bookings to be able to show in the same group
		List <Booking> bkList =  Booking.findBookingsByStudent(stuId);
		List <BookingEquipment> equipList = null;
		ArrayList<Integer> eIdList = new ArrayList<Integer>();
		ArrayList<Object> equipListNames = new ArrayList<Object>();
		for(int i = 0; i < bkList.size(); i++){
			equipList = BookingEquipment.findEquipByBookingId();
			for(int e = 0; e < equipList.size(); e++){
				try{
				if(bkList.get(i).getBookingId() == equipList.get(e).getBookingId().getBookingId()){
						
						Integer equip = equipList.get(e).getEquipmentId().getEquipmentId();
						int book = equipList.get(e).getBookingId().getBookingId();
						int bId = bkList.get(i).getBookingId();
						eIdList.add(equip);
						
					}
				} catch(Exception asdf){
					System.out.println(asdf);
				}
			}
			
			
			
		}

		for(int i = 0; i < eIdList.size(); i++){
		
			equipListNames.add(Equipment.getEquipmentDetails(eIdList.get(i)));
		}
		
		model.addAttribute("BookingEquip", BookingEquipment.findAllBookingEquipments());
		model.addAttribute("Basket", equipListNames);
		return "myBookings";
	}
}
