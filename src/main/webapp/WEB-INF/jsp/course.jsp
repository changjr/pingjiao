<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>课程管理</title>
    <link type="text/css" rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
 <%--   <script  src="${ctx}/static/js/jquery.min.js"></script>--%>

</head>

<body>
<div class="select">
    <form action="${ctx}/course/select" method="post" >
        <div class="layui-form-item">
            <label class="layui-form-label">課程名稱</label>
            <div class="layui-input-inline">
                <input type="text" name="cname"  placeholder="請輸入課程名稱"  class="layui-input" value="${course.cname}">

            </div>
            <button type="submit" class="layui-btn layui-btn-normal">查询</button>
            <a href="${ctx}/course/selectById" class="layui-btn layui-btn-normal">新增</a>
        </div>
        <input type="hidden" id="count" name="count" value="${course.count}">
        <input type="hidden" id="pageSize" name="pageSize" value="${course.pageSize}">
        <input type="hidden" name="curr" id="curr" value="${course.curr}"/>

    </form>
    <table class="layui-table">
        <tr align="center" class="layui-bg-green">
            <td>課程编号</td>
            <td>課程名稱</td>
            <td align="center">操作</td>
        </tr>
        <c:forEach items="${courseList}" var="course" varStatus="stat">
            <tr align="center" class="main_trbg">
                <td>${course.cid}</td>
                <td>${course.cname}</td>
                <td>
                    <a href="${ctx}/course/selectById?courseId=${ course.cid }"class="layui-btn layui-btn-normal" >修改</a>
                    <a href="javascript:;" class="layui-btn layui-btn-normal delete"  courseId="${course.cid}">删除</a></td>
            </tr>
        </c:forEach>
    </table>
</div>
<div id="page1">

</div>
<script  src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>
    //Demo
    layui.use(['form','laydate','laypage'], function(){
        var form = layui.form;
        var laydate = layui.laydate;
        var $=layui.jquery;
        //加载jQuery
        $(".delete").click(function () {
            //找到playerid这个标签
            var courseId=$(this).attr("cid");
            //询问框
            layer.confirm('确定删除吗？', {
                btn: ['确定','取消'] //按钮
            }, function(){
                //用post来请求删除
                $.post("${ctx}/course/delete",{
                        courseId:courseId
                    },
                    //    回调到数据里面，检查是否删除
                    function (data) {
                        layer.alert(data.msg);
                        //与controller里面数值匹配，然后转到查询页面
                        if(data.msg=="删除成功！"){
                            window.location.href="${ctx}/course/select";
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
//限制字符个数
        $(".shuoming").each(function(){
            var maxwidth=36;
            if($(this).text().length>maxwidth){
                $(this).text($(this).text().substring(0,maxwidth));
                $(this).html($(this).html()+"...");
            }
        });
    });
</script>

</body>
</html>