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
                    
<div align="right"><tc-webtag:forumLink forumID="517188" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Named to Inc. Magazine's 500 Fastest-Growing Private Companies in America</span><br />
<span class="bodySubTitle"><em>TopCoder Ranks No.45 on the 2007 Inc. 500 With Three-Year Sales Growth of 2,459.4%</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., August 27, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced it has been named to the Inc. 500 list of the fastest-growing private companies in America. Inc. magazine today released its annual Inc. 500 in which TopCoder is ranked No. 45 on the list, with three-year sales growth of 2,459.4%. The 2007 Inc. 500 can be found in the magazine's September issue.</p>

<p>The Inc. 500 ranks privately held companies according to year-over-year sales growth from 2003 to 2006. With approximately 75% of all new job creation in the U.S. coming from entrepreneurial businesses, the Inc. 500 opens a window onto the companies and industries that are driving the economy forward. Over the years, the Inc. 500 has identified the next generation of world-class companies, with Microsoft, Stonyfield Farms, Timberland, Oracle, The Princeton Review, Morningstar, Jamba Juice, Gateway, E*Trade, Intuit, and Domino's Pizza all appearing on the list before they became industry powerhouses.</p>

<p>"To be recognized in this year's INC 500 list is high recognition of the ingenuity, effort and determination exemplified by the entire TopCoder organization," said Rob Hughes, President and COO of TopCoder, Inc.  "TopCoder's commitment to the power of Community and performance on a global level is the engine which will drive our continued growth and success in the years ahead."</p>

<p>The companies that made this list represent the vanguard of American industry, posting an average three-year sales growth of 939%. Inc. 500 companies posted aggregate 2006 revenue of $16 billion, and a median revenue of $10.5 million.</p>

<p><span class="bodySubtitle">How the 2007 Inc. 500 Were Selected</span><br />
The INC 500 list measures revenue growth from 2003 through 2006. To qualify, companies must have been founded and generating revenue by the first week of 2003, and therefore able to show four full calendar years of sales. Additionally, they had to be U.S.-based, privately held, and independent- not subsidiaries or divisions of other companies- as of December 31, 2006. The minimum revenue required for 2003 is $200,000; the minimum for 2006 is $2 million. Revenue figures given in the company profiles correspond to calendar year 2006, and the number of employees listed is as of December 31, 2006. Full-time and part-time employees are included; independent contractors are not.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.</p>

<p>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</p>
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
