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
        <p>NVIDIA's <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_home.html#' refer='nvidia_superhero' />">CUDA Zone</a> is pleased to host the CUDA Superhero Challenge, a series of marathon matches which will harness the parallel processing power of the NVIDIA CUDA architecture to solve some of computing's biggest challenges. We are excited to be announce these contests and can't wait to see what you come up with.  And of course this wouldn't be a competition without cash prizes!</p>
        <p>The first contest, which is open to all developers, begins September 14th and will conclude September 25th.   The contest will award $5,000 of prizes divided among five winners, who will be announced at the GPU Technology Conference to be held at the Fairmont Hotel in San Jose, California, beginning Sept. 30. </P>
        <p>NVIDIA recommends that all contestants do the following:</p>
        <ol>
            <li>Sign up for <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/io_1233138441508.html' refer='nvidia_superhero' />">CUDA Alerts</a></li>
            <li>Learn more about <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_what_is.html' refer='nvidia_superhero' />">CUDA</a></li>
            <li>Download and try out <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">CUDA development tools</a></li>
			<li>Register and attend a <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">webinar</a> to learn how to harness the power of CUDA.</li>
        </ol></p>
        <p>NVIDIA has scheduled a series Webinars exclusively for TopCoder members, so that everyone can get up-to-speed on parallel programming.</p>
        <p>Please follow the links to register for each webinar you would like to attend. Advance registration is required. Please note all times are listed in Eastern Daylight Time (EDT) GMT/UTC -4.  See what the times are in your area.</p>
        <p><a href="http://timeanddate.com/worldclock/fixedtime.html?month=9&amp;day=9&amp;year=2009&amp;hour=12&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">Noon EDT</a> and <a href="http://timeanddate.com/worldclock/fixedtime.html?month=9&amp;day=10&amp;year=2009&amp;hour=0&amp;min=0&amp;sec=0&amp;p1=98" target="_blank">Midnight EDT</a><br />
          <br />
          Full Schedule and short abstracts can be viewed <a href="http://developer.nvidia.com/object/gpu_computing_online.html?refCode=nvinvite" target="_blank">here.</a></p>
        <p><strong>An Introduction to GPU Computing and The CUDA Architecture, 1.5 Hour</strong><br />
        	Wednesday, September 9, 2009: Noon EDT<br />
        	<a href="https://www2.gotomeeting.com/register/165166034" target="_blank">https://www2.gotomeeting.com/register/165166034</a></p>
        <p>Wednesday September 9, 2009: Midnight EDT<br />
          <a href="https://www2.gotomeeting.com/register/151806587" target="_blank">https://www2.gotomeeting.com/register/151806587</a><br />
          <br />
          Monday September 21, 2009:  Noon EDT<br />
          <a href="https://www2.gotomeeting.com/register/691302954" target="_blank">https://www2.gotomeeting.com/register/691302954</a></p>
        <p><strong>Memory Optimization and Performance Considerations for CUDA, 1.5 hours</strong><br />
          Thursday September 10, 2009:  Noon EDT<br />
          <a href="https://www2.gotomeeting.com/register/323885467" target="_blank">https://www2.gotomeeting.com/register/323885467</a><br />
          <br />
          Thursday September 10, 2009:  Midnight EDT<br />
          <a href="https://www2.gotomeeting.com/register/492323699" target="_blank">https://www2.gotomeeting.com/register/492323699</a><br />
          <br />
          Thursday September 24, 2009:  Noon EDT<br />
          <a href="https://www2.gotomeeting.com/register/914977899" target="_blank">https://www2.gotomeeting.com/register/914977899</a><br />
</p>
        <p><strong>Further CUDA Optimization Techniques, 1.5 hours</strong><br />
          Friday September 11, 2009:  Noon EDT<br />
          <a href="https://www2.gotomeeting.com/register/611462842" target="_blank">https://www2.gotomeeting.com/register/611462842</a><br />
          <br />
          Friday September 25, 2009: Noon EDT<br />
          <a href="https://www2.gotomeeting.com/register/547728371" target="_blank">https://www2.gotomeeting.com/register/547728371</a></p>
        	<p>In addition to the TopCoder specific Webinars, there are a number of public Webinars that are also available so you can find the Webinar that fits your schedule.  The public Webinar schedule and sign-up are located on the following link:<br />
        	<a href="http://developer.nvidia.com/object/gpu_computing_online.html">http://developer.nvidia.com/object/gpu_computing_online.html</a></p>
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