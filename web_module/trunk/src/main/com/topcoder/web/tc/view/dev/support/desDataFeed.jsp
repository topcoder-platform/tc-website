<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder - Data Feeds</title>

    <jsp:include page="../../script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="des_data_feeds"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyText">
<jsp:include page="../../page_title.jsp">
    <jsp:param name="image" value="comp_design"/>
    <jsp:param name="title" value="Data Feeds"/>
</jsp:include>

<h2>Data Feeds</h2>

<p>
    TopCoder provides access to some of it's data in the form of XML. Below you will find a
    listing of the available feeds. Please keep in mind that none of the feeds provide ordered data.
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Coder List</span><br/>
    This feed provides a list of coders who have competed in Algorithm, Development or Design competitions.
    It includes the following fields:
    <ul>
        <li>user id</li>
        <li>handle</li>
        <li>algorithm rating</li>
        <li>algorithm volatility</li>
        <li>number of rated algorithm events</li>
        <li>design rating</li>
        <li>design volatility</li>
        <li>number of rated design events</li>
        <li>development rating</li>
        <li>development volatility</li>
        <li>number of rated development events</li>
    </ul>

    <strong>FEED: http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_coder_list</strong>
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Active Designer List</span><br/>
    This feed provides a list of coders who have been rated in design within the last 180 days.
    It includes the following fields:
    <ul>
        <li>user id</li>
        <li>handle</li>
        <li>design rating</li>
        <li>design volatility</li>
        <li>number of rated design events</li>
    </ul>

    <strong>FEED: http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_active_designer_list</strong>
</p>

<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Design Rating History</span><br/>
    This feed provides data about the design rating history for a particular competitor.
    It includes the following fields:
    <ul>
        <li>handle</li>
        <li>user id</li>
        <li>project id</li>
        <li>component name</li>
        <li>catalog</li>
        <li>posting date</li>
        <li>submit by date</li>
        <li>final score</li>
        <li>submit date</li>
        <li>payment</li>
        <li>placed</li>
        <li>old rating</li>
        <li>new rating</li>
        <li>rating date</li>
    </ul>

    <strong>FEED: http://<%=ApplicationServer.SERVER_NAME%>/tc?module=BasicData&amp;c=dd_design_rating_history&amp;cr=USER_ID</strong>
    <br/>
    NOTE: You will need to replace "USER_ID" in the query string to get data about a particular competitor.
</p>


<p style="border-top: 1px solid #999999;"><span class="bodySubtitle">Project Results</span><br/>
    This feed provides data about the results of a design project.
    It includes the following fields:
    <ul>
        <li>Project Information
        	<ul>
        		<li>project id</li>
        		<li>component id</li>
        		<li>component name</li>
        		<li>component version</li>
        		<li>status</li>
        		<li>phase</li>
        		<li>category</li>
		        <li>posting date</li>
		        <li>submit by date</li>
		        <li>complete date</li>
		        <li>rating date</li>
		        <li>number of registrations</li>
		        <li>number of submissions</li>		        
		        <li>number of valid submissions</li>		        
		        <li>number of submissions that passed review</li>	
		        <li>winner</li>
		        <li>Digital Run Stage</li>
		     </ul>	        
        </li>
        <li>Reviewers
        	<ul>
        		<li>reviewer id</li>
        		<li>reviewer name</li>
        		<li>role id</li>
        		<li>role name</li>        		
        	</ul>
        </li>
        <li>Submissions
        	<ul>
        		<li>coder</li>
        		<li>placed</li>
        		<li>old rating</li>
        		<li>new rating</li>
        		<li>old reliability</li>
        		<li>new reliability</li>
        		<li>total number of appeals</li>
        		<li>total number of successful appeals</li>
        		<li>inquire timestamp</li>
        		<li>submit timestamp</li>
        		<li>screening score</li>
        		<li>passed screening indicator</li>
        		<li>raw score</li>
        		<li>final score</li>
        		<li>Digital Run points</li>
        		<li>Review Information
        			<ul>
		        		<li>reviewer id</li>
		        		<li>reviewer name</li>
		        		<li>role id</li>
		        		<li>role name</li>        		
		        		<li>number of appeals</li>
		        		<li>number of successful appeals</li>		        		
		        		<li>raw score</li>
		        		<li>final score</li>
        			</ul>
        		</li>
        	</ul>
        </li>
    </ul>

    <strong>FEED: http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ComponentProjectResultFeed&amp;pj=PROJECT_ID</strong>
    <br/>
    NOTE: You will need to replace "PROJECT_ID" in the query string to get data about a particular project.
</p>

<p><br/></p>
</td>
<!-- Center Column Ends -->

<!-- Gutter -->
<td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="../../public_right.jsp">
        <jsp:param name="level1" value="privatelabel"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="../../foot.jsp"/>

</body>

</html>
