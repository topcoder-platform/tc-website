<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

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

<br/>
                <table border="0" cellspacing="0" cellpadding="0" align="center" width="510">
                    <input type="hidden" name="module" value="AdvancedSearch"/>
                    <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
                    <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>

                    <tr valign="top">
                        <td>
                            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                                <tr>
                                <td class="bodyText">
                                Enter search criteria below then click the Search button. Search results matching the criteria
                                selections will be returned. Click on a Handle to view information about the Coder.
                                </td>
                                </tr>
                             </table>
                          </tr>
                       </td>
                </table>

                <table border="0" cellspacing="0" cellpadding="0" align="center" width="510" class="formFrame">
                    <tr valign="top">
                        <td colspan="2">
                            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                                <tr><td class="searchHeaders">Member Search: Search by handle, rating, state or country.</td></tr>

                                <tr>
                                    <td class="bodyText">
                                        An underscore ( _ ) = one character space<br/>
                                        A percent sign ( % ) = any number of character spaces
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr valign="top">
                        <td width="50%" align="center">
                            <table border="0" cellspacing="5" cellpadding="0">
                                <tr><td class="bodyText">Handle</td></tr>
                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="20" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="bodyText" valign="middle" height="15" width="50%">State</td></tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=memberSearch.getStateList()%>" fieldText="state_name" fieldValue="state_code"/>
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="bodyText" valign="middle" height="15" width="50%">Country</td></tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=memberSearch.getCountryList()%>" fieldText="country_name" fieldValue="country_code"/>
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="bodyText">Max Time Since Last Competition</td></tr>

                                <tr>
                                    <td class="bodyText">
                                        <select name="<%=Constants.MAX_DAYS_SINCE_LAST_COMP%>" size="1">
                                            <option value="">None Specified</option>
                                            <option value="30" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(30))?"selected":""%>>
                                                30 Days
                                            </option>
                                            <option value="90" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(90))?"selected":""%>>
                                                90 Days
                                            </option>
                                            <option value="180" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(180))?"selected":""%>>
                                                180 Days
                                            </option>
                                        </select>
                                    </td>
                                </tr>

                                <tr><td class="bodyText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="bodyText">School</td></tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.SCHOOL_NAME%>" size="20" maxlength="150" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                            </table>
                        </td>

                        <td width="50%" align="center">
                            <table border="0" cellspacing="5" cellpadding="0">
                                <tr><td class="bodyText" align="center" colspan="2">Rating</td></tr>

                                <tr>
                                    <td class="bodyText" width="50%" align="center">Min</td>
                                    <td class="bodyText" width="50%" align="center">Max</td>
                                </tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                                <tr><td class="bodyText" align="center" colspan="2"># of Rated Events</td></tr>

                                <tr>
                                    <td class="bodyText" width="50%" align="center">Min</td>
                                    <td class="bodyText" width="50%" align="center">Max</td>
                                </tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_NUM_RATINGS%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_NUM_RATINGS%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                                <tr><td class="bodyText" align="center" colspan="2">Design Rating</td></tr>

                                <tr>
                                    <td class="bodyText" width="50%" align="center">Min</td>
                                    <td class="bodyText" width="50%" align="center">Max</td>
                                </tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_DESIGN_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_DESIGN_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                                <tr><td class="bodyText" align="center" colspan="2">Development Rating</td></tr>

                                <tr>
                                    <td class="bodyText" width="50%" align="center">Min</td>
                                    <td class="bodyText" width="50%" align="center">Max</td>
                                </tr>

                                <tr>
                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_DEV_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="bodyText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_DEV_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>


                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="bodyText" align="center">
                            <A href="javascript:document.searchForm.submit()" class="bodyText"><img src="/i/search.gif" width="60" height="18" border="0"/></A><br /><br />
                        </td>
                    </tr>
                </table>
