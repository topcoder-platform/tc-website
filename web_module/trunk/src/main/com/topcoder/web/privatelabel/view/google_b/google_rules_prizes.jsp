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
         <table  align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colpsn="9"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_overview"><font size=-1>Overview</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_sched"><font size=-1>Schedule</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><b>Rules</b></font></td>
               <td width=15>&nbsp;</td>
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_registration"><font size=-1>Register Now</font></a></td>
               <td width=15>&nbsp;</td>
            </tr>
         </table>

<jsp:include page="googleSublinks.jsp" >
   <jsp:param name="selectedList" value="rules"/>
   <jsp:param name="selectedTab" value="prizes"/>
</jsp:include>
       
            <h2>Prizes</h2>
            
            <p>All participants who compete in Round 1 will receive a Google Extreme Challenge t-shirt.  In addition, the 25 finalists 
            in the Championship Round will receive cash prizes.  Any and all applicable taxes on prizes are the sole responsibility of 
            the prizewinner.  Prizes will be distributed as follows:</p>
            
            <a name="sched"></a>
            <table width="500" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="50%">Competitiors</td>
                    <td class="sidebarTitle" width="50%" align="right">Prize</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Up to 500 competitors who compete in Round 1 </td>
                    <td class="sidebarText" align="right">Google Extreme Coding Challenge t-shirt</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">21 finalists not finishing with one of the top 4 scores* in the Championship Round</td>
                    <td class="sidebarText" align="right">$250 each</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">4th place finisher* in the Championship Round </td>
                    <td class="sidebarText" align="right">$1,250</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">3rd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$3,500</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">2nd place finisher* in the Championship Round</td>
                    <td class="sidebarText" align="right">$5,000</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText"><b>1st place finisher* - Tournament Champion</b></td>
                    <td class="sidebarText" align="right"><b>$10,000</b></td>
                </tr>

                <tr valign="top">
                    <td class="sidebarText" colspan="2">
                        *Prize will be awarded at the conclusion of the Championship Round.  Winner must be present at the onsite rounds to receive prize..
                    </td>
                </tr>
            </table><br />
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