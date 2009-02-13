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

    PaymentHeader[] payments = null;
    try {
        payments = (PaymentHeader []) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	// there must have been a type problem
	payments = null;    
	System.out.println("We got excepted");
    }

    if(payments!=null) {
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(
	                                        payments.length+1,4);

	//set up the table title row
	tableData.setElement(0,0,"Description");
	tableData.setElement(0,1,"Net Payment Amount");
	tableData.setElement(0,2,"Type of Payment");
	tableData.setElement(0,3,"Status");

	// fill in the data
	String href;
	String str;
	java.util.Vector vec = new java.util.Vector();
	for(int i=1;i<=payments.length;i++) {
	    // the payment desc
	    tableData.setElement(i,0,payments[i-1]._description);

	    // the net payment amount
	    vec.clear();
	    str = payments[i-1]._recentNetAmount + "";
	    vec.add(new String(PactsConstants.PAYMENT_ID + "=" + 
	            payments[i-1]._id));

	    // you can send it to the generic payment details, it will forward
            // if there is a special case
	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.PAYMENT_TASK, 
	            PactsConstants.PAYMENT_DETAILS_CMD, str);
	    tableData.setElement(i,1,href);
	    
	    // the type of payment
	    tableData.setElement(i,2,payments[i-1]._type);

	    // payment status
	    tableData.setElement(i,3,payments[i-1]._recentStatus);
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
