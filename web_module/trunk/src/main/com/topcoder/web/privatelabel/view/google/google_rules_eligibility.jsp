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
<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=no,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

</head>

<body>

<a name="top_page"></a>
<table  width="100%" border="0" cellspacing="0" cellpadding="0" class="bodyText">
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Header -->
         <td width="100%" valign="top" class="bodyText" colspan="3">
       
         <table  width="100%" align="center" border="0" cellspacing="0" cellpadding="0" class="bodyText">
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_logo_white.gif" width="300" height="150" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="10"></td></tr>
            <tr><td colspan="11" align="center"><img src="/i/events/google2003/google_tagline.gif" width="173" height="15" border="0"/></td></tr>
            <tr><td colspan="11"><img src="/i/clear.gif" width="10" height="20"></td></tr>

            <tr>
               <td width="50%">&nbsp;</td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_overview" style="text-decoration:none" ><font size="-1">Overview</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_sched" style="text-decoration:none" ><font size="-1">Schedule</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#3366cc" align="center" width=95 nowrap><font color="#ffffff" size="-1"><img src="/i/events/google2003/rules_arrow_white.gif" width="15" height="10" border="0"/><b>Rules</b></font></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_registration" style="text-decoration:none" ><font size="-1">Register Now</font></a></td>
<!--               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="?&<%=Constants.MODULE_KEY+"="+Constants.GOOGLE_REG_MAIN+"&"+Constants.COMPANY_ID+"=1865&"+Constants.EVENT_ID+"=1"%>" style="text-decoration:none"><font size="-1">Register Now</font></a></td>-->
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);" style="text-decoration:none"><font size="-1">Practice Arena</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor=#3366cc>
               <jsp:include page="googleSublinks.jsp" >
                  <jsp:param name="selectedList" value="rules"/>
                  <jsp:param name="selectedTab" value="eligibility"/>
               </jsp:include>
               </td>
            </tr>
         </table>
         </td>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

      </tr>
      <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins -->
        <td width="150" valign="top">      
            <img src="/i/clear.gif" width="150" height="10" border="0"/><br />
            <img src="/i/events/google2003/left.gif" width="150" height="450" border="0" usemap="#tchome"/>
            <map name="tchome"><area shape="rect" alt="TC" coords="1,1,149,49" href="/" /></map>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins-->
         <td width="100%" class="bodyText" valign="top">
            <img src="/i/clear.gif" width="10" height="10" border="0"/><br />            
            <h2>Eligibility</h2>
            
            <p>All citizens and lawful permanent residents of the following countries (and all non-immigrants currently 
            residing in the United States with a valid Visa) are eligible to win cash prizes after completing the appropriate 
            affidavit and tax form:</p>

            <ul>
            <li>Australia</li>
            <li>Canada (excluding Quebec)</li>
            <li>China</li>
            <li>India</li>
            <li>Ireland</li>
            <li>New Zealand</li>
            <li>Sweden</li>
            <li>United Kingdom</li>
            <li>United States (including the U.S. territories of Guam, Puerto Rico and the U.S. Virgin Islands)</li>
            </ul>

            <p>Participants who do not meet the citizenship requirements to win prize money are eligible to compete, 
            however will be required to donate any cash prizes to charity. Participants will choose a charity to receive their 
            winnings from the TopCoder approved list of charities. A prize-winning participant may request a new charity 
            for the list, however it shall remain in TopCoder's sole discretion to add that charity after reviewing the proposed 
            charity's credentials.</p>
            
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