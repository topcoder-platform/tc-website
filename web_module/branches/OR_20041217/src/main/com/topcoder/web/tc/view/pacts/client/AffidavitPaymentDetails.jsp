<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
   <meta name="GENERATOR" content="Mozilla/4.77 [en] (X11; U; Linux 2.4.16 i686) [Netscape]">
</head>
<body text="#000000" bgcolor="#666666" link="#0000EF" vlink="#59188E" alink="#FF0000">

<jsp:include page="MemberHeader.jsp" flush="true" />
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%

    AffidavitPayment aPay=null;
    try {
        aPay = (AffidavitPayment) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	out.println("We caught an exception " + e);
	aPay = null;
    }
    
    if(aPay!=null) {

	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(17,2);

	// fill in the data
	// row 0
	tableData.setElement(0,0,"Description");
	tableData.setElement(0,1,aPay._affidavit._header._description);

	// row 1
	tableData.setElement(1,0,"Affidavit Affirmation");
	Vector vec = new Vector();
	vec.clear();
	String str = (aPay._affidavit._header._affirmed) ? 
		  "click to see affidavit" : "click to affirm";
	vec.add(new String(PactsConstants.AFFIDAVIT_ID + "=" + 
	            aPay._affidavit._header._id));

	String href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.AFFIDAVIT_TASK, 
	            PactsConstants.AFFIDAVIT_DETAILS_CMD, str);
	tableData.setElement(0,1,href);

	//row 2
	tableData.setElement(2,0,"Payment Description");
	tableData.setElement(2,1,aPay._payment._header._description);

	//row 3
	tableData.setElement(3,0,"Date Processed");
	tableData.setElement(3,1,aPay._payment._payDate);

	//row 4
	tableData.setElement(4,0,"Date Printed");
	tableData.setElement(4,1,aPay._payment._printDate);

	//row 5
	tableData.setElement(5,0,"Amount Awarded");
	tableData.setElement(5,1,new String(aPay._payment._grossAmount+""));

	//row 6
	tableData.setElement(6,0,"Amount Paid");
	tableData.setElement(6,1,new String(aPay._payment._netAmount+""));

	//row 7
	tableData.setElement(7,0,"Handle");
	tableData.setElement(7,1,new String(aPay._affidavit._header._user._id+""));

	//row 8
	tableData.setElement(8,0,"Last Name");
	tableData.setElement(8,1,aPay._paymentAddress._lastName);

	//row 9
	tableData.setElement(9,0,"First Name");
	tableData.setElement(9,1,aPay._paymentAddress._firstName);

	//row 10
	tableData.setElement(10,0,"Middle Name");
	tableData.setElement(8,1,aPay._paymentAddress._middleName);
	
	//row 11
	tableData.setElement(11,0,"Address 1");
	tableData.setElement(11,1,aPay._paymentAddress._address1);

	//row 12
	tableData.setElement(12,0,"Address 2");
	tableData.setElement(12,1,aPay._paymentAddress._address2);

	//row 13
	tableData.setElement(13,0,"City");
	tableData.setElement(13,1,aPay._paymentAddress._city);

	//row 14
	tableData.setElement(14,0,"State");
	tableData.setElement(14,1,aPay._paymentAddress._state);

	//row 15
	tableData.setElement(15,0,"Zip");
	tableData.setElement(15,1,new String(aPay._paymentAddress._zip+""));

	//row 16
	tableData.setElement(16,0,"Country");
	tableData.setElement(16,1,aPay._paymentAddress._country);

	
	PactsHtmlTable table = new PactsHtmlTable(tableData);
	table.setBgcolor("\"#FFFFFF\"");
	table.setCellSpacing("0");
	table.setCellPadding("3");
	table.setBorder("1");
	table.setFontSize("+1");
	out.print(table.getHtml());
    } else {
	
%>

did not get affidavit

<%  }
%>

this is an affidavit
</body>
</html>
