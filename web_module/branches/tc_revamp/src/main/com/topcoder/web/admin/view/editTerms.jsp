<%--
  - Author: pulky
  - Version: 1.1
  - Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists allow edition of a term of use entry.
  -
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: added new terms columns.
--%>
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
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_TITLE%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Title: <tc-webtag:textInput name="<%=Constants.TERMS_TITLE%>" size="100" maxlength="50"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_OF_USE_TYPE_ID%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Type: <tc-webtag:rscSelect name="<%=Constants.TERMS_OF_USE_TYPE_ID%>" list='<%=(ResultSetContainer)request.getAttribute("terms_of_use_type_list")%>' fieldText="terms_of_use_type_desc" fieldValue="terms_of_use_type_id"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Electronically Signable: <tc-webtag:chkBox name="<%=Constants.TERMS_ELECTRONICALLY_SIGNABLE%>"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_URL%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    URL: <tc-webtag:textInput name="<%=Constants.TERMS_URL%>" size="100" maxlength="100"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <tc-webtag:textArea name="<%=Constants.TERMS%>" rows="40" cols="120"/>
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

