<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Computer Programming Tournament</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" >
    <jsp:param name="level1" value="sponsorship"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="conference"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">

                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>

                        <h1 class="testHead">Marketing through Conference Events</h1>

                        <p>TopCoder has the ability to customize a competition to help our clients reach their goals and
                        objectives.  We have executed hundreds of competitions and are uniquely qualified to handle the
                        necessary details to effectively carry out a successful competition including:</p>

                        <ul>
                            <li>TopCoder developing all aspects of each event including rules, regulations, eligibility, registration,
                            event website, competition manual, practice rooms, problem writing, testing and coordination.</li>

							<li>TopCoder providing support and administration during conference events for registration, practice rooms,
							competition arena, chat sessions, FAQs, and prize money administration.</li>

							<li>TopCoder marketing each event to our international member base of over 38,000 developers.</li>

							<li>TopCoder providing results verification and dissemination after each event, as well as completed
							software design documents, working components and code submissions.</li>

							<li>TopCoder providing flexible competition platforms such as algorithm, software component design,
							and software component development.</li>
                        </ul>

                        <p><img src="/i/corp/javaone_coding.jpg" width="200" height="187" alt="" border="0" align="right"><span class="bodySubtitle">Developer Events and Conferences</span><br>
                        Providing a developer competition will add to the excitement surrounding your developer event or
                        conference. Programming, by nature, is competitive and TopCoder events allow developers to compete
                        and be recognized. Online competition leading up to an event provides scale while the TopCoder Scoreboard
                        creates onsite excitement.</p>

                        <p><span class="bodySubtitle">Product Marketing</span><br>
                        Component software development competitions as well as algorithm competitions attract a targeted group of
                        influencers and decision makers. Through our conference events, we have the ability to integrate select
                        tools to be used in competition, allowing companies to showcase their tools in software design and
                        development processes.</p>

                        <p><span class="bodySubtitle">Our most recent Conference Events</span></p>

                        <table width="530" border="0" cellpadding="5" cellspacing="0" align="center">
                        	<tr>
                        		<td colspan="2" align="center"><a href="/pl/?module=Static&d1=javaone04&d2=javaone_overview" target="_blank"><img src="/i/corp/conevent_javaone04.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                        	<tr>
                        		<td align="center"><a href="/index?t=tournaments&c=javaone2003"><img src="/i/corp/conevent_javaone03.gif" width="182" height="88" alt="" border="0"></a></td>
                        		<td align="center"><a href="/index?t=tournaments&c=2002sunnetwork"><img src="/i/corp/conevent_sun.gif" width="182" height="88" alt="" border="0"></a></td>
                        	</tr>
                       </table>

                       <p>For more information, contact Paul Moriarty at <a href="mailto:sponsorships@topcoder.com?subject=Request For Information - Conference Events">sponsorships@topcoder.com</a> or 866.TOP.CODE</p>

                        <p><br/></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="/right.jsp">
                        <jsp:param name="level1" value="tourny"/>
                        <jsp:param name="level2" value="index"/>
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
