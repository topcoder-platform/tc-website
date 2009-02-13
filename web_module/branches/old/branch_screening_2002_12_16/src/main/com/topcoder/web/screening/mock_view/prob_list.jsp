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
<FONT SIZE="3" COLOR="#666666"><B>Problem List</B></FONT><BR/>                 
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM>
                   
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">	        
	        <TR>
		       <TD COLSPAN="3" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>
		       <TD COLSPAN="3" VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Submission %</B></TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;</B></TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Difficulty</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Overall Accuracy %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. Acc. %</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Sub. %</B></TD>		       		       		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#999999"><B>&#160;Category</B></TD>		       
	        </TR>          
           <TR>
              <TD COLSPAN="7" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B>Problem Set 1</B></TD>
           </TR>
                      	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        	        	        
           <TR>
              <TD COLSPAN="7"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="7" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B>Problem Set 2</B></TD>
           </TR>                      	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>           
           <TR>
              <TD COLSPAN="7"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD COLSPAN="7" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B>Problem Set 3</B></TD>
           </TR>                     	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
           <TR>
              <TD COLSPAN="7"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="7" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B>Problem Set 4</B></TD>
           </TR>                      	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
           <TR>
              <TD COLSPAN="7"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="7" CLASS="bodyText" BGCOLOR="#CCCCCC" HEIGHT="15">&#160;<B>Problem Set 5</B></TD>
           </TR>                      	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;50%</TD>		       		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        	                   
           <TR>
              <TD COLSPAN="7"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30" BORDER="0"></TD>
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
