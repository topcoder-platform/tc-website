<%@ page contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.Constants,
                 com.topcoder.web.corp.controller.request.UserEdit"
         %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="manageUsers"/>
                <jsp:param name="level2" value="addUser"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <h1 class="testHead">Add New User / Modify User</h1>
                    </td>
                <tr>
            </table>

            <form method="POST" action="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>" name="frmUserEdit">

            <table cellspacing="0" cellpadding="3" width="80%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">User Info</td></tr>

                <input type="hidden" name="module" value="UserEdit"/>
                <% String id = (String)request.getAttribute("id");
                    if( id != null ) { %>
                        <input type="hidden" name="id" value="<%=id%>"/>
                <% } %>

<!-- LOGIN -->
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextOdd" colspan="2"><tc-webtag:errorIterator id="err" name="username"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleOdd">User Name</td>
                    <td class="testTableOdd"><tc-webtag:textInput editable='<%=""+(id==null)%>' name="username" size="30" maxlength="15"/></td>
                </tr>

<!-- PASSWORD -->
                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextEven" colspan="2"><tc-webtag:errorIterator id="err" name="password"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleEven">Password</td>
                    <td class="testTableEven"><tc-webtag:textInput passw="true" name="password" size="30" maxlength="15"/></td>
                </tr>

<!-- PASSWORD VERIFICATION -->
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextOdd" colspan="2"><tc-webtag:errorIterator id="err" name="password-once-more"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleOdd">Re-type Password</td>
                    <td class="testTableOdd"><tc-webtag:textInput passw="true" name="password-once-more" size="30" maxlength="15"/></td>
                </tr>

<!-- FIRST NAME -->
                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextEven"  colspan="2"><tc-webtag:errorIterator id="err" name="first-name"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleEven">First Name</td>
                    <td class="testTableEven"><tc-webtag:textInput name="first-name" maxlength="30" size="30"/></td>
                </tr>

<!-- LAST NAME -->
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextOdd" colspan="2"><tc-webtag:errorIterator id="err" name="last-name"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleOdd">Last Name</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="last-name" size="30" maxlength="30"/></td>
                </tr>

<!-- EMAIL -->
                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextEven" colspan="2"><tc-webtag:errorIterator id="err" name="email"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleEven">Email</td>
                    <td class="testTableEven"><tc-webtag:textInput name="email" size="30" maxlength="100"/></td>
                </tr>

  <!-- EMAIL VERIFICATION -->
                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextOdd" colspan="2"><tc-webtag:errorIterator id="err" name="email-once-more"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableOdd" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleOdd">Re-type Email</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="email-once-more" size="30" maxlength="100"/></td>
                </tr>

<!-- PHONE -->
                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="errorTextEven" colspan="2"><tc-webtag:errorIterator id="err" name="phone"><%=err%></tc-webtag:errorIterator></td>
                </tr>

                <tr>
                    <td class="testTableEven" width="60"><img src="/i/corp/clear.gif" width="60" height="1" alt="" border="0"></td>
                    <td class="testTableSubtitleEven">Phone</td>
                    <td class="testTableEven"><tc-webtag:textInput name="phone" size="30" maxlength="100"/></td>
                </tr>
            </table>

            <p><br></p>

            <table cellspacing="0" cellpadding="3" width="80%" class="testFrame">
                <tr><td class="testTableTitle" colspan="3">Set Access Privileges</td></tr>

     <% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute(UserEdit.KEY_USER_PERMS);
       if( rsc != null ) { %>

                <tr><td colspan="3"><IMG src="/i/corp/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></td></tr>
    <tc-webtag:iterator list="<%=rsc%>" id="row" >
                <tr valign="middle"><% String checked = row.getItem("has_permission").compareTo("1")==0 ? " checked=\"1\"" : " "; %>
                    <td width="49%" class="bodyText">&#160;</td>
                    <td class="bodyText" nowrap><input type="checkbox" name="perm-<%=row.getItem("role_id")%>"<%=checked%>>&#160;<%=row.getItem("description")%></input></TD>
                    <td width="49%" class="bodyText">&#160;</td>
                        <input type="hidden" name="permid-<%=row.getItem("role_id")%>"/>
                </tr>
    </tc-webtag:iterator>
    <% } %>
                <tr><td colspan="3"><IMG src="/i/corp/clear.gif" WIDTH="1" HEIGHT="2" BORDER="0"></td></tr>
            </table>

            <p><br></p>

            <table cellspacing="0" cellpadding="3" width="80%">
                <TR>
                    <TD ALIGN="center" VALIGN="middle" CLASS="bodyText"><input type="button" onClick="Javascript:clearForm(document.frmUserEdit)" name="clear" value=" Clear ">&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
                </TR>
            </table>

            </form>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
