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
        <p>The second contest, which is open to all developers, begins November 23, 2009 and will conclude December 7, 2009.</P>
        <p>NVIDIA recommends that all contestants do the following:</p>
        <ol>
            <li>Sign up for <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/io_1233138441508.html' refer='nvidia_superhero' />">CUDA Alerts</a></li>
            <li>Learn more about <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_what_is.html' refer='nvidia_superhero' />">CUDA</a></li>
            <li>Download and try out <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">CUDA development tools</a></li>
			<li>Register and attend a <a target="_blank" href="<tc-webtag:linkTracking link='http://www.nvidia.com/object/cuda_get.html' refer='nvidia_superhero' />">webinar</a> to learn how to harness the power of CUDA.
			  </p>
        </li>
        </ol>
        <p>NVIDIA has scheduled a series Webinars exclusively for TopCoder members, so that everyone can get up-to-speed on parallel programming.</p>
        <p>There are a number of public Webinars that are also available so you can find the Webinar that fits your schedule. The public Webinar schedule and sign-up are located on the following link:
              <a target="_blank">              http://developer.nvidia.com/object/gpu_computing_online.html </a></p>
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