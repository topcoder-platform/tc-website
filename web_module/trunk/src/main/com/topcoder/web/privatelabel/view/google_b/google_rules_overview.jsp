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

<!-- TCO Header -->
<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>
         <td width="100%" align="center" colspan="7">
            <object 
            type="application/x-shockwave-flash"
            data="/i/events/google2003/google.swf"
            width="100%"
            height="280"
            border="0">           
            <param name="movie" value="/i/events/google2003/google.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object><br/>
      </td>
   </tr>
   

<!-- Gutter Begins -->
   <tr>
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins
         <td valign="top" width="150">
            <table border="0" width="100%" cellspacing="0" cellpadding="3">
               <tr><td valign="middle" bgcolor="#3366CC" class="statText" width="100%"><font size="3"><strong>Important Dates</strong></font></td></tr>        
               <tr>
                  <td class="bodyText">
                  <p><b>Registration Starts</b><br />
                  Wednesday, October 1st</p>
                  <p><b>Online Round 1</b><br />
                  Friday, October 24th</p>
                  <p><b>Onsite Championship Round</b><br />
                  Friday, November 14th</p></td>
               </tr>
            </table><br />
            <table border="0" width="100%" cellspacing="0" cellpadding="3">
               <tr><td valign="middle" bgcolor="#3366CC" class="statText" width="100%" colspan="2"><font size="3"><strong>Cash Prizes</strong></font></td></tr>        
               </tr>
               <tr><td class="bodyText">1st Place<br />
               2nd Place<br />
               3rd Place<br />
               4th Place</td>
               <td class="bodyText" align="right">$10,000<br />
               $5,000<br />
               $3,500<br />
               $1,250<br />
               <p><br /></p></td></tr>
            </table><br />
     
         </td>         
Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">

       
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
    </tr>
</table>

<!-- Footer Begins -->
<jsp:include page="google_foot.jsp" />
<!-- Footer Ends -->

</body>
</html>