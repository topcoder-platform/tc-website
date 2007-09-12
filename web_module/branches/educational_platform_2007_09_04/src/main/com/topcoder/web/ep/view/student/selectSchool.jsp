<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Login</title>

<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function doSearch() {
    var ajaxRequest = new AjaxRequest('/ep?module=SchoolSearch');
    
    ajaxRequest.addNamedFormElements("search_text");
    
    ajaxRequest.setPostRequest(toggleDiv("searching", 0));
    ajaxRequest.setPreRequest(toggleDiv("searching", 1));    
    ajaxRequest.sendRequest();
}

 
 function toggleDiv(divId, state) 
{
    if(document.layers)   
    {
       document.layers[divId].visibility = state ? "show" : "hide";
    }
    else if(document.getElementById)
    {
        document.getElementById(divId).style.visibility = state ? "visible" : "hidden";
    }
    else if(document.all)
    {
        document.all[divId].style.visibility = state ? "visible" : "hidden";
    }
}

 function initialize() {
    toggleDiv("searching", 0);
}
 
 </script>
</head>
<body onLoad="initialize()">
    <div align="center">
        <span class="subtitle">School Search</span>
        <br><br>

        <strong>School Name:</strong><br>
        <c:set value="<%=Constants.SCHOOL_NAME%>" var="schoolName"/>
        <tc-webtag:errorIterator id="err" name="${schoolName}"><%=err%><br></tc-webtag:errorIterator>
        <tc-webtag:textInput name="${schoolName}" size="50" maxlength="<%=Constants.MAX_SCHOOL_NAME_LENGTH%>" editable="true"/>
        <A href="javascript:doSearch();">Search</A>
        <br>
        Use * for a wildcard character
        <br><br>

        <div id="searching">
        <p>
        <b><font color="#FF0000" size="+1">Searching...</font></b>
        </p>
        </div>

        <div id="results">
        </div>
    </div>
</body>
</html>