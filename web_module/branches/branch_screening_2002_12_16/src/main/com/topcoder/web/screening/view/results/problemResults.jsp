<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.screening.model.*" %>
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
    window.open('tc_prob_results.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
    return;
  }
</SCRIPT>
</HEAD>

<jsp:useBean id="submissionInfo" class="com.topcoder.web.screening.model.SubmissionInfo" />
<jsp:useBean id="candidateInfo" class="com.topcoder.web.screening.model.CandidateInfo" />
<jsp:useBean id="profileInfo" class="com.topcoder.web.screening.model.ProfileInfo" />

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
<FONT SIZE="3" COLOR="#666666"><B>Problem Results</B></FONT><BR/>                 
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P>
<FORM>         

         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Candidate:</B> <A HREF="/eval/cand_setup.jsp" CLASS="bodyText"><jsp:getProperty name="candidateInfo" property="emailAddress"/></A>
                       </TD>
	        </TR>
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Test Profile:</B> <jsp:getProperty name='profileInfo' property='profileName'/>
                       </TD>
	        </TR>	                 
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText">
                           <B>Problem Set:</B> <jsp:getProperty name='profileInfo' property='testSetAName'/>
                       </TD>
	        </TR>
	        <TR>
		       <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>                       
         </TABLE>           
            
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
           <TR>
              <TD CLASS="bodyText" VALIGN="middle" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<b>Code:</b></TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" VALIGN="top">
              <PRE><jsp:getProperty name="submissionInfo" property="code" /></PRE>
              </TD>
           </TR>           
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>
          
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                   
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                                
           <TR>
              <TD COLSPAN="3" CLASS="bodyText"><B>System Test</B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Args</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Expected</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Received</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Status</B></TD>	        
	        </TR>
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
           <screen:resultSetRowIterator id="testResult" list="<%= submissionInfo.getTestResults() %>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="args" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="expected_result" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=testResult%>" name="received" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">
                           <% if(testResult.getItem("succeeded").toString().equals("0")){ %>
                               Failed
                           <% } else { %>
                               Succeeded
                           <% } %>
                       </TD>
	        </TR>	        
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>
           </screen:resultSetRowIterator>
         </TABLE>
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%"> 
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Top TopCoder Solutions </B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Points</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>		       
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
           <screen:resultSetRowIterator id="solution" list="<%= submissionInfo.getTopTCSolutions() %>">
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/tc_prob_results.jsp','600','500')" CLASS="bodyText">328.45</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       	        
	        </TR>	        
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>          	        	        	        
           </screen:resultSetRowIterator>
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
