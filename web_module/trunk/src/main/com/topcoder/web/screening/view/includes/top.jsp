<%@ taglib uri="screening.tld" prefix="screen" %>
<a name="top"/>
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
<!-- Menu bar here -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr>
      <td width="20" background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></td>
      <td background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666" nowrap="" class="statText"><screen:servletlink processor="PopulateSession" styleclass="statText">Create a New Session</screen:servletlink></td>
      <td width="20" background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></td>      
      <td background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666" nowrap="" class="statText"><screen:servletlink processor="ProfileList" styleclass="statText">Test Profiles</screen:servletlink></td> 
      <td width="20" background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></td>           
      <td background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666" nowrap="" class="statText"><screen:servletlink processor="ProblemList" styleclass="statText">Problem Sets</screen:servletlink></td>
      <td width="20" background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></td>       
      <td background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666" nowrap="" class="statText"><screen:servletlink processor="BuildCandidateList" styleclass="statText">Candidates</screen:servletlink></td>          
      <td width="100%" background="/i/ev/graybv_lite_bg.gif" bgcolor="#666666"><img src="/i/ev/clear.gif" width="1" height="21" border="0"/></td>  
   </tr>

   <!-- <TR>
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_o_setup.jsp" CLASS="statText">Test Profile Set up</A>&#160;&#160;&#160;|</TD>
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_setup.jsp" CLASS="statText">Session Set up</A>&#160;&#160;&#160;|</TD>      
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_o_detail.jsp" CLASS="statText">Session Outline Detail</A>&#160;&#160;&#160;|</TD>     
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><IMG SRC="/i/ev/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/></TD>       
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/cand_setup.jsp" CLASS="statText">Candidate Set up</A>&#160;&#160;&#160;|</TD>      
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/cand_list.jsp" CLASS="statText">Candidate List</A></TD>           
      <TD WIDTH="100%" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="21" BORDER="0"/></TD>  
   </TR> -->
</table>
<!-- Menu bar ends here -->
