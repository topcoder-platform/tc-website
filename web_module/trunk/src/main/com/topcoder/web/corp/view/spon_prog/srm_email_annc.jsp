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
<jsp:include page="../includes/top.jsp"/>
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
                        
                        <h2 class="corpHead">SRM - Email Distribution</h2>

                        <h3>Sample Match Announcment</h3>
                        
                        <p>To: TopCoder Membership<br/>
                        From: TopCoder<br/>
                        Date: 00.00.00<br/>
                        Subject Line: "Single Round Match"</p>
                        
                        <p>Hello Coders,</p>
                        
                        <p>The next Single Round Match will be held on {DATE GOES HERE}. As always, registration is open an hour and a half before the 
                        competition begins. Registration closes five minutes before competition.</p>
                        
                        ====================================<br/>
                        Next match is sponsored by:<br/>
                        ====================================<br/>
                        .:: SPONSOR NAME<br/>
                        For more information about our developer services or to take part in the dicussions join up with the ABC Developer Network. Members have access to product updates, releases, bug reports, and much more.<br/>
                        <a href="#" class="bodyText">http://www.sponsorname.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        For more information about our developer services or to take part in the dicussions join up with the ABC Developer Network. Members have access to product updates, releases, bug reports, and much more.<br/>
                        <a href="#" class="bodyText">http://www.sponsorname.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        For more information about our developer services or to take part in the dicussions join up with the ABC Developer Network. Members have access to product updates, releases, bug reports, and much more.<br/>
                        <a href="#" class="bodyText">http://www.sponsorname.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        For more information about our developer services or to take part in the dicussions join up with the ABC Developer Network. Members have access to product updates, releases, bug reports, and much more.<br/>
                        <a href="#" class="bodyText">http://www.sponsorname.com</a><br/><br/>
                        ====================================<br/>
                        Match Links:<br/>
                        ====================================<br/>
                        <a href="#" class="bodyText">Prizes Details</a><br/>
                        <a href="#" class="bodyText">Competition Format</a><br/>
                        <a href="#" class="bodyText">Eligibility</a><br/>
                        <a href="#" class="bodyText">Go directly to [TC] Arena Applet</a>
                        
                        <p>As always, you can compete in Java and/or C++. There will be TopCoder Administrators in the Lobby and available via AOL, MSN 
                        and Yahoo Instant Messaging under the screen name "TopCoder1."</p>
                        
                        <p>Best of luck to you in the Arena!<br/>
                        Tom Longo<br/>
                        Vice President of Membership<br/>
                        TopCoder, Inc.</p>

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
