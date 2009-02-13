<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Sponsorship provides companies with an opportunity to educate, interact and brand themselves to the membership</title>

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
                <jsp:param name="level1" value="sponsorship"/>
                <jsp:param name="level2" value="overview"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/corp/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/corp/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">The fastest growing online property attracting developers from around the world</h2>

                        <p><span class="bodySubtitle">Reaching the Developer Community</span><br>
                        TopCoder has created an online venue that brings together some of the most talented developers 
                        from around the world. Each week, TopCoder hosts an online programming competition 
                        <a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">(Single Round Match)</a> during 
                        which developers compete for ratings, bragging rights, and a 
                        <a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">tournament</a> invitation.</p>
                        
                        <p><span class="bodySubtitle">First of Its Kind</span><br>
                        TopCoder competitions offer a venue previously unavailable to the programming world&#151;the ability
                        to conduct real-time competitions that are judged immediately and objectively. With TopCoder, technologists 
                        from around the world are able to compete online and in a short and concentrated period of time. Moreover,
                        with each of the weekly Single Round Matches (SRMs) lasting only 90 minutes, programmers don't have 
                        to sacrifice as much free time to compete and have the chance to compete more often.</p>
                        
                        <p><span class="bodySubtitle">Sponsorship Programs</span><br>
                        TopCoder's Sponsorship Program provides companies with an ability to educate, interact with, and brand 
                        themselves to the membership.  This is accomplished by putting sponsoring companies in front of developers 
                        in the most applicable places and at the most visited times.</p>

                        <p>TopCoder offers a unique opportunity to sponsor one or more of several diverse events that were designed 
                        to meet and exceed your marketing goals.  Choose to sponsor the event(s) that is right for you:</p>

                        <ul>
                            <span class="listSubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">Single Round Matches</a></span><br>
                            <li>Weekly online event</li>
                            <li>Sponsors promoted on TC website, arena applet and opt-in email</li>
                            <li>Captures attention of developers for 2&#189; - 3 hours at one time</li>
                        </ul>
 
                        <ul>
                            <span class="listSubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournaments</a></span><br>
                            <li>Held biannually</li>
                            <li>Title, Corporate and Associate Sponsorships are available</li>
                            <li>Online and onsite over an eight-week period</li>
                            <li>Sponsors promoted on TC website, arena applet, opt-in email, and onsite</li>
                            <li>Extensive PR</li>
                        </ul>
 
                        <ul>
                            <span class="listSubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=pbtc_index">Powered by TopCoder&#8482; Competitions</a></span><br>
                            <li>For designated developers (conference attendees, employees, etc.)</li>
                            <li>Online and/or onsite</li>
                        </ul>
 
                        <ul>
                            <span class="listSubtitle"><a href="?module=Static&d1=corp&d2=spon_prog&d3=private_index">Private Label Competitions</a></span><br>
                            <li>Customized for your business needs</li>
                            <li>Internal within your organization</li>
                        </ul>

                        <p><span class="bodySubtitle">The TopCoder Advantage</span><br>
                        TopCoder offers sponsorships to marketers trying to reach a powerful community of technologists. This 
                        highly sought after demographic influences technology buying decisions for thousands of companies. They 
                        dictate the future direction of technology and manage thousands of people.</p>
                        
                        <p><br></p>
                    </td>

<!-- Gutter -->
                    <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column begins -->
                    <jsp:include page="../../right.jsp">
                        <jsp:param name="level1" value="sponsor"/>
                        <jsp:param name="level2" value="srm_index"/> 
                    </jsp:include>
<!-- Right Column ends -->

                </tr>
            </table>
        </td>
<!-- Center Column ends -->

    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
