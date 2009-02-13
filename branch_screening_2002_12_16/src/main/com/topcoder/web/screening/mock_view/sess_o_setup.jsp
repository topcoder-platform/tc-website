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
<FONT SIZE="3" COLOR="#666666"><B>Create a New Session - </B></FONT><FONT SIZE="3" COLOR="#990000"><B>Set-Up a New Test Profile</B></FONT> 
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Name</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle"><input type="text" name="" value ="" size="30" maxlength="30"></TD>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR align="right" valign="middle">
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Problem Set</b>&#160;</TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
              <TD COLSPAN="2" CLASS="bodyText" ALIGN="left" VALIGN="middle">          
              <select value ="">
              	<option>problem set1</option>
              	<option>problem set2</option>
              	<option>problem set3</option>
              	<option>problem set4</option>              	
              </select>
              </TD>
           </TR>
           <TR>
              <TD></TD><TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD colspan="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>
          
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%">                   
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD COLSPAN="4" CLASS="bodyText"><B>Test Set A</B></TD>
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
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem A</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 1</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem B</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<A HREF="JavaScript:getProblemDetail('/eval/prob_detail.jsp','600','500')" CLASS="bodyText">Problem C</A></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 3</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
	        </TR>	        	        	        
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        	        	        
         </TABLE>         
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="80%"> 
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>                           
           <TR>
              <TD COLSPAN="5" CLASS="bodyText"><B>Test Set B</B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Name</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Division</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Difficulty</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC"><B>&#160;Category</B></TD>	
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyTextBold" BGCOLOR="#CCCCCC">&#160;</TD>	       
	        </TR>
           <TR>
              <TD COLSPAN="4"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;Problem A</TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;I</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Level 2</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;Category Name</TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<A HREF="#" CLASS="bodyText">Remove</A></TD>	        
	        </TR>	        
           <TR>
              <TD COLSPAN="5"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="30" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="5" ALIGN="center">
<select name="QueryId" class="dropdown" size="10" multiple="false">
<option value="89">Problem 1</option>
<option value="11001">Problem 2</option>
<option value="11006">Problem 3</option>
<option value="60">Problem 4</option>
<option value="61">Problem 5</option>
<option value="68">Problem 6</option>
<option value="65">Problem 7</option>
<option value="73">Problem 8</option>
<option value="51">Problem 9</option>
</select>
              </TD>
           </TR>           
           <TR>
              <TD COLSPAN="5" ALIGN="center"><A HREF="#" CLASS="bodyText">Add</A></TD>
           </TR>           	        	        	        
         </TABLE> 
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="95%">                   
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>           
           <TR>
              <TD CLASS="bodyText"><B>Available Languages</B></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<input type="checkbox">&#160;Java</TD>	       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<input type="checkbox">&#160;C++</TD>	       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">&#160;<input type="checkbox">&#160;C#</TD>	       
	        </TR>	        	        
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
	        <TR>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">Clear | <A HREF="sess_o_confirm.jsp" CLASS="bodyText">Click here to view the confirmation page</A></TD>	       
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
