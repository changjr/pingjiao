<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	  <meta charset="UTF-8">
	  <title>注册</title>
	<style>
        body{width: 600px;margin:0 auto;}
        form{width:500px;margin:0 auto;}

       
        
    </style>
	  <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
  </head>
  <body>
 
			  
			  <form action="${ctx}/user/saveInsert" method="post" class="layui-form" >
				  <input type="hidden" name="userid" id="userid" value="${user.userid}">
				  <div class="layui-form-item" >
				    <label class="layui-form-label">账号</label>
				    <div class="layui-input-block">
				      <input type="text" name="account" required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
				    </div>    
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">密码</label>
				    <div class="layui-input-block">
				      <input type="password" name="password" required lay-verify="required" placeholder="请输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item">
				    <label class="layui-form-label">确认密码</label>
				    <div class="layui-input-block">
				      <input type="password" name="repassword"required lay-verify="required" placeholder="请再次输入密码" autocomplete="off" class="layui-input">
				    </div>
				  </div>
				  <div class="layui-form-item" >
				    <label class="layui-form-label">姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="name" required  lay-verify="required" placeholder="请输入姓名" autocomplete="off" class="layui-input">
				    </div>    
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">性别</label>
				    <div class="layui-input-block">
				      <select name="sex" lay-verify="required">				     
				        <option value="男" >男</option>
				        <option value="女">女</option>    
				      </select>
				    </div>
                  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">电话号码</label>
				    <div class="layui-input-block">
				      <input type="text" name="telephone" required  lay-verify="required|phone" placeholder="请输入电话号码" autocomplete="off" class="layui-input">
				    </div>    
				  </div>

				   <div class="layui-form-item">
				    <label class="layui-form-label">身份</label>
				    <div class="layui-input-block">
				      <select name="scale" lay-verify="required">
				      <option value="0" >管理员</option>
				        <option value="1" >老师</option>
				        <option value="2">学生</option>
				      </select>
				    </div>
                  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">所属年级</label>
				    <div class="layui-input-block">
				      <select name="grade" lay-verify="required">
				        <option value="1" >大一</option>
				        <option value="2" >大二</option>
				        <option value="3">大三</option>
				        <option value="4" >大四</option>
                      </select>
				    </div>
                  </div>
                  				  <div class="layui-form-item">
                  					  <div class="layui-input-block">
                  						  <input type="submit" class="layui-btn" lay-submit lay-filter="demo" value="提交">
                  						  <a href="${ctx}/user/select" class="layui-btn">返回</a>

                  					  </div>
                  				  </div>
			  </form>
		 


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