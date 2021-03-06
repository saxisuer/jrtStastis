<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="/WEB-INF/fmt.tld"%>
<%@ taglib prefix="c" uri="/WEB-INF/c.tld"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户管理</title>
		<link rel="stylesheet" href="../css/npage.css" type="text/css"></link>
		<link rel="stylesheet" href="../css/skin.css" type="text/css"></link>
		<script type="text/javascript" src="../js/datautil.js"></script>
		<script language="javascript">
        function add() {
	      //location.replace("yewuadd.html");
	      location.href("newuser.do");
        }
        function selectall (obj) 
        {
          var objFrm=obj;
               
          elements=objFrm.form.elements;
          for (var i = 0; i < elements.length; i++) 
          {
            var ele = objFrm.form.elements[i];
            if (ele.type == "checkbox" ) 
            {
	           ele.click();
	           //alert(ele.id);
	        }
	      }
        }
        function del(obj) 
        {
          var objFrm=obj;
          var ids = "";         
                    
          elements=objFrm.form.elements;
          for (var i = 0; i < elements.length; i++) 
          {
            var ele = objFrm.form.elements[i];
            if (ele.type == "checkbox" ) 
            {
               if(ele.checked){
	             ids += ele.id + ",";
	           }
	        }
	      }
	      if(ids == '') {
	         alert('您没有选取要删除的数据！');
	         return;
	      }
	      if(!confirm('确认删除吗?')) return;
             
	      objFrm.form.ids.value = ids;
	      //alert(objFrm.form.ids.value);
	      if(objFrm.form.ids.value!=""){
	        objFrm.form.action = "deluser.do";
	        objFrm.form.submit();
	      }
        }
        </script>
	</head>

	<body>
		<form id="form1" name="form1" method="post" action="listuser.do">
		    <input id="ids" name="ids" type="hidden" value="" />
			<div id="container" class="container">
				
				<!-- 表格body -->
				<div class="table_db">
					<table cellspacing="0" cellpadding="0" width="98%" bgcolor="#a0ae88" border="1" style="border-collapse:collapse;">
						<tr bgcolor="#dadfd0" height="25px">
							<td width="50px">
								<div align="center">
									编号
								</div>
							</td>
							<td width="150px">
								<div align="center">
									 登录名
								</div>
							</td>
							<td width="150px">
								<div align="center">
									 真实姓名
								</div>
							</td>
							<td width="150px">
								<div align="center">
									 联系方式
								</div>
							</td>
							<td width="150px">
								<div align="center">
									 当前角色
								</div>
							</td>
							<td width="150px">
								<div align="center">
									 注册时间
								</div>
							</td>							
							<td>
								<div align="center">
									备注
								</div>
							</td>							
							<td width="50px">
								<div align="center">
									编辑
								</div>
							</td>							
							<td width="50px">
								<div align="center">
									选项
								</div>
							</td>
						</tr>
						<%
							Integer i = 0;
						%>
						<c:forEach var="list" items="${list}" varStatus="it">
							<tr bgcolor="#FFFFFF" height="23px">
								<td align="center">
									<script language="javascript">
									  document.write(${rollPage.pageCur*rollPage.pagePer} + <%=(++i)%>);														
								    </script>
								</td>
								<td align="center">
									${list.name}
								</td>
								<td align="center">
									${list.realname}
								</td>
								<td align="center">
									${list.tel}
								</td>
								<td align="center">
									${list.role.name}
								</td>
								<td align="center">
									<script language="javascript">
								       document.write(OracleData('${list.regdate}'));													
								    </script>
								</td>
								<td align="center">
									${list.bz}
								</td>								
								<td align="center">
									<a href="finduser.do?id=${list.id}" class="txtStyle">修改</a>
								</td>
								<td align="center">
									<input type="checkbox" id="${list.id}" name="record" value='测试' />
								</td>
							</tr>
						</c:forEach>

						<tr bgcolor="#dadfd0" height="23px">
							<td align="right" colspan="9">
								<c:import url="/page/rollpage_o.jsp" />
							</td>
						</tr>

					</table>
				</div>
				<!-- 表格foot -->
				<div class="table_db">
					<table cellspacing="0" cellpadding="0" width="98%" align="left">
						<tbody>
							<tr bgcolor="#dadfd0">								
								<td align="right">
									<input class="btnStyle" onclick="javascript:add();"
										type="button" value="添 加" />
									<input class="btnStyle" type="button" value="全 选"
										onclick="selectall(this);" />
									<input id="delBtn" class="btnStyle" type="button" value="删 除"
										onclick="del(this);" />
								</td>								
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</form>
	</body>
</html>
