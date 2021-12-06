<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	  <meta charset="UTF-8">
	  <title>登录</title>

  </head>
  <body>
  <div class="login">
	  <div class="login_title">
		  <p>评教系统</p>
	  </div>
	  <div class="login_main">
		  <div class="main_left">
			  <img src="${ctx}/static/images/login_left.png" alt="">
		  </div>
		  <div class="main_right">
			  <div class="right_title">用户登录</div>
			  <form id="form" action="${ctx}/user/login" method="post">
				  <div class="username">
					  <img src="${ctx}/static/images/username.png" alt="">
					  <input id="account" type="text" name="account" placeholder="请输入用户名">
				  </div>
				  <div class="password">
					  <img src="${ctx}/static/images/password.png" alt="">
					  <input id="password" type="password" name="password" placeholder="请输入密码">
				  </div>
				  <div class="yes_login">
					  <input type="button" value="登录" id="loginForm" class="submit">
					  <input type="button" value="注册"
							 onclick="window.location.href='${ctx}/user/toRegist'">

				  </div>

			  </form>
		  </div>
	  </div>

  </div>
  <link rel="stylesheet" href="${ctx}/static/css/login.css">
  <script type="text/javascript" src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
  <script>

	  layui.use(['layer'],function () {
	      var layer=layui.layer;
          var msg='${msg}';
          var $=layui.jquery;

          if(msg!=''){
              layer.msg(msg);
          }
          $("#loginForm").click(function () {
              var account = $("#account").val();
              var password = $("#password").val();
              if (account == null || account == undefined || account == "") {
                  layer.tips('账号不能为空', '#account', {
                      tips: [1, '#3595CC'],
                      time: 4000
                  });
              }else if(password==null ||password==undefined||password==""){
                  layer.tips('密码不能为空','#password',{
                      tips:[1,'3595CC'],
                      time:4000
                  });
              }else{
                  $("#form").submit();
              //    是form里面的id
              }
          });
      });
</script>
  </body>
</html>