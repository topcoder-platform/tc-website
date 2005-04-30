<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>
    <body>
        <jsp:include page="top.jsp"/>
        <table>
            <tr valign="top">
                <td>
                    <jsp:include page="left.jsp"/>
                </td>
                <td>
                    <table>
                        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method=post name="termsForm">
                            <input type="hidden" name="module" value="UpdateTerms"/>
                            <tc-webtag:hiddenInput name="<%=Constants.TERMS_OF_USE_ID%>" />

                            <tr>
                                <td align="center">
                                    <input type="submit" name="submit" value="Save"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_OF_USE_TYPE_ID%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:rscSelect name="<%=Constants.TERMS_OF_USE_TYPE_ID%>" list='<%=(ResultSetContainer)request.getAttribute("terms_of_use_type_list")%>' fieldText="terms_of_use_type_desc" fieldValue="terms_of_use_type_id"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="40" cols="150"/>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <input type="submit" name="submit" value="Save"/>
                                </td>
                            </tr>
                        </form>
                    </table>
                 </td>
             </tr>
         </table>
    </body>
</html>

