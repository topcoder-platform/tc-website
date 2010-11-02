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
           
        <div align="center"><img src="/i/events/nvidia_logo.jpg" border="0px" alt="NVIDIA Logo" /></div>
		
        <br /><br />
        
		
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
            <a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NVIDIAInstructions">How to Compete</a> &#160;&#160;|&#160;&#160;
			<a href="/tc?module=Static&amp;d1=sponsors&amp;d2=NVIDIARules">Rules</a>&#160;&#160;|&#160;&#160;
            <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>
		</p>
        
        <span class="bigTitle">Overview</span>
        <p>NVIDIA's <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_home.html#' refer='nvidia_superhero' />">CUDA Zone</a> is pleased to host the CUDA Superhero Challenge, a series of marathon matches which will harness the parallel processing power of the NVIDIA CUDA architecture to solve some of computing's biggest challenges. </p>
        <p>The first contest was a great success!&nbsp; With over 200 competitors and almost 700 submissions, five lucky members won cash prizes!<br />
            1st Place:&nbsp;<a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=20771536" target="_blank">iquadrat</a><br />
            2nd Place: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15635535" target="_blank">b285714</a><br />
            3rd Place: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22837355" target="_blank">nemossi</a><br />
            4th Place: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=283329" target="_blank">JacoCronje</a><br />
            5th Place: <a href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=22688436" target="_blank">foota</a></p>
        <p>TopCoder interviewed the first and second place winners. Read their interview <a href="http://www.topcoder.com/news/2009/10/01/interview-with-nvidia-cuda-superheros-iquadrat-and-b285714/" target="_blank">here.</a></p>
        <p>The second marathon match, which is open to all developers, begins November 23, 2009 and will conclude December 7, 2009.&nbsp; What can you do if you are new to this competition?</P>
            <ol>
                <li>Check out the resources on <a href="http://www.topcoder.com/tc?module=LinkTracking&amp;link=http://www.nvidia.com/object/cuda_home.html#&amp;refer=nvidia_superhero">CUDA Zone</a>.</li>
                <li>NVIDIA hosted a number of webinars to familiarize you with CUDA, so find them <a href="http://developer.nvidia.com/object/gpu_computing_online.html;refer=nvidia_superhero">here</a>.</li>
                <li>Practice in the practice room on the <a href="http://www.topcoder.com/longcontest/?module=ViewProblemStatement&amp;rd=13957&amp;pm=10644">last CUDA competition problem</a>.</li>
                <li>Get involved with the competition forums <a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=530516">here</a> and <a href="http://forums.topcoder.com/?module=ThreadList&amp;forumID=530387">here</a> to learn and improve your skills.</li>
            </ol>
        <p>NVIDIA also recommends that all contestants who want to compete do the following:</p>
            <ol>
              <li>Learn more about <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_what_is.html' refer='nvidia_superhero' />">CUDA</a></li>
                <li>Download and try out <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">CUDA development tools</a></li>
                <li>Register and attend a <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">webinar</a> to learn how to harness the power of CUDA.</li>
              <li>Sign up for <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/io_1233138441508.html' refer='nvidia_superhero' />">CUDA Alerts</a></li>
            </ol>
        <p>&nbsp;</p>

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