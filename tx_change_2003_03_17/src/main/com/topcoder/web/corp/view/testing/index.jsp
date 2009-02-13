<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<link rel="stylesheet" type="text/css" href="/css/corpStyle.css">

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="sponsorship"/>
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%" colspan="3">
                        <h1 class="testHead">Targeted Sponsorship Program</h1>
                    </td>
                <tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <p><strong>The fastest growing online property attracting developers from around the world</strong></p>
                        
                        <p><strong>Reaching the Developer Community</strong><br>
                        TopCoder has created an online venue that brings together some of the most talented developers from around the world.</p>

                        <p>Each week, TopCoder hosts an online programming competition during which developers compete for 
                        ratings, bragging rights, and a major tournament invitation.</p>

                        <p><strong>First of Its Kind</strong><br>
                        TopCoder competitions offer a venue previously unavailable to the programming world&#151;the ability to conduct 
                        real-time competitions that are judged immediately and objectively.</p>

                        With TopCoder, technologists from around the world are able to compete online and in a short and concentrated period 
                        of time. Moreover, with each of the weekly Single Round Matches (SRMs) lasting only 90 minutes, programmers 
                        don't have to sacrifice as much free time to compete and have the chance to compete more often.</p>

                        <p><strong>Time Spent per Week</strong><br>
                        Members use TopCoder not only to compete, but to prepare for competition as well. Members will build their skills 
                        through the Practice Room feature of TopCoder's Arena Applet.</p>

                        <p>TopCoder captures the attention of developers for significant periods of time during the SRMs. Example&#151;the 
                        average time spent in the Practice Room is 107 minutes. This is in addition to the average time spent (2.5 hours) 
                        by participants in a Single Round Match.</p>

                        <p><strong>A Benefit to Both</strong><br>
                        Sponsors benefit from a branded, interactive and learning experience for programmers. TopCoder 
                        members benefit from the ability to compete in managed, professional matches and tournaments. 
                        This experience brings programmers and marketers together in a rich and inviting environment.</p>

                        <p><strong>Sponsorship Programs</strong><br>
                        The goal of TopCoder’s sponsorship program is to provide companies with an opportunity to educate, interact with 
                        and brand themselves to the membership.</p>

                        <p>This is accomplished by putting sponsoring companies in front of developers in the most applicable places and at the 
                        most visited times.</p>

                        <p>Over the course of a week, sponsors are promoted as the “exclusive” Single Round Match sponsor and highlighted 
                        throughout the web site, the TopCoder Arena Applet, and email notification. In addition, sponsors are able to 
                        survey all participants during the match registration time. (Answering the survey is required to compete.) A landing 
                        page is set up for sponsors to promote their membership programs (such as a developer network), product 
                        offerings, demo downloads, and more.</p>

                        <p>In all facets of the sponsorship program, companies are exclusively promoted to eliminate the noise and clutter of 
                        competing messages.</p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

                    <td width="244" align ="left">
                        <a href="<%=request.getContextPath()+"/Tx/?"+TransactionServlet.KEY_OPERATION+"="+TransactionServlet.OP_TERMS+"&back-to="+request.getAttribute(Constants.KEY_LINK_PREFIX)+"&prod-id=1"%>"><img src="/i/buy_now.gif" alt="Buy Now" width="192" height="52" border="0"></a>
                    </td>
                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
