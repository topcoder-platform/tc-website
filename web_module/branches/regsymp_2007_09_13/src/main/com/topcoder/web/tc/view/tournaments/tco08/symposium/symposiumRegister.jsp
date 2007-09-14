<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tco08.SymposiumRegBase,
                 com.topcoder.web.common.model.SymposiumReg" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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

function setProf(){
    showBlock('collegeHeader');
    showBlock('collegeInput');
    hide('companyHeader');
    hide('companyInput');
}

function setStudent(){
    hide('collegeHeader');
    hide('collegeInput');
    showBlock('companyHeader');
    showBlock('companyInput');
}

</script>
    
</head>

<body>
<center>
<br/>
<h2>Registration for the Software Symposium at the 2008 TopCoder Open</h2>
<br/>
<br/>
<table cellpadding="5" cellspacing="0">
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
        <td><tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="true" onClick="setProf()"/> Professional<br/> 
           <tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="false" onClick="setStudent()"/> College Student<br/>
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
        <td><tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE + ""%>" value="<%=SymposiumReg.REG_TYPE_COLLEGIATE_TC+ ""%>" />Collegiate TopCoder Member: $99<br/>
            <c:if test="${not early}"> 
                <tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE + ""%>" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL+ ""%>"/>Professional: $299<br/>
            </c:if>                
            <c:if test="${early}"> 
                <tc-webtag:radioButton name="<%=SymposiumRegBase.REGISTRATION_TYPE + ""%>" value="<%=SymposiumReg.REG_TYPE_PROFESSIONAL_EARLY+ ""%>"/>Professional Early bird<sup>*</sup>: $299<br/>
            </c:if>
        </td>
    </tr>
    
    

</tbody>
</table>

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