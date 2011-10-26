<%@ page contentType="text/html;charset=utf-8" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page language="java" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder High School Competitions: Spotlight Sessions</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="hs_overview"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

                <div align="center">
                    <img src="/i/hs/banner.jpg" alt="TopCoder High School" border="0">
                </div>
                <div style="float: right;">
                <h3 style="border-bottom: 1px solid #999999;">Chat Session Transcripts</h3>
                	<strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081211">TCHS SRM 63: Spotlight Session with</a> <tc-webtag:handle coderId="144400" context="algorithm" /></strong><br />
                	<strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081124">TCHS SRM 62: Spotlight Session with</a> <tc-webtag:handle coderId="269554" context="algorithm" /></strong><br />
                    <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081106">TCHS SRM 61: Spotlight Session with</a> <tc-webtag:handle coderId="10597114" context="algorithm" /></strong><br />
                    <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081028">TCHS SRM 60: Spotlight Session with</a> <tc-webtag:handle coderId="270505" context="algorithm" /></strong><br />
                    <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081008">TCHS SRM 59: Spotlight Session with</a> <tc-webtag:handle coderId="19849563" context="algorithm" /></strong><br />
                    <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081002">TCHS SRM 58: Spotlight Session with</a> <tc-webtag:handle coderId="272072" context="algorithm" /></strong><br />
                    <strong><a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20080920">TCHS SRM 57: Spotlight Session with</a> <tc-webtag:handle coderId="10574855" context="algorithm" /></strong><br />
                    <span style="text-decoration:none;"><tc-webtag:forumLink forumID="523401" message="Discuss this" /></span>
                </div>
                <br /><br /><br /><br /><br /><br /><br />

                <p style="font-family:lucida sans"><span class="title">Spotlight Sessions</span></p>
                <p style="font:12px lucida sans;">TopCoder is proud to present a new series for high school students. Join the new <span style="font:18px lucida sans;">Spotlight Sessions</span> in the Arena.</p>
                <p style="font:12px lucida sans;">Have you ever wondered what it feels like to be a <span style="font:18px lucida sans;">TopCoder champion</span>?  Is there a problem that you always wanted to ask the pros at TopCoder about but never had the right forum for it?  Did you ever just want to get to know your superiors and learn some <span style="font:18px lucida sans;">valuable tips</span> that can help your future?</p>
                <p style="font:12px lucida sans;">Now you've got the chance.  <span style="font:18px lucida sans;">Spotlight Sessions</span> will feature the best coders at TopCoder in the chat arena for you to talk to.  As <span style="font:18px lucida sans;">role models</span> in the TopCoder community, these members will chat with you and answer your questions about how they got where they are today.  Spotlight Sessions will include numerous chat hosts like <span style="font:18px lucida sans;">2008 TopCoder Open Algorithm Champion and Poland celebrity, <tc-webtag:handle coderId="144400" context="algorithm" />, multiple TopCoder Champion and number one ranked Algorithm coder, <tc-webtag:handle coderId="10574855" context="algorithm" />, and the TCO webcast anchorman and decorated Algorithm coder, <tc-webtag:handle coderId="270505" context="algorithm" /></span>.  Don't miss any of the <span style="font:18px lucida sans;">Spotlight Sessions</span> as they are sure to help you in your <span style="font:18px lucida sans;">future endeavors</span>.</p>
                <p style="font:12px lucida sans;">There are eight High School SRMs left until the 2009 TopCoder High School tournament commences.  Use these final SRMs for practice to <span style="font:18px lucida sans;">perfect your skills</span>, but also be there to <span style="font:18px lucida sans;">experience the one of a kind Spotlight Sessions</span>.  There will not be another forum like this to chat with your role models.</p>
                <p style="font:12px lucida sans;">This is a great time to refer your friends for them to benefit from these chat sessions.  Don't forget about our <a href="/tc?module=Static&amp;d1=hs&amp;d2=referralProgram">referral program</a>!</p>
                <p style="font:12px lucida sans;">Don't miss the SRMs and the great chats before them:</p>
                
                <%-- Petr Done 
                <p style="font:12px lucida sans;"><span class="subtitle">Saturday, September 20 at 11:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="10574855" context="algorithm" /></span></p>
                <p style="font:12px lucida sans;"><tc-webtag:handle coderId="10574855" context="algorithm" /> is the #1 ranked Algorithm Coder at TopCoder and is helping to edge the second rated Russians past the Pols in our top Country list.  He was the Algorithm Champion for the 2007 TopCoder Collegiate Challenge, the 2006 TopCoder Collegiate Challenge and the 2006 TopCoder Open.  He has been to the last six onsite events and hit the highest rating ever achieved in May 2008 at 3890.  <tc-webtag:handle coderId="10574855" context="algorithm" /> is known world wide for his programming talents and boosts to have around 200 programming t-shirts.  We're sure you can learn a lot from <tc-webtag:handle coderId="10574855" context="algorithm" /> in the chat room!</p>
                --%>
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Saturday, September 20 at 11:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="10574855" context="algorithm" /></span></p>
                <p class="grayedOut" style="font:12px lucida sans;">View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20080920">here</a>.</p>
                
                <%-- SnapDragon Done 
                <p style="font:12px lucida sans;"><span class="subtitle">Thursday, October 2 at 6:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="272072" context="algorithm" /></span></p>
                <p style="font:12px lucida sans;"><tc-webtag:handle coderId="272072" context="algorithm" /> is an elite TopCoder member.  He holds the highest total number of SRM wins and was a tournament finalist in 2002, 2003, 2004, 2006, and 2007.  <tc-webtag:handle coderId="272072" context="algorithm" /> is an ACM - 98 Gold Medalist and now he is a Judge and Writer for multiple ACM contests, including the World Finals.  Not only is <tc-webtag:handle coderId="272072" context="algorithm" /> a TopCoder celebrity, but he's also a gaming celebrity.  Tetris Attack, Pokemon Puzzle League, Amplitude, Super Monkey Ball and Prince of Persia, are a just a few of the games that <tc-webtag:handle coderId="272072" context="algorithm" /> has incredible achievements with.  And don't forget his amazing showing at the 2006 TopCoder Open when he wowed the crowed with his incredibly quick Dance, Dance Revolution moves.  Don't miss <tc-webtag:handle coderId="272072" context="algorithm" /> in the chat room!</p>
                --%>
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Thursday, October 2 at 6:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="272072" context="algorithm" /></span></p>
                <p class="grayedOut" style="font:12px lucida sans;">View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081002">here</a>.</p>
                
                <%-- ACRush Done 
                <p style="font:12px lucida sans;"><span class="subtitle">Wednesday, October 8 at 10:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="19849563" context="algorithm" /></span></p>
                <p style="font:12px lucida sans;">From China, <tc-webtag:handle coderId="19849563" context="algorithm" /> is ranked as the number one Algorithm competitor in his country and has been for two years, as well as the number one coder from his school, Tsinghua University.  Not only that, but <tc-webtag:handle coderId="19849563" context="algorithm" /> is third overall at TopCoder in Algorithm competition rating and has been a target since the 2006 TCCC (only a year since he had joined TopCoder).  <tc-webtag:handle coderId="19849563" context="algorithm" /> has been an onsite finalist at TopCoder events five times, holds numerous accolades at other prestigious events like the ACM and ICPC, and is considered by many the idol of all Chinese coders.  <tc-webtag:handle coderId="19849563" context="algorithm" /> has a positive outlook, believes accuracy is more important than ever these days, and confidence is the first secret of his success.  Be sure to join everyone in the chat room to hear from <tc-webtag:handle coderId="19849563" context="algorithm" />.</p>
                --%>
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Wednesday, October 8 at 10:00 a.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="19849563" context="algorithm" /></span></p>
                <p class="grayedOut" style="font:12px lucida sans;">View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081008">here</a>.</p>
                
                <%-- John Dethridge Done 
                <p style="font:12px lucida sans;"><span class="subtitle">Tuesday, October 28 at 8:00 p.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="270505" context="algorithm" /></span></p>
                <p style="font:12px lucida sans;">You may recognize this Aussie from the TopCoder webcasts as your announcer.  He was there bringing you the live coverage of the 2006 TopCoder Collegiate Challenge and the 2007 TopCoder Open.  <tc-webtag:handle coderId="270505" context="algorithm" /> has been a TopCoder member since 2002 and he went on to become the TopCoder Invitational Champion that year.  He has also been an onsite finalist four times.  Those of you who don't know, John is a killer Laser Tag soldier.  Make sure to get on his team.  A chat session with one of our all-time greats is one you're not going to want to miss!</p>
                --%>
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Tuesday, October 28 at 8:00 p.m. EDT (GMT -4)<br />
                Spotlight Session with <tc-webtag:handle coderId="270505" context="algorithm" /></span></p>
                <p class="grayedOut" style="font:12px lucida sans;">View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081028">here</a>.</p>
                
                <%-- Psyho Done 
                <p style="font:12px lucida sans;"><span class="subtitle">Thursday, November 6 at 6:00 a.m. EST (GMT -5)<br />
                Spotlight Session with <tc-webtag:handle coderId="10597114" context="algorithm" /></span></p>
                <p style="font:12px lucida sans;">2008 TCO Marathon Champion, <tc-webtag:handle coderId="10597114" context="algorithm" /> became a TopCoder member in 2004 at the start of his programming career.  He was the 2007 Algorithm Imagine Cup winner and placed second in 2006.  These days, <tc-webtag:handle coderId="10597114" context="algorithm" /> is a judge and problem writer for the Imagine Cup.  This year <tc-webtag:handle coderId="10597114" context="algorithm" /> got to compete in the WPC finals and he was also a skilled gamer at king.com.  Right now his hobbies include music composing, practical psychology, acting, and game design.  Except from problem solving, <tc-webtag:handle coderId="10597114" context="algorithm" /> pretty much hates programming and he also dislikes computers in general, but since most of his hobbies require them he's got to live with that.  This will certainly make for an interesting chat session, so don't miss it!</p>
                --%>
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Thursday, November 6 at 6:00 a.m. EST (GMT -5)<br />
                Spotlight Session with <tc-webtag:handle coderId="10597114" context="algorithm" /></span></p>
                <p class="grayedOut" style="font:12px lucida sans;">View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081106">here</a>.</p>
                
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Saturday, November 22 at 11:00 a.m. EST (GMT -5)<br />
                Spotlight Session with <tc-webtag:handle coderId="269554" context="algorithm" /></span></p>
                <p class ="grayedOut" style="font:12px lucida sans;">
                  View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081124">here.</a>
                </p>
                
                <p class="grayedOut" style="font:12px lucida sans;"><span class="subtitle">Thursday, December 11 at 10:00 a.m. EST (GMT -5)<br />
                Spotlight Session with <tc-webtag:handle coderId="144400" context="algorithm" /></span></p>
                <p class ="grayedOut" style="font:12px lucida sans;">
                  View the chat transcript <a style="text-decoration:none;" href="/tc?module=Static&amp;d1=hs&amp;d2=spotSessChat20081211">here.</a>
                </p>
                <br /><br />
            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
</tbody>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>