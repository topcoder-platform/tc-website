<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>

<SCRIPT type="text/javascript"><!--
function submitEdit() {
document.sessionConfirmForm.rp.value = "<%=Constants.POPULATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
}

function submitUpdate() {
document.sessionConfirmForm.rp.value = "<%=Constants.UPDATE_SESSION_PROCESSOR%>";
document.sessionConfirmForm.submit();
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
      <TD VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<h1 class="testHead">Create a New Session - <FONT COLOR="#000000">Session Confirmation</FONT></h1>

<P>Review the information below for correctness.  If the information is correct, click "Submit".  If changes need to be made, click "Edit" 
to return to the previous page.  Click "Cancel" if you do not wish to set up this session.</P><BR>
<jsp:useBean id="sessionInfo" type="com.topcoder.web.screening.model.SessionInfo" scope="session" />
<screen:form name="sessionConfirmForm" action="<%=Constants.CONTROLLER_URL%>" method="GET">
         <input type="HIDDEN" name="rp" value="" >
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" HEIGHT="15"><b>Candidate:</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getCandidateList()%>">
                <% if(sessionInfo.isSelectedCandidate(row.getItem("candidate_id").toString())) { %>
                  <input type="HIDDEN" name="cid" value="<screen:resultSetItem row="<%=row%>" name="candidate_id" />" >
                  <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:resultSetItem row="<%=row%>" name="handle" /></TD>
                <% } %>
                </screen:resultSetRowIterator>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR>
              <TD COLSPAN="4" ><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD BGCOLOR="#CCCCCC" COLSPAN="4" CLASS="bodyText" ALIGN="left" VALIGN="middle" HEIGHT="20">&#160;<B>Session</B></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" HEIGHT="15"><b>Profile:</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                <screen:resultSetRowIterator id="row" list="<%=sessionInfo.getProfileList()%>">
                <% if(sessionInfo.isSelectedProfile(row.getItem("session_profile_id").toString())) { %>
                  <input type="HIDDEN" name="profileId" value="<screen:resultSetItem row="<%=row%>" name="session_profile_id" />" >
                  <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:resultSetItem row="<%=row%>" name="name" /></TD>
                <% } %>
                </screen:resultSetRowIterator>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" HEIGHT="15"><b>Begin:</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <input type="HIDDEN" name="beginMonth" value="<jsp:getProperty name="sessionInfo" property="beginMonth" />" >
              <input type="HIDDEN" name="beginDay" value="<jsp:getProperty name="sessionInfo" property="beginDay" />" >
              <input type="HIDDEN" name="beginYear" value="<jsp:getProperty name="sessionInfo" property="beginYear" />" >
              <input type="HIDDEN" name="beginHour" value="<jsp:getProperty name="sessionInfo" property="beginHour" />" >
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:beanWrite name="sessionInfo" property="beginDate" format="MM/dd/yyyy hh:mm aa" /></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" HEIGHT="15"><b>End:</b>&#160;</TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <input type="HIDDEN" name="endMonth" value="<jsp:getProperty name="sessionInfo" property="endMonth" />" >
              <input type="HIDDEN" name="endDay" value="<jsp:getProperty name="sessionInfo" property="endDay" />" >
              <input type="HIDDEN" name="endYear" value="<jsp:getProperty name="sessionInfo" property="endYear" />" >
              <input type="HIDDEN" name="endHour" value="<jsp:getProperty name="sessionInfo" property="endHour" />" >
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><screen:beanWrite name="sessionInfo" property="endDate" format="MM/dd/yyyy hh:mm aa" /></TD>
           </TR>           
           <TR>
              <TD></TD><TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="90%">
           <TR>
              <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
            <TR>
              <input type="HIDDEN" name="candidateEmail" value="<jsp:getProperty name="sessionInfo" property="candidateEmail" />" >
               <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Invite candidate to Testing Application&#160;- <B><jsp:getProperty name="sessionInfo" property="candidateEmail" /></B></TD>
            </TR>
            <TR>
              <input type="HIDDEN" name="repEmail" value="<jsp:getProperty name="sessionInfo" property="repEmail" />" >
               <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send me email reminder&#160;- <B><jsp:getProperty name="sessionInfo" property="repEmail" /></B></TD>
            </TR>
           <TR>
              <TD><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><screen:servletLink processor="CancelSession" styleClass="bodyText">Cancel</screen:servletLink> | <A HREF="JavaScript:submitEdit()" CLASS="bodyText">Edit</A> | <A HREF="JavaScript:submitUpdate()" CLASS="bodyText">Submit</A></TD>
           </TR>
         </TABLE>
</screen:form>
<P><BR/></P>
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
