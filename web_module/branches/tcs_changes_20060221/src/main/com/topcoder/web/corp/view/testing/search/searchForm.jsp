<%@ page import="com.topcoder.web.corp.common.Constants,
                com.topcoder.shared.dataAccess.DataAccessConstants,
                java.util.*"%>
<%@ page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="privatelabel.tld" prefix="pl" %>
<jsp:useBean id="searchResults" class="com.topcoder.web.corp.model.SearchModel" scope="request" />
<%List questionList = searchResults.getQuestions();%>
<script language="JavaScript"><!--
                        function submitEnter(e) {
                            var keycode;
                            if (window.event) keycode = window.event.keyCode;
                            else if (e) keycode = e.which;
                            else return true;
                            if (keycode == 13) {
                                document.searchForm.submit();
                                return false;
                            } else return true;
                        }
//--></script>
                <table border="0" cellspacing="0" cellpadding="0" align="center" width="400">
                    <tr valign="top">
                        <td>
                            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                                <tr>
                                <td class="bodyText">
                                Enter search criteria below then click the Search button. Search results matching the criteria
                                selections will be returned. Click on a name to view information about the Coder.
                                </td>
                                </tr>
                             </table>
                          </tr>
                       </td>
                </table>

                <table border="0" cellspacing="0" cellpadding="0" align="center" width="400" class="screeningFrame">
                    <tr valign="top">
                        <td colspan="2">
                            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                                <tr><td class="screeningHeader">Member Search: Search by first name, last name, and email address.</td></tr>

                                <tr>
                                    <td class="screeningCellOdd" colspan=2 align=center>
                                        An underscore ( _ ) = one character space<br/>
                                        A percent sign ( % ) = any number of character spaces
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr valign="top">
                        <td width="100%" align="center">
                            <table border="0" cellspacing="0" cellpadding="0" width=100%">
                                <tr>
                                    <td class="screeningCellEven" width="25%" align=right>First Name:</td>
                                    <td class="screeningCellEven" width="75%">
                                        <%-- FIRST NAME TEXT BOX--%>
                                        <tc-webtag:textInput name="<%=Constants.FIRST_NAME%>" size="30" maxlength="50" onKeyPress="submitEnter(event)" />
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr>
                                    <td class="screeningCellOdd" align=right>Last Name:</td>
                                    <td class="screeningCellOdd">
                                        <tc-webtag:textInput name="<%=Constants.LAST_NAME%>" size="30" maxlength="50"  onKeyPress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr>
                                    <td class="screeningCellEven" align=right>Email Address:</td>
                                    <td class="screeningCellEven">
                                        <tc-webtag:textInput name="<%=Constants.EMAIL_ADDRESS%>" size="30" maxlength="50" onKeyPress="submitEnter(event)" />
                                    </td>
                                </tr>
                                <%
                                    String[] cssClasses = new String[] { "screeningCellOdd", "screeningCellEven" };
                                    int counter = 0;
                                %>
                                <pl:questionIterator id="question" list="<%=questionList%>">
                                <%if(question.getId() == Constants.AREA_OF_INTEREST_ID || question.getId() == Constants.DEGREE_ID) { %>
                                <tr>
                                    <td class="<%=cssClasses[counter % 2]%>" align=right>
                                        <%=question.getText()%>
                                    </td>
                                    <td class="<%=cssClasses[counter++ % 2]%>">
                                        <pl:demographicInput question="<%=question%>"/>
                                    </td>
                               </tr>
                               <%} %>
                            </pl:questionIterator>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="screeningCellEven" align="center">
                            <A href="javascript:document.searchForm.submit()" class="bodyText"><img src="/i/search.gif" width="60" height="18" border="0"/></A>
                        </td>
                    </tr>
                </table>
