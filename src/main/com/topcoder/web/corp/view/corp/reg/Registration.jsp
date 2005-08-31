<%@ page
         contentType="text/html; charset=ISO-8859-1"
         import="com.topcoder.web.corp.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.corp.controller.request.Registration,
                 com.topcoder.web.corp.controller.request.UserEdit"
%>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Registration</title>

<jsp:include page="../includes/css.jsp" />
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top_generic.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left_generic.jsp" />
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top" width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr valign="top">
                    <td class="bodyText" width="100%">

                        <h3><font color="#666666"><strong>Registration</strong></font></h3>

                    </td>
                </tr>
            </table>

            <div align="center"><form action="<jsp:getProperty name="sessionInfo" property="secureAbsoluteServletPath"/>" method="POST" name="frmPrimReg">

            <table border="0" cellpadding="3" cellspacing="0" class="testFrame">
                <tr><td colspan="2" class="testTableTitle">Name and Contact Info</td></tr>
<!-- FIRST NAME -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="first-name"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">First Name</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="first-name" maxlength="30" size="30"/></td>
                </tr>

<!-- LAST NAME -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="last-name"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Last Name</td>
                    <td class="testTableEven"><tc-webtag:textInput name="last-name" size="30" maxlength="30"/></td>
                </tr>

<!-- TITLE -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="title"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Title</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="title" size="30" maxlength="30"/></td>
                </tr>

<!-- COMPANY NAME -->
                <% boolean extFieldsEditable = "true".equalsIgnoreCase((String)request.getAttribute("ext-fields-editable")); %>

                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="prim-company-name"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Company</td>
                    <td class="testTableEven"><tc-webtag:textInput name="prim-company-name" editable='<%=""+extFieldsEditable%>' size="30" maxlength="50"/></td>
                </tr>

<!-- ADDR LINE1 -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="prim-company-address-1"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Work Address</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="prim-company-address-1" size="30" maxlength="50"/></td>
                </tr>

<!-- ADDR LINE2 -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="prim-company-address-2"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd"></td>
                    <td class="testTableOdd"><tc-webtag:textInput name="prim-company-address-2" size="30" maxlength="50"/></td>
                </tr>

<!-- CITY -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="prim-company-city"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">City</td>
                    <td class="testTableEven"><tc-webtag:textInput name="prim-company-city" size="30" maxlength="30"/></td>
                </tr>

<!-- STATE/PROVINCE -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="prim-company-state"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">State</td>
                    <td class="testTableOdd">
                        <% ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("rsc-states-list"); %>
                        <tc-webtag:rscSelect name="prim-company-state" list="<%=rsc%>" fieldText="state_name" fieldValue="state_code"/>
                    </td>
                </tr>

<!-- ZIP CODE -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="prim-company-zip"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Zip</td>
                    <td class="testTableEven"><tc-webtag:textInput name="prim-company-zip"  size="10" maxlength="10"/></td>
                </tr>

<!-- COUNTRY -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="prim-company-country"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Country</td>
                    <td class="testTableOdd">
                        <% rsc = (ResultSetContainer)request.getAttribute("rsc-countries-list"); %>
                        <tc-webtag:rscSelect name="prim-company-country" list="<%=rsc%>" fieldText="country_name" fieldValue="country_code"/>
                    </td>
                </tr>

<!-- PHONE -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="phone"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Phone</td>
                    <td class="testTableEven"><tc-webtag:textInput name="phone" size="30" maxlength="100"/></td>
                </tr>

                <tr><td colspan="2" class="testTableEven"><img src="/i/corp/clear.gif" width="1" height="2" alt="" border="0"></td></tr>

                <tr><td colspan="2" class="testTableTitle">User Name &amp; Password</td></tr>

                <tr>
                    <td colspan="2">
                <% String id = (String)request.getAttribute(UserEdit.KEY_TARGET_USER_ID);
                    if( id != null ) { %>
                        <input type="hidden" name="<%=UserEdit.KEY_TARGET_USER_ID%>" value="<%=id%>">
                <% } %>
                    </td>
                </tr>

<!-- USER NAME -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="username"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">User Name</td>
                    <td class="testTableOdd"><tc-webtag:textInput editable='<%=""+(id==null)%>' name="username" size="30" maxlength="15"/></td>
                </tr>

<!-- PASSWORD -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="password"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Password</td>
                    <td class="testTableEven"><tc-webtag:textInput passw="true" name="password" size="30" maxlength="15"/></td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven"></td>
                    <td class="testTableEven" nowrap>Minimum of 7 characters, maximum of 15</td>
                </tr>

<!-- PASSWORD VERIFICATION -->
                <tr>
                    <td colspan="2" class="errorTextEven">
                        <tc-webtag:errorIterator id="err" name="password-once-more"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleEven">Re-type Password</td>
                    <td class="testTableEven"><tc-webtag:textInput passw="true" name="password-once-more" size="30"/></td>
                </tr>

<!-- EMAIL -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="email"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Email</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="email" size="30" maxlength="100"/></td>
                </tr>

<!-- EMAIL VERIFICATION -->
                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="email-once-more"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableSubtitleOdd">Re-type Email</td>
                    <td class="testTableOdd"><tc-webtag:textInput name="email-once-more" size="30" maxlength="100"/></td>
                </tr>

                <tr><td colspan="2" class="testTableOdd"><img src="/i/corp/clear.gif" width="1" height="2" alt="" border="0"></td></tr>

                <tr><td colspan="2" class="testTableTitle">Terms of Use</td></tr>

                <tr><td colspan="2" class="bodyText"><img src="/i/corp/clear.gif" width="1" height="2" alt="" border="0"></td></tr>

                <tr valign="middle">
                    <td colspan="2" class="bodyText" align="center"><tc-webtag:textArea name="<%=Constants.KEY_TERMS%>" rows="10" cols="80" readOnly="true" styleClass="bodyText"/></td>
                </tr>

                <tr>
                    <td colspan="2" class="errorTextOdd">
                        <tc-webtag:errorIterator id="err" name="<%=Constants.KEY_AGREE_TO_TERMS%>"><%=err%><br></tc-webtag:errorIterator>
                    </td>
                </tr>

                <tr>
                    <td class="testTableOdd" align="center" colspan="2">I Agree to the Terms and Conditions stated above&#160;&#160;<tc-webtag:chkBox name="<%=Constants.KEY_AGREE_TO_TERMS%>"/></td>
                </tr>

                <tr>
                    <td colspan="2"><img src="/i/corp/clear.gif" width="1" height="3" alt="" border="0">
                </tr>
            </table>

            <table border="0" cellpadding="3" cellspacing="0">
                <tr>
                    <td><img src="/i/corp/clear.gif" width="1" height="3" alt="" border="0">
                    <input type="hidden" name="module" value="Registration"></td>
                </tr>

                <tr>
                    <td class="bodyText" align="center"><input type="button" onClick="Javascript:clearForm(document.frmPrimReg)" name="clear" value=" Clear ">&#160;&#160;<input type="submit" onClick="" name="submit" value=" Submit "></td>
                </tr>
            </table>

            </form>

            <p><br></p>

            </div>
        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>

