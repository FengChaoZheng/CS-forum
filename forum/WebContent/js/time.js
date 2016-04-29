window.onload = initDate;

function initDate(){
	var dayName = new Array("Sunday","Monday","Tuesday","Wednesday","Thursday","Friday",					    			  "Saturday");
	var monName = new Array("January","February","March","April","May","June","July","Auguest"	                  ,"September","October","November","December");
	var now = new Date();
	var dtString = dayName[now.getDay()]+","+monName[now.getMonth()]+","+now.getDate();
	document.getElementById("dtField").innerHTML = dtString;
}