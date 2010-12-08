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
                    
<div align="right"><tc-webtag:forumLink forumID="530387" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder and NVIDIA Announce Superhero Challenge</span><br />
<span class="bodySubTitle"><em>Developers Invited by NVIDIA and TopCoder to Tackle Parallel Computing with the NVIDIA CUDA Architecture</em></span></p>
</div>
      
<p><strong>Santa Clara, CA - August 27, 2009</strong> - NVIDIA Corporation today announced that it will be working with TopCoder, a competitive software development community, on the CUDA Superhero Challenge, a series of contests for computer programmers who will harness the parallel processing power of the NVIDIA(R) CUDA(TM) architecture to solve some of computing's biggest challenges.</p>

<p>The first contest, which is open to all eligible developers, begins Sept. 14 and will conclude Sept. 25. $5,000 of prizes will be awarded to five contest winners, who will be announced at NVIDIA's GPU Technology Conference being held at the Fairmont Hotel in San Jose, Calif., from Sept. 30 to Oct. 2, 2009. Additional details about the CUDA Superhero Challenge can be found at <a href="http://www.topcoder.com/nvidia">www.topcoder.com/nvidia</a>.</p>

<p>"PC architecture has evolved from central processing on just the CPU to co-processing on the CPU and the GPU," said Sanford Russell, general manager of the CUDA group at NVIDIA. "By tapping into the TopCoder community, we can educate over 200,000 programmers on the advantages parallel programming offers and fan the flames of the GPU Computing revolution."</p>

<p>GPU Computing is the use of the massively parallel architecture of the graphics processing unit (GPU) as a computational engine using high-level languages and APIs, such as C and Fortran, or programming interfaces, such as DirectCompute and OpenCL. The model for GPU Computing is to use a CPU and GPU together in a co-processing computing model.</p>

<p>"We have the world's largest competitive software development community representing more than 200 countries, and they are eager to display their talents in one of the fastest growing programming areas in the industry," said Rob Hughes, president and chief operating officer at TopCoder. "We anticipate that the CUDA Superhero Challenge will generate many creative approaches to solving computing challenges and will result in game-changing innovations."</p>

<p>To learn more about the NVIDIA CUDA architecture or to accelerate programming skills for this challenge, developers are invited to attend NVIDIA Webinar tutorials and use the extensive self study materials available at <a href="http://www.nvidia.com/cuda">www.nvidia.com/cuda</a>.</p>

<p><strong>About NVIDIA</strong><br />
NVIDIA (Nasdaq: NVDA) awakened the world to the power of computer graphics when it invented the graphics processing unit (GPU) in 1999. Since then, it has consistently set new standards in visual computing with breathtaking, interactive graphics available on devices ranging from portable media players to notebooks to workstations. NVIDIA's expertise in programmable GPUs has led to breakthroughs in parallel processing which make supercomputing inexpensive and widely accessible. Fortune magazine has ranked NVIDIA #1 in innovation in the semiconductor industry for two years in a row. For more information, see <a href="http://www.nvidia.com">www.nvidia.com</a>.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world’s largest competitive software development community with nearly 200,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p>
<em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em>
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
