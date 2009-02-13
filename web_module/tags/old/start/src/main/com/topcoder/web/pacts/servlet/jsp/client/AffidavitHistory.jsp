<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<%@ taglib uri="/WEB-INF/struts-bean.tld" prefix="bean" %>
<%@ taglib uri="/WEB-INF/struts-logic.tld" prefix="logic" %>
<HTML>
 <HEAD>
   <TITLE>TopCoder :: Statistics</TITLE>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
   <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<%@include file="baseHRef.jsp" %>   
   <%@ include file="/script.jsp" %>
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
   <%@ include file="/top.jsp" %>
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <%@ include file="left.jsp" %>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>


<jsp:include page="MemberHeader.jsp" flush="true" />
<%@ page import="com.topcoder.web.pacts.common.*,java.util.*,java.text.*" %>

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
	            PactsConstants.AFFIDAVIT_HISTORY_CMD, str);
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
	    tableData.setElement(i,0,affidavits[i-1]._description);

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
	            PactsConstants.AFFIDAVIT_DETAILS_CMD, str);
	    tableData.setElement(i,1,href);
	    
	    // payment
            vec.clear();
	    str = new String(affidavits[i-1]._payment._recentNetAmount + "");
	    vec.add(new String(PactsConstants.PAYMENT_ID + "=" +
	            affidavits[i-1]._payment._id));
	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.PAYMENT_TASK, 
	            PactsConstants.PAYMENT_DETAILS_CMD, str);
	    tableData.setElement(i,2,href);

	    // notarized
	    str = (affidavits[i-1]._header._notarized) ? "yes" : "no";
	    tableData.setElement(i,3,str);

	    // status
	    tableData.setElement(i,4,affidavits[i-1]._header._status);
	    
	}	

	PactsHtmlTable table = new PactsHtmlTable(tableData);
	table.setBgcolor("\"#FFFFFF\"");
	table.setCellSpacing("0");
	table.setCellPadding("3");
	table.setBorder("1");
	table.setRowColor(0,"\"#C0C0C0\"");	
	table.setFontSize("0");
	table.setRowBold(0,true);
	out.print(table.getHtml());
    }
%>


       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <%@ include file="/public_right.jsp" %>
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <%@ include file="/foot.jsp" %> 
 </BODY>
</HTML>

