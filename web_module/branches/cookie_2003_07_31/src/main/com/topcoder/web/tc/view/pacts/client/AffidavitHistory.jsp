<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<HTML>
 <HEAD>
   <TITLE>TopCoder :: P.A.C.T.s</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
   <jsp:include page="/script.jsp" />
<script language="JavaScript">
<!--
function goTo(selection){
  sel = selection.options[selection.selectedIndex].value;
  if (sel && sel != '#'){
    window.location=sel;
  }
}
// -->
</script>   
 </HEAD>
 <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
   <jsp:include page="../../top.jsp" />
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <jsp:include page="../../includes/global_left.jsp" />
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="statText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="pacts"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Affidavits"/>  
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<!-- <jsp:include page="MemberHeader.jsp" flush="true" /> -->
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,java.util.*,java.text.*" %>

<%
    Affidavit[] affidavits = null;
    try {
        affidavits = (Affidavit[]) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	// there must have been a type problem
	affidavits = null;    
	System.out.println("We got excepted");
    }

    if(affidavits!=null) {
	String href;
	String str = new String("");
	java.util.Vector vec = new java.util.Vector();

	String fullList = request.getParameter("full_list");
	out.print("<p>");
	if(fullList == null) {
		vec.add(new String("full_list=true"));
		str = "click here to see a complete list of affidavits";
	    	href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.AFFIDAVIT_TASK, 
	            PactsConstants.AFFIDAVIT_HISTORY_CMD, str, "statText");
		out.print(href);
	}
	out.print("</p>");
	
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(
	                                        affidavits.length+1,5);

	//set up the table title row
	tableData.setElement(0,0,"Description");
	tableData.setElement(0,1,"Affidavit Affirmation");
	tableData.setElement(0,2,"Net Payment Amount");
	tableData.setElement(0,3,"Notarized");
	tableData.setElement(0,4,"Status");

	// fill in the data
	for(int i=1;i<=affidavits.length;i++) {
	    // the description
	    tableData.setElement(i,0,affidavits[i-1]._header._description);

	    // affirmation
	    vec.clear();
	    if(affidavits[i-1]._header._affirmed) {
	        str = "affirmed on " + affidavits[i-1]._affirmationDate ;
	    } else if(affidavits[i-1]._daysLeftToAffirm>0) {
	      	str = "click to affirm, " + affidavits[i-1]._daysLeftToAffirm +  
	               " days left";
	    } else {
		str = "expired, click here to view";
	    }

	    vec.add(new String(PactsConstants.AFFIDAVIT_ID + "=" + 
	            affidavits[i-1]._header._id));

	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.AFFIDAVIT_TASK, 
	            PactsConstants.AFFIDAVIT_DETAILS_CMD, str, "statText");
	    tableData.setElement(i,1,href);
	    
	    // payment
            vec.clear();
	    DecimalFormat decf = new DecimalFormat("0.00");
	    str = "$" + decf.format(affidavits[i-1]._payment._recentNetAmount);
	    vec.add(new String(PactsConstants.PAYMENT_ID + "=" +
	            affidavits[i-1]._payment._id));
	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.PAYMENT_TASK, 
	            PactsConstants.PAYMENT_DETAILS_CMD, str, "statText");
	    tableData.setElement(i,2,href);

	    // notarized
	    str = (affidavits[i-1]._header._notarized) ? "yes" : "no";
	    tableData.setElement(i,3,str);

	    // status
	    tableData.setElement(i,4,affidavits[i-1]._header._status);
	    
	}	

	PactsHtmlTable table = new PactsHtmlTable(tableData);
	table.setBgcolor("\"#001935\"");
	table.setCellSpacing("2");
	table.setCellPadding("2");
	table.setBorder("0");
	table.setRowColor(0,"\"#093158\"");	
	table.setClassName("statText");
	table.setRowBold(0,true);	
    table.setWidth("100%");	
 	table.setColumnWidth(0, "35%");
 	table.setColumnWidth(1, "25%");
 	table.setColumnWidth(2, "20%");
 	table.setColumnWidth(3, "10%");
 	table.setColumnWidth(4, "10%");		
	out.print(table.getHtml());
    }
%>

<P><BR/></P>
		</TD>
		<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
	</TR>   	
	<TR>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>	
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
</TABLE>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <jsp:include page="/public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <jsp:include page="/foot.jsp" /> 
 </BODY>
</HTML>

