<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*" %>
<%@ page import="java.util.Map" %>
<%@ page import="com.topcoder.web.common.BaseProcessor" %>
<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set var="payment" value="<%= request.getAttribute(PactsConstants.PAYMENT) %>"/>
<c:set var="user" value="<%= request.getAttribute(PactsConstants.USER) %>"/>
<c:set var="contract" value="<%= request.getAttribute(PactsConstants.CONTRACT) %>"/>
<c:set var="hasContract" value="${not empty contract}" />
<c:set var="updating" value="${not empty payment}" />
<c:set var="adding" value="${empty payment}" />
<%--<c:set var="statusList" value="<%= request.getAttribute(PactsConstants.STATUS_CODE_LIST) %>" />--%>
<c:set var="typeList" value="<%= request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST) %>" />
<c:set var="methodList" value="<%= request.getAttribute(PactsConstants.PAYMENT_METHOD_LIST) %>" />
<c:set var="rationaleList" value="<%= request.getAttribute(PactsConstants.MODIFICATION_RATIONALE_LIST) %>" />


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<c:if test="${updating}">
    <title>Update Payment</title>
</c:if> 
<c:if test="${adding and not hasContract}">
    <title>Add Payment</title>
</c:if> 
<c:if test="${adding and hasContract}">
    <title>Add Contract Payment</title>
</c:if> 
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">

var roundUnknown = false;

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



function doSearch(text, mustSearch, firstLoad) {
	var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectPaymentTypeReference');
    
    document.f.search_text.value = text;
    document.f.round_unknown.value = roundUnknown; 
       
    ajaxRequest.addNamedFormElements("round_unknown");
    ajaxRequest.addNamedFormElements("payment_type_id");

    if (firstLoad) {
        ajaxRequest.addNamedFormElements("first_load");
    }

    if (mustSearch) {
        ajaxRequest.addNamedFormElements("search_text");
    }
    
    ajaxRequest.addNamedFormElements("reference_id");
    ajaxRequest.addNamedFormElements("client");    
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}



function displayAmounts() {
    var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=DisplayAmounts');
    ajaxRequest.addNamedFormElements("payment_type_id");
    ajaxRequest.addNamedFormElements("placed");
    ajaxRequest.addNamedFormElements("is_design");    
    ajaxRequest.addNamedFormElements("is_updating");    
    ajaxRequest.addNamedFormElements("total_amount");    
    ajaxRequest.addNamedFormElements("gross_amount");    
    ajaxRequest.addNamedFormElements("net_amount");        
    ajaxRequest.addNamedFormElements("installment_number");       
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);        
    ajaxRequest.sendRequest();
}

function typeChanged()
{
    document.f.reference_description.value = "";
    doSearch("", false, false);
    displayAmounts();
}

function setRoundUnknown(value){
   roundUnknown = value;
   typeChanged();   
}

function setDesign(value){
	document.ajaxFields.is_design.value = value;
	displayAmounts();	
}

function doReferenceChanged(refId) {
    var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=FillPaymentData');
    document.f.reference_id.value = refId;
    document.f.round_unknown.value = roundUnknown;    
    ajaxRequest.addNamedFormElements("round_unknown");
    
    ajaxRequest.addNamedFormElements("payment_type_id");
    ajaxRequest.addNamedFormElements("reference_id");
    ajaxRequest.addNamedFormElements("user_id");    
    
    ajaxRequest.addNamedFormElements("placed");    
    ajaxRequest.addNamedFormElements("installment_number");    
    
    ajaxRequest.setPostRequest(loaded);
    ajaxRequest.setPreRequest(loading);    
    ajaxRequest.sendRequest();
}

function setDescription(text) {
    document.f.payment_desc.value = text;
}

function setDueDate(text) {
    document.f.due_date.value = text;
}

function placedChanged() {
	referenceChanged('component_project_id');
	document.ajaxFields.is_updating.value = "false";
	displayAmounts();
}

<%--function setStatus(id) {
<c:if test="${adding}">
    var sel = document.f.status_id;
    var i;
    for (i = 0; i < sel.length; i++) {
        if (id == sel.options[i].value) {
            sel.selectedIndex = i;
            break;
        }
    }
</c:if>
}--%>

function initialize() {
    loaded();

<c:if test="${empty requestScope.reference_description}">    
    var s = false;
    <c:if test="${not empty param.search_text}">
        s=true;
    </c:if>
    doSearch('<c:out value="${param.search_text}" />',s,true);    
</c:if> 
    displayAmounts();
}

function getElement(name) {
    for(i=0; i < document.f.elements.length; i++) 
        if(document.f.elements[i].name==name)  return document.f.elements[i];
    return undefined;
}

function search() {
    doSearch(getElement("searchInput").value, true, false);
}

function referenceChanged(name) {
    var element = getElement(name);
    if (element != undefined) doReferenceChanged(element.value);
}

function searchKeyPress(e)
{
    var keycode;
    if (window.event) keycode = window.event.keyCode;
    else if (e) keycode = e.which;
    else return true;
    
    if (keycode == 13) {
      if (getElement("searchInput") != undefined) search();  
      return false;
    } 
    return true;
}

</script>
    
</head>
<body onLoad="initialize()" onKeyPress="searchKeyPress(event)">

<div id="loading">
<p align="right">
<b><font color="#FF0000" size="+1">Loading...</font></b>
</p>
</div>

<h1>PACTS</h1>
<c:if test="${updating}">
    <h2>Update Payment</h2>
</c:if> 
<c:if test="${adding}">
    <h2>Add Payment</h2>
</c:if> 

<form name="ajaxFields">
   <input type="hidden" name="first_load" value="true" >
   <input type="hidden" name="is_design" value="<%= request.getAttribute("is_design") %>" >
   <input type="hidden" name="is_updating" value="${updating}" >
   <input type="hidden" name="client" value="<%= ((Map) request.getAttribute(BaseProcessor.DEFAULTS_KEY)).get("client") %>" >
 
</form>

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
<c:if test="${updating}">
   <input type="hidden" name="module" value="EditPayment">
</c:if> 
<c:if test="${adding}">
   <input type="hidden" name="module" value="AddPayment">
</c:if> 
   <input type="hidden" name="search_text">
   <input type="hidden" name="round_unknown">
   <input type="hidden" name="reference_id" value="<c:out value="${requestScope.reference_id}" />">
   <input type="hidden" name="reference_description" value="<c:out value="${requestScope.reference_description}" />" >
   <input type="hidden" name="user_id" value="${user.id}" >   
<c:if test="${updating}">
   <input type="hidden" name="payment_id" value="${payment.id}">
</c:if>  
<c:if test="${hasContract}">
   <input type="hidden" name="contract_id" value="${contract.header.id}">
</c:if>  

<table border="0" cellpadding="3" cellspacing="3">
        <tr>
            <td colspan="2">
                <tc-webtag:errorIterator id="err" name="error">
                    <font color="#FF0000"><%=err%></font><br/>
                </tc-webtag:errorIterator>
            </td>
        </tr>

<c:if test="${updating}">
    <tr>
        <td width="180"><b>ID:</b></td>
        <td>
            <c:out value="${payment.id}" />  
        </td>
    </tr>
</c:if>
    <tr>
        <td width="180"><b>User</b></td>
        <td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></td>
    </tr>
    <tr>
    <c:if test="${hasContract}">
    <tr>
        <td><b>Contract:</b></td>
        <td>
            <a href="${pacts:viewContract(contract.header.id)}"><c:out value="${contract.header.name}" />
        </td>
    </tr>
</c:if>
    
        <td><b>Type:</b></td>
        <td>
          <tc-webtag:rscSelect name="payment_type_id" 
                   list="${typeList}" 
                   fieldText="payment_type_desc" fieldValue="payment_type_id" 
                   useTopValue="false" onChange="typeChanged()" />        
                   <tc-webtag:chkBox name="charity_ind"/>Donated to Charity
       </td>
    </tr>
    
    
<c:choose>    
<c:when test="${not empty requestScope.reference_description}">    
    <tr id="selectReference">
        <td><b>Reference:</b></td>      
        <td><c:out value="${requestScope.reference_description}" />
        <input type="button" value="change" onClick="typeChanged()" />
        </td>
    </tr>
    <tr id="trPlaced">
        <td></td>
        <td></td>
    </tr>
    <c:if test="${requiresClient}">
        <tr id="projectClient"> 
            <td><b>Client:</b></td>
            <td>
                <tc-webtag:textInput name="client" size="30" editable="true" />
            </td>
        </tr>
    </c:if>
    
</c:when> 
<c:otherwise>    
    <tr id="selectReference">
        <td></td>       
        <td></td>
    </tr>
    <tr id="trPlaced">
        <td></td>
        <td></td>
    </tr>
    <tr id="projectClient">
        <td></td>
        <td></td>
    </tr>
</c:otherwise> 
</c:choose>
    <tr>
        <td><b>Method:</b></td><td>
        <tc-webtag:rscSelect name="payment_method_id" list="${methodList}" 
                    fieldText="payment_method_desc" fieldValue="payment_method_id"  useTopValue="false" />
        </td>
    </tr>

    <tr>
        <td><b>Description:</b></td>
        <td>
            <tc-webtag:textInput name="payment_desc" size="60" maxlength="255" editable="true" />
        </td>
        <tr id="trAmount1">
        <td><b>Total Gross Amount:</b></td>
        <td>
            <tc-webtag:textInput name="total_amount" size="8" editable="true" format="#########.00"/>
        </td>			 
        </tr>   
        <tr id="trAmount2">			    
        <td><b>Installment Number:</b></td>
        <td>
        	<tc-webtag:stringSelect name="installment_number" list="<%= java.util.Arrays.asList(new String[]{"1", "2"}) %>" useTopValue="false" onChange="referenceChanged('component_project_id')" />
        </td>			   
        </tr> 
    	<tr id="trAmount3">			   
	        <td nowrap="nowrap"><b>Installment Gross Amount:</b></td>				        
	        <td>
	            <tc-webtag:textInput name="gross_amount" size="8" editable="true" format="#########.00" /> (If left blank, calculated from Total Gross Amount)
	        </td>			    
	    </tr>
        <tr id="trAmount4">
	        <td><b>Installment Net Amount:</b></td>
	        <td>
	            <tc-webtag:textInput name="net_amount" size="8" editable="true" format="#########.00" /> (if left blank, calculated from Installment Gross Amount)
				        </td>
				    </tr>
    
    <tr>
        <td><b>Date Due:</b></td><td>
        <tc-webtag:textInput name="due_date" id="due_date" size="12" editable="true" /> 
            <button id="trigger_due_date">Set</button>       
        </td>            
    </tr>
    <tr>
        <td><b>Invoice:</b></td>
        <td>
            <tc-webtag:textInput name="invoice_number" size="11" maxlength="11" editable="true" />
        </td>
    </tr>
<c:if test="${updating}">    
    <tr>
        <td><b>Rationale:</b></td><td>
        <tc-webtag:rscSelect name="modification_rationale_id" list="${rationaleList}" 
                    fieldText="modification_rationale_desc" fieldValue="modification_rationale_id"  useTopValue="false" />
        </td>
    </tr>
</c:if>    
</table>

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "due_date",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_due_date",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
                -->
</script>
<div id='runJS'></div>

<input type="submit" value="Save Payment">
</form>

<br>

<jsp:include page="InternalFooter.jsp" flush="true"/>

</body>
</html>