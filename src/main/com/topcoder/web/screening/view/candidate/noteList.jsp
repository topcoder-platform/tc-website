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
<h1 class="testHead">Note List</h1>                  

<FORM>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">           
           <TR>
              <TD COLSPAN="3" ALIGN="center"><screen:servletLink processor="PopulateCandidate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText"><jsp:getProperty name="candidateInfo" property="userName"/></screen:servletLink></TD>
           </TR>
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center" VALIGN="middle" CLASS="statText" BGCOLOR="#666666">&#160;<B>Notes</B></TD>
              <TD ALIGN="center" VALIGN="middle" CLASS="statText" BGCOLOR="#666666">&#160;<B>Author</B></TD>
              <TD ALIGN="center" VALIGN="middle" CLASS="statText" BGCOLOR="#666666" HEIGHT="15">&#160;<B>Date Created</B></TD>
           </TR>
           <% { boolean even = true; %>
              <screen:resultSetRowIterator id="row" list="<%=candidateInfo.getNoteList()%>">
                 <TR>
                    <TD CLASS="bodyText" VALIGN="top" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>><screen:resultSetItem row="<%=row%>" name="text" /></TD>
                    <TD ALIGN="center" VALIGN="top" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %> HEIGHT="15">&#160;<screen:resultSetItem row="<%=row%>" name="created_by" />&#160;&#160;</TD>
                    <TD ALIGN="center" VALIGN="top" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %> HEIGHT="15">&#160;<B><screen:resultSetItem row="<%=row%>" name="create_date" /></B>&#160;&#160;</TD>
                 </TR>
                 <% even = !even; %>
              </screen:resultSetRowIterator>
           <% } %>
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                    
           <TR>
              <TD COLSPAN="3" ALIGN="center" HEIGHT="15"><screen:servletLink processor="NoteCreate" param="<%=Constants.CANDIDATE_ID+'='+candidateInfo.getUserId()%>" styleClass="bodyText">Add</screen:servletLink></TD>
           </TR>           
         </TABLE>                        
</FORM>         
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
