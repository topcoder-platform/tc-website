<%@ taglib uri="screening.tld" prefix="screen" %>
<A NAME="top"/>
    <!-- Logo Bar Include Begins -->       
<jsp:useBean id="requestInfo" class="com.topcoder.web.screening.model.RequestInfo" />
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#000000">            
   <TR>
      <TD COLSPAN="3" WIDTH="100%" BGCOLOR="#333333" ALIGN="right" VALIGN="middle" HEIGHT="15" class='globalNavSmall'><% if(requestInfo.isLoggedIn()) { %><screen:servletLink processor="Logout" target="_top" styleClass="globalNavSmall">Logout</screen:servletLink><%} else {%><screen:servletLink processor="Login" target="_top" styleClass="globalNavSmall">Login</screen:servletLink><%}%><img src="/i/ev/clear.gif" width="20" height="1" hspace="0" border="0"/><screen:servletLink target="_top" styleClass="globalNavSmall">Home</screen:servletLink><img src="/i/ev/clear.gif" width="20" height="1" hspace="5" border="0"/></TD>
   </TR>   
   <TR>
      <TD WIDTH="15" BGCOLOR="#000000"><A NAME="top"></A><img src="/i/ev/clear.gif" width="15" height="1" border="0"/></TD>
      <TD WIDTH="206" BGCOLOR="#000000"><screen:servletLink target="_top"><img src="/i/ev/logo.gif" width="206" height="49" border="0" vspace="13"/></screen:servletLink></TD>
      <TD WIDTH="100%" BGCOLOR="#000000"><img src="/i/ev/clear.gif" width="1" height="1" border="0"/></TD>        
   </TR>             
</TABLE>
<!-- Menu bar here -->

<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></TD>
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText"><screen:servletLink processor="PopulateSession" styleClass="statText">Create a New Session</screen:servletLink></TD>
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></TD>      
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText"><screen:servletLink processor="ProfileList" styleClass="statText">Test Profiles</screen:servletLink></TD> 
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></TD>           
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText"><screen:servletLink processor="ProblemList" styleClass="statText">Problem Sets</screen:servletLink></TD>
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><img src="/i/ev/clear.gif" width="30" height="1" border="0"/></TD>       
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText"><screen:servletLink processor="BuildCandidateList" styleClass="statText">Candidates</screen:servletLink></TD>          
      <TD WIDTH="100%" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><img src="/i/ev/clear.gif" width="1" height="21" border="0"/></TD>  
   </TR>

   <!-- <TR>
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_o_setup.jsp" CLASS="statText">Test Profile Set up</A>&#160;&#160;&#160;|</TD>
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_setup.jsp" CLASS="statText">Session Set up</A>&#160;&#160;&#160;|</TD>      
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/sess_o_detail.jsp" CLASS="statText">Session Outline Detail</A>&#160;&#160;&#160;|</TD>     
      <TD WIDTH="20" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><IMG SRC="/i/ev/clear.gif" WIDTH="50" HEIGHT="1" BORDER="0"/></TD>       
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/cand_setup.jsp" CLASS="statText">Candidate Set up</A>&#160;&#160;&#160;|</TD>      
      <TD BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666" NOWRAP="" CLASS="statText">&#160;&#160;&#160;<A HREF="/eval/cand_list.jsp" CLASS="statText">Candidate List</A></TD>           
      <TD WIDTH="100%" BACKGROUND="/i/ev/graybv_lite_bg.gif" BGCOLOR="#666666"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="21" BORDER="0"/></TD>  
   </TR> -->
</TABLE>
<!-- Menu bar ends here -->
