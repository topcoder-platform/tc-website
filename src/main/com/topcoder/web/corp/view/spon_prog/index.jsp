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

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="includes/top.jsp" >
  <jsp:param name="isSponsorPage" value="true"/>
</jsp:include>
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
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">The fastest growing online property attracting developers from around the world</h2>

                        <h3>Reaching the Developer Community</h3>
                        
                        <p>TopCoder has created an online venue that brings together some of the most talented developers 
                        from around the world. Each week, TopCoder hosts an online programming competition (Single Round 
                        Match) during which developers compete for ratings, bragging rights, and a major tournament invitation.</p>
                        
                        <h3>First of Its Kind</h3>
                        
                        <p>TopCoder competitions offer a venue previously unavailable to the programming world&#151;the ability
                        to conduct real-time competitions that are judged immediately and objectively. With TopCoder, technologists 
                        from around the world are able to compete online and in a short and concentrated period of time. Moreover,
                        with each of the weekly Single Round Matches (SRMs) lasting only 90 minutes, programmers don't have 
                        to sacrifice as much free time to compete and have the chance to compete more often.</p>
                        
                        <h3>Time Spent Per Week</h3>
                        
                        <p>Member use TopCoder not only to compete, but to prepare for competition as well. Members build 
                        their skills through the Practice Room feature of TopCoder's Arena Applet. TopCoder captures the attention 
                        of developers for signicant periods of time during the SRMs. For example, the average time spent in the 
                        Practice Room is 107 minutes. This is in addition to the average time spent (2.5 hours) by participants 
                        in a Single Round Match.</p>
                        
                        <h3>A Benefit to Both</h3>
                        
                        <p>Sponsors benefit from a branded, interactive and learning experience for programmers. TopCoder 
                        members benefit fromt he ability to compete in managed, professional matches and tournaments. This 
                        experience brings programmers and marketers together in a rich and inviting environment.</p>
                        
                        <h3>Sponsorship Programs</h3>
                        
                        <p>The goal of TopCoder's Sponsorship Program is to provide companies with an opportunity to educate, 
                        interact and brand themselves to the membership. This is accomplished by putting sponsoring companies 
                        in front of developers in the most applicable places and at the most visited times.</p>
                        
                        <p>Over the course of a week, sponsors are promoted as the "exclusive" SRM sponsor and highlighted 
                        throughout the TopCoder web site, the TopCoder Arena Applet, and email notification. In addition, sponsors 
                        are able to survey all participants during the match registration time. (Answering the survey is required 
                        to compete.) A landing page is set up for sponsors to promote their membership programs (such as a 
                        developer network), product offerings, demo downloads, and more.</p>
                        
                        <p>In all facets of the sponsorship program, companies are exclusively promoted to eliminate the noise 
                        and clutter of competing messages.</p>
                        
                    </td>
                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../includes/right.jsp">
                        <jsp:param name="level1" value="sponsor"/>
                        <jsp:param name="level2" value="srm_index"/> 
                    </jsp:include>
<!-- Right Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
