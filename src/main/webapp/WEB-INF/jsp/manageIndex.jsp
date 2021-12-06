<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
</head>
<body class="layui-layout-body">
<div class="layui-layout layui-layout-admin">
    <div class="layui-header">
        <div class="layui-logo">评教系统后台管理</div>
        <!-- 头部区域（可配合layui已有的水平导航） -->

        <ul class="layui-nav layui-layout-right">
            <li class="layui-nav-item">
                <a href="javascript:;">
                    <img src="${ctx}/static/images/touxiang.png" class="layui-nav-img">
                    个人中心
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="">基本资料</a></dd>
                    <dd><a href="">安全设置</a></dd>
                </dl>
            </li>
            <li class="layui-nav-item"><a href="${ctx}/user/outLogin">退出登录</a></li>
        </ul>
    </div>

    <div class="layui-side layui-bg-black">
        <div class="layui-side-scroll">
            <!-- 左侧导航区域（可配合layui已有的垂直导航） -->
            <ul class="layui-nav layui-nav-tree"  lay-filter="test">
                <li class="layui-nav-item layui-nav-itemed">
                    <a class="" href="${ctx}/user/select" target="content">用户管理</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${ctx}/player/select" target="content">教师录入</a>
                </li>
                                <li class="layui-nav-item">
                                    <a href="${ctx}/course/select" target="content">课程管理</a>
                                </li>
                <li class="layui-nav-item">
                    <a href="${ctx}/match/list" target="content" >评教设置</a>
                </li>
                <li class="layui-nav-item">
                    <a href="${ctx}/Mpk/selectMatchPk" target="content">评教信息设置</a>
                </li>

            </ul>
        </div>
    </div>

    <div class="layui-body">
        <!-- 内容主体区域 -->
        <div style="padding: 15px;  width:100% ;height:100%" >
            <iframe name="content" frameborder="no" scrolling="no" width="100%" height="100%"></iframe>
        </div>
    </div>


</div>
<script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>
    //JavaScript代码区域
    layui.use(['element','layer'], function(){
        var element = layui.element;
        var layer=layui.layer;

    });
</script>
</body>
</html>