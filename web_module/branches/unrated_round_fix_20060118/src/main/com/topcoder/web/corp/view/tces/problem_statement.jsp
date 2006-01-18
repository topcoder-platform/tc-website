<%@ page contentType="text/html;charset=utf-8" %>
<%@  page
  language="java"
  import="com.topcoder.web.corp.controller.request.tces.*" %>

<%@ taglib uri="tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="ProblemStatementTask" scope="request" class="com.topcoder.web.corp.controller.request.tces.ProblemStatementTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder | Recruiting Reports</TITLE>
    <jsp:include page="script.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
  </HEAD>
  <body>
<%--
  <jsp:include page="top.jsp" />
--%>

  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR valign="top">
<!-- Left Column Begins -->
      <TD WIDTH="25"><img src="/i/corp/clear.gif" width="25" HEIGHT="11" alt="" BORDER="0"></TD>
<!-- Left Column Ends -->

      <!-- Gutter Begins -->
      <TD WIDTH="6"><IMG src="/i/corp/clear.gif" WIDTH="6" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="bodyText" width="100%"><img src="/i/corp/clear.gif" width="400" HEIGHT="11" BORDER="0"><BR>


         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
           <TR>
             <TD VALIGN="top" WIDTH="11"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                   <TD COLSPAN="7"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7" class='bodyText'>
                     <p>
                       <B>Problem:</B> <%= ProblemStatementTask.getProblemName() %>
                       <br>
                       <B>Match:</B> <%= ProblemStatementTask.getContestName() %>
                       <br>
                       <B>Division:</B> <%= ProblemStatementTask.getDivisionName() %>
                     </p>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD CLASS="problemText" VALIGN="middle" ALIGN="left">
              		<%= ProblemStatementTask.getProblemText() %>
                   </TD>
                 </TR>
                 <TR>
                   <TD COLSPAN="7"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
             <TD VALIGN="top" WIDTH="11"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" WIDTH="100%"><IMG src="/i/corp/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>

</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="6"><IMG src="/i/corp/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10"><IMG src="/i/corp/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25"><IMG src="/i/corp/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
</TABLE>

<!-- Footer begins -->
<jsp:include page="../foot.jsp" />
<!-- Footer ends -->

</BODY>
</HTML>
