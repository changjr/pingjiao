<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="${ctx}/match/save" method="post" ENCTYPE="multipart/form-data">
    <%--ENCTYPE="multipart/form-data"文件上传的格式--%>
    <input type="hidden" name="matchId" value="${match.matchId}">
    <div class="layui-form-item">
        <label class="layui-form-label">比赛名称</label>
        <div class="layui-input-inline">
            <input type="text" name="matchName" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${match.matchName}">
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">比赛地址</label>
        <div class="layui-input-inline">
            <input type="text" name="matchAddress" required  lay-verify="required" placeholder="请输入标题" autocomplete="off" class="layui-input" value="${match.matchAddress}">
        </div>
    </div>

    <div class="layui-form">
        <div class="layui-inline">
            <label class="layui-form-label">比赛时间</label>
            <div class="layui-input-inline">
                <input type="text" class="layui-input" name="matchTime" id="test5" placeholder="yyyy-MM-dd" value="<fmt:formatDate value="${match.matchTime}" pattern="yyyy-MM-dd" /> ">
            </div>
        </div>
    </div>
        <br>


    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">比赛说明</label>
        <div class="layui-input-inline">
            <%--下面这个标签直接用${match.matchInfo}--%>
            <textarea name="matchInfo" placeholder="请输入内容" class="layui-textarea" style="width: 300px;height: 80px">${match.matchInfo}</textarea>
        </div>
    </div>

    <div class="layui-form-item layui-form-text">
        <label class="layui-form-label">比赛照片</label>
        <div class="layui-form-item">

            <td>
                <input type="file" name="upfile"/>
                <img id="matchImage"src="${match.matchImage}" width="100" height="100"/>
            </td>
        </div>
    </div>



    <div class="layui-form-item">
        <div class="layui-input-block">
            <input class="layui-btn" type="submit" value="提交" >
            <button type="reset" class="layui-btn layui-btn-primary">重置</button>
        </div>
    </div>
</form>

<script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>

    //Demo
    layui.use(['form','laydate','upload'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        //日期时间选择器
        laydate.render({
            elem: '#test5'
            ,type: 'date'
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