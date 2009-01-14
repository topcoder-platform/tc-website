<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Studio :: Studio Cup</title>
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="studio_digitalrun"/>
    </jsp:include>
</head>

<body>
    <!-- wrapper -->
    <div id="wrapper">
        <!-- header -->
        <div id="header">
            <jsp:include page="../../top.jsp"/>
            <jsp:include page="../../topNav.jsp">
                <jsp:param name="node" value="digitalrun"/>
            </jsp:include>
        </div>
        <!-- container -->
        <div id="container">
            <!-- content -->
            <div id="content">
                <div class="contentTop">
                    <div class="contentMiddle">

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="home"/>
</jsp:include>

<p>
    Now is your chance to be the driving force in the growth of TopCoder Studio and reap the benefits in the form of monthly cash prizes in the Studio Cup, a division of <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=Static&d1=digital_run&d2=description">TopCoder's Digital Run (DR)</a>. The Studio Cup is tied directly to Studio's revenue, so the more you compete, the more contests we run and the more cash we pay out at the end of each month. 
</p>

<p>
    <strong>Overview</strong>
</p>

<p>
    Studio has a guaranteed prize pool of $5,000 paid out to the Studio Cup leaders each month. This pool will grow throughout the month with each contest launched and completed - so the more contests run, the more money will be paid out in the Studio Cup. 
</p>

<p>
    The Studio Cup's pool (and all TopCoder DR tracks) are funded with a percentage of revenue that is generated from the contests that you participate in. With the Studio Cup actually tied to Studio's revenue, the more the company grows, the more you can earn in the Studio Cup.
</p>

<p>
    <strong>How to Compete in the Studio Cup</strong>
</p>

<p>
    If you're an active competitor in Studio, you are already competing in the Studio Cup. Easy, right?
</p>


<p>
    <strong>How to Win</strong>
</p>

<p>
    Each Studio contest posted for a competition will carry placement points. Points will be awarded to competitors based on the number of submissions that pass screening and are ranked by the Client. The members with the highest point totals at the end of each month win big.
</p>

                        <br clear="all"/>
                    </div>                
                    <div class="contentBottom"></div>
                </div>
            </div>
        </div>

        <jsp:include page="../../foot.jsp"/>

    </div>
</body>
</html>