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
<jsp:include page="/style.jsp">
   <jsp:param name="key" value="tc_main"/>
</jsp:include>
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
            <jsp:param name="node" value="my_topcoder"/>
         </jsp:include>
       </TD>
       <TD WIDTH="4" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
        <jsp:include page="/body_top.jsp" >
           <jsp:param name="image" value="pacts"/>
           <jsp:param name="image1" value="steelblue"/>
           <jsp:param name="title" value="Contract Detail"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 java.util.Vector" %>

<%

    ContractWithText c = null;
        c = (ContractWithText)
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);

    if(c!=null) {
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(7,2);

	//row 0
	tableData.setElement(0,0,"Contract Name");
	tableData.setElement(0,1, c.getContract().getHeader().getName());

	//row 1
	tableData.setElement(1,0,"Description");
	tableData.setElement(1,1, c.getContract().getDescription());

	//row 2
	tableData.setElement(2,0,"Inception Date");
	tableData.setElement(2,1, c.getContract().getHeader().getCreationDate());

	//row 3
	tableData.setElement(3,0,"Start Date");
	tableData.setElement(3,1, c.getContract().getStartDate());

	//row 4
	tableData.setElement(4,0,"End Date");
	tableData.setElement(4,1, c.getContract().getEndDate());

	//row 5
	tableData.setElement(5,0,"Status");
	tableData.setElement(5,1, c.getContract().getHeader().getStatusDesc());

	// row 6
	// payment
	tableData.setElement(6,0,"Payments");
	java.util.Vector vec = new Vector();
        vec.clear();
	String str = new String("details");
	vec.add(new String(PactsConstants.CONTRACT_ID + "=" +
	            c.getContract().getHeader().getId()));
	String href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.CONTRACT_TASK,
	            PactsConstants.CONTRACT_PAYMENT_SUMMARY_CMD, str, "statText");
	tableData.setElement(6,1,href);



	PactsHtmlTable table = new PactsHtmlTable(tableData);
 	table.setBgcolor("\"#001935\"");
 	table.setCellSpacing("1");
 	table.setCellPadding("2");
 	table.setBorder("0");
 	table.setWidth("100%");
 	table.setColumnWidth(0, "40%");
 	table.setColumnWidth(1, "60%");
 	table.setRowColor(0,"\"#093158\"");
 	table.setClassName("statText");
 	table.setRowBold(0,true);

	out.print(table.getHtml());


	out.print("<p><b>Contract Text:</b></p><p>" + c.getText()+ "</p>");

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
