<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>查询页面</title>

<style>
        body{width: 1050px;margin:0 auto;}
        form,table{width:1050px;margin-left:50px;padding-left:30px;}
        button{margin-left: 100px;}
        
    </style>
<link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
  </head>
  <body style="margin: 0 auto;">
  <form action="${ctx}/Mpk/saveMatchPk" method="post"  class="layui-form" style="margin-top: 30px;">
         <div class="layui-form-item">
         		  <div class="layui-form-item">
         			<label class="layui-form-label">评教活动名称</label>
         				<div class="layui-input-block">
         				<select name="matchId" id="matchId" lay-verify="required">
         				    <option></option>
         				    <c:forEach items="${matchList}" var="match" varStatus="stat">
         	                	<option value="${match.matchId}">${match.matchName}</option>
         	            	</c:forEach>
         				</select>
         				</div>
         		  </div><br>
			<label class="layui-form-label">教师名称</label>
				<div class="layui-input-block">
				<select name="firstPlayerId" id="firstPlayerId" lay-verify="required">	
				    <option></option>
				    <c:forEach items="${playerList}" var="player" varStatus="stat">
	                	<option value="${player.playerId}">${player.playerName}</option>
	            	</c:forEach>			        
				</select>
				</div>
		  </div>

		   <div class="layui-form-item" >
			<label class="layui-form-label">课程名称</label>
				<div class="layui-input-block">
				<select name="secondPlayerId" id="secondPlayerId" lay-verify="required">
				    <option></option>
				    <c:forEach items="${courseList}" var="course" varStatus="stat">
	                	<option value="${course.cid}">${course.cname}</option>
	            	</c:forEach>			        
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
		 
				    <div class="layui-input-block" >
				      <button class="layui-btn" lay-submit="" lay-filter="demo1">提交</button>
						<a href="${ctx}/Mpk/selectMatchPk" class="layui-btn">返回</a>
				    </div>
  		  
  </form>
  

  </table>

  
  <script type="text/javascript" src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
  <script>
//Demo
  layui.use(['form', 'laydate'], function(){
	  var form = layui.form
	  ,layer = layui.layer
	  ,laydate = layui.laydate;
	  
	  //日期
	  laydate.render({
	    elem: '#date'
	  });
  //监听提交
  form.on('submit(formDemo)', function(data){
    layer.msg(JSON.stringify(data.field));
    return false;
  });
   
  });
</script>
 
  </body>

</html>