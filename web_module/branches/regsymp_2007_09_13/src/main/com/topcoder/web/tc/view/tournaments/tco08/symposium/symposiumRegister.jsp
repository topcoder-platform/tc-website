<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.web.tc.controller.request.tournament.tco08.SymposiumRegBase" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<html>

<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../../script.jsp" />
    <jsp:include page="../../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
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
        <td>You are:</td>
        <td><tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="true" onClick="alert('prof')"/> Professional<br/> 
           <tc-webtag:radioButton name="<%=SymposiumRegBase.PROFESSIONAL%>" value="false" onClick="alert('student')"/> College Student<br/>
        </td>
    </tr>

</tbody>
</table>

</center>
<jsp:include page="../../../foot.jsp" />

</body>

</html>