package org.gre.filmtv.Controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class uploadController {

    @RequestMapping(value = "uploadFile", method = RequestMethod.POST)   // http://www.journaldev.com/2573/spring-mvc-file-upload-example-tutorial-single-and-multiple-files
    String uploadFileHandler(@RequestParam("name") String name,
    		                 @RequestParam("file") MultipartFile file,
    		                 @RequestParam("bookingModel") String bkngModel,
    		                 @RequestParam("basketModel") String bsktModel,
    		                 Model model) {
    	JSONObject bookingJson = null;
    	JSONArray  basketJson  = null;
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
    	
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
 
//                String filePath = System.getProperty("catalina.home");
//                File directory = new File(filePath + File.separator + "tmpFiles");
                String filePath = "/Users/Marcel/FILMTV/RAs";
                File directory = new File(filePath);
                if (!directory.exists())
                    directory.mkdirs();
 
                // Create the file on server
                File serverFile = new File(directory.getAbsolutePath() + File.separator + name);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
                stream.write(bytes);
                stream.close();
 
                System.out.println("Server File Location = " + serverFile.getAbsolutePath()); // Handle outcomes better
                model.addAttribute("Success", "Upload was successful");
                bookingJson.put("Path", serverFile.getAbsolutePath());
                model.addAttribute("Booking", bookingJson);
        		model.addAttribute("Basket", basketJson);
                return "finish";
            } catch (Exception e) {
                return "You failed to upload " + name + " => " + e.getMessage();
            }
        } else {
        	model.addAttribute("Failed", "Upload failed. File is empty");
            return "ra";
        }
    }
}
