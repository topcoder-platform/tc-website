<%@ page language="java" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
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

<jsp:include page="../top.jsp">
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
                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="news_archive"/>
                    <jsp:param name="title" value="Algorithm Competitions"/>
                </jsp:include>

                <table border="0" cellpadding="2" cellspacing="0" width="100%">
                  <tr class="bodyText">
                    <td nowrap="nowrap">12.19.08 1:00 PM&#160;-&#160;</td>
                    <td><a href="http://killerappchallenge.ribbit.com/">SRM 430 Sponsored by Ribbit with Chat Session and Prizes! </a><br /></td>
                  </tr>
<tr class="bodyText"><td nowrap="nowrap">07.29.08 1:30 PM&#160;-&#160;</td><td width="100%"><a href="http://winningformula.espn.com/">Announcing the $100,000 ESPN Winning Formula Challenge</a><br /></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.27.08 5:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=home">Announcing the 2009 TCHS Season and Referral Program</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.11.08 12:30 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=12169">SRM 397 is sponsored by BT with $5,000 in Prizes!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.05.08 3:30 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=11126">BT sponsored SRM with $5,000 in prizes!</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.15.08 10:30 AM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=11122">SRM 388 sponsored by BT</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">09.25.07 1:15 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=calendar&amp;d2=oct_07">New SRM added to calendar</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.10.07 11:30 AM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=sponsors&amp;d2=tcsChat20070801">SRM 361 chat trascript: "About being orange"</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.27.07 3:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=10773">$5,000 in prizes for SRM 361</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.19.07 2:45 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=sponsors&amp;d2=bt">British Telecommunications to sponsor SRMs with cash prizes</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.13.07 4:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=hs&amp;d2=home">Register for the new season of TopCoder High School</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.12.07 11:15 AM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=10766">Yodlee chat session scheduled for SRM 357</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.13.07 2:30 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=10711">Yodlee chat session scheduled for SRM 354</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.25.07 4:30 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=MatchDetails&amp;rd=10675">Yodlee chat session scheduled for SRM 351</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">04.17.07 3:15 PM&#160;-&#160</td><td width="100%">Arena maintenance scheduled for April 17</td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.06.07 10:30 AM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=help&amp;d2=problemWriter&amp;node=algo_write">Payments for algorithm problems increased</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.22.07 5:20 PM&#160;-&#160</td><td width="100%"><a href="http://forums.topcoder.com/?module=Thread&amp;threadID=515502&amp;mc=1#578866">Save the Date: Stress Test SRM</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.12.06 5:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=SurveyResults&amp;sid=11060">yiming Wins the Arena Skin Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.04.06 5:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=ViewSurvey&amp;sid=11060">Arena Skin Contest Vote</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.06.06 4:30 PM&#160;-&#160</td><td width="100%"><a href="http://<%=ApplicationServer.STUDIO_SERVER_NAME%>/?module=ViewContestDetails&amp;ct=2046">Arena Skin Contest</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.11.06 4:00 PM&#160;-&#160</td><td width="100%"><a href="/collegetour">TopCoder College Tour comes to Beijing</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.03.06 6:00 PM&#160;-&#160</td><td width="100%"><a href="/tc?module=Static&amp;d1=statistics&amp;d2=recordbook_home">New statistics in Algorithm Record Book</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.07.06 9:00 AM&#160;-&#160</td><td width="100%">AOL adds $5000 prize purse per match for SRMs <a href="/tc?module=MatchDetails&amp;rd=9995">315</a>, <a href="/tc?module=MatchDetails&amp;rd=10002">322</a>, and <a href="/tc?module=MatchDetails&amp;rd=10005">325</a>.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.21.06 11:00 AM&#160;-&#160</td><td width="100%">$5000
prize purse per match for SRMs <a href="/tc?module=MatchDetails&amp;rd=9992">312</a>,
<a href="/tc?module=MatchDetails&amp;rd=9997">317</a>,
<a href="/tc?module=MatchDetails&amp;rd=9999">319</a>, and
<a href="/tc?module=MatchDetails&amp;rd=10004">324</a>.</td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.06.06 10:00 AM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=hs&amp;d2=home">TopCoder High School</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">01.05.06 2:45 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=calendar&amp;d2=jan_06">MSN SRM sponsorship date changed</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.15.05 9:00 AM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=collegetour&amp;d2=description">Introducing the U.S. College Tour</a>
</td></tr>
<tr class="bodyText"><td nowrap="nowrap">12.05.05 5:00 PM&#160;-&#160</td><td width="100%">
<a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=508140&amp;mc=1#518768">GCC
Upgrade</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.17.05 6:00 PM&#160;-&#160</td><td width="100%">$5,000
prize purse and iPod raffle per match for SRMs
<a href="/tc?module=MatchDetails&amp;rd=8070">273</a>,
<a href="/tc?module=MatchDetails&amp;rd=8073">276</a>,
<a href="/tc?module=MatchDetails&amp;rd=8076">279</a>, sponsored by
<a href="/tc?module=Static&amp;d1=sponsors&amp;d2=sap">SAP</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.14.05 3:20 PM&#160;-&#160</td><td width="100%">$5,000
prize purse per match for SRMs <a href="/tc?module=MatchDetails&amp;rd=8069">272</a>,
<a href="/tc?module=MatchDetails&amp;rd=8074">277</a>,
<a href="/tc?module=MatchDetails&amp;rd=8081">284</a>, sponsored by
<a href="/tc?module=Static&amp;d1=contracting&amp;d2=msn">MSN</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.11.05 5:00 PM&#160;-&#160</td><td width="100%">
<a href="http://<%=ApplicationServer.FORUMS_SERVER_NAME%>/?module=Thread&amp;threadID=507907&amp;mc=1#516943">Upgraded
Compiler Machines</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.10.05 5:15 PM&#160;-&#160</td><td width="100%">Arena
downtime: 11/11 noon</td></tr>
<tr class="bodyText"><td nowrap="nowrap">11.03.05 3:15 PM&#160;-&#160</td><td width="100%">
<a href="http://forums.topcoder.com/?module=Thread&amp;threadID=507824">Arena applet under Java 1.3
no longer supported</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">10.04.05 3:40 PM&#160;-&#160</td><td width="100%">Find
feature added to the Arena Chat Area</td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.31.05 10:20 AM&#160;-&#160</td><td width="100%">
<a href="/tc?module=MatchDetails&amp;rd=8007">$5,000 prize purse for SRM 265, new time</a></td>
</tr>
<tr class="bodyText"><td nowrap="nowrap">08.30.05 5:25 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=MatchDetails&amp;rd=7996">SRM 262 date changed</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">08.01.05 1:00 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=MatchDetails&amp;rd=8012">SRM added on 08.22</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.21.05 2:30 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=MatchDetails&amp;rd=7227">July 23 SRM to Include Prize Money</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">07.06.05 10:40 PM&#160;-&#160</td><td width="100%">
<a href="/contest/classes/PopsEdit/PopsEdit.jar">PopsEdit version 2.90 released</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.16.05 3:20 PM&#160;-&#160</td><td width="100%">Prize
money returns to SRMs, Citigroup to sponsor matches on
<a href="/tc?module=MatchDetails&amp;rd=7223">6/21</a>,
<a href="/tc?module=MatchDetails&amp;rd=8004">7/19</a>, and
<a href="/tc?module=MatchDetails&amp;rd=8005">8/8</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.16.05 3:20 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=calendar&amp;d2=thisMonth">Calendar updated with new SRMs</a>
</td></tr>
<tr class="bodyText"><td nowrap="nowrap">06.02.05 7:50 PM&#160;-&#160</td><td width="100%">
<a href="/tc">Top 10 Countries Now Linkable</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.13.05 11:50 AM&#160;-&#160</td><td width="100%">
<a href="/rtables/viewThread.jsp?forum=7167&amp;thread=496779&amp;mc=1">Unused Code Checker in Arena</a>
</td></tr>
<tr class="bodyText"><td nowrap="nowrap">05.05.05 12:30 PM&#160;-&#160</td><td width="100%">
<a href="/rtables/viewThread.jsp?forum=7167&amp;thread=495563&amp;mc=1">Compilers & testers have been
updated with Java 5</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">03.18.05 3:45 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=help&amp;d2=ratedEvent#extracoderule">Small change to Unused Code
Rule, new problem timeout limit, and more...</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.23.05 12:45 PM&#160;-&#160</td><td width="100%">SRM
calendar updated for <a href="/tc?module=Static&amp;d1=calendar&amp;d2=may_05">May</a>,
<a href="/tc?module=Static&amp;d1=calendar&amp;d2=jun_05">June</a>, and
<a href="/tc?module=Static&amp;d1=calendar&amp;d2=jul_05">July</a></td></tr>
<tr class="bodyText"><td nowrap="nowrap">02.14.05 5:14 PM&#160;-&#160</td><td width="100%">
<a href="/tc?module=Static&amp;d1=help&amp;d2=ratings">Algorithm rating formulas updated</a>
</td></tr>
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

<jsp:include page="../foot.jsp"/>

</body>

</html>