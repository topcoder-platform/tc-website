<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>Verizon Coding Challenge Powered by TopCoder - Schedule</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" valign="top"><A href="http://www.verizon.com"><img src="/i/events/verizon2003/logo_black_147x41.gif" width="147" height="37" alt="Verizon" border="0"></A></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="440"><img src="/i/events/verizon2003/vcc03_logo_secondary.gif" width="440" height="37" alt="Verizon Coding Challenge" border="0"></td>
        <td class="red"><img alt="" src="/images/spacer.gif" width="1" height="37"></td>
        <td valign="top" class="black" width="99%"><A href="http://www.topcoder.com"><img src="/i/events/verizon2003/pbtc_secondary2.gif" width="134" height="37" alt="Contest Powered by TopCoder" border="0"></A></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td class="red" height="1" colspan="5"><img alt="" src="/images/spacer.gif" width="10" height="1"></td>
   </tr>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="146" class="white" align="center"><img src="/i/events/verizon2003/ps_banner.jpg" width="146" height="61" border="0" alt="Verizon Coding Challenge">

                        <jsp:include page="verizon_links_secondary.jsp" />

                    </td>
                </tr>
            </table>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column -->
        <td valign="top" width="579"><img src="/i/clear.gif" width="574" height="10" border="0"/><br />
            <table width="427" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td width="427" class="bodyCopy">

                        <h2 class="pgTitle">Schedule</h2>
            
<!-- Qualification Description begins -->
                        <p>Registration is unlimited, however only the first 500 eligible individuals to register and activate their registration will be invited to compete.</p>
<!-- Qualification Description Ends -->

                        <a name="sched"></a>
                        <table border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center">
                            <tr>
                                <td class="sidebarTitle">Round</td>
                                <td class="sidebarTitle">Date and Time - IST</td>
                                <td class="sidebarTitle" align="center"># of Participants</td>
                                <td class="sidebarTitle" align="center"># of Advancers</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Round #1</td>
                                <td class="sidebarText" nowrap="nowrap">
                                Friday, October 31st <br />
                                 REGISTER: 5:00 PM - 6:55 PM<br />
                                 COMPETE: 7:00 PM<br />
                                </td>
                                <td class="sidebarText" align="center">500</td>
                                <td class="sidebarText" align="center">250</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Round #2</td>
                                <td class="sidebarText" nowrap="nowrap">
                                    Monday, November 3rd<br />
                                    COMPETE: 7:00 PM<br />
                                </td>
                                <td class="sidebarText" align="center">250</td>
                                <td class="sidebarText" align="center">25</td>
                            </tr>

                            <tr valign="top">
                                <td class="sidebarText">Round #3 - Championship Round</td>
                                <td class="sidebarText" nowrap="nowrap">
                                    Friday, November 7th<br />
                                    COMPETE: 6:00 PM<br />
                                </td>
                                <td class="sidebarText" align="center">25</td>
                                <td class="sidebarText" align="center">4 Prize  Winners</td>
                            </tr>
            
                            <tr valign="top">
                                <td class="sidebarText" colspan="4">
                                    *NOTE: In the event a Round must be cancelled for any reason, the "raindate" will be the following day at the same time.
                                </td>
                            </tr>
                        </table>

                        <p><img src="/i/clear.gif" width="427" height="20" border="0"/></p>
                    </td>
                    
<!-- Gutter Begins -->
                    <td width="14"><img src="/i/clear.gif" width="14" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
    <jsp:include page="verizon_right.jsp" />
<!-- Right Column Ends -->

                </tr>
            </table>
        </td>
   </tr>
</table>

<!-- Footer Begins -->
    <jsp:include page="verizon_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>
