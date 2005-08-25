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
           <jsp:param name="title" value="Tax Forms"/>
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<BR/>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>


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
	    str = taxForms[i-1].getName();
	    vec.add(new String(PactsConstants.TAX_FORM_ID + "=" +
	            taxForms[i-1].getId()));

	    href = PactsHtmlHelpers.createPactsHtmlHref(
	            PactsConstants.MEMBER_SERVLET_URL,
	            vec, PactsConstants.TAX_FORM_TASK,
	            PactsConstants.TAX_FORM_DETAILS_CMD, str, "statText");
	    tableData.setElement(i,0,href);

	    // date filed
	    tableData.setElement(i,1,taxForms[i-1].getDateFiled());

	}

	PactsHtmlTable table = new PactsHtmlTable(tableData);
 	table.setBgcolor("\"#001935\"");
 	table.setCellSpacing("2");
 	table.setCellPadding("2");
 	table.setBorder("0");
 	table.setWidth("100%");
 	table.setColumnWidth(0, "50%");
 	table.setColumnWidth(1, "50%");
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

