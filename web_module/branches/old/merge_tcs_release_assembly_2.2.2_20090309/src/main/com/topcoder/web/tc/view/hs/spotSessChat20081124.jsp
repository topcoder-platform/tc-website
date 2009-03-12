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
        <div>Chat transcript from TCHS SRM 62: Spotlight Session with <tc-webtag:handle coderId="269554" context="algorithm" /></div>
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
<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">Welcome to the Spolight Session with Yarin</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">Thank you Yarin for being here to answer everyone's questions</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">hi everyone</span></td></tr>
<tr class="dark"><td class="value"><strong>abs_abs</strong></td><td class="value">hi there</td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Hi</td></tr>
<tr class="dark"><td class="value"><strong>vijaykrishnan</strong></td><td class="value">hi</td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">do you have any blog or any web page ?</td></tr>
<tr class="dark"><td class="value"><strong>irancoldfusion</strong></td><td class="value">hoi</td></tr>
<tr class="light"><td class="value"><strong>irancoldfusion</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">hi</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">abs_abs: no, i don't. i've been thinking about it though</span></td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: How in the world do you type so fast? :)</td></tr>
<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">Hello everyone. Welcome to the Spolight Session with Yarin</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: Hello</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: How old are you?</td></tr>
<tr class="light"><td class="value"><strong>irancoldfusion</strong></td><td class="value">Yarin: Do you work or study?</td></tr>
<tr class="dark"><td class="value"><strong>rockaustin2k6</strong></td><td class="value">kk</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">nicolodavis: i dunno :) but i'm not nearly as fast as Minilek here...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: 30</span></td></tr>
<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">Yarin: Do you have a girlfriend ;) ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">irancoldfusion: i'm a professional programmer since 5 years</span></td></tr>
<tr class="light"><td class="value"><strong>-ronin-</strong></td><td class="value">what Online Judje Systems you use for practice, and do you use them at all?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">zdravko_b: lol, nope</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: hello Yarin</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: How r u ?</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: how much time u must spend to prepare for topcder and iccpc</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: for example </td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ahm.kam_92: actually i have a cold and some slight fever. so i won't be participating in today's SRM. it's not stopping me from asnwering questions though!</span></td></tr>
<tr class="dark"><td class="value"><strong>vijaykrishnan</strong></td><td class="value">yeah saw</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: in a week </td></tr>
<tr class="dark"><td class="value"><strong>rockaustin2k6</strong></td><td class="value">Yarin how much can u advice me how to code to become red?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: well, nowadays, nothing really.</span></td></tr>
<tr class="dark"><td class="value"><strong>abs_abs</strong></td><td class="value">does having a girlfriend helps in becoming a RED ? ;)</td></tr>
<tr class="light"><td class="value"><strong>rockaustin2k6</strong></td><td class="value">sry</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: sorry for that </td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: i did prepare some for the recent Google Code Jam thoguh. brushing up my coding library</span></td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: well but for us beginners</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: hope u will be in better health soon</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: what do u think </td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Did you participate in the IOI?</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: ?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: so, did u participate in IOIs before ?</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: and how old r u ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">rockaustin2k6: well, do about 1000 problems in the practice room or on some online judge</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: 30</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">ahm.kam_92: hello ahmed</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ahm.kam_92: thanks</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">CamiloSoto: hello camilo</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">abstractwhiz: hello nadeem </td></tr>
<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">Yarin: what exactly do you work?</td></tr>
<tr class="dark"><td class="value"><strong>pdallago</strong></td><td class="value">Yarin: when did you first learn any interesting algorithms?</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">yo</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: when i did most of my practice, i spent probably 15-20 hours a week. this was back in 1999-2003</span></td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">pdallago: hey</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: yes, in 1997. i came 10th.</span></td></tr>
<tr class="light"><td class="value"><strong>nfx333</strong></td><td class="value">Yarin: Do you know Tourist(G. Korotkevich from Belarus)? What u think about him?</td></tr>
<tr class="dark"><td class="value"><strong>sondrago</strong></td><td class="value">y</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: have u participated in IOIs before ?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: Yeah</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">zdravko_b: I work at a small startup company, Silobreaker. it's in Stockholm, Sweden</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ahm.kam_92: 1994 and cam 10th</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: uh</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Sarkin: :)</td></tr>
<tr class="light"><td class="value"><strong>vijaykrishnan</strong></td><td class="value">Yarin: do u work/study? where?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ahm.kam_92: yes, IOI 1997 in South Africa. 10th place. Really weird problems that year...</span></td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: Well, other one i have chat with other high rating topoders and they say the most important topic to improve its DP, do u agree, ?</td></tr>
<tr class="dark"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">Yarin: How many hours in a day do you usually spend with you computer?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: mmm, nice</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: well all are important but this its mots important </td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: so, what about ACM ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: i can agree. it certainly is one of the first things to practice</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: have u entered once in the finals ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">hamedvalizadeh: excluding work, not that much. i have a lot of other hobbies</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Yarin: Mathematics , has real good connection with solving problem , does it also affect writing small and clean code</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: how old you are Yarin, if you don't mind revealing? ;)</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin, what's best competition environment for practice? TC, SPOJ, USACO..?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ahm.kam_92: yes, I was in the ACM world finals 2001 in Vancouver. we came 11th or something like that.</span></td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">I'm guessin 27</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: What helps better reading books or practicing?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: nice!</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">yiuyuho: 30</td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">yiuyuho: he is 30</td></tr>
<tr class="dark"><td class="value"><strong>stormsky</strong></td><td class="value">Yarin: how to learn "Graph Theory",which book i may read and how to practice this kind problem?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: i haven't use SPOJ. TC i think is very nice with all the educational content available. USACO is a good place to start for high schools students</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Sarkin: lol, Thanks</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Sarkin: Do you guys know what does he do for living?</td></tr>
<tr class="dark"><td class="value"><strong>hosam_samy</strong></td><td class="value">ahm.kam_92: hea eh el room deh</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">stormsky: my course litterature in graph theory was a book by West (not sure title, but probably just "introduction to graph theory").</span></td></tr>
<tr class="dark"><td class="value"><strong>vijaykrishnan</strong></td><td class="value">Yarin: do u work/study? where?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">stormsky: i liked that book. it's very mathy, but it helps you as a programmer as well</span></td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">yiuyuho: Yarin&gt; zdravko_b: I work at a small startup company, Silobreaker. it's in Stockholm, Sweden</td></tr>
<tr class="light"><td class="value"><strong>pdallago</strong></td><td class="value">Yarin: weird question, how do you like living in Sweden?</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">hosam_samy: Please speak only English in this lobby. thank you</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">hosam_samy: enta awwel marra teshoof practice session ?!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: I'm all for practivcing. i've only really read one algo book, in 1998 or something like that. the rest is practice. i think i've done like 1500-2000 problems throughout the years</span></td></tr>
<tr class="light"><td class="value"><strong>stormsky</strong></td><td class="value">Yarin: ok, i'll look for the book,thanks</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">cjoakes22: ooops</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">cjoakes22: sorry</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">cjoakes22: :S</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">pdallago: best country to live in :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin, what do you think of the Pirate Bay?</td></tr>
<tr class="light"><td class="value"><strong>hosam_samy</strong></td><td class="value">ahm.kam_92: ah</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">FameofLight: interesting, does he enjoy working there?</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">hosam_samy: whisper please</td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">yiuyuho: I don't know , you can ask now </td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">FameofLight: Cool ;)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">FameofLight: yes. petr mentionedf mathematical thinking. i totally agree with him. also, it's very neat to code in "functioanl style"</span></td></tr>
<tr class="light"><td class="value"><strong>hamedvalizadeh</strong></td><td class="value">Yarin: When have you started parogamming?</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: Do you enjoy working at your company?  Have you tried other options?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: lol, nice place to get stuff from :)</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Yarin: so, where do u work ?</td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">Yarin: can you tell us more about your current work profile ?</td></tr>
<tr class="dark"><td class="value"><strong>mohan8990</strong></td><td class="value">Yarin: Can I write additional method for the problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">yiuyuho: yes, it's a small company, only 7 developers. so i get to do all sorts of things</span></td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Was your TC rating considered as an extra point to hire you when you were hired?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">yiuyuho: i've been contacted by other companies for sure. i'm currently happy where i am though</span></td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">Yarin: thanks , This question must be put forward many times , Any special thing "apart from others" you like to mention for improving your coding Skills , That make you write really hard algorithms fast</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: hmm...in a small company, don't you get stressed out when the economy is going down...like now?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">mohan8990: not sure what you mean?</span></td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: That my most worry</td></tr>
<tr class="dark"><td class="value"><strong>lucasufrn</strong></td><td class="value">Yarin: how often do you take vacations?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">FameofLight: one thing is probably not to code the first thing that pops to your mind. i've done that mistake many times myself (and still do).</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">FameofLight: think all steps of the problem through, and see if there are any corner cases. a single corner case can destroy your entire solution outline</span></td></tr>
<tr class="light"><td class="value"><strong>mohan8990</strong></td><td class="value">Yarin: Can I Write My own method other than the method given in SRM</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: i have been practicing DP most i can but i still think there its something missing, instead of practicing beacuse i still dont make them fast, even worst i cant construct solutions by myself alone yet, what other thing i most practice for improve i</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">lucasufrn: many of my vacations are related to competitions. last year, i had five vacations one week each, spread out throughout the year... a bit horrible, relaly</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Sorry if I ask you this question the third time but I'm having some internet troubles Did you solve all the USACO when participated in the IOI if you remember?</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">CamiloSoto: you should calm down and do about 100-200 easy problems to get your fundamentals down ;)</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">CamiloSoto: Dont go on Div 1 1000s</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: hmm i'm not sure, sorry.</span></td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">CamiloSoto: Even I can't understand those ;)</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: i see</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: thanks</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Was your TC rating considered as an extra point to hire you when you were hired?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: no, i only learned about USACO several years after I did the IOI. i recommend it to my IOI students though (i'm the IOI delegation leader of Sweden)</span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Yarin: Did science helps in improving your coding specially Physics</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">what's the name of the company that Yarin works?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: my first and only IOI was my introduction to algorithm competitive programming. i hadn't done any proper training before that</span></td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">afonseca: Yarin&gt; zdravko_b: I work at a small startup company, Silobreaker. it's in Stockholm, Sweden</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">thanks</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">FameofLight: lol</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: How old where you at that time?</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">what kind of software?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">FameofLight: no, i hate physics :) I'm really glad that I didn't have to study any physics at university level. only math and computer science</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: 19</span></td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: do you still practice?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">FameofLight: so if physics related problems pop up at topcoder, i'm usually at a slight disadvantage</span></td></tr>
<tr class="light"><td class="value"><strong>suhendry</strong></td><td class="value">Yarin: what's your favorite type of problem in programming contest? :-)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">yiuyuho: not much, no.  I participate occasionally in SRM's when the time is fine (usually Saturday SRM's). I also try to do some interesting problems from ACM regionals and the IOI contests. </span></td></tr>
<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">Yarin: are your psychology about the physics and disadvantageous</td></tr>
<tr class="dark"><td class="value"><strong>thocev5</strong></td><td class="value">Yarin: which university did you attend? have you ever wished you picked some other?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">suhendry: those that require much code! because then my typing speed can be an important factor, hehe</span></td></tr>
<tr class="dark"><td class="value"><strong>koda</strong></td><td class="value">Yarin: Hi Jimmy! You work with the Swedish national qualifiers for the IOI. What is the current trend regarding the number (and level) of participants? What do you think is the most effective way to ensure a steady stream of contestants?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Do you find reading books useful if yes can you recommend some?</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Yarin: is it because you cannot find time due to work?  Or just at a different stage in life now?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">thocev5: Umeåniversity. a small one really, but it was my home town. nice to not hvae to move. i have never considered selecting a good university very important.</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">great answer :)</td></tr>
<tr class="light"><td class="value"><strong>marcadian</strong></td><td class="value">Yarin: i heard you are fast typist, how fast? ever try typeracer? :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">koda: hi Daniel :) the trend is decreasing... we have started to hvae contact with previous years contestants earlier on now. also, we've strated with internet qualifiers</span></td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: Do u like some king of sport or phisical exercise ?</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: But do you think that being educated in MIT or school with similiar level gives you more knowledge, better skills, etc?</td></tr>
<tr class="light"><td class="value"><strong>suhendry</strong></td><td class="value">Yarin: ouch, i hate that kind of problems :D</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">marcadian: 600-700 cpm, depending on the type of text. i've only tried typera.tk</span></td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">Yarin: small Univ & company, are you willing with your current life ?</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">similar*</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Repentinus: not when you are Yarin ;)</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Repentinus: yes same question</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: i used to do long distance running quite a lot. not this year though, sadly.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Yarin: did u goto a coding camp?</td></tr>
<tr class="light"><td class="value"><strong>ktuan</strong></td><td class="value">Yarin: could you give some advices to write a good problem ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: don't think i can answer that question since I don't know much about MIT really.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">pt1989: no, i'm entirely self taught.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Yarin: cool</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Yarin: gives me a lot of hope :D</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: Really, very nice me too, this year i compete on 21km running maraton, i wiuld like to run the big one have u ever try the big one?</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: i mean 42km?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ktuan: there's no formula for creating good problems, really.. the best problems are those that are different from all existing</span></td></tr>
<tr class="light"><td class="value"><strong>decowboy</strong></td><td class="value">How cluttered is your desk?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: nope, but i sure plan to run a marathon someday. i've done a couple of 20km workouts, but never any longer</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Yarin: can u tell about ur journey and how u improved?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Do you recommend TC for IOIers?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">decowboy: i try to keep it as clean as possible. i'm pretty pedantic</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: yes, definately! especially the challenge phase when you have to look at other peoples code is very, very, good practice for new prople</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">people</span></td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: have u ever try to code, after a lot of running its very nice, brain its total UP</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: i think its very nice for improving, what do u think?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: no, i usually don't code after running :) a coca cola and a book in the sofa is best then hehe</span></td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">konqueror: yo</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: jejejjeje</td></tr>
<tr class="light"><td class="value"><strong>konqueror</strong></td><td class="value">yiuyuho: hello :)</td></tr>
<tr class="dark"><td class="value"><strong>drain_bamage</strong></td><td class="value">Yarin: what are your favourite movies ? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">drain_bamage: since I'm a big tolkien fan, LOTR would be pretty high on the list</span></td></tr>
<tr class="dark"><td class="value"><strong>sahiltiwari</strong></td><td class="value">Yarin: how many hours you practise programming problem ?</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: nice, i do it like this sometimes, but of course after shower </td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: jajajajajajjajajajajaja</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">sahiltiwari: Nowadays I don't really practice "competitive algorithm programming". I participate occasionally in SRM's when the time is fine (usually Saturday SRM's). I also try to do some interesting problems from ACM regionals and the IOI contests.</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Do you get nervous before a programming competition?</td></tr>
<tr class="light"><td class="value"><strong>drain_bamage</strong></td><td class="value">Yarin: nice !!!!! :D LOTR rulez</td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: You don't seem very active on topcoder off late, why so?</td></tr>
<tr class="light"><td class="value"><strong>saradarTorshizi</strong></td><td class="value">what is important in contest? mathematic or programming ability(coding)?</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: What are your favourite fiction/science fiction books?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: not any more. i think that may be an advantage for me on onsites. a lot of people who are better than me are fairly new, and can be nervous</span></td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: i have a very poor knowledge in math. what is the best & quickest way ot improve ??</td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: *to</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Is there a way to become less nervous?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: i don't read SF so much, really. does the hitchhiker's guide qualify? :)</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Other than lots and lots of practice?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Yarin: By SF u mean sourceforge ? :P</td></tr>
<tr class="dark"><td class="value"><strong>kneupane</strong></td><td class="value"> Yarin: I am bew to prgramming ?? what is your suggestion ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: less nervous before competitions? well, participate in more competitions!</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: :)</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Thanks.</td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">Yarin: what language do you use at work?</td></tr>
<tr class="light"><td class="value"><strong>msg555</strong></td><td class="value">I still get nervous :)</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: That's right when I'm not in a SRM I can solve the problems better that when I'm in a SRM why? did that happen to you?</td></tr>
<tr class="light"><td class="value"><strong>saradarTorshizi</strong></td><td class="value">admins:  what is important in contest? mathematic or programming ability(coding)?</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">msg555: :D</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: I want to ask the same thing which was asked from Petr too: tea or coffee?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">marcadian: C#. the only language i use nowadays</span></td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">msg555: Even after 100+ SRMs?</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">msg555: So I guess it's normal to be nervous then. :)</td></tr>
<tr class="light"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: Do you work/study?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">msg555: You shouldn't only beginners :D</td></tr>
<tr class="light"><td class="value"><strong>yiuyuho</strong></td><td class="value">Foundation: yes</td></tr>
<tr class="dark"><td class="value"><strong>yiuyuho</strong></td><td class="value">Foundation: lol</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: yes, definately. when practice coding, it's much easier to be calm, and think about the solution in detail before implementing it. that's usually faster in a real competition as well, but then you much more easily start of in the wrong direction</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">yiuyuho: :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: Coffee! tea == hot water if you ask me</span></td></tr>
<tr class="dark"><td class="value"><strong>blackunicorn</strong></td><td class="value">Yarin: How important do you think, are algorithm skills in the professional software development arena?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">kshitij_sv: work</span></td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: Which company?</td></tr>
<tr class="light"><td class="value"><strong>jeromeemoses</strong></td><td class="value">what are the basic math stuff one need to know to be a good coder?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">kshitij_sv: Silobreaker</span></td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: hey, one last question, people that works on research like physics, or maths are good coders like tomek, u, petr?</td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: Ohh. I guessed Google. :)</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">kshitij_sv: me too</td></tr>
<tr class="dark"><td class="value"><strong>dorjay</strong></td><td class="value">hey which book should i refer for alogo dotn say "Corman"</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">Yarin: hi</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">blackunicorn: not so much. much more important is implementation technique. that is, KISS = Keep It Simply Stupid. a lot of people don't</span></td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Do you get frustrated when a problem is difficult to solve speedily?</td></tr>
<tr class="dark"><td class="value"><strong>sahiltiwari</strong></td><td class="value">Yarin: Do you think reading solution of other coders can help to improve coding skill ?</td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">dorjay: Cormen it's not Corman</td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: What does your job consist of?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: was that a question?</span></td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: As in what exactly is your job, i.e, what do you work on?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: no, not really. i like solving hard problems as well. but i have a better chance if the problem is fairly easy, and it's mostly about finding the most efficient way to implement it.</span></td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">Yarin: do you know the average time taken for someone to become red assuming he is 80% good??</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: yeah thats is true, do u know very good coders that works on research like physics?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Do you use any plugins in the SRMS does they help?</td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: what is the best way to practice when theoritical base is poor</td></tr>
<tr class="dark"><td class="value"><strong>blackunicorn</strong></td><td class="value">themaster: that is a very ambiguous question.. :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">kshitij_sv: kind of hard to summarize, but i work on the server side of a fairly complex information retrieval system.</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Ah. Thanks, I sometimes become flustered when a I have no ideas about solving a particular problem. What do you do in such circumstances?</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Do you know any esoteric languages? Which? Do you like esoteric languages?</td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">Yarin: can you gess?</td></tr>
<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">Yarin: guess*?</td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: Does your algorithm competition experience help you in your current job ? If yes, how</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">themaster: well, if you're good when starting at topcoder, you become red after 2-3 matches. if you are a good talent, but fairly new, it might take longer certinaly</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: i try to find hints, but not total give-aways</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: esoteric languages?</span></td></tr>
<tr class="dark"><td class="value"><strong>solafide</strong></td><td class="value">Yarin: In what order would you open and solve a set of TC problems? Would you do the 250 first to warm up, or the 1000 first since it's most valuable, or the 500 for some reason I can't fathom? What comes second?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: not sure what that is</span></td></tr>
<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">Yarin: thank you</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Esoteric as meaning for the select few.</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: only a few use it.</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: In other words.</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: languages like brainf*ck, whitespace, eyc...</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">etc*</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: do u know very good coders that works on research like physics?</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Thanks, how long do you spend on a problem before looking for hints/solutions?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: oh. i see. well, i think all those are cute and hilarous in some ways, but i've never really tried learn them :) Befunge and Malbolge (sp?) are probably my favourites then...</span></td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: beacuse i know some that works but in algorithms </td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: research</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: 10-15 hours probably</span></td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Wow, you have that much time to devote to a single problem?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">CamiloSoto: not physics, no.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: well, if it's an interesting problem, i don't want it spoilt. i can think about it on the tube to work, or on the lunch, etc</span></td></tr>
<tr class="dark"><td class="value"><strong>kshitij_sv</strong></td><td class="value">Yarin: What do you do during leisure? As in what would be your hobbies</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">CamiloSoto: It seems you like physics a lot.</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Ah. Thanks. :)</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Yarin: there is any coder that has arrive to a medal field or near?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: Did u solve in any OJ for practice ??</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">that is for all </td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">?</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">jejee</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: play chess. or guitar hero. or something else. i try to read a lot as well</span></td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Sarkin: yeah i love it</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: That's nice.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: yes, i did like 800 problems or so on UVA</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Do you play chess competitively?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">CamiloSoto: Nice.</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Not sure if that's a word.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: but i'm pretty serious in all my hobbies. as in, i like to become good or very good at the stuff i spend time on</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: yes i do</span></td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: how to learn math for programming ??</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: :) Me too. It's hard though...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: get a book about discrete mathematics. that's pretty much the only math book you need</span></td></tr>
<tr class="dark"><td class="value"><strong>boris.grubic</strong></td><td class="value">Yarin: why are you using C# ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">boris.grubic: I use C# simply because I think it's the best general-purpose programming language available. I also think languages like C#/Java are better in these kind of contents because they're better at catching logical errors.</span></td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Do you like any other simple strategy games besides chess too? Tetralink, the Game of Go, etc?</td></tr>
<tr class="light"><td class="value"><strong>gcosmin</strong></td><td class="value">cand anybody tell me if you still need a 3 tchs participations in order to be able to enter the tournament?</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">gcosmin: No</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: haven't tried any other such game seriously, no</span></td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">gcosmin: They changed it this year.</td></tr>
<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Minilek: hello</td></tr>
<tr class="dark"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Do you enjoy competitive programming better or development?</td></tr>
<tr class="light"><td class="value"><strong>fadetoblack</strong></td><td class="value">Yarin: and why not C++ ?</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">Minilek: sup, ?</td></tr>
<tr class="light"><td class="value"><strong>gcosmin</strong></td><td class="value">Foundation: thx. so i can enter the tournament regardless of how having no tchs? (i would like to participate in the srm)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Foundation: competitive programming is more of a holiday... but i've come to like software development much more than i would have though just 5 years ago. there are so many other challenges that are interesting</span></td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">gcosmin: That's what the admins told me. :D</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">gcosmin: If I remember correctly then you have to participate in one.</td></tr>
<tr class="light"><td class="value"><strong>ashpro</strong></td><td class="value">Yarin: hi...do u remember what ur first rating in TC was..?</td></tr>
<tr class="dark"><td class="value"><strong>fadetoblack</strong></td><td class="value">Yarin: for example there is no set, priority_queue in C#</td></tr>
<tr class="light"><td class="value"><strong>piks_18</strong></td><td class="value">Yarin should we be strong in  mathematics to come to red color rating in topcder...?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: how many hours a day u practiced, as a beginner ??</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">Yarin: Ah. So you enjoy different aspects of each?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">fadetoblack: C++ is just ugly. there certinaly is set in C#, you hvae HashSet and SortedDictionary etc for a tree-like set structure</span></td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">bah</td></tr>
<tr class="dark"><td class="value"><strong>gcosmin</strong></td><td class="value">Foundation: isn't there anything said regarding this on the site?</td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: C++ is ugly??</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">ashpro: Look at the graph!</td></tr>
<tr class="light"><td class="value"><strong>Foundation</strong></td><td class="value">gcosmin: Not really...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">fadetoblack: also, it's not so important what is in the default language library. you can have such stuff prewritten or in your own libraries</span></td></tr>
<tr class="light"><td class="value"><strong>dorjay</strong></td><td class="value">Yarin:Which book You can refer as"Algo For Dummies"</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">gcosmin: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tchs08&d3=rules</td></tr>
<tr class="light"><td class="value"><strong>fadetoblack</strong></td><td class="value">Yarin: ...and how can I write red-black tree in C# for example??</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">nicolodavis: lol, in some ways yes :) templates for instance. i much prefer generics in C#</span></td></tr>
<tr class="light"><td class="value"><strong>gcosmin</strong></td><td class="value">Repentinus: thx</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Why do you think C++ is ugly??</td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Hmm, but dont you think C++ can be more widely used in programming contests?</td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: As in many online judges dont support C#</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: C++ is not a language i would every want to use in commerical, system programming. there are so many things that can go wrong which you won't catch</span></td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">Yarin: How long did you type before achieveing 700 CPM ? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: C++ is all fine and nice for small projects and other things.</span></td></tr>
<tr class="dark"><td class="value"><strong>nicomp</strong></td><td class="value">What do you mean by System Programming?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">innocentboy: not sure really. I didn't really measure my typing speed until i was in highschool, and already then i was at about that level</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: DirectX mainly uses C++ and that means all game programming!</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin, but don't you think that C++ is a good language if it is used by a good C++ coder?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: And game programming is not a small project!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: well, there are performance issues of course. C++ is good for that, obviously</span></td></tr>
<tr class="dark"><td class="value"><strong>boris.grubic</strong></td><td class="value">Yarin: How much your typing speed is helping you ? :)</td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">Do people still ask you about ztetris?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: if performance was not an issues, i'm sure the development cycle of games would be less. also, most of the game coding today is the logic, right? done in some custom script languages</span></td></tr>
<tr class="light"><td class="value"><strong>bugzpodder</strong></td><td class="value">Larry: congrats on being red</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Larry: it happens that i get emails about it yes :) i think i got one just ac ouple of days ago</span></td></tr>
<tr class="light"><td class="value"><strong>naiveAlgorist</strong></td><td class="value">hello</td></tr>
<tr class="dark"><td class="value"><strong>askvij</strong></td><td class="value">Larry: what is ztetris ???</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">askvij: A game obviosly</td></tr>
<tr class="dark"><td class="value"><strong>Larry</strong></td><td class="value">Yarin: I think in 98 or so, I was trying to learn ASM so I can write programs in my TI86, and as it turns out, you wrote that tutorial (though I didn't know it at the time!)</td></tr>
<tr class="light"><td class="value"><strong>Larry</strong></td><td class="value">ztetris is something that destroyed productivity of too many high school students</td></tr>
<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">andrewzta: hello </td></tr>
<tr class="light"><td class="value"><strong>edwin_andres</strong></td><td class="value">Gaizka: que mas</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Larry: Why?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Larry: really? i don't remember doing a Z80 tutorial. but my memory might be failing</span></td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Larry: :D</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Did you use plugins in the SRMs?</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Do you have a plan to become a target?</td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: do u have wickness in any kind of problem? :D</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: Do they help?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Sarkin: i use the FileEdit plugin only</span></td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">Yarin: I don't get that plugin :D</td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Yeah imagine C# without intellisense :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: i was a target during severla years. my rating dropped badly a couple of years ago. i still think i can become a target if i participare more often</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">nicolodavis: yeah, it still amazes me that so many people uses VIM/Emacs as an editor and uses "printf-debugging". I think that's just throwing away important minutes.</span></td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Are you going to participate today?</td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">Yarin: Hi Yarin.., what is the best strategy to do daily training? i mean individual training, not as a team</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: no</span></td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Yeah Visual Studio rocks. Just wish they had a linux port.</td></tr>
<tr class="dark"><td class="value"><strong>imrankane2005</strong></td><td class="value">Yarin: which editor do you used for SRM ?</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">Yarin: well you don't have much choice at most competitions... (I use vim)</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: how do u debug ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">nicolodavis: it's even much more better with ReSharper... if you use C# that is</span></td></tr>
<tr class="dark"><td class="value"><strong>pankaj_k</strong></td><td class="value">by all means vim editor rocks</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: what do you think of using gdb via commandline?</td></tr>
<tr class="dark"><td class="value"><strong>diakatana</strong></td><td class="value">anyone tried Visual Slickedit on linux? </td></tr>
<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Ok. Ill look that up.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">stjepan: that's the organizers fault, unfortunately</span></td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">Yarin: Other question, is DP easy for you?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: horrible...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">wilbertliu: yes, i'm pretty good at DP problems</span></td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">Yarin: what IDE (debugger) do you use?</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: Why?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">stjepan: I use Visual Studio 2008 with Jetbrains ReSharper plugin.</span></td></tr>
<tr class="light"><td class="value"><strong>black_adder</strong></td><td class="value">I don't understand why you don't like the default Topcoder editor</td></tr>
<tr class="dark"><td class="value"><strong>black_adder</strong></td><td class="value">who needs plugins? :)</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">everyone :)</td></tr>
<tr class="dark"><td class="value"><strong>oa12gb</strong></td><td class="value">black_adder: time is rating</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">black_adder: You can get a better rating.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">black_adder: then you have to type every single character in the code. i wouldn't be surprised if i only type 1/3 of the characters in the code i submit. the rest is generated or intellisensed</span></td></tr>
<tr class="light"><td class="value"><strong>niquefa</strong></td><td class="value">Yarin: what can i do to do better in DP problems?</td></tr>
<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">I can code much much faster with vim and test faster with moj+tztester</td></tr>
<tr class="light"><td class="value"><strong>viswanath</strong></td><td class="value">Yarin: which kind of problems do you find easiest....I mean the moment you see you become happy</td></tr>
<tr class="dark"><td class="value"><strong>askvij</strong></td><td class="value">viswanath: I guess it will be DP </td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">Yarin: Hmm.., if you are good at DP, are you train DP problems day by day?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: how old r u ???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">viswanath: something that screams DP. or grid problems! i love grid problems... even though they can be any kind of problem really, i still like to see grids in problem statements</span></td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Well all that matters when typing is your bottleneck. Mine is thinking :)</td></tr>
<tr class="light"><td class="value"><strong>black_adder</strong></td><td class="value">I'm just an amateur, but I think I read somewhere that in TCO (onsite phase) no plugins are allowed.</td></tr>
<tr class="dark"><td class="value"><strong>ptrrsn_1</strong></td><td class="value">jansonh: Hai.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">wilbertliu: i don't practice nowadays. but i guess i have a knack for it... the key to DP is to be good at mathmetical induction</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">black_adder: that's not true</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: 30</span></td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: started programming at _____ ??</td></tr>
<tr class="light"><td class="value"><strong>katuok</strong></td><td class="value">ho</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: 7 </span></td></tr>
<tr class="light"><td class="value"><strong>pagio</strong></td><td class="value">Yarin:Are mathematics(graph theory etc) important?</td></tr>
<tr class="dark"><td class="value"><strong>hamlet_fiis</strong></td><td class="value">jeje toi como chino</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: i coded in BASIC until i started high school though! quite horrible really...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">pagio: yes, for these competitions at least</span></td></tr>
<tr class="light"><td class="value"><strong>sp2hari</strong></td><td class="value">Yarin: How long do you think one should practice? Do you prefer long practice sessions or a short one?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: did u participate in ICPC ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">sp2hari: i did mostly shorter ones, but every day. i've never been to any training camps, or practiced in groups etc</span></td></tr>
<tr class="dark"><td class="value"><strong>askvij</strong></td><td class="value">Yarin: which was the first programming contest that you won ???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">moshiur: yes. only one world final though, in 2001</span></td></tr>
<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">Yarin: so mastering mathematical induction is the key? are there any suggestions to mastering DP? maybe doing some mathematical induction problems or?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">askvij: the Swedish IOI qualification 1997</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">wilbertliu: yeah, that might be worth a shot</span></td></tr>
<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">Yarin: are you attending todays SRM</td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: Any good resources for number theory and probability?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">samsam: no, i've catched a cold and can't really focus enough</span></td></tr>
<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">ramab1988: mama :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">nicolodavis: sorry, no...</span></td></tr>
<tr class="dark"><td class="value"><strong>Borisp</strong></td><td class="value">CONDOR_316: your mother is participating?</td></tr>
<tr class="light"><td class="value"><strong>Mahdeto</strong></td><td class="value">Yarin: Any advice for a begginer?</td></tr>
<tr class="dark"><td class="value"><strong>drain_bamage</strong></td><td class="value">Yarin: lol</td></tr>
<tr class="light"><td class="value"><strong>liancoolboy</strong></td><td class="value">555..so dark here...</td></tr>
<tr class="dark"><td class="value"><strong>ramab1988</strong></td><td class="value"> en maga,.. en madtha iddiya?</td></tr>
<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">Thank you all for participating in the chat today with Yarin. </td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">Please ask your last few questions </td></tr>
<tr class="light"><td class="value"><strong>livingroom</strong></td><td class="value">liancoolboy: the same</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Yarin: What do you think of probability? Probability problems make least sense for me...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Mahdeto: nothing more than try to spend 1h each day solve some problems on an online judge</span></td></tr>
<tr class="dark"><td class="value"><strong>sp2hari</strong></td><td class="value">Yarin: Ok. How do you proceed if you don't have any clue about the problem you are solving? Don't those kind of problems bring the confidence down?</td></tr>
<tr class="light"><td class="value"><strong>kino</strong></td><td class="value">Yarin: you a game programmer?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">Repentinus: probabiltiy problems are often DP problems, so i have not so much problem with them</span></td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">Borisp: I was not using English :)</td></tr>
<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">Yarin: last question for DP.., how to define a state quickly? like the dimension also? and the recurrence?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">kino: i coded a game once for the game boy advance that was published. never again though...</span></td></tr>
<tr class="dark"><td class="value"><strong>ramab1988</strong></td><td class="value">nanu kannada use mathda iddina..</td></tr>
<tr class="light"><td class="value"><strong>Borisp</strong></td><td class="value">CONDOR_316: but still it meant the same didn't it?</td></tr>
<tr class="dark"><td class="value"><strong>Nesszors</strong></td><td class="value">tcjuan: sup</td></tr>
<tr class="light"><td class="value"><strong>askvij</strong></td><td class="value">Yarin: as a problemsetter what is the major difference between the  topcoder problems and UVA problems ??</td></tr>
<tr class="dark"><td class="value"><strong>asmaamagdi</strong></td><td class="value">cpphamza: in Alex :D ?</td></tr>
<tr class="light"><td class="value"><strong>srikanth_sg</strong></td><td class="value">wats the most important thing to solve 500 in div 2?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: any future plan ??</td></tr>
<tr class="light"><td class="value"><strong>NotImplemented</strong></td><td class="value">Yarin: what participating in algorithm competitions gave to you?</td></tr>
<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">Borisp: nope...its like telling "dude" ..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">wilbertliu: well, finding the state is the key. like, what do you need to know in order to know everything about the history, but without storing too much</span></td></tr>
<tr class="dark"><td class="value"><strong>ramab1988</strong></td><td class="value">i didnt tell dude..</td></tr>
<tr class="light"><td class="value"><strong>cpphamza</strong></td><td class="value">asmaamagdi: yes :)</td></tr>
<tr class="dark"><td class="value"><strong>drain_bamage</strong></td><td class="value">paritosh1010: abbe bakchod lag raha hai kya ye sab ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">NotImplemented: a lot of fun! and a lot skill as well in commerical programming, i think</span></td></tr>
<tr class="dark"><td class="value"><strong>itroot</strong></td><td class="value">Mick_Nick: hello</td></tr>
<tr class="light"><td class="value"><strong>asmaamagdi</strong></td><td class="value">cpphamza: me too :)</td></tr>
<tr class="dark"><td class="value"><strong>paritosh1010</strong></td><td class="value">drain_bamage: nahi sahi hai</td></tr>
<tr class="light"><td class="value"><strong>Mick_Nick</strong></td><td class="value">itroot: hi</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">Thank you Yarin for being here for this Spotlight Session</td></tr>
<tr class="light"><td class="value"><strong>jbergmanster</strong></td><td class="value">how do we enter the competition room</td></tr>
<tr class="dark"><td class="value"><strong>Nesszors</strong></td><td class="value">Yarin what's your occupation?</td></tr>
<tr class="light"><td class="value"><strong>drain_bamage</strong></td><td class="value">paritosh1010: k</td></tr>
<tr class="dark"><td class="value"><strong>ardiankp</strong></td><td class="value">Yarin: are you still setting problems these days?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">thanks everyone, good luck in todays SRM!</span></td></tr>
<tr class="dark"><td class="value"><strong>itroot</strong></td><td class="value">Mick_Nick: gl&hf</td></tr>
<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">bye.</td></tr>
<tr class="dark"><td class="value"><strong>Mick_Nick</strong></td><td class="value">itroot: thx</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ardiankp: only during onsite competitions</span></td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">This is the end of this chat. Thank you all for participating</td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">Yarin: good luck all !!!!!!!!!!!!!!!</td></tr>
<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">Yarin: bye</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Yarin</span></td><td class="value"><span class="bigRed">ardiankp: i test problems fairly often though</span></td></tr>






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