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
        <div>Chat transcript from TCHS SRM 60: Spotlight Session with <tc-webtag:handle coderId="270505" context="algorithm" /></div>
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

<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">g'day</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Hi John, thanks for coming</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">no problem Jessie :)</span></td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">hii sir</td></tr>
<tr class="light"><td class="value"><strong>msg555</strong></td><td class="value">good day!</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">hi!</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: hii sir</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: u r welcome  here</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: thanks</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">welcome sir</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: sir tell us something about you in brief.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">I'm a mathematician, currently working as a computer programmer, because I seem to be good at programming.  :)</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: r u studying right now or not?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: I'm working at Google now</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>NilayVaish</strong></td><td class="value">john Dethridge: Which university did you study at?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Melbourne University</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">sir what do u mean by "I retire"</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">rooparam: oh that was a joke... I changed my quote to "I retire" after I won the championship. :)</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: when did you start programming ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: I started programming when I was 8, with basic on an Apple 2</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>irancoldfusion</strong></td><td class="value">John Dethridge: Which Google office?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">irancoldfusion: Mountain View, California</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: Hi John! You did very successfully in the ACM. What was your preparation like?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: I mostly did problems from previous ACMs.  For about a month before the final my team would get together and solve previous regional contests and world finals</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: for my first year at least... in my second year at the ACM finals I didn't train that much</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: is 17 too late to start practicing for being a topcoder?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: it's never too late really if you're going to put the time into it.  A lot of successful topcoders started late, although usually they were strong mathematicians already, which helps a lot</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: sir if i will peform well in programming will the google give me job?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: they might, you should apply and find out!</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">John Dethridge: you're not working now?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">superkinhluan: I'm working at Google</span></td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">John Dethridge: I know you are working at Google, but you are not working right now?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">superkinhluan: oh I see.  No not right now, I'm taking a break!  :)  Although I have a bunch of programs running on our clusters, so I'm waiting for those to finish anyway.</span></td></tr>
<tr class="dark"><td class="value"><strong>L</strong></td><td class="value">:P</td></tr>
<tr class="light"><td class="value"><strong>L</strong></td><td class="value">http://googlified.com/googlers-excuse-for-slacking-off/</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">L: exactly!</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: hi john, i am a masters student, but I can still learn something from you ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: hi</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">John Dethridge: How long you are coding</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: I started when I was 8, although I didn't do all that much coding when I was at school...  I concentrated more on mathematics</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: sir how much pratice n level should needed to reach at google.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: well, I guess a good minimum to get a job as a software engineer is to finish a college course on software engineering, and get some experience while you're doing it</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>hallan_cs</strong></td><td class="value">john Dethridge: I have a brother with 10 years old, I should teach him a programming language?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">hallan_cs: sure, if he's interested :)  I think a good way to start is to use a simple language and write a number of programs.  Something like basic.  Some people recommend python.</span></td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">hallan_cs: no doubt</td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">hallan_cs: Python FTW &lt;- the best language in the world :)</td></tr>
<tr class="light"><td class="value"><strong>Phicardo</strong></td><td class="value">tharis: after c</td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Phicardo: Not! :p Python's great for everything! C's great for speed!</td></tr>
<tr class="light"><td class="value"><strong>Phicardo</strong></td><td class="value">tharis: 0k, after Java xDD</td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Phicardo: Fanboy! :p :D</td></tr>
<tr class="light"><td class="value"><strong>Phicardo</strong></td><td class="value">tharis: :P </td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Someone PM'd me a question about what areas of maths are useful in computer science...  I think combinatorics and graph theory are the main areas.  But any area with lots of proofs is useful as well, to develop skills in logical thinking.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">John Dethridge: Exactly How you define balance between Practice and Algorithm Study , If you weak theory background</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: I think the best way to figure out that balance is to figure out the skill level you're targetting...  the stuff you need to learn to get onto your university's ACM team is going to be different to what you need to do well in a TCO...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: so you should figure out what algorithms you want to know well, maybe by choosing chapters from a textbook, and then try to solve a lot of problems using those techniques</span></td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">John Dethridge: Not for ACM Team , Not for TCO , just to have good passion in algorithms </td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: I guess if you were interested in algorithms, but not necessarily for competitions, then you could spend more time reading papers and less time coding</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: A lot of academics do that... they have a broad knowledge of algorithms but probably couldn't sit down and code them very fast</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">John Dethridge: Thanks for Suggestion , I am little good in Mathematics at School , (Also success is motivation) so in college I started with Programming , being not good it feel bad</td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">John Dethridge: what math books you suggest for new computer scientists?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">martins256: maybe get some entry-level graph theory books.  Maths competition problem sets, at a level you can solve, might be a good idea too</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: What are some good team strategies for ACM?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: I think good team strategy depends on the relative strengths of your team.  For example if you have a very fast coder on easy problems, let him start on one right away.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: If someone is good at tougher problems, have them read and think about the harder problems away from the keyboard</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: knowing when to swap people away from the keyboard can be tough.  It's also a good idea for the two people not typing to sync up on what they're working on</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: so that you each have a better picture of where the team is on each problem</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: sir how much hard world ifnal problmes are?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: the acm world finals (if that's what you mean) have been getting harder... there are often 2 or 3 tough problems when in previous years there might have only been 1</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">John Dethridge: John, what makes you so good at this?  </td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">yiuyuho:  I think having a strong mathematics background helps a lot.  Most of the top-ranked coders on TC do.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">John Dethridge: i want to read Knuth, but it's maths makes me think like i have wasted my schooldays .... what should i do now ?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">john Dethridge: I have CLRs but I'm having difficulties reading it because of the math what do you suggest?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Which books will help?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">I guess if the math in CS textbooks is beyond what you know, you should go back and do more math...  get high school or college freshman algebra textbooks</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">you rarely will need much calculus</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: what was the most exciting moment for you in all competitions you've joined</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: I guess challenge phase is the most exciting, in any TCO/TCCC final that's been close.  :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: also the last few minutes of coding phase, when you're not sure who will finish the problems they're working on...</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">john Dethridge: what was your age when you: started programming, won your first match/competition?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">tharis: I started at 8, but I was doing more mathematics than coding during school.  The first programming competition I won was some national school-level competition.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">tharis: There was an international contest I could have gone to that followed from that, but it conflicted with the IMO so I didn't go</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: whould u plz give ur code of world final problems .so i can get some help</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">binarywithme: you can read my code from past TCOs on the topcoder website.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">But some people might suggest that my code is not the clearest to learn from.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">some?</td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">fi fj :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Larry: yeah, some.  "almost everyone" counts as "some" :)</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: John, are you better at maths or at programming? What is the difference between a person that is good in math and the one that is good in programming?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: I consider myself a mathematician, but on ranking I think I'm far better as a programmer.  :)  I think a math background helps once you get to much harder problems.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: Will you be coming to Australia anytime soon? :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: probably :)  I was in Sydney for the GCJ regional final there.</span></td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: Oh, wish I could have gone :( hehe</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">John Dethridge: Did you "retire :)" ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">vexorian: not really :)  I am training less than I used to though.  Perhaps semi-retired.  :)</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>armansuleimenov</strong></td><td class="value">John Dethridge: what would you suggest to concentrate on when preparing to TCO as opposed to ACM regionals?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">armansuleimenov: The TCO is harder than ACM regionals generally.  I would do the practice rooms in the applet, especially rounds from previous TCOs.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">armansuleimenov: Then go to other online judge sites.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: do you check others results while you're coding? and have you ever felt that you're not gonna make that problem?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: yeah I do check the scoreboard pretty often.  Especially when other people are solving in a different order.  Then you get some information on how hard the other problems are.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">John Dethridge: What else do you do apart from coding?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">wack-a-mole: What else do I do?  I play a lot of other games.  :)  Computer games, card games, board games, etc.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">John Dethridge: How many hours a day did you spend practising when you were working your way up, and what did you do?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">nicolodavis: in the weeks before my first TCO, I spent about 3 or 4 hours a day coding.  Mostly solving past problems.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">nicolodavis: maybe a bit more than that</span></td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">John Dethridge: ok</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">John Dethridge: Do you think that a man (20 years) can learn math for programming in like 6 months?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">afonseca: well you can certainly learn enough, but more is better :)</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">John Dethridge: hehe, that motivates me :)</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>skaterdude69</strong></td><td class="value">John Dethridge: Did you get your PHD in Comp Sci.? I remember on CNN you said you were thinking about it.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">skaterdude69: nope, I left college and joined Google</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Giorgi</strong></td><td class="value">John Dethridge: I agree with you, I know a lot of algorithms , but I can't solve hard problems wich needs deeply mathematical knowledge, what would you advice, study math from beggining?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Giorgi: well, when I say math is important, it's not just that some hard problems use math.  Usually the amount of mathematics you need to know for the actual problem is not that much, maybe a little geometry or number theory.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Giorgi: It's more that the skills you get in doing mathematics help in CS also.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Giorgi: but yes I would go back and do high school math if you need to, especially algebra and geometry.</span></td></tr>
<tr class="light"><td class="value"><strong>Giorgi</strong></td><td class="value">John Dethridge: ok thanks</td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Quelloquialism</strong></td><td class="value">John Dethridge: Have you ever considered changing your name to "John Liferidge" to promote optimism?</td></tr>
<tr class="dark"><td class="value"><strong>skaterdude69</strong></td><td class="value">Quelloquialism: LOL</td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">Quelloquialism: ROFL</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Quelloquialism:  I'll tell you what, I'll consider that seriously and get back to you.  :P</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>srikanth_sg</strong></td><td class="value">any nice material for learning stl?</td></tr>
<tr class="light"><td class="value"><strong>srikanth_sg</strong></td><td class="value">suggest me please</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">srikanth_sg: I used http://www.sgi.com/tech/stl</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">John Dethridge: What IDE and OS do you use?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">wack-a-mole: for TopCoder, I just use the in-applet editor</span></td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">John Dethridge: Considering you code like that, and you use no plugins or IDE, how do you manage to debug your code?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">vexorian: I try not to have bugs.  Otherwise, I put in printfs to see what's going on.</span></td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">Are those provisions like not using plugins/IDE some sort of technique to avoid solving the problem very fast since people would think you are cheating?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">vexorian: some people do use IDEs, I just prefer not to.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: Do you think that it is "easier" to be a good coder in countries such as Poland, Russia, USA? Or it is having a good mentor or finding the right material?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: I think if you're self-motivated and have internet access, you have the same chance anywhere</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: is academia less fun than google?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: hmmm there are parts of academia I would not enjoy, but you would perhaps have more freedom in what you worked on</span></td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: what exactly in academia don't you like (excluding payment ;) )</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: paperwork, applying for funding.  I can't really speak that authoritatively on it though, I've never been an academic.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">john Dethridge: If you started that early I think you participated in the IOI? if yes what medal did you get?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Sarkin: Australia didn't participate in the IOI yet when I was in school.  We do now though.  I taught at a couple of our training schools.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>vlad_D</strong></td><td class="value">John Dethridge: yeah, but you have gold in ACM</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">vlad_D: yes</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: is your work at google creative :) ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: sure, there's a lot of room for creativity when your goal is broad</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: say you want to improve the relevance of search results, for example... there's a lot of scope for trying different algorithms to do that</span></td></tr>
<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: i see</td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: Why do you work at Google?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: I think Google has a lot of interesting problems to work on, and great people</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: and a fun environment</span></td></tr>
<tr class="dark"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: But, in google you don't face "ACM-like" or "TC-like" problems, do you?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: yes we often do.  Graph theory, DP, geometry, it's all relevant</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: there's a rumor that google asks algorithm problems in their interviews is that right? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: absolutely.  We want people who are good at algorithms.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: One of the most famous is how you sort a million phone numbers with only 2MB of ram, and variations on that</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">john Dethridge: sort 1kk nrs with 2MB of RAM? how?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">tharis: that's what you have to figure out :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">john Dethridge: LOL I'm only 16... When I'm 30, I'll PM you with the answer, ok?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">tharis: you can be more ambitious than that :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">john Dethridge: I am! I'm looking for the Nobel! :) Coding and IOI are only hobbies! ;)</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">John Dethridge: Is it true that Google has a firefighters' slippery pole for when you are hungry?</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">wack-a-mole: Is that a joke xD ?</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">Tavo92: I saw it in an email :)</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">John_Dethridge: and is the pole really for when you are hungry, or for something else?</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">wack-a-mole: i've seen pictures, in zurich i think :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">wack-a-mole: yes I think the Zurich office has that :)</span></td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: which google are you at?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: Mountain View, California</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">John Dethridge: do you solve puzzles and mathematical problems? does it help iproving coding skills?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">geekru2: yes, I look at problems from the IMO and related contests pretty regularly</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: So do companies like Google look for algorithmic ability for a practical purpose or more for distinguishing good problem solvers?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: Both.  We do want employees who are strong in algorithms, and I think it's also a good way to assess problem-solving ability.  That's my opinion anyway.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Blue_Ant</strong></td><td class="value">John Dethridge: Hello</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Blue_Ant: hi</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">John Dethridge: How important is code on paper for Topcoder</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">FameofLight: not very.  I often scribble diagrams while I'm thinking, but I wouldn't ever write code.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">John Dethridge: You participated at acm-icpc?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">rajeshsr: yes, I went to the world finals in '00 and '01</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>iit2007106</strong></td><td class="value">which language do u hthink would be better?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">iit2007106: I prefer C++.  For a first language when learning to program, something simple like basic.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>gowrav</strong></td><td class="value">john Dethridge: is it worth making myself good in C++ .. i am really hardworking on that but compnies like google use python .. m i right ??</td></tr>
<tr class="dark"><td class="value"><strong>gowrav</strong></td><td class="value">john Dethridge: what is best to master C++ or python as per googlist</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">gowrav: C++ is more useful than python I would say.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>snguyen</strong></td><td class="value">John Dethridge: private quesion, you can ignore : How old are you, JD? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">snguyen: 22.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">John Dethridge: 22, wow, so young :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">zdravko_b: I lied.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: wow. and what about internship? do you have to be a top coder t be intern in Software Engineering department </td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">ortschun: we have a lot of interns who are CS students with good grades.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>geekru2</strong></td><td class="value">John Dethridge: what is a good coder..one who knows a lot of algos? or one who can create algos on spot during contests?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">geekru2: both of those are important.  You need to know a lot of algorithms, but even more importantly to get to the top you need to be able to adapt them or come up with new algorithms on the spot to solve problems</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">geekru2: most final rounds avoid problems that can be solved just by one standard algorithm.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: Is it more important to have good grades or to have competed succesfully in algorithm competitions?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: well, whenever you're applying for a job somewhere, they're going to consider everything.  I think non-college achievements like success in competitions are a good way to distinguish yourself from other people who also have high grades.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">John Dethridge: Can u share, how u practised for that?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">rajeshsr: I mostly practise by doing previous contest problems</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">John Dethridge: How do you keep improving your mathematical and algorithmic skills nowadays?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">pdallago: I keep solving more problems to improve.  Although I haven't been practising that much recently, apart from test-solving all of the GCJ problems.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>gowrav</strong></td><td class="value">john Dethridge:  whats is the most usefull language for criticle solutions! (this might change my world)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">gowrav: C++</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>theexpository</strong></td><td class="value">John Dethridge: Is there an  algorithmic paradigm that you consider the most fundamental?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">theexpository: not really, I think you need knowledge in a broad range.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>Soyoja</strong></td><td class="value">John Dethridge: How about your record in World finals '00 and '01?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Soyoja: in ACM '00 we came second, or something, they had a bit of a screwup with the judging.  In '01 much worse.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">John Dethridge: Why do you think top contest coders tend to like C/++ so much?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">vexorian: I think more top coders prefer C++ because of the low-level control that's available.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>glue2glee</strong></td><td class="value">John Dethridge: what did you study at university? Math or CS ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">I did both.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>deusemx</strong></td><td class="value">John Dethridge: do you think perl has been replaced by ruby and python?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">deusmx: I don't really have an opinion on perl and python and ruby.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>Quelloquialism</strong></td><td class="value">John Dethridge: So I once lost a programming contest due to a small bug in my implementation of BFS, and ever since then I've hated coding BFS.  Are there any algorithms you have a similar strong hatred for?</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">Quelloquialism: Do you use dijkstra for simple BFS problems since then?</td></tr>
<tr class="dark"><td class="value"><strong>Quelloquialism</strong></td><td class="value">vexorian: No, I just grudgingly code BFS... =)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Quelloquialism: you should practise BFS more.  :)  I don't really have a dislike for any particular algorithm.  </span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Quelloquialism: Computational geometry problems can be annoying when they have lots of special cases, but that's the same for everyone, not a special hatred I have for them.  :)</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: Thanks for the responses. Any chance you can come back to Melbourne to coach my team for the ACM finals? :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">viclei: I probably won't be back for that long.  Good luck though.</span></td></tr>
<tr class="dark"><td class="value"><strong>viclei</strong></td><td class="value">John Dethridge: Haha. Thanks :) Hope you can come come in to MU if you're around the area.</td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>gowrav</strong></td><td class="value">john Dethridge: what should b learned now .. crossplatform or linux or windows as a good start</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">John Dethridge: linux is better thnx windows what u think ?froma programmer's point of view</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">I wouldn't worry too much about what OS you use</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>Larry</strong></td><td class="value">John Dethridge: what do you do, practice-wise, about problems that you can't figure out the solution, but know that they exist?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Larry: I try harder until I get it.  :)</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>theexpository</strong></td><td class="value">John Dethridge: Is there a particular source/book that you prefer for solving geometry/probability/maze problems?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">theexpository: no not really.  I learn mostly by solving problems.</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>Tavo92</strong></td><td class="value">John Dethridge: What is your favorite food before a contest :) ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Tavo92: I usually have coffee and chocolate before competitions.  :)</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>theexpository</strong></td><td class="value">John Dethridge: Topcoder problems vs acm regional problems?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">theexpository: I think it's more important to do problems at the right level for what you're training for, rather than which contest they're from</span></td></tr>
<tr class="light"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="dark"><td class="value"><strong>Hamed</strong></td><td class="value">John Dethridge: Why did you retire? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">Hamed: I didn't really retire, it was a joke.  :)  I do practise less now though.</span></td></tr>
<tr class="dark"><td class="value"><strong>&nbsp;</strong></td><td class="value">&nbsp;</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">**samshu hopes it is an easy SRM</td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">**vexorian hopes the SRM is easy for him but no one else.</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">vexorian: hehe</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">best of luck to all for coming SRM</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">thanks for ur time sir</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: thank you so much for today :)</td></tr>
<tr class="light"><td class="value"><strong>Blue_Ant</strong></td><td class="value">John Dethridge: See you</td></tr>
<tr class="dark"><td class="value"><strong>snguyen</strong></td><td class="value">thx a lot JD, wish u the best!</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: thank you so much for today :)</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">again:)</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">John Dethridge: bye</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">John Dethridge: Thanks u. Bye</td></tr>
<tr class="light"><td class="value"><span class="bigRed">John Dethridge</span></td><td class="value"><span class="bigRed">np :)</span></td></tr>




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