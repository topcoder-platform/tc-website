<%@ page contentType="text/html; charset=ISO-8859-1"
         autoFlush="false"
         buffer="64kb"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet"
         errorPage="../exc/InternalError.jsp" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sponsor a TopCoder Single Round Match</title>

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
                <jsp:param name="level2" value="srm_web"/> 
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
                        
                        <h2 class="corpHead">Email Distribution</h2>

                        <h3>Sample Match Results</h3>
                        
                    <p>To: TopCoder Membership<br/>
                    From: TopCoder<br/>
                    Date: 00.00.00<br/>
                    Subject Line: "Match Results"<br/><br/>
                    Hello Coders,<br/><br/>
                    Here are the winners from last night's match. Congratuluations to all. As always, results and a summary of events from the match are posted on <a href="http://www.topcoder.com">www.topcoder.com</a>.<br/><br/>
                    ====================================<br/>
                    Thanks to the following sponsor(s):<br/>
                    ====================================<br/>
                    .:: SPONSOR NAME<br/>
                    <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                    .:: SPONSOR NAME<br/>
                    <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                    .:: SPONSOR NAME<br/>
                    <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                    .:: SPONSOR NAME<br/>
                    <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                    ====================================<br/>
                    Division I:<br/>
                    ====================================<br/>
                    Room 00: [handle], points, earnings<br/>
                    Room 00: [handle], points, earnings<br/>
                    Room 00: [handle], points, earnings<br/><br/>
                    ====================================<br/>
                    Division II:<br/>
                    ====================================<br/>
                    Room 00: [handle], points, earnings<br/>
                    Room 00: [handle], points, earnings<br/>
                    Room 00: [handle], points, earnings<br/>
                    <a href="#" class="bodyText">More results and match summary</a><br/><br/>
                    Don't forget to try out the problems new <a href="#" class="bodyText">Practice Room!</a><br/><br/>
                    Best of luck in the next match!<br/>
                    Tom Longo<br/>
                    Vice President of Membership<br/>
                    TopCoder, Inc.<br/>

                        <p><br/></p>
                    </td>

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
        </td>
<!-- Center Column ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
