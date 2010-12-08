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
                    
	<div align="right"><tc-webtag:forumLink forumID="535024" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>U.S. National Security Agency and Leading Russian Search Engine Yandex to Support 2010 TopCoder Open</strong></p>
  <p align="center"><br />
  </p>
</div>
      
<p><strong>Glastonbury, CT - April 6, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, .the leader in online programming competition, skills assessment and competitive software development platforms, today announced the National Security Agency (NSA) as patron and Yandex as sponsor of the 2010 TopCoder Open, the world&rsquo;s foremost competitive computer programming and creative design tournament.&nbsp; During the next four months of online competition, thousands of skilled competitors from around the globe will be reduced to 100 top performers across multiple tracks who will then travel from around the world as onsite finalists to the 2010 TopCoder Open and compete for a share of $150,000 in prizes.<strong></strong>The live event takes place October 11th -14th at the MGM Mirage in Las Vegas. Programmers and digital creatives will compete in six tracks &ndash; Algorithm, Design, Development, Studio, Marathon and Mod Dash &ndash; not only for cash prizes but also a chance to demonstrate their programming talents and skills to the world.<strong></strong>Full details including schedules and rules are available at <a href="http://www.topcoder.com/tco10">http://www.topcoder.com/tco10</a>.</p>

<p>&ldquo;We are very excited with the continued growth TopCoder is experiencing in both the government and international business sectors in terms of programming competition sponsorship. The United States and Russian Federation consistently produce top talent,&rdquo; said Rob Hughes, president and COO of TopCoder, Inc. &ldquo;NSA is our most valued longstanding patron and Yandex is one of the new breed of companies that recognize the high value of interfacing directly with the TopCoder community that exists in their own backyard.&rdquo; </p>
<p>NSA is the longest ongoing patron of TopCoder competitions having previously supported TopCoder Open events from 2006-2009 and the 2005 and 2006 TopCoder Collegiate Challenge events. For more information about the National Security Agency, please visit <a href="http://www.nsa.gov/">www.NSA.gov</a>. </p>
<p>Yandex is Russia&rsquo;s largest internet company, whose websites attract a workday audience of more than 15 million users from Russia, Ukraine and other countries searching almost a hundred million queries a day.<br>
  For more information visit <a href="http://www.yandex.com/">www.yandex.com</a> &nbsp;and <a href="http://company.yandex.com/">http://company.yandex.com/</a>.</p>
<p>TopCoder offers a comprehensive array of outcome-based software competitions 24 x 7 in which real world business solutions are built on time and on budget.&nbsp; For creative work, TopCoder Studio provides a competitive arena for creative skills such as graphic arts and digital design. </p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 240,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>. </p>
<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

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
