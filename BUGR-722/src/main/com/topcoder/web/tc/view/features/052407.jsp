<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="515943" message="Discuss this article" />
</div>

<span class="bigTitle">Introducing Yodlee</span>
<%--<br /><br />

<div class="authorPhoto">
    <img src="/i/m/sql_lall_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
  By&#160;Yodlee Staff
  </div>
      <div align="center">
      <img src="/i/sponsor/Yodlee_logo.gif" border="0" />
      </div>
<br>
<p>Think financial services is boring? Think again. At Yodlee, we're taking a whole new look at what the Internet can do to transform the way people access, manage, interact with, and transact upon their finances to enable greater insights, control, and 'action'. </p>

<p>Yodlee pioneered and patented a technology platform in 1999 that enables us to securely collect, consolidate, and present financial account data (balances, transactions, etc) from virtually any website. That data now powers online and mobile financial solutions used by nearly 8 million consumers at more than 30 of the top 50 global financial institutions. The Yodlee Platform supports over 8,000 data sources and 80,000 individual account types, creating one of the largest networks of financial data in the world.</p>

<p>Here's a little bit more on what we do, along with some recent news from the company:

<p><span class="bodySubtitle">One-Stop Shopping</span><br />
Through its patented account integration technology, Yodlee delivers innovative financial applications that make online banking more useful and more profitable. Yodlee's personal finance, bill pay and banking solutions help consumers and small businesses achieve greater financial awareness, control and satisfaction through their financial institution's online channel.

<p>Yodlee's suite of solutions offers financial institutions opportunities to:</p>

<ul>
	<li>increase revenue</li>
	<li>acquire new customers</li>
	<li>lower the total cost of ownership over existing online solutions, and</li>
	<li>increase user activity and retention</li>
</ul>

<p>More than 100 leading financial institutions and portals, including AOL, Bank of America, Compass Bank, Fidelity, JPMorgan Chase, Merrill Lynch, and MSN, today offer Yodlee-powered solutions to millions of customers worldwide. </p>

<p><span class="bodySubtitle">Going Mobile</span><br />
The company recently introduced Yodlee Mobile, which enables financial services firms to take their online banking service mobile. After securely logging-in to the application via a web browser on a mobile phone, consumers can view account balances and transactions, and receive fraud monitoring alerts, bill reminders and account threshold notifications &mdash; all over their mobile handsets. They can also use the phone to pay bills and transfer funds.</p>

<p>"Yodlee Mobile enables financial institutions to increase adoption and usage of online banking applications," says Peter Hazlehurst, senior vice president of product development at Yodlee. "By allowing consumers to access and manage their accounts from anywhere, financial institutions can extend their brand and increase the value and frequency of customer communications."</p>

<p>Yodlee already has an alliance with UK telco Vodafone and is forming similar partnerships with other companies in the US and Europe to help ensure seamless transmission of data across wireless networks.</p>

<p><span class="bodySubtitle">Do people really want to do their banking online?</span><br />
Earlier this week, Yodlee and Aite Group, LLC announced the results of a market survey that showed consumers' readiness for new and improved online personal financial management (PFM) tools. </p>

<p>The results confirmed that more than 80 percent of the top banks in the US consider the online channel critical to their business, but nearly all of them are at least somewhat dissatisfied with the current service offerings they have available. </p>

<p>Among consumers, the survey found that nearly half of all respondents would be very or extremely interested in using the Yodlee MoneyCenter functionality if it was available at their bank. Other feedback outlined in the whitepaper includes: </p>
<ul>
	<li>72 percent say that the ability to choose payment timing of their bills is important to have available on an online banking Web site </li>
	<li>59 percent believe that the ability to automatically organize expenses into categories is important </li>
	<li>55 percent say that the ability to pay bills by debit cards at the bank site &mdash; a feature unique to Yodlee solutions &mdash; is a very to extremely important feature of online banking </li>
	<li>73 percent note e-mail and SMS fraud alerts as extremely important features </li>
</ul>

<p>"These findings point to consumers' readiness for something more in their online banking experience," said Anil Arora, president and CEO of Yodlee. "Financial institutions clearly recognize the value of the online channel and the need to offer a better, more personal online banking experience to consumers. In an effort to help financial institutions meet these growing consumer demands, we are creating innovative online tools that help consumers better understand their financial picture, including where they're spending their money and how to plan and budget &mdash; easily and automatically. This also presents new opportunities for banks to increase customer satisfaction and acquisition and impact the bottom line."</p>

<p><span class="bodySubtitle">Working at Yodlee</span><br />
At Yodlee, you will be working with the latest Web 2.0 technologies, building out a complex infrastructure to support millions of payments and transactions each day across a rapidly growing global network, built from scratch by Yodlee. Yodlee already processes ~$150MM in funds transfers and over 300,000 new account openings per month, with the best bill pay in the business. </p>

<p>As an ASP with stringent up-time requirements and enormous scalability and security issues, Yodlee offers unique challenges for developers. For example, Yodlee's systems have to scale from mere hundreds to tens of millions of users. We don't run vast datacenters - our systems have to provide speed, with minimal hardware, and support half a million e-Commerce sessions per hour with sub second response times - all while meeting the most stringent security requirements in the industry.</p>

<p>These are just a few highlights, of course &mdash; to learn more about working in our offices in California and India, or to get more information on the company, visit <a target="_blank" href="<tc-webtag:linkTracking link='http://www.yodlee.com' refer='feature_052407' />">www.yodlee.com</a> or hit the "apply now" button <a href="/tc?module=Static&d1=sponsors&d2=yodlee">here</a>. You can also join us for a chat before <a href="/tc?module=MatchDetails&rd=10675">SRM 351</a>. </p>

<p><br></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
