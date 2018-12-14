/**
 * 
 */


function today() {
	
	var d = new Date();
	
	var result = d.getFullYear()+ "-" + (d.getMonth()+1)+ "-" + d.getDate();
	
	return result; 
}


function dDay(someday){
	
	var today = new Date();
	var targetDay = new Date(someday);
	
	var b = Math.floor((today - targetDay) / 1000 / 60 / 60 / 24);
	
	var result = "D" + ((b>0)? "+"+b:b);
	
	return result;
	
}


