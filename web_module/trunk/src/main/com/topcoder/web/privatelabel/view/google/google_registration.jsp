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

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- TCO Header -->
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
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview" style="text-decoration:none" ><font size="-1"><img src="/i/events/google2003/rules_arrow_blue.gif" width="15" height="10" border="0"/>Rules</font></a></td>
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="/pl/?&module=Static&d1=google&d2=google_registration" style="text-decoration:none" ><font size="-1">Register Now</font></a></td>
<!--               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="?&<%=Constants.MODULE_KEY+"="+Constants.GOOGLE_REG_MAIN+"&"+Constants.COMPANY_ID+"=1865&"+Constants.EVENT_ID+"=1"%>" style="text-decoration:none"><font size="-1">Register Now</font></a></td>-->
               <td width=15><img src="/i/clear.gif" width="15" height="1"></td>
               <td bgcolor="#efefef" align="center" width=95 nowrap><a href="Javascript:openWin('?module=Static&d1=google&d2=google_quick_launch','comp',300,225);" style="text-decoration:none"><font size="-1">Practice Arena</font></a></td>
               <td width="50%">&nbsp;</td>
            </tr>
            <tr>
               <td colspan="11" bgcolor=#3366cc><img width=1 height=1 alt=""></td>
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
            <h2>Registration</h2>
            
            <p>Registration will open on Wednesday, October 1 at 8:00AM EDT and will close on Wednesday, October 15 at 5:00PM EDT.  Registration is unlimited.</p>
            
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