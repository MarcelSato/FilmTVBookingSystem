var myBasket = [];

function loadCourses(stuId){
	
	$.getJSON("bookings/courses",{sId: stuId}, function(data){
		var items  = [];
		items.push("<option value='Select'>Select</option>");
		$.each(data, function(id, name){
// 				items.push("<option value=" + name.courseId + ">" + name.courseCode + " - " + name.courseName +"</option>"); // syntax in case parameter passed is a Table Object 
			items.push("<option value=" + name[0] + ">" + name[1] + " - " + name[2] +"</option>"); // syntax for Array list 
		});
		$("#course").append(items)
	});
		
}

function loadCategories(courseId){
	
//	$.cookies.set("myCookie", null, {path: '/FILMTV/'});
	$("#progress").css("width", "75%");
	$.getJSON("equip/categories", {cId: courseId}, function(data){
		var items = [];
		items.push("<option value='Select'>Select</option>");
		$.each(data, function(id, name){
			items.push("<option value=" + name[0] + ">" + name[1] + "</option>");
		});
	$("#category").append(items);
	});
	
}

function courseSelected(){
	var courseId = $("#course").val();
	if(courseId == "Select"){
		refreshSelect();
	}
	else{
		$("#tutor").css("display", "");
		$("#progress").css("width", "15%");
		getTutor(courseId);
	}

	$("#course").change(function(){
		var courseId = $("#course").val();
		if(courseId == "Select"){
			getTutor(courseId);
		} else {
			refreshSelect();
			$("#tutor").css("display", "");
			$("#progress").css("width", "15%");
		}
	})
}

function refreshSelect(){
	$("#tutor").css("display", "none");
	$("#location").css("display", "none");
	$("#loc").val("Select");
	$("#dPicker").css("display", "none");
	$("#dPickerReturn").css("display", "none");
	$("#continueBtn").css("display", "none");
}

function tutorSelected(){
	
	var tutor = $("#tutors").val();
	if(tutor == "Select"){
		$("#location").css("display","none");
	}
	else{
		$("#location").css("display","");
		$("#progress").css("width","30%");
	}
	
}

function getTutor(courseId){

	$.getJSON("bookings/tutors",{cId: courseId}, function(data){
		$("#tutors option").remove();
		var tutSelect = $("#tutors");
		var items = [];
		items.push("<option value='Select'>Select</option>");
		$.each(data, function(id, tutor){
			items.push("<option value="+ tutor[0] +">" + tutor[1] + "</option>");
		});
		tutSelect.append(items);
	});

}	

function locationSelected(){
	
	$("#datepicker").datepicker("destroy");
	$("#datepicker").datepicker("hide");	
	$("#datepickerReturn").datepicker("destroy");
	$("#datepickerReturn").datepicker("hide");
	var loc = $("#loc").val();
	$("#dPickerReturn").css("display", "none");
	$("#continueBtn").css("display", "none");
	if(loc == "Select"){
		$("#dPicker").css("display", "none");
		$( "#datepicker" ).datepicker("refresh");
	} else {
		$("#dPicker").css("display", "");
		$("#datepicker").val("");
		$("#progress").css("width", "45%");
	}
	callDatePicker();
}

function catSelected(){
	var hideCat = $("#category").val();	
	if(hideCat == "Select"){
		$("#progress").css("width", "75%");
		$("#equip").css("display", "none");
	} else {
		$("#progress").css("width", "90%");
		$("#equip").css("display", "");
	}
	getEquip();
	refreshButtons();
}

function refreshButtons(){
	setTimeout(function() {
	for(i = 0; i < myBasket.length; i++){
		var eId = $("#" + myBasket[i].equiId).val();
		var bId = myBasket[i].equiId;
		console.log(eId + " - " + bId);
		
		if(bId == eId){
			
			$("#" + eId).addClass("active");
			
		}
	}
	}, 300);
}

function getEquip(){
	
	  var cat = $("#category").val();
	  $.getJSON("equip/equipment", {catId: cat}, function(data){
		 $("#equipment").children().remove();
		 var items = [];
		 items.push("");
		 $.each(data, function(id, item){
			 var qtyDwn = item.quantity - item.booked;
			 var optionTag = "";
			 if(qtyDwn == 0){
				 var myClass = "notAvailable";
			 } else {
				 var myClass = "";
				 for (i=0; i < qtyDwn; i++){
						var newQty = i + 1;
						optionTag +="<option value=\"" + newQty + "\">" + newQty + "</option>";
					 }
			 }
			 
			 items.push("<tr>" +
					 		"<td><ul class=\"nav nav-pills\" role=\"tablist\"><li><button type=\"button\" class=\"btn equiBtn " + myClass + "\" data-toggle=\"button\" id=\"" + item.equipmentId + "\" value=\"" + item.equipmentId + "\" onmousedown=\"addItem(" + item.equipmentId + ")\">" + item.name + "</button></li></ul></td>" +
			 				"<td><select id=\"qtyDwn" + item.equipmentId + "\" onchange=\"updateBasket(" + item.equipmentId + ")\" class=\"qtyDwn\">" + optionTag + "</select></td>" +
					 	    "<td><ul class=\"nav nav-pills\" role=\"tablist\">" +
								"<li role=\"presentation\" class=\"dropdown\">"+
							        "<a href=\"#\" class=\"dropdown-toggle\" data-toggle=\"dropdown\">"+
							          "Info"+
							        "</a>"+
							        "<ul class=\"dropdown-menu myMenu dropdown-menu-right\" role=\"menu\">"+
							          "<li role=\"presentation\">" + item.description + "</li>"+
							          "<li role=\"presentation\" class=\"divider\"></li>"+
							          "<li role=\"presentation\">Level - " + item.level + "</li>"+
							          "<li role=\"presentation\" class=\"divider\"></li>"+
							          "<li role=\"presentation\">Quantity - " + item.quantity + "</li>"+
							          "<li role=\"presentation\" class=\"divider\"></li>"+
							          "<li role=\"presentation\">Picture - add Pic</li>"+
							       " </ul>"+
							      "</li>"+
							    "</ul></td>"+				 		
		 				"</tr>");
		 });
		 $("#equipment").append(items);
	  });	  
}

function addItem(eId){
	var exists = null;
	var arrayIndex = null;
	$.getJSON("equip/equipDetails", {eId: eId}, function(data){
		$.each(data, function(desc, equip){
			
			for(i = 0; i < myBasket.length; i++){
				if(myBasket[i].equiId == eId){
					exists = true;
					arrayIndex = myBasket.indexOf(myBasket[i]);
					console.log("arrayIndex = " + arrayIndex);
					myBasket.splice(arrayIndex, 1);
					return false;
				}
				
			}
			if(exists != true){
				myBasket.push({"equiId":eId,"name":equip.name, "quantity":$("#qtyDwn"+eId).val()});
//				console.log("QTY - " + $("#qtyDwn"+eId).val());
			}
			
		});
		refreshBasket(eId);
	});
}

function updateBasket(eId) {
//	alert(eId);
	try{
		for(i = 0; i < myBasket.length; i++){
			console.log("FOR LOOP size - " + myBasket.length + " - " + myBasket[i].equiId + " - " + eId);
			if(myBasket[i].equiId == eId){
				
				myBasket[i].quantity = $("#qtyDwn"+eId).val();
			}
			console.log("UPDATE WORKED - " + $("#qtyDwn"+eId).val());
			
		}
		refreshBasket(eId);
	} catch(err){
		console.log("UPDATE FAILED");
	}
	
}

function refreshBasket(eId){
	$("#basketDD").empty();
	$("#basketDDL").empty();
	for(i = 0; i < myBasket.length; i++){
		var basketItem = myBasket[i].name + " quantity - " + myBasket[i].quantity;		
		$("#basketDD").append("<tr><td>" + myBasket[i].name + "</td><td> - " + myBasket[i].quantity + "</td></tr>");
		$("#basketDDL").append("<tr><td>" + myBasket[i].name + "</td><td> - " + myBasket[i].quantity + "</td></tr>");
	}
	if(myBasket.length == 0){
		$("#basketDD").append("<tr><td>Basket is Empty</td></tr>");
		$("#basketDDL").append("<tr><td>Basket is Empty</td></tr>");
		$("#ctnBtn").css("display", "none");
	} else {
		$("#ctnBtn").css("display", "");
	}
	console.log(myBasket);
	$("#basketModel").val(JSON.stringify(myBasket));
}

function checkDate(date){
	if(date.getDay() == 0) date.setDate(date.getDate() + 1);
	if(date.getDay() == 6) date.setDate(date.getDate() + 2);
	return date;
}


function deleteRDate(){
	$("#datepickerReturn").val("");
}

function getFilename(){
	console.log($("#uName").val());
	var fileName = $("#file").val();
	$("#slctFile").val($("#uName").val() + "-" + fileName);
}

function loadRA(){
	$("#progress").css("width", "95%");
}
/* ----------  JQuery section  ---------- */

$(function(){
	$("#datepicker").datepicker();
});

$(function() {
  $( document ).tooltip();
});

/* listening for date pickers with JQuery */

$('input[id=datepicker]').change( function () {
	$("#progress").css("width", "60%");
	$("#dPickerReturn").css("display", "");
	$("#ui-datepicker-div").toggle();
	callDateReturn()
});

$('input[id=datepickerReturn]').change( function () {
	$("#progress").css("width","75%");
	$("#continueBtn").css("display", "");
	$("#ui-datepicker-div").toggle();
});

function callDatePicker(){
	var loc = $("#loc").val();
	var bookingDate = new Date();
	if(loc == "Off Campus"){
		bookingDate.setDate(bookingDate.getDate() + 4);
		bookingDate = checkDate(bookingDate);
	  $( "#datepicker" ).datepicker("destroy");
	  $( "#datepicker" ).datepicker({
	  setDate: bookingDate,
	  minDate: bookingDate
	  });
		 
	} else if (loc == "On Campus"){
		bookingDate.setDate(bookingDate.getDate() + 7);
		bookingDate = checkDate(bookingDate);
		$( "#datepicker" ).datepicker("destroy");
		$( "#datepicker" ).datepicker({
		setDate: bookingDate,
		minDate: bookingDate
		});	 
	}
}

function callDateReturn(){
	var currDate = $("#datepicker").val();
	$( "#datepickerReturn" ).datepicker("destroy");
	$( "#datepickerReturn" ).datepicker({
		setDate: currDate,
		minDate: currDate
	});	
}
	  