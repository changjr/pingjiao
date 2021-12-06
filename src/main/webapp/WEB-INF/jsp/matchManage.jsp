<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%--日期的格式化--%>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>layui</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
</head>
<body>

<form class="layui-form" action="${ctx}/match/list" method="post">
    <input type="hidden" name="matchId" value="${match.matchId}">
<div class="layui-form-item">
        <label class="layui-form-label">活动名称</label>
        <div class="layui-input-inline">
            <input type="text" name="matchName" placeholder="请输入评教活动名称" autocomplete="off" class="layui-input" value="${match.matchName}">
        </div>
        <label class="layui-form-label">活动地址</label>
        <div class="layui-input-inline">
            <input type="text" name="matchAddress"  placeholder="请输入评教活动地址" autocomplete="off" class="layui-input" value="${match.matchAddress}">
        </div>

        <div class="layui-btn-group">
            <input class="layui-btn layui-btn-normal" value="查询" type="submit">
        </div>

        <div class="layui-btn-group">
            <a class="layui-btn layui-btn-normal" value="增加" href="${ctx}/match/form">增加</a>
        </div>

    </div>


</form>
<table class="layui-table">
    <colgroup>
        <col width="150">
        <col width="200">
        <col>
    </colgroup>
    <thead>
    <tr class="layui-bg-green">
        <th>评教活动名称</th>
        <th>评教活动地址</th>
        <th>评教日期</th>
        <th>评教活动说明</th>
        <th>评教宣传图片</th>
        <th>操作</th>
    </tr>
    </thead>

    <c:forEach items="${selectList}" var="match" varStatus="stat">
        <tr id="data_${stat.index}" align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
            <tbody>
            <tr>
                <td>${match.matchName}</td>
                <td>${match.matchAddress}</td>
                <td><input disabled style="border: 0 #fff none;background: rgba(0,0,0,0);" type="text" value="<fmt:formatDate value="${match.matchTime}" pattern="yyyy-MM-dd"/> "> </td>
                <td>${match.matchInfo}</td>
                <td><img src="${match.matchImage}" alt=""></td>
                <td>

                    <div class="layui-btn-group">

                        <a class="layui-btn layui-btn-normal" value="编辑" href="${ctx}/match/form?matchId=${match.matchId}">编辑</a>
                        <a class="layui-btn layui-btn-normal delete" href="javascript:;" matchId="${match.matchId}">删除</a>
                        <%--href="javascript:;"可以防止用户点击，matchId可以传到jQuery--%>
                    </div>
                </td>
            </tr>

            </tbody>
        </tr>
    </c:forEach>

</table>



<script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>

    //Demo
    layui.use(['form','laydate','laypage'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var $=layui.jquery;
        //加载jQuery
        $(".delete").click(function () {
            //找到matchId这个标签
            var matchId=$(this).attr("matchId");
            //询问框
            layer.confirm('确定删除吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                //用post来请求删除
                $.post("${ctx}/match/delete",{
                    matchId:matchId
                },
                //    回调到数据里面，检查是否删除
                function (data) {
                    layer.alert(data.msg);
                    //与controller里面数值匹配，然后转到查询页面
                    if(data.msg=="删除成功！"){
                      window.location.href="${ctx}/match/list";

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

        //总页数低于页码总数
        laypage.render({
            elem: 'demo0'
            ,count: 50 //数据总数
        });

        //总页数大于页码总数
        laypage.render({
            elem: 'demo1'
            ,count: 70 //数据总数
            ,jump: function(obj){
                console.log(obj)
            }
        });


        laypage.render({
            elem: 'demo7'
            ,count: 100
            ,layout: ['count', 'prev', 'page', 'next', 'limit', 'refresh', 'skip']
            ,jump: function(obj){
                console.log(obj)
            }
        });

    });
</script>
</body>
</html>