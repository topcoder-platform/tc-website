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
<SCRIPT type="text/javascript"> 
if ( window.navigator.userAgent.indexOf("Linux")>-1 ) { 
  // Linux Stylesheets 
  document.write('<link type="text/css" rel="stylesheet" href="/css/google_style_linux.css"/>'); 
} else { 
  // NonLinux Stylesheets 
  document.write('<link type="text/css" rel="stylesheet" href="/css/google_style.css"/>'); 
} 
</SCRIPT> 

</head>

<body>

<!-- TCO Header -->

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td valign="top" width="150">
            <img src="/i/clear.gif" width="150" height="10" border="0"/><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#AA1002" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
                  <td bgcolor="#AA1002">
                  <td class="bodyText" valign="top" align="center">
                  <a href="/"><img src="/i/events/google2003/pbtc_white.gif" width="150" height="50" border="0"/></a>
                  </td>
                  <td bgcolor="#AA1002">
               </tr>
               <tr><td bgcolor="#AA1002" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#3366CC" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
                  <td bgcolor="#3366CC">
                  <td class="bodyText" valign="top" align="center">
                  <p><br /></p>
                  <p><font color="#3366CC"><b>Important Dates</b></font></p>
                  <p><b>Registration Starts</b><br />
                  Wednesday, October 1st</p>
                  <p><b>Online Round 1</b><br />
                  Friday, October 24th</p>
                  <p><b>Onsite Championship Round</b><br />
                  Friday, November 14th</p>
                  <p><br /></p>
                  </td>
                  <td bgcolor="#3366CC">
               </tr>
               <tr><td bgcolor="#3366CC" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />

            <table border="0" width="100%" cellspacing="0" cellpadding="0">
               <tr><td bgcolor="#339966" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
               <tr>
               <td bgcolor="#339966">
               <td class="bodyText" align="center" valign="top">
               <p><br /></p>
               <p><font color="#339966"><b>Cash Prizes</b></font></p>
               <p>1st Place - $10,000<br />
               2nd Place - $5,000<br />
               3rd Place - $3,500<br />
               4th Place - $1,250</p>
               <p><br /></p>
               </td>
               <td bgcolor="#339966">
               </tr>
               <tr><td bgcolor="#339966" class="statText" width="100%" colspan="3"><img src="/i/clear.gif" width="150" height="1" border="0"/></td></tr>        
            </table><br />
     
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td width="100%" valign="top" class="bodyText">
       
         <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/google_logo_white.gif" width="300" height="150" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="9" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="9"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width="50%">&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_overview"><font size=-1>Overview</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_sched"><font size=-1>Schedule</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><img src="/i/events/google2003/rules_arrow_white.gif" width="15" height="10" border="0"/><b>Rules</b></font></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_registration"><font size=-1>Register Now</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan=9 bgcolor=#3366cc>
               <jsp:include page="googleSublinks.jsp" >
                  <jsp:param name="selectedList" value="rules"/>
                  <jsp:param name="selectedTab" value="overview"/>
               </jsp:include>
               </td>
            </tr>
         </table><br />


       
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