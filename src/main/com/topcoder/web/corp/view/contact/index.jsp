<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants"
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
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>

<!-- Left Column Begins -->
        <td width="170" valign="top" class="leftColumn">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="contact"/>
                <jsp:param name="level2" value="index"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/clear.gif" width="10" height="1"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" valign="top"><img src="/i/clear.gif" width="400" height="1" vspace="5" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bodyText" width="100%">
                        <h1 class="testHead">Contact Us</h1>
                        <p>TopCoder is dedicated to servicing members, partnering companies, the media and anyone else interested in what 
                        TopCoder is about. Please contact the appropriate individuals below for more information or assistance.</p>
                        
                        <p><strong>General questions and concerns</strong><br>
                        TopCoder, Inc.<br>
                        703 Hebron Avenue <br>
                        Glastonbury, CT 06033 USA<br>
                        phone: 860.633.5540 <br>
                        fax: 860.657.4276 <br>
                        email: <a href="mailto:service@topcoder.com">TopCoder General Inbox</a></p>

                        <p><strong><a href="mailto:mlydon@topcoder.com">NEED TECH SUPPORT?</a></strong><br><br></p>
                    </td>
                </tr>
            </table>

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td class="bodyText" width="49%">
                        <p><strong>Sponsorships and Private Label Events</strong><br>
                        Drew Vaughn, VP of Sales <br>
                        Corporate Office <br>
                        703 Hebron Avenue <br>
                        Glastonbury, CT 06033 <br>
                        phone: 860.633.5540 <br>
                        fax: 860.657.4276 <br>
                        email: <a href="mailto:dvaughn@topcoder.com">TopCoder Sponsorships</a></p>
                    </td>

                    <td class="bodyText" width="10"><img src="/i/clear.gif" width="10" height="1"></td>

                    <td class="bodyText" width="49%">
                        <p><strong>Recruiting and Candidate Testing</strong><br>
                        Paul Moriarty, Director of Employment Services <br>
                        Corporate Office <br>
                        703 Hebron Avenue 
                        Glastonbury, CT 06033<br> 
                        phone: 860.633.5540 <br>
                        fax: 860.657.4276 <br>
                        email: <a href="mailto:tces@topcoder.com">TopCoder Employment Services</a></p>
                    </td>
                </tr>
            </table>

            <p><br/></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
