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
         <%@ include file="/pacts/client/Pacts_left.jsp" %>
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="pacts"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Payment Detail"/>  
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<!-- <jsp:include page="MemberHeader.jsp" flush="true" /> -->
<%@ page import="com.topcoder.web.pacts.common.*" %>

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
	tableData.setElement(0,1,payment._header._user._handle);

	// row 1
	tableData.setElement(1,0,"Description");
	tableData.setElement(1,1,payment._header._description);

	// row 2
	tableData.setElement(2,0,"Status");
	tableData.setElement(2,1,payment._statusDesc);

	// row 3
	tableData.setElement(3,0,"Net Amount");
	DecimalFormat decf = new DecimalFormat("0.00");
	tableData.setElement(3,1,"$" + decf.format(payment._netAmount));

	// row 4
	tableData.setElement(4,0,"Gross Amount");	
	tableData.setElement(4,1,"$" + decf.format(payment._grossAmount));

	// row 5
	tableData.setElement(5,0,"Date");
	tableData.setElement(5,1,payment._payDate);


	PactsHtmlTable table = new PactsHtmlTable(tableData);
 	table.setBgcolor("\"#001935\"");
 	table.setCellSpacing("2");
 	table.setCellPadding("2");
 	table.setBorder("0");
 	table.setWidth("100%");	
 	table.setColumnWidth(0, "40%");
 	table.setColumnWidth(1, "60%");				
 	table.setRowColor(0,"\"#093158\"");	
 	table.setClassName("statText");
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
