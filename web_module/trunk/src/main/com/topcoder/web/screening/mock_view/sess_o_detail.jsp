<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="script.jsp"/>
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
<jsp:include page="includes/top.jsp"/>
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
   <TR>
    <!-- Left Column Begins -->
      <TD WIDTH="22" VALIGN="top" BGCOLOR="#000000">
        <!-- Left Column Include Begins -->
        <!-- Global Seconday Nav Begins -->
        <jsp:include page="includes/left.jsp"/>
        <!-- Global Seconday Nav Ends -->
        <!-- Left Column Include Ends -->
      </TD>
      <!-- Left Column Ends -->
      <!-- Gutter Begins -->
      <TD VALIGN="top"><IMG SRC="/i/ev/clear.gif" WIDTH="10" HEIGHT="1"></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><img src="/i/ev/clear.gif" width="400" HEIGHT="1" VSPACE="5" BORDER="0"><BR>
<FONT SIZE="3" COLOR="#666666"><B>Test Profile Outline Detail</B></FONT><BR/>                 
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText"><B>Test Profile:</B> Test Profile 1</TD>
	        </TR>	                 
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText"><B>Problem Group:</B> Group 1</TD>
	        </TR>
	        <TR>
		       <TD VALIGN="top" CLASS="bodyText"> <A HREF="/eval/cand_setup.jsp" CLASS="bodyText">Add a Candidate</A></TD>
	        </TR>	        
	        <TR>
		       <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>                       
         </TABLE>
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="1"></TD>
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold"><B>&#160;</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold"><B>&#160;</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold"><B>&#160;</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" COLSPAN="3"><B>PROBLEMS</B></TD>		       	       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold"><B>&#160;</B></TD>		       
	        </TR>
	        	        	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="bodyTextBold"><B>Candidate</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="bodyTextBold"><B>Status</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="bodyTextBold"><B>Time Spent</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Presented</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Submitted</B></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="statText" BGCOLOR="#999999"><B>Passed</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" WIDTH="15%" CLASS="bodyTextBold"><B>&#160;</B></TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText">rjames@nodomain.com</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">Done</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">2</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><A HREF="/eval/test_results.jsp" CLASS="bodyText">Results</A></TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText">maryjane@spam.com</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">Done</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText"><A HREF="/eval/test_results.jsp" CLASS="bodyText">Results</A></TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText">ttuner@rolling.com</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">Done</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC">2</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText" BGCOLOR="#CCCCCC"><A HREF="/eval/test_results.jsp" CLASS="bodyText">Results</A></TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText">simonenina@nodamin.com</A></TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">Done</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText"><A HREF="/eval/test_results.jsp" CLASS="bodyText">Results</A></TD>		       
	        </TR>
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="10"></TD>
	        </TR>
           <TR>
              <TD COLSPAN="7" ALIGN="center"><A HREF="/eval/cand_setup.jsp" CLASS="bodyText">Add a Candidate</A></TD>
           </TR>	         	        	        	        	        	        
	        <TR>
		       <TD COLSPAN="7"><IMG SRC="/i/p/clear.gif" WIDTH="1" HEIGHT="30"></TD>
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

  <jsp:include page="includes/foot.jsp"/>

</BODY>
</HTML>
