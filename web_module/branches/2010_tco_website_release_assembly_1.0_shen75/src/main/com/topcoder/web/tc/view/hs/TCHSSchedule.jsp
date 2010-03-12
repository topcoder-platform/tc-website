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
                    Schedule&#160;&#160;|&#160;&#160;
                  <a href="/tc?module=Static&amp;d1=hs&amp;d2=TCHSResults">Results</a>
                </p>
                <br />
                <span class="title">TopCoder High School Schedule</span>
                    
                    <p>Registration is not required for the 2010 TopCoder High School Tournament.  All eligible competitors must be registered TopCoder members prior to the start of the first round.</p>
              <p><span class="bodySubtitle">Competition  Schedule</span><br />

        <table cellpadding="0" cellspacing="0" class="stat" width="100%" align="center">
            <tbody>
                <tr>
                    <td class="title" colspan="4">Schedule</td>
                </tr>
                <tr>
                    <td class="header">Round of Competition</td>
                    <td class="header C">Date and Time</td>
                    <td class="header R"># of Competitors</td>
                    <td class="header R"># of Advancers</td>
                </tr>
                <tr class="light">
                    <td class="value">Online Round 1</td>
                    <td class="value C">Saturday, February 27, 2010<br />
                    Register: 09:00-11:55 UTC -5<br>
                    START: 12:00 UTC -5</td>
                    <td class="value R"><span class="value C">All eligible competitors</span></td>
                    <td class="R value"><strong>500</strong></td>
              </tr>
               <tr class="dark">
                    <td class="value">Online Round 2</td>
                    <td class="value C">Saturday, March 6, 2010<br />
Register: 09:00-11:55 UTC -5<br>
START: 12:00 UTC -5</td>
    <td class="value R">500<span class="value C"></span></td>
              <td class="R value"><strong>250</strong></td>
              </tr>
                <tr class="light">
                    <td class="value">Online Round 3</td>
                    <td class="value C">Saturday, March 13, 2010<br />
Register: 09:00-11:55 UTC -5<br>
START: 12:00 UTC -5</td>
              <td class="value R"><span class="value C">Up to 250</span></td>
              <td class="R value"><strong>100</strong></td>
              </tr>
               <tr class="dark">
                    <td class="value">Online Championship Round</td>
                    <td class="value C">Saturday, March 20, 2010<br />
Register: 09:00-11:55 UTC -4<br>
START: 12:00 UTC -4</td>
              <td class="value R">Up to 100</td>
              <td class="value R">&nbsp;</td>
              </tr>
               <tr class="dark">
                 <td colspan="4" class="value"><p>*All times are listed as Eastern  Time and noted as UTC -5 or UTC -4<br>
                   <a href="http://timeanddate.com/worldclock/" target="_blank">Find times in your time zone.</a></p>
           	     <p><strong>In the event that a round must be cancelled for any reason, the round will take place the following day at the same time.</strong></p></td>
               </tr>
            </tbody>
        </table>
        
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