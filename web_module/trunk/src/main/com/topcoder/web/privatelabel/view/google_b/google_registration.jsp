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
            data="/i/events/google2003/google.swf"
            width="100%"
            height="80"
            border="0">           
            <param name="movie" value="/i/events/google2003/google.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
            </object><br/>
      </td>
        <td width="176" valign="top" colspan="2" bgcolor="#B8B8B8"><img src="/i/clear.gif" width="176" height="77" border="0"/></td>
   </tr>
   
   <tr>
      <td colspan="7" width ="100%" align="center">
            <object 
            type="application/x-shockwave-flash"
            data="/i/events/google2003/googletabs.swf"
            width="100%"
            height="150"
            border="0">           
            <param name="movie" value="/i/events/google2003/googletabs.swf" />
            <param name="quality" value="high" />
            <param name="salign" value="t">
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
       
            <h2>Registration</h2>
            
            <p>Registration will open on Wednesday, October 1 at 8:00AM and will close on Wednesday, October 15 at 5:00PM.  Registration is unlimited.</p>
            
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