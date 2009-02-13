<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page
  language="java"
%>

<HTML>
<HEAD>
<TITLE>TopCoder - PACTs</TITLE>
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
            <jsp:param name="node" value="affidavits"/>
         </jsp:include>
       </TD>
<!-- Center Column Begins -->
         <td class="affidavitCell" width="100%" align="center" valign=top>

        <jsp:include page="../../page_title.jsp" >
            <jsp:param name="image" value="pact_s"/>
            <jsp:param name="title" value="Affidavits"/>
        </jsp:include>

<p class="bigRed" align="left">Learn <A href="/tc?module=Static&d1=help&d2=getPaid&node=algo_get_paid" class="bigRed">How to Get Paid</A> from TopCoder for your competition winnings.</p>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
   <TR>
      <TD CLASS="affidavitText" COLSPAN="2">
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,java.util.*,java.text.*,com.topcoder.shared.util.ApplicationServer" %>

<%
    Affidavit[] affidavits = null;
       affidavits = (Affidavit[])
       request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
       
    Payment[] payments = null;
       payments = (Payment[])
       request.getAttribute(PactsConstants.PAYMENT_DETAIL_LIST);
       
    Map componentIdMap = (Map)request.getAttribute(PactsConstants.COMPONENT_DATA);
    
    String[] paymentCreationDates = (String[])request.getAttribute(PactsConstants.CREATION_DATE_LIST);

	String fullList = request.getParameter("full_list");
	String href = new String("");
	String desc = new String("");
	String str = new String("");
	java.util.Vector vec = new java.util.Vector();

    if(affidavits!=null || payments!=null) {
	   out.print("<p>");
	   if (fullList == null) {
	   	  desc = "This page displays pending affidavits and payments. ";
	   	  str = "(View all)";
	      vec.add(new String("full_list=true"));
	   } else {
	   	  desc = "This page displays all affidavits and payments. ";
	   	  str = "(View pending)";
	   }
	   href = PactsHtmlHelpers.createPactsHtmlHref(
               PactsConstants.MEMBER_SERVLET_URL,
               vec, PactsConstants.AFFIDAVIT_TASK,
               PactsConstants.AFFIDAVIT_HISTORY_CMD, str, "bodyText");
	   out.print(desc);
	   out.print(href);
	   out.print("</p><p></p>");
	}
	
	PactsMemberTableModel tableData = null;
	PactsHtmlTable table = null;
	if (affidavits != null) {
	   // build the affidavit table
	   tableData = new PactsMemberTableModel(affidavits.length+1,6);
	
	   //set up the table title row
	   tableData.setElement(0,0,"Affidavit Description");
	   tableData.setElement(0,1,"Affidavit Affirmation");
	   tableData.setElement(0,2,"Net Payment Amount");
	   tableData.setElement(0,3,"Notarized");
	   tableData.setElement(0,4,"Status");
	   if (fullList != null) {
	   	   tableData.setElement(0,5,"Date Paid");
	   }
	
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
	        if (affidavits[i-1].getPayment().getId()<1) {
	            vec.add("");
	            href = "";
	        } else {
	            DecimalFormat decf = new DecimalFormat("0.00");
	            str = "$" + decf.format(affidavits[i-1].getPayment().getRecentNetAmount());
	            vec.add(new String(PactsConstants.PAYMENT_ID + "=" +
	                    affidavits[i-1].getPayment().getId()));
	            href = PactsHtmlHelpers.createPactsHtmlHref(
	                    PactsConstants.MEMBER_SERVLET_URL,
	                    vec, PactsConstants.PAYMENT_TASK,
	                    PactsConstants.PAYMENT_DETAILS_CMD, str, "bodyText");
	        }
	       tableData.setElement(i,2,href);
	
	       // notarized
	       str = (affidavits[i-1].getHeader().isNotarized()) ? "yes" : "no";
	       tableData.setElement(i,3,str);
	
	       // status
	       tableData.setElement(i,4,affidavits[i-1].getHeader().getStatusDesc());
	
		   // date paid
		   if (fullList != null && affidavits[i-1].getPayDate() != null && !affidavits[i-1].getPayDate().equals("00/00/0000")) {
		   		tableData.setElement(i,5,affidavits[i-1].getPayDate());
		   }
	   }
    }
%>

<table BGCOLOR="#FFFFFF" CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100%>
	<tr>
		<td class="bodyText" width="35%"><b>Affidavit Description</b></td>
		<td class="bodyText" width="20%"><b>Affidavit Affirmation</b></td>
		<td class="bodyText" width="15%"><b>Net Payment Amount</b></td>
		<td class="bodyText" width="10%"><b>Notarized</b></td>
		<td class="bodyText" width="10%"><b>Status</b></td>
		<td class="bodyText" width="10%"><b><% if (fullList != null) { %>Date Paid<% } %></b></td>
	</tr>
<%	if (affidavits != null) { %>
<%	for(int i=1;i<=affidavits.length;i++) { %>
	<tr>
		<td class="bodyText" width="35%"><%=tableData.getElement(i,0)%></td>
		<td class="bodyText" width="20%"><%=tableData.getElement(i,1)%></td>
		<td class="bodyText" width="15%"><%=tableData.getElement(i,2)%></td>
		<td class="bodyText" width="10%"><%=tableData.getElement(i,3)%></td>
		<td class="bodyText" width="10%"><%=tableData.getElement(i,4)%></td>
		<td class="bodyText" width="10%"><%	if (fullList != null) { %><%=tableData.getElement(i,5)%><% } %></td>
	</tr>
<%	} %>
<%	} %>
</table>
    
<P></P>    
    
<%    
    if(payments!=null) {
       // build the payment table
	   tableData = new PactsMemberTableModel(payments.length+1,5);
	
	   //set up the table title row
	   tableData.setElement(0,0,"Payment Description");
	   tableData.setElement(0,1,"Date Created");
	   tableData.setElement(0,2,"Net Payment Amount");
	   tableData.setElement(0,3,"Status");
	   if (fullList != null) {
	   	   tableData.setElement(0,4,"Date Paid");
	   }
	   
	   // fill in the data
	   for(int i=1;i<=payments.length;i++) {
	       // the description
	       String description = payments[i-1].getDescription();
	       if (description.indexOf(")") > -1) {
	       		description = description.substring(description.indexOf(")")+1).trim();
	       }
	       String componentId = "";
	       String projectId = String.valueOf(payments[i-1].getHeader().getProjectId());
	       if (componentIdMap.containsKey(projectId)) {
	       		componentId = (String)componentIdMap.get(projectId);
	       }
	       if (!componentId.equals("")) {
	       		String link = "<a href=\"http://"+ApplicationServer.SOFTWARE_SERVER_NAME+"/catalog/c_component.jsp?comp="+componentId+"&ver=1\">"+description+"</a>";
	       		tableData.setElement(i,0,link);
	       } else {
	       		tableData.setElement(i,0,description);
	       }
	      
	       // date created
	       tableData.setElement(i,1,paymentCreationDates[i-1]);
	      
	       // net amount
	       DecimalFormat decf = new DecimalFormat("0.00");
	       str = "$" + decf.format(payments[i-1].getNetAmount());
	       tableData.setElement(i,2,str);
	       
	       // status
	       tableData.setElement(i,3,payments[i-1].getStatusDesc());
	       
	       // date paid
		   if (fullList != null && payments[i-1].getPayDate() != null && !payments[i-1].getPayDate().equals("00/00/0000")) {
		   		tableData.setElement(i,4,payments[i-1].getPayDate());
		   }
	   }
	}
%>

<table BGCOLOR="#FFFFFF" CELLPADDING=2 CELLSPACING=2 BORDER=0 WIDTH=100%>
	<tr>
		<td class="bodyText" width="35%"><b>Payment Description</b></td>
		<td class="bodyText" width="20%"><b>Date Created</b></td>
		<td class="bodyText" width="25%"><b>Net Payment Amount</b></td>
		<td class="bodyText" width="10%"><b>Status</b></td>
		<td class="bodyText" width="10%"><% if (fullList != null) { %><b>Date Paid</b><% } %></td>
	</tr>
<%	if (payments != null) { %>
<%	for(int i=1;i<=payments.length;i++) { %>
	<tr>
		<td class="bodyText" width="35%"><%=tableData.getElement(i,0)%></td>
		<td class="bodyText" width="20%"><%=tableData.getElement(i,1)%></td>
		<td class="bodyText" width="25%"><%=tableData.getElement(i,2)%></td>
		<td class="bodyText" width="10%"><%=tableData.getElement(i,3)%></td>
		<td class="bodyText" width="10%"><% if (fullList != null) { %><%=tableData.getElement(i,4)%><% } %></td>
	</tr>
<%	} %>
<%	} %>
</table>

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

