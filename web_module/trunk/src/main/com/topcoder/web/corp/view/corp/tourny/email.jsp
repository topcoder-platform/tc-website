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
  <jsp:param name="isSponsorPage" value="true"/>
</jsp:include>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="tourny"/>
                <jsp:param name="level2" value="email"/> 
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
                        
                        <h2 class="corpHead">Tournament - Email Distribution</h2>

                        <table cellpadding="10" cellspacing="0" border="0" align="right">
                        <tr><td><table border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                            <tr><td class="sidebarTitle">TOURNAMENT PACKAGE LINKS:</td></tr>
                            
                            <tr valign="top">
                                <td class="sidebarText">
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournament Overview</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">Web site coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Applet coverage</a><br />
                                    <strong>Email distribution</strong><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_media">Media Coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_onsite">On-site arena</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public relations</a><br />
                                    <a href="/i/srm_3pgr.pdf">Download Overview (PDF)</a><br />
                                </td>
                            </tr>
                        </table></td></tr>
                        </table>
                        
                        <p>TopCoder's membership receives emails before and after each single round match. The emails are text formatted and contain 
                        the necessary information regarding the match date, time and registration time. TopCoder has an opt-in email policy regarding 
                        competition related information. To date, better than 80% of the membership opts-in for these emails.</p>
                        
                        <h3>Match Announcment</h3>
                        Sponsors are given space within the email for company name, forty words of copy and a desired URL. 
                        <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=email_annc">View sample</a></nobr></p>
                        
                        <h3>Match Results</h3>
                        Sponsors are given space within the email for company name and a desired URL. 
                        <nobr><a href="?module=Static&d1=corp&d2=spon_prog&d3=email_results">View sample</a></nobr></p>
                        
                        <p><strong>Note</strong> - TopCoder marketing will work with a sponsor's internal or external creative team to develop 
                        the desired copy points.</p>
                    
                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">What is in an SRM Package?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
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
