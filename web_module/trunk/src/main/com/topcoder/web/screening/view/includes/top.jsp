<%@ taglib uri="screening.tld" prefix="screen" %>
<a name="top"></a>

<!-- Logo Bar Include Begins -->       
<jsp:usebean id="requestInfo" class="com.topcoder.web.screening.model.RequestInfo" />
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">            
   <tr>
      <td colspan="3" width="100%" bgcolor="#333333" align="right" valign="middle" height="15" class='globalNavSmall'>
<% if(requestInfo.isLoggedIn()) { %>
        <screen:servletLink processor="Logout" target="_top" styleclass="globalNavSmall">Logout</screen:servletLink>&#160;&#160;|&#160;&#160;
<%} else {%>
        <screen:servletLink processor="Login" target="_top" styleclass="globalNavSmall">Login</screen:servletLink>&#160;&#160;|&#160;&#160;
<%}%>
        <img src="/i/ev/clear.gif" width="20" height="1" hspace="0" border="0"/><screen:servletLink target="_top" styleclass="globalNavSmall">Home</screen:servletLink><img src="/i/ev/clear.gif" width="20" height="1" hspace="5" border="0"/></td>
   </tr>   
   <tr>
      <td width="15" bgcolor="#000000"><a name="top"></a><img src="/i/ev/clear.gif" width="15" height="1" border="0"/></td>
      <td width="206" bgcolor="#000000"><screen:servletLink target="_top"><img src="/i/ev/logo.gif" width="206" height="49" border="0" vspace="13"/></screen:servletLink></td>
      <td width="100%" bgcolor="#000000"><img src="/i/ev/clear.gif" width="1" height="1" border="0"/></td>        
   </tr>             
</table>

<!-- Menu bar begins here -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" id="testTop">
   <tr valign="top">
      <td width="15" class="statText"><img src="/i/ev/clear.gif" width="15" height="21" border="0"/></td>
      <td nowrap="nowrap" class="statText"><screen:servletLink processor="PopulateSession" styleclass="testTopNav">Create a New Session</screen:servletLink></td>
      <td nowrap="nowrap" class="statText"><screen:servletLink processor="ProfileList" styleclass="testTopNav">Test Profiles</screen:servletLink></td> 
      <td nowrap="nowrap" class="statText"><screen:servletLink processor="ProblemList" styleclass="testTopNav">Problem Sets</screen:servletLink></td>
      <td nowrap="nowrap" class="statText"><screen:servletLink processor="BuildCandidateList" styleclass="testTopNav">Candidates</screen:servletLink></td>          
      <td width="100%" class="statText"><img src="/i/ev/clear.gif" width="15" height="21" border="0"/></td>  
   </tr>
</table>
<!-- Menu bar ends here -->
