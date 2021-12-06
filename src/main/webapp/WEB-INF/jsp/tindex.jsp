<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <script>
            if (${selectList == null}){
                window.location="${ctx}/user/toindex";
            }
    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- /css files -->
    <link href="${ctx}/static/css/bootstrap.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ctx}/static/css/font-awesome.min.css" rel="stylesheet" type="text/css" media="all" />
    <link href="${ctx}/static/css/typo.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/portfolio.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/serv.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/nav.css" rel="stylesheet" type="text/css" media="all"/>
    <link href="${ctx}/static/css/style.css" rel="stylesheet" type="text/css" media="all"/>

    <!-- js files -->
    <script src="${ctx}/static/js/modernizr.custom.js"></script>
    <!-- /js files -->
</head>
</head>
<body>


<!-- navigation -->
<section class="navigation">
    <div class="container">
        <div class="row">
            <div class="col-lg-5 col-md-5 col-sm-5 nav-w3ls1">
                <div class="logo">
                    <a  href="javascript:;" class="logo-w3ls"><h1>东方学院在线评教系统</h1></a>
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

<section class="service-w3ls">
    <h3 class="text-center w3layouts w3 w3l w3ls agileits-w3layouts agile w3-agile">投票活动&nbsp;</h3>

    <div class="container">
        <!-- Service Panels -->
        <div class="row" >

            <c:forEach items="${selectList}" var="match" varStatus="stat">
            <div class="col-lg-3 col-md-3 col-sm-6 serv-w3ls" >
                <div class="thumbnail" style="padding: 0px;height:400px;">
                    <div class="hi-icon-wrap hi-icon-effect-5 hi-icon-effect-5a">
                        <a href="${ctx}/pk/tlistpk?matchId=${match.matchId}">
                            <div style="width: 260px;height: 220px;background: pink;">
                            <img id="matchImage" src="${match.matchImage}" width="260" height="220">
                            </div>
                        </a>
                    </div>

                        <a href="${ctx}/pk/tlistpk?matchId=${match.matchId}" name="matchName">
                            <h4 class="text-center" style="margin-bottom: 10px;overflow: hidden">

                                    <tr id="data_${stat.index}" align="center" class="main_trbg" onMouseOver="move(this);" onMouseOut="out(this);">
                                        <tbody>
                                            <td>${match.matchName}</td>
                                        </tbody>
                                    </tr>

                            </h4></a>
                    <div style="width: 220px;height:80px;margin: 10px 20px;text-align: center;">
                        <div style="width: 60px;height: 60px; margin-right: 10px;float: left;">
                            <div style="width: 60px;height: 30px; line-height: 30px;">
                                ${match.voteNumber}
                            </div>
                            <div style="width: 60px;height: 30px;line-height: 30px;">
                                总票数
                            </div>
                        </div>

                        <div style="width: 60px;height: 60px; margin-right: 10px;float: left;">
                            <div style="width: 60px;height: 30px; line-height: 30px;">
                                6235
                            </div>
                            <div style="width: 60px;height: 30px;line-height: 30px;">
                                访问量
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            </c:forEach>


        </div>
    </div>
</section>
<a href="#0" class="cd-top">Top</a>
<!-- /back to top -->
<!-- js files -->
<script src="${ctx}/static/js/jquery.min.js"></script>
<script src="${ctx}/static/js/bootstrap.min.js"></script>
<script src="${ctx}/static/js/SmoothScroll.min.js">/script>
<!-- js for back to top -->
<script src="js/top.js"></script>
<!-- /js for back to top -->
<!-- js for navigation -->
<script>
    //  The function to change the class
    var changeClass = function (r,className1,className2) {
        var regex = new RegExp("(?:^|\\s+)" + className1 + "(?:\\s+|$)");
        if( regex.test(r.className) ) {
            r.className = r.className.replace(regex,' '+className2+' ');
        }
        else{
            r.className = r.className.replace(new RegExp("(?:^|\\s+)" + className2 + "(?:\\s+|$)"),' '+className1+' ');
        }
        return r.className;
    };

    //  Creating our button in JS for smaller screens
    var menuElements = document.getElementById('menu');
    menuElements.insertAdjacentHTML('afterBegin','<button type="button" id="menutoggle" class="navtoogle" aria-hidden="true"><i aria-hidden="true" class="icon-menu"> </i> Menu</button>');

    //  Toggle the class on click to show / hide the menu
    document.getElementById('menutoggle').onclick = function() {
        changeClass(this, 'navtoogle active', 'navtoogle');
    }

    document.onclick = function(e) {
        var mobileButton = document.getElementById('menutoggle'),
            buttonStyle =  mobileButton.currentStyle ? mobileButton.currentStyle.display : getComputedStyle(mobileButton, null).display;

        if(buttonStyle === 'block' && e.target !== mobileButton && new RegExp(' ' + 'active' + ' ').test(' ' + mobileButton.className + ' ')) {
            changeClass(mobileButton, 'navtoogle active', 'navtoogle');
        }
    }
</script>
<!-- /js for navigation -->
<!-- js for about section -->
<script src="${ctx}/static/js/slideshow.js"></script>
<!-- /js for about section -->
<!-- js for stats section -->
<script type="text/javascript" src="${ctx}/static/js/numscroller-1.0.js"></script>
<!-- /js for stats section -->
<script type="text/javascript">
    $(window).load(function() {
        $("#flexiselDemo1").flexisel({
            visibleItems: 4,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint:480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint:640,
                    visibleItems:2
                },
                tablet: {
                    changePoint:768,
                    visibleItems: 3
                }
            }
        });

    });
</script>
<script type="text/javascript" src="${ctx}/static/js/jquery.flexisel.js"></script>
<!-- /js files -->
</body>
</html>