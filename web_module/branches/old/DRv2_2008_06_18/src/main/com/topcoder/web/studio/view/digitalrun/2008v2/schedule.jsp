<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Studio :: The Digital Run</title>
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

<h1>Schedule</h1>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="schedule"/>
</jsp:include>

The 2008 Studio Cup is six (6) months long, with points and prize pool money available for each month. The monthly schedule shown below includes competitions posted within the following date range: 
<br /><br />
July 1 - July 31, 2008
<br />August 1 - August 31, 2008
<br />September 1 - September 30, 2008
<br />October 1 - October 31, 2008
<br />November 1 - November 30, 2008
<br />December 1 - December 31, 2008
<br /><br />

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