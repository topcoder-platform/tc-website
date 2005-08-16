<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>

<title>Verizon Coding Challenge Powered by TopCoder - Advancers</title>

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

                        <h2 class="pgTitle">Advancers</h2>

                        <table border="0" cellpadding="6" cellspacing="2" class="sidebarBox" align="center" width="400">
                            <tr>
                                <td class="sidebarTitle" colspan="2">Online Round 1</td>
                            </tr>
                            <tr>
                                <td class="sidebarTitle">Handle</td>
                                <td class="sidebarTitle">Score</td>
                            </tr>

<tr><td class="sidebarText" align="left" >nash</td><td class="sidebarText" align="right">1570.73</td></tr>
<tr><td class="sidebarText" align="left" >jkraju1</td><td class="sidebarText" align="right">1358.38</td></tr>
<tr><td class="sidebarText" align="left" >SaranKeer</td><td class="sidebarText" align="right">1299.77</td></tr>
<tr><td class="sidebarText" align="left" >intzerox84</td><td class="sidebarText" align="right">1202.24</td></tr>
<tr><td class="sidebarText" align="left" >chandru_krish</td><td class="sidebarText" align="right">822.26</td></tr>
<tr><td class="sidebarText" align="left" >extralogics</td><td class="sidebarText" align="right">565.00</td></tr>
<tr><td class="sidebarText" align="left" >rsathya</td><td class="sidebarText" align="right">526.80</td></tr>
<tr><td class="sidebarText" align="left" >tdhdeep1</td><td class="sidebarText" align="right">494.97</td></tr>
<tr><td class="sidebarText" align="left" >rohs</td><td class="sidebarText" align="right">494.13</td></tr>
<tr><td class="sidebarText" align="left" >solomon</td><td class="sidebarText" align="right">438.08</td></tr>
<tr><td class="sidebarText" align="left" >montu</td><td class="sidebarText" align="right">437.67</td></tr>
<tr><td class="sidebarText" align="left" >apprem</td><td class="sidebarText" align="right">407.08</td></tr>
<tr><td class="sidebarText" align="left" >aniaroon</td><td class="sidebarText" align="right">403.05</td></tr>
<tr><td class="sidebarText" align="left" >tsathish</td><td class="sidebarText" align="right">328.37</td></tr>
<tr><td class="sidebarText" align="left" >Andy_pondy</td><td class="sidebarText" align="right">274.74</td></tr>
<tr><td class="sidebarText" align="left" >GladiatorJ1</td><td class="sidebarText" align="right">269.38</td></tr>
<tr><td class="sidebarText" align="left" >rangarao1_pec</td><td class="sidebarText" align="right">268.25</td></tr>
<tr><td class="sidebarText" align="left" >satchand</td><td class="sidebarText" align="right">253.71</td></tr>
<tr><td class="sidebarText" align="left" >seshadripv</td><td class="sidebarText" align="right">215.88</td></tr>
<tr><td class="sidebarText" align="left" >Raas</td><td class="sidebarText" align="right">210.26</td></tr>
<tr><td class="sidebarText" align="left" >erodebass</td><td class="sidebarText" align="right">202.36</td></tr>
<tr><td class="sidebarText" align="left" >Akbar</td><td class="sidebarText" align="right">186.91</td></tr>
<tr><td class="sidebarText" align="left" >chandrakumarm</td><td class="sidebarText" align="right">180.49</td></tr>
<tr><td class="sidebarText" align="left" >premspace</td><td class="sidebarText" align="right">180.41</td></tr>
<tr><td class="sidebarText" align="left" >RAJIV_VIJAR</td><td class="sidebarText" align="right">179.47</td></tr>



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