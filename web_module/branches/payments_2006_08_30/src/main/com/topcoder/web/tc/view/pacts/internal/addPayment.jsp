<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.ContractHeader" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.TCData"%>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.UserProfileHeader"%>

<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib uri="http://taconite.sf.net/tags" prefix="tac" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<head>
    <meta http-equiv="Content-Language" content="en-us">
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252">
    <title>PACTS</title>
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script type="text/javascript" src="/js/jscal/calendar.js"></script>
    <script type="text/javascript" src="/js/jscal/lang/calendar-en.js"></script>
    <script type="text/javascript" src="/js/jscal/calendar-setup.js"></script>
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>
         
<script type="text/javascript" src="/js/taconite-client.js"></script>
<script type="text/javascript" src="/js/taconite-parser.js"></script>
<script type="text/javascript">


function typeChanged() {
    var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectPaymentTypeReference');
    document.f.reference_id.value = types[document.f.payment_type_id.selectedIndex];
    ajaxRequest.setEchoDebugInfo();
    ajaxRequest.addNamedFormElements("payment_type_id");
    ajaxRequest.addNamedFormElements("reference_id");    
    ajaxRequest.sendRequest();
}

function search() {
    var ajaxRequest = new AjaxRequest('/PactsInternalServlet?module=SelectPaymentTypeReference');
    document.f.reference_id.value = types[document.f.payment_type_id.selectedIndex];
    ajaxRequest.setEchoDebugInfo();
    ajaxRequest.addNamedFormElements("reference_id");    
    ajaxRequest.addNamedFormElements("payment_type_id");
    ajaxRequest.addNamedFormElements("search_text");
    ajaxRequest.sendRequest();
}


</script>

    

</head>

<body>

<%
    String contract_id_string = request.getParameter(PactsConstants.CONTRACT_ID);
    boolean payment_is_for_contract = true;
    long contract_id=0;
    if (contract_id_string != null)  contract_id = Long.parseLong(contract_id_string);
    else payment_is_for_contract = false;
    ResultSetContainer stati = (ResultSetContainer) request.getAttribute(PactsConstants.STATUS_CODE_LIST);
    ResultSetContainer paymentTypes = (ResultSetContainer)    request.getAttribute(PactsConstants.PAYMENT_TYPE_LIST);
    ResultSetContainer paymentMethods = (ResultSetContainer)   request.getAttribute(PactsConstants.PAYMENT_METHOD_LIST);
    String message = (String) request.getAttribute("message");
    if (message == null) {
        message = "";
    }
    UserProfileHeader user = null;
    ContractHeader contract = null;

    long userId;
    if (payment_is_for_contract) {
        contract = (ContractHeader)
          request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
        if (contract == null) {
            out.println("no contract!!!</br>");
            contract = new ContractHeader();
        }
        userId = contract.getUser().getId();
    }
    else {
        user = (UserProfileHeader)
          request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
        if (user == null) {
            out.println("no user!!!<br>");
            user = new UserProfileHeader();
        }
        userId = user.getId();
    }
    int status = -1;
    try { status = Integer.parseInt(request.getParameter("status_id")); } catch (Exception e) {}
    String desc = request.getParameter("payment_desc");
    if (desc == null) desc = "";
    int type = -1;
    try { type = Integer.parseInt(request.getParameter("payment_type_id")); } catch (Exception e) {}
    int method = -1;
    try { method = Integer.parseInt(request.getParameter("payment_method_id")); } catch (Exception e) {}
    String net = request.getParameter("net_amount");
    if (net == null) net = "";
    String gross = request.getParameter("gross_amount");
    if (gross == null) gross = "";
    String due = request.getParameter("date_due");
    if (due == null) due = "";
    
    String statusSelectedValue = null;
    String statusSelectedText = null;
    if (status < 0)  {
        statusSelectedText = payment_is_for_contract? PactsConstants.DEFAULT_CONTRACT_PAYMENT_STATUS :
                                                      PactsConstants.DEFAULT_PAYMENT_STATUS;            
    } else {
        statusSelectedValue = "" + status;
    }

    String paymentTypeSelectedValue = null;
    String paymentTypeSelectedText = null;
    if (type < 0)  {
        paymentTypeSelectedText = payment_is_for_contract? PactsConstants.DEFAULT_CONTRACT_PAYMENT_TYPE :
                                                           PactsConstants.DEFAULT_PAYMENT_TYPE;         
    } else {
        paymentTypeSelectedValue = "" + type;
    }

    String paymentMethodSelectedValue = null;
    String paymentMethodSelectedText = null;
    if (method < 0)  {
        paymentMethodSelectedText = PactsConstants.DEFAULT_PAYMENT_METHOD;
    } else {
        paymentMethodSelectedValue = "" + method;
    }
%>
<script type="text/javascript">
var types = new Array();
var i = 0;

<% for(int i = 0; i < paymentTypes.size(); i++) { 
try {
%>
types[i++]= <%= paymentTypes.getStringItem(i, "payment_reference_id") == null? -1 :  paymentTypes.getIntItem(i, "payment_reference_id") %>;
<% 
} catch(Exception e) { out.println(e); }
} %>

</script>

<h1>PACTS</h1>

<h2>Add <%= payment_is_for_contract? "Contract" : "" %> Payment</h2>

<font color="#FF0000">
    <%= message %>
</font>

<form name="f" action="<%= PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
   <input type="hidden" name="<%= PactsConstants.TASK_STRING %>" value="<%=PactsConstants.ADD_TASK%>" >
   <input type="hidden" name="<%= PactsConstants.CMD_STRING %>" value="<%=PactsConstants.PAYMENT_CMD%>" >
   <input type="hidden" name="reference_id">

<%  if (payment_is_for_contract) { %>
   <input type="hidden" name="<%= PactsConstants.CONTRACT_ID %>" value="<%=contract_id%>" >
<% } %>    

   <input type="hidden" name="<%= PactsConstants.USER_ID %>" value="<%=userId %>" >
   
   
        <table border="0" cellpadding="5" cellspacing="5">
        <tr>
            <td><b>User:</b></td>
            <td><a href='<%= PactsConstants.INTERNAL_SERVLET_URL + "?" + 
                               PactsConstants.TASK_STRING + "=" + PactsConstants.VIEW_TASK + "&" +
                               PactsConstants.CMD_STRING + "=" + PactsConstants.USER_CMD + "&" +
                               PactsConstants.USER_ID + "=" + userId  %>'>
                <%= payment_is_for_contract? contract.getUser().getHandle() :  user.getHandle() %>
                </a>
            </td>
        </tr>
<%      if (payment_is_for_contract) { %>
        <tr>
            <td><b>Contract:</b></td>
            <td><a href='<%= PactsConstants.INTERNAL_SERVLET_URL + "?" + 
                               PactsConstants.TASK_STRING + "=" + PactsConstants.VIEW_TASK + "&" +
                               PactsConstants.CMD_STRING + "=" + PactsConstants.CONTRACT_CMD + "&" +
                               PactsConstants.CONTRACT_ID + "=" + contract.getId()  %>'>
                    <%= contract.getName() %>
                </a>
            </td>
        </tr>

<% } %>

        <tr>
        <td><b>Status:</b></td>
        <td>
       <tc-webtag:rscSelect name="status_id" list="<%=stati%>" 
            fieldText="status_desc" fieldValue="status_id" 
            selectedValue="<%= statusSelectedValue %>" selectedText="<%= statusSelectedText %>" 
            useTopValue="false" />        
        </td>
        </tr>
        <tr>
        <td><b>Description:</b></td><td>
        <input type=text width=25 name="payment_desc" value="<%= desc %>">
        </td></tr>
        <tr>
            <td><b>Type:</b></td><td>
           <tc-webtag:rscSelect name="payment_type_id" 
                    list="<%=paymentTypes%>" 
                    fieldText="payment_type_desc" fieldValue="payment_type_id" 
                    selectedValue="<%= paymentTypeSelectedValue %>" selectedText="<%= paymentTypeSelectedText %>" 
                    useTopValue="false" onChange="typeChanged()" />        
        </td>
        </tr>
        <tr id="selectReference"> <td></td><td></td></tr>
        <tr>
            <td><b>Method:</b></td><td>
            <tc-webtag:rscSelect name="payment_method_id" list="<%=paymentMethods%>" 
                        fieldText="payment_method_desc" fieldValue="payment_method_id"  
                        selectedValue="<%= paymentMethodSelectedValue %>" selectedText="<%= paymentMethodSelectedText %>"             
                        useTopValue="false" />
            </td>
        </tr>
        <tr>
            <td><b>Gross Amount:</b></td><td>
            <input type=text width=25 name="gross_amount" value="<%= gross %>">
            </td></tr>
            <tr>
            <td><b>Net Amount:</b></td><td>
            <input type=text width=25 name="net_amount" value="<%= net %>"> (if left blank, calculated from Gross Amount)
            </td></tr>
            <tr>
            <td><b>Date Due:</b></td><td>
            <input type=text width=25 name="date_due" id="date_due" value="<%= due %>"> 
                <button id="trigger_date_due">Set</button>
            (if left blank, 2 weeks from now)
            </td>
                
        </tr>
</table>

<script language="javascript" type="text/javascript">
    <!--
Calendar.setup(
{
 inputField  : "date_due",  
                    ifFormat    : "<%= PactsConstants.JS_DATE_FORMAT_STRING %>",    
                    button      : "trigger_date_due",     
                    showsTime   : false,
                    singleClick  : false,
                    cache       : true
}
);
                -->
</script>

<input type="submit" value="Add Payment">
</form>
<jsp:include page="InternalFooter.jsp" flush="true"/>
</body>

</html>