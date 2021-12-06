<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>

	  <meta charset="UTF-8">
	  <title>注册</title>
	 
	  <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
  </head>
  <body>
  <div class="regist">

	  <div class="regist_main">

		  <div class="main_right">

			  <form action="${ctx}/user/updatesave" method="post" class="layui-form" >
				  <input type="hidden" name="userid" id="userid" value="${user.userid}">
				  <div class="layui-form-item" style="margin-top:50px;">
				    <label class="layui-form-label">账号</label>
				    <div class="layui-input-block">
				      <input type="text" name="account" value="${user.account}"required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
				    </div>    
				  </div>
				  
				  <div class="layui-form-item" >
				    <label class="layui-form-label">姓名</label>
				    <div class="layui-input-block">
				      <input type="text" name="name" value="${user.name}"required  lay-verify="required" placeholder="请输入账号" autocomplete="off" class="layui-input">
				    </div>    
				  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">性别</label>
				    <div class="layui-input-block">
				      <select name="sex" lay-verify="required">				     
				        <option value="男" ${user.sex=='男'?'selected':'' }>男</option>
				        <option value="女" ${user.sex=='女'?'selected':'' }>女</option>    
				      </select>
				    </div>
                  </div>
				   <div class="layui-form-item">
				    <label class="layui-form-label">电话号码</label>
				    <div class="layui-input-block">
				      <input type="text" name="telephone"value="${user.telephone}" name="telephone" required  lay-verify="required|phone" placeholder="请输入比赛地点" autocomplete="off" class="layui-input">
				    </div>    
				  </div> 
				  <div class="layui-form-item">
                  				    <label class="layui-form-label">身份</label>
                  				    <div class="layui-input-block">
                  				      <select name="scale" lay-verify="required">
                  				        <option value="0" ${user.scale=='0'?'selected':'' }>管理员</option>
                  				                <option value="1" ${user.scale=='1'?'selected':'' }>老师</option>
                  				                        <option value="2" ${user.scale=='2'?'selected':'' }>学生</option>

                  				      </select>
                  				    </div>
                                    </div>
                  <div class="layui-form-item">
                                    				    <label class="layui-form-label">年级</label>
                                    				    <div class="layui-input-block">
                                    				      <select name="grade" lay-verify="required">
 <option value="1" ${user.grade=='1'?'selected':'' }>大一</option>
  <option value="2" ${user.grade=='2'?'selected':'' }>大二</option>
   <option value="3" ${user.grade=='3'?'selected':'' }>大三</option>
    <option value="4" ${user.grade=='4'?'selected':'' }>大四</option>
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