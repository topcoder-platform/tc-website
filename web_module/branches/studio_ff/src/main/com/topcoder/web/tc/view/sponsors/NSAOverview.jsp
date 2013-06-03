<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">

<head>
    <title>TopCoder Sponsor</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../script.jsp" />
    <jsp:include page="../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value="long"/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="m_long_contests"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">
           
        <div align="center"><img src="/i/sponsor/nsa/nsa_logo.jpg" border="0px" alt="NSA Logo" /><br /><br />
        	<h1>NSA Marathon Match Event</h1>
        </div>
        
        
		
		<%-- 
        <div style="float: right;">
        <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
            <strong>
                <a style="text-decoration:none;" href=""></a>
            </strong>
        </div>
        <br /><br />
        --%>

        <p align="center">
            Overview&#160;&#160;|&#160;&#160;
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NSAInstructions">How to Compete</a> &#160;&#160;|&#160;&#160;
			<a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NSARules">Rules</a>&#160;&#160;|&#160;&#160;
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
		</p>
        <br /><br />
        <span class="bigTitle">The National Security Agency</span><br />
        <p><span class="bodySubtitle">Where Intelligence Goes to Work</span><br />

        <p>
<object width="560" height="340"><param name="movie" value="http://www.youtube.com/v/Ini5TKBFL9U&hl=en_US&fs=1&"></param><param name="allowFullScreen" value="true"></param><param name="allowscriptaccess" value="always"></param><embed src="http://www.youtube.com/v/Ini5TKBFL9U&hl=en_US&fs=1&" type="application/x-shockwave-flash" allowscriptaccess="always" allowfullscreen="true" width="560" height="340"></embed></object>         </p>

		<p>If you want to work on interesting projects that challenge your mind and really make a difference, a career at the National Security Agency (NSA) is for you. At NSA, you can use your intelligence to gather and analyze foreign signals, protect U.S. information systems, or solve a number of other challenges not found anywhere else. We offer a wide variety of career opportunities for entry-level graduates and professionals, as well as internships and scholarships. But no matter which career path you choose at NSA, you can help to protect our country and its citizens.</p>
        <p>NSA is the world leader in the protection and exploitation of intelligence. We gather and analyze foreign signals intelligence to produce vital information for U.S. policymakers and warfighters. And we protect American intelligence from the ever-listening ears of our adversaries, giving our Nation a decisive edge.</p>
        <p>NSA conducts one of the U.S. Government's leading research and development programs. We are also the largest employer of Mathematicians in the country, as well as one of the most important centers of foreign language analysis and research.</p>
        <p>Explore NSA and see how you can put your intelligence to work for the world's technology leader and top cryptologic organization. </p>

        <p><span class="bodySubtitle">Career Opportunities</span><br />
		NSA has exciting career opportunities available in the following fields:</p>
        <ul>
        	<li>Computer/Electrical Engineering</li>
        	<li>Computer Science</li>
        	<li>Information Assurance</li>
        	<li>Mathematics</li>
        	<li>Foreign Language</li>
        	<li>Intelligence Analysis</li>
        	<li>Cryptanalysis</li>
        	<li>Signals Analysis</li>
        	<li>Business Management</li>
        	<li>And Others</li>
          </ul>
			<p>You'll enjoy an incredible benefits package, flexible schedules, and the satisfaction of making the world a safer place.</p>
			<p>Be part of a team like no other. Visit <a href="<tc-webtag:linkTracking link='http://www.NSA.gov/Careers' refer='tc-sponsor' />">www.NSA.gov/Careers</a>.</p>
			<p>U.S. citizenship is required. NSA is an Equal Opportunity Employer. </p>

            <p> <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NSAOverview-confirm"><img src="/i/sponsor/apply_now_btn.png" border="0px" alt="Apply to NSA now!" /></a></p><br /><br />

          </div>
        </td>
<%-- Center Column Ends --%>
       
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
       
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>