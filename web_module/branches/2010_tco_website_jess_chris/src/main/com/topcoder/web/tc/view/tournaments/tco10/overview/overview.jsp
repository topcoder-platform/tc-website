<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../includes/taglibs.jsp" %>

<tco10:pageSetup title="TCO 10 : Tournament Overview" area="overview" menu="happenings"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <jsp:include page="../includes/htmlhead.jsp"/>
</head>

<body>

<div id="wrapper" class="homepage"><!-- the outest whole website wrapper -->

<jsp:include page="../includes/logo.jsp"/>

<div id="content">
<div class="contentInner">

<jsp:include page="../includes/menu.jsp"/>

<div id="welcome">

    <div class="crossButton"><!-- right side button -->
        <div class="blog"><a href="javascript:;"></a></div>
        <div class="programe"><a href="javascript:;"></a></div>
        <div class="movie"><a href="javascript:;"></a></div>
        <div class="photo"><a href="javascript:;"></a></div>
    </div><!--End .crossButton-->

    <div class="welcomeText"><!-- left side text -->
        <h1 class="welcomeTitle">WELCOME TO THE 2010 TOPCODER OPEN!</h1>

        <p>The <span class="orange">2010 TopCoder Open</span> (TCO) is a world-wide programming and graphic design
            tournament that is open to all TopCoder members 18 and older, who are in good standing, and meet all other
            eligibility criteria. There are nine different tracks of competition as part of the TCO: Algorithm,
            Architecture, Assembly, Component Design &amp; Development, Marathon, Mod Dash, Specification, and Studio
            Design. Taking part in the TCO10 gives you the opportunity to showcase your programming and/or design skills
            up against some of the best in the world. We're also dishing out cash and prizes! Becoming a TopCoder member
            is easy and free. <a href="http://${requestScope.SERVER_NAME}/reg">Register here</a>. Have a question? Just email <a
                    href="mailto:service@topcoder.com">service@topcoder.com</a>. Stay tuned for more details as we finalize the
            preparations for this awesome event!</p>
    </div>
    <!--End .welcomeText-->

</div>
<!--End .welcome-->

<div id="mainbody" class="homeMainBody"><!-- below menu ,main content -->
    <span class="leftTop"></span><!-- main content left top corner -->
    <span class="rightTop"></span><!-- main content right top corner -->
    <span class="leftBottom"></span><!-- main content left bottom corner -->
    <span class="rightBottom"></span><!-- main conent right bottom corner -->

    <jsp:include page="subMenu.jsp"/>

    <div class="bigColumn">
        <div class="text">
            <%@ include file="../includes/comingSoon.jsp" %>
<%--
            <h2 class="pageTitle">Page Title</h2><!-- page title -->
            <p>Lorem ipsum dolor sit amet, <a href="javascript:;">consectetur</a> adipisicing elit, sed do eiusmod
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation
                ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in
                voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non
                proident, sunt in culpa qui officia deserunt mollit anim id est laborum.</p>

            <div class="subText">
                <h3 class="subTitle">Subtitle</h3><!-- sub title-->
                <p>Lorem ipsum dolor sit amet, <a href="javascript:;">consectetur</a> adipisicing elit, sed do eiusmod
                    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud
                    exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. <span
                            class="orange">FC7B6</span>, <span class="red">EE0000</span>, <span
                            class="yellow">DDCC00</span>, <span class="purple">6666FF</span>, <span
                            class="green">00A900</span>, <span class="gray">999999</span>, <span
                            class="write">FFFFFF</span>. Duis aute irure dolor in reprehenderit in voluptate velit esse
                    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in
                    culpa qui officia deserunt mollit anim id est laborum.</p>
            </div>
            <!--End .subText-->
            <p>Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Vivamus congue ante eu augue. Ut semper.
                Maecenas id magna. Aliquam eu nisi. Vivamus ac quam vel orci faucibus auctor. Maecenas odio eros, dictum
                a, varius vitae, placerat eget, mi. Ut sed eros ut urna tincidunt dictum. Quisque est enim, vestibulum
                eu, feugiat non, bibendum nec, est. Sed molestie, purus sed consectetuer congue, pede velit pharetra
                leo, nec accumsan mauris metus eget libero. Aliquam erat volutpat. Ut mattis, arcu sed gravida semper,
                purus lorem luctus quam, vel scelerisque arcu ipsum eget nisi. Phasellus molestie mauris eget nisi.
                Suspendisse feugiat suscipit odio. Aliquam erat volutpat. Cum sociis natoque penatibus et magnis dis
                parturient montes, nascetur ridiculus mus. Vivamus ut tellus quis ante cursus scelerisque. Integer
                commodo justo eget mauris.</p>
--%>
        </div>
        <!--End .text-->
<%--
        <table cellpadding="0" cellspacing="0" class="leaderboard"><!-- Start table list -->
            <tr>
                <th class="first"><span class="left"></span>Table Header</th>
                <!-- table left top corner -->
                <th class="last"><span class="right"></span>&nbsp;</th>
                <!-- table right top corner -->
            </tr>
            <tr>
                <td colspan="2">Table Row</td>
            </tr>
            <tr>
                <td colspan="2">Table Row</td>
            </tr>
            <tr>
                <td colspan="2">Table Row</td>
            </tr>
            <tr>
                <td colspan="2">Table Row</td>
            </tr>
            <tr>
                <td colspan="2">Table Row</td>
            </tr>
            <tr class="last">
                <td colspan="2">Table Row</td>
            </tr>
        </table>
--%>
    </div>

    <jsp:include page="../includes/sponsors.jsp"/>
    
    <div class="clear"></div>
</div>
<!--End .mainbody-->

</div>
<!--End .contentInner-->
</div>
<!--End .content-->

<jsp:include page="../includes/footer.jsp"/>

</div>
<!--End .wrapper-->

</body>
</html>
