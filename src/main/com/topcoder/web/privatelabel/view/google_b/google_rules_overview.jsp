<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Private Label Registration</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- TCO Header -->

        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/Logo_60gry.gif" width="176" height="77" border="0"/></td>

         <td width="100%" align="center" colspan="3">
            <object 
            type="application/x-shockwave-flash"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            data="/i/events/google2003/google.swf"
            width="100%"
            height="80"
            border="0">           
            <param name="movie" value="/i/events/google2003/google.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            <EMBED src="google.swf" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
            </object><br/>
      </td>
        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/events/google2003/pbtc_gray.gif" width="176" height="77" border="0"/></td>
   </tr>
   
   <tr>
      <td colspan="7" width ="100%" align="center">
            <object 
            type="application/x-shockwave-flash"
            data="/i/events/google2003/googletabs.swf"
            codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0"
            width="100%"
            height="150"
            border="0">           
            <param name="movie" value="/i/events/google2003/googletabs.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            <EMBED src="google.swf" TYPE="application/x-shockwave-flash" PLUGINSPAGE="http://www.macromedia.com/go/getflashplayer"></EMBED>
            </object><br/>
        </td>
     </tr>

<!-- Gutter Begins -->
   <tr>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">
            <img src="/i/clear.gif" width="500" height="1" border="0"/><br />

       
            <h2>Official Rules and Regulations</h2>
            
            <h3><font color="#CC0000">No purchase necessary to enter or win</font></h3>

           <p><span class="bodySubtitle">Overview of the Tournament</span><br />
            The 2003 Google Extreme Challenge is being offered by Google, Inc. ("Google") and TopCoder, Inc. ("TopCoder").  Google 
            is using the results of the Extreme Challenge to identify possible employees for their company.  The Extreme Challenge will 
            take place between Wednesday, October 1 and Friday, November 14, 2003.  It begins with a 2-week online registration, 
            after which all registered individuals will compete in a Qualification Round to determine who will compete in the 
            programming tournament.  The tournament consists of three (3) days of qualification, two (2) online elimination rounds 
            and one (1) onsite final round.  All participants who compete in Round 1 will receive a Google Extreme Challenge t-shirt.  
            In addition, Google will award $25,000 in cash prizes to the 25 finalists in the tournament.</p>

            <p><br /></p>
                        
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
        <td width="150" valign="top"><img src="/i/clear.gif" width="150" height="1" border="0"/></td>
<!--Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>