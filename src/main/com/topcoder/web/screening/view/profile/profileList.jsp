<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp"
         import="com.topcoder.web.screening.common.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Testing Application Management Tool</title>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(id) {
    var width = screen.availWidth * 2 / 3;
    var height = screen.availHeight / 2;
    var left = (screen.availWidth - width) / 2;
    var top = 0;
    var cmd = "toolbar=no,menubar=no,location=no,scrollbars=yes,resizable=yes,top=" + top + ",left=" + left + ",width=" + width + ",height=" + height + ",status=0";
    var name="problemDetail";
    <% String url = Constants.CONTROLLER_URL + "?" + Constants.REQUEST_PROCESSOR + "=PopulateProblemDetail"; %>
    window.open('<screen:rewrite page="<%=url%>" />&<%=Constants.ROUND_PROBLEM_ID%>='+id,name,cmd);
    return;
  }
</SCRIPT>
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
        <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
            <h1 class="testHead">Test Profile List</h1>

<jsp:useBean id="profileList" type="java.util.List" scope="request" />

    <screen:nestedListIterator id="profile" list="<%= profileList %>">

        <%
            boolean even = true;
            ResultSetContainer.ResultSetRow first = (ResultSetContainer.ResultSetRow)profile.get(0);
        %>

        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%"> 
            <TR>
               <TD COLSPAN="3" VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<FONT SIZE="3" COLOR="#000000"><B><screen:resultSetItem row="<%=first%>" name="session_profile_desc" /></B></FONT></TD>                                         
            </TR>            
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="statText" BGCOLOR="#666666">&#160;</TD>               
               <TD COLSPAN="2" VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="statText" BGCOLOR="#666666"><B>Candidates</B></TD>                          
            </TR>                         
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="10%" CLASS="bodyTextBold" BGCOLOR="#999999"><B>Problem Set</B></TD>               
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="10%" CLASS="bodyTextBold" BGCOLOR="#999999"><B>Total</B></TD>               
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="10%" CLASS="bodyTextBold" BGCOLOR="#999999"><B>Complete</B></TD>                              
            </TR>
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=first%>" name="round_name" /></TD>               
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=first%>" name="num_sessions" /></TD>    
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=first%>" name="num_complete" /></TD>                                             
            </TR>                                    
        </TABLE>         
        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">       
            <TR>
               <TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="4"></TD>
            </TR>            
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold"><B>&#160;</B></TD>               
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold"><B>&#160;</B></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" COLSPAN="3"><B>PROBLEMS</B></TD>                          
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold"><B>&#160;</B></TD>               
            </TR>
                                    
            <TR>
               <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="bodyTextBold"><B>Candidate</B></TD>
               <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="bodyTextBold"><B>Status</B></TD>               
               <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Presented</B></TD>               
               <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Submitted</B></TD>
               <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Passed</B></TD>               
               <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="bodyTextBold"><B>&#160;</B></TD>               
            </TR>
     <screen:resultSetRowIterator id='row' list='<%= profile %>'>
      <%-- Do a table body row --%>
      <% if(row.getItem("num_sessions").toString().equals("0")){ %>
            <TR>
               <TD COLSPAN="6" VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC">
                    No sessions scheduled for this profile.
               </TD>               
            </TR>
      <% }else{ %>
          <%
              String cparam = Constants.CANDIDATE_ID + '=' + row.getItem("user_id");
              String sparam = Constants.SESSION_ID + '=' + row.getItem("session_id");

              String color = (even) ? "BGCOLOR='#CCCCCC'" : "";
          %>
            <TR>
               <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <%=color%>>&#160;<screen:servletLink processor="PopulateCandidate" param="<%=cparam%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="user_name" /></screen:servletLink></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="status" /></TD>               
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="presented" /></TD>               
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="submitted" /></TD>
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%=color%>><screen:resultSetItem row="<%=row%>" name="passed" /></TD>               
               <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <%=color%>><screen:servletLink processor="TestResults" param="<%=sparam%>" styleClass="bodyText"><screen:resultSetItem row="<%=row%>" name="results_label" /></screen:servletLink></TD>               
            </TR>
      <% } %>
      <% even = !even; %>
     </screen:resultSetRowIterator>
            <TR>
               <TD COLSPAN="6"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10"><P><HR></P><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10"></TD>
            </TR>         
          </TABLE>                
    </screen:nestedListIterator>

    <% if(profileList.isEmpty()){ %>
              No test profiles found.
    <% } %>

         
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
