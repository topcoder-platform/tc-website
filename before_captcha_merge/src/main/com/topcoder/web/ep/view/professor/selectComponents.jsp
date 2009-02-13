<%@ page import="com.topcoder.web.ep.Constants" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
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
    var ajaxRequest = new AjaxRequest('/education?module=AddComponent&cd=' + componentId);
    
    ajaxRequest.setPreRequest(preAddRequest);    
    ajaxRequest.setPostRequest(postAddRequest);
    ajaxRequest.sendRequest();
}

function removeComponent(componentId) {
    var ajaxRequest = new AjaxRequest('/education?module=RemoveComponent&cd=' + componentId);
    
    ajaxRequest.setPreRequest(preRemRequest);    
    ajaxRequest.setPostRequest(postRemRequest);
    ajaxRequest.sendRequest();
}

function doSearch() {
    var ajaxRequest = new AjaxRequest('/education?module=ComponentSearch');
    
    ajaxRequest.addNamedFormElements("cn");
    
    ajaxRequest.setPreRequest(preSearchRequest);    
    ajaxRequest.setPostRequest(postSearchRequest);
    ajaxRequest.sendRequest();
}

function submit() {
    var myForm = document.f;
    myForm.submit();
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
            <form name="f" action="${sessionInfo.servletPath}" method="post">
                <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="EditAssignmentConfirm"/>
                <tc-webtag:errorIterator id="err" name="actionError">
                    <font color="#FF0000"><%=err%></font><br/>
                </tc-webtag:errorIterator>
                <c:choose>
                    <c:when test="${fn:length(ea_assignment.components)==0}">
                        <span class="bigRed">You don't have problems assigned.</span><br/><br/>
                    </c:when>
                    <c:otherwise>
                        <strong>Assigned problems</strong><br/>
                        <table border="1"> 
                        <tr><td>Name</td><td>Points</td><td>&nbsp;</td></tr>
                        <c:forEach items="${ea_assignment.components}" var="component">
                            <tr><td><c:out value="${component.problemName}"/></td>
                            <td><tc-webtag:textInput name="points_${component.componentId}" value="${component.points}" size="5" editable="true" /></td>
                            <td><a href="javascript:removeComponent(${component.componentId});">Remove</a></td></tr>
                        </c:forEach>
                        </table>
                        
                        Note: if you leave points field empty, problem's default points will be used.
                    </c:otherwise>
                </c:choose>
                <br/>
                <p>
                    <a href="javascript:submit()" class="button" style="width: 60px; margin-right: 10px;">Continue</a>
                </p>
            </form>            
        </div>
    <br/>
    <div id="main">
        <br>
        <strong>Problem Name:</strong><br>
        <c:set value="<%=Constants.COMPONENT_NAME%>" var="componentName"/>
        <tc-webtag:textInput onKeyPress="submitEnter(event)" name="${componentName}" size="50" maxlength="<%=Constants.MAX_COMPONENT_NAME_LENGTH%>" editable="true"/>
        <A href="javascript:doSearch();">Search</A>
        <br>
        Use * for a wildcard character
        <div id="searching">
        <b><font color="#FF0000" size="+1">Searching...</font></b>
        </div>
        <div id="adding">
        <b><font color="#FF0000" size="+1">Adding...</font></b>
        </div>
        <div id="removing">
        <b><font color="#FF0000" size="+1">Removing...</font></b>
        </div>
    </div>
    <div id="results">&nbsp;</div>
</body>
</html>