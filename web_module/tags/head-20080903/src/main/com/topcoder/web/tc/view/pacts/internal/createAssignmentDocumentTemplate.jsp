<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>


<html>
    <head>
        <title>PACTS</title>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
    </head>
    <body>

        <h1>PACTS</h1>
        <h2 align="center">Create Assignment Document Template</h2>

        <center>
            <form name="paymentForm" action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
                <input type="hidden" name="<%=PactsConstants.MODULE_KEY%>" value="CreateAssignmentDocumentTemplate"/>
                <table border="1" cellpadding="5" cellspacing="0">
                    <tr><td><tc-webtag:errorIterator id="err" name="error"><%=err%></tc-webtag:errorIterator></td></tr>
                    <tr>
                        <td align="center">
                            <SELECT CLASS="dropdown" NAME="assignment_document_type_id"">
                                <c:forEach items="${assignment_document_type_list}" var="typeItem">
                                    <OPTION value='${typeItem.id}' <c:if test="${typeItem.id == defaultTypeId}">selected</c:if>>
                                        ${typeItem.description}
                                    </OPTION>
                                </c:forEach>
                            </SELECT>
                        </td> 
                    </tr>
                    <tr>        
                        <td><b>Template name:</b>
                            <tc-webtag:textInput name="assignment_document_template_name" id="assignment_document_template_name" editable="true" maxlength="50"/> 
                        </td>
                    </tr>
                    <tr><td>
                        <textarea class=codingArea name="<%=PactsConstants.ASSIGNMENT_DOCUMENT_TEMPLATE_TEXT%>" rows="20" cols="60" wrap="off"></textarea>
                    </td></tr>
                    <tr>
                        <td align="center">
                            <a href="JavaScript:document.paymentForm.submit();">Submit</a> <br />
                        </td>
                    </tr>
                </table>
            </form>
        </center>
        <jsp:include page="InternalFooter.jsp" flush="true" />
    </body>
</html>
