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


<P><B>Prize Payment Requirements:</B><P>
All four requirements must be met for TopCoder to release payment.
                      <UL><LI><B>Valid member profile information.</B><BR>
We will mail the check to the address in your TopCoder profile,
so please make sure that this information is current.
                        </LI><LI><B>A Completed Affidavit of Eligibility, Liability, and Publicity Release.</B><BR>
You must fill out, sign, and return an affidavit of eligibility before we can pay out prize money.  The affidavit is a verification of your eligibility to participate in the match, 
as well as a publicity release.  The affidavit must be postmarked no later than 60 days after the competition date - otherwise, you forfeit your prize for this competition.
                        </LI><LI><B>
                              One notarized affidavit on file with TopCoder.
                            </B><BR>
    TopCoder requires all winners (both direct or through referral commissions) to have one notarized affidavit on file with TopCoder before the prize can be paid.  If you never had
 an affidavit notarized for TopCoder, you must do so for this Single Round Match before you will be paid.  You need only have one affidavit notarized.  <I>All subsequent winnings wi
ll be paid upon receipt of a signed TopCoder affidavit.</I></LI><LI><B>One completed tax form on file with TopCoder.</B><BR><A class="statText" href="/?t=support&amp;c=form_faq">TopCoder FAQ regarding these forms >></A><BR>
The <B>W-9 form</B> should be filled out by all U.S. Citizens, including U.S resident aliens.<BR><A class="statText" href="/contest/iw9.pdf">Click here for W-9 form instructions >></A><BR><A class="statText" href="/contest/fw9.pdf">Click here for the W-9 form >></A><BR>
The <B>W-8BEN form</B> should be filled out by all non-U.S. Citizens.<BR><A class="statText" href="/contest/iw8ben.pdf">Click here for W-8BEN form instructions >></A><BR><A class="statText" href="/contest/fw8ben.pdf">Click here for the W-8BEN form >></A><BR></LI></UL>
                      
                        
                    Mailing address for forms and affidavits:  TopCoder, 703 Hebron Avenue, Glastonbury, CT 06033

<p>Here are the tax forms currently on file:</p>

<%

    TaxFormHeader[] taxForms = null;
    try {
        taxForms = (TaxFormHeader []) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	// there must have been a type problem
	taxForms = null;    
	System.out.println("We got excepted");
    }

    if(taxForms!=null) {
	// build the table
	PactsMemberTableModel tableData = new PactsMemberTableModel(
	                                        taxForms.length+1,2);

	//set up the table title row
	tableData.setElement(0,0,"Tax Form");
	tableData.setElement(0,1,"Date Filed");

	// fill in the data
	String href;
	String str;
	java.util.Vector vec = new java.util.Vector();
	for(int i=1;i<=taxForms.length;i++) {
	    // the project name

	    vec.clear();
	    str = taxForms[i-1]._name;
	    vec.add(new String(PactsConstants.TAX_FORM_ID + "=" + 
	            taxForms[i-1]._id));

	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.TAX_FORM_TASK, 
	            PactsConstants.TAX_FORM_DETAILS_CMD, str);
	    tableData.setElement(i,0,href);
	    
	    // date filed
	    tableData.setElement(i,1,taxForms[i-1]._dateFiled);

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

