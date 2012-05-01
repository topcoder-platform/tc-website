<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="center"><br><br>
                    <img src="/i/tournament/tchs10/tchs10-logo.png" alt="TopCoder High School" border="0">
                </div>
                <br />
                <div align="center">
                    <%--
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/tchs_spotlightbanner.jpg" alt="Spotlight Sessions" border="0"></a>
                    --%>                
              </div>
                <p align="center">
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=home">Overview</a>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSRules">Rules</a>&#160;&#160;|&#160;&#160;
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSSchedule">Schedule</a>&#160;&#160;|&#160;&#160;
                    Results
                </p>
                <p align="center"><br><br>
                <span class="title">Round 1 </span><br><a href="/tc?module=HSRoundOverview&rd=14224&snid=4&er=5">View Results</a><br><br>
				<span class="title">Round 2 </span><br><a href="/tc?module=HSRoundOverview&rd=14225&snid=4&er=5">View Results</a><br><br>
				<span class="title">Round 3 </span><br><a href="/tc?module=HSRoundOverview&rd=14229&snid=4&er=5">View Results</a><br><br>
				<span class="title">Championship Round </span><br><a href="/tc?module=HSRoundOverview ">View Results</a><br><br>
				<span class="title"><span style="color:#5c9741; font: 'Times New Roman', Times, serif"><a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22263204" target="_blank" class="coderTextRed">tourist</a> is the 2010 TopCoder High School Champion!</span></span></p>
                <p></p>
               </p>
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