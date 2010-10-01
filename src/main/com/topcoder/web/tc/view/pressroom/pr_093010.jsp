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
                    
	<div align="right"><tc-webtag:forumLink forumID="540618" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>TopCoder Announces PayPal &amp; Facebook as Sponsors of 2010TopCoder Open</strong><br />
    <strong><em>Online Payment Service Leader and</em></strong><strong><em>Social Networking Giant to Support Global Championship of Computer Programming </em></strong></p>
</div>
      
<p><strong>Glastonbury, CT - September 30, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, the leader in online programming competition, skills assessment and competitive software development platforms, today announced PayPal and Facebook as sponsors of the 2010 TopCoder Open, the world&rsquo;s foremost competitive computer programming and creative design tournament. &nbsp;The companies join sponsor Yandex and patron NSA in their support of the event which takes place October 11th -14th at the MGM Mirage in Las Vegas. Full details including schedules and rules are available
at <a href="http://www.topcoder.com/tco10">http://www.topcoder.com/tco10</a>.</p>
<p>&quot;We are very pleased to have two of the most recognizable online technology innovators in the world join us with their valued sponsorship of this, our flagship tournament,&quot; said Rob Hughes, president and COO of TopCoder, Inc. &quot;TopCoder is excited to be part of the new generation of businesses that have the power of communities in their DNA.&quot; </p>
<p>Thousands of skilled competitors from around the globe competed online and were reduced to the 82 top performers across multiple tracks. They will now travel from around the world as onsite finalists to the 2010 TopCoder Open and compete for a share of $150,000 in prizes.<strong></strong>Programmers and digital creatives will compete in six tracks &ndash; Algorithm, Design, Development, Studio, Marathon and Mod Dash for cash prizes and also the chance to demonstrate their programming talents and skills to the world.</p>
<p>TopCoder offers a comprehensive array of outcome-based software competitions 24 x 7 in which real world business solutions are built on time and on budget.&nbsp; For creative work, TopCoder Studio provides a competitive arena for creative skills such as graphic arts, conceptualization and digital design. </p>
<p>Facebook is a social utility that helps people communicate more efficiently with their friends, family and coworkers. The company develops technologies that facilitate the sharing of information through the social graph, the digital mapping of people's real-world social connections. </p>
<p>PayPal&rsquo;s service allows members to send money without sharing financial information, with the flexibility to pay using their account balances, bank accounts, credit cards or promotional financing. The company's open payment platform, PayPal X, allows developers to build innovative payment applications on multiple platforms and devices. </p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 260,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
