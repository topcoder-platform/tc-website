<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.TransactionServlet,
                 com.topcoder.shared.util.ApplicationServer"
         %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Sample Match Results - Opt-In Email - TopCoder Sponsorship Opportunities</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<table width="100%" border="0" cellpadding="10" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <img src="/i/corp/clear.gif" width="1" height="10" alt="" border="0"><br>
                        
                        <h2 class="corpHead">Opt-In Email</h2>

                        <p class="bodySubtitle">Sample Match Results</p>
                        
                        <tt>
                        <p>To: TopCoder Membership<br/>
                        From: TopCoder<br/>
                        Date: 00.00.00<br/>
                        Subject Line: "Match Results"</p>
                        
                        <p>Hello Coders,<br/><br/>
                        Here are the winners from last night's match. Congratuluations to all. As always, results and a summary of events from the match 
                        are posted on <a href="http://<%=ApplicationServer.SERVER_NAME%>">www.topcoder.com</a>.</p>
                        
                        <p>====================================<br/>
                        Thanks to the following sponsor(s):<br/>
                        ====================================<br/>
                        .:: SPONSOR NAME<br/>
                        <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        <a href="#" class="bodyText">http://www.sponsorcompany.com</a><br/><br/>
                        .:: SPONSOR NAME<br/>
                        <a href="#" class="bodyText">http://www.sponsorcompany.com</a></p>
                        
                        <p>====================================<br/>
                        Division I:<br/>
                        ====================================<br/>
                        Room 00: [handle], points, earnings<br/>
                        Room 00: [handle], points, earnings<br/>
                        Room 00: [handle], points, earnings</p>
                        
                        <p>====================================<br/>
                        Division II:<br/>
                        ====================================<br/>
                        Room 00: [handle], points, earnings<br/>
                        Room 00: [handle], points, earnings<br/>
                        Room 00: [handle], points, earnings<br/>
                        <a href="#" class="bodyText">More results and match summary</a></p>
                        
                        <p>Don't forget to try out the problems new <a href="#" class="bodyText">Practice Room!</a></p>
                        
                        <p>Best of luck in the next match!</p>
                        
                        <p>Tom Longo<br/>
                        Vice President of Membership<br/>
                        TopCoder, Inc.</p>
                        </tt>

                        <p><br/></p>
                    </td>
                </tr>
</table>

</body>
</html>
