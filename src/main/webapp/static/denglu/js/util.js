var $ = $ || top.$;
//string wrapper
String.prototype.replaceAll = function(search, replace){
	var regex = new RegExp(search, "g");
	return this.replace(regex, replace);
};
String.prototype.trim = function() {
	return this.replace(/(^\s+)|(\s+$)/g, "");
};
//dom wrapper
function getId(id){
	return document.getElementById(id);
}
function getTag(tag, context){
	context = context || document;
	return context.getElementsByTagName(tag);
}
function domReady(func){
	if(domReady.done) return func();
	if(domReady.timer){
		domReady.ready.push(func);
	}else{
		if(window.attachEvent){
			window.attachEvent('onload', isDomReady);
		}else if(window.addEventListener){
			window.addEventListener("load", isDomReady, false);
		}
		domReady.ready=[func];
		domReady.timer=setInterval(isDomReady,13);
	}
};
function isDomReady(){
	if(domReady.done)return false;
	if ( document && document.getElementsByTagName && document.getElementById && document.body ) {
		clearInterval( domReady.timer );
		domReady.timer = null;
		for ( var i = 0; i < domReady.ready.length; i++ )
			domReady.ready[i]();
		domReady.ready = null;
		domReady.done = true;
	}
};
function hasClass(name,tag) {
	var r = [];
	var re = new RegExp("(^|\\s)" + name + "(\\s|$)");
	var e = document.getElementsByTagName(tag || "*");
	for ( var j = 0; j < e.length; j++ )
		if ( re.test(e[j].className) ) r.push( e[j] );
	return r;
}
function getX(e) {
	e = e || window.event;
	return e.pageX || e.clientX + document.body.scrollLeft;
}
function getY(e) {
	e = e || window.event;
	return e.pageY || e.clientY + document.body.scrollTop;
}
function getElementX( e ) {
	return ( e && e.layerX ) || window.event.offsetX;
}
function getElementY( e ) {
	return ( e && e.layerY ) || window.event.offsetY;
}
function getKeyCode(e){
	e = e || window.event;
	return (e.charCode || e.keyCode);
}
function stopBubble(e) {
	e = e || window.event;
	if ( e && e.stopPropagation )
		e.stopPropagation();
	else
		e.cancelBubble = true;
}
function stopDefault( e ) {
	e = e || window.event;
	if ( e && e.preventDefault )
		e.preventDefault();
	else
		e.returnValue = false;
	return false;
}
function DrawImage(ImgD,iwidth,iheight){
	if(ImgD==null||ImgD.src==null)
		return;
	var image=new Image();
	image.src=ImgD.src;
	if(image.width>0 && image.height>0){
		if(image.width/image.height>= iwidth/iheight){
			if(image.width>iwidth){ 
				ImgD.width=iwidth;
				ImgD.height=(image.height*iwidth)/image.width;
			}else{
				ImgD.width=image.width; 
				ImgD.height=image.height;
			}
		}else{
			if(image.height>iheight){ 
				ImgD.height=iheight;
				ImgD.width=(image.width*iheight)/image.height; 
			}else{
				ImgD.width=image.width; 
				ImgD.height=image.height;
			}			
		}
	}
} 
function globeMSG_valid(targetid,msg,toshow,classname){
	if(resetValidation!=null)
		resetValidation();	
	globeMSG(targetid,msg,toshow,classname);
}
function globeMSG(targetid,msg,toshow,classname){
	try{			
		var obj=document.getElementById(targetid);
		if(classname==null)
			classname="f_red";
		else if(classname=="tishi_t"){
			obj=window.parent.document.getElementById("globe"+targetid);
		}
		if(toshow==false){
			obj.className=classname+" hide";
		}else{
			if(classname!="add_posion")
				obj.innerHTML=msg;
			obj.className=classname;
		}
	}catch(e){}
}

