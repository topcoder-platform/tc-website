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

<h1>Rules</h1>

<jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="design"/>
    <jsp:param name="tabLev2" value="rules"/>
</jsp:include>

Each contest posted in <a href="/">TopCoder Studio</a> will carry a point value. <a href="/?module=Static&amp;d1=digitalrun&amp;d2=2008v2&amp;d3=overview">Placement Points</a> will be awarded based on the number of submissions that pass screening and are ranked by the Client. By registering for any <a href="/">TopCoder Studio</a> competition, a competitor agrees to the items outlined on each project's Contest Details page, including the Eligibility requirements and the Terms of Work, and the completion of all paperwork required by TopCoder Studio. 
<br /><br />
TopCoder reserves the right, in its sole discretion, to revoke any and all privileges associated with competing in TopCoder Studio competitions, and to take any other action it deems appropriate, for no reason or any reason whatsoever, including if TopCoder suspects competitors of cheating, tampering with the entry process, the operation of the Web site or the contest process, or other violation of any rule. TopCoder reserves the right to cancel, terminate or modify this program if it is not capable of completion as planned for any reason, including infection by computer virus, bugs, tampering, unauthorized intervention or technical failures of any sort. TopCoder reserves the right, in its sole discretion, to change any aspects of the competitions and the Studio Cup, including but not limited to, these rules, the software methodology, the scorecard, the prize purse and the point distribution schedule, at any point during this program. TopCoder makes no guarantee as to the number of competitions that are open for competition in Topcoder Studio at any given time, nor does it make guarantees on the types of competitions held at TopCoder Studio at any given time.
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