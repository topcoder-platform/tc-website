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

    TaxFormWithText taxForm = null;
    try {
        taxForm = (TaxFormWithText) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	// there must have been a type problem
	taxForm = null;    
	System.out.println("We got excepted");
    }

    if(taxForm!=null) {
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(2,3);

	//set up the table title row
	tableData.setElement(0,0,"Tax Form");
	tableData.setElement(0,1,"Date Filed");
	if(taxForm.taxForm._usePercentage) {
	    tableData.setElement(0,2,"Witholding %");
	    tableData.setElement(1,2,taxForm.taxForm._withholdingPercentage + "");
	} else {
	    tableData.setElement(0,2,"Witholding Amt");
            tableData.setElement(1,2,taxForm.taxForm._withholdingAmount + "");	
	}

	// name
	tableData.setElement(1,0,taxForm.taxForm._header._name);
	    
	// date filed
	tableData.setElement(1,1,taxForm.taxForm._header._dateFiled);


	out.print("<p><b>Text:</b></p><p>" + taxForm.text + "</p>");
	out.print("<p></p><p><b>Description:</b></p><p>" + 
		taxForm.taxForm._description + "</p>");
	

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
