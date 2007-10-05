<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.common.BaseServlet" %>
<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

function addComponent(componentId) {
    var ajaxRequest = new AjaxRequest('/ep?module=AddComponent&cid=' + componentId);
    
    ajaxRequest.setPreRequest(preAddRequest);    
    ajaxRequest.setPostRequest(postAddRequest);
    ajaxRequest.sendRequest();
}

function removeComponent(componentId) {
    var ajaxRequest = new AjaxRequest('/ep?module=RemoveComponent&cid=' + componentId);
    
    ajaxRequest.setPreRequest(preRemRequest);    
    ajaxRequest.setPostRequest(postRemRequest);
    ajaxRequest.sendRequest();
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
 
function preAddRequest()
{
    toggleDiv("adding", 1);
}

function postAddRequest()
{
    toggleDiv("adding", 0)
}
 
function preRemRequest()
{
    toggleDiv("removing", 1);
}

function postRemRequest()
{
    toggleDiv("removing", 0)
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
    toggleDiv("adding", 0);
    toggleDiv("removing", 0);
}
 
 </script>
</head>
<body onLoad="initialize()" >
    <div id="addedComponents">
        <c:choose>
            <c:when test="${fn:length(assignment.components)==0}">
                <span class="bigRed">You don't have components assigned.</span><br/><br/>
            </c:when>
            <c:otherwise>
                <strong>Assigned components</strong><br/>
                <table>
                <tr><td>Id</td><td>&nbsp;</td></tr>
                <c:forEach items="${assignment.components}" var="component">
                    <tr><td><c:out value="${component}"/></td>
                    <td><A href="javascript:removeComponent(${component});">Remove</A></td></tr>
                </c:forEach>
                </table>
            </c:otherwise>
        </c:choose>
    </div>
    <br/>
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
        <b><font color="#FF0000" size="+1">Adding...</font></b>
        </p>
        </div>
        <div id="removing">
        <p>
        <b><font color="#FF0000" size="+1">Removing...</font></b>
        </p>
        </div>
    </div>
    <div id="results">&nbsp;</div>
</body>
</html>