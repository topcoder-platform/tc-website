<%@  page
  language="java"
  import="java.util.*,
          com.topcoder.web.codinginterface.longcontest.*,
          com.topcoder.shared.dataAccess.resultSet.*"

%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="struts-logic.tld" prefix="logic" %>
<html>
<head>
<title>Submit - <%=request.getSession().getAttribute(Constants.CLASS_NAME)%></title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
</head>
<body>
<jsp:include page="top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="level1" value="home"/>
                <jsp:param name="level2" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">

<jsp:include page="page_title.jsp" >
<jsp:param name="image" value="long_competitions"/>
<jsp:param name="title" value="Coding Area"/>
</jsp:include>
<%
    Boolean stat = ((Boolean)request.getSession().getAttribute(Constants.COMPILE_STATUS));
    String error = ((String)request.getSession().getAttribute(Constants.COMPILE_MESSAGE));
    String status = "";
    if(stat != null){
        status = stat.booleanValue()?"Your code compile successfully.":"Your code did not compile successfully.";
    }else{
        error = "";
    }
    int checked = ((Integer)request.getSession().getAttribute(Constants.SELECTED_LANGUAGE)).intValue();
    ResultSetContainer langs = (ResultSetContainer)request.getSession().getAttribute(Constants.LANGUAGES);
%>

<%=status%><br/>
<%=error%>
<form action="/longcontest/longcontest?module=Submit" method="POST">
<input type="hidden" name="<%=Constants.ROUND_ID%>" value="<%=request.getParameter(Constants.ROUND_ID)%>">
<input type="hidden" name="<%=Constants.CONTEST_ID%>" value="<%=request.getParameter(Constants.CONTEST_ID)%>">
<input type="hidden" name="<%=Constants.COMPONENT_ID%>" value="<%=request.getParameter(Constants.COMPONENT_ID)%>">
<rsc:iterator list="<%=langs%>" id="resultRow">
<input type="radio" <%=resultRow.getIntItem("language_id") == checked ? "checked ":""%>
name="<%=Constants.LANGUAGE_ID%>" value="<%=resultRow.getIntItem("language_id")%>"><%=resultRow.getStringItem("language_name")%><br/>
</rsc:iterator>
<input type="submit"/>
<textarea size=100 name="code">
<%=request.getSession().getAttribute(Constants.CODE)%>
</textarea>
</form>
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

<jsp:include page="foot.jsp" />
</body>
</html>
<%
    request.getSession().removeAttribute(Constants.COMPILE_STATUS);
    request.getSession().removeAttribute(Constants.COMPILE_MESSAGE);
    request.getSession().removeAttribute(Constants.SELECTED_LANGUAGE);
    request.getSession().removeAttribute(Constants.CODE);
    request.getSession().removeAttribute(Constants.LANGUAGES);
    request.getSession().removeAttribute(Constants.CLASS_NAME);
%>
