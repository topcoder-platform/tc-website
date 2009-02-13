<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder College Tour</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">

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

<div class="fixedWidthBody" style="padding-top:10px;">

 <%--

<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="college_tour"/>
    <jsp:param name="title" value="Overview"/>
</jsp:include>
--%>
 

        <div align=center>
           <img src="http://www.topcoder.com/images/collegetour/logo_china_tournament.jpg" />        </div>

<%-- college tour site subnav --%>
<jsp:include page="topMenu.jsp">
    <jsp:param name="active" value="algo_overview"/>
</jsp:include>

<%-- ends --%>


    <h2>2008 TopCoder China Tournament</h2>
   

    <br>

    <h3>The Event</h3>
    
    <p>TopCoder is sponsoring Round 
     		<c:choose>
                 <c:when test="${eid ==3413}">1B</c:when>
                 <c:when test="${eid ==3415}">1C</c:when>
                 <c:when test="${eid ==3417}">1D</c:when>
                 <c:when test="${eid ==3419}">1E</c:when>
                 <c:otherwise>1A</c:otherwise>
			</c:choose>
    
     of the 2008 TopCoder China Tournament online on <tc-webtag:format object="${roundStart}" format="EEEE MM.dd.yyyy" timeZone="${mainEvent.timeZone.description}"/>.</p>
	<p>
    <span class="bigRed">Registration for this event ends on <tc-webtag:format object="${event.registrationEnd}" format="EEEE MM.dd.yyyy hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>.</span><br>
    </p>
    <p>
    The event is from
    <tc-webtag:format object="${eventStart}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
    until
    <tc-webtag:format object="${eventEnd}" format="hh:mm a z" timeZone="${mainEvent.timeZone.description}"/>
	online. This event is being run in conjunction
    with
    <A href="http://www.topcoder.com/tc?module=Static&d1=introevent&d2=china08&d3=firstround">${contestName}    </A>.
    In addition to <A href="/reg/">registering with TopCoder</A>, all competitors must register
    <a href="/tc?module=IntroEventViewRegister&eid=${eid}">here</a>
    and compete in the competition.   </p>

    <h3>Advancement and Prizes</h3>
    <p>Up to 300 competitors will advance to Round 2 on Sunday, December 14, 2008 at 2:30 p.m. CST. <br>
          <br>
      <strong>Prizes for Round 2 will be:</strong><br>
      First Prize: iPod Nano<br>
      Second Prize: iPod Shuffle<br>
      Third Prize: MP3<br>
        </p>
    <p></p>
</div></td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
