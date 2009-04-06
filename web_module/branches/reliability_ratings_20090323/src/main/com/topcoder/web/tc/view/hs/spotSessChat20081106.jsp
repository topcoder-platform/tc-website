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
        <div>Chat transcript from TCHS SRM 61: Spotlight Session with <tc-webtag:handle coderId="10597114" context="algorithm" /></div>
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

<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Hey! :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">welcome!</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: hey </td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">how r u ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">I have catched cold, so I won't compete today :(</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">:( oh sorry for that</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">hope u get well soon</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">I could, but I would like to be a target some day :)</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">:D hope so</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: good luck for you </td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">i am asking u about how did u got for that programming level ?</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">P</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: through conscious practice :)</span></td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: hi Psyho ... :D</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: only practice ?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: didn't u got camps reading books and others .. ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: but are you asking about MM or algo?</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: algo.</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: i am a High School student</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I started competing at 22, so I never got to any camps :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I've read only "Introduction to algorithms" and it's more than enough</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: :D so didn't u read books or other ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: Oh nice</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: what's the difference between algo and MM thinking ??</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so it's good as u say.</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so how old r u now ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: sometimes some simple tutorials on the net, about the topic which I had weakness with</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: 25 :)</span></td></tr>
<tr class="dark"><td class="value"><strong>zero.lin</strong></td><td class="value">hi, p</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">zero.lin: hey, how are you doing? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: nice!</td></tr>
<tr class="light"><td class="value"><strong>zero.lin</strong></td><td class="value">no bad</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so what is the helping skill to be good in programming ?</td></tr>
<tr class="light"><td class="value"><strong>zero.lin</strong></td><td class="value">Psyho: how about you ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: hmmm, it's hard to tell, it depends on what you understand by saying "programming"</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">zero.lin: I have a cold ;/</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">ahm.kam_92: mathematics ...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: hmmm, a really big one :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: mmm, i mean algorithms</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: is the practicing a good way to be red ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: Algo is more about psychology and ability to stay focused during short amount of time</span></td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">rooparam: do i need formal education in maths to be good in programing?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: and MMs are about long-term focus, and ability to stay open-minded</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">chandubaba: no :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: it really depends</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: everyone has a different weakness</span></td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: how should i go about learning maths needed in programin applications?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so what other websites of programming do u like too practice ?</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: thanks</td></tr>
<tr class="light"><td class="value"><strong>zero.lin</strong></td><td class="value">Psyho: :),would you take part in today`s SRM</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: some people are very good in maths, but they can't write anything during the 75 minutes</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so they need to practice on speed yewah!</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: yeah*</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: in the end, it comes down to identifying your weakness, and trying to improve</span></td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: oh</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: that's the golden rule for everything :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: :) yes</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so tell us about ur self :)</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: to become a windows operating system programing what skills should i have/</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: hmm, I almost only compete in TC</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: what is ur stream at college (computer science or something else) ?</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">rooparam: he is in school</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">chandubaba: I'm not a developer so I won't tell you :)</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: only!</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: oh </td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">chandubaba: but it depends on the company you want to work for</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so where do u work ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I don't :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I'm a happy unemployed guy :)</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so what do u do in life ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: lol :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: currently I'm trying to find my own place in the world</span></td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">Psyho: i dont know where i will get a job so how do i prepare for it?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so ?</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: u said u r 25, didn't u go to school ??</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: lol</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: *school = college</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: and as for income - I was skill gamer some time ago, and competitions give also some cash :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: I'm still finish my thesis work, but it's hard to say whether I'm still studying :)</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: :D</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Hello!</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: r u CS student ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: r u married ?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: r u married ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: sorry</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: But I'm considering doing Ph.D., since I put a lot time in doing various "research" stuff during different competitions, and in strange way, I like that :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: no, not married :P</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">chandubaba: indian's r always about job .... LOL</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">rooparam: :P so do u have kids ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: yes, I'm CS student :)</span></td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">rooparam: hehe</td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: ya kamel msh 3ayzeen ydakhlony TCHS??:S:S</td></tr>
<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: a3mel eh?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so are this money that u got helping u to live in a good life ?</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: what's r ur areas of interest in CS ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I believe I don't have any kids :D, but I guess others are not interested in my personal life :P</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: leeh ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I live in Poland, so the costs of living are that high</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: :D</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: nice!</td></tr>
<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: ana msh la2y ay admin aklemo</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: ah manta zaky</td></tr>
<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: eh?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: ana ba2aly sana mesh 3aref akhosh</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: I know you have been asked this question alot but how old are you? :D</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: 7ayetlobo mennak shehadet meladak bel english</td></tr>
<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: ybny ana ba3telhom soret el passport</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: we shehada men el madrasa bel enlish</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: 25</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Participated in the IOI?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: If yes when?</td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: ba3telhom soret el passport</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: mmm</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: i dunno ba2a</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Psyho: Hmmm, it's hard to tell :), I participated at local IOI, and got to top40 in Poland, but I didn't have any algorithm knowledge</span></td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: mafesh ay admin</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: nice talking to ur self :P</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: Like I didn't know what graph is :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: :P</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: I started competing at 22 :)</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Oh at 22!</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: when did u started programmig at all ?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: It's like you started programming in University?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: It's hard to tell, I was programming a little bit with QBasic when I was 14</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: I did mostly games</span></td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">how old are you?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: then later, I was programming with C++/DirectX</span></td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">Psyho: how old are you?</td></tr>
<tr class="light"><td class="value"><strong>Tomos</strong></td><td class="value">he's 25</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: But algorithms when did you started with algorithms?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">desert_lion: 25 </span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Directx me too!</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: so when ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: If you don't count the CS courses, then at 22 :)</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: so when ?</td></tr>
<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">Psyho: Probably this is already answered. What you do for a living now? </td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: What projects did you do in Directx or why you used directx for?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Just fun?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: 3 years and then to red !!</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: :D u r genius</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: ... I'm trying to figure this out (and that's the really honest answer)</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: what should i start reading for competing in SRMs ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: "Introduction to Algorithms" (CLRS) - it's enough</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: actually it's much more than enough</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: no I'm not</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: but u r :P</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: and for MMs ??</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: But it's all about Analysis and math!?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: for MMs you don't need almost any knowledge :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: maybe except some basic optimization techniques (HC/SA)</span></td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: means only API knowledge of any language will do for MMs ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: search some old forums for topics with books, and maybe you will find some</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: I did some 3D games</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: ok</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: I started programming only because I wanted to make games</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Alone without nobody's help!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: yes</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: what do u c programming or gaming is better ?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: I think it's hard starting with Directx needs some books!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: probably, but tutorials in the DirectX were enough</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: Nothing is better than another thing it's all about fun!</td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">Psyho: What do u do these days?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ahm.kam_92: hmmm, gaming won't give any money most of the time :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">myprasanna: it's hard to tell :)</span></td></tr>
<tr class="light"><td class="value"><strong>myprasanna</strong></td><td class="value">Psyho: I know :) Zorba :)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: :D u think of money ,i think of fun :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">myprasanna: currently I'm just trying to understand what I want to do in my life :)</span></td></tr>
<tr class="dark"><td class="value"><strong>sundeepblue</strong></td><td class="value">what kind of game do you develop?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: yes all fun, but may be one is funnier than the other :P</td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">Psyho: awesome!</td></tr>
<tr class="light"><td class="value"><strong>prunthaban</strong></td><td class="value">Psyho: This is confusing. Are you studying/employed/unemployed. Choose one? :)</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: If yes then it'll be algorithms cause developing games is sometimes boring!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: I'm finishing my masters</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: and I'm not going for employment after I'll finish it</span></td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: what types of games u used to play ( counter strike, AOE, ... ) ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: probably I will go for Ph.D. or doing something on my own</span></td></tr>
<tr class="light"><td class="value"><strong>sundeepblue</strong></td><td class="value">DO YOU PLAY HALFLIFE 2? I THINK IT IS VERY AWESOME!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">rooparam: I played a lot of SC (starcraft), and some FPP (mostly Quake3)</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Prince of Persia?</td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">Psyho: There are quite some people who did this, a few indians are humblefool, konqueror. And other famous ones are Zorba ofcourse, who went into full time gaming.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">myprasanna: I don't know what "Zorba" means :)</span></td></tr>
<tr class="dark"><td class="value"><strong>sundeepblue</strong></td><td class="value">Psyho: DO YOU PLAY HALFLIFE 2? I THINK IT IS VERY AWESOME!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">sundeepblue: I played it for the single player, and it was fun, but I was talking about the MP </span></td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">Zorbahttp://www.topcoder.com/tc?module=MemberProfile&cr=152347</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">myprasanna: I'll look at it later :)</span></td></tr>
<tr class="dark"><td class="value"><strong>sundeepblue</strong></td><td class="value">Psyho: OK. SORRY</td></tr>
<tr class="light"><td class="value"><strong>myprasanna</strong></td><td class="value">Zorbahttp: http://www.mandible.net/ :) Yeah later :)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: Ok, nice to talk with u :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: i am going to practice</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Psyho: bye</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Very</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: Wiat</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: ?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">as about my life - if you like a lot of things to do, it's really hard to focus on one</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: I'll go with you? :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">and if you go to full-time work, you don't have time for everything else</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: ok follow me :P</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: but first brb</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: :)</td></tr>
<tr class="light"><td class="value"><strong>prunthaban</strong></td><td class="value">Psyho: So what is the one area you want to concentrate on coming years?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">So, after trying to make games/making my own movie/being a skill gamer/going to acting school/...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">this list could a really long ;)</span></td></tr>
<tr class="dark"><td class="value"><strong>myprasanna</strong></td><td class="value">Psyho: :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: now that's the tough question, I don't know answer for :)</span></td></tr>
<tr class="dark"><td class="value"><strong>pat246</strong></td><td class="value">which compiler do u prefer ..?</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">myprasanna: http://www.mandible.net/ is this zorba's homepage?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Are you so good in maths?</td></tr>
<tr class="light"><td class="value"><strong>myprasanna</strong></td><td class="value">chandubaba: Yeah his gaming page</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Does it help in TC?</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">myprasanna: he makes these games?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: anyway, after competing some with on MMs, I started to really like complex problems, so there's a chance that I'll go for "academic career"</span></td></tr>
<tr class="light"><td class="value"><strong>myprasanna</strong></td><td class="value">chandubaba: yes</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">myprasanna: wow!!! nice</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pat246: everything that gets the job :) I use GCC with cygwin (since I don't like linux:) )</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: Hmm, it depends on what you understand by saying "math", for me math is calculus and other things that are not very logical to me :)</span></td></tr>
<tr class="light"><td class="value"><strong>pat246</strong></td><td class="value">ok..thanx</td></tr>
<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">Psyho: You said you didn't have much algorithmic knowledge. Does it mean you do not use the standard techniques in MMs like genetic algorithms?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Psyho: Discrete math</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: I've learned them on my own</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Sarkin: well dicrete math is probably the only "fun math" I know of :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: I use some hybrids of Simulated Annealing, which usually gets the job</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">prunthaban: but I still don't know Bayes ;)</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Psyho: are u still studying</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">Psyho: How you earn money apart from studies</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: yes :) But I should finish my masters 2 years ago</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: Currently most of my income comes from competitions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: few years ago I was a professional skill gamer</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: I played also some poker online :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">why everyone is asking me about my life? :D</span></td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Psycho: What reading material do you recommend for Number Theory?</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Psyho: I saw you are pretty good at Marathon also apart from Topcoder , Any Interesting formula you use while desiging algorithm for marathon match</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: any advices on using or not using STL's</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: do u participate in acm icpc ?</td></tr>
<tr class="dark"><td class="value"><strong>anastasov.bg</strong></td><td class="value">What kind of competitions do you prefer -- algorithm or marathon?</td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">dupree: you can't survive without using STL in C++</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">nicolodavis: very funny... I would recommend anything, the abitility of reasearching topics on your own is much more important</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: there are no golden rules for marathons :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: Yes and no. I did, but I never had any good team</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: I actually never got to my regional (CERC) :)</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">FameofLight: who said..tomek's opinion is diff</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">anastasov.bg: I prefer MMs much more, but they require much more time</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">anastasov.bg: in SRMs, almost every problem is the same - it comes down to using tricks, and making everything faster and faster</span></td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: u a student currently or proffesional</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">dupree: I'm still a student ;)</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">dupree: I think he use good amount of STL in his codes , As I know after seeing his submissions in TOpcoder Matches , Competition are more orientied toward time and accuracy these daya</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">dupree: you can't expect to be good without a good library , (Yours Library or Tested standard library)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: Yes, I still use STL, but sooner or later, you will use it too</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: But I don't consider it as something you must learn separately - you'll learn it by reading other people code and such</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Psyho: Any tips on improving in Marathon Matches , I am unable to make good progress , just try to submit some randomazied algorithm</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">Psyho: with some heuristics</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: so STL's are no evil,as projected by some people??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">dupree: yes, it's no evil - completely opposite to marriage :)</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">dupree: tell this point to not use library to any Java Coder , he will probably kill you :)</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">FameofLight: lolz!!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">FameofLight: well as I said before, if you want to improve, you need to know where are you making mistakes, what are your weaknesses</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: what do you do before a major onsite contest like TCO ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">Psyho: It's like an endless loop (find a weakness -&gt; get rid of it) :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: you mean just before competition (like 5 mins) or... ?</span></td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: say 1 week </td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">FameofLight: and I still dont have any strong language base,and still registered for TCHS srm 61!!god help me</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: then probably nothing :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: and just before is ok too :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: during the onsites, I usually wear my big DJ headphones, which help to isolate from the rest of world :)</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: :D</td></tr>
<tr class="light"><td class="value"><strong>zbazba</strong></td><td class="value">Psyho: how long have you been doing algorithm? </td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">zbazba: 3 years</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">zbazba: my first SRM is the exact time, when I started competiing</span></td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: do u plan to do future research on algorithms ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">zbazba: but then again, I had some algorithm courses already in my university</span></td></tr>
<tr class="dark"><td class="value"><strong>SuperCompiler</strong></td><td class="value">searchramy wafa</td></tr>
<tr class="light"><td class="value"><strong>ergeek</strong></td><td class="value">psyho, what was ur 1st srm score</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: there's a chance for that :)</span></td></tr>
<tr class="light"><td class="value"><strong>SuperCompiler</strong></td><td class="value">hey any body can help me searching for some one?</td></tr>
<tr class="dark"><td class="value"><strong>lebedkin</strong></td><td class="value">hornax: hi!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ergeek: what do you mean? you can check everything in the TC website</span></td></tr>
<tr class="dark"><td class="value"><strong>coldwindtang</strong></td><td class="value">.........</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: what would be your interest if you plan to do that ? :)</td></tr>
<tr class="dark"><td class="value"><strong>amit5148</strong></td><td class="value">SuperCompiler: go to Main-&gt;Search and type his/her name</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: Probably something around AI and psychology :)</span></td></tr>
<tr class="dark"><td class="value"><strong>SuperCompiler</strong></td><td class="value">thanks</td></tr>
<tr class="light"><td class="value"><strong>amit5148</strong></td><td class="value">SuperCompiler: wlcm</td></tr>
<tr class="dark"><td class="value"><strong>fish_ball</strong></td><td class="value">Hello, everybody.</td></tr>
<tr class="light"><td class="value"><strong>xhae</strong></td><td class="value">Hello, world!</td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: will you ever paticipate again?</td></tr>
<tr class="light"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: a few days ago, i saw in the forum that you mentioned some problems from a saratov contest being less deep thought involved, how do you define easy and hard problems ? :)</td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: your last match was a long time ago;)</td></tr>
<tr class="light"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">indeed it was mish</td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: but maybe you are happy with your rating :p</td></tr>
<tr class="light"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">I plan on participating in a few minutes</td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: ok :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: After you have, let's say 1000-2000 problems. And you still remember them. You'll notice that everything repeats</span></td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: are you planning to raise your rating?</td></tr>
<tr class="light"><td class="value"><strong>elsantodel90</strong></td><td class="value">dodi: E wachin</td></tr>
<tr class="dark"><td class="value"><strong>narri</strong></td><td class="value">Psyho: are you going to world sudoku championship this year?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">tsalman: so good problem is a one, that has something new, something that forces you to think</span></td></tr>
<tr class="dark"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">that's the idea, no?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">narri: I hope :)</span></td></tr>
<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">Scruff McGruff: Wow! Great to see you. The record holder :)</td></tr>
<tr class="light"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: well, it looks like you tried the opposite in previous matches ;)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">narri: I heard that there will be teams of 6 there</span></td></tr>
<tr class="light"><td class="value"><strong>fish_ball</strong></td><td class="value">Psyho: Can you share some technique in the challenge phase in srm?</td></tr>
<tr class="dark"><td class="value"><strong>mishastassen</strong></td><td class="value">Scruff McGruff: but good luck!</td></tr>
<tr class="light"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">haha</td></tr>
<tr class="dark"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">indeed</td></tr>
<tr class="light"><td class="value"><strong>narri</strong></td><td class="value">Psyho: that would be awesome</td></tr>
<tr class="dark"><td class="value"><strong>narri</strong></td><td class="value">Psyho: maybe there will actually room for more normal solvers on the us team!</td></tr>
<tr class="light"><td class="value"><strong>prunthaban</strong></td><td class="value">Scruff McGruff: Infact your achievement is more hard. It is not simple to get a rating of 1!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">fish_ball: hmmm, watch Petr screencase :)</span></td></tr>
<tr class="light"><td class="value"><strong>t-mac</strong></td><td class="value">Gentle reminder to everyone that this is supposed to be a chat session with Psyho... if you'd like to have side conversations, please do them in the regular chat room so that others may participate here more easily</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">fish_ball: *screencast</span></td></tr>
<tr class="light"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">wow, is this some lame attempt at a psych-out or what</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">Psyho: do you have a lot of contact with other Polish topcoders?</td></tr>
<tr class="light"><td class="value"><strong>fish_ball</strong></td><td class="value">Psyho: But what does this exactly mean?</td></tr>
<tr class="dark"><td class="value"><strong>fish_ball</strong></td><td class="value">Psyho: Goolge..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">fish_ball: anyway, for the challenge phase, the most important thing is to know what are you looking for _before_ the challenge phase</span></td></tr>
<tr class="dark"><td class="value"><strong>shirshbansal</strong></td><td class="value">hi..................</td></tr>
<tr class="light"><td class="value"><strong>DieIng</strong></td><td class="value">wcg2008 opened~</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: advice for new b's in single line???</td></tr>
<tr class="light"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">hey, is there a way to turn off the system messages</td></tr>
<tr class="dark"><td class="value"><strong>DieIng</strong></td><td class="value">anyone is seeing?</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: c++ progrmrs</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">fish_ball: usually challenge phase goes with two parts. In the first one you're looking for some common corner cases </span></td></tr>
<tr class="light"><td class="value"><strong>LeppyR64</strong></td><td class="value">Scruff McGruff: Options -&gt; Disable Enter Exit Messages</td></tr>
<tr class="dark"><td class="value"><strong>fish_ball</strong></td><td class="value">Psyho: yes.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">fish_ball: you spend like 10-15 seconds per solution, then later after you've checked everything, you just try to deeply analyze whole solution</span></td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: hi</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pdallago: not really, since I rarely go to the university :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">oops</td></tr>
<tr class="light"><td class="value"><strong>LeppyR64</strong></td><td class="value">Scruff McGruff: Better?</td></tr>
<tr class="dark"><td class="value"><strong>ulkanu001</strong></td><td class="value">gaurav pal thr</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pdallago: why do you ask? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>nishantissteel</strong></td><td class="value">hello!!!!!!!!!!!</td></tr>
<tr class="light"><td class="value"><strong>sdfond</strong></td><td class="value">sdsd</td></tr>
<tr class="dark"><td class="value"><strong>imrankane2005</strong></td><td class="value">ulkanu001: hi boop</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">Psyho: thanks for todaz session ....</td></tr>
<tr class="dark"><td class="value"><strong>zbazba</strong></td><td class="value">Psyho: on learning algorithm ,have you to do more problem ?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: what do you think you should improve ?</td></tr>
<tr class="dark"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">Yes, thank you.  Much better</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">khanhptnk: me? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>LeppyR64</strong></td><td class="value">Scruff McGruff: Cheers</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: of course !</td></tr>
<tr class="dark"><td class="value"><strong>fish_ball</strong></td><td class="value">Psyho: I see, thank you.</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: :))</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">khanhptnk: I need to improve my english :)</span></td></tr>
<tr class="light"><td class="value"><strong>global_killer</strong></td><td class="value">ulkanu001: hi</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: which country are you from ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">khanhptnk: Poland</span></td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">**rooparam hopes todaz problems would be easy for himself.</td></tr>
<tr class="light"><td class="value"><strong>flop_coder</strong></td><td class="value">srm already started,rite?</td></tr>
<tr class="dark"><td class="value"><strong>serenade</strong></td><td class="value">gl & hf</td></tr>
<tr class="light"><td class="value"><strong>ulkanu001</strong></td><td class="value">dont know</td></tr>
<tr class="dark"><td class="value"><strong>ulkanu001</strong></td><td class="value">gl</td></tr>
<tr class="light"><td class="value"><strong>antonov</strong></td><td class="value">Do you use IDE to compete in TC?</td></tr>
<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: english made you difficult when solving problems ?</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: how did u started of wid ur C++ skills</td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Chat session over? :(</td></tr>
<tr class="light"><td class="value"><strong>ali_zp</strong></td><td class="value">Hello everbody</td></tr>
<tr class="dark"><td class="value"><strong>LeppyR64</strong></td><td class="value">flop_coder: register now, srm starts in 7 in</td></tr>
<tr class="light"><td class="value"><strong>LeppyR64</strong></td><td class="value">flop_coder: min</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">Psyho: sorry I've just come, so this question might have already been asked. how do you approach marathon problem?</td></tr>
<tr class="light"><td class="value"><strong>ulkanu001</strong></td><td class="value">hello </td></tr>
<tr class="dark"><td class="value"><strong>sdfond</strong></td><td class="value">??</td></tr>
<tr class="light"><td class="value"><strong>global_killer</strong></td><td class="value">ulkanu001: haa haa bhuppi</td></tr>
<tr class="dark"><td class="value"><strong>ulkanu001</strong></td><td class="value">mera pehla srm</td></tr>
<tr class="light"><td class="value"><strong>millky</strong></td><td class="value">test</td></tr>
<tr class="dark"><td class="value"><strong>ulkanu001</strong></td><td class="value">nahi main nahi hoo</td></tr>
<tr class="light"><td class="value"><strong>kshitij_sv</strong></td><td class="value">ulkanu001: All the best. :)</td></tr>
<tr class="dark"><td class="value"><strong>imrankane2005</strong></td><td class="value">ulkanu001: 11</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">**rooparam hopes .....but not for others ;)</td></tr>
<tr class="dark"><td class="value"><strong>ulkanu001</strong></td><td class="value">thnx</td></tr>
<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">ny1 from IIIT A</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">Psyho: because in Poland there's a lot of people doing this, so just to know a bit more about how you interact with each other</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ardiankp: individually, it's impossible to have a general approach</span></td></tr>
<tr class="dark"><td class="value"><strong>celwell</strong></td><td class="value">what, if any, plugins do you use?</td></tr>
<tr class="light"><td class="value"><strong>vikas_dev</strong></td><td class="value">i am vikas</td></tr>
<tr class="dark"><td class="value"><strong>tsalman</strong></td><td class="value">Psyho: why did u choose wtf as your quote ? :D</td></tr>
<tr class="light"><td class="value"><strong>imrankane2005</strong></td><td class="value">sushil2006090: ka hai bhai</td></tr>
<tr class="dark"><td class="value"><strong>vikas_dev</strong></td><td class="value">i am dev</td></tr>
<tr class="light"><td class="value"><strong>ulkanu001</strong></td><td class="value">hahah</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pdallago: I'm learning everything on my own, if that's what you want to know :)</span></td></tr>
<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">rum pe hun</td></tr>
<tr class="dark"><td class="value"><strong>[Hanney]</strong></td><td class="value">kefir: jak tam samopoczucie?</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: how about programming</td></tr>
<tr class="dark"><td class="value"><strong>sushil2006090</strong></td><td class="value">where r u</td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">Psyho: becoz when I open "any" marathon problem, I directly conclude "they are simply impossible"</td></tr>
<tr class="dark"><td class="value"><strong>sushil2006090</strong></td><td class="value">i thot i would miss the srm 2day</td></tr>
<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">Psyho: do you think what you should learn more ?</td></tr>
<tr class="dark"><td class="value"><strong>sushil2006090</strong></td><td class="value">but luckily i am here</td></tr>
<tr class="light"><td class="value"><strong>flop_coder</strong></td><td class="value">thsnks</td></tr>
<tr class="dark"><td class="value"><strong>flop_coder</strong></td><td class="value">*thanks</td></tr>
<tr class="light"><td class="value"><strong>coldwindtang</strong></td><td class="value">...............</td></tr>
<tr class="dark"><td class="value"><strong>R0N</strong></td><td class="value">sushil2006090: hi</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ardiankp: when I open MM, I think "it must be easy"...</span></td></tr>
<tr class="dark"><td class="value"><strong>LeppyR64</strong></td><td class="value">flop_coder: You're welcome.</td></tr>
<tr class="light"><td class="value"><strong>[Hanney]</strong></td><td class="value">kefir: i na wzajem:)</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">Psyho: so a bit explanation on "how to start", please? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ardiankp: So I spent a lot of time, until I'll figure out the way, hot to make it easy :)</span></td></tr>
<tr class="dark"><td class="value"><strong>andysoft</strong></td><td class="value">kefir lol @ nickname</td></tr>
<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">hi ron</td></tr>
<tr class="dark"><td class="value"><strong>raulooo</strong></td><td class="value">marathon matches are harder thatn SRMs ?</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">Psyho: I see, the russians seems to have a tighter, more closely-knit community</td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">Psyho: can u give a simple gideway to get start in c++</td></tr>
<tr class="light"><td class="value"><strong>rooparam</strong></td><td class="value">**rooparam wishes chandubaba best of luck ;)</td></tr>
<tr class="dark"><td class="value"><strong>Scruff McGruff</strong></td><td class="value">i don't know how to whisper</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pdallago: Polish guys probably too :)</span></td></tr>
<tr class="dark"><td class="value"><strong>flop_coder</strong></td><td class="value">su</td></tr>
<tr class="light"><td class="value"><strong>hamlet_fiis</strong></td><td class="value">hola adolfo</td></tr>
<tr class="dark"><td class="value"><strong>LeppyR64</strong></td><td class="value">Scruff McGruff: double click someone's name, and select whisper</td></tr>
<tr class="light"><td class="value"><strong>celwell</strong></td><td class="value">what plugins do yo use, if any?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">pdallago: but I'm a bit of Loner :)</span></td></tr>
<tr class="light"><td class="value"><strong>ulkanu001</strong></td><td class="value">kshitij_sv: all the best  to u also</td></tr>
<tr class="dark"><td class="value"><strong>Andimeo</strong></td><td class="value">how is everyone going?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">dupree: sorry I can't :)</span></td></tr>
<tr class="dark"><td class="value"><strong>sushil2006090</strong></td><td class="value">uda rha hai kya bhai imran??</td></tr>
<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">koi nhi dude</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">**rooparam wishes psyh get well soon...</td></tr>
<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">Psyho: hehe, ok then, we do srm first. thanks for the session :)</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">Psyho: good luck</td></tr>
<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">har bade aadmi ka ye haq hota hai</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ardiankp: sure, gl :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">ardiankp: I don't compete today, I have a fever :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">good luck, everyone - I hope I have been of any use ;)</span></td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">psyho: and still no answers for c++</td></tr>
<tr class="dark"><td class="value"><strong>rooparam</strong></td><td class="value">**rooparam thanks Psyho for his valuable time ;)</td></tr>
<tr class="light"><td class="value"><strong>dupree</strong></td><td class="value">psyho: beginners..?/</td></tr>
<tr class="dark"><td class="value"><strong>winners21ag</strong></td><td class="value">hi all</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">dupree: if you really are a true beginner, then just grab a first book about c++ :)</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">psyho: huh,i did actually read 2 of them,still confused abt STL's</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">dupree: go & compete :P</span></td></tr>
<tr class="dark"><td class="value"><strong>dupree</strong></td><td class="value">psyho: yup thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Psyho</span></td><td class="value"><span class="bigRed">bye bye</span></td></tr>





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