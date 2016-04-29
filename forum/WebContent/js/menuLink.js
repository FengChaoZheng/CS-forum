window.onload = initAll;

//以下注释部分实现了可折叠菜单功能
/*	
function initAll(){
	var allLinks = document.getElementsByTagName("a");
	for(var i=0;i<allLinks.length;i++){
		if(allLinks[i].className.indexOf("menuLink")>-1){
			allLinks[i].onclick = toggleMenu;
		}
	}
}
function toggleMenu(){
	var startMenu = this.href.lastIndexOf("/")+1;
	var stopMenu = this.href.lastIndexOf(".");
	
	var thisMenuName = this.href.substring(startMenu,stopMenu);
	var thisMenu = document.getElementById(thisMenuName).style;
	if(thisMenu.display == "block"){
		thisMenu.display = "none";
	}else{
		thisMenu.display = "block";
	}
		
	return false;
}
*/


//以下代码段实现了下拉菜单功能
function initAll(){
	var allLinks = document.getElementsByTagName("a");
	for(var i=0;i<allLinks.length;i++){
		if(allLinks[i].className.indexOf("menuLink")>-1){
			allLinks[i].onmouseover = toggleMenu;
			allLinks[i].onclick = function(){
				return false;
			}
		}
	}
}
function toggleMenu(){
	var startMenu = this.href.lastIndexOf("/")+1;
	var stopMenu = this.href.lastIndexOf(".");
	var thisMenuName = this.href.substring(startMenu,stopMenu);
	
	document.getElementById(thisMenuName).style.display = "block";
	
	this.parentNode.className = thisMenuName;
	this.parentNode.onmouseout = function(){
		document.getElementById(thisMenuName).style.display = "none";
	}
	this.parentNode.onmouseover = function(){
		document.getElementById(thisMenuName).style.display = "block";
	}
}