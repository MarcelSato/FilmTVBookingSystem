//function courseSelected(){
//	var course = document.getElementById("course").value;
//	if(course == "Select"){
//		document.getElementById("tutor").style.display = "none";	
//	}
//	else{
//		document.getElementById("tutor").style.display = "";
//		document.getElementById("progress").style.width ="10%" ;
//		getTutor();
//	}
//}

//function getTutor(){
//	var course = document.getElementById("course").value;
//	var tName = getTuts(course);
//	var option = document.createElement("option");
//	var oText = document.createTextNode(tName);
//	option.appendChild(oText);
//	document.getElementById("tutors").appendChild(option);
//}

//function getTuts(course){
//  if (window.XMLHttpRequest) {
//    xhttp = new XMLHttpRequest();
//  } else {
//    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
//  }
//  var httpURL = "getut.php?n=" + course;
//  xhttp.open("GET",httpURL,false);
//  xhttp.send();
//  return xhttp.responseText;
//}

//function tutorSelected(){
//	var tutor = document.getElementById("tutors").value;
//	if(tutor == "Select"){
//		document.getElementById("location").style.display = "none";	
//	}
//	else{
//		document.getElementById("location").style.display = "";
//		document.getElementById("progress").style.width ="20%" ;
//	}
//			
//}

//function locationSelected(){
//	var loc = document.getElementById("loc").value;
//	if(loc == "Select"){
//		document.getElementById("dPicker").style.display = "none";
//		$( "#datepicker" ).datepicker("refresh");
//	} else {
//		document.getElementById("dPicker").style.display = "";
//		document.getElementById("datepicker").value = "";
//		document.getElementById("progress").style.width ="30%" ;
//	}
//	callDatePicker();
//}

																	
//function catSelected(){
//	document.getElementById("progress").style.width ="60%" ;
//	var hideCat = document.getElementById("category").value;
//	if(hideCat == "Select"){
//		document.getElementById("equip").style.display = "none";
//	} else {
//		document.getElementById("equip").style.display = "";
//	}
//	
//	var equi = document.getElementById("equipment").rows.length;
//	if(equi > 0){
//		for(i = 0; i < equi; i++){
//			var a = document.getElementById("equipment");
//			var b = document.getElementById("equip"+i);
//			a.removeChild(b);																							
//			/* if(i == equi) break; */
//		}
//		
//	}
//	getEquip();
//}

function addItem(code){
	alert(code);
}

//function getEquip(){
//
//	var cat = document.getElementById("category").value;
//	var equip = getAllEquip(cat);
//	equip = equip.split("&");
//	var equipName = [];
//	var equipDesc = [];
//	for(a = 0; a < equip.length; a++){
//	equip[a] = equip[a].split("=").pop().replace(/\+/g, " ");
//	}
//	
//	for(b = 0; b < equip.length; b++){
//	  equipName[b] = equip[b].split("-").shift();
//		equipDesc[b] = equip[b].split("-").pop();
//	}
//	/* document.getElementById("errMsg").innerHTML = equipName + "<br />" + equipDesc; */
//	for(i = 0; i < equip.length; i++){
//	var tr = document.createElement("tr");
//	var td1 = document.createElement("td");
//	var td1Text = document.createTextNode(equipName[i]);
//	var td2 = document.createElement("td");
//	var td2Text = document.createTextNode(equipDesc[i]);
//	td1.appendChild(td1Text);
//	td2.appendChild(td2Text);
//	
//	tr.setAttribute("id", "equip"+i);
///* 	td.setAttribute("value", "equip"+i) */
//	tr.appendChild(td1);
//	tr.appendChild(td2);
//	
//	var td3 = document.createElement("td")
//	td3.setAttribute("style", "cursor:pointer");
//	
//			var minus = document.createTextNode("-    ");
//			var spanM = document.createElement("span");
//			spanM.appendChild(minus);
//			td3.appendChild(spanM);
//			var plus = document.createTextNode("    +");
//			spanP = document.createElement("span");
//			spanP.appendChild(plus);
//			spanP.setAttribute("onclick", "addItem(" + i + ")");
//			td3.appendChild(spanP);
//			tr.appendChild(td3);
//	
//	tr.setAttribute("class", "form-signin-heading");
//	var input = document.createElement("input");
//	tr.appendChild(input);
//	document.getElementById("equipment").appendChild(tr);		
//	}
//	
///*
//	for(i = 0; i < equip.length; i++){
//	var option = document.createElement("option");
//	var cText = document.createTextNode(equip[i]);
//	option.appendChild(cText);
//	option.setAttribute("id", "equip"+i);
//	option.setAttribute("value", "equip"+i)
//	document.getElementById("equipment").appendChild(option);		
//	}
//*/
///* 	document.getElementById("errMsg").innerHTML = "getEquip - " + document.getElementById("equipment").length; */
//}

//function getAllEquip(cat){
//  if (window.XMLHttpRequest) {
//    xhttp = new XMLHttpRequest();
//  } else {
//    xhttp = new ActiveXObject("Microsoft.XMLHTTP");
//  }
//  var httpURL = "getequip.php?n=" + cat;
//  xhttp.open("GET",httpURL,false);
//  xhttp.send();
//  return xhttp.responseText;
//}
//function checkDate(date){
//	if(date.getDay() == 0) date.setDate(date.getDate() + 1);
//	if(date.getDay() == 6) date.setDate(date.getDate() + 2);
//	return date;
//}

/* ----------  JQuery section  ---------- */

//$(function() {
//  $( document ).tooltip();
//});
//
///* listening for date pickers with JQuery */
//
//$('input[name=datepicker]').change( function () {
//	document.getElementById("progress").style.width ="40%" ;
//	document.getElementById("dPickerReturn").style.display = "";
//	callDateReturn()
//});
//
//$('input[name=datepickerReturn]').change( function () {
//	document.getElementById("progress").style.width ="50%" ;
//	document.getElementById("continueBtn").style.display = "";
//});

//function callDatePicker(){
//	var loc = document.getElementById("loc").value;
//	var bookingDate = new Date();
//	if(loc == "On Campus"){
//		bookingDate.setDate(bookingDate.getDate() + 4);
//		bookingDate = checkDate(bookingDate);
//		var b = bookingDate.getDate();
//		var a = new Date();
//		b = b - a.getDate();
//	  $( "#datepicker" ).datepicker("destroy");
//	  $( "#datepicker" ).datepicker({
//	  setDate: bookingDate,
//	  minDate: + b
//	  });	
//		 
//	} else if (loc == "Off Campus"){
//		bookingDate.setDate(bookingDate.getDate() + 7);
//		bookingDate = checkDate(bookingDate);
//		var c = bookingDate.getDate();
//		var a = new Date();
//		c = c - a.getDate();
//		$( "#datepicker" ).datepicker("destroy");
//	  $( "#datepicker" ).datepicker({
//	  setDate: bookingDate,
//	  minDate: + c
//	  });	 
//	}
//}
//
//
//function callDateReturn(){
//	var currDate = document.getElementById("datepicker").value;
//	var a = currDate;
//	a = a.toString();
//	a = a.slice(3,5);
//	var b = new Date();
//	a = a - b.getDate();	
//	$( "#datepickerReturn" ).datepicker({
//		minDate: + a
//	});
//	$( "#datepickerReturn" ).datepicker("setDate", currDate);
//	
//}
//  