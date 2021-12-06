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

<%--<style>--%>
        <%--body{width: 1050px;margin:0 auto;}--%>
        <%--form,table{width:1050px;margin-left:50px;padding-left:30px;}--%>
        <%--button{margin-left: 100px;}--%>
        <%----%>
    <%--</style>--%>
<link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
  </head>
  <body style="margin: 0 auto;">
  <form action="${ctx}/Mpk/selectMatchPk" method="post"  class="layui-form" style="margin-top: 30px;">

	  <div class="layui-input-inline" >

		  <label class="layui-form-label">选手1</label>
		  <div class="layui-input-inline">
			  <select name="firstPlayerId" id="firstPlayerId" lay-verify="required">
				  <option></option>
				  <c:forEach items="${playerList}" var="player" varStatus="stat">
					  <option value="${player.playerName}">${player.playerName}</option>
				  </c:forEach>
			  </select>
		  </div>
	  </div>
		  <div class="layui-input-inline">
			  <label class="layui-form-label">比赛名称</label>
			  <div class="layui-input-inline">
				  <select name="matchId" id="matchId" lay-verify="required">
					  <option></option>
					  <c:forEach items="${matchList}" var="match" varStatus="stat">
						  <option value="${match.matchName}">${match.matchName}</option>
					  </c:forEach>
				  </select>
			  </div>
		  </div>
	  </div>
	  <button class="layui-btn layui-btn-normal" >查询</button>
	  <a href="${ctx}/Mpk/addMatchPk" class="layui-btn layui-btn-normal" style="margin-left: 20px;">新增</a>
  </form>
  
  <table width="100%"  cellpadding="5" cellspacing="0" class="layui-table layui-form" >
	  <tr  align="center" class="layui-bg-green">
		  <td>序号</td>
		  <td>比赛名称</td>
		  <td>歌手1姓名</td>
		  <td>歌曲名</td>
		  <td>得票数</td>
		  <td>歌手2姓名</td>
		  <td>歌曲名</td>
		  <td>得票数</td>
		  <td align="center">操作</td>

	  </tr>
	
	  <c:forEach items="${matchPkList}" var="matchPk" varStatus="stat">
		  <tr  align="center" >
			  <td>${matchPk.battleId}</td>
			  <td>${matchPk.matchName}</td>

			  <td>${matchPk.firstPlayerName }</td>
			  <td>${matchPk.firstSongName }</td>
			  <td>${matchPk.firstTicketCount }</td>

			  <td>${matchPk.secondPlayerName }</td>

			  <td>${matchPk.secondSongName}</td>
			  <td>${matchPk.secondTicketCount }</td>
			  <td>
				  <c:if test="${matchPk.battleFlag eq '0'}">
					  <a class="layui-btn layui-btn-normal open" href="${ctx}/pk/updateBattleFlag?battleId=${matchPk.battleId}&matchId=${matchPk.matchId}">开启</a>
				  </c:if>
				  <c:if test="${matchPk.battleFlag eq '1'}">
					  已开启
				  </c:if>
			   	<a class="layui-btn layui-btn-normal"
				   href="${ctx}/Mpk/updateMatchPk?battleId=${matchPk.battleId}">修改</a>
			  </td>
		  </tr>

	  </c:forEach>
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