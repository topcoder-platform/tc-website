<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="m_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>

<div align="center">
    <img src="/i/collegetour/logo_belarus_all_college.png" alt="" />
</div>

<p align="center">
    Overview | 
    <A href="/tc?module=Static&d1=collegetour&d2=multischool&d3=belarusInstructions">Instructions</A> | 
    <a href="/tc?module=CollegeTourViewReg&cteid=41">Registration</A> | 
    <a href="/tc?module=CollegeTourRegistrants&cteid=41">Registrants</A> | 
    <tc-webtag:forumLink forumID="514541" message="Discuss College Tour" />
</p>

    <h2>TopCoder College Tour Overview</h2>

    <p align="center"><span class="bigRed">NOTE: The schedule for this event has changed.  Check the new times below.</span></p>

    <h3>The Event</h3>
    TopCoder is sponsoring an onsite programming competition for all Belarus colleges
    on
    04.26.2007.
    <br><br>

    <strong>NOTE: Registration for this event now ends on 04.23.2007 at 11:59 PM EEST.</strong><br>

    <br>
    NOTE: The event is from
    03:00 PM EEST
    until
    05:30 PM EEST.
    In addition to <A href="/reg/">registering with TopCoder</A>, all competitors must register
    <a href="/tc?module=CollegeTourViewReg&cteid=41">here</a>
    and be onsite for the competition.
    After the event ends, pizza will be served and a TopCoder representative will be present to discuss
    TopCoder competitions and employment services.

    <br><br>

    <h3>Prizes</h3>

    <ul>
        
        <li>1st place prize - 4GB iPod Nano
        </li>
        
        
        <li>2nd place prize - 4GB USB Flash drive
        </li>
        
        
        <li>3rd place prize - Logitech MX 1000 mouse
        </li>
        
    </ul>

    All competitors will receive a TopCoder t-shirt. Placement in the event will be determined by the
    total number of points at the conclusion of the event. The competitor with the highest total positive
    (i.e., greater than zero) points will finish in 1st place. The overall winner will receive the 1st
    place prize, the 2nd place finisher will receive the 2nd place prize, and the 3rd place finisher
    will receive the 3rd place prize.

    <br><br>

	<h3>Belarus College Tour Schedule</h3>
<br>
	<b>April 25th<b>

<ul>
	<li>12:00 noon -1:00PM EEST - TopCoder Presentation at BSU</li>
	<li>03:30PM - 04:30PM - TopCoder Presentation at BSIUR</li>
</ul>

<br>

    <b>April 26th</b>
    <ul>
        <li>
            02:30 PM EEST
            - Computer lab opens &amp; competitors set up at BSU
        </li>
        <li>

            03:00 PM EEST
            - Competition starts
        </li>
        <li>
            05:30 PM EEST
            - Competition ends
        </li>
        <li>
            06:00 PM EEST
            - Pizza and socializing
        </li>
    </ul>

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>