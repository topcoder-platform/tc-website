<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set var="defaultStatusId" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("assignment_document_status_id")) %>" />

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add Assignment Document v2.0</title>
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
</head>
<body>


<h1>PACTS</h1>
<h2>Add Assignment Document v2.0</h2>

<form name='f' action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="AddGlobalADSubmit"/>
        <table cellpadding="5" cellspacing="5" border="0">
        <tr>
            <td><b>User</b></td>
            <td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>          
        </tr>
        <tr>        
            <td><b>Assignment Document v2.0 template:</b></td>
            <td>
                <SELECT CLASS="dropdown" NAME="assignment_document_template_id">
                    <c:forEach items="${assignment_document_template_list}" var="templateItem">
                        <OPTION value='${templateItem.id}' <c:if test="${templateItem.current}">selected="selected"</c:if>>
                            ${templateItem.name}
                        </OPTION>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
</table>

<input type="submit" value="Save Assignment Document v2.0">

</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
