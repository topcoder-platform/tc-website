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
                    
	<div align="right"><tc-webtag:forumLink forumID="536695" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Community Celebrates 250,000 Member Milestone
</span><br />
<span class="bodySubTitle"><em>World’s Foremost Competitive Software Development and Digital Creatives Community Pays Out $20 Million for 10,000 Projects Delivered to Date  
</em></span></p>
</div>
      
<p><strong>Glastonbury, CT - June 1, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, the leader in online programming competition, skills assessment and competitive product development platforms, today announced it has reached a major milestone as the TopCoder global community of registered members officially surpassed the 250,000 mark. The TopCoder community is comprised of professionals and students with expertise in a wide variety of fields including algorithms, computer science, physics, mathematics, medicine, graphic arts, design and many others. In the decade since the company&rsquo;s inception, TopCoder has awarded more than $20 million for projects ranging in scale from full enterprise systems to simple bug races to some of the best programmers from around the globe. Top performers in software and Studio competitions have earned over $90,000 and $14,000 respectively for their efforts in the past six month period. </p>
<p>&ldquo;One quarter of a million developers represents the largest community of its kind on the planet and we would like to congratulate all who have contributed to the success and development of our global product platform,&rdquo; said Rob Hughes, president and COO of TopCoder, Inc. &ldquo;TopCoder is a company defined by its community, and that partnership is fundamental to our model&rsquo;s ongoing evolution and market growth.&rdquo; </p>
<p>Members have competed in over 10,000 client competitions to date on the TopCoder platform, including more than 7,500 software development and Studio graphics competitions and 3,500 Bug Races. Client work by members encompasses builds ranging from major b-to-b eCommerce systems and 3rd party developer community platforms for creating new applications for Fortune 500 companies, to online lead generation products for the automobile sector to crowdsourcing and social media platforms for start up businesses. </p>
<p>TopCoder is the world&rsquo;s first outcome-based software platform, running development competitions 24x7 in which real world business solutions are built through a highly predictable and repeatable process that delivers significant returns in terms of cost and time. For creative work, TopCoder Studio provides a competitive arena for skills such as graphic arts and digital design. TopCoder membership is free and brings with it eligibility to compete in high profile tournaments not only for cash prizes but to also demonstrate programming talents and skills to the world. Added benefits include participation in round tables and educational forums as well as the chance to work on projects for some of the world's leading companies.</p>
<p><strong>About TopCoder, Inc.</strong><br />
  TopCoder is the world's largest competitive software development community with more than 250,000 members representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

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
