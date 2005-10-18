<!doctype html public "-//w3c//dtd html 4.0 transitional//en">


<%@ page
  language="java"
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
 <BODY>
   <jsp:include page="../../top.jsp" />
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
     <TR>
       <TD WIDTH="170" VALIGN="top">
	        <jsp:include page="/includes/global_left.jsp">
				<jsp:param name="level1" value="my_home"/>
				<jsp:param name="level2" value="pacts"/>
			</jsp:include>
       </TD>
       <TD WIDTH="4" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
        <jsp:include page="/body_top.jsp" >
           <jsp:param name="image" value="pacts"/>
           <jsp:param name="image1" value="steelblue"/>
           <jsp:param name="title" value="Payments"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,java.text.*" %>

<%

    PaymentHeader[] payments = null;
        payments = (PaymentHeader [])
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);

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
	    tableData.setElement(i,0,payments[i-1].getDescription());

	    // the net payment amount
	    vec.clear();
	    DecimalFormat decf = new DecimalFormat("0.00");
	    str = "$" + decf.format(payments[i-1].getRecentNetAmount());
	    vec.add(new String(PactsConstants.PAYMENT_ID + "=" +
	            payments[i-1].getId()));

	    // you can send it to the generic payment details, it will forward
            // if there is a special case
	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.PAYMENT_TASK,
	            PactsConstants.PAYMENT_DETAILS_CMD, str, "statText");
	    tableData.setElement(i,1,href);

	    // the type of payment
	    tableData.setElement(i,2,payments[i-1].getType());

	    // payment status
	    tableData.setElement(i,3,payments[i-1].getRecentStatus());
	}

	PactsHtmlTable table = new PactsHtmlTable(tableData);

 	table.setBgcolor("\"#001935\"");
 	table.setCellSpacing("2");
 	table.setCellPadding("2");
 	table.setBorder("0");
 	table.setWidth("100%");
 	table.setColumnWidth(0, "35%");
 	table.setColumnWidth(1, "30%");
 	table.setColumnWidth(2, "25%");
 	table.setColumnWidth(3, "10%");
 	table.setRowColor(0,"\"#093158\"");
 	table.setClassName("statText");
 	table.setRowBold(0,true);
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
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
	<TR>
		<TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" ><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD VALIGN="top" BACKGROUND="" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
	</TR>
</TABLE>
       </TD>
       <TD WIDTH="4" ><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"></TD>
       <TD WIDTH="170" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0">
         <jsp:include page="/public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" ><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
     </TR>
   </TABLE>
   <jsp:include page="/foot.jsp" />
 </BODY>
</HTML>
