<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tco08.SymposiumRegBase,
                 com.topcoder.web.common.model.SymposiumReg" %> 
<%@ page import="com.topcoder.web.common.tag.ListSelectTag" %> 

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%
    java.util.List paymentMethods = new java.util.ArrayList();
    paymentMethods.add(new ListSelectTag.Option("Visa", "Visa"));
    paymentMethods.add(new ListSelectTag.Option("MC", "Master Card"));
    paymentMethods.add(new ListSelectTag.Option("AMEX", "American Express"));
    paymentMethods.add(new ListSelectTag.Option("Discover", "Discover"));

%>
<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../../script.jsp" />
    <jsp:include page="../../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    
<script type="text/javascript" src="/js/main.js"  ></script>
<script type="text/javascript">

function setStudent(){
    showBlock('collegeHeader');
    showBlock('collegeInput');
    hide('companyHeader');
    hide('companyInput');
}

function setProf(){
    hide('collegeHeader');
    hide('collegeInput');
    showBlock('companyHeader');
    showBlock('companyInput');
}

function init() {
    if (document.f.<%=SymposiumRegBase.PROFESSIONAL%>[0].checked) setProf();
    if (document.f.<%=SymposiumRegBase.PROFESSIONAL%>[1].checked) setStudent();
}

</script>
    
</head>

<body onload="init()">
<center>
<br/>
<h2>Registration for the Software Symposium at the 2008 TopCoder Open</h2>
<br/>
<br/>
<form name="f" method="post" action="/tc">
<tc-webtag:hiddenInput name="module" value="TCO08SymposiumRegister" /> 
<table cellpadding="3" cellspacing="0">
<tbody>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.GIVEN_NAME%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Given Name:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.GIVEN_NAME%>" size="15" maxlength="64" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.SURNAME%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Surname:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.SURNAME%>" size="15" maxlength="64" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.HANDLE%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>TopCoder handle:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.HANDLE%>" size="10" maxlength="50" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.PROFESSIONAL%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* You are:</td>
        <td><tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="pro" onClick="setProf()"/> Professional<br/> 
           <tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="student" onClick="setStudent()"/> College Student<br/>
        </td>
    </tr>
    <tr>
        <td><div id="collegeHeader" style="display: none;">
            College/University:
            </div>
            <div id="companyHeader" style="display: none;">
            Company:
            </div>
        </td>
        <td>
            <div id="collegeInput" style="display: none;">
                <tc-webtag:textInput name="<%=SymposiumRegBase.COLLEGE%>" size="30" maxlength="64" editable="true"/>
            </div>
            <div id="companyInput" style="display: none;">
                <tc-webtag:textInput name="<%=SymposiumRegBase.COMPANY%>" size="30" maxlength="64" editable="true"/>
            </div>        
        </td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.PHONE_NUMBER%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Phone number:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.PHONE_NUMBER%>" size="12" maxlength="30" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.EMAIL_ADDRESS%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Email address:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.EMAIL_ADDRESS%>" size="25" maxlength="100" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.ADDRESS_1%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Address 1:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.ADDRESS_1%>" size="40" maxlength="254" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.ADDRESS_2%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>Address 2:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.ADDRESS_2%>" size="40" maxlength="254" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.CITY%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* City:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.CITY%>" size="20" maxlength="64" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.ZIP%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>Postal Code:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.ZIP%>" size="8" maxlength="15" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.COUNTRY%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>Country:</td>
        <td><tc-webtag:objectSelect name="<%=SymposiumRegBase.COUNTRY%>" list="${countries}" valueField="code" textField="name"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.REGISTRATION_TYPE%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>Registration type:</td>
        <td><tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE %>" value="<%=SymposiumReg.REG_TYPE_COLLEGIATE_TC+ ""%>" />Collegiate TopCoder Member: $99<br/>
            <c:if test="${not early}"> 
                <tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE %>" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL+ ""%>"/>Professional: $299<br/>
            </c:if>                
            <c:if test="${early}"> 
                <tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE %>" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL_EARLY+ ""%>"/>Professional Early bird<sup>*</sup>: $199<br/>
            </c:if>
        </td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.PAYMENT_METHOD%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Method of Payment:</td>
        <td><tc-webtag:listSelect name="<%=SymposiumRegBase.PAYMENT_METHOD %>" list="<%= paymentMethods %>"/>
        </td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.CARD_NUMBER%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Card Number:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.CARD_NUMBER%>" size="20" maxlength="30" editable="true"/></td>
    </tr>
    <tr>
        <td colspan="2"><span class="bigRed">
        <tc-webtag:errorIterator id="err" name="<%=SymposiumRegBase.EXPIRATION_DATE%>"><%=err%><br/></tc-webtag:errorIterator></span>
        </td>
    </tr>
    <tr>
        <td>* Expiration Date:</td>
        <td><tc-webtag:textInput name="<%=SymposiumRegBase.EXPIRATION_DATE%>" size="5" maxlength="5" editable="true"/> (mm/yy)</td>
    </tr>    
</tbody>
</table>

<br/>
<div align="center">
    <a href="#" onclick="document.f.submit();return false;">Submit</a>
</div>

</form>

<br/>
<br/>
<c:if test="${early}"> 
    <sup>*</sup> if booked by February 1. After that date, professional is $299.
</c:if>

<br/>
</center>
<jsp:include page="../../../foot.jsp" />

</body>

</html>