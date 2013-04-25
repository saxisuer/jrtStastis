<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>
<%
String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link rel="stylesheet" href="<%=path%>/css/common.css" type="text/css" />
<title>左侧导航栏</title>
</head>
<script type="text/javascript">
var preClassName = ""; 
function list_sub_detail(Id, item) 
{ 
if(preClassName != "") 
{ 
getObject(preClassName).className = "left_back" 
} 
if(getObject(Id).className == "left_back") 
{ 
getObject(Id).className = "left_back_onclick"; 
outlookbar.getbyitem(item); 
preClassName = Id 
} 
} 
function getObject(objectId) 
{ 
if(document.getElementById && document.getElementById(objectId)) 
{ 
return document.getElementById(objectId) 
} 
else if(document.all && document.all(objectId)) 
{ 
return document.all(objectId) 
} 
else if(document.layers && document.layers[objectId]) 
{ 
return document.layers[objectId] 
} 
else 
{ 
return false 
} 
} 
function outlook() 
{ 
this.titlelist = new Array(); 
this.itemlist = new Array(); 
this.addtitle = addtitle; 
this.additem = additem; 
this.getbytitle = getbytitle; 
this.getbyitem = getbyitem; 
this.getdefaultnav = getdefaultnav 
} 
function theitem(intitle, insort, inkey, inisdefault) 
{ 
this.sortname = insort; 
this.key = inkey; 
this.title = intitle; 
this.isdefault = inisdefault 
} 
function addtitle(intitle, sortname, inisdefault) 
{ 
outlookbar.itemlist[outlookbar.titlelist.length] = new Array(); 
outlookbar.titlelist[outlookbar.titlelist.length] = new theitem(intitle, sortname, 0, inisdefault); 
return(outlookbar.titlelist.length - 1) 
} 
function additem(intitle, parentid, inkey) 
{ 
if(parentid >= 0 && parentid <= outlookbar.titlelist.length) 
{ 
insort = "item_" + parentid; 
outlookbar.itemlist[parentid][outlookbar.itemlist[parentid].length] = new theitem(intitle, insort, inkey, 0); 
return(outlookbar.itemlist[parentid].length - 1) 
} 
else additem = - 1 
} 
function getdefaultnav(sortname) 
{ 
var output = ""; 
for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
{ 
if(outlookbar.titlelist[i].isdefault == 1 && outlookbar.titlelist[i].sortname == sortname) 
{ 
output += "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
output += "</div>"; 
output += "<div class=list_detail id=sub_detail_" + i + "><ul>"; 
for(j = 0; j < outlookbar.itemlist[i].length; j ++ ) 
{ 
output += "<li id=" + outlookbar.itemlist[i][j].sortname + j + " onclick=\"changeframe('"+outlookbar.itemlist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.itemlist[i][j].key+"')\"><a href=#>" + outlookbar.itemlist[i][j].title + "</a></li>" 
} 
output += "</ul></div>" 
} 
} 
getObject('right_main_nav').innerHTML = output 
} 
function getbytitle(sortname) 
{ 
var output = "<ul>"; 
for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
{ 
if(outlookbar.titlelist[i].sortname == sortname) 
{ 
output += "<li id=left_nav_" + i + " onclick=\"list_sub_detail(id, '"+outlookbar.titlelist[i].title+"')\" class=left_back>" + outlookbar.titlelist[i].title + "</li>" 
} 
} 
output += "</ul>"; 
getObject('left_main_nav').innerHTML = output 
} 
function getbyitem(item) 
{ 
var output = ""; 
for(i = 0; i < outlookbar.titlelist.length; i ++ ) 
{ 
if(outlookbar.titlelist[i].title == item) 
{ 
output = "<div class=list_tilte id=sub_sort_" + i + " onclick=\"hideorshow('sub_detail_"+i+"')\">"; 
output += "<span>" + outlookbar.titlelist[i].title + "</span>"; 
output += "</div>"; 
output += "<div class=list_detail id=sub_detail_" + i + " style='display:block;'><ul>"; 
for(j = 0; j < outlookbar.itemlist[i].length; j ++ ) 
{ 
output += "<li id=" + outlookbar.itemlist[i][j].sortname + "_" + j + " onclick=\"changeframe('"+outlookbar.itemlist[i][j].title+"', '"+outlookbar.titlelist[i].title+"', '"+outlookbar.itemlist[i][j].key+"')\"><a href=#>" + outlookbar.itemlist[i][j].title + "</a></li>" 
} 
output += "</ul></div>" 
} 
} 
getObject('right_main_nav').innerHTML = output 
} 
function changeframe(item, sortname, src) 
{ 
if(item != "" && sortname != "") 
{ 
window.top.frames['mainFrame'].getObject('show_text').innerHTML = sortname + "  <img src=<%=path%>/images/slide.gif broder=0 />  " + item 
} 
if(src != "") 
{ 
window.top.frames['manFrame'].location = src 
} 
} 
function hideorshow(divid) 
{ 
subsortid = "sub_sort_" + divid.substring(11); 
if(getObject(divid).style.display == "none") 
{ 
getObject(divid).style.display = "block"; 
getObject(subsortid).className = "list_tilte" 
} 
else 
{ 
getObject(divid).style.display = "none"; 
getObject(subsortid).className = "list_tilte_onclick" 
} 
} 
function initinav(sortname) 
{ 
outlookbar.getdefaultnav(sortname); 
outlookbar.getbytitle(sortname); 
//window.top.frames['manFrame'].location = "manframe.jsp" 
}
document.write("<script src=nav.js></" + "script>");
</script>
 
<c:choose>
  <c:when test="${role.name == '推广合作方'}">
<body onload="initinav('推广合作')">
<div id="left_content">
     <div id="user_info">欢迎您</div>
	 <div id="main_nav">
	     <div id="left_main_nav"></div>
		 <div id="right_main_nav"></div>
	 </div>
</div>	
</body>
  </c:when>
  <c:otherwise>
<body onload="initinav('系统管理')">
<div id="left_content">
     <div id="user_info">欢迎您</div>
	 <div id="main_nav">
	     <div id="left_main_nav"></div>
		 <div id="right_main_nav"></div>
	 </div>
</div>	
</body>
  </c:otherwise>
</c:choose>
</html>
