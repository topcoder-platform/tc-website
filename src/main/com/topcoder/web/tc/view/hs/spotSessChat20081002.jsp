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
                <br />
                <div align="center">
                    <%--
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/spotlight_sessions_header.png" alt="Spotlight Sessions" border="0"></a>
                    --%>
                    <a href="/tc?module=Static&amp;d1=hs&amp;d2=spotlightSessions"><img src="/i/hs/tchs_spotlightbanner.jpg" alt="Spotlight Sessions" border="0"></a>
                </div>
                <br />
                <div align="right" style="text-decoration:none;"><tc-webtag:forumLink forumID="523401" message="Discuss this" /></div>
                <br />

                <table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from TCHS SRM 58: Spotlight Session with <tc-webtag:handle coderId="272072" context="algorithm" /></div>
        </td>
    </tr>
    <tr>
        <td class="header">
        Handle
        </td>
        <td class="header">
        Comment
        </td>
    </tr>
</thead>

<tr class="light"><td class="value"><strong>glue2glee</strong></td><td class="value">SnapDragon: why didnt you ever appeared in IOI?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: Yo</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">glue2glee: Canada wasn't really organized back when I was in high school</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">glue2glee: We fielded an IOI team, but it was only from the Eastern provinces.  I never had a chance to try out.</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: hi :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">'lo all</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: can you describe the training you had during your university ?</td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: in your interview, you said that extensive training gave u all</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">tsalman: Sure, but let's wait till more people are here :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: skills u have now :-)</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">SnapDragon: I've a question, What skills do you think one needs to be like high red in topcoder, i mean good knowledge of algorithms along with good coding skills only grants me and many people i know to be yellow here!</td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: sure :-)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">tsalman: Yeah, it's 90% due to practice</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">In a few minutes the chat will start officially!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: Well, I know it's a dissatisfying answer, but I really just think it takes a lot of practice :)</span></td></tr>
<tr class="dark"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: I heard that you are a great gamer, are you a fan of mariokart64 ? :-)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: And it's probably harder to be red now than it used to be.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: I did like it.  Went for a couple of times, but the competition in MK64 is in-bloody-sane</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: I seem to remember my best-rated time was on Banshee Boardwalk or something</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: Snaking is so hard</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: great :-)</td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">SnapDragon: I see, well do you think such practice should be in some direction/approach, or just pick any problem and solve it!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: To do well in TopCoder you really need breadth, I think</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: On an ACM team you can get away with specialties</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: So you need to practice all kinds of problems.  ESPECIALLY the ones you have trouble with. :)</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">hi</td></tr>
<tr class="light"><td class="value"><strong>oh_No</strong></td><td class="value">SnapDragon: do you participate in match?</td></tr>
<tr class="dark"><td class="value"><strong>xhae</strong></td><td class="value">oh the Dragon is here :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">oh_No: No, too late for me</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">oh_No: I only do the 9:00 pm ones these days</span></td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">SnapDragon: how old are you?</td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">SnapDragon: I've problems with problems that contain a lot of details and may require a combination of multiple algorithms/tricks to solve, I just can't hold all the details up in my head, any advice how to approach such problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">martins256: 28</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">martins256: Sorry, 29</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">martins256: LOL</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">SnapDragon: :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: Actually, I find the complex ones usually don't have hard algorithms.</span></td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">SnapDragon: yep but many details, and that's my problem</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: But that's definitely a skill, being able to assemble a lot of pieces together reliably</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: And I think part of why I do well is I've gotten more consistent.  It's a lot easier to find 1 or 2 bugs in a program than 10 or 15.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cpphamza: Once you've practiced a lot, you're really just piecing together things you've coded before, 99% of the time. :)</span></td></tr>
<tr class="dark"><td class="value"><strong>novero</strong></td><td class="value">SnapDragon: how did you practise when you just started pragramming ... any specific strategy followed</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">novero: It was a different era back then</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">novero: But it's the same as today: I just did zillions and zillions of problems of all kinds</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">novero: Back when I was starting out, UVA didn't exist; it was hard to find good contest problems</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">novero: Nowadays there are almost too many</span></td></tr>
<tr class="light"><td class="value"><strong>Neverauskas</strong></td><td class="value">SnapDragon: How big is your zillion? about 1000?</td></tr>
<tr class="dark"><td class="value"><strong>felix_halim</strong></td><td class="value">SnapDragon: are you planning to write books on those problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Neverauskas: I've probably done thousands of problems in my lifetime</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Neverauskas: That's my off-the-cuff estimate :)</span></td></tr>
<tr class="light"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: how did you find contest problems in "that era"?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Lots of others have written web guides (and even a book or two)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: I've considered making a website before, but never got around to it :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: And there are plenty out there</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: They were quite trivial by today's standards</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: A simple DP was actually considered a tough problem</span></td></tr>
<tr class="light"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: well, I meant that you couldn't look at uva-site</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: Everyone was new to programming contests.  The "standard" algorithms hadn't really crystallized</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: Yeah.  I believe we dug up some ACM Regionals, but even that was quite hard</span></td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: ah, interesting evolution</td></tr>
<tr class="light"><td class="value"><strong>Neverauskas</strong></td><td class="value">SnapDragon: Why didn't you register for todays SRM?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: In the very beginning we actually mostly practiced on old ACM Finals and problems our coach came up with</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Neverauskas: Too late for me.  Going to bed afterwards :)</span></td></tr>
<tr class="dark"><td class="value"><strong>felix_halim</strong></td><td class="value">SnapDragon: how often do you read research paper to solve hard problems?</td></tr>
<tr class="light"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: and you tried to find good testcases yourself?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: A problem that requires a research paper to solve is a bad problem.</span></td></tr>
<tr class="light"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: acm doesn't give their testcases</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: You won't see them on Topcoder or (intentionally) in the ICPC.  You might see a couple at UVA :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: Yeah, our coach came up with the testcases</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">felix_halim: and some more in IOI ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: And ran the contest as best he could in our local environment</span></td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">SnapDragon: good coach :)</td></tr>
<tr class="light"><td class="value"><strong>glue2glee</strong></td><td class="value">SnapDragon: who was he?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: Yeah.  He was Gordon Cormack.  A fanastic guy, and I think I owe all my career to his guidance :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: He'd just taken up coaching the year I came to University, and he really helped us out</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: He was learning just as much as we were</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">SnapDragon: cool. cormack was your coach :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mishastassen: Again, none of us really knew the skills that are basic today</span></td></tr>
<tr class="light"><td class="value"><strong>felix_halim</strong></td><td class="value">SnapDragon: why do you think research paper problems are not suitable for contests?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">tsalman: Yep. :D</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Because the only people who solve them are those who've read the result before.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: You can't solve a research problem in a contest.</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Hello!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Yo</span></td></tr>
<tr class="light"><td class="value"><strong>felix_halim</strong></td><td class="value">SnapDragon: not until everybody knows the results (just like DP back then)? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Right.  Back then, if a Max Flow problem came up on a contest, nobody would have a chance of solving it.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: You can't derive Max Flow on your own in contest time. :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Mind you, new algorithms DO show up.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: But they're the kind that are possible to figure out, if you're smart.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: I don't know if you saw my Tunnel Revision problem on a past Finals</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: That one was probably too close to a research paper problem</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Nobody solved it</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Nobody really came close :(</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: (Though there are so many problems at the Finals these days that people might just not have had time to think about it)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">felix_halim: Heh, NOW it gets announced :P</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">yeah sorry about that</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Where did you learn algorithms or how?</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">tech difficulities :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Well, I took the usual Algorithms courses in University</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: But really, it was from ACM practice</span></td></tr>
<tr class="light"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: Where did you learn to play games like ... that?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: When did you start programming And how old are you now?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: Heh, just played games all my life :P</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: I'm 29, and probably started when I was 5 or 6 with BASIC</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Sarkin: he is 29 :)</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">haha, a lot of questions repeated now :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: I didn't really start real programming until Grade 10 or so</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: And even then it was still non-OO Pascal</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">Did you achieve somethings in high-school ( like IOI ) ?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: 5 or 6 that's so early!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ardiankp: I'm just surprised I haven't had to say "practice is everything" very much yet :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: I hadn't exactly mastered control flow at that age ;)</span></td></tr>
<tr class="light"><td class="value"><strong>mincer</strong></td><td class="value">SnapDragon: how much time one should train everyday to become red?</td></tr>
<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">ktuan: no, he had never time to try that</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Yeah</td></tr>
<tr class="dark"><td class="value"><strong>mogers</strong></td><td class="value">SnapDragon: Hi. Do you think that TopCoder contests are a good way to train for acm regionals/finals? thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ktuan: I competed in the IMO, but no, I didn't start computer contests until University</span></td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: So is practice everything?</td></tr>
<tr class="light"><td class="value"><strong>maradonah</strong></td><td class="value">SnapDragon: What training plan would you suggest for novice and intermediate programmers for preparing for ACM?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: As much as you can stand. :)  I'm able to focus a lot; when I practice, I really go overboard.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: TopCoder is a fantastic way to train for the ICPC</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: Nothing really compares to solving problems in a contest environment</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: When you learned algorithms you just practiced or you used some books or something if yes what's it's name?</td></tr>
<tr class="dark"><td class="value"><strong>Sunny_05</strong></td><td class="value">SnapDragon: wat advice wud u wanna giv to starters on topcoder ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: And since TopCoder is less forgiving, you'll be much more accurate in your ICPC submissions</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: Yep, practice is everything :)</span></td></tr>
<tr class="light"><td class="value"><strong>mincer</strong></td><td class="value">SnapDragon: how do you improve your challenge skills? Do you train it for special?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">maradonah: I would suggest doing past Regionals in a contest environment (ie, sit down for 5 hours and compete)</span></td></tr>
<tr class="light"><td class="value"><strong>litwin</strong></td><td class="value">What editor & font are u using ? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">maradonah: And compete on TopCoder, of course</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">maradonah: Doing past UVA questions also helps</span></td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">SnapDragon: what's your favourite game ?</td></tr>
<tr class="light"><td class="value"><strong>vinay.emani</strong></td><td class="value">SnapDragon: your DP solutions are like textbook for me.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: My challenge skills aren't that great :(</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: That's one thing Petr really mastered that I never really did</span></td></tr>
<tr class="dark"><td class="value"><strong>mogers</strong></td><td class="value">SnapDragon: how about team practice? Did you often practice along your teamates?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: (part of it that I never ever "shotgun" challenge, even though it's often a good strategy)</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Is "Introduction To Algorithms" good?</td></tr>
<tr class="light"><td class="value"><strong>comwizz14</strong></td><td class="value">SnapDragon: do you think that your coding and problem solving skills are entirely upto practice or is it due to you starting early as a lot red coders i see have good mathematical foundation participation in math olympiads,it seems a steep curve if you st</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">marcadian: Tetris Attack :)</span></td></tr>
<tr class="light"><td class="value"><strong>xhae</strong></td><td class="value">SnapDragon: Actually I think SRM is quite different from ICPC because I felt SRM problems are tend to easy-coding problems... so </td></tr>
<tr class="dark"><td class="value"><strong>xhae</strong></td><td class="value">SnapDragon: do you have any recommendation to practice such codings for ICPC?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">vinay.emani: Thanks. :)  I've done so many, they tend to always come out the same way!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: Yes, we practiced 1 or 2 full contests a week</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: It helped a LOT</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: Although on Waterloo teams we were pretty independent, solving problems on our own</span></td></tr>
<tr class="light"><td class="value"><strong>marcadian</strong></td><td class="value">SnapDragon: why you like that? what make you interesting?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Yes, CLR is a great reference</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">xhae: Actually, that used to be the case... but I'm not sure any more</span></td></tr>
<tr class="dark"><td class="value"><strong>mogers</strong></td><td class="value">SnapDragon: owo. we practice only once a month :P thank you :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">xhae: TC problems have gotten quite brutal over the years</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">xhae: Many equivalent in difficulty to hard ICPC problems</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: The mathematical foundation definitely helps</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: But the thing is, I never excelled in math the way I did in coding</span></td></tr>
<tr class="light"><td class="value"><strong>piva</strong></td><td class="value">SnapDragon: In what moment did you notice you were getting really good at programming? And what do you think that made the diffrence?</td></tr>
<tr class="dark"><td class="value"><strong>xhae</strong></td><td class="value">hm- thanks :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: I'd attribute that to a) practice, and b) the newness of the field</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: (when nobody's very good, it's easier to rise to the top :)</span></td></tr>
<tr class="light"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: When playing as a team, what was your best strategy?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">piva: Well, I guess the first hint was when I qualified for Waterloo's B Team the first time I ever wrote a contest :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">piva: But really, I didn't get what I'd consider "good" until my second ICPC Finals</span></td></tr>
<tr class="dark"><td class="value"><strong>cuihaochuan</strong></td><td class="value">SnapDragon: do you have a girlfriend?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">piva: There was a HUGE amount of practice between the two</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: We were all smart people at Waterloo, so we were fine picking a problem and working independently to solve it</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: If there was a conflict for the keyboard one of us would try to write out pseudocode on paper while waiting</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: And we had to be really good at estimating how long it would take to code a solution</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: That was definitely a skill we cultivated with practice</span></td></tr>
<tr class="dark"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: what do you mean by fine picking?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">cuihaochuan: Yes, I had to kick her off Spore to come chat :)</span></td></tr>
<tr class="dark"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: trying to know which problem is for which person?</td></tr>
<tr class="light"><td class="value"><strong>black_hole</strong></td><td class="value">what do u suggest for improving coding speed ? </td></tr>
<tr class="dark"><td class="value"><strong>coder29</strong></td><td class="value">SnapDragon: whats ur basic stratedy while picking up the problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: I mean that we each just picked a problem and worked on it ourselves</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: We didn't collaborate much unless we were in trouble and had to debug</span></td></tr>
<tr class="light"><td class="value"><strong>mincer</strong></td><td class="value">SnapDragon: how did you combine trainings with the studying at the university? Did you have any problems with the "main" studying through sparing so much training on trainings?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mohamedafattah: We would a) pick a problem, b) figure out how to solve it, c) estimate the time it will take to code, and then d) take the computer if our estimate was lower than the current user</span></td></tr>
<tr class="light"><td class="value"><strong>mincer</strong></td><td class="value">SnapDragon: *so much time on trainings</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: Not really.  I did a lot of both. :)</span></td></tr>
<tr class="light"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: what if the problem went wrong and you got about 3-4 WAs?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Did you participate in the IOI?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: And school was fairly easy compared to ACM contests</span></td></tr>
<tr class="dark"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon:what do u suggest for improving coding speed ? </td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: No.  Unfortunately, Canada was just getting an IOI team together my last year of high school.</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: If yes did you get any medal?</td></tr>
<tr class="light"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: do you leave it at all / continue as you did effort in it / leave it and pick it up again?</td></tr>
<tr class="dark"><td class="value"><strong>ziliang</strong></td><td class="value">SnapDragon: if we perform well in algorithm contest, what kind of job do you think we can do better?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: And only from the Eastern Provinces, so I never had a chance.</span></td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: how fast do you type?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: That's something that comes purely from practice.</span></td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: any chances beating Minilek in a typing game?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: When did you join TC?</td></tr>
<tr class="dark"><td class="value"><strong>ybgnahz</strong></td><td class="value"> SnapDragon:how do you balance your study and the programming</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: When you've coded the same thing 10 times before, it comes out really fast and really smoothly.  (And really elegantly and bug-free)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: I'm pretty sure Minilek would beat me :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: But I'm one of the faster typists at TC, I think</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: That's what I recall from past TCOs, anyway</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Yeah you wright in a flash!</td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ilham: I'm held up by thinking speed when coding.</span></td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: hehehehe</td></tr>
<tr class="light"><td class="value"><strong>ziliang</strong></td><td class="value">SnapDragon: if we perform well in algorithm contest, what kind of job do you think we can do better?</td></tr>
<tr class="dark"><td class="value"><strong>ilham</strong></td><td class="value">SnapDragon: aren't we all :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: Well, it'll make it easier to GET a software job.  Don't know how much it will help you PERFORM it. :)</span></td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">SnapDragon: How do you catch other's bug? &lt;- What's your know-how of challenge?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: About 2 years into its existence, I think?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">kcm1700: I'm not actually very good at challenging</span></td></tr>
<tr class="light"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: how do you choose problem , means u start with any prefernce order or somthing else?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">kcm1700: I tend to be surprised by the mistakes people make on problems</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: why did you choose working at google ? :)</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">SnapDragon: thanks a lot.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">kcm1700: Some good challengers know what to look for right away</span></td></tr>
<tr class="dark"><td class="value"><strong>mincer</strong></td><td class="value">SnapDragon: Did you have adequate private life (sparing time with friends, girlfriend, sports, etc) while doing a lot on both contests and university?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: First when you joined TC were you red from the start?How much time did it take you to become red?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: In TC?  Easy, Medium, Hard.  I hope to solve them all or it's a bad contest :)</span></td></tr>
<tr class="light"><td class="value"><strong>Mindhunter74</strong></td><td class="value">SnapDragon: What's the best way to learn DP?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: Everybody was doing it :)</span></td></tr>
<tr class="light"><td class="value"><strong>ybgnahz</strong></td><td class="value">SnapDragon:how to coding faster?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: Just wish I'd done it sooner!</span></td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">SnapDragon: What's your idea about string parsing problems?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: No, I didn't have much of a life</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Mindhunter74: Practise!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mincer: It was gaming, contests, school :)</span></td></tr>
<tr class="light"><td class="value"><strong>shady_mokhtar</strong></td><td class="value">SnapDragon: can only being a good programmer in problem solving and algorithms get a nice job and what is it if yes ?????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: What about them?  I usually just solve them heuristically.</span></td></tr>
<tr class="light"><td class="value"><strong>ziliang</strong></td><td class="value">SnapDragon: that's what i'm thinking about. it's just something that one can show off. but no idea how much it can help us in work. unless you're doing some core technic in google,ms... do you think so?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: I seldom have to write a recursive parser or anything</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: why aren't you participating in marathon matchs ? :p</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">shady_mokhtar: Yeah, doing well in TC will really help you get a good job :)</span></td></tr>
<tr class="light"><td class="value"><strong>ziliang</strong></td><td class="value">SnapDragon: and btw, where are you working/studying?</td></tr>
<tr class="dark"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: no what u prefer  easy,med.,hard r first analyze all three n then decide?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Why don't participate in MMs?</td></tr>
<tr class="dark"><td class="value"><strong>AjJi</strong></td><td class="value">Sarkin: hehe, same question :p</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: I really don't find it's too applicable to work, honestly. :(  Work coding is boring and tedious... that's why you get paid.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: The interesting problems are very rare.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: Working for Google</span></td></tr>
<tr class="dark"><td class="value"><strong>piva</strong></td><td class="value">SnapDragon: What do you think are the most important category of problems both for TC and ICPC? Do you try to practice more of one kind?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: Like Petr!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: No, you have to solve them as you open them because the time ticks down.</span></td></tr>
<tr class="light"><td class="value"><strong>ziliang</strong></td><td class="value">SnapDragon: you don't find it useful even when you work in Google?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Lack of time.  I did a few at the start.</span></td></tr>
<tr class="light"><td class="value"><strong>comwizz14</strong></td><td class="value">SnapDragon: havent you thought of going into research in CS ? that shud not be boring :) .. </td></tr>
<tr class="dark"><td class="value"><strong>comwizz14</strong></td><td class="value">SnapDragon: with ur ability</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Yes, and Tomek, and John Dethridge, and Dan Wright, and many many other red TopCoders :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: WHy don't you work for Microsoft? Isn't it possible?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: I don't find the work at Google is very atypical.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: It's the environment that's great.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ziliang: The work's still boring. :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: I did consider it.  Unfortunately, I got burnt out after Undergrad, and left Grad school</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">comwizz14: I still think I might've been happier in academia.  Tough to say.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Certainly considered it.  I have friends who do.</span></td></tr>
<tr class="light"><td class="value"><strong>CoreDumped</strong></td><td class="value">SnapDragon: which games do u play now?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: BTW, another thing I find really helps: learn to write "elegant" code</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: That was a mantra back when I was first competing in the ACM and TC</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: Your code should look like what it's doing</span></td></tr>
<tr class="light"><td class="value"><strong>stone</strong></td><td class="value">SnapDragon: Why does Google hire one who thinks work is boring:) </td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">SnapDragon: What do you mean elegent?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: If you can understand it at a glance, bugs become a lot easier to find</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Sarkin: And a lot rarer, because you won't even make as many mistakes writing it</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">hello evryone</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">hi SnapDragon</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">stone: Maybe it wasn't smart of them :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Elegance is hard to define</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: what do you think is boring out there?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: Any development you get paid for :)</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: hehe :)</td></tr>
<tr class="dark"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: why google's product(many) are in beta stage though it has best coders in the world?</td></tr>
<tr class="light"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: What is your job in Google? What project(s) are you responsible for?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">When I think of an algorithm in my head, the code should closely match what I'm doing in my head</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Even line by line</span></td></tr>
<tr class="dark"><td class="value"><strong>solafide</strong></td><td class="value">SnapDragon: Do you contribute to any open-source projects?</td></tr>
<tr class="light"><td class="value"><strong>marcadian</strong></td><td class="value">SnapDragon: even if it's boring, u still can play game at google :)</td></tr>
<tr class="dark"><td class="value"><strong>jarrah</strong></td><td class="value">SnapDragon: what's the relationship like between tomek and your girlfriend?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Nobody can write ugly code consistently</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">Hey SnapDragon....do you learn algorithms????</td></tr>
<tr class="light"><td class="value"><strong>bucephalus</strong></td><td class="value">Tell us about you crazy puzzle solving. Puzzles that challenged you the most.</td></tr>
<tr class="dark"><td class="value"><strong>bucephalus</strong></td><td class="value">*your</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">The best coders are very good at writing elegant code, which works the first time they compile because it's so "straightforward"</span></td></tr>
<tr class="dark"><td class="value"><strong>andrei-alpha</strong></td><td class="value">SnapDragon: how fast do you write ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">solafide: No</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">solafide: I'm not much of a Unix coder, to be honest :)</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">Should we try to learn algorithms!!!......</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: Definitely.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: Take algorithms courses in University</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: Read CLR</span></td></tr>
<tr class="light"><td class="value"><strong>rahulgarg123</strong></td><td class="value">SnapDragon: So, did you actually took a stab at Grad School before joining google?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: The same kinds of algorithms come up ALL THE TIME at TC and ICPC</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: do you write some code on your sparetime? if yes, what codes ? :p (besides TC)</td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">SnapDragon: What's the biggest project you have done ever?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">andrei-alpha: Probably 100 wpm or so?  I never really measure it</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">rahul1990gupta: Yeah, I did one year at Toronto</span></td></tr>
<tr class="light"><td class="value"><strong>rahulgarg123</strong></td><td class="value">SnapDragon: theory,I presume?</td></tr>
<tr class="dark"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: ALL the algorithms from CLR must be mastered?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: I do a lot of contest work in my spare time</span></td></tr>
<tr class="dark"><td class="value"><strong>andrei-alpha</strong></td><td class="value">SnapDragon: oo good :)</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">And what about the maths tht is involved..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: I test-solve problems for UVA, various Regionals, the Finals</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: The Google Code Jam</span></td></tr>
<tr class="dark"><td class="value"><strong>AjJi</strong></td><td class="value">SnapDragon: ok :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: The IOI, sometimes</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">AjJi: Lots :)</span></td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">Do you smoke while coding? or do you have favourite drinks?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: Uh, on my own?</span></td></tr>
<tr class="light"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: What do you think about solving problems from online judges</td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">SnapDragon: yeah</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: Probably a PC graphics Demo I coded back in high school.</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: Actually whenever i submit solutions...it exceeds time limit...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: 80k or so of pure assembly.  (That was really stupid, but fun. :)</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: What should i do about that..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: No, not even close.</span></td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">Petr: are you there</td></tr>
<tr class="light"><td class="value"><strong>seaking</strong></td><td class="value">what's the IOI??</td></tr>
<tr class="dark"><td class="value"><strong>CoreDumped</strong></td><td class="value">SnapDragon: heard you are a gamer. what are you favorite games?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: There's really a standard set of easy-to-code well-known algorithms that are used in contests</span></td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: Do u think OJ's are a better way to practice and learn algos or TC style competitions are better?</td></tr>
<tr class="light"><td class="value"><strong>jarrah</strong></td><td class="value">seaking: international olympiad in informatics, only the best high school computer science competition in the world</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: You need to learn how to analyze runtime complexity</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: It's complicated, but CLR talks about that kind of thing a lot</span></td></tr>
<tr class="dark"><td class="value"><strong>seaking</strong></td><td class="value">jarrah: thanks :)</td></tr>
<tr class="light"><td class="value"><strong>ACThread</strong></td><td class="value">SnapDragon: how to study algorithm</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: In particular, you need to know the difference between exponential and polynomial runtime</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: thank you so much</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">CoreDumped: Tetris Attack :)</span></td></tr>
<tr class="light"><td class="value"><strong>Nerwosolek</strong></td><td class="value">What's CLR?</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: I jus started reading CLRS..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: OJs?</span></td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: Online judges</td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">Petr: are there anything like inborn talent</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: do you work or u r at university?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: Oh.  Competitions are always better, because you just don't get into that frame of mind unless it really "matters".</span></td></tr>
<tr class="dark"><td class="value"><strong>pankaj_k</strong></td><td class="value">yes</td></tr>
<tr class="light"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: how to master bitmask used in dp?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: However, contests don't run all the time. :)</span></td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: What are your habits while coding? Any special music, cigarettes, drinks?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: You definitely need to practice a lot of OJ problems, I think</span></td></tr>
<tr class="light"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: i find it hard</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: I work at Google</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: ohhh....gr8</td></tr>
<tr class="dark"><td class="value"><strong>mohamedazouz</strong></td><td class="value">fenak ya ahmedsad</td></tr>
<tr class="light"><td class="value"><strong>pankaj_k</strong></td><td class="value">Petr: yes</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: Bitmasks are used in plenty of problems, not just DP</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: I think there are some good TC articles about it</span></td></tr>
<tr class="dark"><td class="value"><strong>mohamedazouz</strong></td><td class="value">fenak ya ahmedsadek</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: Dont you think "Software Engineering" is a lot more than Programming??</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: Actually i even find it really tough to think in terms of 0's and 1's as bit theory demands</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: There's nothing really complicated about bitmasks, but they do reduce the elegance of your code a little.</span></td></tr>
<tr class="dark"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: oh... thnx</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: I use them when necessary, but sometimes a vector&lt;vector&lt;int&gt; &gt; is better than a vector&lt;int&gt; of compressed bitmasks :)</span></td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: being in blue is enough to work at google or not...</td></tr>
<tr class="light"><td class="value"><strong>maradonah</strong></td><td class="value">SnapDragon: what algorithms do u recommend for your ICPC algorithms library?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: Absolutely.  TC skill may be correlated with SE skill, but it's definitely not all there is to it.</span></td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">SnapDragon: Do you have another profession than programming?</td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: did u take part in any of the iois ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: Yeah, nothing wrong with being blue :)</span></td></tr>
<tr class="dark"><td class="value"><strong>piva</strong></td><td class="value">SnapDragon: Petr said he almost didn't do OJ. Do you think it depends on the person, or that we should try OJ problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: Honestly, having a high rating at TC just means you're good at ... solving TC problems</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: In the real world it matters a lot less</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: Lots of really great programmers and really smart people have tried TC and not done well :)</span></td></tr>
<tr class="dark"><td class="value"><strong>maradonah</strong></td><td class="value">SnapDragon: like me :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">piva: Can't hurt to try. :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">piva: More practice is always better.</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon:  why the name "SnapDragon"</td></tr>
<tr class="dark"><td class="value"><strong>DieIng</strong></td><td class="value">:)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: No, Canada didn't really get organized until I was out of High School.</span></td></tr>
<tr class="dark"><td class="value"><strong>kphmd</strong></td><td class="value">why</td></tr>
<tr class="light"><td class="value"><strong>piva</strong></td><td class="value">SnapDragon: But how do you choose the problems you are going to train with? Based on difficulty, or category?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: No, just programming.</span></td></tr>
<tr class="light"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: oh</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: No real reason; I've had it for a long time.  It's basically a pun, and I like it.</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: great!!!</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: I am a beginner in algorithms.....where would you suggest me to start from??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: And since I'm famous with it, I can't get rid of it :P</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: only CLR or something else also?</td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: Do you suggest macros?</td></tr>
<tr class="dark"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: ha ha....there you go</td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: what rating will Ken thompson(unix developer) will attain if he is topcoding</td></tr>
<tr class="dark"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: Do you suggest macros?</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: I find that very few Algorithm toppers are playing MM's..</td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: CLR is good, I think.  Work on math problems, too.</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: Any reason behind it??</td></tr>
<tr class="light"><td class="value"><strong>Nerwosolek</strong></td><td class="value">progfool: what's CLR?</td></tr>
<tr class="dark"><td class="value"><strong>mogers</strong></td><td class="value">SnapDragon: do you think that someone (like me) that works a lot on an interesting project, but tends to not work when faced with a boring project have chances to be hired by google?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: A solid math basis is really good for those times when you can't just use a standard algorithm.</span></td></tr>
<tr class="dark"><td class="value"><strong>kphmd</strong></td><td class="value">?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: Uh, no idea :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: Really?  venco was doing really well at them back at the start</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: Why is everybody so crazy about google</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">Nerwosolek: ITs Cormen,Book for algorithms....4 writers</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: But it's similar to how there isn't much overlap between top TCers and top component developers</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">Nerwosolek: amazon.com u can search for it</td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: i say ataryt your own google</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: They're different skills and appeal to different people</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: start*</td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: Is working in google fun or does it mean a lot of boring dirty work :P ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">mogers: I guess so, I'm probably the same way :P</span></td></tr>
<tr class="dark"><td class="value"><strong>Nerwosolek</strong></td><td class="value">progfool: OK. I think I know it.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: Heh, Google isn't quite the fun startup it used to be</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: But you do get to work with really smart people</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: What kind of math problems...and where can i get those???</td></tr>
<tr class="dark"><td class="value"><strong>mogers</strong></td><td class="value">SnapDragon: good to hear that :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: And the environment and perks are great</span></td></tr>
<tr class="dark"><td class="value"><strong>kphmd</strong></td><td class="value">what about?</td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: you told in google you are coding the standard algorithms.....if it so what is the use of being in red...:)</td></tr>
<tr class="dark"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: would you take a job at microsoft?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: Boring dirty work mostly, same as anywhere :)</span></td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: any one can just do it...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samsam: Well, it got me the job :)</span></td></tr>
<tr class="dark"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: ok...i guess a mind like you can do his own google :P</td></tr>
<tr class="light"><td class="value"><strong>ACThread</strong></td><td class="value">SnapDragon: I am a beginner in algorithms.....where would you suggest me to start from??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: High School Olympiad problems are a good place to start.</span></td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: :)ofcourse you are right.....</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: "Boring dirty work mostly"..i hope Larry is'nt somewhere around..</td></tr>
<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">SnapDragon: at what age did you start programming?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pSaiko: Probably, if I wasn't already comfortable at Google :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: I don't know, you have to be pretty lucky to have a startup become the next Google, no matter how smart you are :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ACThread: Take a University Algorithms course, read CLR</span></td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">SnapDragon: How many hours do you use computer during a day?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ACThread: There are lots of good TopCoder articles, too</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">ACThread: Covering standard contest algorithms</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">hamedvalizadeh: Probably 10-12</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Lugera: 5 or 6?</span></td></tr>
<tr class="dark"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: luck comes with your hardwork and your power to dream big</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: You're not Larry, are you???</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: :D</td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">Ishan: i asked if he would take a job at microsoft...</td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: why dont you try for Bell labs...:)</td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: anyways...you are one  gem of TC...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: And luck comes with a great big heap of luck, too :()</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: Heh, thanks :)</span></td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: whats ur age! ?</td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: yup</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: Though my star has kind of set... heh</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: 29</span></td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">SnapDragon: i noticed that you have a great challenge success rate. what does it take to be a good challenger? do you build cases before challenge ?</td></tr>
<tr class="light"><td class="value"><strong>black_hole</strong></td><td class="value">SnapDragon: are u interested in Algorithms research ....?</td></tr>
<tr class="dark"><td class="value"><strong>{magneto}</strong></td><td class="value">SnapDragon: how well is one's performance in TC SRMs recognised around the world ? do you think they are as prestigious and weel known as ACM ICPC ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">wrick: Actually, to be honest I don't think it's good to have a high challenge success rate</span></td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">SnapDragon: Which books should be read for graph related problems?</td></tr>
<tr class="light"><td class="value"><strong>VArt</strong></td><td class="value">SnapDragon: Do you use Linux or Windows?</td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">SnapDragon: really? why? </td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">wrick: Petr has won many SRMs just by "shotgun" challenging, applying a tough test to people's solutions without even reading them</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">wrick: It works well</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">wrick: I'm always too wimpy to do it</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">black_hole: Yeah, I love trying to come up with new algorithms :)</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: You i think spotlight sessions are good for novice like us but for you- whos facin it, it must be like an apple and 100s of shooter...good luck</td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">SnapDragon: i know what you mean. i do that when i am in div2... div1 people are smart for me</td></tr>
<tr class="light"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: i tried what u said Petr did n i lost all the points i dint hav !!!</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">hi</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">{magneto}: Honestly, I wouldn't have the "fame" I do now if it weren't for TC.  I think it's MORE prestigious than the Finals, really.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">{magneto}: Because two times at the Finals and you're out.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">{magneto}: Whereas if you're a target at TC, you're there for years</span></td></tr>
<tr class="dark"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: do you optimize your code for performance after making sure its correct?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">raviupreti85: Heh, thanks :)</span></td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">SnapDragon: Which books should be read for graph related problems?</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">SnapDragon: hello snapdradon</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: Well, it has to be a good challenge on a problem with a "twist" to it</span></td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: I was taking a Testing seminar in my firm last week.while i was talking on test cases i had you,Petr..etc in mind..The way you ppl think .</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: One good way to come up with a challenge case is if you find a bug in your own code</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: Remember it, and look for it in others' code</span></td></tr>
<tr class="dark"><td class="value"><strong>ACThread</strong></td><td class="value">SnapDragon: Thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">srivatsan_1991: And if you think it's really an easy bug to make, then try the shotgun challenging... but I assume no responsibility for lost points :)</span></td></tr>
<tr class="dark"><td class="value"><strong>srivatsan_1991</strong></td><td class="value">SnapDragon: lol</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pSaiko: No, I tend to write my code once.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pSaiko: You learn to estimate how fast you need to write it from the start</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pSaiko: (There are exceptions of course)</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: i told them the importance of your development skills for Testing a piece of code</td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">SnapDragon: thx</td></tr>
<tr class="dark"><td class="value"><strong>mohamedafattah</strong></td><td class="value">SnapDragon: I always see your problems used in regionals / world finals, and they are wonderful. Why don't you write for topcoder?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: Again, I'm not really in Petr's league when it comes to challenge cases</span></td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">SnapDragon: which company you work for SnapDragon?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: It's definitely an acquired skill, finding bugs in other people's code</span></td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">simplysuperb_kn: Google.</td></tr>
<tr class="light"><td class="value"><strong>mohamedafattah</strong></td><td class="value">simplysuperb_kn: Google</td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: why dont you register for SRM</td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">SnapDragon: you aint taking part in todays SRM</td></tr>
<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: only 4 mins left :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: The best way to test code is to write it elegantly so it's obvious it's correct :)</span></td></tr>
<tr class="dark"><td class="value"><strong>bardek</strong></td><td class="value">SnapDragon: are you going to participate in this SRM ?</td></tr>
<tr class="light"><td class="value"><strong>supernova</strong></td><td class="value">reviupreti85: I think he's registering for the high school one</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: If it's a soup of "if"s and "goto"s, I don't care how much you've tested it, there's probably still a bug</span></td></tr>
<tr class="light"><td class="value"><strong>muxecoid</strong></td><td class="value">SnapDragon: Can you name a few software projects you worked on?</td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">maybe SnapDragon is the writer!</td></tr>
<tr class="light"><td class="value"><strong>wrick</strong></td><td class="value">oh no!</td></tr>
<tr class="dark"><td class="value"><strong>MH35</strong></td><td class="value">Any Japanese here?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">I'm not doing the SRM today... too late for me</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">simplysuperb_kn: Google</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">muxecoid: Erm... famous ones?  Not really</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: Ah that's a good clue..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">muxecoid: I work on Ads Quality at Google :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Danko</strong></td><td class="value">SnapDragon: How do you solve problems? :) Do you use some heuristic methods?</td></tr>
<tr class="light"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">SnapDragon:Thanks!!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">muxecoid: Before that, I worked on a competitor for BLAST, in the Bioinformatics field</span></td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">SnapDragon: just do let us how it goes</td></tr>
<tr class="dark"><td class="value"><strong>gautamverma</strong></td><td class="value">SnapDragon: what the best way to score in a SRM??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Danko: I solve problems by writing the same code I did the last time I saw the problem. :)</span></td></tr>
<tr class="dark"><td class="value"><strong>MH35</strong></td><td class="value">To register or not to register?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Danko: 80% of the problems I see are variations on ones I've solved many times before.</span></td></tr>
<tr class="dark"><td class="value"><strong>pSaiko</strong></td><td class="value">What was/is the hardest "genre" of problem you had/have to overcome?</td></tr>
<tr class="light"><td class="value"><strong>miz-kmm</strong></td><td class="value">are there japanese???????????????</td></tr>
<tr class="dark"><td class="value"><strong>MH35</strong></td><td class="value">I'm very tired</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Danko: That's what practice does for you</span></td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">SnapDragon: Can you please suggest us the book for graph problems?</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">SnapDragon: is it? many of the top coders usually have an "if soup" approach when dealing with complicated problems... and it seems to work</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">simplysuperb_kn: I don't know of a Graph problem-related book</span></td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: dont you think TC's sometimes hurting a persons Coding skill.Neat codes are a rarity in here..</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">how long did it take you to practice in order to achieve that 80% familiarity?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pdallago: No, I think the best coders find the clever way to make the code pretty</span></td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: If you have very less time left.....which algorithm would you go through....i mean which is the most widely algorithm appearing in contests</td></tr>
<tr class="light"><td class="value"><strong>mozeda</strong></td><td class="value">SnapDragon: hello~!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pdallago: Ok, it can still get a little complicated</span></td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: sorry for my english...</td></tr>
<tr class="dark"><td class="value"><strong>MH35</strong></td><td class="value">I retire today's SRM</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pdallago: But I think if you compare, say, Petr's code on a tricky detail-oriented problem with someone else's, you'll notice it has far fewer special cases and such</span></td></tr>
<tr class="dark"><td class="value"><strong>sahiltiwari</strong></td><td class="value">SnapDragon: In solving problems which part you think is most important.It is logical thinking or Implimentation</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">pdallago: It's necessary for consistency, especially since TC is so unforgiving of mistakes</span></td></tr>
<tr class="dark"><td class="value"><strong>gaohaidong</strong></td><td class="value">Don't leave...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: I don't think TC HURTS a programmer's skill</span></td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">SnapDragon: ok, thanks</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">SnapDragon: What is your favorite problem from last months' SRMs ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">samshu: It does teach you how to write more elegant, bug-free code.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">vexorian: I haven't done an SRM in a month. :(</span></td></tr>
<tr class="dark"><td class="value"><strong>gautamverma</strong></td><td class="value">SnapDragon: what is a Bug Free code??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">vexorian: (And, regrettably, I don't have time these days to do all the TC problems as they come out)</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">okay folks let's wrap this up since the SRM is about to start</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">SnapDragon: true...but a neat code is very important for SQA!</td></tr>
<tr class="dark"><td class="value"><strong>ulzha</strong></td><td class="value">gautamverma: :D</td></tr>
<tr class="light"><td class="value"><strong>cuihaochuan</strong></td><td class="value">SnapDragon: thanks</td></tr>
<tr class="dark"><td class="value"><strong>solafide</strong></td><td class="value">SnapDragon: Thanks for putting on this chat - many thanks for staying up late for us. It's been very enjoyable. Good luck on your target status! ;)</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">Thanks to SnapDragon for chatting with us this morning/evening/afternoon</td></tr>
<tr class="dark"><td class="value"><strong>felix_halim</strong></td><td class="value">SnapDragon: thanks</td></tr>
<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: All the best to you for further progrmming:)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">progfool: Dijkstra (Breadth-First Search) is probably one of the most common problem types</span></td></tr>
<tr class="light"><td class="value"><strong>comwizz14</strong></td><td class="value">SnapDragon: thanks a lot</td></tr>
<tr class="dark"><td class="value"><strong>ACThread</strong></td><td class="value">kphmd: you are very well</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">the chat will be posted shortly on the website</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">jmpld40: evening here!!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">solafide: Thanks, hope I can hold on to it :)</span></td></tr>
<tr class="dark"><td class="value"><strong>jansonh</strong></td><td class="value">thanks all</td></tr>
<tr class="light"><td class="value"><strong>gautamverma</strong></td><td class="value">SnapDragon: i think i m too late ...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">Good luck all</span></td></tr>
<tr class="light"><td class="value"><strong>pSaiko</strong></td><td class="value">thanks man</td></tr>
<tr class="dark"><td class="value"><strong>ulzha</strong></td><td class="value">enjoy</td></tr>
<tr class="light"><td class="value"><strong>chokudai</strong></td><td class="value">Good Luck All!!</td></tr>
<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">SnapDragon: Thankyou for your advice and help</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">hope everyone learned something good so now good luck with the srm!</td></tr>
<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">SnapDragon: thank you </td></tr>
<tr class="light"><td class="value"><strong>kphmd</strong></td><td class="value">ACThread: who are you</td></tr>
<tr class="dark"><td class="value"><strong>abhinavkulkarni</strong></td><td class="value">Thanks SnapDragon! Same to you!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">SnapDragon</span></td><td class="value"><span class="bigRed">No problem, have fun :)</span></td></tr>


</tbody>
</table>
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