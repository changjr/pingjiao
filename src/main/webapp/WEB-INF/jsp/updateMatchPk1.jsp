<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta charset="UTF-8">
    <title>添加比赛</title>

    <link rel="stylesheet" href="${ctx}/static/layui-v2.3.0/layui/css/layui.css">
</head>
<body>
<form class="layui-form" action="${ctx}/Mpk/saveuMatchPk" method="post">
    <input type="hidden" name="battleId" id="battleId" value="${matchPk.battleId}">
    <div class="layui-form-item">
        <label class="layui-form-label">评教活动名称</label>
        <div class="layui-input-inline">
            <select name="matchId" id="matchId" lay-verify="required">
                <c:forEach items="${matchList}" var="match" varStatus="stat">
                    <c:choose>
                        <c:when test="${match.matchId==matchPk.matchId}">
                            <option value="${match.matchId}" selected>${match.matchName}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${match.matchId}">${match.matchName}</option>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </select>
        </div>
    </div>

    <div class="layui-form-item">
        <label class="layui-form-label">教师名称</label>
        <div class="layui-input-inline">
            <select name="firstPlayerId" id="firstPlayerId">
                <c:forEach items="${playerList}" var="player" varStatus="stat">
                    <c:choose>
                        <c:when test="${player.playerId==matchPk.firstPlayerId}">
                            <option value="${player.playerId}" selected>${player.playerName}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${player.playerId}">${player.playerName}</option>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">课程</label>
        <div class="layui-input-inline">
            <select name="secondPlayerId" id="secondPlayerId">
                <c:forEach items="${courseList}" var="course" varStatus="stat">
                    <c:choose>
                        <c:when test="${course.cid==matchPk.secondPlayerId}">
                            <option value="${course.cid}" selected>${course.cname}</option>
                        </c:when>
                        <c:otherwise>
                            <option value="${course.cid}">${course.cname}</option>
                        </c:otherwise>
                    </c:choose>

                </c:forEach>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <label class="layui-form-label">年级</label>
        <div class="layui-input-block">
            <select name="grade" lay-verify="required">
                <option value="1" ${matchPk.grade=='1'?'selected':'' }>大一</option>
                <option value="2" ${matchPk.grade=='2'?'selected':'' }>大二</option>
                <option value="3" ${matchPk.grade=='3'?'selected':'' }>大三</option>
                <option value="4" ${matchPk.grade=='4'?'selected':'' }>大四</option>
            </select>
        </div>
    </div>


    <div class="layui-form-item">
        <div class="layui-input-block">
            <input type="submit" class="layui-btn" value="提交">
            <a href="${ctx}/Mpk/selectMatchPk" class="layui-btn">返回</a>

        </div>
    </div>
</form>
<script type="text/javascript" src="${ctx}/static/layui-v2.3.0/layui/layui.js"></script>
<script>
    //Demo
    layui.use(['form', 'laydate'], function () {
        var form = layui.form
            , layer = layui.layer
            , laydate = layui.laydate;

        //日期
        laydate.render({
            elem: '#date'
        });
        //监听提交
        form.on('submit(formDemo)', function (data) {
            layer.msg(JSON.stringify(data.field));
            return false;
        });

    });
</script>

</body>
</html>