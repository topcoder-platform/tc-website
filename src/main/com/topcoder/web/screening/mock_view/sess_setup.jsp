<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="script.jsp"/>
<SCRIPT TYPE="text/javascript">
function getEmail(url,wd,ht) {
    var last=0;
    var daHt = parseInt(ht) + parseInt('49');
    var size = "top=2,left=2,width="+wd+",height="+daHt+"status=0";
    var name="graph";
    window.open('email_preview.jsp?'+url+'&width='+wd+'&height='+ht,name,size);
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
<FONT SIZE="3" COLOR="#666666"><B>Create a New Session</B></FONT>                
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>
<FORM>
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="50%">
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Test Profile</b>&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select value ="">
              	<option>Test Profile 1</option>
              	<option>Test Profile 2</option>              	
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<A HREF="/eval/sess_o_setup.jsp" CLASS="bodyText">Create a New Test Profile</A></TD>
           </TR>                              
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Candidate</b>&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
              <select value ="">
              	<option>Tuner Tina</option>
              	<option>James Rick</option>
              	<option>Simone Nina</option>
              	<option>James Etta</option>              	
              </select>
              </TD>
              <TD CLASS="bodyText" VALIGN="middle">&#160;<A HREF="/eval/cand_setup.jsp" CLASS="bodyText">Add a Candidate</A></TD>              
           </TR>
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>Begin Time</b></TD>
           </TR>                        
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>January</option>
              	<option>February</option>
              	<option>March</option>
              	<option>April</option>
              	<option>May</option>
              	<option>June</option>
              	<option>July</option>
              	<option>August</option>              	
              	<option>September</option>
              	<option>October</option>
              	<option>November</option>
              	<option>December</option>              	              	
              </select>
              </TD>
           </TR>                                
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>Sunday</option>
              	<option>Monday</option>
              	<option>Tuesday</option>
              	<option>Wednesday</option>
              	<option>Thursday</option>
              	<option>Friday</option>
              	<option>Saturday</option>             	              	
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>2002</option>
              	<option>2003</option>             	              	
              </select>
              </TD>
           </TR> 
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>12AM</option>
              	<option>1AM</option> 
                <option>2AM</option>
              	<option>3AM</option> 
                <option>4AM</option> 
                <option>5AM</option>
              	<option>6AM</option> 
                <option>7AM</option>
                <option>8AM</option>
              	<option>9AM</option> 
                <option>10AM</option>
              	<option>11AM</option> 
                <option>12PM</option>
              	<option>1PM</option> 
                <option>2PM</option>
              	<option>3PM</option> 
                <option>4PM</option> 
                <option>5PM</option>
              	<option>6PM</option> 
                <option>7PM</option>
                <option>8PM</option>
              	<option>9PM</option> 
                <option>10PM</option>
              	<option>11PM</option>                                                                               	            	              	
              </select>
              </TD>
           </TR>                                             
           <TR>
              <TD COLSPAN="3"><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD COLSPAN="3" CLASS="bodyText" HEIGHT="15" VALIGN="middle" BGCOLOR="#CCCCCC"><b>End Time</b></TD>
           </TR>                        
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Month&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>January</option>
              	<option>February</option>
              	<option>March</option>
              	<option>April</option>
              	<option>May</option>
              	<option>June</option>
              	<option>July</option>
              	<option>August</option>              	
              	<option>September</option>
              	<option>October</option>
              	<option>November</option>
              	<option>December</option>              	              	
              </select>
              </TD>
           </TR>                                
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Day&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>Sunday</option>
              	<option>Monday</option>
              	<option>Tuesday</option>
              	<option>Wednesday</option>
              	<option>Thursday</option>
              	<option>Friday</option>
              	<option>Saturday</option>             	              	
              </select>
              </TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Year&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>2002</option>
              	<option>2003</option>             	              	
              </select>
              </TD>
           </TR> 
           <TR>
              <TD CLASS="bodyText" ALIGN="right" VALIGN="middle">Hour&#160;</TD>
              <TD CLASS="bodyText" ALIGN="left" VALIGN="middle" COLSPAN="2">          
              <select value ="">
              	<option>12AM</option>
              	<option>1AM</option> 
                <option>2AM</option>
              	<option>3AM</option> 
                <option>4AM</option> 
                <option>5AM</option>
              	<option>6AM</option> 
                <option>7AM</option>
                <option>8AM</option>
              	<option>9AM</option> 
                <option>10AM</option>
              	<option>11AM</option> 
                <option>12PM</option>
              	<option>1PM</option> 
                <option>2PM</option>
              	<option>3PM</option> 
                <option>4PM</option> 
                <option>5PM</option>
              	<option>6PM</option> 
                <option>7PM</option>
                <option>8PM</option>
              	<option>9PM</option> 
                <option>10PM</option>
              	<option>11PM</option>                                                                               	            	              	
              </select>
              </TD>
           </TR>                 
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"></TD><TD COLSPAN="2" class="errorText" align="left" valign="middle"></TD>
           </TR>
         </TABLE>       
         
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="90%">                   
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>	        
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send candidate email reminder&#160;<input type="checkbox">&#160;</TD>	       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText">Send me email reminder&#160;<input type="checkbox">&#160;</TD>	       
	        </TR>
	        <TR>
		       <TD VALIGN="middle" HEIGHT="15" CLASS="bodyText"> To preview the email template <A HREF="JavaScript:getEmail('/eval/email_preview.jsp','600','500')" CLASS="bodyText">click here</A>.</TD>	       
	        </TR>	        	        	        
           <TR>
              <TD><IMG SRC="/i/ev/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
           </TR>
           <TR>
              <TD ALIGN="center"><A HREF="/eval/sess_setup_confirm.jsp" CLASS="bodyText">Save</A></TD>
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
