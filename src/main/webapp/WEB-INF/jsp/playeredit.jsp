<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>选手信息</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">

</head>
<body>

<form action="${ctx}/player/save" method="post"class="layui-form" enctype="multipart/form-data">
    <input type="hidden" name="playerId" value="${player.playerId}">
    <div class="layui-form-item">
        <label class="layui-form-label">教师编号</label>
        <div class="layui-input-inline">
            <input type="text" name="playerNo" value="${player.playerNo}"  lay-verify="required" placeholder="请输入编号"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
        <label class="layui-form-label">教师名称</label>
        <div class="layui-input-inline">
            <input type="text" name="playerName" value="${player.playerName}"  lay-verify="required" placeholder="请输入姓名"  class="layui-input">
        </div>
    </div>
    <div class="layui-form-item">
    <label class="layui-form-label">选手照片</label>
    <td>
        <input type="file" name="upfile"/>

    </td>
    <td>
        <img id="playerImage" src="${player.playerImage}" width="100" height="100"/>
    </td>

</div>

    <div class="layui-form-item">
        <label class="layui-form-label">选手描述</label>

        <td>
            <input type="text" id="playerInfo" value="${player.playerInfo}" name="playerInfo" style="width: 200px;height: 25px;" >
        </td>
    </div>
    <div class="layui-form-item">
        <div class="layui-input-block">
            <%--<a href="${ctx}/player/select"class="layui-btn" lay-submit lay-filter="formDemo">保存</a>--%>
            <button class="layui-btn" lay-submit lay-filter="formDemo">保存</button>
            <a href="${ctx}/player/select" class="layui-btn layui-btn-primary">返回</a>
        </div>
    </div>
</form>
<script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>

    layui.use('form', function(){
        var form = layui.form;

        form.on('submit(formDemo)', function(data){
            layer.msg(JSON.stringify(data.field));

        });
    });
</script>
</body>
</html>