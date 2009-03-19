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
        <div>Chat transcript from TCHS SRM 63: Spotlight Session with tomek</div>
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
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Welcome everybody</span></td></tr>
<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">HELLO</td></tr>
<tr class="light"><td class="value"><strong>Igorp_ktl2</strong></td><td class="value">hi tomek</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">tomek: what is your full name ?</td></tr>
<tr class="light"><td class="value"><strong>Gando19850304</strong></td><td class="value">tomek: Hi</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">Hello everyone. Thank you for joining the chat.</td></tr>
<tr class="light"><td class="value"><strong>vaibhav_arora</strong></td><td class="value">hello</td></tr>
<tr class="dark"><td class="value"><strong>TeCNoYoTTa</strong></td><td class="value">welcome</td></tr>
<tr class="light"><td class="value"><strong>ngg</strong></td><td class="value">HI Mr. God</td></tr>
<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">Oh my god</td></tr>
<tr class="light"><td class="value"><strong>TeCNoYoTTa</strong></td><td class="value">:D</td></tr>
<tr class="dark"><td class="value"><strong>abhinavkulkarni</strong></td><td class="value">Hello!</td></tr>
<tr class="light"><td class="value"><strong>ambuj123</strong></td><td class="value">Hi tomek :)</td></tr>
<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">it is tomek</td></tr>
<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: hey Tomek !!!</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">you may start your questions in about 4 minutes. thank you</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">I can't believe my eyes</td></tr>
<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">It's HE!!!</td></tr>
<tr class="light"><td class="value"><strong>ptrrsn_1</strong></td><td class="value">algoboy: Hi.</td></tr>
<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: glad you've joined us :)</td></tr>
<tr class="light"><td class="value"><strong>prunthaban</strong></td><td class="value">timur_kz: why? LOL!</td></tr>
<tr class="dark"><td class="value"><strong>sohelH</strong></td><td class="value">.</td></tr>
<tr class="light"><td class="value"><strong>Igorp_ktl2</strong></td><td class="value">you don';t have to believe your eyes</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: fadel 4 minuits</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">prunthaban: Ti poprohe obshaysya</td></tr>
<tr class="dark"><td class="value"><strong>ptrrsn_1</strong></td><td class="value">tomek: Welcome.</td></tr>
<tr class="light"><td class="value"><strong>VladBelous</strong></td><td class="value">lol, you all sound like a bunch of britney fans (except that it's tomek instead)</td></tr>
<tr class="dark"><td class="value"><strong>Gando19850304</strong></td><td class="value">tomek: Hi, I am interested in programing, but I am not studying computer-related major. So do you have some advises on how to improve my coding skills?</td></tr>
<tr class="light"><td class="value"><strong>muntasir_120</strong></td><td class="value">:D</td></tr>
<tr class="dark"><td class="value"><strong>HeypaBHoBeceH</strong></td><td class="value">Tomek, How does it feel ? xD</td></tr>
<tr class="light"><td class="value"><strong>prunthaban</strong></td><td class="value">tomek should say "I am pumped. Let the questioning begin" :)</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">Gando19850304: The chat will begin momentatrily. Thank you</td></tr>
<tr class="light"><td class="value"><strong>ambuj123</strong></td><td class="value">Whr is tomek ?</td></tr>
<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">can't wait already :P</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: Is it difficult to be the best of the best???</td></tr>
<tr class="dark"><td class="value"><strong>emotionalBlind</strong></td><td class="value">tomek: are you in California now?</td></tr>
<tr class="light"><td class="value"><strong>wxGO</strong></td><td class="value">and how to be the best of the best?</td></tr>
<tr class="dark"><td class="value"><strong>sara.sa1</strong></td><td class="value">ambuj123: he's at the top</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: like me)))</td></tr>
<tr class="dark"><td class="value"><strong>albert988</strong></td><td class="value">sb</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">wxGO: Petr has already answered that question - drink tea :P</td></tr>
<tr class="dark"><td class="value"><strong>Igorp_ktl2</strong></td><td class="value">but he is not the best of the best) Petr is some better)</td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">ptrrsn_1: hi :D</td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">admins: Welcome to the Spotlight Session with tomek!</td></tr>
<tr class="light"><td class="value"><strong>sathya.phoenix</strong></td><td class="value">let tomek come in </td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">tomek: what is ur full name ? -- where do u live and work ?</td></tr>
<tr class="light"><td class="value"><strong>Igorp_ktl2</strong></td><td class="value">and Genka Korotkevich)</td></tr>
<tr class="dark"><td class="value"><strong>R0N</strong></td><td class="value">tomek: WELCOME..!!</td></tr>
<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">admins: You may begin your questions. </td></tr>
<tr class="dark"><td class="value"><strong>amrsaqr</strong></td><td class="value">Jaqoup: eating and watching</td></tr>
<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">admins: Thank you tomek for joining us</td></tr>
<tr class="dark"><td class="value"><strong>wxGO</strong></td><td class="value">stjepan: oh really,I have to change my habit .lol</td></tr>
<tr class="light"><td class="value"><strong>sathya.phoenix</strong></td><td class="value">tomek are u there?</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: You may begin answering :D</td></tr>
<tr class="light"><td class="value"><strong>chtomek</strong></td><td class="value">ahm.kam_92: TOmasz Czajka, california, google</td></tr>
<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">Tomek, do you prefer tea or coffee?</td></tr>
<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">tomek: where are you now :) ?</td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: Hello! Thanks for joining us today!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Hi everybody, go ahead, I'm ready</span></td></tr>
<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">admins: Please remember to ask your questions in English.</td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Hi tomek, would you mind if you give best advice for a beginner? I just want to know how to start training, specific please..:)</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: What is the "Best practice method" to be a RED in one year, for a boy who is grey now ??</td></tr>
<tr class="light"><td class="value"><strong>amrsaqr</strong></td><td class="value">Jaqoup: tomek ya 3am</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: How old are you?</td></tr>
<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">tomek: what do you think is the key to your success?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">OK let's start with advise for beginners...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">That seems like most questions</span></td></tr>
<tr class="dark"><td class="value"><strong>sara.sa1</strong></td><td class="value">tomek: how old are your? :D</td></tr>
<tr class="light"><td class="value"><strong>abal9002</strong></td><td class="value">How old are you tomek?</td></tr>
<tr class="dark"><td class="value"><strong>ambuj123</strong></td><td class="value">How to begin reading Knuth - Art of Computer Programming ?</td></tr>
<tr class="light"><td class="value"><strong>abal9002</strong></td><td class="value">:)</td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">tomek: where do u work ?</td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: What is the "Best practice method" to be a RED in one year, for a boy who is grey now ??</td></tr>
<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">ambuj123: You open the book.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">I started out by reading some books</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">chtomek: :) Ok</td></tr>
<tr class="light"><td class="value"><strong>ambuj123</strong></td><td class="value">lol</td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">patient, tomek type in regular speed :D</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: which books???</td></tr>
<tr class="dark"><td class="value"><strong>pszemsza_</strong></td><td class="value">vexorian: :D</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">chtomek: which book ?</td></tr>
<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">tomek: could you name some of them ? :)</td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">chtomek: books*</td></tr>
<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">If I am right tomek year of birth is 1981. I remember seeing it somewhere.</td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: then?</td></tr>
<tr class="dark"><td class="value"><strong>suhendry</strong></td><td class="value">what was your first algorithm book?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">My first books would have been the Polish Olympiad write-ups</span></td></tr>
<tr class="dark"><td class="value"><strong>albert988</strong></td><td class="value">C++ primer?</td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">marcadian: i believe he's more fast than you :p</td></tr>
<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: Is 'Introduction to Algorithms' enough?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">with floppy disks </span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">with test cases on them</span></td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: did u read Concrete Math. ?</td></tr>
<tr class="dark"><td class="value"><strong>Gando19850304</strong></td><td class="value">tomek: Hi, I am interested in programing, but I am not studying computer-related major. So do you have some advises on how to improve my coding skills?</td></tr>
<tr class="light"><td class="value"><strong>izhari</strong></td><td class="value">algoboy: :))</td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">algoboy: i hate you..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">A list of good books then:</span></td></tr>
<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">patient all, let tomek finish his answers</td></tr>
<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: why did U choose C language???</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">"Programming Pearls" is a very nice book</span></td></tr>
<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">MohamedMonem: talk in english</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">it doesn't really teach you programming, but it will show you how good programmers think</span></td></tr>
<tr class="light"><td class="value"><strong>abs_abs</strong></td><td class="value">tomek: can you tell us about your current work profile ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">and will get you interested</span></td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Introduction to Algorithms is a very hard to read book as Kolstad said.</td></tr>
<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: Please name some Math. Books....</td></tr>
<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: what was your proudest moment?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: yes</span></td></tr>
<tr class="light"><td class="value"><strong>ambuj123</strong></td><td class="value">would u recommend reading Knuth to some 1 in cllg who hs jst startd programming ?</td></tr>
<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">tomek: at acm icpc, we were there at cerc2008 in poland, it was really nice, but what was ur team's method? everyone programming or only one? etc</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: but that's the second book :)</span></td></tr>
<tr class="dark"><td class="value"><strong>mbr1</strong></td><td class="value">tomek: have you ever had a nightmare with petr's challenges</td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">marcadian: just joke :p</td></tr>
<tr class="dark"><td class="value"><strong>mastersobg</strong></td><td class="value">tomek: what is your favourite online judge?</td></tr>
<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What do you mean?</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: The second edition/</td></tr>
<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">marcadian: please don't hate me :D</td></tr>
<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">"Introduction to Algorithms" is a tough to read, but I read it all</span></td></tr>
<tr class="dark"><td class="value"><strong>abhinavkulkarni</strong></td><td class="value">tomek: What did you specifically follow for graph theory?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">early on</span></td></tr>
<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">tomek: how old are you?</td></tr>
<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: How to arrange a good training for yourself so that your training will improve yours? Could you tell me?</td></tr>
<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">marcadian: I'm very sorry mr. marcadian </td></tr>
<tr class="light"><td class="value"><strong>crackerwang</strong></td><td class="value">tomek: what will you do that when you meet a very hard problem</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">desert_lion: I'm 27</span></td></tr>
<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">tomek: what is the way to improve probability skills. I mean books ?</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">tomek: do you have girlfriend :) ?</td></tr>
<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">27 is american age?</td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">algoboy: don't mean it :D i'm not serious</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">abhinavkulkarni: "Introduction to Algorithms" is a perfect reference</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">tomek: why u don't participate in SRMs  ... ?</td></tr>
<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">Sarkin: send me.. :D</td></tr>
<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">zdravko_b: very interesting question :D</td></tr>
<tr class="light"><td class="value"><strong>HeypaBHoBeceH</strong></td><td class="value">tomek: How long have you been a coder (from the very start, before TC)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">abhinavkulkarni: I think everybody will tell you that...</span></td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: some Math Books please</td></tr>
<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">marcadian: at least it's different :P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">and then there is "The Art of Programming", an old classic</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">if you're really tough :)</span></td></tr>
<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: Concrete Math is interesting but Hard to read... :(</td></tr>
<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: How much u read that voluminous book?!</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">it's all in assembly though, you need to be tough</span></td></tr>

<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Sorry for repeating questions but i wanna know how to arrange a good training for yourself so that your training will improve yours? Could you tell me?</td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">hmnn hardcore.</td></tr>

<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">tomek: Have you finished all 3 volumes of Art of computer programming (of course, I should ask all 4 volumes now)</td></tr>

<tr class="light"><td class="value"><strong>monn</strong></td><td class="value">tomek: do you love your job at google?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Concrete Math is also a fantastic book, it gets really difficult at places</span></td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">All Topcoder's problem can solve with "Introduction to Algorithms"?</td></tr>

<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">tomek: did u participate in IOIs ACMs ?</td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: yes </td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">prunthaban: yes, I didn't read it until recently, but I read it pretty much all, it's fun read</span></td></tr>

<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">prunthaban: the 4th volume isn't complete afaik :)</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: can you tell us how to practice basic algorithms when we first learn them</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: All Topcoder's problem can solve with "Introduction to Algorithms"?</td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: are you going to paricicpate in today's SRM</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: while reading, is it like ..read a chapter and solve  problems on that or mix the  topics ??  </td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: World champion in ACM 2006 I think</td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">tomek: can I have TomekAI ? </td></tr>

<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: did u participate in IOIs , ACMs ?</td></tr>

<tr class="light"><td class="value"><strong>AlexErofeev</strong></td><td class="value">desert_lion: in 2003 =)</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: :D:D</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">As for data structures and algorithms reference, "Introduction to algorithms" contains all theory you'll need for a long while</span></td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: yeees</td></tr>

<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: mashy</td></tr>

<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">zdravko_b: Except Facsimile 1, rest are available for sale I think. You get 0,2,3 and 4</td></tr>

<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: :P</td></tr>

<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">tomek:  You've been through it all; programming championships, come from behind victories, grad school and jobs.  My question:  What's your favorite sport?</td></tr>

<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">tomek: You started learning algorithms for competitions since what age?</td></tr>

<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">algoboy: you already have TimoAI :D</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Did you participate in the IOI if yes then when and what medal?</td></tr>

<tr class="dark"><td class="value"><strong>DAle</strong></td><td class="value">tomek: Do you have any ideas how TC community can help topcoder to stay alive?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">CONDOR_316: whatever suits you; I like just reading, but that's just me</span></td></tr>

<tr class="dark"><td class="value"><strong>Gando19850304</strong></td><td class="value">Petr: Hi, Petr. Why are you here? </td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: When did you start learning algorithms.</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: can you tell us how to practice basic algorithms when we first learn them</td></tr>

<tr class="light"><td class="value"><strong>suhendry</strong></td><td class="value">tomek: then, what is your current favorite book? (algorithm topic of course) :-)</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: right</span></td></tr>

<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: How much hours a day you spend studying???</td></tr>

<tr class="dark"><td class="value"><strong>nadeem</strong></td><td class="value">for those interested in his IOI and ACM achievements http://www.cs.purdue.edu/homes/czajkat/czajka.html</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: In study you just read a book?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: these days you have so many resources online..</span></td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">tomek: Reading or practising???</td></tr>

<tr class="dark"><td class="value"><strong>rng_58</strong></td><td class="value">Will you participate in this SRM?</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: without Coding?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: I used to do the Polish Olympiad problems I got from the books they sold, with floppy disks</span></td></tr>

<tr class="light"><td class="value"><strong>rng_58</strong></td><td class="value">tomek: ans = min(ans,dist(x0,y0,x1+2*a,y1+2*a));</td></tr>

<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">tomek: What do you think is the single reason for you being really strong in algorithms. When did you start learning? Just like other targets, do you also believe strong math skills is needed?</td></tr>

<tr class="light"><td class="value"><strong>rng_58</strong></td><td class="value">tomek: Sorry,  Will you participate in this SRM?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: these days, just start doing contests</span></td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">tomek: who is your favourite coder ?</td></tr>

<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What do you think of USACO training program?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">you have SRMS and zillions of other contests online</span></td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: yeah youre right thanks</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">you do a few contests, then you'll see for yourself what you need to learn</span></td></tr>

<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">tomek: do you have a gf?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: it's great</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: I did it</span></td></tr>

<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: What advice would you give: more easy problems or less but hard ones?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">R0N: Accept me.</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: I learned a lot</span></td></tr>

<tr class="dark"><td class="value"><strong>5r5</strong></td><td class="value">tomek: if you don't mind tellin, where do you work? i mean the company?</td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">stjepan: :D:D</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">stjepan: lol</td></tr>

<tr class="light"><td class="value"><strong>mastersobg</strong></td><td class="value">tomek: what is your favourite online judge?</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: how did you train for AMC ICPC ? </td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">5r5: google</td></tr>

<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">5r5: Google!</td></tr>

<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: What advice would you give: more easy problems or less but hard ones?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Lugera: easy problems (for you) teach you implementation skills</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Lugera: hard problems make you think</span></td></tr>

<tr class="dark"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: In order to be like you What is the most important thing between Study new algorithm or solving problem??</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What helped you most in the IOI USACO or other online judje??</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Lugera: whatever you feel like practicing :)</span></td></tr>

<tr class="light"><td class="value"><strong>albert988</strong></td><td class="value">how to learn algorithms well?</td></tr>

<tr class="dark"><td class="value"><strong>5r5</strong></td><td class="value">rajeshsr: oh. thnx. so vrybody knows abt it</td></tr>

<tr class="light"><td class="value"><strong>topzhang</strong></td><td class="value">tomek: can you recommend some books to me about algorathm</td></tr>

<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: Hello, my question is im tryng to learn DP, i think its very important, a lot of coders says its the most important topic with graph theory, what do u think ? </td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: is it too late starting in college to become a top coder</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">tomek: reading or practising?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: many excellent people started in college</span></td></tr>

<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: So after reading some books, what should beginners do?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: compete</span></td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">wilbertliu: practice off course</td></tr>

<tr class="light"><td class="value"><strong>marcadian</strong></td><td class="value">wilbertliu: practice!!</td></tr>

<tr class="dark"><td class="value"><strong>mastersobg</strong></td><td class="value">tomek: what is your favourite online judge?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: either compete, or go get some old problems with test data and solve them</span></td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">wilbertliu: what do you expect? :P</td></tr>

<tr class="light"><td class="value"><strong>ngg</strong></td><td class="value">tomek: at acm icpc, we were there at cerc2008 in poland, it was really nice, but what was ur team's method? everyone programming or only one? etc</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">there are millions of problems online</span></td></tr>

<tr class="light"><td class="value"><strong>wcfairytale</strong></td><td class="value">from the beginner to yellow,how long will it be?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">mastersobg: I like spoj.pl</span></td></tr>

<tr class="light"><td class="value"><strong>TheLoser</strong></td><td class="value">tharis: thanks, boa sorte tb :P nem sei como isto trabalha d':</td></tr>

<tr class="dark"><td class="value"><strong>5r5</strong></td><td class="value">rajeshsr: r u a btech stud?</td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">tomek: why spoj.pl?</td></tr>

<tr class="dark"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: In order to be like you, What is the most important between Study new algorithm,structure or solving problem??</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What helped you most in the IOI USACO or other online judje??</td></tr>

<tr class="dark"><td class="value"><strong>wcfairytale</strong></td><td class="value"> from the beginner to yellow,how long will it be?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: team strategy is a tough one</span></td></tr>

<tr class="dark"><td class="value"><strong>wcfairytale</strong></td><td class="value"> from the beginner to yellow,how long will it be?</td></tr>

<tr class="light"><td class="value"><strong>themaster</strong></td><td class="value">tomek: when you started programming what did you do when you can't solve a problem(if it happens) do you keep trying or ask</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: heeeeeeeeeee</td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: tomek 2al SPOJ</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">ahm.kam_92: :D:D:D</td></tr>

<tr class="light"><td class="value"><strong>vpj</strong></td><td class="value">sanky29288:hi</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: you have to figure it out, explicitly talk about it</span></td></tr>

<tr class="light"><td class="value"><strong>mbr1</strong></td><td class="value">are you a graduated on Math or CS?</td></tr>

<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">tomek: can I have TomekAI ?</td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: Do you have any ideas how TC community can help topcoder to stay alive?</td></tr>

<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What do you think of esoteric languages like brainfuck and whitespace?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: but generally, you want to parallelize rather than work on the same thing</span></td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: when you face a new problem that you can't solve for a few days, what will you do after that?</td></tr>

<tr class="light"><td class="value"><strong>nadeem</strong></td><td class="value">tomek: Yarin was saying that C++ is an ugly language because it doesn't have features like intellisense (of C#) . what do u think </td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">algoboy: it's not as good as it sounds :)</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">algoboy: I'll think about open-sourcing it, only now it's hardcoded to work with my library</span></td></tr>

<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">tomek: we had 2 members thinking generally, and me programming, it was pretty good, we was the best hungarian team, but there were 10 polish teams better than us</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: what is more important between studying new algorithm or solving problem? </td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: when you face a new problem that you can't solve for a few days, what will you do after that?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: I'd keep thinking about it, usually, unless I suspect it's unsolvable</span></td></tr>

<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">tomek: i hope it's coming soon :)</td></tr>

<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: How are you???</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: what makes u so fast at solving problems ?? knowledge of algos or practice ??</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: In SRMs do you use any plugins?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nadeem: C++ really is a very ugly language</span></td></tr>

<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: problems in what area do you like the most</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nadeem: I don't recommend using it</span></td></tr>

<tr class="light"><td class="value"><strong>nadeem</strong></td><td class="value">tomek: then why do you use it?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Why do you think it's ugly?</td></tr>

<tr class="light"><td class="value"><strong>tharis</strong></td><td class="value">tomek: what's your fav programming language?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What language do you recommend?</td></tr>

<tr class="light"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">desert_lion: :D</td></tr>

<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: Hello, my question is im tryng to learn DP, i think its very important, a lot of coders says its the most important topic with graph theory, what do u think ? </td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: it has syntax and semantics that very few people fully understand</span></td></tr>

<tr class="dark"><td class="value"><strong>raaz</strong></td><td class="value">tomek: what language do you suggest to code in topcoder?</td></tr>

<tr class="light"><td class="value"><strong>Mata</strong></td><td class="value">what lenguage do you recomend for contest?</td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: problems in what area do you like the most</td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: should div2 competitors practice the problems of div1 or div2?</td></tr>

<tr class="dark"><td class="value"><strong>TaeYoung</strong></td><td class="value">you are understand all of C++ language?</td></tr>

<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What's wrong with C++ in your opinion?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: and it's just "wrong", e.g. with textual #include to link with other library</span></td></tr>

<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Sometimes i found that some problems were too hard and made me frustated, how to overcome this situation?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: it's because of C, which was designed for very old computers</span></td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Yeah maybe.</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: But still what language do you recommend?</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: C#?</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">bleh.</td></tr>

<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">tomek: so, what would u like to choose language except C++ ??</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: or Java?</td></tr>

<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">tomek: what language do you work with at google?</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: java?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">I use C++ for detailed control</span></td></tr>

<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: Which language is the best???</td></tr>

<tr class="light"><td class="value"><strong>wcfairytale</strong></td><td class="value">tomek: how long do you think it take for a green beginner to get into yellow? :)</td></tr>

<tr class="dark"><td class="value"><strong>mbr1</strong></td><td class="value">tomek: which languages do you know besides C++?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">but I wouldn't mind switching to Java</span></td></tr>

<tr class="dark"><td class="value"><strong>tharis</strong></td><td class="value">tomek: what do u think about Python, though it is not allowed for competitions?</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">tomek: what do you mean by detail control?</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: which division's problems should div2 competitors practice??div1 or div2?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">I would recommend Java or C# for most people</span></td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: problems in what area do you like the most</td></tr>

<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: What IDE/editor do you use?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Okay I'll swtich to C# you're responsible for that. :D :D :D :D</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: e.g. you can control memory usage, data structure layout</span></td></tr>

<tr class="dark"><td class="value"><strong>NotImplemented</strong></td><td class="value">what science problems you are currently working at?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: I like it, but automatic memory management is OK 99% of the time</span></td></tr>

<tr class="dark"><td class="value"><strong>BryanPG</strong></td><td class="value">What do you think about Erlang?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: I use VIM</span></td></tr>

<tr class="dark"><td class="value"><strong>wcfairytale</strong></td><td class="value">tomek: how long do you think it'll take for a green beginner to get into yellow? :)</td></tr>

<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: cool :)</td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: oohh i see..</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">tomek: thank you</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: I tried using Eclipse for C++, but switched back, it just doesn't add enough value for me</span></td></tr>

<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: Debugging?</td></tr>

<tr class="dark"><td class="value"><strong>antid</strong></td><td class="value">what do you think about Korotcevich?</td></tr>

<tr class="light"><td class="value"><strong>ngg</strong></td><td class="value">gdb's the best :P</td></tr>

<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">+1</td></tr>

<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">antid: tourist?</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: which division's problems should div2 competitors practice??div1 or div2?</td></tr>

<tr class="light"><td class="value"><strong>antid</strong></td><td class="value">yeah</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: I don't debug, too slow; other than a "print value" here and there</span></td></tr>

<tr class="light"><td class="value"><strong>desert_lion</strong></td><td class="value">antid: tourist??</td></tr>

<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Hmm.., which one do you prefer, read book first, or facing problems while i read some books?</td></tr>

<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: ok</td></tr>

<tr class="dark"><td class="value"><strong>b0h</strong></td><td class="value">Petr is here waching tomek º_º</td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: I'll try once again, I understand that this not a question for spotlight, but do you have any ideas how TC community can help topcoder to stay alive?</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">b0h: We care.</td></tr>

<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">b0h: :D</td></tr>

<tr class="dark"><td class="value"><strong>TaeYoung</strong></td><td class="value">without debug... wow;;</td></tr>

<tr class="light"><td class="value"><strong>antid</strong></td><td class="value">desert_lion: yes</td></tr>

<tr class="dark"><td class="value"><strong>desert_lion</strong></td><td class="value">antid: why this question? :D</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: but I started out with Turbo Pascal, which is a good IDE</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: (used to be)</span></td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: :|</td></tr>

<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: Do you have your vimrc on the net somewhere?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">nicolodavis: my vimrc is almost empty</span></td></tr>

<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: haha ok</td></tr>

<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">tomek: Will u participate today's SRM ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">DAle: what do you mean?</span></td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: which division's problems should div2 competitors practice??div1 or div2?</td></tr>

<tr class="dark"><td class="value"><strong>sathya.phoenix</strong></td><td class="value">tomek: lol.. i thought ur vimrc would be really complex :)</td></tr>

<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: at what age did you first have some interest in programming/algorithms</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">vexorian: :D</td></tr>

<tr class="light"><td class="value"><strong>amrsaqr</strong></td><td class="value">tomek: will u enter today's srm ?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">vexorian: Then I won't.</td></tr>

<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: Tea or coffee?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Lugera: I started programming on ZX Spectrum when I was about 12</span></td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">vexorian: I think C++ is the best!</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">vexorian: :D</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">vexorian: But I'll think about that.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Lugera: I didn't start learning algorithms until I was 15</span></td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What's ZX Spectrum?</td></tr>

<tr class="dark"><td class="value"><strong>bobi4597</strong></td><td class="value">:)</td></tr>

<tr class="light"><td class="value"><strong>xbit</strong></td><td class="value">tomek: what OS you use?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: tea, coffee makes my head hurt</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">xbit: I use Ubuntu Linux right now</span></td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What's ZX Spectrum?</td></tr>

<tr class="light"><td class="value"><strong>mbr1</strong></td><td class="value">tomek: just like Petr :)</td></tr>

<tr class="dark"><td class="value"><strong>pooja.iiita</strong></td><td class="value">Which one is the best os??</td></tr>

<tr class="light"><td class="value"><strong>stjepan</strong></td><td class="value">I bet everyone will start using ubuntu now :)</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: u work at google ?</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">Sarkin:8-bit computer</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: which division's problems should div2 competitors practice??div1 or div2?</td></tr>

<tr class="light"><td class="value"><strong>xibic</strong></td><td class="value">what u truly believe about life</td></tr>

<tr class="dark"><td class="value"><strong>chtomek</strong></td><td class="value">CONDOR_316: i will start using ZX spectrum</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: div 1</span></td></tr>

<tr class="dark"><td class="value"><strong>antid</strong></td><td class="value">stjepan: i'm already using ubuntu)</td></tr>

<tr class="light"><td class="value"><strong>Lint</strong></td><td class="value">tomek: Do you plan your solutions on paper first or just start coding?</td></tr>

<tr class="dark"><td class="value"><strong>chtomek</strong></td><td class="value">stjepan: i will start using ZX spectrum</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: div2 problem is bad?</td></tr>

<tr class="dark"><td class="value"><strong>marcadian</strong></td><td class="value">stjepan: and VIM LOL </td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: "We have cut back projects, cut some senior level expense, are scrutinizing every expense from travel to technology purchases and so on and, obviously, have reduced member prize amounts and have halted some projects that were contracted out to memb</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: I would recommend practicing also outside topcoder problems, to get more variety</span></td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: (c) jhughes</td></tr>

<tr class="dark"><td class="value"><strong>mbr1</strong></td><td class="value">tomek: Is it true that you programmed video games when you were younger?</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Why you think starting to code first helps less than planing it out on a paper?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: What did you use in the IOI?</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Which method?</td></tr>

<tr class="dark"><td class="value"><strong>stjepan</strong></td><td class="value">mbr1: he said so in the interview</td></tr>

<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">Sarkin: his fingers know what to type ;)</td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: sir but in div 1 am unabe to solve even the 250</td></tr>

<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: do u work in any research proyect in this moment?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">TaeYoung: it's good, but for many people div2 is just a matter of time, while every Div1 problem will teach you something new</span></td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">tomek: do you have a plan to travelling in Asia maybe Indonesia ? :)</td></tr>

<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">tomek: hi</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: yes you are able to solve the 250, just not in 1.5 hours</span></td></tr>

<tr class="dark"><td class="value"><strong>antid</strong></td><td class="value">timur_kz: nerelisin?</td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">yenizelanda: evet bende ilk kez gordum ama baya varmis galiba baksana =)</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">algoboy: I have been to Asia, but not Indonesia</span></td></tr>

<tr class="light"><td class="value"><strong>marcadian</strong></td><td class="value">algoboy: you will provide accomodation and being tour guide LOL</td></tr>

<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">antid: KAZAKHSTAN</td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: financial crisis.. you know</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">DAle: I really don't know</span></td></tr>

<tr class="light"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: so you suggets to keep trying till we get it rite!!!</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">DAle: how we should be helping TopCoder</span></td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">marcadian: I will tell ceemot to do that :P</td></tr>

<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">timur_kz: and U?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: keep thinking first until you're sure how the solution should work</span></td></tr>

<tr class="dark"><td class="value"><strong>timur_kz</strong></td><td class="value">antid: and U?</td></tr>

<tr class="light"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: is it good practice to see others code for hints???</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: and then you don't have to keep trying, you just implement it from start to finish</span></td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">algoboy: ceemot is just too busy :P</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: definitely</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: I do that all the time</span></td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: oh thanks...</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Did you practise a lot before your first SRM in TC?</td></tr>

<tr class="dark"><td class="value"><strong>rem</strong></td><td class="value">tomek: Which programming contest format do you like more: TopCoder or ACM ICPC?</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: how long should we spend on a problem we are not able to solve...we might me missing some algo...??</td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: what's the most difficult area of algorithms according to you?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Sarkin: yes; I did a lot of competitions before I even learned about TC</span></td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Becuase in your first SRM you were yellow.</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: in past, you are studing algorithm very tough?</td></tr>

<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">tomek: which do you think is the hardest algorithm to master</td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: What would you recommend to intermediate people?</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: which online judges do u like. i've seen u on SPOJ and u've done some really difficult problems</td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">felixj: I believe she will like tomek :P</td></tr>

<tr class="dark"><td class="value"><strong>abhinavkulkarni</strong></td><td class="value">tomek: Any good book specifically on data structres you may recommend?</td></tr>

<tr class="light"><td class="value"><strong>mbr1</strong></td><td class="value">Sarkin: he was acm icpc champion</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">pt1989: SPOJ is a nice site, because it allows you so many languages</span></td></tr>

<tr class="light"><td class="value"><strong>algoboy</strong></td><td class="value">felixj: uups, is shu was here ? </td></tr>

<tr class="dark"><td class="value"><strong>DAle</strong></td><td class="value">tomek: Did you like the rap song about you? :)</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">algoboy: wow? what happen between shu and ceemot recently? :P</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">DAle: Which one??</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">DAle: :D</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">DAle: heh, yeah it's funny</span></td></tr>

<tr class="light"><td class="value"><strong>izhari</strong></td><td class="value">algoboy: =)) ada skandal..</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: u do haskell too right?</td></tr>

<tr class="light"><td class="value"><strong>antid</strong></td><td class="value">tomek: how are you practising for tc contests?</td></tr>

<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">DAle: what rap song? pls send a link :P</td></tr>

<tr class="light"><td class="value"><strong>xbit</strong></td><td class="value">DAle: what rap song?</td></tr>

<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">felixj: sstt</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">algoboy: any scandal? :P</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">pt1989: I enjoy programming in Haskell, yes</span></td></tr>

<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What do you think of problems you can only solve in an esoteric language?</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: ok cool</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">algoboy: oohh.. roger that... i'll keep my mouth shut :P</td></tr>

<tr class="dark"><td class="value"><strong>algoboy</strong></td><td class="value">felixj: nothing :p</td></tr>

<tr class="light"><td class="value"><strong>TaeYoung</strong></td><td class="value">tomek: what is your favorite music genre?</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: Would you one day do screencasts :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: fun puzzles</span></td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: do u like open-source ideology?</td></tr>

<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: it is very relevant to computer science if not development</td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">DAle: where can you find it???</td></tr>

<tr class="light"><td class="value"><strong>R0N</strong></td><td class="value">tomek: From where i can see approaches to solve SPOJ problems ? if i need</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">pt1989: Oh really?</td></tr>

<tr class="light"><td class="value"><strong>shankar556288</strong></td><td class="value">DAle: i mean the rap song about tomek</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">vexorian: screencasts, yeah I saw Petr was doing that, it's great</span></td></tr>

<tr class="light"><td class="value"><strong>chtomek</strong></td><td class="value">tomek: is someone out there to whom you go to ask for advice in case of very defficult problem you've got to solve and you cannot (and you dont want to spend days on figuring it out)</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">vexorian: I might do one if I have the time to set it up</span></td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">wow, AC Rush is here</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">vexorian: speed is blinding here</td></tr>

<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">vexorian: cant relate what that is meant to</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: I'd like to see one from a C++ guy that uses vim and debugs by printing :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">chtomek: I think "Educational discussion" is where many people go and get answers to tough questions</span></td></tr>

<tr class="dark"><td class="value"><strong>WindyLancelot</strong></td><td class="value">tomek: what is the most useful graph algorithm to know for TC?</td></tr>

<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">vexorian: get a time machine</td></tr>

<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">vexorian: me too :)</td></tr>

<tr class="light"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: Every thought about posting screencasts?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">vexorian: I usually don't debug by printing, but by code inspection :P</span></td></tr>

<tr class="light"><td class="value"><strong>amrsaqr</strong></td><td class="value">tomek: Will u join today's SRM :D ?</td></tr>

<tr class="dark"><td class="value"><strong>nicolodavis</strong></td><td class="value">tomek: Ever*</td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: Not even printing?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">amrsaqr: no, not today</span></td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: could you PLEASE upload a video if you solving a SRM , like Petr ?</td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: what do you mean by code inspection? do the printf?</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: of*</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: read every line of code to make sure it's correct</span></td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek says debugging is for wusses, real pros don't make mistakes.</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">CONDOR_316: When did Petr do that can you send a link?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: it's perfect to quickly debug short code if you don't have time for unit tests</span></td></tr>

<tr class="dark"><td class="value"><strong>RockFire</strong></td><td class="value">tomek,do you think code inspection is the best habit in debugging?</td></tr>

<tr class="light"><td class="value"><strong>Garbage</strong></td><td class="value">vexorian: lol</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: sure :) hang on :)</td></tr>

<tr class="light"><td class="value"><strong>meyram</strong></td><td class="value">hello i</td></tr>

<tr class="dark"><td class="value"><strong>themaster</strong></td><td class="value">tomek: what algorithm do you think is the most hard to master</td></tr>

<tr class="light"><td class="value"><strong>chtomek</strong></td><td class="value">tomek: i was thinking about kind of authority person, that good that you think he/she might come up with solution faster (maybe former university prof.)</td></tr>

<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">CONDOR_316: where is the screencast of petr?</td></tr>

<tr class="light"><td class="value"><strong>crackerwang</strong></td><td class="value">CONDOR_316: wheere is video?</td></tr>

<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">ngg: in this blog</td></tr>

<tr class="light"><td class="value"><strong>antid</strong></td><td class="value">ngg: in his blog</td></tr>

<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">ngg: upz</td></tr>

<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: in SRMs, which problem do u start with? 250 or any other ?</td></tr>

<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">ngg: in his blog</td></tr>

<tr class="light"><td class="value"><strong>meyram</strong></td><td class="value">hello Igorp_ktl2 </td></tr>

<tr class="dark"><td class="value"><strong>nadeem</strong></td><td class="value">for petr's screencast : google "petr</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">themaster: you mean to implement? there are some really complex algorithms - e.g. maximum matching in arbitrary graphs, graph planarity testing...</span></td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: do you use any editors in SRM's???</td></tr>

<tr class="light"><td class="value"><strong>nadeem</strong></td><td class="value">'s blog : algorithm for dummies"</td></tr>

<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">ngg: double click on Petr's quote</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">tomek: what is your strategy when solving SRM's problems?</td></tr>

<tr class="dark"><td class="value"><strong>Igorp_ktl2</strong></td><td class="value">meyram: hello</td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: That's actually a great idea, practice inspection, thanks.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">shankar556288: yes</span></td></tr>

<tr class="light"><td class="value"><strong>WBocong</strong></td><td class="value">tomek: Which complier do you use?</td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: do the 250 first or 500+ first?</td></tr>

<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What do you think of programmer evolution jokes? Do you think that a beginner should write code which is as simple as possible or shoulde he/she write a code that he finds more comfort to write?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">WBocong: gcc</span></td></tr>

<tr class="light"><td class="value"><strong>RockFire</strong></td><td class="value">code inspection may be the best?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: that's part of your strategy, you have to figure out which gives you better chances to place high</span></td></tr>

<tr class="light"><td class="value"><strong>_sunny</strong></td><td class="value">tomek: You didnot write any problems for TC ever, why?</td></tr>

<tr class="dark"><td class="value"><strong>meyram</strong></td><td class="value">Igorp_ktl2: Where a u from?</td></tr>

<tr class="light"><td class="value"><strong>Sarkin</strong></td><td class="value">Petr: Are you participating today?</td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: wats the best method for challenging in SRM's?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">_sunny: I would love to, I think I am not allowed to, because TC pays for them, and I am on a visa that disallows that</span></td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: why arent u giving today's SRM?</td></tr>

<tr class="light"><td class="value"><strong>meyram</strong></td><td class="value">Fereshte.: Who are you?</td></tr>

<tr class="dark"><td class="value"><strong>DAle</strong></td><td class="value">tomek: Do you know that joke about "IT party" with you on photo was famous at least at russian speaking countries? :)</td></tr>

<tr class="light"><td class="value"><strong>ardiankp</strong></td><td class="value">tomek: you can always reject the payment :)</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">tomek: do you have a liking to a particular language/technology?</td></tr>

<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">hehe</td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: http://narod.ru/disk/2954156000/srm420.avi.html</td></tr>

<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: lot of coders says DP its the most important topic with graph theory, what do u think ? </td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">CONDOR_316: Thanks.</td></tr>

<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: any advice on DP ??</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">CamiloSoto: DP is an important topic</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">CamiloSoto: to learn</span></td></tr>

<tr class="dark"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: its in Russian ..just have to enter the number and click on the green button :)</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: no problem :)</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">CamiloSoto: I think at first you learn it by example, it's just a general approach to solving problems, not a specific algorithm you should learn</span></td></tr>

<tr class="light"><td class="value"><strong>chtomek</strong></td><td class="value">tomek: do you do blind challanges sometimes?</td></tr>

<tr class="dark"><td class="value"><strong>TeCNoYoTTa</strong></td><td class="value">tomek: practicing & reading ... how can i mange the percentage of each to be better</td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: on tco08 semifinal, you tried to solve 1k first but it failed, then on final you went on with same strategy. Why?</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">tomek: do you have a liking towards a language/techmology?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">chtomek: mostly not blind, but many times I know about some edge case that people are likely to get wrong, and search for that quickly</span></td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">tomek: do you prefer working in a particular technology than something else??</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: could you please upload your video ??</td></tr>

<tr class="dark"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: how do u learn practice or books, i mean i read some operations reasearch boooks, this its same topic or different? </td></tr>

<tr class="light"><td class="value"><strong>chtomek</strong></td><td class="value">tomek: good advice ... thanks</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: ha, there was some thinking / probability calculation behind that strategy :)</span></td></tr>

<tr class="light"><td class="value"><strong>_sunny</strong></td><td class="value">tomek: That means you are not allowed to recieve the payments? So the TCO payments?</td></tr>

<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: how long do u try a single problem, outside contests ??</td></tr>

<tr class="light"><td class="value"><strong>timur_kz</strong></td><td class="value">tomek: When did you start studying programming?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: but basically, I was going for a win, and I thought that was the best chance to win</span></td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: Did you contribute problems to the gcj ?</td></tr>

<tr class="dark"><td class="value"><strong>Duc</strong></td><td class="value">tomek: when did you improve in algorithms most rapidly, in high school, university or after that?</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">vexorian: atleast he has not authored any in TC</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">vexorian: I didn't come up with any of the problem's initial ideas</span></td></tr>

<tr class="light"><td class="value"><strong>OlexiyO</strong></td><td class="value">desert_lion: I think the rules aren't published yet</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">vexorian: but I worked on GCJ for many months, and on the problems as well</span></td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">tomek: Testing/system ?</td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: if you're going to implement an algorithm that you've never code, what will you do? google for some examples? or how?</td></tr>

<tr class="light"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: do you use 'hot codes' for SRMs</td></tr>

<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: What do you think of programmer evolution jokes? Do you think that a beginner should write code which is as simple as possible or shoulde he/she write a code that he finds is more comfortable to write?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Duc: I think for programming competitions, I mostly practiced in high school for IOI and university for ACM ICPC</span></td></tr>

<tr class="dark"><td class="value"><strong>MohammadReza</strong></td><td class="value">tomek: your feature about style of programming contest was great</td></tr>

<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">tomek: why don't you take part in today's srm?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: I don't know what jokes</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: but both</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Repentinus: at the same time</span></td></tr>

<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: U have a blog like Petr?</td></tr>

<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: and Petr's challenge in last second.. have you felt like you're not gonna make it ? </td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">rajeshsr: no, I do not have a blog</span></td></tr>

<tr class="dark"><td class="value"><strong>janux</strong></td><td class="value">tomek: What is the best path to be taken to learn dynamic programming?</td></tr>

<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">tomek: how better are you in algorithms now than the time in high school? 2x, 3x or more :p</td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: do you use 'hot codes' for SRMs</td></tr>

<tr class="light"><td class="value"><strong>felixj</strong></td><td class="value">tomek: if you're going to implement an algorithm that you've never code, what will you do? google for some examples? or how?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ortschun: that was a desperate shot...</span></td></tr>

<tr class="light"><td class="value"><strong>CamiloSoto</strong></td><td class="value">tomek: operations reasearch books about DP, its good way to learn DP like lieberman or tahha ? </td></tr>

<tr class="dark"><td class="value"><strong>MohammadReza</strong></td><td class="value">tomek: "your feature article about style of programming contest was great" do you want to add some more advice?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Duc: I have learned a lot of theory in the meantime, and I have a lot more experience ...</span></td></tr>

<tr class="dark"><td class="value"><strong>muntasir_120</strong></td><td class="value">tomek: so, you were involved in setting up the GCJ's contest system?</td></tr>

<tr class="light"><td class="value"><strong>RockFire</strong></td><td class="value">tomek,why do you prefer code inspection?</td></tr>

<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: your favourite programmer ? :P</td></tr>

<tr class="light"><td class="value"><strong>TeCNoYoTTa</strong></td><td class="value">tomek: practicing on TopCoder or Reading books ... how can person manage these ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">felixj: understand how it works</span></td></tr>

<tr class="light"><td class="value"><strong>zdravko_b</strong></td><td class="value">tomek: do you think there will be gcj 2009?</td></tr>

<tr class="dark"><td class="value"><strong>WindyLancelot</strong></td><td class="value">tomek: What graph algorithm have you found most useful in TC?  If you have to choose one.</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">muntasir_120: yes</span></td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: do you use 'hot codes' for SRMs</td></tr>

<tr class="light"><td class="value"><strong>vexorian</strong></td><td class="value">good news everyone.</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">tomek: by the way..do you go along well with Petr</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">zdravko_b: I don't think that's decided yet</span></td></tr>

<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: Before spoj,how u used to practice? When u are at high school preparing for IOI, I don't think spoj existed, right?</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">vexorian: what??</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">samshu: tomek thinks there will be a gcj.</td></tr>

<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">tomek: you said you usually debug by code inspections. do you mean you only do this when you cannot find incorrect test case?</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">hii evryone</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">rajeshsr: right, it didn't exist, and I didn't have access to internet at home for a while; I would get all the past problems from previous polish olympiads and IOIs</span></td></tr>

<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">vexorian: he said it's not decided</td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">hiii tomek</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">rajeshsr: and write solutions for them</span></td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">vexorian: oh..i'd rather prefer more SRM's</td></tr>

<tr class="dark"><td class="value"><strong>vexorian</strong></td><td class="value">zdravko_b: I said good news everyone before that.</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: will you take rank 2 from acrush after this match :))</td></tr>

<tr class="dark"><td class="value"><strong>zdravko_b</strong></td><td class="value">vexorian: you still mean it :) ?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">khanhptnk: if ACRush competes and falls, then maybe; I'm going to have to go to work</span></td></tr>

<tr class="dark"><td class="value"><strong>innocentboy</strong></td><td class="value">tomek: are you competing today ? :)</td></tr>

<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: Great, what will u do, if u don't see the solution?</td></tr>

<tr class="dark"><td class="value"><strong>Duc</strong></td><td class="value">tomek: sometimes i cannot get accepted for a problem although i read every line of code and see nothinig wrong. I cannot find any incorrect test case also. then what to do in these case : p</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">tomek: do you get along well with Petr?</td></tr>

<tr class="dark"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek: Tell your boss that you'll quit if you can't participate in SRMs :D</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">rajeshsr: if I truly can't see a solution, I would let it go for a while; but it's rare, I'm persistent :)</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">samshu: of course, Petr is a nice guy</span></td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">tomek, did u ever have concerns with the maths during programming?</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">progfool: i really really doubt that</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Duc: read again :P</span></td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">progfool: tomek is the concern</td></tr>

<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">progfool: he doesnt have concerns :P</td></tr>

<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek didn't register for today's match yet... :(</td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">ohh yaa.....:))</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">what do i do if i want to improve the maths......actually computational maths</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">tomek: do you think rankings/ratings say all about coding skills?</td></tr>

<tr class="dark"><td class="value"><strong>WBocong</strong></td><td class="value">tomek: Thanks for your advices!</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: do you have any methods to improve the accuracy of programming ?</td></tr>

<tr class="dark"><td class="value"><strong>mbr1</strong></td><td class="value">tomek: how far can someone go in algorithm competitions if he's not a genius at math?</td></tr>

<tr class="light"><td class="value"><strong>daiwb</strong></td><td class="value">tomek: Any suggestion on the books to read to improve algorithm and math? :)</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: what do i do if i want to improve my maths</td></tr>

<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: how to improve in math for programming ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">progfool: then study maths; read Concrete Mathematics</span></td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">tomek: thank you.......</td></tr>

<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: is Concrete Math enough ??</td></tr>

<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">suhendry: yes, how abt you</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: does coming from a university with a poor coding culture gives u no chance of competiting with the better ones?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">khanhptnk: write pretty, well structured code; don't rush it</span></td></tr>

<tr class="dark"><td class="value"><strong>mohan8990</strong></td><td class="value">tomek: I m just a beginner. How to enhance my coding ability. Also suggest me a book for c++ and Data Structures pls</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">khanhptnk: then it's more likely to be correct and easier to fix any bugs</span></td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: i heard that ull rarely need to debug ur codes....u can run it the first time u code...is it true??</td></tr>

<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: do u think Concrete Math is enough for maths ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">pt1989: you university doesn't matter, we are living in a global society</span></td></tr>

<tr class="light"><td class="value"><strong>Aleks</strong></td><td class="value">tomek: is Daniel Czajka your brother? =)</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">tomek: how much has TC helped you at work?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">progfool: yes, it's true :P</span></td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: yes but i spend so much of my time in useless activities</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Aleks: no</span></td></tr>

<tr class="dark"><td class="value"><strong>adrianoo07</strong></td><td class="value">tomek: have you got girlfriend?</td></tr>

<tr class="light"><td class="value"><strong>cjoakes22</strong></td><td class="value">Thank you tomek and everyone else for joining this chat. There are 5 more minutes left. Please ask your last questions at this time.</td></tr>

<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">tomek: i think people in better universities do better things</td></tr>

<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: do you have a daily training?</td></tr>

<tr class="dark"><td class="value"><strong>moshiur</strong></td><td class="value">tomek: do u think Concrete Math is enough for maths ?</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: are you an easygoing person ? :))</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: I don't do much training per se these days</span></td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">tomek: how do i practice so that i can even code like that</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: is there any wel defined approach?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: I used to, when I had a lot of free time, to practice for the ACM contest a lot</span></td></tr>

<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: have you ever felt frustrated on your ability ?</td></tr>

<tr class="light"><td class="value"><strong>vivekmrathod</strong></td><td class="value">concrete math is a about recursions, number theory and also had some nice algos</td></tr>

<tr class="dark"><td class="value"><strong>okidogi</strong></td><td class="value">tomek: what do you mean by a lot?</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: i mean when you can't solve a problem, what do you think ?</td></tr>

<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: why u don't compete much in SRMs these days.</td></tr>

<tr class="light"><td class="value"><strong>sushil2006090</strong></td><td class="value">ny1 from IIIT A</td></tr>

<tr class="dark"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: ?</td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">and Petr is also listening i guess........please can u answer one question?...</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">okidogi: 2-3 times a week, I would sit down for 4 hours and write code</span></td></tr>

<tr class="light"><td class="value"><strong>FameofLight</strong></td><td class="value">litwin: only english</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">okidogi: anyway, I do that even more at work these days :)</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">okidogi: just different kind of code</span></td></tr>

<tr class="dark"><td class="value"><strong>felixj</strong></td><td class="value">tomek: just 4 hours?</td></tr>

<tr class="light"><td class="value"><strong>amrsaqr</strong></td><td class="value">tomek: being a good problem solver, is it a gift, or something that develops by practicing and reading ??</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">Petr: Do you do work with C# in google???</td></tr>

<tr class="light"><td class="value"><strong>pll</strong></td><td class="value">tomek: Do you think a graduate student is too late to learn Algorithm like students in highschool or universities?</td></tr>

<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">tomek: if u look at acm standings (http://cepc08.ii.uni.wroc.pl/standings.html) why do u think that there are so many great polish teams (9 out of the top10 is polish)</td></tr>

<tr class="light"><td class="value"><strong>pszemsza_</strong></td><td class="value">tomek: not sure whether someone asked about that: what do you do in google?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">amrsaqr: I think it's mostly a learned skill; I used to be more of a math person, until I met people doing programming competitions at math camps</span></td></tr>

<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: U strated from Maths olympiad?</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">progfool: i think he is not</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">pszemsza_: currently I work on managing resources in datacenters</span></td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">samshu: yes..perhaps:(</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: i mean when you can't solve a problem, what do you think ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">rajeshsr: yes, I did the math olympiad</span></td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">progfool: if i remember correctly what he said in his spotlight session</td></tr>

<tr class="dark"><td class="value"><strong>Duc</strong></td><td class="value">tomek: could you still maintain good university result when practicing for acm :p</td></tr>

<tr class="light"><td class="value"><strong>auror</strong></td><td class="value">tomek: were you involved in organizing the last GCJ too?</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">samshu:what??</td></tr>

<tr class="light"><td class="value"><strong>RockFire</strong></td><td class="value">tomek,do you have any strategy to decrease the time on debuging?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: I am not sure, but we have a lot of high school people doing competitions in Poland</span></td></tr>

<tr class="light"><td class="value"><strong>qinhaotian</strong></td><td class="value">hi guys</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: so it's a large, competetive groups of people</span></td></tr>

<tr class="light"><td class="value"><strong>qinhaotian</strong></td><td class="value">lets have fun coding today :)</td></tr>

<tr class="dark"><td class="value"><strong>qinhaotian</strong></td><td class="value">GOOOD LUCK TO U ALL &lt;3</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">auror: yes, I was</span></td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">progfool: something other than c#</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">progfool: ;)</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: How were u feeling during the systest at TC) this year??</td></tr>

<tr class="light"><td class="value"><strong>qinhaotian</strong></td><td class="value">How is everyone doing today sirs?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">tomek: Thanks for the answers.</td></tr>

<tr class="light"><td class="value"><strong>RockFire</strong></td><td class="value">tomek,do you have any strategy to decrease the time on debuging?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">Duc: ha, that's a good one, but mostly yes</span></td></tr>

<tr class="light"><td class="value"><strong>MohammadReza</strong></td><td class="value">Fereshte.: ha ha</td></tr>

<tr class="dark"><td class="value"><strong>Lotus</strong></td><td class="value">He's still here</td></tr>

<tr class="light"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: have a excellent work day ! :))</td></tr>

<tr class="dark"><td class="value"><strong>TeCNoYoTTa</strong></td><td class="value">amrsaqr: aha ..... okZ ya 3amot :D</td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">tomek:.jus one question plzz....tomek.....how were u feeling during the systest at TCO this year??</td></tr>

<tr class="dark"><td class="value"><strong>khanhptnk</strong></td><td class="value">tomek: have an excellent work day ! :))</td></tr>

<tr class="light"><td class="value"><strong>samsam</strong></td><td class="value">tomek: do you participate today?</td></tr>

<tr class="dark"><td class="value"><strong>Sarkin</strong></td><td class="value">samsam: NO!</td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: do you have any local polish TC community?</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: is bzz perhaps!!!!!</td></tr>

<tr class="light"><td class="value"><strong>xjtuhyh</strong></td><td class="value">pt1989: tomek will be here for a long time if he do not compete srm today?</td></tr>

<tr class="dark"><td class="value"><strong>samsam</strong></td><td class="value">Sarkin: you are not tomek.</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">progfool: I was quite confident, relieved that Petr didn't manage to get more than 3 challenges more than me after all :)</span></td></tr>

<tr class="dark"><td class="value"><strong>cjoakes22</strong></td><td class="value">This is the conclusion of this chat with tomek. You may discuss this Spotlight Session in the TC forums at http://forums.topcoder.com/?module=Thread&threadID=629178&start=0. Thanks again everyone!</td></tr>

<tr class="light"><td class="value"><strong>knuthy</strong></td><td class="value">Good luck for you all </td></tr>

<tr class="dark"><td class="value"><strong>prunthaban</strong></td><td class="value">Bye tomek!</td></tr>

<tr class="light"><td class="value"><strong>moshiur</strong></td><td class="value">GOOD LUCK......</td></tr>

<tr class="dark"><td class="value"><strong>shankar556288</strong></td><td class="value">tomek: Thank You Tomek!!!</td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">thanks everyone, have a good match</span></td></tr>

<tr class="dark"><td class="value"><strong>ngg</strong></td><td class="value">tomek: i dunno if u were studying in the university of warsaw, but there were 3 teams in top10 from that university, do they have lots of lectures about algorithms, etc?</td></tr>

<tr class="light"><td class="value"><strong>DAle</strong></td><td class="value">tomek: thank you anyway :)</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: i watched the match....u did an excellent challenge....the last one ....perhaps john's he got segmentation fault</td></tr>

<tr class="light"><td class="value"><strong>CONDOR_316</strong></td><td class="value">tomek: Thank you for the help :)</td></tr>

<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">is there a way to become colourless??</td></tr>

<tr class="light"><td class="value"><strong>samshu</strong></td><td class="value">;)</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: that was soo thrilling!!!!!!!!!!!!!!!</td></tr>

<tr class="light"><td class="value"><strong>Repentinus</strong></td><td class="value">tomek:  Thanks.</td></tr>

<tr class="dark"><td class="value"><strong>emotionalBlind</strong></td><td class="value">tomek: thanks a lot :)</td></tr>

<tr class="light"><td class="value"><strong>yacek</strong></td><td class="value">hf & gl ;)</td></tr>

<tr class="dark"><td class="value"><strong>qinhaotian</strong></td><td class="value">where are u vector?</td></tr>

<tr class="light"><td class="value"><strong>elmariachi1414</strong></td><td class="value">tomek: Thanks!</td></tr>

<tr class="dark"><td class="value"><strong>pszemsza_</strong></td><td class="value">ngg: yeah, they have</td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: thank you so much for answering out questions</td></tr>

<tr class="dark"><td class="value"><strong>antid</strong></td><td class="value">good luck</td></tr>

<tr class="light"><td class="value"><strong>progfool</strong></td><td class="value">tomek: thnkz anyways tomek....it was soooooo good talking to u.....and thnks for all those help</td></tr>

<tr class="dark"><td class="value"><strong>muntasir_120</strong></td><td class="value">tomek: thanks</td></tr>

<tr class="light"><td class="value"><strong>rajeshsr</strong></td><td class="value">tomek: Thanks! Wish u compete a lot in more SRMs and give us ur great codes!</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">ngg: just a lot of people at Warsaw do competitions</span></td></tr>

<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Thanks tomek.. :)</td></tr>

<tr class="dark"><td class="value"><strong>progfool</strong></td><td class="value">tomek: good luck at work...</td></tr>

<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">tomek: thank you so much for answering our questions</td></tr>

<tr class="dark"><td class="value"><strong>Lugera</strong></td><td class="value">tomek: thanks!!!</td></tr>

<tr class="light"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: If you are a coach, what will you do to improve beginner?</td></tr>

<tr class="dark"><td class="value"><strong>amrsaqr</strong></td><td class="value">tomek: thanx tomek, good luck :)</td></tr>

<tr class="light"><td class="value"><strong>ngg</strong></td><td class="value">tomek: thx anyway</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: try solving a bunch of problems, then you'll see what you need to learn for yourself</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">tomek</span></td><td class="value"><span class="bigRed">wilbertliu: just need to realize what you don't know</span></td></tr>

<tr class="dark"><td class="value"><strong>wilbertliu</strong></td><td class="value">tomek: Oh.., okay.., thanks anyway.. :)</td></tr>






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