<%@  page 
  language="java"
  errorPage="/errorPage.jsp"
  import="java.util.*,
          com.topcoder.web.tces.common.*,
          com.topcoder.web.tces.bean.*" %>

<%@ taglib uri="/tces-taglib.tld" prefix="tces"%>

<jsp:useBean id="ProblemStatementTask" scope="request" class="com.topcoder.web.tces.bean.ProblemStatementTask" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
  <HEAD>
    <TITLE>TopCoder Employment Services</TITLE>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <jsp:include page="../script.jsp" />             
    
  </HEAD>
  <BODY BGCOLOR="#43515E" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<%--
  <jsp:include page="../top_tces.jsp" />             
--%>
  
  <TABLE WIDTH="100%" HEIGHT="50%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
    <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="170" bgcolor="#001935" VALIGN="top">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD WIDTH="4" BGCOLOR="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
        <!-- Center Column Begins -->
      <TD class="statText" width="100%" bgcolor="#001935" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="tces"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Problem Statement"/>
        </jsp:include>
        
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
           <TR>
             <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
             <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"><BR>
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7" class='statText'>
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
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="12" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" CLASS="problemText" VALIGN="middle" ALIGN="left">
              		<%= ProblemStatementTask.getProblemText() %>
                   </TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/steel_darkblue_bg.gif" COLSPAN="7"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"></TD>
                 </TR>
               </TABLE>
             </TD>
             <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"></TD>
           </TR>
         </TABLE>

    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#001935" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <!-- <TR>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" bgcolor="#001935"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" bgcolor="#001935" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR> -->
</TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="4" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
      <!-- Right Column Begins -->
      <TD WIDTH="10" bgcolor="#001935" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"><BR>
        <!-- Right Column Include Begins -->
        <!--include virtual="/includes/public_right_col.shtml"-->
        <!-- Right Column Include Ends -->
      </TD>
      <!-- Right Column Ends -->
      <!-- Gutter -->
      <TD WIDTH="25" bgcolor="#001935"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
    </TR>
  </TABLE>
  <!-- Body Ends -->

  </BODY>
</HTML>
