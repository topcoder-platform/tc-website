<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Select school</title>

<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function submitEnter(e) {
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    if (keycode == 13) {
        doSearch();
        return false;
    } else return true;
}

function doSearch() {
    var ajaxRequest = new AjaxRequest('/ep?module=ComponentSearch');
    
    ajaxRequest.addNamedFormElements("cn");
    
    ajaxRequest.setPreRequest(preSearchRequest);    
    ajaxRequest.setPostRequest(postSearchRequest);
    ajaxRequest.sendRequest();
}

function preSearchRequest()
{
    toggleDiv("searching", 1);
}

function postSearchRequest()
{
    toggleDiv("searching", 0)
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
<body onLoad="initialize()" >
    <div id="addedComponets">&nbsp;</div>
    <div >
        <span class="subtitle">School Components</span>
        <br><br>

        <strong>Component Name:</strong><br>
        <c:set value="<%=Constants.COMPONENT_NAME%>" var="componentName"/>
        <tc-webtag:errorIterator id="err" name="${componentName}"><%=err%><br></tc-webtag:errorIterator>
        <tc-webtag:textInput onKeyPress="submitEnter(event)" name="${componentName}" size="50" maxlength="<%=Constants.MAX_COMPONENT_NAME_LENGTH%>" editable="true"/>
        <A href="javascript:doSearch();">Search</A>
        <br>
        Use * for a wildcard character
        <div id="searching">
        <p>
        <b><font color="#FF0000" size="+1">Searching...</font></b>
        </p>
        </div>
        <div id="adding">
        <p>
        <b><font color="#FF0000" size="+1">adding...</font></b>
        </p>
        </div>
        <div id="removing">
        <p>
        <b><font color="#FF0000" size="+1">removing...</font></b>
        </p>
        </div>
    </div>
    <div id="results">&nbsp;</div>
</body>
</html>