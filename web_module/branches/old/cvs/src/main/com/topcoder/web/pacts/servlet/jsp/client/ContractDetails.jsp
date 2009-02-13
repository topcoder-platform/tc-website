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
<%@ page import="com.topcoder.web.pacts.common.*" %>

<%

    ContractWithText c = null;
    try {
        c = (ContractWithText) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	// there must have been a type problem
	c = null;    
	System.out.println("We got excepted");
    }

    if(c!=null) {
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(7,2);

	//row 0
	tableData.setElement(0,0,"Contract Name");
	tableData.setElement(0,1, c.contract._header._name);

	//row 1
	tableData.setElement(1,0,"Description");
	tableData.setElement(1,1, c.contract._description);

	//row 2
	tableData.setElement(2,0,"Inception Date");
	tableData.setElement(2,1, c.contract._header._creationDate);

	//row 3
	tableData.setElement(3,0,"Start Date");
	tableData.setElement(3,1, c.contract._startDate);

	//row 4
	tableData.setElement(4,0,"End Date");
	tableData.setElement(4,1, c.contract._endDate);
	
	//row 5
	tableData.setElement(5,0,"Status");
	tableData.setElement(5,1, c.contract._header._statusDesc);
		
	// row 6
	// payment
	tableData.setElement(6,0,"Payments");
	java.util.Vector vec = new Vector();
        vec.clear();
	String str = new String("details");
	vec.add(new String(PactsConstants.CONTRACT_ID + "=" +
	            c.contract._header._id));
	String href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.CONTRACT_TASK, 
	            PactsConstants.CONTRACT_PAYMENT_SUMMARY_CMD, str);
	tableData.setElement(6,1,href);

	

	PactsHtmlTable table = new PactsHtmlTable(tableData);
	table.setBgcolor("\"#FFFFFF\"");
	table.setCellSpacing("0");
	table.setCellPadding("3");
	table.setBorder("1");
	table.setRowColor(0,"\"#C0C0C0\"");	
	table.setFontSize("0");
	table.setRowBold(0,true);
	out.print(table.getHtml());

	out.print("<p><b>Contract Text:</b></p><p>" + c.text + "</p>");

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
