<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page errorPage="/errorPage.jsp" %>
<%@ page import="com.topcoder.web.screening.common.Constants" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="/script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getProblemDetail(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('prob_detail.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
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
      <TD VALIGN="top"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/p/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Test Profile List</B></FONT><BR/><BR/>

<jsp:useBean id="profileList" type="java.util.List" scope="request" />

<% { String curProfile = "NONE"; boolean first = true; boolean even = true; %>
     <screen:resultSetRowIterator id="row" list="<%= profileList %>">
       <% if(!curProfile.equals(row.getItem("session_profile_id").toString())){ %>
        <% if(!first){ %>
         <%-- End previous table --%>
	        <TR>
		       <TD COLSPAN="6"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10"><P><HR></P><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>         
         </TABLE>                
        <% } %>

         <%-- Start a fresh table --%>
         <% even = true; %>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%"> 
	        <TR>
		       <TD COLSPAN="3" VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<FONT SIZE="3" COLOR="#000000"><B><screen:resultSetItem row="<%=row%>" name="session_profile_desc" /></B></FONT></TD>		       	       		       
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
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="round_name" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="num_sessions" /></TD>	
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="num_complete" /></TD>			       	       		       
	        </TR>	        	        	        
         </TABLE>         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">       
	        <TR>
		       <TD COLSPAN="6"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="4"></TD>
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
           <% first = false; %>
        <% } %>
        <%-- Do a main body row --%>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText"><screen:resultSetItem row="<%=row%>" name="user_name" /></A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="status" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="presented" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="submitted" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC"><screen:resultSetItem row="<%=row%>" name="passed" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" BGCOLOR="#CCCCCC"><A HREF="/eval/test_results.jsp" CLASS="bodyText"><screen:resultSetItem row="<%=row%>" name="results_label" /></A></TD>		       
	        </TR>
	<% even = !even; %>
     </screen:resultSetRowIterator>

        <% if(!first){ %>
         <%-- End final table --%>
	        <TR>
		       <TD COLSPAN="6"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10"><P><HR></P><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>         
         </TABLE>                
        <% }else{ %>
         <%-- No tables means no profiles --%>
         No test profiles found.
        <% } %>
<% } %>
         
         
<P><BR/></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><IMG SRC="/i/p/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="/includes/foot.jsp"/>

</BODY>
</HTML>
