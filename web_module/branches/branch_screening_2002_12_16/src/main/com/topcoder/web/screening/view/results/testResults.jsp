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

<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />
<jsp:useBean id="testResultsInfo" class="com.topcoder.web.screening.model.TestResultsInfo" />

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
      <TD CLASS="statTextBig" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Test Results</B></FONT><BR/><BR/>              
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
                           <B>Candidate:</B> <A HREF="/eval/cand_setup.jsp" CLASS="bodyText"><jsp:getProperty name="candidateInfo" property="emailAddress"/></A>
                       </TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
                           <B>Test Profile:</B> <jsp:getProperty name='profileInfo' property='profileName'/>
                       </TD>
	        </TR>	                 
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyText">
                           <B>Problem Set:</B> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                       </TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>	        	                 
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyTextBold"><B>Problem Set A Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>       	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Problem</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Language</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Passed</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Failed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>% Test Passed</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>	
		       <TD VALIGN="middle" ALIGN="center" WIDTH="15%" CLASS="statText" BGCOLOR="#666666">&#160;</TD>	       
	        </TR>
                <% { boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetAResults()%>">
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>Java</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>Passed</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>0</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>100%</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>65:45</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>><A HREF="/eval/prob_results_detail.jsp" CLASS="bodyText">Details</A></TD>		       
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        </TABLE>
	        
	        <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="10" VALIGN="top" CLASS="bodyTextBold"><B>TopCoder Stats</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="10"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>     	        
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Level</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Coders</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Submissions</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Sub %</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Correct</B></TD>	
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Submit Corr. %</B></TD>	       
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Overall Corr. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" WIDTH="10%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>		       	        
	        </TR>
                <% { boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetATCStats()%>">
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>300</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>200</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>66.6%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>100</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>50%</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>33%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>65:45</TD>		       
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
         </TABLE>
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>	        	                 
	        <TR>
		       <TD COLSPAN="8" VALIGN="top" CLASS="bodyTextBold"><B>Problem Set B Results:</B></TD>
	        </TR>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>       	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Problem</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Language</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Passed</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Test Failed</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>% Test Passed</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666"><B>Time</B></TD>	
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#666666">&#160;</TD>	       
	        </TR>
                <% { boolean even = true; %>
                   <screen:resultSetRowIterator id="row" list="<%=testResultsInfo.getProblemSetBResults()%>">
	             <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>Java</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>Passed</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>0</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>100%</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>>65:45</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" <% if(even){ %>BGCOLOR="#CCCCCC"<% } %>><A HREF="/eval/prob_results_detail.jsp" CLASS="bodyText">Details</A></TD>		       
	             </TR>
                     <% even = !even; %>
                   </screen:resultSetRowIterator>
                <% } %>
	        <TR>
		       <TD COLSPAN="8"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30"></TD>
	        </TR>
	        </TABLE>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                   
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problems</B></TD>
           </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set A</B></TD>
           </TR>           	     
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>		       
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
            <screen:resultSetRowIterator id="row" list="<%=profileInfo.getTestSetAList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="difficulty_level" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="category_desc" /></TD>		       
	        </TR>	        
            </screen:resultSetRowIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        	        	        
         </TABLE>
         
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                   
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Problem Set B</B></TD>
           </TR>           	     
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>		       
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
            <screen:resultSetRowIterator id="row" list="<%=profileInfo.getTestSetBList()%>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="problem_name" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="division_desc" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="difficulty_level" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="category_desc" /></TD>		       
	        </TR>	        
            </screen:resultSetRowIterator>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        	        	        
         </TABLE> 	                 
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
