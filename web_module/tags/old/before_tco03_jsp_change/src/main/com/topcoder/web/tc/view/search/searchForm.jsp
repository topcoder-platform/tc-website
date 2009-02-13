<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.DataAccessConstants"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

                <table border="0" cellspacing="0" cellpadding="0"width="100%">
                    <input type="hidden" name="module" value="AdvancedSearch"/>
                    <input type="hidden" name="<%=DataAccessConstants.START_RANK%>" value=""/>
                    <input type="hidden" name="<%=DataAccessConstants.END_RANK%>" value=""/>

                    <tr valign="top">
                        <td colspan="2"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>
                            <table border="0" cellspacing="0" cellpadding="5" width="100%" bgcolor="#FFFFFF">
                                <tr>
                                <td class="bodyText">
                                Enter search criteria below then click the go button. Search results matching the criteria
                                selections will be returned. Click on a Handle to view information about the Coder.
                                </td>
                                </tr>
                             </table>                                
                            <table border="0" cellspacing="0" cellpadding="5" width="100%" bgcolor="#555555">
                                <tr><td class="statTextBig">Member Search: Search by handle, rating or state.</td></tr>

                                <tr>
                                    <td background="/i/graybv_lite_bg.gif" class="statText">
                                        An underscore ( _ ) = one character space<br/>
                                        A percent sign ( % ) = any number of character spaces
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr valign="top">
                        <td width="50%">
                            <table border="0" cellspacing="5" cellpadding="0" bgcolor="#333333" >
                                <tr><td class="statText">Handle</td></tr>
                                <tr>
                                    <td class="statText">
                                        <tc-webtag:textInput name="<%=Constants.HANDLE%>" size="15" maxlength="20" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="statText" valign="middle" height="15" width="50%">State</td></tr>

                                <tr>
                                    <td class="statText">
                                        <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=memberSearch.getStateList()%>" fieldText="state_name" fieldValue="state_code"/>
                                    </td>
                                </tr>

                                <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="statText" valign="middle" height="15" width="50%">Country</td></tr>

                                <tr>
                                    <td class="statText">
                                        <tc-webtag:rscSelect name="<%=Constants.COUNTRY_CODE%>" list="<%=memberSearch.getCountryList()%>" fieldText="country_name" fieldValue="country_code"/>
                                    </td>
                                </tr>

                                <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="statText">Max Time Since Last Competition</td></tr>

                                <tr>
                                    <td class="statText">
                                        <select name="<%=Constants.MAX_DAYS_SINCE_LAST_COMP%>" size="1">
                                            <option value="">None Specified</option>
                                            <option value="30" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(30))?"selected":""%>>
                                                30 Days
                                            </option>
                                            <option value="90" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(30))?"selected":""%>>
                                                90 Days
                                            </option>
                                            <option value="180" <%=memberSearch.getMaxDaysSinceLastComp()!=null&&memberSearch.getMaxDaysSinceLastComp().equals(new Integer(30))?"selected":""%>>
                                                180 Days
                                            </option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </td>

                        <td width="50%">
                            <table border="0" cellspacing="5" cellpadding="0">
                                <tr><td class="statTextBig" align="center" colspan="2">Rating</td></tr>

                                <tr>
                                    <td class="statText" width="50%">Min</td>
                                    <td class="statText" width="50%">Max</td>
                                </tr>

                                <tr>
                                    <td class="statText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="statText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_RATING%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>

                                <tr><td colspan="2"><img src="/i/clear.gif" alt="" width="1" height="3" border="0"/></td></tr>

                                <tr><td class="statTextBig" align="center" colspan="2"># of Rated Events</td></tr>

                                <tr>
                                    <td class="statText" width="50%">Min</td>
                                    <td class="statText" width="50%">Max</td>
                                </tr>

                                <tr>
                                    <td class="statText">
                                        <tc-webtag:textInput name="<%=Constants.MIN_NUM_RATINGS%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>

                                    <td class="statText">
                                        <tc-webtag:textInput name="<%=Constants.MAX_NUM_RATINGS%>" size="6" maxlength="6" onkeypress="submitEnter(event)"/>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td colspan="2" class="statText" align="center">
                            <A href="javascript:document.searchForm.submit()" class="statText">[ Submit ]</A><br /><br />
                        </td>
                    </tr>
                </table>
