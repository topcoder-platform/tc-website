<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>
</HEAD>

<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />

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
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
            <h1 class="testHead">Note Creation</h1>                  

            <screen:form name='note' method='POST' action='<%=Constants.CONTROLLER_URL%>'>
         <INPUT type="hidden" name='<%=Constants.REQUEST_PROCESSOR%>' value='NoteCreate'/>
         <INPUT type="hidden" name='<%=Constants.FIRST_ATTEMPT%>' value='false'/>
         <INPUT type="hidden" name='<%=Constants.CANDIDATE_ID%>' value='<%=candidateInfo.getUserId()%>'/>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">           
           <TR>
              <TD ALIGN="center" CLASS="bodyText"><screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink></TD>
           </TR>           
           <TR>
              <TD class="errorText" align="left" valign="middle">
                  <% if((String)request.getAttribute(Constants.MESSAGE_PARAMETER) != null){ %>
                      &nbsp;<BR>
                      <%= request.getAttribute(Constants.MESSAGE_PARAMETER).toString() %>
                      <BR>&nbsp;
                  <% }else if((String)request.getParameter(Constants.MESSAGE_PARAMETER) != null){ %>
                      &nbsp;<BR>
                      <%= request.getParameter(Constants.MESSAGE_PARAMETER) %>
                      <BR>&nbsp;
                  <% } %>
              </TD>
           </TR>           
           <TR>
              <TD ALIGN="center"><TEXTAREA NAME="<%=Constants.NOTE_TEXT%>" COLS="80" ROWS="4"></TEXTAREA></TD>
           </TR>    
           
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><A HREF="Javascript:document.note.submit()" CLASS="bodyText">Save</A></TD>
           </TR>           
         </TABLE>                        
</screen:form>         
<P><BR/></P>   
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
