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

        <td align="center"><img src="/i/events/google2003/Logo_50wht.gif" width="163" height="74" border="0"/></td>

         <td width="100%" align="center" colspan="3">
            <object 
            type="application/x-shockwave-flash"
            data="/i/events/google2003/google3.swf"
            width="100%"
            height="125"
            border="0">           
            <param name="movie" value="/i/events/google2003/google3.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object>
      </td>
   </tr>    
   <tr>

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td valign="top">
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

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
               <td id=1 bgcolor=#efefef align=center width=95 nowrap onClick="return c('www.google.com/imghp','wi',event);" style=cursor:pointer;cursor:hand;><a href="/pl/?&module=Static&d1=google&d2=google_rules_overview"><font size=-1>Rules</font></a></td>
               <td width=15>&nbsp;</td>
               <td id=0 bgcolor=#3366cc align=center width=95 nowrap><font color=#ffffff size=-1><b>Register Now</b></font></td>
               <td width=15>&nbsp;</td>
            </tr>
            <tr>
               <td colspan=9 bgcolor=#3366cc><img width=1 height=1 alt=""></td>
            </tr>
         </table>
       
            <h2>Registration</h2>
            
            <p>Registration will open on Wednesday, October 1 at 8:00AM and will close on Wednesday, October 15 at 5:00PM.  Registration is unlimited.</p>
            
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