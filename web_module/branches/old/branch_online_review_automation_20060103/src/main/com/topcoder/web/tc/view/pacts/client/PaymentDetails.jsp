<!doctype html public "-//w3c//dtd html 4.0 transitional//en">



<%@ page
  language="java"
  import="java.text.DecimalFormat"
%>

<HTML>
 <HEAD>
   <TITLE>TopCoder - PACTs</TITLE>
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
         <td class="affidavitCell" width="100%" align="center">

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Payment Details"/>
        </jsp:include>

         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
         	<TR>
         		<TD CLASS="affidavitText" COLSPAN="2" VALIGN="top" WIDTH="100%">
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%

    Payment payment=null;
    try {
        payment = (Payment)
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	out.println("We caught an exception " + e);
	payment = null;
    }

    if(payment!=null) {
	PactsMemberTableModel tableData = new PactsMemberTableModel(6,2);

	// fill in the data
	// row 0
	tableData.setElement(0,0,"handle");
	tableData.setElement(0,1,payment.getHeader().getUser().getHandle());

	// row 1
	tableData.setElement(1,0,"Description");
	tableData.setElement(1,1,payment.getHeader().getDescription());

	// row 2
	tableData.setElement(2,0,"Status");
	tableData.setElement(2,1,payment.getStatusDesc());

	// row 3
	tableData.setElement(3,0,"Net Amount");
	DecimalFormat decf = new DecimalFormat("0.00");
	tableData.setElement(3,1,"$" + decf.format(payment.getNetAmount()));

	// row 4
	tableData.setElement(4,0,"Gross Amount");
	tableData.setElement(4,1,"$" + decf.format(payment.getGrossAmount()));

	// row 5
	tableData.setElement(5,0,"Date");
	tableData.setElement(5,1,payment.getPayDate());


	PactsHtmlTable table = new PactsHtmlTable(tableData);
 	table.setBgcolor("\"#FFFFFF\"");
 	table.setCellSpacing("2");
 	table.setCellPadding("2");
 	table.setBorder("0");
 	table.setWidth("100%");
 	table.setColumnWidth(0, "40%");
 	table.setColumnWidth(1, "60%");
 	table.setRowColor(0,"\"#093158\"");
 	table.setClassName("bodyText");
 	table.setRowBold(0,true);

	out.print(table.getHtml());
    } else {
%>
no payment info
<%
    }
%>


         <P><BR/></P>
         		</TD>
         	</TR>
         </TABLE>
       </TD>
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
