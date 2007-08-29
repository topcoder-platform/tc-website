<%@ page contentType="text/html;charset=utf-8" %>
<%@ page language="java" import="com.topcoder.web.tc.controller.request.util.VisaLetterRequest"   %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.reg.Constants" %>
<%@ taglib uri="common-functions" prefix="cf" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<c:set var="req" value="${requestScope.req}"/>
<c:set var="event" value="${requestScope.event}"/>
<c:set var="address" value="${requestScope.address}"/>

<html>
<head>
<title>Visa Letter Request</title>
         
<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

<script language="javascript" type="text/javascript">
function copyAddr() {
     document.f.<%= VisaLetterRequest.SHIPPING_ADDRESS %>.value = document.f.<%= VisaLetterRequest.ADDRESS %>.value;
     return false;
}

function regToAddr() {
    document.f.<%=Constants.ADDRESS1%>.value ='<c:out value="${address.address1}"/>';
    document.f.<%=Constants.ADDRESS2%>.value = '<c:out value="${address.address2}"/>';
    document.f.<%=Constants.ADDRESS3%>.value = '<c:out value="${address.address3}"/>';
    document.f.<%=Constants.CITY%>.value = '<c:out value="${address.city}"/>';
    document.f.<%=Constants.POSTAL_CODE%>.value = '<c:out value="${address.postalCode}"/>';
    document.f.<%=Constants.STATE_CODE%>.value = '<c:out value="${address.state.code}"/>';
    document.f.<%=Constants.PROVINCE%>.value = '<c:out value="${address.province}"/>';
    document.f.<%=Constants.COUNTRY_CODE%>.value = '<c:out value="${address.country.code}"/>';
}

function regToShippingAddr() {
    document.f.s_<%=Constants.ADDRESS1%>.value ='<c:out value="${address.address1}"/>';
    document.f.s_<%=Constants.ADDRESS2%>.value = '<c:out value="${address.address2}"/>';
    document.f.s_<%=Constants.ADDRESS3%>.value = '<c:out value="${address.address3}"/>';
    document.f.s_<%=Constants.CITY%>.value = '<c:out value="${address.city}"/>';
    document.f.s_<%=Constants.POSTAL_CODE%>.value = '<c:out value="${address.postalCode}"/>';
    document.f.s_<%=Constants.STATE_CODE%>.value = '<c:out value="${address.state.code}"/>';
    document.f.s_<%=Constants.PROVINCE%>.value = '<c:out value="${address.province}"/>';
    document.f.s_<%=Constants.COUNTRY_CODE%>.value = '<c:out value="${address.country.code}"/>';
}

function addrToShippingAddr() {
    document.f.s_<%=Constants.ADDRESS1%>.value = document.f.<%=Constants.ADDRESS1%>.value;
    document.f.s_<%=Constants.ADDRESS2%>.value =  document.f.<%=Constants.ADDRESS2%>.value;
    document.f.s_<%=Constants.ADDRESS3%>.value = document.f.<%=Constants.ADDRESS3%>.value;
    document.f.s_<%=Constants.CITY%>.value = document.f.<%=Constants.CITY%>.value;
    document.f.s_<%=Constants.POSTAL_CODE%>.value = document.f.<%=Constants.POSTAL_CODE%>.value;
    document.f.s_<%=Constants.STATE_CODE%>.value = document.f.<%=Constants.STATE_CODE%>.value;
    document.f.s_<%=Constants.PROVINCE%>.value = document.f.<%=Constants.PROVINCE%>.value;
    document.f.s_<%=Constants.COUNTRY_CODE%>.value = document.f.<%=Constants.COUNTRY_CODE%>.value;
}

function init() {
<% java.util.Map e = (java.util.Map) request.getAttribute(com.topcoder.web.common.BaseProcessor.ERRORS_KEY);
   if (e == null || e.size() == 0) { 
%>
        regToAddr();
        regToShippingAddr();
<% } %>
}
 </script>
</head>

<body onLoad="init()" >

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">

<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="my_topcoder"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">


<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="visa"/>
    <jsp:param name="title" value="&nbsp;"/>
</jsp:include>

<form name="f" action="${sessionInfo.secureAbsoluteServletPath}?module=VisaLetterRequest" method="post">
<input type="hidden" name="eid" value="${event.id}">
<table cellpadding="0" cellspacing="0" class="stat" width="100%">
    <tr>
        <td class="title" colspan="2">Request a Visa letter for <c:out value="${event.name}"/></td>
    </tr>
 <tr class="light">
     <td colspan="2"><span class="bigRed">
                 <tc-webtag:errorIterator id="err" name="error">${err}
                     <br></tc-webtag:errorIterator></span>
     </td>
 </tr>
 
<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=VisaLetterRequest.FULL_NAME%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Full Name:</strong><br>(as stated on passport)</td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= VisaLetterRequest.FULL_NAME %>" size="30" maxlength="50" editable="true"/></td>    
</tr>
<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=VisaLetterRequest.PHONE_NUMBER%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Phone Number:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= VisaLetterRequest.PHONE_NUMBER %>" size="15" maxlength="30" editable="true"/></td>    
</tr>
<tr class="light">
    <td class="valueC" colspan="2" style="border: none;"><strong>Address</strong><br>(as stated on passport)</td>
</tr>
<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS1%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*Address1:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.ADDRESS1%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS2%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Address2:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.ADDRESS2%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.ADDRESS3%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Address3:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.ADDRESS3%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.CITY%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*City:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.CITY%>" size="15" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.STATE_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>State:</strong><br>(US only):</td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.STATE_CODE%>" size="2" maxlength="2" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.POSTAL_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Postal Code:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.POSTAL_CODE%>" size="15" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.PROVINCE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Province:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%=Constants.PROVINCE%>" size="15" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%=Constants.COUNTRY_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*Country:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:objectSelect name="<%=Constants.COUNTRY_CODE%>" list="${countries}" valueField="code" textField="name"/></td>
</tr>
<tr class="light">
    <td class="valueC" colspan="2" style="border: none;"><strong>Address</strong><br>(for shipping the Visa letter)</td>
</tr>
<tr class="light">
    <td class="valueC" colspan="2" style="border: none;">
        <input type="button" value="Use same as above" onClick="addrToShippingAddr()">
    </td>
</tr>
<tr class="light">
    <td colspan="2" style="border: none;"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" +Constants.ADDRESS1%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*Address1:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.ADDRESS1%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.ADDRESS2%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Address2:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.ADDRESS2%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.ADDRESS3%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Address3:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.ADDRESS3%>" size="15" maxlength="<%=Constants.MAX_ADDRESS_LENGTH%>" editable="true"/></td>    
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.CITY%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*City:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.CITY%>" size="15" maxlength="<%=Constants.MAX_CITY_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.STATE_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>State (US only):</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.STATE_CODE%>" size="2" maxlength="2" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.POSTAL_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Postal Code:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.POSTAL_CODE%>" size="15" maxlength="<%=Constants.MAX_POSTAL_CODE_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.PROVINCE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>Province:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:textInput name="<%= "s_" + Constants.PROVINCE%>" size="15" maxlength="<%=Constants.MAX_PROVINCE_LENGTH%>" editable="true"/></td>
</tr>

<tr class="light">
    <td colspan="2"><span class="bigRed">
    <tc-webtag:errorIterator id="err" name="<%= "s_" + Constants.COUNTRY_CODE%>"><%=err%><br></tc-webtag:errorIterator></span>
    </td>
</tr>
<tr class="light">
    <td class="valueR" style="border: none;"><strong>*Country:</strong></td>
    <td class="value" style="border: none;"><tc-webtag:objectSelect name="<%= "s_" + Constants.COUNTRY_CODE%>" list="${countries}" valueField="code" textField="name"/></td>
</tr>

</table>

<div align="center" style="margin: 20px;">
    <input type="submit" value="Request Letter">
</div>
</form>


            </div>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="about"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
