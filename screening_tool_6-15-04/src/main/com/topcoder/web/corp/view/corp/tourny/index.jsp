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
                <jsp:param name="level2" value="index"/> 
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
                        
                        <h2 class="corpHead">Tournament Package</h2>

                        <table cellpadding="10" cellspacing="0" border="0" align="right">
                        <tr><td><table border="0" cellpadding="6" cellspacing="0" class="sidebarBox">
                            <tr><td class="sidebarTitle">TOURNAMENT PACKAGE LINKS:</td></tr>
                            
                            <tr valign="top">
                                <td class="sidebarText">
                                    <strong>Tournament Overview</strong><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">Web site coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Applet coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_email">Email distribution</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_media">Media Coverage</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_onsite">On-site arena</a><br />
                                    <a href="/?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public relations</a><br />
                                    <a href="/i/srm_3pgr.pdf">Download Overview (PDF)</a><br />
                                </td>
                            </tr>
                        </table></td></tr>
                        </table>
                        
                        <p>Currently, TopCoder conducts a Collegiate Challenge and an Invitational. These two events draw both competitors 
                        and spectators over a two-month period (avg.) to see who will win the championship and a $100,000 grand prize.</p>
                    
                        <p>In addition to all of the Single Round Matches that coders compete in to build their rating in order to get seeded for 
                        a tournament, the tournaments themselves are comprised of:</p>
                        
                        <ul>
                            <li>Regional Quarter-Finals - conducted online</li>
                            <li>Regional Finals - conducted online</li>
                            <li>Regional Championship - conducted online</li>
                            <li>Semifinals - conducted on-site</li>
                            <li>Championship - conducted on-site</li>
                        </ul>
                    
                        <p>A tournament sponsorship package includes:</p>
                        <ul>
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_web">Web Site</a><br/>
                            In addition to the areas covered by a Single Round Match sponsorship &#40;as the sole sponsor&#41;, 
                            the sponsor is also given the dedicated pages associated to a tournament which include the rules and 
                            regulations, schedule of rounds &#40;listed above&#41;, and a dedicated page as the tournament 
                            sponsor for product or services promotion.</li><br/>
                            
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_applet">Arena Applet & Survey</a><br/>
                            Sponsors are given sole promotion on all match related windows in the applet. Additionally, the sponsor 
                            is able to use all three of the online matches &#40;listed above&#41; for survey opportunities.</li><br/>
                            
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_email">Email Program</a><br/>
                            As with the <a href="?module=Static&d1=corp&d2=spon_prog&d3=srm_index">SRM Package</a>, emails
                            are distributed announcing match dates and results. The sponsor is given dedicated space in each email 
                            &#40;for minimal copy&#41; and an accompanying URL.</li><br/>
                            
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_mktg">Tournament Marketing</a><br/>
                            TopCoder conducts several programs before, during and after a tournament in order to bring the tournament 
                            to the attention of members, prospective members, media, and more. All of which are co-branded with the 
                            tournament sponsor.</li><br/>
                            
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_on-site">on-site Arena</a><br/>
                            The on-site arena offers several points of co-branding for a sponsor including physical displays/signage, 
                            space for a sponsor booth, and video promotion.</li><br/>
                            
                            <li><a href="?module=Static&d1=corp&d2=spon_prog&d3=tourny_pr">Public Relations</a><br/>
                            In addition to releases regarding the sponsorship itself, sponsors are promoted in all releases and alerts 
                            relevant to the Regional Quarter-Finals, Regional Finals, Regional Championship, Semifinals and of course 
                            the Championship. In addition, TopCoder conducts a Video News Release &#40;VNR&#41; program 
                            regarding the Regional Championship, Semifinals and Championship rounds.</li>
                        </ul>
                        
                        <p><br/></p>
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
