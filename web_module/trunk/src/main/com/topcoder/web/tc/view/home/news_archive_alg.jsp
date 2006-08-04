<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder News Archive</title>

<jsp:include page="/script.jsp"/>
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
<!-- Left Column Begins-->
      <td width="180">
         <jsp:include page="/includes/global_left.jsp">
<jsp:param name="node" value="m_competitions"/>
</jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="myTCBody">
        <jsp:include page="../page_title.jsp" >
            <jsp:param name="image" value="news_archive"/>
            <jsp:param name="title" value="Algorithm Competitions"/>
        </jsp:include>

<table border="0" cellpadding="2" cellspacing="0" width="100%">
<tr class="bodyText"><td nowrap="nowrap">08.04.06 1:00 PM&#160;-&#160</td><td width="100%">$5000 prize purse per match for SRMs <A href="/tc?module=MatchDetails&rd=9995">315</A>, <A href="/tc?module=MatchDetails&rd=10002">322</A>, and <A href="/tc?module=MatchDetails&rd=10005">325</A>.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.21.06 11:00 AM&#160;-&#160</td><td width="100%">$5000 prize purse per match for SRMs <A href="/tc?module=MatchDetails&rd=9992">312</A>, <A href="/tc?module=MatchDetails&rd=9997">317</A>, <A href="/tc?module=MatchDetails&rd=9999">319</A>, and <A href="/tc?module=MatchDetails&rd=10004">324</A>.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.06.06 10:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=hs&d2=home">TopCoder High School</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.05.06 2:45 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=calendar&d2=jan_06">MSN SRM sponsorship date changed</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.15.05 9:00 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=collegetour&d2=description">Introducing the U.S. College Tour</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=508140&mc=1#518768">GCC Upgrade</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.05 6:00 PM&#160;-&#160</td><td width="100%">$5,000 prize purse and iPod raffle per match for SRMs <A href="/tc?module=MatchDetails&amp;rd=8070">273</A>, <A href="/tc?module=MatchDetails&amp;rd=8073">276</A>, <A href="/tc?module=MatchDetails&amp;rd=8076">279</A>, sponsored by <A href="/tc?module=Static&d1=sponsors&d2=sap">SAP</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.14.05 3:20 PM&#160;-&#160</td><td width="100%">$5,000 prize purse per match for SRMs <A href="/tc?module=MatchDetails&amp;rd=8069">272</A>, <A href="/tc?module=MatchDetails&amp;rd=8074">277</A>, <A href="/tc?module=MatchDetails&amp;rd=8081">284</A>, sponsored by <A href="/tc?module=Static&d1=contracting&d2=msn">MSN</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.11.05 5:00 PM&#160;-&#160</td><td width="100%"><A href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&threadID=507907&mc=1#516943">Upgraded Compiler Machines</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.05 5:15 PM&#160;-&#160</td><td width="100%">Arena downtime: 11/11 noon</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.05 3:15 PM&#160;-&#160</td><td width="100%"><A href="http://forums.topcoder.com/?module=Thread&threadID=507824">Arena applet under Java 1.3 no longer supported</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 3:40 PM&#160;-&#160</td><td width="100%">Find feature added to the Arena Chat Area</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.05 10:20 AM&#160;-&#160</td><td width="100%"><A href="/tc?module=MatchDetails&amp;rd=8007">$5,000 prize purse for SRM 265, new time</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.05 5:25 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=MatchDetails&amp;rd=7996">SRM 262 date changed</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.01.05 1:00 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=MatchDetails&amp;rd=8012">SRM added on 08.22</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.21.05 2:30 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=MatchDetails&amp;rd=7227">July 23 SRM to Include Prize Money</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.06.05 10:40 PM&#160;-&#160</td><td width="100%"><A href="/contest/classes/PopsEdit/PopsEdit.jar">PopsEdit version 2.90 released</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.16.05 3:20 PM&#160;-&#160</td><td width="100%">Prize money returns to SRMs, Citigroup to sponsor matches on <A href="/tc?module=MatchDetails&amp;rd=7223">6/21</A>, <A href="/tc?module=MatchDetails&amp;rd=8004">7/19</A>, and <A href="/tc?module=MatchDetails&amp;rd=8005">8/8</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.16.05 3:20 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Calendar updated with new SRMs</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.02.05 7:50 PM&#160;-&#160</td><td width="100%"><A href="/tc">Top 10 Countries Now Linkable</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.13.05 11:50 AM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=7167&thread=496779&mc=1">Unused Code Checker in Arena</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.05 12:30 PM&#160;-&#160</td><td width="100%"><A href="/rtables/viewThread.jsp?forum=7167&thread=495563&mc=1">Compilers & testers have been updated with Java 5</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.18.05 3:45 PM&#160;-&#160</td><td width="100%"><A href="/tc?module=Static&d1=help&d2=ratedEvent#extracoderule">Small change to Unused Code Rule, new problem timeout limit, and more...</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.23.05 12:45 PM&#160;-&#160</td><td width="100%">SRM calendar updated for <A href="/tc?module=Static&amp;d1=calendar&amp;d2=may_05">May</A>, <A href="/tc?module=Static&amp;d1=calendar&amp;d2=jun_05">June</A>, and <A href="/tc?module=Static&amp;d1=calendar&amp;d2=jul_05">July</A></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.14.05 5:14 PM&#160;-&#160</td><td width="100%"><A href="/?t=support&c=ratings_cal">Algorithm rating formulas updated</A></td></tr>
</table>

        </div>
        <p><br/></p>
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