<%--
  - Author: pulky, isv
  - Version: 1.3
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists terms of use.
  -
  - Version 1.1 (Configurable Contest Terms Release Assembly v1.0) changes: replaced terms_text by title.
  - Version 1.2 (Configurable Contest Terms Release Assembly v2.0) changes: added a new column that links to a new
  - Version 1.3 (Miscellaneous TC Improvements Assembly v1.0) changes: added a new column that links to a new
  - page showing the form for adding new user agreements to that particular terms of use.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request"/>
<html>
<head>
    <title>TopCoder Admin</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
<jsp:include page="top.jsp"/>
<table>
    <tr valign="top">
        <td>
            <jsp:include page="left.jsp"/>
        </td>
        <td>
            <% ResultSetContainer termsList = (ResultSetContainer) request.getAttribute("terms_list"); %>
            <table>
                <tr><td class="big" align="center" colspan="5"><a href="/admin/?module=EditTerms">Create New</a></td>
                </tr>
                <tr>
                    <td class="header">&#160;</td>
                    <td class="header">Title</td>
                    <td class="header">Type</td>
                    <td class="header">Create Date</td>
                    <td class="header">Modify Date</td>
                    <td class="header">&nbsp;</td>
                    <td class="header">&nbsp;</td>
                </tr>
                <% boolean even = false; %>
                <rsc:iterator list="<%=termsList%>" id="terms">
                    <tr>
                        <td class="<%=even?"even":"odd"%>"><a
                                href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditTerms&<%=Constants.TERMS_OF_USE_ID%>=<rsc:item row="<%=terms%>" name="terms_of_use_id"/>">edit</a>
                            <rsc:item row="<%=terms%>" name="terms_of_use_id"/></td>
                        <td class="<%=even?"even":"odd"%>"><%=terms.getStringItem("title")%></td>
                        <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=terms%>"
                                                                     name="terms_of_use_type_desc"/></td>
                        <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=terms%>" name="create_date"
                                                                     format="MM.dd.yyyy HH:mm:ss"/></td>
                        <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=terms%>" name="modify_date"
                                                                     format="MM.dd.yyyy HH:mm:ss"/></td>
                        <td class="<%=even?"even":"odd"%>">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewEditTermsUsers&<%=Constants.TERMS_OF_USE_ID%>=<rsc:item row="<%=terms%>" name="terms_of_use_id"/>">view users</a>
                        </td>
                        <td class="<%=even?"even":"odd"%>">
                            <a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=ViewAddTermsUsers&<%=Constants.TERMS_OF_USE_ID%>=<rsc:item row="<%=terms%>" name="terms_of_use_id"/>">add user</a>
                        </td>
                    </tr>
                    <% even = !even;%>
                </rsc:iterator>
                <tr><td class="big" align="center" colspan="5"><a href="/admin/?module=EditTerms">Create New</a></td>
                </tr>
            </table>
        </td>
    </tr>
</table>
</body>
</html>
