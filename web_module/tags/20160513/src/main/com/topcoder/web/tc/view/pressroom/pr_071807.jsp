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
                    
<div align="right"><tc-webtag:forumLink forumID="516609" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces New Collaboration Initiatives for Working with Clients and Community</span><br>
<span class="bodySubTitle"><em>Appointment of Ira Heffan as General Counsel Will Enhance TopCoder Member and Customer Collaboration</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., July 18, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced a series of collaboration initiatives to further enhance its ability to work with its clients and community.  The company today detailed its plans to provide an enhanced response to the collaboration needs of the company, its customers and the TopCoder member base under the direction of Ira Heffan, who was recently named as General Counsel.</p>

<p>TopCoder intends to build on Heffan's expertise gained from his ten years working as outside counsel to software and technology companies, and his understanding of legal matters relating to open source businesses and communities. TopCoder will increase its capability to educate its customers on the company's progressive, competition-based development model, and its ability to help improve customers' business performance in terms of quality, cost and speed-to-market through the following key initiatives:</p>
    <ul>
        <li>Developing a framework for customers to maintain visibility into TopCoder's ongoing intellectual property management practices, and thereby foster their use of the TopCoder developer community and reusable component catalogs;</li>
        <li>Structuring new approaches to enable TopCoder members to collaborate with each other and with customers on software development tasks;</li>
        <li>The addition of Ira Heffan as General Counsel. In this role Heffan will manage TopCoder's legal and government affairs, with particular attention to TopCoder's clients' and community members' intellectual property.</li>
    </ul>

<p>"With our cutting-edge, community-based development model, TopCoder prides itself on its unwavering continued attention to the legal framework supporting the model," said Rob Hughes, President and COO of TopCoder, Inc. "Ira has been working with us since TopCoder was founded.  He has extensive experience with software companies and open source communities, and brings a depth of expertise to TopCoder, particularly around intellectual property and our unique, highly-structured, community-based development technologies.  We are delighted that he will be applying that knowledge to the benefit of the TopCoder community and our current and future clients."</p>

<p>Heffan was most recently in the Intellectual Property Transactions and Strategies group of the law firm Goodwin Procter, in their Boston office.  There he worked on a variety of matters, including software licensing, corporate and intellectual property transactions, patent and trademark portfolio development, and litigation.  Heffan is also a frequent speaker and author on the topic of legal matters relating to open source software and legal strategy for technology companies.  He has a bachelor's degree in Electrical Engineering from Union College, a master's degree in Computer Science from Boston University, and a law degree from Stanford Law School.  He is admitted to the bar in Massachusetts, and is registered to practice before the U.S. Patent and Trademark Office.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="/">http://www.topcoder.com/</a>.</p>

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
