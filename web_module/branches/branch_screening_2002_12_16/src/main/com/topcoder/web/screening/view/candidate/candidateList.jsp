<%@ page errorPage="/errorPage.jsp" %>
<%@ taglib uri="screening.tld" prefix="screen" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<HTML>
<HEAD>
<TITLE>TopCoder - Candidate Evaluation</TITLE>
<jsp:include page="script.jsp"/>
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
      <TD VALIGN="top"><screen:img page="/ev/clear.gif" width="10" height="1" /></TD>
        <!-- Gutter Ends -->
        <!-- Body Area -->
      <TD CLASS="bodyText" width="100%" valign="top"><screen:img page="/ev/clear.gif" width="400" height="1" vspace="5" border="0" /><BR>
<FONT SIZE="3" COLOR="#666666"><B>Candidate List</B></FONT><BR/>                 
<P>
		       Lorem ipsum dolor sit amet, consectetuer adipiscing elit, sed diam nonummy nibh euismod tincidunt 
		       ut laoreet dolore magna aliquam erat volutpat. Ut wisi enim adminim veniam, quis nostrud exerci. 
</P><BR>       
         <TABLE BORDER="0" CELLSPACING="1" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">                   
           <TR>
              <TD COLSPAN="7"><screen:img page="/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="7" ALIGN="center"><screen:link page="/screening?rp=CandidateSetup" styleClass="bodyText">Add Candidate</screen:link></TD>
           </TR>
           <TR>
              <TD COLSPAN="7"><screen:img page="/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>           	        
	        <TR>
		       <TD VALIGN="middle" COLSPAN="2" ALIGN="center" HEIGHT="15" CLASS="statText" BGCOLOR="#999999"><B>&#160;Email Address</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="statText" BGCOLOR="#999999"><B>&#160;Profile</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="statText" BGCOLOR="#999999"><B>&#160;Begin</B></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="statText" BGCOLOR="#999999"><B>&#160;End</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="statText" BGCOLOR="#999999"><B>&#160;Status</B></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="statText" BGCOLOR="#999999"><B>&#160;Notes</B></TD>		       		       	        
	        </TR>
           <TR>
              <TD COLSPAN="8"><screen:img page="/ev/clear.gif" width="1" height="1" border="0" /></TD>
           </TR>	        
            <jsp:useBean id="list" type="java.util.List" scope="request" />
            <screen:resultSetRowIterator id="row" list="<%=list%>">
	        <TR>
   <% 
    String linkUrl = "/screening?rp=CandidateSetup&candidateId=" + row.getItem("user_id");
    %>
		       <TD VALIGN="middle" ALIGN="center" HEIGHT="15" CLASS="bodyText">&#160;<screen:link page="<%=linkUrl%>" styleClass="bodyText">Edit</screen:link></TD>
		       <TD VALIGN="middle" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="address" /></TD>		       
		       <TD VALIGN="middle" CLASS="bodyText">&#160;<screen:link page="/screening?rp=testResults" styleClass="bodyText">See Results</screen:link></TD>       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="begin_time" /></TD>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:resultSetItem row="<%=row%>" name="end_time" /></TD>		       
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;In Progress...</TD>
   <% 
    linkUrl = "/screening?rp=NoteList&candidateId=" + row.getItem("user_id");
    %>
		       <TD VALIGN="middle" ALIGN="center" CLASS="bodyText">&#160;<screen:link page="<%=linkUrl%>" styleClass="bodyText">View</screen:link></TD>		       		       	        
	        </TR>
            </screen:resultSetRowIterator>
           <TR>
              <TD COLSPAN="7"><screen:img page="/ev/clear.gif" width="1" height="10" border="0" /></TD>
           </TR>
           <TR>
              <TD COLSPAN="7" ALIGN="center"><screen:link page="/screening?rp=candidateSetup" styleClass="bodyText">Add Candidate</screen:link></TD>
           </TR>
         </TABLE>
<P><BR/></P>    
     </TD>
<!-- Body Area Ends -->
      <!-- Gutter -->
      <TD WIDTH="10"><screen:img page="/ev/clear.gif" width="10" height="1" border="0" /></TD>
      <!-- Gutter Ends -->
   </TR>
</TABLE>
  <!-- Body Ends -->

  <jsp:include page="includes/foot.jsp"/>

</BODY>
</HTML>
