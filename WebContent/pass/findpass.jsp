<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<link rel="stylesheet" href="../css/npage.css" type="text/css"></link>
		<link rel="stylesheet" href="../css/skin.css" type="text/css"></link>
		<title>管理区域</title>
		<meta http-equiv="pragma" content="no-cache" />
		<meta http-equiv="cache-control" content="no-cache" />
		<meta http-equiv="expires" content="0" />
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
		<meta http-equiv="description" content="This is my page" />
		<script type="text/javascript" src="../js/jquery.js"></script>
		<script type="text/JavaScript"> 
           $(document).ready(function(){ 
              $("#btn_ok").click(function(){  
              login();     
              }              
              ); 
              $("#btn_quit").click(function(){  
               window.location.href = "userinfo.jsp";     
              }              
              );
           }); 
           
           function login(){
              var flag = true;  
              var password = $("#password")[0].value;
              var password1 = $("#password1")[0].value;
              var password2 = $("#password2")[0].value;
              
               $("#error_password").text(""); 
               $("#error_password1").text(""); 
               $("#error_password2").text(""); 
              
              if(password ==''){
                 flag = false;
                 $("#error_password").text("当前密码不能为空!");                 
              }
              if(password1 ==''){
                 flag = false;
                 $("#error_password1").text("请输入新密码!");
              }
              if(password2 ==''){
                 flag = false;
                 $("#error_password2").text("请输入新密码!");
              }
              if(password1 != password2){
                 flag = false;
                 $("#error_password2").text("密码输入不一致!");
              }
              if(flag){
                 $('#form1')[0].submit();
              }else{
                return false;
              }
           }
       </script>
	</head>

	<body>
	    <script language="javascript">
	      ${msg}												
		</script>
	    <form id="form1" method="post" action="updatepass.do">
		<div id="man_zone">
			<table width="98%" border="0" align="center" cellpadding="3"
				cellspacing="1" class="table_style">
				<tr>
					<td width="120px" class="left_title_1">
						当前密码:
					</td>
					<td>
						<input id="password" name="password" class="input_text_long2"
							type="password" maxlength="20" style="float: left;" />
						<div id="error_password" style="color: #C04000; height: 22px;">
							&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						新密码:
					</td>
					<td>
						<input id="password1" name="password1" class="input_text_long2"
							type="password" maxlength="20" style="float: left;" />
						<div id="error_password1" style="color: #C04000; height: 22px;">
							&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td class="left_title_1">
						再次输入新密码:
					</td>
					<td>
						<input id="password2" name="password2" class="input_text_long2"
							type="password" maxlength="20" style="float: left;" />
						<div id="error_password2" style="color: #C04000; height: 22px;">
							&nbsp;
						</div>
					</td>
				</tr>
				<tr>
					<td class="left_title_2">
						&nbsp;
					</td>
					<td>
						<input type="button" class="btnStyle" id="btn_ok" value="保  存" />&nbsp;<input type="button" class="btnStyle" id="btn_quit" value="返 回" />
					</td>
				</tr>
			</table>
		</div>
		</form>
	</body>
</html>

