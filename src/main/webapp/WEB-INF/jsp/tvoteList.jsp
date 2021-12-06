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
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/typo.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/portfolio.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/serv.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/nav.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css" media="all"/>
</head>
<body style="margin: 0 auto;">
<section class="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-5 nav-w3ls1">
                <div class="logo">
                    <a href="javascript:;" class="logo-w3ls"><h1>东方学院在线评教系统</h1></a>
                </div>
            </div>
            <div class="col-lg-7 col-md-7 col-sm-7 nav-w3ls2">
                <div class="main clearfix">
                    <nav id="menu" class="nav">
                        <ul>
                            <li class="active">
                                <a href="${ctx}/user/toindex">
                                    <span class="icon"><i aria-hidden="true" class="icon-home"></i></span>
                                    <span>评价结果</span>
                                </a>
                            </li>
                            <c:if test="${user==null}">
                                <li>
                                    <a href="${ctx}/user/toLogin">
                                        <span class="icon"><i aria-hidden="true" class="icon-portfolio"></i></span>
                                        <span>登陆</span>
                                    </a>
                                </li>
                                <li>
                                    <a href="${ctx}/user/toRegist">
                                        <span class="icon"><i aria-hidden="true" class="icon-team"></i></span>
                                        <span>注册</span>
                                    </a>
                                </li>
                            </c:if>

                            <c:if test="${user!=null}">
                                <li>
                                    <a href="#">
                                        <span class="icon"><i aria-hidden="true" class="icon-portfolio"></i></span>
                                        <span>${user.name}</span>
                                    </a>
                                </li>

                                <li>
                                    <a href="${ctx}/user/outLogin">
                                        <span class="icon"><i aria-hidden="true" class="icon-team"></i></span>
                                        <span>注销</span>
                                    </a>
                                </li>
                            </c:if>

                            <li>
                                <a href="#">
                                    <span class="icon"><i aria-hidden="true" class="icon-contact"></i></span>
                                    <span>关于我们</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</section>
<table width="100%" cellpadding="5" cellspacing="0" class="layui-table">
    <tr align="center" class="layui-bg-green">
        <td>年级</td>
        <td>老师</td>
        <td>课程名称</td>
        <td>介绍</td>
        <td>票数</td>
    </tr>
    <c:forEach items="${matchList}" var="match" varStatus="stat">
        <tr align="center">

            <td>${match.grade }</td>
            <td>${match.teacherName}</td>
            <td>${match.courseName }</td>
            <td>${match.matchInfo }</td>
            <td>${match.secondTicketCount }</td>
        </tr>
    </c:forEach>
</table>
<div id="demo7"></div>

</div>

<script src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>

    //Demo
    layui.use(['form', 'laydate', 'laypage'], function () {
        var form = layui.form;
        var laydate = layui.laydate;
        var $ = layui.jquery;
        //加载jQuery
        $(".delete").click(function () {
            //找到userid这个标签
            var battleId = $(this).attr("battleId");
            var matchId = $(this).attr("matchId");
            //询问框
            layer.confirm('确认投票？', {
                btn: ['确定', '取消'] //按钮
            }, function () {
                //用post来请求删除
                $.post("${ctx}/vote/vote", {
                        battleId: battleId,
                        matchId:matchId
                    },
                    //    回调到数据里面，检查是否删除
                    function (data,matchId) {
                        layer.alert(data.msg);
                        //与controller里面数值匹配，然后转到查询页面
                        if(data.flag == '2'){
                            window.location.href = "${ctx}/pk/listpk?matchId="+data.matchId;
                        }



                    }
                );
            }, function () {

            });
        });

        //分页实现
        var laypage = layui.laypage
            , layer = layui.layer;

//做无搜索下的分页实现
        var count = $("#count").val();
        var pageSize = $("#pageSize").val();
        var curr = $("#curr").val();
        laypage.render({
            elem: 'page1' //注意，这里的 test1 是 ID，不用加 # 号
            , count: count //数据总数，从服务端得到
            , limit: pageSize
            , curr: curr
            , layout: ['count', 'prev', 'page', 'next', 'limit', 'skip']
            , limits: [10, 15, 20, 25]
            , jump: function (obj, first) {
                //首次不执行
                if (!first) {
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