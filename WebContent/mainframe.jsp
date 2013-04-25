<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="css/common.css" type="text/css" />
		<title>管理导航区域</title>

		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
	</head>
	<script type="text/javascript">
var preClassName = "man_nav_1";
function list_sub_nav(Id,sortname){
   if(preClassName != ""){
      getObject(preClassName).className="bg_image";
   }
   if(getObject(Id).className == "bg_image"){
      getObject(Id).className="bg_image_onclick";
      preClassName = Id;
	  showInnerText(Id);
	  window.top.frames['leftFrame'].outlookbar.getbytitle(sortname);
	  window.top.frames['leftFrame'].outlookbar.getdefaultnav(sortname);
   }
}

function showInnerText(Id){
    var switchId = parseInt(Id.substring(8));
	var showText = "对不起没有信息！";
	switch(switchId){
	    case 1:
		   showText =  "提供权限管理和用户管理!";
		   break;
	      case 2:
		   showText =  "提供业务分配于查询功能!";
		   break;
	    case 3:
		   showText =  "提供渠道分配于查询功能!";
		   break;		   
	    case 4:  // 数据统计
		   showText =  "提供如意彩渠道推广及用户数据分析查询!";
		   break;
	    case 5:
		   showText =  "提供用户详细信息查询功能!";
		   break;
		case 6:  // 数据统计
		   showText =  "提供合作用户数据查询!";
		   break;
		case 7:
		   showText =  "修改当前用户密码!";
		   break;
		case 8:
		   showText =  "提供用户帮助信息!";
		   break;
		case 9:
		   showText =  "欢迎使用如意彩渠道推广及用户数据分析系统!";
		   break;	  		   
	}
	getObject('show_text').innerHTML = showText;
}
 //获取对象属性兼容方法
 function getObject(objectId) {
    if(document.getElementById && document.getElementById(objectId)) {
	// W3C DOM
	return document.getElementById(objectId);
    } else if (document.all && document.all(objectId)) {
	// MSIE 4 DOM
	return document.all(objectId);
    } else if (document.layers && document.layers[objectId]) {
	// NN 4 DOM.. note: this won't find nested layers
	return document.layers[objectId];
    } else {
	return false;
    }
}
</script>
	<body>
		<div id="nav">
			<ul>
				<c:choose>
					<c:when test="${role.name == '推广合作方'}">
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'推广合作')"
								class="bg_image">
								推广合作
							</li> </a>
					</c:when>
					<c:when test="${role.name == '充值结算渠道'}">
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'充值结算')"
								class="bg_image">
								充值结算
							</li> </a>
					</c:when>
					<c:when test="${role.name == 'cpa推广'}">
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'装机量统计')"
								class="bg_image">
								装机量统计
							</li> </a>
					</c:when>
					<c:when test="${role.name == '苏宁统计'}">
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'苏宁统计')"
								class="bg_image">
								苏宁统计
							</li> </a>
					</c:when>
					<c:when test="${role.name == '充值装机量'}">
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'充值装机量')"
								class="bg_image">
								充值装机量
							</li> </a>
					</c:when>
					<c:otherwise>
						<a href="sys/welcome.jsp" target="manFrame">
							<li id="man_nav_1" onclick="list_sub_nav(id,'系统管理')"
								class="bg_image_onclick">
								系统管理
							</li> </a>
						<a href="yewu/welcome.jsp" target="manFrame">
							<li id="man_nav_2" onclick="list_sub_nav(id,'业务管理')"
								class="bg_image">
								业务管理
							</li> </a>
						<a href="channel/welcome.jsp" target="manFrame">
							<li id="man_nav_3" onclick="list_sub_nav(id,'渠道管理')"
								class="bg_image">
								渠道管理
							</li> </a>
						<a href="tj/welcome.jsp" target="manFrame">
							<li id="man_nav_4" onclick="list_sub_nav(id,'数据统计')"
								class="bg_image">
								数据统计
							</li> </a>
						<a href="userinfo/welcome.jsp" target="manFrame">
							<li id="man_nav_5" onclick="list_sub_nav(id,'用户查询')"
								class="bg_image">
								用户查询
							</li> </a>
					</c:otherwise>
				</c:choose>

				<a href="pass/welcome.jsp" target="manFrame">
					<li id="man_nav_7" onclick="list_sub_nav(id,'修改密码')"
						class="bg_image">
						修改密码
					</li> </a>
				<a href="help/welcome.jsp" target="manFrame">
					<li id="man_nav_8" onclick="list_sub_nav(id,'帮助中心')"
						class="bg_image">
						帮助中心
					</li> </a>
			</ul>
		</div>
		<div id="sub_info">
			&nbsp;&nbsp;
			<img src="images/hi.gif" />
			&nbsp;
			<span id="show_text">欢迎使用金软瑞彩赠彩后台管理系统!</span>
		</div>
	</body>
</html>
