<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	  <meta charset="UTF-8">
	  <title>注册</title>
	  <link rel="stylesheet" href="${ctx}/static/css/regist.css">
	  <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
  </head>
  <body>
  <div class="regist">
	  <div class="regist_title">
		  <p>评教系统</p>
	  </div>
	  <div class="regist_main">
		  <div class="main_left">
			  <img src="${ctx}/static/images/login_left.png" alt="" style="height: 460px;">
		  </div>
		  <div class="main_right">
			  <div class="right_title">用户注册</div>
			  <form action="${ctx}/user/regist" method="post" class="layui-form" >
				  <div class="account">
					  <input type="text" name="account" class="account"  lay-verify="required" placeholder="请输入账号">
				  </div>
				  <div class="password">
					  <input type="text" name="password"class="password" lay-verify="required" placeholder="请输入密码">
				  </div>
				  <div class="repassword">
					  <input type="text" name="rpassword"class="rpassword" lay-verify="required" placeholder="请输入密码">
				  </div>
				  <div class="name">
					  <input type="text" name="name" class="name" lay-verify="required" placeholder="姓名" >
				  </div>
				  <div class="sex" >
					  <select name="sex" lay-verify="">
						  <option value="1">男</option>
						  <option value="0">女</option>

					  </select>
				  </div>
				  <div class="telephone">
					  <input type="text" lay-verify="required" name="telephone"class="telephone" placeholder="请输入电话号码">
				  </div>

				  <div class="yes_regist">
					  <%--<button lay-submit lay-filter="*">注册</button>--%>
					  <%--<input type="button" lay-submit value="注册" lay-filter="demo"  >--%>
						  <button class="layui-btn" lay-submit lay-filter="demo">立即提交</button>
				  </div>
			  </form>
		  </div>
	  </div>

  </div>


  <script type="text/javascript" src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
  <script>

      layui.use(['layer','form'],function () {
          var layer=layui.layer;
          var msg='${msg}';
          var $=layui.jquery;
          var form=layui.form;

          form.on('submit(demo)', function(data){

          });
      });
  </script>
  </body>
</html>