<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>

<html>

<head>
    <title>TopCoder - PACTs</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script type="text/javascript">
    <!--
    function goTo(selection){
      sel = selection.options[selection.selectedIndex].value;
      if (sel && sel != '#'){
        window.location=sel;
      }
    }
    // -->
    </script>
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="affidavits"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">

            <jsp:include page="../../page_title.jsp" >
                <jsp:param name="image" value="pact_s"/>
                <jsp:param name="title" value="Affidavit Details"/>
            </jsp:include>

<div style="width: 700px;" align="left">
<%

    AffidavitWithText a=null;
        a = (AffidavitWithText)
       request.getAttribute(PactsConstants.PACTS_MEMBER_RESULT);

    if(a!=null) {
   if(!a.getAffidavit().getHeader().isAffirmed()) {
%>

<p><strong>Prize Payment Requirements:</strong></p>
<p class="bigRed">Learn <a href="/wiki/display/tc/How+to+Get+Paid+for+Competing" class="bigRed">How to Get Paid</a> from TopCoder for your algorithm competition winnings.</p>

<% if (!a.hasNotarizedAffidavit()||a.canAffirmOnline()) { %>
<p><a href="PactsMemberServlet?t=affidavit&amp;c=render_affidavit&amp;affidavit_id=<%=a.getAffidavit().getHeader().getId()%>">click here for a printer friendly version of the affidavit</a></p>
<% } %>
<% }
   if(!a.canAffirmOnline()) { %>
        <strong><p>
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
        </p></strong>
<%
   } else {
      if(!a.getAffidavit().getHeader().isAffirmed()) {

         if(a.getPayment().getCountry().equals("India")) {
            int idx = a.getAffidavitText().indexOf("FILL IN AGED");
                if (idx>=0)
                a.setAffidavitText(a.getAffidavitText().substring(0,idx) + "<input type=\"text\" name=\"aged\" size=\"15\" maxlength=\"15\" />" + a.getAffidavitText().substring(idx+(new String("FILL IN AGED")).length()));
            idx = a.getAffidavitText().indexOf("FILL IN BELOW");
                if (idx>=0)
                a.setAffidavitText(a.getAffidavitText().substring(0,idx) + "<input type=\"text\" name=\"family_name\" size=\"25\" maxlength=\"25\" />" + a.getAffidavitText().substring(idx+(new String("FILL IN BELOW")).length()));
         }
%>

    <form action="PactsMemberServlet"  method="post">
          <p>
              <%=a.getAffidavitText()%>
              </p>
        <div align="center">
            <input type="hidden" name="<%=PactsConstants.AFFIDAVIT_ID%>" value="<%=a.getAffidavit().getHeader().getId()%>"/>
            <input type="hidden" name="<%=PactsConstants.TASK_STRING%>" value="affidavit"/>
            <input type="hidden" name="<%=PactsConstants.CMD_STRING%>" value="affirm_affidavit"/>
            <%if(a.getAffidavit().getBirthday().length() <= 0) {%>
            enter your birthday (mm/dd/yyyy): <input type="text" name="date_of_birth" size="15" maxlength="15" />
            <% }%>
            <input type="submit" value="affirm affidavit" />
            <br /><br />
            <a href="/reg/?nrg=false">Edit Personal Information</a>
        </div>
        </form>
    <% } else {%>
         <p><%=a.getAffidavitText()%></p>
    <% }
   }
    } else {
%>
did not get affidavit
<%  }%>
</div>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>