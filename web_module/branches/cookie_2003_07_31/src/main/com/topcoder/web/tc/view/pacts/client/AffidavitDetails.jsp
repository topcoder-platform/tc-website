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
 <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
   <jsp:include page="../../top.jsp" />
   <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
     <TR>
       <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
         <jsp:include page="../../includes/global_left.jsp" />
       </TD>
       <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"></TD>
       <TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="240" HEIGHT="1" VSPACE="5" BORDER="0"><BR/>
        <jsp:include page="/body_top.jsp" >  
           <jsp:param name="image" value="pacts"/>  
           <jsp:param name="image1" value="steelblue"/>  
           <jsp:param name="title" value="Affidavit Detail"/>  
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<!-- <jsp:include page="MemberHeader.jsp" flush="true" /> -->
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%

    AffidavitWithText a=null;
    try {
        a = (AffidavitWithText) 
	    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
	out.println("We caught an exception " + e);
	a = null;
    }
    
    if(a!=null) {
	if(!a.affidavit._header._affirmed) {	
%>

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

<p><a href=PactsMemberServlet?t=affidavit&c=render_affidavit&affidavit_id=<%

out.print(new String(a.affidavit._header._id + ""));

%>>click here for a printer friendly version of the affidavit</a></p>

<%
	}
	
	// check the state
	if(!a.canAffirmOnline) {
		out.print("<p>" + a.affidavitText + "</p>");
	
		out.print("<b><p>You cannot affirm this affidavit online, please " +
			"answer all demographic questions and make sure you have " +
			"mailed in an affidavit that has been notarized.  Also, make sure you have filled out a tax form and mailed it in (see the links above). </p></b>");
	} else {
		if(!a.affidavit._header._affirmed) {
a.affidavitText = new String("<form action=PactsMemberServlet?t=affidavit&c=affirm_affidavit  method=post>") + a.affidavitText;
			if(a.payment._country.equals("India")) {
				int idx = a.affidavitText.indexOf("FILL IN AGED");
				a.affidavitText = a.affidavitText.substring(0,idx) + "<input type=\"text\" name=\"aged\" size=15 maxlength=15>" + a.affidavitText.substring(idx+(new String("FILL IN AGED")).length());
				idx = a.affidavitText.indexOf("FILL IN BELOW");
				a.affidavitText = a.affidavitText.substring(0,idx) + "<input type=\"text\" name=\"family_name\" size=25 maxlength=25>" + a.affidavitText.substring(idx+(new String("FILL IN BELOW")).length());
			}
out.print("<p>" + a.affidavitText + "</p>");
out.print("<center><table><tr><td class=\"statText\">");
out.print("<input type=hidden name=" + PactsConstants.AFFIDAVIT_ID);
out.print(" value=" + a.affidavit._header._id + ">");
if(a.affidavit._birthday.length() <= 0) {
	out.print("Enter your birthday (MM/dd/YYYY): <input type=\"text\" name=\"date_of_birth\" size=15 maxlength=15>");
} 
out.print("<input type=\"submit\" value=\"affirm affidavit\">");
out.print("</form>");
out.print("</td><td>");
out.print("<form action=PactsMemberServlet?t=edit_personal_info method=post>");
out.print("<input type=\"submit\" value=\"Edit Personal Information\">");
out.print("</form>");
out.print("</td></tr></table></center>");
 		} else {
			out.print("<p>" + a.affidavitText + "</p>");
		}
	}

    } else {
	
%>

did not get affidavit

<%  }
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
         <jsp:include page="/public_right.jsp" />
       </TD>
    <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->       
     </TR>
   </TABLE>
   <jsp:include page="/foot.jsp" /> 
 </BODY>
</HTML>
