<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
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
                <jsp:param name="level1" value="sponsorship"/>
                <jsp:param name="level2" value="tourny_index"/> 
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1" alt="" border="0"></td>
        <td valign="top" width="7"><img src="/i/title_brackets.gif" width="7" height="47" alt="[ ]" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top"><td id="corpTitle" width="100%" colspan="3"><img src="/i/header_event_sponsorship.gif" alt="" width="546" height="41" border="0"></td></tr>
                
                <tr valign="top">
                    <td class="bodyText" width="99%">
                        <img src="/i/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">Tournament - On-site Arena</h2>

                        <table cellpadding="10" cellspacing="0" border="0" align="right">
                        <tr><td><table border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                            <tr><td class="sidebarTitle">TOURNAMENT PACKAGE LINKS:</td></tr>
                            
                            <tr valign="top">
                                <td class="sidebarText">
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_index">Tournament Overview</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">Web site coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Applet coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_email">Email distribution</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_media">Media Coverage</a><br />
                                    <strong>On-site arena</strong><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public relations</a><br />
                                    <a href="/i/srm_3pgr.pdf">Download Overview (PDF)</a><br />
                                </td>
                            </tr>
                        </table></td></tr>
                        </table>
                        
                        <p>TopCoder's on-site arena is designed to give the competitors a degree of privacy while offering spectators 
                        viewing of coders and what they're coding.</p>
                        
                        <p>TopCoder has the following elements present for all on-site matches:</p>
                        
                        <ul>
                            <li>Co-branded on-site signage directing spectators to location</li>
                            <li>Co-branded information and collateral (TopCoder and Sponsor's) area</li>
                            <li>Co-branded kiosk in lobby with match, sponsor, and competitor information</li>
                            <li>50" Video Display - co-branded panels surrounding the live digital score board</li>
                            <li>Viewing Islands - 2 monitors per coder showing their efforts in real-time</li>
                            <li>Competitor stage - co-branded pillars</li>
                            <li>TopCoder Arena &#40;see image below&#41;</li>
                        </ul>
                        
                        <div align="center"><img src="/i/arena.gif" alt="" width="450" height="370" border="0"/></div>
                        
                        <p><a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">What is in an SRM Package?</a></p>

                        <p><br/></p>
                    </td>

<!-- Gutter Begins -->
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
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
