<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page
  language="java"
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
	        <jsp:include page="../../includes/global_left.jsp">
				<jsp:param name="level1" value="my_home"/>
				<jsp:param name="level2" value="pacts"/>
			</jsp:include>
       </TD>
<!-- Center Column Begins -->
         <td class="affidavitCell" width="100%" align="center" valign=top>

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Affidavits"/>
        </jsp:include>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
	<TR>
		<TD CLASS="affidavitText" COLSPAN="2">
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
	            PactsConstants.AFFIDAVIT_HISTORY_CMD, str, "bodyText");
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
	    tableData.setElement(i,0,affidavits[i-1].getHeader().getDescription());

	    // affirmation
	    vec.clear();
	    if(affidavits[i-1].getHeader().isAffirmed()) {
	        str = "affirmed on " + affidavits[i-1].getAffirmationDate() ;
	    } else if(affidavits[i-1].getDaysLeftToAffirm()>0) {
	      	str = "click to affirm, " + affidavits[i-1].getDaysLeftToAffirm() +
	               " days left";
	    } else {
		str = "expired, click here to view";
	    }

	    vec.add(new String(PactsConstants.AFFIDAVIT_ID + "=" +
	            affidavits[i-1].getHeader().getId()));

	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.AFFIDAVIT_TASK,
	            PactsConstants.AFFIDAVIT_DETAILS_CMD, str, "bodyText");
	    tableData.setElement(i,1,href);

	    // payment
            vec.clear();
	    DecimalFormat decf = new DecimalFormat("0.00");
	    str = "$" + decf.format(affidavits[i-1].getPayment().getRecentNetAmount());
	    vec.add(new String(PactsConstants.PAYMENT_ID + "=" +
	            affidavits[i-1].getPayment().getId()));
	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.PAYMENT_TASK,
	            PactsConstants.PAYMENT_DETAILS_CMD, str, "bodyText");
	    tableData.setElement(i,2,href);

	    // notarized
	    str = (affidavits[i-1].getHeader().isNotarized()) ? "yes" : "no";
	    tableData.setElement(i,3,str);

	    // status
	    tableData.setElement(i,4,affidavits[i-1].getHeader().getStatusDesc());

	}

	PactsHtmlTable table = new PactsHtmlTable(tableData);
	table.setBgcolor("\"#FFFFFF\"");
	table.setCellSpacing("2");
	table.setCellPadding("2");
	table.setBorder("0");
	table.setRowColor(0,"\"#093158\"");
	table.setClassName("bodyText");
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

