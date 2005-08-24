<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ page import="com.topcoder.web.corp.common.Constants,
                 com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<HTML>
<HEAD>
<title>Topcoder&#160;&#160;|&#160;&#160;Technical Assessment Application Management Tool</title>
<jsp:include page="../includes/script.jsp"/>
</HEAD>

<jsp:useBean id="submissionInfo" class="com.topcoder.web.corp.model.SubmissionInfo" scope="request"/>

<body>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr><td colspan="3" class="globalNavSmall"><img src="/i/corp/clear.gif" width="1" height="15" border="0"/></td></tr>

    <tr>
        <td width="15"><a name="top"></a><img src="/i/corp/clear.gif" width="15" height="1" alt="" border="0"></td>
        <td width="206"><img src="/i/corp/logo_testing.gif" width="206" height="49" border="0" alt="TopCoder Technical Assessment Application" vspace="13"></TD>
        <td width="100%"><img src="/i/corp/clear.gif" width="1" height="1" alt="" border="0"></td>
    </tr>

    <tr><td colspan="3" class="testTop"><img src="/i/corp/clear.gif" width="1" height="18" border="0"/></td></tr>
</table>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- gutter begins -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- gutter ends -->

<!-- Middle column begins -->
        <td width="50%"></td>
        <td align="center"><img src="/i/corp/clear.gif" width="700" height="11" alt="" border="0"><br>
            <table border="0" cellspacing="0" cellpadding="0" width="50%">
                <tr valign="top">
                    <td class="bodyText">
            <h1 class="testHead">Top TopCoder Problem Results</h1>
            <P>Below are the submitted code and system test results for the one of the highest TopCoder point-getters.</P>
                    </td>
                </tr>
            </table>

         <p></p>

         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD CLASS="testTableTitle">&#160;Code:</TD>
           </TR>
           <TR>
              <TD CLASS="bodyText" VALIGN="top">
              <%--this should really get plugged into the formatter object --%>
              <PRE><%=StringUtils.htmlEncode(submissionInfo.getCode())%></PRE>
              </TD>
           </TR>
         </table>

         <p></p>

         <table cellspacing="1" cellpadding="3" width="100%" class="testFrame">
           <TR>
              <TD COLSPAN="3" CLASS="testTableTitle"><B>System Test</B></TD>
           </TR>
	        <TR>
		       <TD ALIGN="center" CLASS="testFormHeader" >Args</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Expected</TD>
		       <TD ALIGN="center" CLASS="testFormHeader">Status</TD>
	        </TR>
            <% boolean even = false; %>
           <rsc:iterator id="testResult" list="<%= submissionInfo.getTestResults() %>">
	        <TR>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><rsc:item row="<%=testResult%>" name="args" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>"><rsc:item row="<%=testResult%>" name="expected_result" /></TD>
		       <TD ALIGN="center" CLASS="<%=even?"testTableEven":"testTableOdd"%>">
                       <%if(!testResult.getStringItem("status").equals("Succeeded")) {%>
                            <span class=bigRed>FAILED - Result:&#160;&#160;&#160;&#160;<rsc:item row="<%=testResult%>" name="received" /></span>
                       <% } else { %>
                            <rsc:item row="<%=testResult%>" name="status" />
                        <% } %>
		       </TD>
	        </TR>
            <% even = !even;%>
           </rsc:iterator>
         </table>
            <p><br></p>
        </td>
        <td width="50%"></td>
<!-- Middle Column ends -->

<!-- Gutter -->
        <td width="25"><img src="/i/corp/clear.gif" width="25" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

    </tr>
</table>

  <jsp:include page="/foot.jsp" />

</body>
</html>
