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
                    
<div align="right"><tc-webtag:forumLink forumID="516232" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces Enhanced Focus on Financial Services Industry</span><br>
<span class="bodySubTitle"><em>TopCoder Financial Markets Capability Grows with Addition<br> of Dan Houlihan as Senior Vice President</em></span></p>
</div>
      
<p><strong>GLASTONBURY, Conn., June 6, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced a strategic move to provide an enhanced response to the specific needs of the financial services industry. The company today detailed its plans to increase focus on financial services applications and software solutions through a series of initiatives under the guidance of industry veteran Dan Houlihan. The company intends to build on expertise gained from working with premier financial services clients across a number of segments including brokerage, investment management, hedge fund, banking and insurance.</p>

<p>TopCoder will increase its capability to educate the financial services industry on the company's progressive, competition-based development model to help improve overall business performance through technology in terms of quality, cost and speed-to-market through the following key initiatives:</p>
<ul>
   <li>Creation of a Center of Excellence focused on the unique needs of financial services organizations and dedicated to identifying benefits those organizations can realize from harnessing the TopCoder developer community and reusable component catalogs;</li>

     <li>Improvement of TopCoder's position as a strategic business partner with financial services clients by aligning sales, delivery and software assets to address their unique business challenges.</li>

     <li>The addition of Daniel P. Houlihan as Senior Vice President. In this role, Houlihan will leverage his experience as a 17-year veteran in the financial services field to grow TopCoder's financial services sector business and client base.</li>
</ul>
        
<p>"Given the community of technologists we have gathered and their proficiency in mathematics and particularly algorithms, we are a natural fit as a solution for financial services firms," said Rob Hughes, President and COO of TopCoder, Inc. "Dan Houlihan has extensive experience in the financial services arena and brings a substantial network of relationships to TopCoder. He will be responsible for applying that knowledge and the TopCoder community to the benefit of current and future clients."</p>

<p>Houlihan was most recently with Citisoft, Inc., a $20 million global consulting firm specializing in asset management operations and technology strategy, where he held the position of president. Prior to Citisoft, Houlihan was Managing Director and Co-Founder of Rowan Group, Inc., a highly specialized consulting firm providing operations and technology advisory and implementation services to the buy-side segment of the financial services industry. Before that, he was with Thompson Financial Services where he was a director in the workflow, analysis and process optimization consulting group. Dan Houlihan is also a frequent speaker and author on the topic of financial services operations and technology strategy.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com/">http://www.topcoder.com/.</a></p>

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
