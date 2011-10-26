<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder - Help</title>

    <jsp:include page="../script.jsp"/>
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="../includes/global_left.jsp">
        <jsp:param name="node" value="long_data_feeds"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyText">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="mm_support_faqs"/>
    <jsp:param name="title" value="Data Feeds"/>
</jsp:include>


<h2>Data Feeds</h2>

<p>
    TopCoder provides access to some of it's data in the form of XML. Below you will find a
    listing of the available feeds. Please keep in mind that none of the feeds provide ordered data.
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Coder List</span><br/>
    This feed provides a list of coders who have competed in Algorithm, Marathon, Development or Design competitions.
    It includes the following fields:
    <ul>
        <li>user id</li>
        <li>handle</li>
        <li>country</li>
        <li>algorithm rating</li>
        <li>algorithm volatility</li>
        <li>number of rated algorithm events</li>
        <li>design rating</li>
        <li>design volatility</li>
        <li>number of rated design events</li>
        <li>development rating</li>
        <li>development volatility</li>
        <li>number of rated development events</li>
        <li>marathon rating</li>
        <li>marathon volatility</li>
        <li>number of rated marathon events</li>
    </ul>
    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_coder_list</strong>
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Active Marathon Match Coder List</span><br/>
    This feed provides a list of coders who have been rated in a marathon match competition within the last 180 days.
    It includes the following fields:
    <ul>
        <li>user id</li>
        <li>handle</li>
        <li>country</li>
        <li>marathon rating</li>
        <li>marathon volatility</li>
        <li>number of rated marathon events</li>
    </ul>

    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_active_marathon_list</strong>
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Marathon Match Rating History</span><br/>
    This feed provides data about the marathon match rating history for a particular competitor.
    It includes the following fields:
    <ul>
        <li>handle</li>
        <li>user id</li>
        <li>round id</li>
        <li>number of rated events of the coder after the match</li>
        <li>problem id</li>
        <li>round name</li>
        <li>date</li>
        <li>old rating</li>
        <li>new rating</li>
        <li>old volatility</li>
        <li>new volatility</li>
        <li>rank</li>
        <li>percentile</li>
    </ul>

    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_marathon_rating_history&amp;cr=USER_ID</strong>
    <br/>
    You will need to replace "USER_ID" in the query string to get data about a particular competitor.
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Marathon Match Round List</span><br/>
    This feed provides a list of marathon match rounds.
    <ul>
        <li>round id</li>
        <li>full name</li>
        <li>short name</li>
        <li>round type</li>
        <li>date</li>
    </ul>
    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_marathon_round_list</strong>
</p>


<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Marathon Match Round Results</span><br/>
    This feed provides details about all the competitors in a marathon match round.
    It includes the following fields:
    <ul>
        <li>round id</li>
        <li>user id</li>
        <li>handle</li>
        <li>old rating</li>
        <li>new rating</li>
        <li>old volatility</li>
        <li>new volatility</li>
        <li>num ratings</li>        
        <li>placed</li>
        <li>advanced (Y or N)</li>
        <li>provisional score</li>
        <li>final score</li>
        <li>num submissions</li>
        <li>rated flag</li>
    </ul>
    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_marathon_round_results&amp;rd=ROUND_ID</strong>
    <br/>
    You will need to replace "ROUND_ID" in the query string to get data about a particular round.

</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Marathon Match Individual Round Results</span><br/>
    This feed provides details about the submission history and the system tests for an user in a round.
    <ul>
        <li>round id</li>
        <li>user id</li>
        <li>handle</li>
        <li>submission history
            <ul>
                <li>number</li>
                <li>score</li>
                <li>language</li>
                <li>submission time</li>                
            </ul>
        </li>
        <li>testcases
            <ul>
                <li>test case id</li>
                <li>score</li>
                <li>processing time</li>
                <li>fatal error indicator</li>
            </ul>
        </li>               
    </ul>
    <strong>FEED:<br />http://<%=ApplicationServer.SERVER_NAME%>/longcontest/stats/?module=IndividualResultsFeed&rd=ROUND_ID&cr=CODER_ID</strong>
    <br/>
    You will need to replace "ROUND_ID" and "USER_ID" in the query string to get data about a particular round and coder.
</p>

<p><br/></p>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>
