<!doctype html public "-//w3c//dtd html 4.0 transitional//en">

<%@ page language="java"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

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
   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" >
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
            <jsp:param name="title" value="Affidavit Details"/>
        </jsp:include>

         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
            <TR>
               <TD CLASS="affidavitText" COLSPAN="2" VALIGN="top" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>



<%

    AffidavitWithText a=null;
        a = (AffidavitWithText)
       request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);

    if(a!=null) {
   if(!a.getAffidavit().getHeader().isAffirmed()) {
%>

<P class="bodyText"><B>Prize Payment Requirements:</B><P>
<p class="bigRed">Learn <A href="/tc?module=Static&d1=help&d2=algPayment" class="bigRed">How to Get Paid</A> from TopCoder for your algorithm winnings.</p>

<% if (!a.hasNotarizedAffidavit()||a.canAffirmOnline()) { %>
<p><a href="PactsMemberServlet?t=affidavit&c=render_affidavit&affidavit_id=<%=a.getAffidavit().getHeader().getId()%>">click here for a printer friendly version of the affidavit</a></p>
<% } %>
<% }
   if(!a.canAffirmOnline()) { %>
        <b><p>
          You cannot affirm this affidavit online for the following reason(s):
          <ul>
      <% if (!a.hasNotarizedAffidavit()) { %>
        <li>You do not have a notarized affidavit on file.</li>
      <% } else if (!a.hasTaxForm()) { %>
        <li>You do not have a tax form on file.</li>
      <% } else if (!a.hasAllDemographicAnswers()) { %>
        <li>Your demographic answers are incomplete.</li>
      <% } else if (a.getAffidavit().getDaysLeftToAffirm()<=0) { %>
        <li>This affidavit has expired.</li>
      <% } %>

      </ul>
        </p></b>
<%
   } else {
      if(!a.getAffidavit().getHeader().isAffirmed()) {
a.setAffidavitText(new String("<form action=PactsMemberServlet?t=affidavit&c=affirm_affidavit  method=post>") + a.getAffidavitText());

         if(a.getPayment().getCountry().equals("India")) {
            int idx = a.getAffidavitText().indexOf("FILL IN AGED");
                if (idx>=0)
                a.setAffidavitText(a.getAffidavitText().substring(0,idx) + "<input type=\"text\" name=\"aged\" size=15 maxlength=15>" + a.getAffidavitText().substring(idx+(new String("FILL IN AGED")).length()));
            idx = a.getAffidavitText().indexOf("FILL IN BELOW");
                if (idx>=0)
                a.setAffidavitText(a.getAffidavitText().substring(0,idx) + "<input type=\"text\" name=\"family_name\" size=25 maxlength=25>" + a.getAffidavitText().substring(idx+(new String("FILL IN BELOW")).length()));
         }

out.print("<p>" + a.getAffidavitText() + "</p>");
out.print("<center><table><tr><td class=\"bodyText\">");
out.print("<input type=hidden name=" + PactsConstants.AFFIDAVIT_ID);
out.print(" value=" + a.getAffidavit().getHeader().getId()+ ">");
if(a.getAffidavit().getBirthday().length() <= 0) {
   out.print("Enter your birthday (MM/dd/YYYY): <input type=\"text\" name=\"date_of_birth\" size=15 maxlength=15>");
}
out.print("<input type=\"submit\" value=\"affirm affidavit\">");
out.print("</form>");
out.print("</td><td>");
%><form action="/Registration"><%
out.print("<input type=\"submit\" value=\"Edit Personal Information\">");
out.print("</form>");
out.print("</td></tr></table></center>");
       } else {
         out.print("<p>" + a.getAffidavitText() + "</p>");
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
