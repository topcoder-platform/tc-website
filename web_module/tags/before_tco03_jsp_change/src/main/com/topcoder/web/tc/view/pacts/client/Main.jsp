<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<%@ page 
  language="java"
  errorPage="/errorPage.jsp"
%>

<HTML>
 <HEAD>
   <TITLE>TopCoder :: PACTs</TITLE>
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
           <jsp:param name="title" value=""/>  
        </jsp:include>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statText" COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>

<!-- <jsp:include page="MemberHeader.jsp" flush="true" /> -->
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<%
    UserProfileHeader header = null;
    try {
        header = (UserProfileHeader) 
    request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);
    } catch (Exception e) {
  out.print("exception " + e);
  header = null;
    }
 
    if( header != null) {
  //we got it

    } else {
  out.print("must, keep, debugging, cant, go, on, any, longer");
    }
%>


<P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%" CLASS="statText">

TopCoder would like to introduce the Payment Affidavit Contract Tracking System (PACTs).  PACTs was developed by TopCoder members dpecora, milo and veredox.
The system is for:
<ul>
<li><b>Member online affidavit affirmation.</b></li>
<li><b>Affidavit, contract, payment and tax form tracking.</b></li>
</ul>

The PACTs navigation bar, located on the left side of this screen, navigates to the <b>Payments</b>, <b>Affidavits</b>, <b>Contracts</b> or <b>Tax Forms</b> information screens.
<br/>
<br/>
Payment Information
<br/>
<br/>
The Payment Information screen presents you with a historical list of payments, including a brief description, net payment amount, type of payment and status for each payment.  The "Net Payment Amount" is a hyperlink to additional details for that individual payment.
<br/>
<br/>

Member Affirmation and Information Verification
<br/>
<br/>
The Affidavit Information page is a list of current affidavits.  The list gives you a brief description, a link that will allow you to affirm the affidavit, a link that displays the net payment amount (linking to additional information on the affidavit payment), notarized status and status of the affidavit in the TopCoder System.  The notarized status of an affidavit is &quot;yes&quot; if TopCoder has received a notarized affidavit in the mail and &quot;no&quot; if TopCoder has not received a notarized copy of the affidavit in the mail.  Clicking the &quot;affirm affidavit link&quot; will display the Affidavit Detail screen, which includes the affidavit text.  From the Affidavit Detail screen you are allowed to:

<ul>
<li>Enter in your birthday.</li>
<li>Affirm the affidavit online.</li>
<li>Or be redirected to your member profile to update demographic information.</li>
<li>Select a &quot;printer friendly&quot; version of the affidavit.</li>
</ul>

In order to affirm affidavits online members must:
<ul>
<li>Mail in at least one notarized affidavit.</li>
<li>Mail in at least one tax form (instructions on the tax form that is applicable to you are located above the affidavit text).</li>
<li>Answer all demographic questions for your user profile.</li>
</ul>

Contract Information
<br/>
<br/>
By navigating to the Contract Information screen, you will be presented with a list of contracts you have with TopCoder.  From the Contract Information screen, you will be able to view a list of contracts, the creation date, status and click on a hyper link to all the payment information for that contract.
<br/>
<br/>

Tax Form
<br/>
<br/>
By navigating to the Tax Form Information screen, you will be presented with information on tax forms needed by TopCoder, links to download tax form pdfs and a list of tax forms that TopCoder currently have on file for you.
<br/>
<br/>

F.A.Q
<br/>
<br/>
<i>What does the number of days remaining count down mean on the Affidavit informational page?</i>
<br/>
<br/>
Members have 60 days to affirm their affidavit via online or through the mail.  After 60 days the affidavits expire and members are no longer able to collect payment.  The remaining day count down is a count down of how many days you have left before the affidavit expires.
<br/>
<br/>
<i>What happens after I affirm my affidavit online?</i>
<br/>
<br/>
The payment for the affidavit is then marked with a status of "owed" and payment will be rendered to you.
<br/>
<br/>
<br/>
<i>Why are some of my past affidavits and past payments marked as "See FAQ"?</i>
<br/>
<br/>
The PACTs system went online on Wednesday, May 15, 2002.  Affidavits, payments and other pertinent member information generated prior to May 15 was migrated into PACTs to give members the ability to view historical data.  Members do not have the ability to affirm affidavits online that were created prior to May 15, 2002 (all affidavits prior to SRM 88).  Members are still responsible for mailing in affidavits for competitions that took place prior to SRM 88.
<br/>
<br/>
<i>How do I print old affidavits?</i>
<br/>
<br/>
- Click the "Affidavits" navigation link in the upper left hand corner of this screen
<br/>
- Click the "click here to see a complete list of affidavits" link towards the top of the Affidavit List screen
<br/>
- The Affidavit List screen should then be populated with a historical list of your affidavits.  Click the "expired, click here to view" link to view the affidavit you want to print 
<br/>
- Click the "click here for a printer friendly version of the affidavit" to bring up a printable version of the affidavit
<br/>
<br/>
<i>If I affirm my affidavit online, do I still have to send in a paper copy?</i>
<br/>
<br/>
When you do affirm an affidavit online, you do not have to send in a paper copy.
<br/>
<br/>


If you have any questions, comments or concerns about the PACTs system, please email <A CLASS="statText" HREF="mailto:service@topcoder.com">service@topcoder.com</A>.



      <BR/>
      <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
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
