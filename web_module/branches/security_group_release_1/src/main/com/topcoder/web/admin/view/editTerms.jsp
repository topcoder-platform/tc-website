<%--
  - Author: pulky, TCSASSEMBER
  - Version: 1.2
  - Copyright (C) 2004 - 2011 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page lists allow edition of a term of use entry.
  -
  - Version 1.2 (TopCoder Terms of Use Management Refactoring v1.0) Change notes:
  - - Change the Electronically Signable field to Agreeability type field.
  - - Add the UI to manage terms dependencies.
  -
  - Version 1.2 (Configurable Contest Terms Release Assembly v1.0) changes: added new terms columns.
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
                        <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method=post name="termsForm" onsubmit="return setAllDep();">

                            <input type="hidden" name="module" value="UpdateTerms"/>
                            <tc-webtag:hiddenInput name="<%=Constants.TERMS_OF_USE_ID%>" />

                            <tr>
                                <td align="center">
                                    <input type="submit" name="submit" value="Save"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" style="color:red;">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_TITLE%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Title: <tc-webtag:textInput name="<%=Constants.TERMS_TITLE%>" size="100" maxlength="50"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" style="color:red;">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_OF_USE_TYPE_ID%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Type: <tc-webtag:rscSelect name="<%=Constants.TERMS_OF_USE_TYPE_ID%>" list='<%=(ResultSetContainer)request.getAttribute("terms_of_use_type_list")%>' fieldText="terms_of_use_type_desc" fieldValue="terms_of_use_type_id"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" style="color:red;">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_AGREE_TYPE_ID%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    Agreeability type: <tc-webtag:rscSelect name="<%=Constants.TERMS_AGREE_TYPE_ID%>" list='<%=(ResultSetContainer)request.getAttribute("terms_of_use_agree_type_list")%>' fieldText="name" fieldValue="id"/>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" style="color:red;">
                                    <tc-webtag:errorIterator id="err" name="<%=Constants.TERMS_URL%>"><%=err%></tc-webtag:errorIterator>
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    URL: <tc-webtag:textInput name="<%=Constants.TERMS_URL%>" size="100" maxlength="100"/>
                                </td>
                            </tr>
<script type="text/javascript">
function transOptions(source, dest) {
    while (true) {
        var found = false;
        for (var i = 0; i < source.length; i++) {
            if (source[i].selected) {
                var op = source[i];
                try {
                    dest.add(op, dest.options[null]);
                } catch (e) {
                    dest.add(op, null);
                }
                op.selected = false;
                found = true;
                break;
            }
        }
        if (!found) break;
    }
}

function addDep() {
    var sels = document.getElementById("can-be-dep");
    var depSels = document.getElementById("dep");
    transOptions(sels, depSels);
}

function removeDep() {
    var sels = document.getElementById("can-be-dep");
    var depSels = document.getElementById("dep");
    transOptions(depSels, sels);
}

function setAllDep() {
    var depSels = document.getElementById("dep");
    for (var i = 0; i < depSels.length; i++) {
        depSels[i].selected = true;
    }
    return true;
}
</script>

                            <tr>
                                <td align="left">
                                  Dependencies:
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                  <table style="width:780px" border="0">
                                    <tr><td align="center">Candidate terms</td><td></td><td align="center">Existing dependencies terms</td></tr>
                                    <tr>
                                    <td width="352px">
                                      <select multiple="multiple" id="can-be-dep" style="width:350px;height:400px;">
                                             <c:forEach items="${can_be_dependencies_terms_of_use}" var="term"> 
                                                   <option value="${term.termsOfUseId}">${term.title}</option>
                                             </c:forEach>
                                        </select>
                                    </td>
                                    <td width="60px">
                                          <input type="button" value="==>" onclick="javascript:addDep();"/>
                                          <br/><input type="button" value="<==" onclick="javascript:removeDep();"/>
                                    </td>
                                    <td width="352px">
                                      <select multiple="multiple" id="dep" name="deptids" style="width:350px;height:400px;">
                                             <c:forEach items="${dependencies_terms_of_use}" var="term">
                                                   <option value="${term.termsOfUseId}">${term.title}</option>
                                             </c:forEach>
                                        </select>
                                    </td>
                                  </table>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" style="color:red;">
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

