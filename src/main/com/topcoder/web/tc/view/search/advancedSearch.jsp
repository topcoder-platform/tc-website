<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants,
                 com.topcoder.web.tc.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@ page language="java"  %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="memberSearch" class="com.topcoder.web.tc.model.MemberSearch" scope="request" />

<html>

<head>

<title>Member Search Results at TopCoder</title>

<jsp:include page="../script.jsp"/>

<script language="JavaScript"><!--
                        var search=document.searchForm;
                        function submitEnter(e) {
                            var keycode;
                            if (window.event) keycode = window.event.keyCode;
                            else if (e) keycode = e.which;
                            else return true;
                            if (keycode == 13) {
                                submitSearch();
                                return false;
                            } else return true;
                        }
                        function submitSearch() {
                            if (checkInput()) {
                                search.submit();
                            }
                        }
//--></script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<jsp:include page="../top.jsp" />

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
    <!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="99%">
            <jsp:include page="../body_top.jsp" >
                <jsp:param name="image" value="statistics"/>
                <jsp:param name="image1" value="steelblue"/>
                <jsp:param name="title" value="Member Search Results"/>
            </jsp:include>

            <table border="0" cellspacing="0" cellpadding="10" bgcolor="#001B35" width="100%">
                <form name="searchForm" method="get">
                    <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="AdvancedSearch"/>
                    <input type="hidden" name=<%=DataAccessConstants.START_RANK%> value=""/>
                    <input type="hidden" name=<%=DataAccessConstants.END_RANK%> value=""/>

                    <tr valign="top">
                        <td colspan="2"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>

                            <p class="statText">
                                Enter search criteria below then click the go button. Search results matching the criteria
                                selections will be returned. Click on a Handle to view information about the Coder.
                            </p>

                            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                                <tr><td background="/i/steel_gray_bg.gif" class="statTextBig">Member Search: Search by handle, rating or state.</td></tr>

                                <tr>
                                    <td background="/i/steel_bluebv_bg.gif" class="statText">
                                        An underscore ( _ ) = one character space<br/>
                                        A percent sign ( % ) = any number of character spaces
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr valign="top">
                        <td width="50%">
                            <table border="0" cellspacing="5" cellpadding="0">
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
                                        <% ResultSetContainer stateRsc = memberSearch.getStateList(); %>
                                        <tc-webtag:rscSelect name="<%=Constants.STATE_CODE%>" list="<%=stateRsc%>" fieldText="state_name" fieldValue="state_code"/>
                                    </td>
                                </tr>

                                <tr><td class="statText"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>

                                <tr><td class="statText">Max Time Since Last Competition</td></tr>

                                <tr>
                                    <td class="statText">
                                        <select name="<%=Constants.MAX_DAYS_SINCE_LAST_COMP%>" size="1">
                                            <option value="">None Specified</option>
                                            <option value="30">
                                                30 Days
                                            </option>
                                            <option value="90">
                                                90 Days
                                            </option>
                                            <option value="180">
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
                            <A href="javascript:submitSearch()"><xsl:attribute name="CLASS">statText</xsl:attribute>[ Submit ]</A><br /><br />
                        </td>
                    </tr>
                </form>
            </table>
        </td>


<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
