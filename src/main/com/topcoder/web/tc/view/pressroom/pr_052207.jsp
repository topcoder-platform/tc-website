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
                    
<div align="right"><tc-webtag:forumLink forumID="515873" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">Yodlee to Sponsor TopCoder Single Round Match Series</span><br>
<span class="bodySubTitle"><em>Online Banking Solutions Leader Seeks Competitive Edge of TopCoder Community</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn., and Redwood City, Calif., May 22, 2007 &#151;</strong>TopCoder&#174;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Yodlee, a leader in online banking solutions, will sponsor a series of three TopCoder Single Round Matches (SRMs) beginning on May 29th and continuing on June 24th and July 12th. Each match will offer prize purses of $5,000 for a total of $15,000 in cash payouts over the three part series. This is part of an ongoing recruitment and rapid growth plan for Yodlee.</p>

<p>"We are building the next-generation platform for online bill pay, banking and PFM (personal financial management), already in use by millions of consumers around the world," said Peter Hazlehurst, SVP of Product Development at Yodlee. "Our focus is on using technology innovation to solve real-world problems for financial institutions, consumers and small businesses, making the online channel a valuable, efficient and profitable vehicle for delivering personalized financial applications. To fulfill our vision, we are working with TopCoder to tap into the extraordinary developer talent they attract &mdash; people who are constantly 'developing outside the box'."</p>

<p>Yodlee's financial solutions - including consumer banking, payments solutions, wealth management, and risk management applications - are built on a patented technology platform and privately labeled by leading financial institutions worldwide.</p>

<p>TopCoder competitions offer sponsors like Yodlee access to the TopCoder global community of over 110,000 members, providing a unique opportunity to build valuable relationships and to hire some of the best developers in the world.</p>

<p>"TopCoder works with many of the most innovative and successful global technology companies, and we are delighted to add Yodlee to our community," said Rob Hughes, President and COO of TopCoder, Inc. "As an SRM series sponsor, Yodlee can showcase the kinds of unique technological challenges that are attractive to our creative and talented problem-solvers."</p>

<p><span class="bodySubtitle">About TopCoder Competitions</span><br>
TopCoder tournaments are known worldwide as the most grueling, comprehensive test of skill in the field of competitive programming. The events allow competitors to solve complex algorithmic problems and design and develop working pieces of reusable software. All current industry standard technologies are incorporated, including Java, C++, C#, VB.NET, UML, J2EE and .NET.</p>

<p>The Yodlee-sponsored series of matches will take place beginning 5/29/07 with SRM 351 and continue with matches on 6/14/07 (SRM 354) and 7/12/07 (SRM 357). For full details please visit: <a href="/tc?module=Static&d1=sponsors&d2=yodlee">http://www.topcoder.com/tc?module=Static&d1=sponsors&d2=yodlee</a>.</p>

<p><span class="bodySubtitle">About Yodlee</span><br>
Leading financial institutions trust Yodlee to power critical online banking applications that increase profitability and drive more value from the online channel. Yodlee's proven consumer banking, payments solutions, wealth management, and risk management applications unify all personal financial account information to deliver a simple, centralized and secure way for consumers to manage all of their financial tasks &mdash; any time, anywhere. Yodlee makes financial institutions' websites essential to their customers and generates new revenue opportunities. Over 100 leading financial institutions and portals, including Ameriprise Financial, AOL, Bank of America, Fidelity, JPMorgan Chase, Merrill Lynch, and MSN, today offer Yodlee-powered solutions to millions of customers worldwide. Yodlee operates in the United States and Europe and is headquartered in Redwood City, California. For more information, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.yodlee.com' refer='pr_052207' />">www.yodlee.com</a>.</p>

<p><span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process that results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <a href="/">http://www.topcoder.com/</a>.</p>

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
