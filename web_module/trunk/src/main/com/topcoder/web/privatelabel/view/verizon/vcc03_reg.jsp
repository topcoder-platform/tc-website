<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Verizon Coding Challenge Powered by TopCoder</title>

<jsp:include page="../script.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/verizon.js"></script>

</head>

<body bgcolor="#FFFFFF" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0" class="background">

<table border="0" cellspacing="0" cellpadding="0" class="black"  width="100%">
   <tr>

 <!-- Verizon logo-->
        <td width="147" bgcolor="#000000" rowspan="2" valign="top"> <A href="http://www.verizon.com"> <img src="/i/events/verizon2003/logo_black_147.gif" width="147" height="140" border="0"/></A></td>

<!-- Top Nav-->
        <td class="black" width="588">
        <td class="black"><img alt="" src="/images/spacer.gif" width="1" height="41"></td>
    </tr>

<!-- Top Ad -->
    <tr>
      <td bgcolor="#CC0001" width="589" height="99" colspan="2" valign="top">
        <table border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td width="440" height="99" colspan=2 valign="top" align="right" background="/i/events/verizon2003/vcc03_logo.jpg">
		<img src="/i/events/verizon2003/banner_angle.gif" alt="" width="30" height="99"></td>
                <td width="146" height="99" valign="middle"><A href="http://www.topcoder.com"><img src="/i/events/verizon2003/pbtc2.gif" alt="Contest Powered by TopCoder" height="45" width="146" border="0"></A></td>
            </tr>
        </table>
      </td>
   </tr>

<!-- Top Bar -->
    <tr>
        <td width="147" class="black"><img src="/i/clear.gif" alt="" width="18" height="1"><br/></td>
        <td width="100%" class="black" colspan="2">
            <table border="0" cellpadding="0" cellspacing="0" width="600">
                <tr>
		<td width="15"><img src="/i/clear.gif" alt="" width="15" height="20"></td>
		<td width="221" style="padding-left:1px;"><img src="/i/clear.gif" height="2" width="178" border="0" alt=""><br/><a href="http://www22.verizon.com/progress/" onMouseOver="document.makeprogress.src='/i/events/verizon2003/make_progress_hmov.gif'; "onMouseOut="document.makeprogress.src='/i/events/verizon2003/make_progress_hm.gif';"><img src="/i/events/verizon2003/make_progress_hm.gif" border="0" width="178" height="17" alt="Make progress every day" name="makeprogress" id="makeprogress"></a></td>
		<td width="221" class="tableHead">&nbsp;</td>
		<td width="143"><img src="/i/clear.gif" alt="" width="143" height="20"></td>
                </tr>
            </table>
        </td>
    </tr>
</table>

<table width="740" border="0" cellspacing="0" cellpadding="0">
    <tr>

<!-- Left Column Begins -->
        <td valign="top" class="dkGrey" width="146">
            <table width="146" border="0" cellpadding="0" cellspacing="11" class="dkGrey">
                <tr>
                    <td width="124" class="white" align="center"><img src="/i/events/verizon2003/contestlinks.gif" width="124" height="19" border="0" alt="Contest Links">

                        <jsp:include page="verizonLinks.jsp" />

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

                        <p>Registration for the Verizon Coding Challenge opens at 7:00AM IST on Monday, October 27th.</p>

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