<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 com.topcoder.web.common.BaseProcessor,
                 java.util.HashMap" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Add Assignment Document</title>
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

function doSearch(mustSearch, firstLoad) {
    var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectAssignmentDocumentTypeReference');
    
    if (mustSearch) {
        ajaxRequest.addNamedFormElements("search_text");
        ajaxRequest.addNamedFormElements("search_list");
    }
    ajaxRequest.addNamedFormElements("assignment_document_type_id");
    
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}


    function validateRemote() {
        var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=ValidateAssignmentDocument');
        ajaxRequest.addNamedFormElements("search_list");
        ajaxRequest.addNamedFormElements("submission_title");

        ajaxRequest.setPostRequest(afterRequest);
        
        ajaxRequest.sendRequest();
    }

    function send() {
        if (validateLocal()) {
            validateRemote()
        }
    }

    function afterRequest()
    {
        if (document.f.doSend.value == "true") {
            document.f.submit();
        }
    }

    function validateLocal()
    {
        return true;
    }


 function typeChanged() {
 doSearch(false, false)
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

 function loading() {
    toggleDiv("loading", 1);
}

function loaded() {
    toggleDiv("loading", 0);
}

 function initialize() {
    toggleDiv("loading", 0);
}
 
 </script>
    
</head>
<body onLoad="initialize()">
<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Loading...</font></b>
</p>
</div>



<c:set var="defaultTypeId" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("assignment_document_type_id")) %>" />
<c:set var="defaultStatusId" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("assignment_document_status_id")) %>" />
<c:set var="reference_id" value="<%= new Long((String)((HashMap) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("reference_id")) %>" />



<h1>PACTS</h1>
<c:choose>
    <c:when test="${assignment_document_id > 0}">
        <h2>Update Assignment Document</h2>
    </c:when>
    <c:otherwise>
        <h2>Add Assignment Document</h2>
    </c:otherwise>
</c:choose>

<form name='f' action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_ID%>" value="${assignment_document_id}"/>
  <input type="hidden" name="module" value="AddAssignmentDocument"/>

        <table cellpadding="5" cellspacing="5" border="0">
        <tr id="errorsTr">
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="error">
                    <font color="#FF0000"><%=err%></font><br/>
                </tc-webtag:errorIterator>
            </td>
        </tr>
        <tr>
            <td><b>User</b></td>
            <td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>          
        </tr>
        <tr>        
            <td><b>Type:</b></td>
            <td>
                <SELECT CLASS="dropdown" NAME="assignment_document_type_id" onChange="typeChanged()">
                    <c:forEach items="${assignment_document_type_list}" var="typeItem">
                        <OPTION value='${typeItem.id}' <c:if test="${typeItem.id == defaultTypeId}">selected</c:if>>
                            ${typeItem.description}
                        </OPTION>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
        <tr id="selectReference">
            <c:if test="${not empty reference_description}">    
                <td><b>Reference:</b></td>      
                <td><c:out value="${reference_description}" />
                <c:choose>
                    <c:when test="${assignment_document_id > 0}">
                        <input type="hidden" name="search_list" value="${reference_id}"/>
                        <input type="button" value="change" onClick="typeChanged()" />
                    </c:when>
                    <c:otherwise>
                        <input type="text" name="search_text"/>
                        <input type="button" value="search" onClick="doSearch(true, false)" />
                    </c:otherwise>
                </c:choose>
                </td>
            </c:if>
        </tr>
        <tr>        
            <td><b>Submission title:</b></td>
            <td>
                <tc-webtag:textInput name="submission_title" id="submission_title" editable="true" /> 
            </td>
        </tr>
        <tr>        
            <td><b>Status:</b></td>
            <td>
                <SELECT CLASS="dropdown" NAME="assignment_document_status_id">
                    <c:forEach items="${assignment_document_status_list}" var="statusItem">
                        <OPTION value='${statusItem.id}' <c:if test="${statusItem.id == defaultStatusId}">selected</c:if>>
                            ${statusItem.description}
                        </OPTION>
                    </c:forEach>
                </SELECT>
            </td>
        </tr>
        <c:if test="${assignment_document_id == 0}">
            <tr>
                <td><b>Text:</b>
                </td>
                <td>        
                    <br/>
                    <tc-webtag:textArea name="assignment_document_text" rows="10" cols="70"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td><b>Hard Copy:</b>
            </td>
            <td>        
                <br/>
                <tc-webtag:chkBox name="assignment_document_hard_copy"/>
            </td>
        </tr>
        <tr>
            <td><b>Expiration Date:</b></td><td>
            <tc-webtag:textInput name="expire_date" id="expire_date" size="12" editable="true" /> 
                <button id="trigger_expire_date">Set</button> If left empty it is set to current date + <%=PactsConstants.ASSIGNMENT_DOCUMENT_SHORT_EXPIRATION_PERIOD%> (has hard copy) or current date + <%=PactsConstants.ASSIGNMENT_DOCUMENT_LONG_EXPIRATION_PERIOD%> days (no hard copy)
            </td>            
        </tr>       
        <tr>
            <td><b>Affirmed Date:</b></td><td>
            <tc-webtag:textInput name="affirmed_date" id="affirmed_date" size="12" editable="true" /> 
                <button id="trigger_affirmed_date">Set</button> (set to current date if left empty and status is affirmed)
            </td>            
        </tr>       
</table>

<script language="javascript" type="text/javascript">
Calendar.setup(
{
 inputField  : "expire_date",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_expire_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
Calendar.setup(
{
 inputField  : "affirmed_date",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_affirmed_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
</script>

<input type="button" value="Save Assignment Document" OnClick="send()">

<div id="runJS">
    <input type="hidden" id="doSend" name="doSend" value="false"/>
</div>

</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
