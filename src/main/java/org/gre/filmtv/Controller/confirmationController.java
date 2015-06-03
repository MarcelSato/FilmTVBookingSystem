package org.gre.filmtv.Controller;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.gre.filmtv.Booking;
import org.gre.filmtv.BookingEquipment;
import org.gre.filmtv.BookingEquipmentPK;
import org.gre.filmtv.Equipment;
import org.gre.filmtv.Student;
import org.gre.filmtv.Tutor;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value="confirmation")
public class confirmationController {
		
	@RequestMapping(method = RequestMethod.POST)
	public String confirm(@RequestParam("bookingModel") String bkngModel,
                          @RequestParam("basketModel" ) String bsktModel,
                          HttpServletRequest request,
                          Model model){
		int stuId = (int) request.getSession().getAttribute("stuId");
		JSONObject bookingJson = null;
    	JSONArray  basketJson  = null;
    	System.out.println(request.getSession().getAttribute("bookingSubmitted"));
		if(request.getSession().getAttribute("bookingSubmitted").equals(false)){
    	try {
			bookingJson = (JSONObject) new JSONParser().parse(bkngModel);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	try {
			basketJson = (JSONArray) new JSONParser().parse(bsktModel);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
    	
    	List<Booking> bookingList = null;
    	int bookingRef = 0;
						    	//Send email
    	
		try{
			//http://stackoverflow.com/questions/26728132/com-sun-mail-smtp-smtpsendfailedexception-530-5-5-1-authentication-required-ja
            final String fromEmail = "sm851@greenwich.ac.uk"; 
            final String password  = "02@Letei@02";
            final String toEmail   = Student.findStudent(stuId).getEmail();
            final String toStaffEmail = Tutor.findTutor(((Long)bookingJson.get("TutorID")).intValue()).getEmail();
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");

                
            Authenticator auth = new Authenticator() {
                //override the getPasswordAuthentication method
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, password);
                }
            };
            Booking bk = new Booking();	
            Equipment equip = new Equipment();
            String basketText = "";
			System.out.println("Confirmation - " + bookingJson);
			try{
				
				bk.setStudentId(stuId);
				int tID = ((Long) bookingJson.get("TutorID")).intValue();
				bk.setTutorId(tID);
				int cID = ((Long) bookingJson.get("CourseID")).intValue();
				bk.setCourseId(cID);
				bk.setLocation((String) bookingJson.get("Location"));
				SimpleDateFormat sdf = new SimpleDateFormat("MM/dd/yyyy");
				sdf.setLenient(false);
				Date date = sdf.parse((String) bookingJson.get("Collection"));
				bk.setStartDate(date);
				Date date1 = sdf.parse((String) bookingJson.get("Return"));
				bk.setEndDate(date1);
				System.out.println(bookingJson.get("Return"));
				Timestamp currentTimestamp = new java.sql.Timestamp(Calendar.getInstance().getTime().getTime());
				bk.setTimestamp(currentTimestamp);
				bk.setRaPath((String) bookingJson.get("Path"));
				
				bk.persist();

				System.out.println("saved booking to DB!");
				} catch(Exception e){
					System.out.println("DB failed");
					System.out.println(e);
				}
				try{            
            
		            for(int i=0; i < basketJson.size(); i++){        	
		            	JSONObject temp = (JSONObject) basketJson.get(i);
		            	equip.setEquipmentId(((Long) temp.get("equiId")).intValue());
		            	try{
		            		BookingEquipment be = new BookingEquipment();
		            		int q = Integer.parseInt((String) temp.get("quantity")) +  Integer.parseInt(""+Equipment.findEquipment(((Long) temp.get("equiId")).intValue()).getBooked());
		            		equip.setEquipmentId(((Long) temp.get("equiId")).intValue());
		            		equip.setName(Equipment.findEquipment(((Long) temp.get("equiId")).intValue()).getName());
		            		equip.setDescription(Equipment.findEquipment(((Long) temp.get("equiId")).intValue()).getDescription());
		            		equip.setLevel(Equipment.findEquipment(((Long) temp.get("equiId")).intValue()).getLevel());
		            		equip.setQuantity(Equipment.findEquipment(((Long) temp.get("equiId")).intValue()).getQuantity());
		            		equip.setBooked(q);
		            		equip.merge();
		            		System.out.println("updated DB quantities!");
		            		int qty = Integer.parseInt((String) temp.get("quantity")) ;
		            		BookingEquipmentPK bepk = new BookingEquipmentPK(bk.getBookingId(), equip.getEquipmentId(), qty);
		            		be.setId(bepk);
		            		be.persist();
		            	} catch(Exception e){
		            		System.out.println("Persist Failed");
		            		System.out.println(e);
		            	}
						basketText += "<tr><td>" + temp.get("quantity") + " X - </td><td>" + temp.get("name") + "</td></tr>";
					};
			} catch(Exception bf){
				System.out.println("for loop" + bf);
			}
			try{
				bookingList = Booking.findLastBooking();
		        bookingRef = bookingList.get(0).getBookingId();
	            } catch(Exception t){
	            	System.out.println(t);
	    	}
			Session session = Session.getInstance(props, auth);
			MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(fromEmail));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
            message.setSubject("FILM & TV booking confirmation");
            message.setContent(
            				"<p>Dear " + Student.findStudent(stuId).getName() + ",</p>" +
            				"<p>Your booking has been submitted and following the approval of your Risk Assessment we will send another email for confirmation.</p>" +
            				"<h2>Booking details:</h2><br />" +
            				"<table>" +
            				"<tr><td>Booking Reference</td><td> - " + bookingRef                    + "</td<tr>" +
            				"<tr><td>Tutor</td><td> - "             + bookingJson.get("Tutor")      + "</td></tr>" +
            				"<tr><td>Course</td><td> - "            + bookingJson.get("Course")     + "</td></tr>" +
            				"<tr><td>Location</td><td> - "          + bookingJson.get("Location")   + "</td></tr>" +
            				"<tr><td>Pickup date</td><td> - "       + bookingJson.get("Collection") + "</td></tr>" +
            				"<tr><td>Return date</td><td> - "       + bookingJson.get("Return")     + "</td></tr>" + 
            				"</table><br />" +
            				"<h2>Equipment:</h2>" + "<br /><table>" + basketText + "</table><br />" +
            				"<h2>Collection of Kit.</h2>" +
            				"<p>YOU MUST collect you kit at the stated time, failure to do this may result in you losing the loan. "
            				+ "Collecting the average filming kit from stores will take at least 20mins: please allow this time when planning. "
            				+ "You need to allow at LEAST 30 mins to collect/ return kit. This needs factoring into your filming schedule for the day.</p>" +
            				"<h2>KIT PICK UPS AND RETURNS.</h2>" +
            				"<p>You MUST pick up and return the kit on the agreed DATE and time: failure to do so may impact on the next bookings; "
            				+ "if you are having difficulties in picking up or returning on time you need to inform the technicians immediately. "
            				+ "LATE PICK UPS and RETURNS will result in you being fined.</p>" +
            				"<p>YOU ARE RESPONSIBLE for the kit you SIGN out, you MUST CHECK the kit before you leave to ensure you have everything you signed for.</p>" +
            				"<p>ON RETURNING the kit, the technicians will check all the kit; you and your team are liable for any missing or broken items.</p><br /><br /><br />",
            				"text/html; charset=utf-8");

            Transport.send(message);
            
            Session sessionTutor = Session.getInstance(props, auth);
			MimeMessage messageTutor = new MimeMessage(sessionTutor);
			messageTutor.setFrom(new InternetAddress(fromEmail));
			messageTutor.addRecipient(Message.RecipientType.TO, new InternetAddress(toStaffEmail));
			messageTutor.setSubject("FILM & TV booking confirmation");
			messageTutor.setContent(
		    				"<p>Dear " + Tutor.getTutorName(((Long) bookingJson.get("TutorID")).intValue()) + ",</p>" +
		    				"<p>Your student " + Student.findStudent(stuId).getName() + " " + Student.findStudent(stuId).getSurname() + " has submitted a booking and requires the approval of the relevant Risk Assessment.</p>" +
		    				"<h2>Booking details:</h2><br />" +
		    				"<table>" +
		    				"<tr><td>Booking Reference</td><td> - " + bookingRef                    + "</td<tr>" +
		    				"<tr><td>Tutor</td><td> - "             + bookingJson.get("Tutor")      + "</td></tr>" +
		    				"<tr><td>Course</td><td> - "            + bookingJson.get("Course")     + "</td></tr>" +
		    				"<tr><td>Location</td><td> - "          + bookingJson.get("Location")   + "</td></tr>" +
		    				"<tr><td>Pickup date</td><td> - "       + bookingJson.get("Collection") + "</td></tr>" +
		    				"<tr><td>Return date</td><td> - "       + bookingJson.get("Return")     + "</td></tr>" + 
		    				"</table><br />" +
		    				"<h2>Equipment:</h2>" + "<br /><table>" + basketText + "</table><br />",
		    				"text/html; charset=utf-8");
			
            Transport.send(messageTutor);
            
            System.out.println("Mail Sent");
		
        }catch(Exception ex){
            System.out.println("Mail fail");
            System.out.println(ex);
        }
		
							//Send email

		bookingJson.clear();
		basketJson.clear();
		model.addAttribute("bookingRef", "Booking no. " + bookingRef);
		HttpSession bkSession = request.getSession();
		bkSession.setAttribute("bookingSubmitted", true);
		bkSession.setMaxInactiveInterval(30*60);
		System.out.println(request.getSession().getAttribute("bookingSubmitted"));
		return "confirmation";
		} else {
			System.out.println("Control worked!!!");
			model.addAttribute("bookingRef", "Booking already saved.");
			return "confirmation";
		}
	}
}
