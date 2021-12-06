<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	  <meta charset="UTF-8">
	  <title>查询页面</title>
	  <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
	  <%--<style>--%>
		  <%--body{width: 850px;margin:0 auto;}--%>
		  <%--form,table{width:800px;margin-left:50px;padding-left:30px;}--%>
		  <%--button{margin-left: 100px;}--%>
	  <%--</style>--%>
  </head>
  <body style="margin: 0 auto;">
  <form action="${ctx}/user/select" method="post"  style="margin-top: 30px;">
	  <div class="layui-form-item" style="float: left;">

		  <div class="layui-input-inline" style="margin-left: 60px;">
			  <input type="text" name="account" placeholder="账号"  class="layui-input" value="${user.account}">
		  </div>

		  <div class="layui-input-inline">
			  <input type="text" name="name" placeholder="姓名"  class="layui-input" value="${user.name}">
		  </div>
	  </div>
	  <input type="hidden" id="count" name="count" value="${user.count}">
	  <input type="hidden" id="pageSize" name="pageSize" value="${user.pageSize}">
	  <input type="hidden" name="curr" id="curr" value="${user.curr}"/>
	  <button class="layui-btn layui-btn-normal" style="margin-left: 20px;float: left;">查询</button>
  </form>
  <form method="post" action="${ctx}/user/select" style="width: 100%;height: 100%">
	  <a href="${ctx}/user/addUser" class="layui-btn layui-btn-normal" style="margin-left: 20px;">新增</a>
<%--	  <input type="submit" class="layui-btn layui-btn-normal" OnClick="return confirm('确认删除吗？')" value="删除">--%>

	  <table width="100%"  cellpadding="5" cellspacing="0" class="layui-table" >
		  <tr  align="center" class="layui-bg-green">
			  <td>选择</td>
			  <td>账号</td>
			  <td>姓名</td>
			  <td>电话号码</td>
			  <td>性别</td>
			  <td align="center">操作</td>

		  </tr>
		  <c:forEach items="${userList}" var="user" varStatus="stat">
			  <tr  align="center" >
				  <td><input type="checkbox" name="checkAll" id="checkAll" value="${user.userid}"></td>
				  <td>${user.account }</td>
				  <td>${user.name }</td>
				  <td>${user.telephone }</td>
				  <td>${user.sex}</td>
				  <td><a href="${ctx}/user/update?userid=${user.userid}">修改</a></td>
			  </tr>
		  </c:forEach>
	  </table>
	  <div id="page1">

	  </div>

  </form>
  <script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
  <script>

      //Demo
      layui.use(['form','laydate','laypage'], function(){
          var form = layui.form;
          var laydate = layui.laydate;
          var $=layui.jquery;
          //加载jQuery
          $(".delete").click(function () {
              //找到userid这个标签
              var userid=$(this).attr("userid");
              //询问框
              layer.confirm('确定删除吗？', {
                  btn: ['确定','取消'] //按钮
              }, function(){
                  //用post来请求删除
                  $.post("${ctx}/user/delete",{
                          userid:userid
                      },
                      //    回调到数据里面，检查是否删除
                      function (data) {
                          layer.alert(data.msg);
                          //与controller里面数值匹配，然后转到查询页面
                          if(data.msg=="删除成功！"){
                              window.location.href="${ctx}/user/userlist";

                          }
                          parent.layer.alert(data.msg);
                          //    利用父页面弹窗
                      }

                  );
              }, function(){

              });
          });

          //分页实现
          var laypage = layui.laypage
              ,layer = layui.layer;

//做无搜索下的分页实现
          var count=$("#count").val();
          var pageSize=$("#pageSize").val();
          var curr=$("#curr").val();
          laypage.render({
              elem: 'page1' //注意，这里的 test1 是 ID，不用加 # 号
              ,count: count //数据总数，从服务端得到
              ,limit:pageSize
              ,curr:curr
              ,layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
              ,limits:[10,15,20,25]
              ,jump: function(obj, first){
                  //首次不执行
                  if(!first){
                      $("#pageSize").val(obj.limit);
                      $("#curr").val(obj.curr);
                      $("form").submit();
                  }
              }
          });

      });

  </script>
  </body>
</html>