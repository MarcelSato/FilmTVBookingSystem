function loadCourses(stuId){
	
	$.getJSON("bookings/courses",{sId: stuId}, function(data){
		var items  = [];
		items.push("<option value='Select'>Select</option>");
		$.each(data, function(id, name){
			items.push("<option value=" + name[0] + ">" + name[1] + " - " + name[2] +"</option>"); 
		});
		$("#course").append(items)
	});
		
}