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
        <div>Chat transcript from TCHS SRM 57: Spotlight Session with <tc-webtag:handle coderId="10574855" context="algorithm" /></div>
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

<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hi there!</span></td></tr>
<tr class="dark"><td class="value"><strong>petar1</strong></td><td class="value">Hello</td></tr>
<tr class="light"><td class="value"><strong>towelenee</strong></td><td class="value">Hello</td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">I am sorry what we should read to became good coder.</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: Hi Petr</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: Hi</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">towelenee: How do you define good coder?</span></td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">something like Burunduk1</td></tr>
<tr class="light"><td class="value"><strong>towelenee</strong></td><td class="value">*someone sorry for my bad english</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">towelenee: No, I mean - good at solving algorithmic competition problems? Then practice should be the way</span></td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: I totally agree that practice is the strongest factor, can you tell us how long have you practiced on solving algorithmic problems?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: There's a story about that in TC features. In short, since 1997 :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: My biggest increase in skill was at Russian IOI preparation camps</span></td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: I've read that, but I've heard that you've stopped practicing since a while, so from 97 till when?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I've almost stopped practicing when I entered university in 2002</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: And completely stopped practicing after going to the second ICPC final in 2005</span></td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: is this because you think there isn't much more outthere to study/practice?</td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: I mean can you explain how come you stopped practicing 3 years ago and you still ranked number 1 given that many people are practicing hard</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: Well, I wouldn't state it that sharp</span></td></tr>
<tr class="dark"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: And did starting work affect in any way your competition skills?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I'd say that I've stopped practicing because 1) There turned out to be a lot of competitions taking place, so only participating in them brings much practice</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: and 2) practice itself was too little fun for the time spent</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I still participate in every SRM and in Russian Open Cup (~8 ACM-style competitions a year)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">espr1t: It made me write several SRMs in Java :) Other than that, I don't think there's any influence</span></td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: are there any books that will help..other than cormen..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: I don't think so</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: Books should come as reference when you can't solve some problem</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: Not as textbooks</span></td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: I understand, well you said that your largest skill boost was in the IOI camps, as far as I know camps are like 1 week of contests/lectures, I don't know about Russian camps specifically </td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: but I'm wondering how did they affect you that much in that short amount of time?</td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: when u practice, should it be like doing DP problems..then moving on the graph related..or a healthy mix ??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: Well, it's 2 weeks twice a year</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: Each day has a 5-hour contest</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: And a lecture from the top competitors from past years that are now teachers</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: Often the contest next day is based on the previous day's lecture, so that you remember it better</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I know it sounds really simple, but it seems to work</span></td></tr>
<tr class="light"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: Another thing I wondered - do you think it's better to solve more easier problems to practice (which increases writing skills) or less but harder problems (which increases the thinking part)?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: I think a mix is better - but when you can't solve a problem, don't just skip it, but learn what you're missing</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">espr1t: I think writing skills should come automatically sooner or later, so I'd go for the thinking part</span></td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: is it better to know more algorithms or just know a few ones and practice hard on them?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: I think it's not the best way to separate learning algorithms from coding them</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: I think it's better to try solving some problem related to an algorithm to learn it</span></td></tr>
<tr class="light"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: then learn by solving not reading and from the analysis of the problem I can learn more</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: Yes, but I'd even emphasize that by writing the solution by yourself you learn even more</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: Even after reading the analysis</span></td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: ok</td></tr>
<tr class="light"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: thanks</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">what's going on here?</td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: and Math..how important is it in solving problems..and practicing </td></tr>
<tr class="dark"><td class="value"><strong>petar1</strong></td><td class="value">martins256: Petr is answering to our questions:)</td></tr>
<tr class="light"><td class="value"><strong>jay23jack</strong></td><td class="value">really? where's him</td></tr>
<tr class="dark"><td class="value"><strong>petar1</strong></td><td class="value">here in the room:)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jay23jack: in Moscow</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Ahm</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Am i allowed in here</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: everyone is</span></td></tr>
<tr class="light"><td class="value"><strong>jay23jack</strong></td><td class="value">Petr: oh,i see.i wish to go there</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">i mean i do not qualify for TCHS...And i thought Spotlight was only for TCHS participants</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: no, I believe everyone is allowed. Why would TopCoder restrict people from coming here?</span></td></tr>
<tr class="dark"><td class="value"><strong>oh_No</strong></td><td class="value">Petr: i think sometimes i coudnt solve some easy task like generating permution but can solve some hard task like DEV 2 1000(for me off course).do you think it is a general problem?cant to solve some easy task?how i can overcome this?</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Ok then.. thanks Petr!!</td></tr>
<tr class="dark"><td class="value"><strong>jay23jack</strong></td><td class="value">Petr: how are you?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oh_No: Read the analysis after the match, and write the code</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oh_No: If the analysis doesn't make sense, search the Internet and/or books</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jay23jack: Fine</span></td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: sometimes like the last srm I can't understand the formula in the analysis so I can't code anything</td></tr>
<tr class="light"><td class="value"><strong>jay23jack</strong></td><td class="value">Petr: oh,and how old are you?</td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: in the 1000 for example</td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: which online judges do you like to do, which you were doing much when you was starting to learn?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jay23jack: 23</span></td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr:  Petr: and Math..how important is it in solving problems..and practicing </td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Petr: is there any kind of trick for DP problems, something that we could look and say ""Probably the DP relation is this type...""</td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">Petr: ?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">&gt;&gt;</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: I've never solved more than 5-10 problems on any online judge</span></td></tr>
<tr class="dark"><td class="value"><strong>jay23jack</strong></td><td class="value">Petr: how young! i thought you're older</td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: wow</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Jus one year older than me and Wow!!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: You can try asking on the forums then, there're always people willing to explain</span></td></tr>
<tr class="dark"><td class="value"><strong>jay23jack</strong></td><td class="value">Petr: do you take part in the ACM?</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: yea I've noticed that you're simply not on the rank lists of any online judge! can you explain that?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: I don't know because I don't know how it is not to know math :)</span></td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: :)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: hello :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: No, DP is probably the best example that only practice can help</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: how r u ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: There's no trick, just ability to notice patterns</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: nice to meet u here in ur room :D</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Do you think that 22 is old to start programming??</td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Petr: thx... Guess I'll have to practice much more</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: tourist is red and was banned from TC for some time for being under 13 :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: i have a question :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: how old r u ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I learned too late about online judges</span></td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">ahm.kam_92: 23</td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: how were you practising before?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ahm.kam_92: fine</span></td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: doing old ACM problems and math?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: dunno. I think not, especially if you have technical education</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: Hi, Petr. Did you take part in this year's Google Code Jam?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: solving contests prepared for us by our coaches</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: u work in google, right ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: when in high school - 3 problems for 5 hours</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: when in university - ACM-style</span></td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: :D</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Do you think Programming comes naturally??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: I've prepared some problems for it :)</span></td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: 3 problems for 5 hours, that's almost 15 problems a day :D</td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: how long do u think ( for a beginner) should be spent on trying to solve a problem..before looking at the solution..say a DP problem..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: Did you like the one about triangle of the given area? ;)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ahm.kam_92: yep</span></td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: were you practising one a week only?</td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: ))) thanks... ))</td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: or very often?</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">Petr: What book would you recommend about algorithms (I know that ""Introduction to algorithm"" is very good)?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: It was different throughout the year</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: in which country u work ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: 2 times we had 2-week long camps for best Russian high schoolers</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: where we practiced each day</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: during other time, I practiced very rarely</span></td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: I see</td></tr>
<tr class="dark"><td class="value"><strong>hjdave</strong></td><td class="value">should i practice each day</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: no, I don't. It's a skill</span></td></tr>
<tr class="dark"><td class="value"><strong>MB__</strong></td><td class="value">Petr: I was thinking before that you were practising a lot</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: As long as it's still interesting for you</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">MB__: Petr is just a genius ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: When you become bored, chances of inventing a solution lower significantly</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: Do you use much of your algorithm skills while working at Google? I mean you do solve problems very well, but sometimes tasks can be far from the TopCoder SRM format.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: 2 weeks from 9am to 7pm is a lot :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">I think Petr should ask for a indemnization to TC... All these questions... :x</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ahm.kam_92: Russian</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ahm.kam_92: Russia</span></td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: will you start in this SRM?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Have you ever used your TopCoder experience in Google? Do you think TopCoder has helped you be a better Programmer??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Tavo92: I have no other recommendation. That book is good for sure )</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: what do u work ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: Algorithm skills come from a different angle</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: do you find the Division 1 1000 points more/less difficult then problems appearing else where?</td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">Petr: your parents are geniuses? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: You rarely encounter maxflow or something like that</span></td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Sorry i did not see Nikaustr's question! </td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">Petr: how much do you practice? how much did you practice when you were a high school student?</td></tr>
<tr class="light"><td class="value"><strong>Tavo92</strong></td><td class="value">Petr: What do you think is better, to solve a lot of problems or to read a lot? Or the two of them together?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: But general ability to design a write a program that solves a given task, sometimes solving some logical puzzles on the way, is important</span></td></tr>
<tr class="light"><td class="value"><strong>imrankane2005</strong></td><td class="value">Tavo92: what`s the name of book Petr mentioned. I hav just arrived here</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: I've coded Aho-Corasick once )</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: (at work)</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: ??? really??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ahm.kam_92: can't say :) I'm working on improving search quality</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: it's interesting what the situation was ... )</td></tr>
<tr class="light"><td class="value"><strong>oa12gb</strong></td><td class="value">Petr: in the IOI camps u were in u think the more usefull thing was the old coders who gave u leactures or the problems u solved?</td></tr>
<tr class="dark"><td class="value"><strong>Tavo92</strong></td><td class="value">imrankane2005: I asked him if he can recommend a book, and he said Introduction to Algorithm is very good</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: :) nice!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: yes, I will participate in the SRM</span></td></tr>
<tr class="light"><td class="value"><strong>imrankane2005</strong></td><td class="value">Tavo92: Thanx :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: can't say :)</span></td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: If you dont mind revealing on what are you working at in Google??</td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: )) aah, OK :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">oa12gb: The problems</span></td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">Petr have you been in LKSH</td></tr>
<tr class="light"><td class="value"><strong>glue2glee</strong></td><td class="value">samshu: he said ""I'm working on improving search quality""</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Tavo92: I think it's better to solve problems, and to read how to solve one when you can't invent a solution by yourself</span></td></tr>
<tr class="light"><td class="value"><strong>vlad_D</strong></td><td class="value">Petr: do you have a gf?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">vlad_D: I'm married</span></td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">Petr: what's the best thing to do to come from 2300+ to target?</td></tr>
<tr class="dark"><td class="value"><strong>vlad_D</strong></td><td class="value">Petr: kids?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">vlad_D: not yet :)</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">glue2glee: Thanks for helping Petr out in answering :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: comeon and get ur maximum rating again! :)</td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: hey, were you married when you came to Banff this year?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">MB__: That's a tough one. I think accuracy should be crucial at that point</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: hmmm, that's interesting. I plan to finish my PhD, learn a couple more algorithms, and try applying for a position at Google. Where do you work, by the way? I think I'd like to go to Pittsburgh.</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: Do you solve problems only because u enjoy them or, because u like to be a  winner ? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: no, but I was with my wife-to-be )</span></td></tr>
<tr class="light"><td class="value"><strong>imrankane2005</strong></td><td class="value">Petr: Could u plz mention some good book in Math for ACM </td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: wow, congratz ;) I think that makes news?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: :) why?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: thanks</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: I work in Moscow</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Nikaustr: never moved in my entire life</span></td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">Petr: if you had like 3 months to prepare yourself for an important contest and had low skills on pretty much every type of problems, where would you spend more time on? I heard DP and graphs are the most important skills... should I make those a priority</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: I dont think it's known to the world until just now ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: I'm sorry for not answering your question above</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: about div1 1000's</span></td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: Oh, oops :), I thought you were in America :). Work in your home-city... hmm, that sounds great! )</td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: yes, congratulations</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: I think they are quite specific - given the timeframe here at TC</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: How do you interpret TopCoder ratings as (Grey=?,Green=?)</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: i really like to practice, but when i am solving some harder problems, i think about them for an hour or something like that i then i usually skip it because i dont know what to do, how can i overcome this?</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">Petr: Hi, durin your younger years as programmer... there mustve been times when u looked up to someone and wished u were like them..... Who was/were they and what things did u do in specific to be such a great coder??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: They are for comparison, absolute values don't make much sense</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: try to read the analysis, understand the solution, and then (important!) code it?</span></td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: But a grey Coder is not as good as a Green is He??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pcaldeira: I think DP is the most important one, both at TopCoder and in ACM</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pcaldeira: but it's the hardest to improve on :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: how can i improve my programming skills, specially in algoithms ?</td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">samshu: you dont need Petr to get answer to that question! :D</td></tr>
<tr class="dark"><td class="value"><strong>pcaldeira</strong></td><td class="value">Petr: ok, what about IOI level?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">SwitchCase: Most of people I wanted to be like were just better programming competitors</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">antarctican: Ahh!!</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: but after all this thinking and without results i lose my will to even look at it?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pcaldeira: IOI, in my view, is really random</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: anymore</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr: What do u think made u, what u are now? Do u consider practice as a very important thing?</td></tr>
<tr class="light"><td class="value"><strong>vlad_D</strong></td><td class="value">Petr: what's your aspiration in life?</td></tr>
<tr class="dark"><td class="value"><strong>SwitchCase</strong></td><td class="value">Petr: no one specific???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">SwitchCase: nope</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: then you should look at the analysis earlier</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: when you only start losing your interest :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rajeshsr: yes, it's surely the most important thing</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: haha :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rajeshsr: but of course one should not underestimate my teachers</span></td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">Petr: yeah, i also think ad-hoc problems are the most common in IOIs... which means the only way to something is practicing as much random and varied problems as we can find?</td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">Petr: i think its the biggest problem that i want everything to slove quick</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">vlad_D: Just to live a good and interesting life, and try to make it better for my loved ones</span></td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr: Any strategy of practice u followed?</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: who were all your teachers, besides andrewsta?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">igi: topcoder is the best place for that ;)</td></tr>
<tr class="light"><td class="value"><strong>smiljo</strong></td><td class="value">Petr: what sites would you recommend to learn DP?</td></tr>
<tr class="dark"><td class="value"><strong>smiljo</strong></td><td class="value">Petr: except topcoder</td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">Petr: what do you do on your free time? what are your hobies?</td></tr>
<tr class="dark"><td class="value"><strong>Fixman</strong></td><td class="value">Hey Petr!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yiuyuho: KOTEHOK, max_b, Victor Matyukhin, many others</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">FODA-SE</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr shud write a book</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">it will be a bestseller</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: how can i improve my programming skills, specially in algoithms ?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Did TopCoder ratings matter to Google when you joined them??</td></tr>
<tr class="light"><td class="value"><strong>zizavino</strong></td><td class="value">Hello,</td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">Petr: sometimes i code without thinking enough about the problem and then at the 50th line i realize that my idea is wrong..</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">martins256: there's an interview about Petr, you can get the answer to the question there</td></tr>
<tr class="dark"><td class="value"><strong>cytmike</strong></td><td class="value">people are all flying in</td></tr>
<tr class="light"><td class="value"><strong>Fixman</strong></td><td class="value">Do you go to every SRM you can, or you don't go to one if you think you are not very prepared and could lose points?</td></tr>
<tr class="dark"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: Hi Petr. My brain have a hole in the math section, and I want to fill it. Is Concrete Mathematics a good book?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rajeshsr: no - back in my days we didn't practice by ourselves</span></td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">Petr: I am sorry have you been i lksh</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rajeshsr: we basically solved contests that were prepared by our teachers</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">towelenee: Yes, 2.5 times</span></td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: You are gonna have a lot of questions now, I see... )</td></tr>
<tr class="dark"><td class="value"><strong>imrankane2005</strong></td><td class="value">Petr: Could you plz mention some good book in Math for ACM Preparation</td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">wow... wasn't this supposed to be for high school students only?</td></tr>
<tr class="dark"><td class="value"><strong>Trafalgar_Law</strong></td><td class="value">hi guys</td></tr>
<tr class="light"><td class="value"><strong>solafide</strong></td><td class="value">Petr: how much time did you put into practicing?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: really ??</td></tr>
<tr class="light"><td class="value"><strong>innocentboy</strong></td><td class="value">pcaldeira: :)</td></tr>
<tr class="dark"><td class="value"><strong>vlad_D</strong></td><td class="value">pcaldeira: every one else is invited</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">imrankane2005: maybe Concrete Mathematics by Knuth et al.?</span></td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr: waugh! thats great, this explains why I don't find u much in many online judges. any Online judge u practised?</td></tr>
<tr class="light"><td class="value"><strong>vlad_D</strong></td><td class="value">pcaldeira: too</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">need ACM suggestions</td></tr>
<tr class="light"><td class="value"><strong>Zhangjian</strong></td><td class="value">I want to know how to become a big cow.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">martins256: Soccer, cross-country skiing, movies</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">martins256: The usual ones :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Zhangjian: easy :D</td></tr>
<tr class="light"><td class="value"><strong>jbernadas</strong></td><td class="value">Zhangjian: eat a lot...</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Zhangjian: hire a wizard</td></tr>
<tr class="light"><td class="value"><strong>Trafalgar_Law</strong></td><td class="value">hi guys this is my 1st time here so how does this work</td></tr>
<tr class="dark"><td class="value"><strong>imrankane2005</strong></td><td class="value">Petr: Have you read all it`s volume ?</td></tr>
<tr class="light"><td class="value"><strong>Fixman</strong></td><td class="value">Petr: If you think you aren't very prepared for an SRM, will you risk to it or keep your points?</td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">what group</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: I don't think so, but being a winner of Google Code Jam did matter</span></td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: I need Some suggestions regarding ACM preparations.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: I think it is, but I'm not sure it's a cure-all</span></td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Everyone... if I can have your attention....</td></tr>
<tr class="light"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: but it is a good start, right?</td></tr>
<tr class="dark"><td class="value"><strong>Zhangjian</strong></td><td class="value">but i dont study algorithm well</td></tr>
<tr class="light"><td class="value"><strong>AnilKishore</strong></td><td class="value">leadhyena_inran:  yes Sir !</td></tr>
<tr class="dark"><td class="value"><strong>Trafalgar_Law</strong></td><td class="value">rawrrrrrrr</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: One thing that is absolutely crucial is to be able to think 'mathematically'</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">leadhyena_inran: yes ?</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: I need Some suggestions regarding ACM preparations.</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">if you could please whisper your questions to me and I will direct the most prevalant questions to Petr</td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: how do you manage to challenge soo many in the challenge phase ?? is it understanding of the problem or experience?</td></tr>
<tr class="dark"><td class="value"><strong>ramab1988</strong></td><td class="value">how do u improve yourself, when u cudnt clear the first rounds itself? coz i am facing the same problem..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: I'm not sure how you develop that</span></td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">that way we keep it a bit more organized</td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">leadhyena_inran: oh</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: we have little hope of that working :)</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: pet I need Some suggestions regarding ACM preparations.</td></tr>
<tr class="dark"><td class="value"><strong>Lingmum</strong></td><td class="value">leadhyena_inran: Maybe you are a coder?</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I had a feeling</td></tr>
<tr class="dark"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: I always try to describe problems mathematically, specially the DPs, but sometimes, I get a formula that I cannot simplify</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">leadhyena_inran: I totally agree on that</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">leadhyena_inran: how much do you practice? how much did you practice when you were a high school student?</td></tr>
<tr class="light"><td class="value"><strong>Trafalgar_Law</strong></td><td class="value">how does this work guys? this is my 1st time here</td></tr>
<tr class="dark"><td class="value"><strong>hjdave</strong></td><td class="value">hello peter</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: Maybe that's because I've taught high school students for some time</span></td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Peter: What are your future goals after passing out of Moscow univ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">CONDOR_316: And learned how to spot mistakes</span></td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">oh, Petr is here. Hello Petr.</td></tr>
<tr class="light"><td class="value"><strong>Lingmum</strong></td><td class="value">leadhyena_inran: I hope you can give me some suggestions..:-)</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">lol</td></tr>
<tr class="light"><td class="value"><strong>srik_sama</strong></td><td class="value">leadhyena_inran: How will you organize so many questions? And you need to send it to Petr too :)</td></tr>
<tr class="dark"><td class="value"><strong>AnilKishore</strong></td><td class="value">leadhyena_inran: I guess u r planning to ask ur own questions.. and will not redirect ours :P.. come on its Petr :)</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Read the analysis after the match, and write the code</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">leadhyena_inran: Which problems would Petr solve at the moment if he would be young and experienceless at the moment?</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Sorry</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">AnilKishore: better if you whisper folks... that way it won't overload Petr</td></tr>
<tr class="light"><td class="value"><strong>glue2glee</strong></td><td class="value">Trafalgar_Law: go to chat room 1 from lobbies </td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Any reason why you've selected c#..thats really odd</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">srik_sama: admins are admins</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">srik_sama: :)</td></tr>
<tr class="light"><td class="value"><strong>AlirezaShafaei</strong></td><td class="value">This is not gonna work this way!</td></tr>
<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: u thought algorithms ??a bunch of lucky kids :)</td></tr>
<tr class="light"><td class="value"><strong>oh_No</strong></td><td class="value">Petr: what you seggest to do to become a good programmer?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">leadhyena_inran: how much do you practice? how much did you practice when you were a high school student?</td></tr>
<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">leadhyena_inran: But that keeps the question hidden</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">samshu: because it prevents me from making stupid mistakes</span></td></tr>
<tr class="light"><td class="value"><strong>srik_sama</strong></td><td class="value">ahm.kam_92: :)</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: Petr, I think a lot of people are interested in your practice regiment... can you go into detail on that?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: Sure.</span></td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: Whats the modfe of teaching in Moscow Univ..do they stress more on practicals, self learning ???</td></tr>
<tr class="light"><td class="value"><strong>ziliang</strong></td><td class="value">Petr: do you have a girl friend?</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: Is C# more error prune than Java?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">When I was in high school, I've practiced for 2 weeks 2 times a year at Russian IOI preparation camps</span></td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">ziliang: he's married, no kids :)</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">ziliang: he's married ;)</td></tr>
<tr class="dark"><td class="value"><strong>pcaldeira</strong></td><td class="value">ziliang: he just said he's married</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">The daily schedule was: 9am-2pm contest, 3pm-7pm lecture</span></td></tr>
<tr class="dark"><td class="value"><strong>Juanito</strong></td><td class="value">jbernadas: Tienes ese libro Concrete mathematics en digital viejo?</td></tr>
<tr class="light"><td class="value"><strong>jaskiratbhatia</strong></td><td class="value">leadhyena_inran: my question is, is it better for learn n work on java certification or to learn algorithm to get a good job?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">I attribute most of my progress to that camps</span></td></tr>
<tr class="light"><td class="value"><strong>syco</strong></td><td class="value">pcaldeira: that dint answer the first question :D</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">Petr: tell me some recent movies that you like, i'm in moevies to! :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">These days, I just solve contests, and that brings me enough practice</span></td></tr>
<tr class="dark"><td class="value"><strong>towelenee</strong></td><td class="value">Petr: what the best way for debuging</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: what kind of reading and curriculum did you have at the camps?</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: and did you use online judges a lot?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">We didn't have much reading, because there was no time for it</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">We just used our scribes from lectures</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: a lot of it was notetaking... interesting</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">leadhyena_inran: he said that not more than 10 probs on any jidge</td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: cool. that must have been a great school!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">The curriculum was rather straightforward: graphs, some algebra, DP, etc</span></td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">Petr: I can't believe how could you be so good with only 2 * two weeks of practice a year! :-o</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">Petr: How do you prepare data for Challenges during SRM.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">I didn't go much into online judges</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">stjepan: those camps are made to make Petr :P</td></tr>
<tr class="light"><td class="value"><strong>MB__</strong></td><td class="value">leadhyena_inran: will transcript from this room be available on TC website?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Because I've learned about them too late</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: So, what do you feel makes for a great coder? Is it internal talent or practice, or a combination, or something else entirely?</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">stjepan: I imagine they are very difficult to prepare</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">MB__: yes</td></tr>
<tr class="dark"><td class="value"><strong>nicoelrulo</strong></td><td class="value">leadhyena_inran: i would ask Petr: what is he planning to work on in the future. Soft development, investigating, etc..</td></tr>
<tr class="light"><td class="value"><strong>jigsawhacker</strong></td><td class="value">Petr: ARe you doing your phd?</td></tr>
<tr class="dark"><td class="value"><strong>oh_No</strong></td><td class="value">Petr: what you seggest to do to become a good programmer?</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: what do you think is the bigger contribute to being good programmer, natural talen or practice?</td></tr>
<tr class="dark"><td class="value"><strong>jigsawhacker</strong></td><td class="value">Petr: I second igi's question?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: The honest answer is: I don't know. But I have a feeling that practice is more important than talent, but of course the combination is best</span></td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">yiuyuho: but still, that is amazing, you have to keep practicing to be good... and it seems he isn't practicing too much nowadays neither.. is he just a genius? :)</td></tr>
<tr class="light"><td class="value"><strong>anowarjaman</strong></td><td class="value">hey petr\ </td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">******* definitely practice... *******</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">once again... everyone please whisper your questions to me</td></tr>
<tr class="dark"><td class="value"><strong>kazakoff</strong></td><td class="value">Petr: How much time have you been in programming?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">stjepan: maybe :-p</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">2ALL: I'm mostly answering leadhyena_inran's questions, because I couldn't keep up with answering all of them</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">samshu: sry</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">2ALL: Please direct them to him</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: interesting... do you do better with more practice? is there a point of diminishing returns?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr:It all Helps</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">+ for Igi's question</td></tr>
<tr class="dark"><td class="value"><strong>anowarjaman</strong></td><td class="value">leadhyena_inran: how u??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I think I've got to that point, that's why I don't practice for the past 2-3 years</span></td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: could u give answ2er of only my one of question ow et ready for ACM</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">stjepan: thx</td></tr>
<tr class="dark"><td class="value"><strong>oh_No</strong></td><td class="value">leadhyena_inran: what you seggest to do to become a good programmer?</td></tr>
<tr class="light"><td class="value"><strong>anowarjaman</strong></td><td class="value">Petr how old are you?</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: do you consider yourself a fast coder? do you think typing speed is important? </td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr should have a fansite</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">hes23</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: But I think that at least for yellows, they're not there yet</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">hes 23</td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: I'm sure you have to do all 3 problems at SRM to be at that point.</td></tr>
<tr class="dark"><td class="value"><strong>victorlf</strong></td><td class="value">Petr: do you program during the whole year, or rest for some weeks or months every while?? haven't you ever got tired of programming?</td></tr>
<tr class="light"><td class="value"><strong>imrankane2005</strong></td><td class="value">martins256: isn`t Petr pursuing phd</td></tr>
<tr class="dark"><td class="value"><strong>crazyb0y</strong></td><td class="value">Petr: when will you re-run your third contest on sgu?</td></tr>
<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">binarywithme: ask to l</td></tr>
<tr class="dark"><td class="value"><strong>jigsawhacker</strong></td><td class="value">Petr: How are you so accurate?</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">samshu: what was the answer?</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">imrankane2005: no I think</td></tr>
<tr class="light"><td class="value"><strong>jaskiratbhatia</strong></td><td class="value">leadhyena_inran: my question: is it better to practise algo rather then a particular lang?</td></tr>
<tr class="dark"><td class="value"><strong>R0N</strong></td><td class="value">binarywithme: ask to leadhyena_inran </td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">stjepan: rekao mi je neki lik</td></tr>
<tr class="dark"><td class="value"><strong>anowarjaman</strong></td><td class="value">Petr what is your studying area???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: No, I don't think I type fast. But I think it's important to be able to type blindly, not to make stupid misprints because of looking at the keyboard, and not at the screen</span></td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: in SRMS whats the strategy you take 250-500-100 or 500-250-1000 or 1000-500-250 and so one?</td></tr>
<tr class="light"><td class="value"><strong>jigsawhacker</strong></td><td class="value">leadhyena_inran: How are you so accurate?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: especially in TC</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I can agree with that... a lot of people still talk about some great challenges you've made in the past, like the TCO2008. Could you tell us your challenge technique?</td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">samshu: i cant find it</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">There're 2 completely separate ones</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u generate challenges when u start coding?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">1) I know what I'm looking for - most often the bug I've resubmitted because of</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">igi: The honest answer is: I don't know. But I have a feeling that practice is more important than talent, but of course the combination is best</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I do that a lot too :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">then I just think of a 'keyword' to look for</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">samshu: thx</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">2) I don't have any specific bugs to look for - then I try to choose a solution that is simple enough and try to spot logical errors</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: so you set up some sort of priming you're looking for in a failed solution and it triggers you to throw a case...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">I rarely notice misprints or suchlike</span></td></tr>
<tr class="light"><td class="value"><strong>antonov</strong></td><td class="value">leadhyena_inran: How to solve problems concerning dictionary order?</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Petr: Thanks a lot Petr ..All the Best for the Future dude!!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: Like ""this problem requires long longs, so it the DP array is of ints, challenge""</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Petr: do you and tomek get on well? :p</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: sure, but we don't meet much</span></td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: How good r you in recursion...do you often use recursion in your coding?</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: At what year in your life did you start coding? When did it become a calling?</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">Q: do you write down everything on paper first, or just the main ideas? how do you know when it's time to switch from thinking to coding?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: I've bumped into him when I was in Mountain View in August</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: 1997 - I was 11</span></td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">Petr: ok, lol :)</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: and your first computer? For me it was the TI994A... :) shows my age</td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: How good r you in recursion...do you often use recursion in your coding?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I became addicted when I started winning</span></td></tr>
<tr class="light"><td class="value"><strong>Hornax</strong></td><td class="value">leadhyena_inran: to Petr:How many hours of practice for train for roi or vkoshp needs?</td></tr>
<tr class="dark"><td class="value"><strong>Sane</strong></td><td class="value">Petr: Did you use code snippets?</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: that will happen</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: It was a 80486 one with Windows 95 installed from floppies</span></td></tr>
<tr class="light"><td class="value"><strong>victorlf</strong></td><td class="value">Petr: do you program during the whole year, or rest for some weeks or months every while?? haven't you ever got tired of programming?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: It was an award</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: At All-Russian Olympiad</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: so the feeling of being a winner made u practice more and more ? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: Before that, I practiced at the local education center</span></td></tr>
<tr class="dark"><td class="value"><strong>litwin</strong></td><td class="value">Petr: What editor are you using ? vim ?</td></tr>
<tr class="light"><td class="value"><strong>antonov</strong></td><td class="value">Petr: How do you debug while competing in TC?</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">leadhyena_inran: what editor are you using ? </td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: that's cool... so your math talent also contributes to your coding skill?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">litwin: Visual Studio</span></td></tr>
<tr class="light"><td class="value"><strong>oh_No</strong></td><td class="value">leadhyena_inran: what you seggest to do to become a good programmer?pls answer!</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: or do you feel more of a separation between math and CS?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">antonov: using Visual Studio step-by-step debugging capabilities</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">hehe most of winners start with practice then win, but Petr starts with winning and just then practice</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I think my 'mathy' thinking contributes a lot</span></td></tr>
<tr class="dark"><td class="value"><strong>rem</strong></td><td class="value">Petr: Do you use code snippets in Studio or other things to type solution faster?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: Because logical puzzles are often an important part of algorithmic problems</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">Petr: which SO (if linux, distro) do you use?</td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">Petr: and IDE?</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: Also many are asking you what other math competitions you've been in...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: All my education was in Math, not CS</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: so I can't say much about whether CS education helps more</span></td></tr>
<tr class="light"><td class="value"><strong>kazakoff</strong></td><td class="value">Petr: Do you know about 40+ facts about you (<a target="_blank" href="http://habrahabr.ru/blogs/sport_programming/23434/">http://habrahabr.ru/blogs/sport_programming/23434/</a>)? How can you comment it?</td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: any particular maths book you consider as Bible?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I've participated in All-Russian Math Olympiad, but wasn't even close to get to the IMO</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kazakoff: Some of them are funny :)</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I've tried those problems, they were impossible :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tanmoychatterje: no</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: the IMOs</td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: Whenever I use that debugging technique, I can't settle my bug when looping to deep, especially memoization!</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">kazakoff: is there an english translation?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: Windows, Visual Studio</span></td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">leadhyena_inran: not for chinise guys</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tharis: at work - Linux, Eclipse</span></td></tr>
<tr class="light"><td class="value"><strong>antonov</strong></td><td class="value">Petr: How to solve that bugs?</td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: which topics in maths excite you?</td></tr>
<tr class="light"><td class="value"><strong>kazakoff</strong></td><td class="value">stjepan: sorry, no</td></tr>
<tr class="dark"><td class="value"><strong>karpio</strong></td><td class="value">Petr: is P=NP? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">antonov: Set breakpoints to some obvious invariants failing</span></td></tr>
<tr class="dark"><td class="value"><strong>tck</strong></td><td class="value">Petr: what is your current occupation ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tck: I'm a Software Engineer at Google</span></td></tr>
<tr class="dark"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: How many hours of practice for train for roi or vkoshp needs?</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">kazakoff: as far as I can see ( I understand it only partially ) sounds like chuck norris stories :D</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I understand that you're employed, with family. Does your work schedule and family interfere with TC? How do you schedule yourself?</td></tr>
<tr class="light"><td class="value"><strong>libe</strong></td><td class="value">Petr: Did you get PHD?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: TC doesn't take much of my time</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: we're allowed to do TC while at workplace</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: and my wife understands that TC is very important to me</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: that's something I wish could be adopted EVERYWHERE</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: so I rarely have a scheduling problem</span></td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: who / what is more important : wife or tc or job in google?</td></tr>
<tr class="dark"><td class="value"><strong>kazakoff</strong></td><td class="value">stjepan: I can translate it to you with program, but english won't be good</td></tr>
<tr class="light"><td class="value"><strong>AnilKishore</strong></td><td class="value">lol</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: As many as you can afford :)</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: very cool... someone asked earlier if your TC rating has helped you with employment, school acceptance, etc...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">libe: no</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: No, but winning the Google Code Jam did</span></td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: lol</td></tr>
<tr class="light"><td class="value"><strong>glue2glee</strong></td><td class="value">Petr: what would you tell someone who is feeling he is stuck, and feeling he is is not learning anything new? what if he doesnt have any good coach, or summer camps? and feeling so talentless and confused?</td></tr>
<tr class="dark"><td class="value"><strong>libe</strong></td><td class="value">Petr: Do you have a plan to get PHD degree?</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: does it help you a lot on your work, all this knowledge in solving and expirience from cs contests?</td></tr>
<tr class="dark"><td class="value"><strong>AnilKishore</strong></td><td class="value">leadhyena_inran: You ahve been warned for asking too many questions :P</td></tr>
<tr class="light"><td class="value"><strong>antonov</strong></td><td class="value">Petr: Excuse me, how can we know where to set breakpoints? It may be too deep inside the the memoization. Stepping may cost much time to find out!</td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">glue2glee: I would suggest a couple-of-weeks-off. I always do that and it helps )</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">glue2glee: Maybe take a break from solving problems? You won't get far if you're not excited about it</span></td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: In those case, I usually change to bottom-up DP</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do ppl wid no exposure to ioi / imo training have any chance against those who do?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">libe: I'm not sure</span></td></tr>
<tr class="light"><td class="value"><strong>Soyoja</strong></td><td class="value">Petr: So... Have you mathematics master degree?</td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: but, it's a minus wthen competing in TC</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: yes, it does, but not directly</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: ability to write simple and working code is priceless</span></td></tr>
<tr class="light"><td class="value"><strong>rem</strong></td><td class="value">Petr: Before submitting solution, do you usually test it only on samples, or create your own tests also?</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Petr: I like to know that too</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: is your job exciting as SRM?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do ppl wid no exposure to ioi / imo training have any chance against those who do?</td></tr>
<tr class="light"><td class="value"><strong>AnilKishore</strong></td><td class="value">Petr: Being a Problem writer sometimes helped you much ?</td></tr>
<tr class="dark"><td class="value"><strong>amrsaqr</strong></td><td class="value">Petr: I have a brother who works in application support, does he have a chance to work in google, if yes do I have the chance to switch to programming inside google.</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">I'm going to open up the floor a bit... everyone can ask questions direct to Petr... I will return shortly</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">antonov: Well, you should try to understand what breaks in your solution, and set breakpoints there. Like 'this array is OK at the end, but that is not, so let's see when the wrong value gets written to it'</span></td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: Be careful the goal of this session is to exhaust you and give other people today's SRM win :)</td></tr>
<tr class="dark"><td class="value"><strong>libe</strong></td><td class="value">Petr: What is your most favorite programming language?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: I think yes</span></td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: They do</span></td></tr>
<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">cpphamza: LOL</td></tr>
<tr class="light"><td class="value"><strong>zedoul</strong></td><td class="value">Petr: what is your suggestion site or book for problem solving?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: but how do they make up for their lackings</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: which programming competition was hardest to you ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">libe: I have no preference</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u know anybody personally who has done something similar?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">libe: Whatever does the job</span></td></tr>
<tr class="light"><td class="value"><strong>oh_No</strong></td><td class="value">Petr: what you seggest to do to become a good programmer?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Soyoja: yes</span></td></tr>
<tr class="light"><td class="value"><strong>martins256</strong></td><td class="value">Petr: have you done any IQ tests? :)</td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">martins256: )</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rem: only samples in most cases</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">lol</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rem: some TL testing if I'm worried about it</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rem: I do most of the testing after submit</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rem: that's why I resubmit often :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: do u have any plan to do phd  ? :)</td></tr>
<tr class="light"><td class="value"><strong>sam14871</strong></td><td class="value">Petr: we dont have very good coaches to guide us toward the coming contests( eg. regionals ).how could we guide our team the best way u think?</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">Petr: I second martins256' question :)</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u know anybody personally who has done something similar?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: it's exciting, but in other sense</span></td></tr>
<tr class="light"><td class="value"><strong>libe</strong></td><td class="value">tsalman: he says he isn't sure.</td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">Petr: i think ill study cs, but i am thinkig, hey, what if it is to boring, what if ill have to 8-hour type some code that can be considered brute force, if you know what i mean?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">libe: ok</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">AnilKishore: I'm not sure</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: i think about when ill work</td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">Petr: Do you know how to use ""BrainF**K"" or ""WhiteSpace"" Programming Language?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: do u think having a good mentor can make a difference ? :)</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">igi: that wont happen if you become a good coder ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">amrsaqr: I'm not sure about that - he'd better check what vacancies are open at Google. When inside Google, you can switch positions provided you qualify</span></td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">Petr: after finishing universitiy</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">Petr: are you still thinking about the problem while coding, or do you try to write down everything first?</td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: Before coding, do you try to find out all bugs in your algorithms? Have you ever fallen into cases that when debugging, you realize your solution is wrong?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tsalman: I depends on the definition of 'hardest'. IOIs were hard because I wasn't able to solve most of the problems</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: is clarity thought more important that considering multiple approaches simultaneously?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">martins256: no</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: *clarity in thought</td></tr>
<tr class="light"><td class="value"><strong>skaterdude69</strong></td><td class="value">Petr: How old are you, Petr?</td></tr>
<tr class="dark"><td class="value"><strong>glue2glee</strong></td><td class="value">skaterdude69: 23</td></tr>
<tr class="light"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: What type of train is good, if in my region isn't special schools or clubs (with math or CS profile)? Only online contests or something else?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">sam14871: Participate in online contests probably - and take part in discussions of problem solutions</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">how much is a good coder payed?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: is clarity in thought more important that considering multiple approaches simultaneously?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: I don't think that happens often - most of the time, you can invent a way to avoid such 'brute force'</span></td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr how do u think one should practise, if he lacks good teachers like u had!</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: *is clarity in thought more important than considering multiple approaches simultaneously?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kcm1700: no</span></td></tr>
<tr class="light"><td class="value"><strong>kolistivra</strong></td><td class="value">Petr: How long should we wait until we look at the solution of a problem that we can't solve? how long should we think about the problem?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tsalman: I'm not sure, as I haven't seen any 'mentor-mentee' pairs in programming contests</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pdallago: I still think about the problem, and that bites me sometimes</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pdallago: but I think that I win in speed in the end</span></td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">Petr: how good are you at math? do you have similiar successes in mathematics?</td></tr>
<tr class="dark"><td class="value"><strong>_sunny</strong></td><td class="value">Petr: What was the toughest SRM problem for u? </td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">antonov: Yes, that happens sometimes</span></td></tr>
<tr class="dark"><td class="value"><strong>microbrain</strong></td><td class="value">what is the best book of algorithm in your opinion?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: I think yes</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: thanks</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: How come you win in speed given that you said you are not a fast coder?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: Online Contests, TC fora</span></td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr:how much is a good coder payed?</td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">cpphamza: He is a fast thinker though..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kolistivra: until you get bored</span></td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">cpphamza: )</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kolistivra: (if that's during practice)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kolistivra: during contest - until you have time :)</span></td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">cpphamza: I guess he means he wins in speed by starting to code earlier</td></tr>
<tr class="dark"><td class="value"><strong>shravas</strong></td><td class="value">How has married life influenced your coding?</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">lol</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">stjepan: no, I don't have any achievements in maths</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">:D</td></tr>
<tr class="dark"><td class="value"><strong>zedoul</strong></td><td class="value">Petr: what is best book to study solution find?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">_sunny: Don't remember something specific.</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">zedoul: he didn't study from books</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: I said that I don't type fast - but typing is minor here at TC</span></td></tr>
<tr class="dark"><td class="value"><strong>antonov</strong></td><td class="value">Petr: is it best for us to double check our algorithm before coding, though it may waste some time, but ensure better results?</td></tr>
<tr class="light"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: any recommendations when training other people?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">cpphamza: being able to write good code from start is much more important</span></td></tr>
<tr class="light"><td class="value"><strong>_sunny</strong></td><td class="value">Petr: What is ur advice to understand probability better?</td></tr>
<tr class="dark"><td class="value"><strong>batiestuta</strong></td><td class="value">Petr: how many hours of practice per week</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">igi: I don't think we should discuss that</span></td></tr>
<tr class="dark"><td class="value"><strong>cpphamza</strong></td><td class="value">Petr: you mean good code at the start make you win by speed?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: is it true that peers around you if are more interested in coding catalyse u? or was it fairly independant for u?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">antonov: You should try that and see if it helps. I don't do that, but that may be my mistake</span></td></tr>
<tr class="light"><td class="value"><strong>zedoul</strong></td><td class="value">ahm.kam_92: really?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: Prepare a lot</span></td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr: What is ur favorite programming book?</td></tr>
<tr class="dark"><td class="value"><strong>dogbox</strong></td><td class="value">Petr: i don't know if someone's asked already, but how long have you been coding?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: Because it's easy to get into situation when you're explaining something too difficult</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">zedoul: yes he studied from the lectures of the camps of the IOI and russian contests</td></tr>
<tr class="light"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: a lot of?</td></tr>
<tr class="dark"><td class="value"><strong>AlirezaShafaei</strong></td><td class="value">Hey Petr, I'm in a kind if situation which I don't have any other choice than self practicing,What exercises do you suggest?any important book do you suggest?</td></tr>
<tr class="light"><td class="value"><strong>skaterdude69</strong></td><td class="value">dogbox: Since he was 11. He's 23 now, so 12 years.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: And thus are not really explaining, but more of talking to yourself, and nobody will understand you</span></td></tr>
<tr class="light"><td class="value"><strong>NRPG</strong></td><td class="value">dogbox: What languages do you know?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">jbernadas: I've got into that situation frequently</span></td></tr>
<tr class="light"><td class="value"><strong>NRPG</strong></td><td class="value">Petr: What languages do you know?</td></tr>
<tr class="dark"><td class="value"><strong>zedoul</strong></td><td class="value">ahm.kam_92: thanks.</td></tr>
<tr class="light"><td class="value"><strong>jbernadas</strong></td><td class="value">Petr: thanks :)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">zedoul: :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">zedoul: u r welcome</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">batiestuta: Just SRMs and sometimes other online contests</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I was going to ask you personally about your normal coding experience away from TC for a moment... when you do coding at work or at home, what's your preferred language, IDE, environment?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: is it true that peers around you if are more interested in coding catalyse u? or was it fairly independant for u?</td></tr>
<tr class="light"><td class="value"><strong>karpio</strong></td><td class="value">Petr: what human (not programming) languages do you know?</td></tr>
<tr class="dark"><td class="value"><strong>shravas</strong></td><td class="value">Petr: How has married life influenced your coding?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I get enough coding at work not to do it at home</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: lol</td></tr>
<tr class="light"><td class="value"><strong>igi</strong></td><td class="value">Petr: where can we learn to program real softwear, like games?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: at work, I use C++/Java in Eclipse, or in vim for fast patches</span></td></tr>
<tr class="light"><td class="value"><strong>robi.petranovic</strong></td><td class="value">Petr: What to you consider the coolest algorithm and why?</td></tr>
<tr class="dark"><td class="value"><strong>dan19</strong></td><td class="value">Petr: Do you play chess or the game of go?</td></tr>
<tr class="light"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: Who's your ""main trainer"" for your opinion? (now and in a past)</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: how about unit testing? are you a proponent?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">karpio: just Russian and English</span></td></tr>
<tr class="dark"><td class="value"><strong>AlirezaShafaei</strong></td><td class="value">Hey Petr, I'm in a kind if situation which I don't have any other choice than self practicing,What exercises do you suggest?any important book do you suggest?</td></tr>
<tr class="light"><td class="value"><strong>silverprince</strong></td><td class="value">Petr: I am a very big fan of yours :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: we do a lot of unit testing at Google</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: and I like it</span></td></tr>
<tr class="dark"><td class="value"><strong>L</strong></td><td class="value">Petr: what are you working on at Google?</td></tr>
<tr class="light"><td class="value"><strong>barubelajar</strong></td><td class="value">what do you eat everyday to solve problem?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">dan19: both, but as an amateur</span></td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">:D</td></tr>
<tr class="dark"><td class="value"><strong>Tavo92</strong></td><td class="value">barubelajar: Is that a joke xD ?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">barubelajar: lol</td></tr>
<tr class="dark"><td class="value"><strong>glue2glee</strong></td><td class="value">L: improving search technique</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: can i mail u sometime? if u permit</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: my teacher in Moscow 57th School - Alexey Gorodentsev</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: regarding some suggsestions?</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: do you do a lot of architecture as well? Application design?</td></tr>
<tr class="light"><td class="value"><strong>dan19</strong></td><td class="value">Petr: What is your approximate kyu (or dan) level at go? Do you have a nickname on KGS?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: oh, I've read 'math trainer'</span></td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">kazakoff: tnx very much!! :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: In terms of programming trainer - I don't know. They all contributed a lot</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u wish to teach oders in future after u retire perhaps?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">L: improving search quality. Can't say more.</span></td></tr>
<tr class="light"><td class="value"><strong>fadetoblack</strong></td><td class="value">Petr: ))</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: for some suggestons?</td></tr>
<tr class="light"><td class="value"><strong>zbazba</strong></td><td class="value">your mail's address</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: no, most of the design is for backend modules. I don't do any UI</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: architecture - yes</span></td></tr>
<tr class="dark"><td class="value"><strong>igi</strong></td><td class="value">Petr: where can i learn to code some real softwear?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: but there's a lot of ready solutions that can be easily adapted at Google</span></td></tr>
<tr class="dark"><td class="value"><strong>barubelajar</strong></td><td class="value">what are you going to be for your career?</td></tr>
<tr class="light"><td class="value"><strong>sam14871</strong></td><td class="value">Petr: do you think the problems now a days require more than learning algorithms and their tweaks? if so, what other fields ( eg. math maybe ) do you suggest for learning to do better these days?</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: has the Google philosophy influenced you a lot there or have you brought your own philosophy to Google?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">fadetoblack: yes, my best achievement is 7th place at All-Russian Olympiad</span></td></tr>
<tr class="dark"><td class="value"><strong>BatusaiX</strong></td><td class="value">Petr: which math subjects are useful for topcoder?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: Google has definitely influenced me a lot</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u like d food at google? lol</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: which math subjects are useful for topcoder?</td></tr>
<tr class="dark"><td class="value"><strong>rng_58</strong></td><td class="value">Petr: What did fadetoblack say?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I've not been very 'industry-ready' when I came there</span></td></tr>
<tr class="dark"><td class="value"><strong>ferrari_purav</strong></td><td class="value">Petr: So how is life at Google?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rng_58: whether I've participated in math olympiads</span></td></tr>
<tr class="dark"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: What you think about ""star desease""? You have got so many rewards =)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: a lot</span></td></tr>
<tr class="dark"><td class="value"><strong>microbrain</strong></td><td class="value">does tc rating affect google job admission? :D</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: :)</td></tr>
<tr class="dark"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: *What do you think about ""star desease""? You have so many rewards =)</td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: do you think business and intellect converge?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Hornax: it's better spotted from outside</span></td></tr>
<tr class="light"><td class="value"><strong>Mgccl</strong></td><td class="value">binarywithme: I think... combinatorics and graph theory</td></tr>
<tr class="dark"><td class="value"><strong>skaterdude69</strong></td><td class="value">Petr: Petr, what is your IQ?</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Mgccl: tnx..</td></tr>
<tr class="dark"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: ))</td></tr>
<tr class="light"><td class="value"><strong>aman.mohd</strong></td><td class="value">raghi</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">yes, indeed :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">skaterdude69: dunno</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u like to stay back @ ur workplace indefinitely?</td></tr>
<tr class="light"><td class="value"><strong>ferrari_purav</strong></td><td class="value">Petr: So how is life at Google like?</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr: Any programming book u cherish and wud like to recommend?</td></tr>
<tr class="light"><td class="value"><strong>nigulh</strong></td><td class="value">Petr: do you find TC algorithm problems still interesting, or are they too simple and just speed-typing?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Mgccl: ptr looks busy...unale to answer</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">sam14871: logical thinking (you can name it math, but it's really only the basis of math)</span></td></tr>
<tr class="dark"><td class="value"><strong>aman.mohd</strong></td><td class="value">raghibkhan_786: have i found u</td></tr>
<tr class="light"><td class="value"><strong>Hornax</strong></td><td class="value">Hornax: it's better spotted from outside ? ??????? ?? ????? ????? ?????</td></tr>
<tr class="dark"><td class="value"><strong>KunalKumar</strong></td><td class="value">Petr: Do you still get time to learn algorithmic theory? If so how do you manage it?</td></tr>
<tr class="light"><td class="value"><strong>Phiber_Optik</strong></td><td class="value">did u meet larry or sergey</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: no, I love staying at home as well :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ferrari_purav: it's cool</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: ok</td></tr>
<tr class="light"><td class="value"><strong>raghibkhan_786</strong></td><td class="value">yes:)</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: nice :)</td></tr>
<tr class="light"><td class="value"><strong>felix_halim</strong></td><td class="value">Petr: do you read many academic papers?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">nigulh: They are interesting indeed</span></td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: wch book u perfere?</td></tr>
<tr class="light"><td class="value"><strong>aman.mohd</strong></td><td class="value">n e tips for newbees</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: Would you have tried to work at google had it not been for TC?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: do u hate microsoft?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">nigulh: I still spend most of the time thinking, not typing</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: do u think u will leave TC oneday if u have kids or become older :) ?</td></tr>
<tr class="dark"><td class="value"><strong>Phiber_Optik</strong></td><td class="value">Petr: did u get to meet larry or sergey??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: I don't know. They won me when they opened an office in Moscow</span></td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">binarywithme: yep. most of TC are not math, learn algorithm and technique stuff from USACO training portal can help.</td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: would you shift to microsoft if they offer you better pay package that google?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: no</span></td></tr>
<tr class="light"><td class="value"><strong>yazhini</strong></td><td class="value">Petr: Do you play Age of Empires?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Phiber_Optik: I've never tried to, but I think it's not impossible</span></td></tr>
<tr class="light"><td class="value"><strong>ferrari_purav</strong></td><td class="value">pt1989: Dont start that now!!!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">yazhini: no</span></td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">pt1989: omg why would people just hate stuff...</td></tr>
<tr class="light"><td class="value"><strong>silverprince</strong></td><td class="value">Petr: do u play aoe or commandoes games ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tanmoychatterje: microsoft doesn't have R&amp;D in Moscow (AFAIK)</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: thnx</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Petr: is there any website similar to usaco but allowing c#</td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: but definitely the exposure must have helped...</td></tr>
<tr class="dark"><td class="value"><strong>hamdanil</strong></td><td class="value">Petr: are you participating in SRM 418?</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">leadhyena_inran: you should try lure Petr to work for topcoder ;)</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Mgccl: u dont kno d dark side do u?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">hamdanil: he said yes</td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: If it opened then would you consider it as an option...microsoft or any other company for that matter?</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">...............</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">Petr: is there any website similar to usaco but allowing c#</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: yes</span></td></tr>
<tr class="light"><td class="value"><strong>tck</strong></td><td class="value">Petr: do you have any specific overall goal for the future ?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: wat movies/music do u like?</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ? readning book,practicing...</td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">pt1989: nah... microsoft is not dark at all...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tanmoychatterje: well, pay is not the only thing that matters</span></td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">Petr: do you consider moving to the States to work?</td></tr>
<tr class="light"><td class="value"><strong>wrick</strong></td><td class="value">Petr: how important is your algorithmic knowledge for what you do at work? i personally find that i only need to use my knowledge of algorithms and data structure much more infrequently than i like</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tanmoychatterje: I'm not sure if they could create such a good work environment there</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Mgccl: enter *nix my fren</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>hamdanil</strong></td><td class="value">Petr: do u play computer games a lot? what games?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tanmoychatterje: but I could consider changing jobs if they did</span></td></tr>
<tr class="light"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Petr: I see you're registered for SRM 418... do you need practice before you go in? </td></tr>
<tr class="dark"><td class="value"><strong>onesun</strong></td><td class="value">Petr: Are you describing yourself of being talent or hardworking ?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: Do u have any relatives who is a programmer ? :)</td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: ok pretty smart answer</td></tr>
<tr class="light"><td class="value"><strong>pcaldeira</strong></td><td class="value">Petr: do you enjoy working at Google? doesn't industry work bore you sometimes, when compared to contests like TC?</td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">pt1989: tried. not quite good enough for desktop usage.</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr:  Are you describing yourself of being talent or hardworking ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: I'm mostly your average consumer there - I don't have any 'taste' to them</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Petr: i mean can we expect to see future Petr's ? :)</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">+ for leadhyena_inran's question</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pt1989: I just like them when they're good</span></td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr:  Are you describing yourself of being talent or hardworking ?</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">.........</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: u are average? and when are they good?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">leadhyena_inran: :) I should go make some tea in the last 5 minutes</span></td></tr>
<tr class="light"><td class="value"><strong>chini_1010</strong></td><td class="value">nitdgp: oye.. nitdgp ...</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: :)</td></tr>
<tr class="dark"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: why you use C# on TC? Are you use it on other contests?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">pcaldeira: Working at Google brings another excitement, not quite the same as TC brings</span></td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">there's the secret: it's the TEA!</td></tr>
<tr class="light"><td class="value"><strong>kcm1700</strong></td><td class="value">Petr: Thanks for answering our questions~.</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">Everyone, let's give a big hand to Petr for participating in an amazing chat session!</td></tr>
<tr class="light"><td class="value"><strong>Hornax</strong></td><td class="value">Petr: and what's the reason of it =)</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>L</strong></td><td class="value">Petr: will you win this SRM? ;)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">pdallago: lol</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">pdallago: :)</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Thanks SO much Petr, great chat</td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: Thanks, Petr!</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">hold on, my question is unanswered</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">thanks Petr</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">L: of course</span></td></tr>
<tr class="light"><td class="value"><strong>nokia</strong></td><td class="value">thanks</td></tr>
<tr class="dark"><td class="value"><strong>leadhyena_inran</strong></td><td class="value">I know I got a lot out of it, and I hope you did so too!</td></tr>
<tr class="light"><td class="value"><strong>no-shine</strong></td><td class="value">pdallago: :)</td></tr>
<tr class="dark"><td class="value"><strong>zedoul</strong></td><td class="value">thanks</td></tr>
<tr class="light"><td class="value"><strong>OlexiyO</strong></td><td class="value">pdallago: I've tried that, doesn't help much</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">Petr is the best</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">this chat will be posted next week for those of you that missed it</td></tr>
<tr class="light"><td class="value"><strong>wiesiu_p</strong></td><td class="value">Petr thnx a lot</td></tr>
<tr class="dark"><td class="value"><strong>abhicool</strong></td><td class="value">Petr: yeay!! Thank you :)</td></tr>
<tr class="light"><td class="value"><strong>skaterdude69</strong></td><td class="value">Petr: Petr, you're awesome, bro.</td></tr>
<tr class="dark"><td class="value"><strong>barubelajar</strong></td><td class="value">Petr: All the best for your SRM</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: no</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: thanks</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr, Nice chat and tips! All the best!</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">**pdallago claps</td></tr>
<tr class="light"><td class="value"><strong>Jedi_Knight</strong></td><td class="value">using MSU.Petr;</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>The_don</strong></td><td class="value">Thanx peter..:)</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr:  Are you describing yourself of being talent or hardworking ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: I didn't like how people that move to States live there</span></td></tr>
<tr class="dark"><td class="value"><strong>abhicool</strong></td><td class="value">**abhicool claps</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">jmpld40: Thanks</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">You can post unanswered questions in the spotlight sessions forum</td></tr>
<tr class="light"><td class="value"><strong>ferrari_purav</strong></td><td class="value">Petr: You rock man! </td></tr>
<tr class="dark"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: i sincerely hope your excitement to code stays for long in Software industry</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: Europe is possible, but I don't think it will ever be States</span></td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>k_walid</strong></td><td class="value">ahm.kam_92: sa</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">Petr: what makes you don't like States?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">k_walid: wa 3likom el salam</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">k_walid: :)</td></tr>
<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">Petr: thnx..</td></tr>
<tr class="dark"><td class="value"><strong>pcaldeira</strong></td><td class="value">thanks a lot Petr... good luck!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: I've just talked to other Russian people that moved there</span></td></tr>
<tr class="dark"><td class="value"><strong>kcm1700</strong></td><td class="value">good luck!</td></tr>
<tr class="light"><td class="value"><strong>k_walid</strong></td><td class="value">ahm.kam_92: how r u?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">k_walid: fine</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: and I don't think they're happy about that, for my definition of happy</span></td></tr>
<tr class="light"><td class="value"><strong>superkinhluan</strong></td><td class="value">Petr: I see, thanks for the answer</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">k_walid: balash kalam hena</td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">thx and good luck Petr :)</td></tr>
<tr class="dark"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr: tnx Petr ..............</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">Petr how old are you</td></tr>
<tr class="dark"><td class="value"><strong>krishbharadwaj</strong></td><td class="value">Petr : Thanks a lot for your time.. I helped me a lot :) All the best :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">superkinhluan: the environment is too different and sometimes hostile</span></td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">23</td></tr>
<tr class="light"><td class="value"><strong>rem</strong></td><td class="value">Petr: what is better to drink before SRM, tea or coffee?</td></tr>
<tr class="dark"><td class="value"><strong>zedoul</strong></td><td class="value">hahaha</td></tr>
<tr class="light"><td class="value"><strong>tanmoychatterje</strong></td><td class="value">Petr: thx chatting with you Petr...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">rem: tea</span></td></tr>
<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">LOL</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: How do you learn programing ?</td></tr>
<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">Petr, great! what is ur definition of being happy?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Amtrix: by programming, mostly</span></td></tr>
<tr class="light"><td class="value"><strong>abhicool</strong></td><td class="value">Petr: why not coffee ? </td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: Ok go and do 2 cups of tea</td></tr>
<tr class="light"><td class="value"><strong>binarywithme</strong></td><td class="value">Petr:  Are you describing yourself of being talent or hardworking ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Petr: one for me and the other for u :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">abhicool: dunno. Mostly because I feel like tea just now :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">hhaha</td></tr>
<tr class="light"><td class="value"><strong>kolistivra</strong></td><td class="value">Petr: Petr, what is the meaning of life?</td></tr>
<tr class="dark"><td class="value"><strong>abhicool</strong></td><td class="value">Petr: lol ok</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: with a book of algorithms ?</td></tr>
<tr class="dark"><td class="value"><strong>nigulh</strong></td><td class="value">Petr: when do you sleep, when competition is 4AM (or 5AM)?</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">I m  drinking now tea xD</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kolistivra: I may be 42</span></td></tr>
<tr class="light"><td class="value"><strong>raviupreti85</strong></td><td class="value">abhicool: oye abhijat</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">kolistivra: It may be 42</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: fav color? (not in hex #000 mine though )</td></tr>
<tr class="dark"><td class="value"><strong>zedoul</strong></td><td class="value">wow questions are more interesting..</td></tr>
<tr class="light"><td class="value"><strong>abhicool</strong></td><td class="value">raviupreti85: wrong no.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">nigulh: I try to go to sleep at 8pm</span></td></tr>
<tr class="light"><td class="value"><strong>ferrari_purav</strong></td><td class="value">Petr: Has there been any such occassion lately where you haven't been able to solve a proble?</td></tr>
<tr class="dark"><td class="value"><strong>raviupreti85</strong></td><td class="value">ok</td></tr>
<tr class="light"><td class="value"><strong>Mgccl</strong></td><td class="value">kolistivra: wow such an obvious question...</td></tr>
<tr class="dark"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: ""I may be 42"" - so you may be the meaning of life? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">ferrari_purav: sure, check my SRM history</span></td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">espr1t: :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">espr1t: Why not? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: What is you favourite algorithm book ????</td></tr>
<tr class="light"><td class="value"><strong>WCoder</strong></td><td class="value">espr1t: LOL</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Amtrix: CLRS</span></td></tr>
<tr class="light"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: Well, that means you are 6 timest 7? :D</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">Petr:What is the best way to improve mathematics?</td></tr>
<tr class="light"><td class="value"><strong>compcj</strong></td><td class="value">CLRS?</td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">MasterLuo: what's with that Chinese stuff...</td></tr>
<tr class="light"><td class="value"><strong>tck</strong></td><td class="value">Petr: how many hours do you sleep per day ?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Petr: fav color?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">espr1t: wasn't it six by nine?</span></td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">CLRS?</td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">anyone else having trouble connecting direct?</td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">compcj: cormen</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">tck: 8</span></td></tr>
<tr class="dark"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: it was the incorrect question :)</td></tr>
<tr class="light"><td class="value"><strong>MasterLuo</strong></td><td class="value">Mgccl: ??</td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Larry: no :-/</td></tr>
<tr class="light"><td class="value"><strong>compcj</strong></td><td class="value">ts</td></tr>
<tr class="dark"><td class="value"><strong>Lab</strong></td><td class="value">Apofis: Introduction to Algorithm</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">espr1t: how do you know? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>compcj</strong></td><td class="value">tsalman: thanks</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">Cormen?</td></tr>
<tr class="dark"><td class="value"><strong>compcj</strong></td><td class="value">tsalman: thanks</td></tr>
<tr class="light"><td class="value"><strong>espr1t</strong></td><td class="value">Petr: speaking of which I liked your last quote better :)</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">is CLRS cormen ???</td></tr>
<tr class="light"><td class="value"><strong>Mgccl</strong></td><td class="value">MasterLuo: ...</td></tr>
<tr class="dark"><td class="value"><strong>kode.smith</strong></td><td class="value">Petr: how many hours do you sleep?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Apofis: introduction to algorithms</td></tr>
<tr class="dark"><td class="value"><strong>MasterLuo</strong></td><td class="value">MasterLuo: do i know you?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Apofis: but cormen, lieserson, rivest, stein</td></tr>
<tr class="dark"><td class="value"><strong>Borisp</strong></td><td class="value">espr1t: ti da ne podgotvq6 pe6o za o6te edno systezanie s teb v edna staq?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Apofis: *by</td></tr>
<tr class="dark"><td class="value"><strong>Amith</strong></td><td class="value">kode.smith: 8 , answered previously :)</td></tr>
<tr class="light"><td class="value"><strong>espr1t</strong></td><td class="value">Borisp: hahaha ako pak e pri men shte se chuvstvam kato vazata s petuniite (ako si chel putevoditelq)</td></tr>
<tr class="dark"><td class="value"><strong>Amtrix</strong></td><td class="value">is CLRS cormen???</td></tr>
<tr class="light"><td class="value"><strong>Apofis</strong></td><td class="value">aa</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">Petr: what is the best way to improve mathematics ?</td></tr>
<tr class="light"><td class="value"><strong>sanky29288</strong></td><td class="value">Petr: Hi , Are u going to write a book called N ways to become a coder like Petr?</td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">you are right</td></tr>
<tr class="light"><td class="value"><strong>KunalKumar</strong></td><td class="value">Petr: do you manage time to go to text books? If so how much time?</td></tr>
<tr class="dark"><td class="value"><strong>Mgccl</strong></td><td class="value">FameofLight: for that question... go to mathlinks.ro</td></tr>
<tr class="light"><td class="value"><strong>Borisp</strong></td><td class="value">espr1t: 4el sym da</td></tr>
<tr class="dark"><td class="value"><strong>Borisp</strong></td><td class="value">espr1t: ma i pe6o e</td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">Petr:  so how can I be like you when I grow up?</td></tr>
<tr class="dark"><td class="value"><strong>espr1t</strong></td><td class="value">Borisp: sus sigurnost :)</td></tr>
<tr class="light"><td class="value"><strong>fadetoblack</strong></td><td class="value">Petr: is it very difficult to study in MSU?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">Larry: Like you didn't grow up already?</span></td></tr>
<tr class="light"><td class="value"><strong>csadam</strong></td><td class="value">I sleep 10 to 12 hours a day but I'm not good at algorithms.  Any ideas why? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">fadetoblack: no, it's rather easy</span></td></tr>
<tr class="light"><td class="value"><strong>espr1t</strong></td><td class="value">Borisp: Brat mi uspq da se regne v posledniq moment :)</td></tr>
<tr class="dark"><td class="value"><strong>kolistivra</strong></td><td class="value">Petr: Petr, if you were able to solve a problem fully, would it be NP vs P?</td></tr>
<tr class="light"><td class="value"><strong>Lingmum</strong></td><td class="value">Petr: what is your  constellation    </td></tr>
<tr class="dark"><td class="value"><strong>Borisp</strong></td><td class="value">espr1t: verno?</td></tr>
<tr class="light"><td class="value"><strong>Sulverus</strong></td><td class="value">Sainell: ))</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">Larry: you need to have your parents like his' </td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">Petr:  a boy can dream!</td></tr>
<tr class="dark"><td class="value"><strong>superkinhluan</strong></td><td class="value">LOL</td></tr>
<tr class="light"><td class="value"><strong>Borisp</strong></td><td class="value">espr1t: sa ako kaje6 4 ei mom4il se e</td></tr>
<tr class="dark"><td class="value"><strong>Lab</strong></td><td class="value">csadam: you should sleep only 8</td></tr>
<tr class="light"><td class="value"><strong>Sulverus</strong></td><td class="value">Sainell: priv...uda4i</td></tr>
<tr class="dark"><td class="value"><strong>Lab</strong></td><td class="value">csadam: :))</td></tr>
<tr class="light"><td class="value"><strong>Amtrix</strong></td><td class="value">Petr: Do you programing sometimes APIs ????</td></tr>
<tr class="dark"><td class="value"><strong>iginz</strong></td><td class="value">hi!!!</td></tr>
<tr class="light"><td class="value"><strong>kode.smith</strong></td><td class="value">Petr: what makes you think more creative?</td></tr>
<tr class="dark"><td class="value"><strong>Lukasz16a</strong></td><td class="value">good luck</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">OK, thanks for the chat everyone, I'm sorry for not answering most of the questions</span></td></tr>
<tr class="dark"><td class="value"><strong>Apofis</strong></td><td class="value">Petr: want to be my mentor?</td></tr>
<tr class="light"><td class="value"><strong>KunalKumar</strong></td><td class="value">Petr: do you constribute to open source?</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">GLA;HF;</td></tr>
<tr class="light"><td class="value"><strong>hamdanil</strong></td><td class="value">good luck everyone</td></tr>
<tr class="dark"><td class="value"><strong>Sulverus</strong></td><td class="value">Sainell: sps</td></tr>
<tr class="light"><td class="value"><strong>zedoul</strong></td><td class="value">good luck all</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Petr</span></td><td class="value"><span class="bigRed">but I'm a slow typer</span></td></tr>
<tr class="light"><td class="value"><strong>Nikaustr</strong></td><td class="value">Petr: Good luck today!</td></tr>
<tr class="dark"><td class="value"><strong>frank44</strong></td><td class="value">Larry: gl</td></tr>
<tr class="light"><td class="value"><strong>losvald</strong></td><td class="value">good luck</td></tr>
<tr class="dark"><td class="value"><strong>martins256</strong></td><td class="value">good luck</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">good luck all</td></tr>
<tr class="dark"><td class="value"><strong>compcj</strong></td><td class="value">tsalman: good luck</td></tr>
<tr class="light"><td class="value"><strong>Amith</strong></td><td class="value">kode.smith: thanks Petr</td></tr>
<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">petr: thanks a ton :)</td></tr>
<tr class="light"><td class="value"><strong>ahmedsaad</strong></td><td class="value">gla</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Good luck Petr</td></tr>
<tr class="light"><td class="value"><strong>Amith</strong></td><td class="value">Petr: thanks a ton</td></tr>
<tr class="dark"><td class="value"><strong>simplysuperb_kn</strong></td><td class="value">What do you do day to day in Google?</td></tr>
<tr class="light"><td class="value"><strong>kvishal</strong></td><td class="value">Good luck everybody</td></tr>
<tr class="dark"><td class="value"><strong>mindtechguy</strong></td><td class="value">Petr: Hi man How are u?</td></tr>
<tr class="light"><td class="value"><strong>javasoul</strong></td><td class="value">Thanks a ton petr</td></tr>
<tr class="dark"><td class="value"><strong>ferrari_purav</strong></td><td class="value">Petr: All the best for today (though i dont think u need luck...lol)</td></tr>

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