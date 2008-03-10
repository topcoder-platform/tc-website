<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="520259" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">AMD and TopCoder Host a Series of Competitions to Advance Multi-Threaded Software Development</span><br />
<span class="bodySubTitle"><em>Beginning March 12, "Multicore Threadfest" Offers $20,000 Prize Purse and Recognition through Innovation</em></span></p>
</div>
      
<p>
<strong>SUNNYVALE, CALIF., March 10, 2008 &#151;</strong>AMD (NYSE: AMD) today announced a collaboration with TopCoder, the leader in software development programming competitions, to host quarterly coding competitions throughout 2008 focused on advancing multi-threading application development for multi-core processor architectures. Called Multicore Threadfest, the competitions provide a forum for the software development community to demonstrate advanced multi-threading principles, techniques and best practices. Competition winners will be awarded cash prizes and earn recognition throughout the developer community, with each of four series prize winners having his or her code posted on the AMD Developer Central website (<a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com' refer='pr_031008' />">http://developer.amd.com</a>), a resource portal for the software developer community.
</p>

<p>
"TopCoder believes AMD's commitment to advancing multi-threaded application development on multi-core processors is significant," said Mike Lydon, CTO, TopCoder. "TopCoder provides a recognized platform to highlight many of the world's top programmers as they tackle some of the biggest software problems we face today. We've seen first-hand how competitions can spark never-before-seen solutions and advances in programming. We look forward to seeing how these quarterly competitions, made possible through our collaboration with AMD, advance the industry."
</p>

<p>
The ability to run multi-threaded software applications has become critical to leveraging the performance of today's x86 processors. While multi-threading has traditionally been used primarily by server applications, increasingly more mainstream applications that run on workstations, desktops and notebook computers are multi-threaded in order to take advantage of the benefits of multi-core processing.
</p>

<p>
"By drawing attention to multi-threaded application development through these competitions, we hope to accelerate its growth. Talented software developers are essential to ensuring our advanced multi-core processors become a platform to enable optimized solutions for our customers," said Earl Stahl, vice president of Software Engineering, AMD. "Given the widespread adoption of multi-core processing that AMD believes is inevitable, we feel it is critical to support the software development community as it works to more fully leverage advances in hardware. Our collaboration with TopCoder promises to reward the best and brightest developers and, equally importantly, to collectively advance industry awareness and knowledge."
</p>

<p>
Multi-core processors not only offer the ideal performance environment for multi-threaded applications, they also offer significant benefits for developers as they work on the code, especially during the compiling process. Developers often times heavily rely on their computer resources and in many cases, the speed at which software code is being compiled results in greater productivity for the programmer. By leveraging multi-core processors, programmers can take advantage of a more efficient development cycle.
</p>

<p>
Held throughout 2008 beginning on March 12, these unique coding competitions are each scheduled to run several weeks in duration. The winners of Multicore Threadfest will receive cash prizes ranging from $250 to $2,500. Each of four first prize winners' code, expected to be announced within a week of  the competition's close, will be made available on AMD's Developer Central at <a target="_blank" href="<tc-webtag:linkTracking link='http://developer.amd.com' refer='pr_031008' />">http://developer.amd.com/</a>.
</p>

<p>
For additional details about Multicore Threadfest and TopCoder, please visit <a href="<tc-webtag:linkTracking link='/threadfest' refer='pr_031008' />">http://www.topcoder.com/threadfest</a>.
</p>

<p>
<span class="bodySubtitle">About AMD</span><br />
Advanced Micro Devices (NYSE: AMD) is a leading global provider of innovative processing solutions in the computing, graphics and consumer electronics markets. AMD is dedicated to driving open innovation, choice and industry growth by delivering superior customer-centric solutions that empower consumers and businesses worldwide. For more information, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.amd.com/' refer='pr_031008' />">http://www.amd.com</a>.
</p>

<p>
<strong>AMD, the AMD Arrow logo and combinations thereof, are trademarks of Advanced Micro Devices, Inc. Other names are for informational purposes only and may be trademarks of their respective owners.</strong>
</p>
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
