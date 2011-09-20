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
                    
	<div align="right"><tc-webtag:forumLink forumID="530876" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder and NVIDIA Announce Winners of CUDA Superhero Challenge at NVIDIA GPU Technology Conference </span><br />
<span class="bodySubTitle"><em>Developers from Switzerland, China, Russian Federation, South Africa and Japan Reap Rewards with the NVIDIA CUDA Architecture</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - October 1, 2009</strong> - NVIDIA Corporation and TopCoder, Inc., today announced the winners of the first CUDA Superhero Challenge at NVIDIA's GPU Technology Conference. The Challenge series of contests asks computer programmers to harness the parallel processing power of the NVIDIA(R) CUDA(TM) architecture to solve some of computing's biggest challenges. First place prize went to Micha Riser, of Zurich, Switzerland who earned a $2,500 prize for his winning solution, closely followed by runner up Hou Qiming of Beijing, China, who won $1,000 for his submission.</p>

<p>"I started exploring CUDA only in the second week of the contest. I had heard of it before but never got the chance to try it out myself," said Riser, a software engineer at carrara engineering GmbH, Switzerland. "The contest was very fun, and I learned much about the CUDA framework and the computation power of the NVIDIA graphic cards as well as about the CCL problem and different ways to solve it."</p>

<p>This first Challenge in the series of contests ran Sept. 14th through Sept. 25th, and centered on image processing using GPU accelerated connected component labeling (CCL). One of the most common processing steps in applications such as real time object recognition, machine vision and many others, CCL is a simple but computationally intensive process. A series of high resolution images were provided and competitors were challenged to identify all objects and areas consisting of groups of adjacent pixels of the same color within a specified threshold, with submitted implementations scored on the basis of correctness and total overall performance.</p>

<p>"We were able to enlighten 1000s of developers on the advantages parallel programming offers," said Sanford Russell, general manager of the CUDA group at NVIDIA." When talented developers see the ease and performance advantages of co-processing with the NVIDIA CUDA architecture first-hand, they understand the excitement behind the GPU Computing revolution."</p>

<p>The full problem set can be found here: <a href="http://www.topcoder.com/longcontest/?module=ViewProblemStatement&compid=9732&rd=13957">http://www.topcoder.com/longcontest/?module=ViewProblemStatement&compid=9732&rd=13957</a></p>

<p><strong>Final Results</strong><br />
<table cellpadding="10" cellmargin="0" border="1">
	<tr>
		<td>1st Place</td>
		<td>Micha Riser, Zurich, Switzerland</td>
		<td>"iquadrat"</td>
		<td>$2,500</td>
	</tr>
	<tr>
		<td>2nd Place</td>
		<td>Hou Qiming,  Tangshan Province, China</td>
		<td>"b285714"</td>
		<td>$1,000</td>
	</tr>
	<tr>
		<td>3rd Place</td>
		<td>Sergey Ilin, Omsk, Russian Federation</td>
		<td>"nemossi"</td>
		<td>$750</td>
	</tr>
	<tr>
		<td>4th Place</td>
		<td>Jaco Cronje, Rietvalleirand, South Africa</td>
		<td>"JacoCronje"</td>
		<td>$500</td>
	</tr>
	<tr>
		<td>5th Place</td>
		<td>Noriyuki Futatsugi, Tokyo, Japan</td>
		<td>"foota"</td>
		<td>$250</td>
	</tr>
</table><br />
The five winners from across the globe share a total $5,000 in prizes and were announced live today at NVIDIA's GPU Technology Conference at the Fairmont Hotel in San Jose, Calif. </p>

<p>The second competition in the series will run November 23rd through December 7th. Additional details about the Challenge can be found at <a href="http://www.topcoder.com/nvidia">www.topcoder.com/nvidia</a>.</p>

<p>To learn more about the NVIDIA CUDA architecture or to accelerate programming skills for this challenge, developers are invited to attend NVIDIA Webinar tutorials and use the extensive self study materials available at <a href="http://www.nvidia.com/cuda">www.nvidia.com/cuda</a>.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with nearly 200,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p><strong>About NVIDIA</strong><br />
NVIDIA (Nasdaq: NVDA) awakened the world to the power of computer graphics when it invented the graphics processing unit (GPU) in 1999. Since then, it has consistently set new standards in visual computing with breathtaking, interactive graphics available on devices ranging from portable media players to notebooks to workstations. NVIDIA's expertise in programmable GPUs has led to breakthroughs in parallel processing which make supercomputing inexpensive and widely accessible. Fortune magazine has ranked NVIDIA #1 in innovation in the semiconductor industry for two years in a row. For more information, see <a href="http://www.nvidia.com">www.nvidia.com</a>.</p>

<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

<p><em>Certain statements in this press release including, but not limited to, statements as to: the benefits, features, impact and capabilities of NVIDIA CUDA architecture and NVIDIA GeForce GPUs; the advantages of parallel computing; GPU computing; the GPU computing revolution; and the impact of GPU computing; are forward-looking statements that are subject to risks and uncertainties that could cause results to be materially different than expectations. Important factors that could cause actual results to differ materially include: development of more efficient or faster technology; design, manufacturing or software defects; the impact of technological development and competition; changes in consumer preferences and demands; customer adoption of different standards or our competitor's products; changes in industry standards and interfaces; unexpected loss of performance of our products or technologies when integrated into systems as well as other factors detailed from time to time in the reports NVIDIA files with the Securities and Exchange Commission including its Form 10-Q for the fiscal period ended July 26, 2009. Copies of reports filed with the SEC are posted on NVIDIA's website and are available from NVIDIA without charge. These forward-looking statements are not guarantees of future performance and speak only as of the date hereof, and, except as required by law, NVIDIA disclaims any obligation to update these forward-looking statements to reflect future events or circumstances.</em></p>

<p><em>&copy; 2009 NVIDIA Corporation. All rights reserved. NVIDIA, the NVIDIA logo, and CUDA are trademarks or registered trademarks of NVIDIA Corporation in the U.S. and other countries. Other company and product names may be trademarks of the respective companies with which they are associated. Features, pricing, availability, and specifications are subject to change without notice.</em></p>

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
