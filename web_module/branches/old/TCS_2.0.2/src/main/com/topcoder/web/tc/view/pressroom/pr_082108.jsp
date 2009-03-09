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
                    
<div align="right"><tc-webtag:forumLink forumID="522960" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder One of Inc. Magazine's 500 Fastest-Growing Private Companies in America for Second Consecutive Year</span><br />
<span class="bodySubTitle"><em>Global Developer Community TopCoder Ranks No. 301 On the 2008 Inc. 500 With Three-Year Sales Growth of 927.6%</em></span></p>
</div>
      
<p>
<strong>GLASTONBURY, CT. August 20, 2008 &#151;</strong>Inc. magazine today announced its 27th annual Inc. 500 ranking of the fastest-growing private companies in the country. TopCoder&reg;, Inc., is ranked No. 301 on the list, with three-year sales growth of 927.6%. In the software industry category TopCoder was ranked No. 13.  The 2008 Inc. 500 list measures revenue growth from 2004 through 2007 and is the most comprehensive look at the most important segment of the economy - America's independent-minded entrepreneurs.  Taken as a whole, these companies represent the backbone of the U.S. economy.  Complete results of the Inc. 500, including company profiles and a full list of the 5,000 fastest-growing companies that can be sorted by industry and region can be found at <a target="_blank" href="<tc-webtag:linkTracking link='http://www.inc5000.com/' refer='pr_082108' />">www.inc5000.com</a>.
</p>

<p>
"We are honored to be recognized for the second year in a row and included in this elite group of companies which represents the best performing private businesses in the country," said Rob Hughes, President and COO of TopCoder, Inc. "TopCoder's continued growth translates directly into more opportunities for members of our global developer community."
</p>

<p>
To qualify, companies must be U.S.-based and privately held, for profit, independent - not subsidiaries or divisions of other companies - as of December 31, 2007, and have had at least $200,000 in revenue in 2004, and $2 million in 2007. TopCoder revenue was $19.1 million in 2007.
</p>

<p>
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the world's largest competitive software development community with more than 165,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.
</p>

<p>
<strong>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</strong>
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
