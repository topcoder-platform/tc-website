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

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

        <td valign="top" align="center" width="150"><img src="/i/events/google2003/Logo_50wht.gif" width="150" height="74" border="0"/></td>

         <td width="100%" align="center" colspan="3">
       
            <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/gecc_logo.gif" width="502" height="89" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width=15>&nbsp;</td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><b>Overview</b></font></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_sched"><font size=-1>Schedule</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview"><font size=-1>Rules</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_registration"><font size=-1>Register Now</font></a></td>
               <td width=15>&nbsp;</td>
            </tr>
            <tr>
               <td colspan=9 bgcolor=#3366cc><img width=1 height=1 alt=""></td>
            </tr>
         </table>

      </td>
   </tr>
   
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
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
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td class="bodyText" valign="top">
            <h2>Overview</h2>
            
            <p>The $25,000 Google/TopCoder Extreme Challenge is designed as a premiere online recruiting event for Google.  Google will 
            utilize the technology platform and expertise developed by TopCoder, Inc. for the exclusive purpose of objectively assessing 
            programming ability.</p>
            
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