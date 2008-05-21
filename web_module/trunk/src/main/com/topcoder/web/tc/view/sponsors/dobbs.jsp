<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="development"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
            
            <h1>Dr. Dobb's Architecture and Design World</h1>
            <br />
            <div align="center"><img src="/i/sponsor/drDobbsPoster.png" border="0px" alt="Dr. Dobb's Architecture &amp; Design World" /></div>
            <br />
            <p>Welcome to Dr. Dobb's Architecture and Design World software architecture contest!  Here you can register for the competition, as well as learn more about architecture competitions.  Check out <a href="/wiki/display/docs/DDADW+Problem+Statement">the problem statement</a>.</p>
            <p>The winner of the competition will receive a free All Access pass to an upcoming Dr. Dobb's event!</p>
            <ol>
                <li>Read the <strong><a href="/wiki/display/training/Architecture+Deliverable+Module">Training Material</a></strong> to learn about the deliverables involved.</li>
                <li>Read the Dr. Dobb's <strong><a href="/wiki/display/~mess/Dr.+Dobb%27s+Rules">Rules and Regulations</a></strong></li>
                <li><strong><a href="/reg/">Register</a></strong> to become a TopCoder member (required to register for the contest)</li>
                <li><strong><a href="/tc?module=ViewRegistration&amp;pj=30004440">Register for the competition!</a></strong></li>
            </ol>
            <br /><br />

            </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>