<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Setup</TITLE>
<jsp:include page="/script.jsp"/>

<SCRIPT language="JavaScript"><!--
function back() {
    history.back();
}
//--></SCRIPT>
</HEAD>

<BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="/includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><img src="/i/ev/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" scope="request" />
<% if("PopulateSession".equals(candidateInfo.getReferrer())) { %><FONT SIZE="3" COLOR="#666666"><strong>Create a New Session - </strong></FONT><%} else if("BuildCandidateList".equals(candidateInfo.getReferrer())) {%><FONT SIZE="3" COLOR="#666666"><strong>Candidate List - </strong></FONT><%}%><FONT SIZE="3" COLOR="#990000"><%if(candidateInfo.isNew()) { %><strong>Set up a Candidate</strong><%} else {%><strong>Candidate Info</strong><%}%></FONT> 

<screen:form name="candidateSetupForm" action="<%= Constants.CONTROLLER_URL %>" method="GET">
        <INPUT type="hidden" name="rp" value="UpdateCandidate" />
        <INPUT type="hidden" name="referrer" value="<jsp:getProperty name="candidateInfo" property="referrer" />" />

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><strong>Email Address</strong>&#160;&#160;</TD>
              <% if (candidateInfo.isNew()) { %>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="emailAddress" size="30" maxlength="30" value="<jsp:getProperty name="candidateInfo" property="emailAddress" />"></TD>
              <% } else { %>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><jsp:getProperty name="candidateInfo" property="emailAddress" /></TD>
              <% } %>
              <TD CLASS="bodyText" VALIGN="middle">&#160;</TD>
           </TR>
           <TR>
              <TD></TD><TD colspan="2" class="errorText" align="left" valign="middle"><screen:errors name="emailAddress" /></TD>
           </TR>
           <% if (!candidateInfo.isNew()) { %>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><strong>Password</strong>&#160;&#160;</TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">&#160;<jsp:getProperty name="candidateInfo" property="password" /></TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;</TD>
           </TR>
           <TR>
              <TD></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <% } %>
            <TR>
              <TD COLSPAN="2"><img src="/i/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR> 
<% if(candidateInfo.isNew()) { %>
           <TR>
              <TD COLSPAN="2" ALIGN="center"><a href="JavaScript:document.candidateSetupForm.submit()" class="bodyText">Save</a></TD>
           </TR>                                
<%    } else {%>
           <TR>
              <TD COLSPAN="2" ALIGN="center"><a href="JavaScript:back()" class="bodyText">Go Back</a></TD>
           </TR>                                
<%    } %>
         </TABLE>
<%
    if(!candidateInfo.isNew())
    { 
        String params = Constants.CANDIDATE_ID + "=" + candidateInfo.getUserId(); 
%>
<P>To add a note <screen:servletLink processor="NoteList" param="<%=params%>" styleClass="bodyText">click here</screen:servletLink></P>
<%
    }
%>
                            
</screen:form>         
<P><BR/></P>   
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><img src="/i/ev/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
