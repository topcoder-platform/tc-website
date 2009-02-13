<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
<div align="right"><tc-webtag:forumLink forumID="505898" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Names Intel Corporation as First Sponsor of<br>New Marathon Match Series</span><br />
<span class="bodySubTitle"><em>Multi-Core Processing the Focus as New Format Promoting Optimization in <br> Problem Solving is Added to TopCoder Schedule of Tournaments<br></em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, January 23, 2006 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the Intel&reg; Software Network as the inaugural sponsor of a new series of competitive programming tournaments launching January 25th. The Intel Software Network Multi-threading Competition will be a 12 month series of programming challenges to design and create the optimum threaded code and solutions on state-of-the-art, cutting-edge, multi-core Intel platforms. The TopCoder Marathon Match format presents real-world customer situations highlighting the use of specific technologies and principles. Over the course of this competition series, Intel engineers will interact with competitors on optimization and development techniques. The monthly multi-threading competitions will each run two weeks and will offer prize purses of $5,000. For full details on rules and schedule, visit <A href="http://www.topcoder.com/intel">http://www.topcoder.com/intel</A>.
<br><br>
"The rapidly increasing adoption of multi core platforms in servers, desktops and mobile computers represents a huge transition in software development," said Melissa Laird, General Manager of Intel Software Network. "Threading applications will allow software developers to deliver higher performance and create amazing new possibilities.  The Intel Software Network Multi-threading Competition is a great way to explore that future today by learning and applying threading principles and unlocking the amazing possibilities achievable through multi-core platforms."
<br><br>

<span class="bodySubtitle">About TopCoder Marathon Matches</span><br>
TopCoder created the Marathon Match Series to provide a more flexible competition with an extended timeline that offers different types of problems than can be offered in a traditional TopCoder algorithm competition. In contrast to traditional TopCoder contests, the marathon format requires competitors to come up with the most effective optimizations, rather than a pure coding 'sprint' to implement a successful algorithm the quickest. 
<br><br>
Unlike traditional TopCoder algorithm competitions, the Marathon Match system is not necessarily testing only for correctness. In Marathon Matches, the scoring mechanism may also be different for each problem. A description of the scoring mechanism will be provided in the problem statement, requiring competitors to understand the scoring mechanism in order to effectively compete.
<br><br>
In a Marathon Match, all competitors are encouraged to improve their solutions and resubmit iteratively throughout the length of the submission phase. A given competitor will only be allowed to submit once per hour - other than that there are no restrictions on the number of submissions that each competitor may perform. The most recent submission is always the one that counts, so if a submission is made that does not score as well as a prior submission, the most recent will still be the one that counts in the standings. Participants may submit code written in any of the following languages: Java, C++, C# .Net, or VB .Net. By clicking the 'Results' link, competitors will be able to see the test cases, other competitors' submissions, and results.
<br><br>
"Intel is one of the best known brands globally and TopCoder sponsorship extends that reach to a unique global developer community of 70,000 members," said Rob Hughes, President and COO of TopCoder, Inc. "The new Marathon Match format is designed to inspire application developers to learn more about how specific tools and technologies like Intel's multi-core processing can improve the performance of applications they build and allow for expanded functionality of new applications."
<br><br>

<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="http://www.topcoder.com">www.topcoder.com</a>.
<br><br>
Intel Software Network and the Intel logo are trademarks or registered trademarks of Intel Corporation or its subsidiaries in the United States and other countries
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
<br><br>
</p>
                                                
                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

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

<jsp:include page="../foot.jsp" />

</body>

</html>
