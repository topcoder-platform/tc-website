<%@ page
        language="java"
        import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                com.topcoder.web.codinginterface.longcontest.Constants,
                com.topcoder.web.common.StringUtils"

        %>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="com.topcoder.web.common.BaseProcessor"%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<%@ taglib uri="codinginterface.tld" prefix="ci" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<tc-webtag:useBean id="languages" name="<%=Constants.LANGUAGES%>" type="java.util.List" toScope="page" />
<% int roundType = request.getAttribute(Constants.ROUND_TYPE_ID) == null ? Constants.LONG_ROUND_TYPE_ID : ((Integer) request.getAttribute(Constants.ROUND_TYPE_ID)).intValue();%>
<% String level2 = "topcoder";
    String image = "long_comps_topcoder";
    if (roundType == Constants.LONG_PRACTICE_ROUND_TYPE_ID) {
        level2 = "topcoder_practice";
    } else if (roundType == Constants.INTEL_LONG_PRACTICE_ROUND_TYPE_ID) {
        level2 = "intel_practice";
        image = "long_comps_intel";
    } else if (roundType == Constants.INTEL_LONG_ROUND_TYPE_ID) {
        level2 = "intel";
        image = "long_comps_intel";
    }

    HashMap defaults = (HashMap) pageContext.getRequest().getAttribute(BaseProcessor.DEFAULTS_KEY);
    String lang = (String)defaults.get(Constants.LANGUAGE_ID);
%>

<html>
<head>
    <title>Submit - <%=request.getAttribute(Constants.CLASS_NAME)%></title>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
    <LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<STYLE TYPE="text/css">
.codeTextArea,.messageTextArea,
{
font-family: Courier;
font-size: 12px;
}
.messageTextArea
{
color: FF0000;
}
</STYLE>

</head>

<body>
<script language="javascript">
    function submit() {
        document.codingForm.<%=Constants.ACTION_KEY%>.value = "submit";
        document.codingForm.submit();
    }
    function save() {
        document.codingForm.<%=Constants.ACTION_KEY%>.value = "save";
        document.codingForm.submit();
    }
    function openWin(url, name) {
        var w = screen.availWidth * 2 / 3;
        var h = screen.availHeight / 2;
        var left = Math.round((screen.availWidth - w) / 2);
        var top = Math.round((screen.availHeight - h) / 2);
        win = window.open(url, name, "scrollbars=yes,toolbar=no,resizable=yes,menubar=no"
                + ",width=" + w + ",height=" + h
                + ",left=" + left + ",top=" + top);
        win.location.href = url;
        win.focus();
    }
</script>
<jsp:include page="top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<%-- Left Column Begins--%>
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="level1" value="long_contests"/>
        <jsp:param name="level2" value="<%=level2%>"/>
    </jsp:include>
</td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD class="statTableSpacer" width="100%" valign="top">

    <jsp:include page="page_title.jsp">
        <jsp:param name="image" value="<%=image%>"/>
        <jsp:param name="title" value="Coding Area"/>
    </jsp:include>

    <div align="center">
    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method="POST" name="codingForm">
        <input type="hidden" name="<%=Constants.MODULE%>" value="<%=Constants.RP_SUBMIT%>">
        <input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
        <input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
        <input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
        <input type="hidden" name="<%=Constants.ACTION_KEY%>" value="">
      <table cellpadding="0" cellspacing="0" border="0" class="bodyText">
         <tr>
            <td valign="top">
              <span class="bodyTitle">Coding Area</span><br>
               <strong>Problem Name: <%=request.getAttribute(Constants.CLASS_NAME)%></strong><br>
              <A href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>&popup=false<%=(lang!=null?"&lid="+lang:"")%>" class="statLink">Problem
                  Statement</A>
              (<A href="Javascript:openWin('<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewProblemStatement&<%=Constants.ROUND_ID%>=<%=request.getParameter(Constants.ROUND_ID)%>&<%=Constants.COMPONENT_ID%>=<%=request.getParameter(Constants.COMPONENT_ID)%>&popup=true<%=(lang!=null?"&lid="+lang:"")%>', 'Problem Statement');"  class="statLink">new window</A>)
            </td>
            <td align="right" valign="top">Choose your language:<br>
                <tc-webtag:listIterator id="language" listKey="languages" type="com.topcoder.shared.language.Language">
                  <tc-webtag:radioButton name="<%=Constants.LANGUAGE_ID%>" value="<%=String.valueOf(language.getId())%>" />&#160;<jsp:getProperty name="language" property="name"/>&#160;
                </tc-webtag:listIterator>
            </td>
         </tr>
         <tr>
            <td valign="top" colspan="2">
            <textarea cols="70" rows="4" name="methods" class="codeTextArea" wrap="off" readonly><%
ArrayList methodNames = (ArrayList)request.getAttribute(Constants.METHOD_NAME);
ArrayList returnTypes = (ArrayList)request.getAttribute(Constants.RETURN_TYPE);
ArrayList paramTypes = (ArrayList)request.getAttribute(Constants.ARG_TYPES);

for (int i=0; i<methodNames.size(); i++) {
%>Method Name: <%=methodNames.get(i)%>
Return Type: <%=StringUtils.htmlEncode((String)returnTypes.get(i))%>
Arg Types: <%=StringUtils.htmlEncode((String)paramTypes.get(i))%>

<% } %></textarea>
            </td>
         </tr>
         <tr>
            <td colspan="2">
               <span class="bodySubtitle">Submission</span><br>
               <%if (request.getAttribute(Constants.CODE) == null || request.getAttribute(Constants.CODE).toString().equals("")) {%>
               <textarea cols="70" rows="20" name="code" class="codeTextArea" wrap="off"></textarea>
               <%} else {%>
               <textarea cols="70" rows="20" name="code" class="codeTextArea" wrap="off"><%=request.getAttribute(Constants.CODE)%></textarea>

               <%}%>
            </td>
         </tr>
         <tr>
            <td colspan="2">
<span class="bodySubtitle">Messages</span><br>
<textarea cols="70" rows="5" name="messages" class="messageTextArea" wrap="off" readonly><%=(request.getAttribute(Constants.MESSAGE) != null ? "" + request.getAttribute(Constants.MESSAGE) : "")%></textarea>
            </td>
         </tr>
         <tr>
            <td>
              <div style="float:left; padding: 5px 5px 0px 0px;">
                  <ci:sponsorImage image="<%=Constants.SPONSOR_IMAGE%>" alt="Sponsor" border="0" ifNull="&#160;"/>
              </div>
            </td>
            <td align="right" valign="top">
              <div style="float:right; padding: 5px 0px 0px 5px;">
                  <A href="javascript: submit();"><img src="/i/interface/btn_submit.gif" alt="Submit" border="0"/></A>
              </div>

              <div style="float:right; padding: 5px 0px 0px 5px;">
                  <A href="javascript: save();"><img src="/i/interface/btn_save.gif" alt="Save" border="0"/></A>
              </div>
            </td>
         </tr>
      </table>
    </form>
        </div>
    <br/><br/>
</td>

<%-- Right Column Begins --%>
<td width="170">
    <jsp:include page="public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<%-- Right Column Ends --%>

<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
</tr>
</table>

<jsp:include page="foot.jsp"/>
</body>
</html>
