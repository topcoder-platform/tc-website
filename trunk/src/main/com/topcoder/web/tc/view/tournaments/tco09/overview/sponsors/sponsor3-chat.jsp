<%--
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.  
 *
 * This JSP shows specific information about sponsor 1.
 *
 * Author TCSDEVELOPER
 * Version 1.0
 * Since 2009 TopCoder Open Site Integration
--%>
<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
        
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<title>TCO 09 : Tournament Overview</title>

<!-- Meta Tags -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<!-- External CSS -->
<link rel="stylesheet" href="css/tournaments/tco09.css" media="all" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<!--[if IE 6]>
<link rel="stylesheet" type="text/css" media="screen" href="css/screen-ie6.css" />
<![endif]-->

<!-- External JavaScripts -->
<script type="text/javascript" src="/js/tournaments/tco09/jquery-1.2.6.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/jquery.backgroundPosition.js"></script>
<script type="text/javascript" src="/js/tournaments/tco09/scripts.js"></script>
<script type="text/javascript" src="/js/arena.js"></script> 
<style type="text/css">
<!--
.style2 {color: #FF0000}
-->
</style>
</head>

<body id="page">

    <div id="wrapper">
        <div id="wrapperInner">
            <div id="wrapperContent">
                
                <div id="wrapperContentInner">
                    <jsp:include page="../../header.jsp"/>
                    
                    <jsp:include page="../../mainNav.jsp" >
                        <jsp:param name="mainTab" value="overview"/>
                    </jsp:include>
                    
                    <div id="content">
                            <div class="contentTopLeft"><div class="contentTopRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                            <div id="contentInner" class="contentInner">
                            
                                <div id="contentInnerInner">

                                    <jsp:include page="../topArea.jsp"/>
                                
                                    <div class="bottomArea">
                                        <div class="bottomLeft"><div class="bottomRight">
                                            
                                            <jsp:include page="../../secondaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="sponsors"/>
                                            </jsp:include>

                                            <jsp:include page="../../tertiaryNav.jsp" >
                                                <jsp:param name="mainTab" value="overview"/>
                                                <jsp:param name="secondaryTab" value="sponsors"/>
                                                <jsp:param name="tertiaryTab" value="sponsor3"/>
                                            </jsp:include>
                                            
                                            <div class="bottomAreaContent">
                                                
                                                <div class="mainContent">
                                                    <div id="mainContentInner">
                                                        <div>
                                                            <div class="pageContent">
                                                                <h2 class="title">Facebook</h2>
                                                                
                                                                <h3 class="subtitle">TCO Chat Session Transcript</h3>
                                                                	<p>
                                                                    <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                                                                        <tr>
                                                                            <th>Handle</th>
                                                            
                                                                            <th>Comment</th>
                                                                        </tr>
                                                                        
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">Welcome to the Facebook Chat Room!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">Welcome to the Facebook/TopCoder SRM 447</span></td></tr>
<tr class="light"><td class="value"><strong>TAG</strong></td><td class="value">jmpld40: ;-) </td></tr>
<tr class="dark"><td class="value"><strong>FameofLight</strong></td><td class="value">FB_Clifton: what are the opportunities in India</td></tr>
<tr class="light"><td class="value"><strong>AnilKishore</strong></td><td class="value">jmpld40: same to you</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">yay! and hello </span></td></tr>
<tr class="light"><td class="value"><strong>Rajat_Mathur90</strong></td><td class="value">Hello</td></tr>
<tr class="dark"><td class="value"><strong>shiv_vic123</strong></td><td class="value">Hi all </td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">we currently don't don't have developer opportunities in India at the moment but we do sponsor visas and offer relocation assistance</span></td></tr>
<tr class="dark"><td class="value"><strong>Evadez</strong></td><td class="value">welcome facebook ppl</td></tr>
<tr class="light"><td class="value"><strong>deepfritz01</strong></td><td class="value">Do you have an internship duration? or is it completely dependent on the work assigned to intern?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Hey everyone, thanks for joining us</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">FameofLight: Our internships are usually 12 weeks in duration.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">internships are generally about 12 weeks long</span></td></tr>
<tr class="light"><td class="value"><strong>mbr1</strong></td><td class="value">do you have work for unexperienced young non students good for nothing programmers that love to code?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">FameofLight: Oh yes!</span></td></tr>
<tr class="light"><td class="value"><strong>dirtydeeds</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><strong>jaher</strong></td><td class="value">Is there an office in Europe for software engineers?</td></tr>
<tr class="light"><td class="value"><strong>Drahkir</strong></td><td class="value">Hi, are there any internship opportunities available for CS majors?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">@Drahkir-- YES</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">(Sorry, still learning this thing.) Right now all of our engineering occurs in Palo Alto, CA.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">@jaher</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">mbrl: Your coding ability is generally the most valuable thing to us - more than various credentials</span></td></tr>
<tr class="dark"><td class="value"><strong>dchana</strong></td><td class="value">how do you determine our coding abilities/</td></tr>
<tr class="light"><td class="value"><strong>kromm</strong></td><td class="value">Palo Alto? Do you happen to pay in those nifty IOUs? :P</td></tr>
<tr class="dark"><td class="value"><strong>Drahkir</strong></td><td class="value">I'm going to Indiana University.  If I were to be accepted for a FB internship, would I need to relocate?</td></tr>
<tr class="light"><td class="value"><strong>abm</strong></td><td class="value">do people pursuing graduation have internship opportunities?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">dchana: www.facebook.com/careers/puzzles.php is a good place to start</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">you can show us your skills by solving one of our puzzles </span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">Do you consider the FB Puzzles solutions?</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">Hi everybody!</td></tr>
<tr class="dark"><td class="value"><strong>TiKay</strong></td><td class="value">do you also support visas for international interns?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">http://www.facebook.com/careers/puzzles.php</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">@drahkir - yes all of our internships require relocation to Palo Alto, CA</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">dchana: Once you get an interview we put you through pretty rigorous coding exercises</span></td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">hi all</td></tr>
<tr class="light"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">FB_Tim: Are those exercises mostly algorithmic or mostly framework-ish?</td></tr>
<tr class="light"><td class="value"><strong>nittu</strong></td><td class="value">Om what basis u are going to call for interview?????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">@el_vitucho yes we strongly consider puzzle submissions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">MauricioC: We have a variety of coding questions to test those skills as well as high-level architecture questions</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">it shows that you can code if you can get past the hard puzzles</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">el_vitucho: A correct puzzle solution will probably get you an interview</span></td></tr>
<tr class="dark"><td class="value"><strong>TheVipeer</strong></td><td class="value">Are there internship opportunities for students from outside the US? Do you sponsor visas?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">MauricioC: for example you may be asked to design a large system similar to something used at facebook, then asked to implement a couple small parts of it</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">FB_David: how many puzzles do i need to solve to get an interview?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">el_vitucho: The difficulty of the puzzle and quality of your code are definitely taken into account</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">FB_David: cause i did like 5</td></tr>
<tr class="light"><td class="value"><strong>dchana</strong></td><td class="value">how many puzzles do I have to solve to know I will expect a call from fb?</td></tr>
<tr class="dark"><td class="value"><strong>nittu</strong></td><td class="value">u will call for for onsite interview or it will be telephonic????</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">TheVipeer: Yes, we offer internship opportunities for international students.  We offer visa sponsorship visas.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">TheVipeer: yes we sponsor visas</span></td></tr>
<tr class="light"><td class="value"><strong>paramaggarwal</strong></td><td class="value">FameofLight: Hi, I am also from your coll. Who is it?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">@nittu if you are not in the area, then the first interview will be via phone</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">TheVipeer: if you're a solid engineer, we'll make it work</span></td></tr>
<tr class="dark"><td class="value"><strong>Rajat_Mathur90</strong></td><td class="value">he is Hemant Verma sir</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">good, so any country can participate</td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">FB_Tim: Ah, I see. Cool! And how big are the algorithmic needs at facebook?</td></tr>
<tr class="light"><td class="value"><strong>dchana</strong></td><td class="value">how do we practice and become good at the type of coding that facebook wants?</td></tr>
<tr class="dark"><td class="value"><strong>Rajat_Mathur90</strong></td><td class="value">One of the better coders in 4th yr</td></tr>
<tr class="light"><td class="value"><strong>ahmed.helal</strong></td><td class="value">FB_Clifton: Are the internships bounded by a certain start/end date or is it just a 3 month intership that starts whenever suitable ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">MauricioC: There's a huge amount of interesting work all over the company =)</span></td></tr>
<tr class="light"><td class="value"><strong>adamuu</strong></td><td class="value">I solved the sophie problem.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">MauricioC: Aside from what you see on the main site there is a ton of algorithmic processing going on to make it all work</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">ahmed.helal: A majority of our interns starts during the summer months in the June - August timeframe.  However we have interns here at other times in the year too.  We typically follow the academic calendar.</span></td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">E se algu√©perguntar em portugues, quem responde? rs</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">are there any age boundaries?</td></tr>
<tr class="dark"><td class="value"><strong>dirtydeeds</strong></td><td class="value">will you be interested in programmers in division2</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">code</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">luizrrodrigues: Hablo espanol.</span></td></tr>
<tr class="light"><td class="value"><strong>ahmed.helal</strong></td><td class="value">FB_Clifton: It is just that the academic calendar may differ from a country to another, not much though the difference could be a month or two.</td></tr>
<tr class="dark"><td class="value"><strong>tsebayoth</strong></td><td class="value">luizrrodrigues: Acho que precisa ser em ingl√™</td></tr>
<tr class="light"><td class="value"><strong>tsebayoth</strong></td><td class="value">luizrrodrigues: :)</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Facebook folks:  what's it like to work at Facebook, the atmosphere and such?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">dirtydeeds: sure, if you can prove you're good we'll hire you. We suggest you take a crack at some of our puzzles</span></td></tr>
<tr class="dark"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: you work in C# or C++ ? what is facebook built on  or do people work on php</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">CodeRacer no age limits</span></td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">tsebayoth: N√£manjo nada de ingl√™..</td></tr>
<tr class="light"><td class="value"><strong>nittu</strong></td><td class="value">will you call for interview on thebasis of the result of this srm????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">FB_Matt: Facebook = awesometown</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">ahmed.helal: We can definitely work with you on the exact dates should it get to that point.</span></td></tr>
<tr class="dark"><td class="value"><strong>tsebayoth</strong></td><td class="value">luizrrodrigues: acho que n√£existe escrit√≥ aqui no brasil do facebook</td></tr>
<tr class="light"><td class="value"><strong>adamuu</strong></td><td class="value">**adamuu quotes Dilbert. "We don't like to use the 'O' word..."</td></tr>
<tr class="dark"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt: speaking of which, why there are no ranking lists for solvers of your puzzles?</td></tr>
<tr class="light"><td class="value"><strong>tsebayoth</strong></td><td class="value">luizrrodrigues: ent√£o ingl√™√©ecess√°o</td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">FB_Clifton: Ol√°que oportunidade algu√©que n√£fala em ingl√™tem?</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Clifton: you work in C# or C++ ? what is facebook built on  or do people work on php</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: The front-end is generally php and javascript, which I spend some time on.  We started an open-source project called thrift that allows for language-agnostic client-server architectures that lets you work in basically whatever language you like</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">supo: You should check out Dinosaur Island, there's a highscore table for it</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: I do a lot of work in java, but C++ is also very popular</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: want to build it?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: we have a puzzles badge</span></td></tr>
<tr class="light"><td class="value"><strong>nittu</strong></td><td class="value">FB_Tim:  will you call for interview on thebasis of the result of this srm????</td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">tsebayoth: Realmente</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">luizrrodrigues: Lo siento - hablo espanol solo.</span></td></tr>
<tr class="dark"><td class="value"><strong>agsharath</strong></td><td class="value">FB_</td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">Why aren't you using an online judge (almost instant response) for your puzzles ? :)</td></tr>
<tr class="dark"><td class="value"><strong>agsharath</strong></td><td class="value">FB_</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">nittu: maybe, if you opt-in to be contacted and you do a great job =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">el_vitucho: I'll check into your case and have our recruiters get in touch with you</span></td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt:  I just found about your puzzles 2 days ago, solved only 2 green ones and found out there is no global ranklist.. that is kind of dissapointing for people brought up at the topcoder ;-)</td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">FB_Clifton: Okay, I use a translator ... rs</td></tr>
<tr class="light"><td class="value"><strong>dchana</strong></td><td class="value">how do we improve our coding skillst that is suitable for facebook?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">puzzles link here - http://www.facebook.com/careers/puzzles.php</span></td></tr>
<tr class="light"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: Hi Clifton, do you remember me? sharath from columbia univ</td></tr>
<tr class="dark"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_* DO you mainly write a lot of code or you have some modelling platform?</td></tr>
<tr class="light"><td class="value"><strong>ahmed.helal</strong></td><td class="value">FB_Clifton: Are there internship opportunities for designers as well ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: yeah I agree, just need more developers to build out cool things like that</span></td></tr>
<tr class="light"><td class="value"><strong>AjJi</strong></td><td class="value">FB_Matt: Why aren't you using an online judge (almost instant response) for your puzzles instead of this "every 4hours" check ? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">agsharath: Yes!  How are you?</span></td></tr>
<tr class="light"><td class="value"><strong>jaher</strong></td><td class="value">what kind of internships do you have? Software engineer, UX designer ..., etc?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">ahmed.helal: yes!  there are designer internships </span></td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">why dont you give some another motivation to solve the puzzles? like more albums limits or smthing like that?</td></tr>
<tr class="dark"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: good! so is FB planning to come to columbia ?</td></tr>
<tr class="light"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: this fall ?</td></tr>
<tr class="dark"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: do you focus more on distributed algorithms or  multi-core (parallel) algorithms ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">dchana: personally, working to get lightning fast at simpler topcoder problems was some of the best practice for getting a job here</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">agsharath: Unfortunately we've decided to focus our attention on fewer schools this year.</span></td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt:  I wonder, how many people and how much of their time is devoted to puzzles (creating new ones, adding features etc)?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">TiKay</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">agsharath: However, feel free to spread word about FB at Columbia.</span></td></tr>
<tr class="dark"><td class="value"><strong>dchana</strong></td><td class="value">FB_Tim: thanks!</td></tr>
<tr class="light"><td class="value"><strong>ahmed.helal</strong></td><td class="value">FB_Mary_Ann: what qualifies for a designer internship then ? i dont think its the puzzles also, is it ? :)</td></tr>
<tr class="dark"><td class="value"><strong>dchana</strong></td><td class="value">FB_Tim: Thanks</td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_David:  I've already seen the problem statement of that one, sounds like fun ;-)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: just a few, tim and david chatting here build our puzzles</span></td></tr>
<tr class="light"><td class="value"><strong>MauricioC</strong></td><td class="value">el_vitucho: How does "a possible job at Facebook" sound worse than "more album pictures"?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: Well in generally we are fans of multi-core work, but we also do a lot of distributed stuff</span></td></tr>
<tr class="light"><td class="value"><strong>MauricioC</strong></td><td class="value">el_vitucho: Plus, it would just encourage cheating</td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">i want to apply facebook</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">so do i</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: we use a lot of hadoop and other open-source distributed tools to keep everything running</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">but they dont reply :) </td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">MauricioC: Im asking that cause i solved some puzzles</td></tr>
<tr class="light"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: Sure, I'm interested in full time oppurtunities in FB, I'll be graduating this december. What do you suggest to do to get a call</td></tr>
<tr class="dark"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt:  and I guess it is not their priority #1 job right?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">if you'd like to apply for our careers, show your interested here - http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=eventSponsor3Confirm</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">MauricioC: and after that i didnt get enough motivation to solve them all</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim:  hadoop is java right ? so no database , just key-value pairs</td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">el_vitucho: Oh, that makes much more sense. Sorry.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">vpramod: Our apologies... we try our hardest to get back to all candidates.</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">MauricioC: i mean, theres one new puzzle every month</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: Yeah, but we do have a huge distributed database and cache system as well</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">MauricioC: or something like that</td></tr>
<tr class="light"><td class="value"><strong>dchana</strong></td><td class="value">how much do junior engineers make at FB?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: we definitely have some sql wizards around the office</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">i applied once and after that .. your submission system dont take my resume </td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">el_vitucho: You're way better than me at that, I just found out about FB puzzles :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: did you express interest in FB?</span></td></tr>
<tr class="dark"><td class="value"><strong>yellowgreen</strong></td><td class="value">hello</td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">even my updated resume</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">agsharath: A great way to get noticed is to solve a puzzle and attach your resume to the submission - it will get forwarded directly to our recruiters if the submisison is correct... it's how I got my interview</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">yes</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: send it to us</span></td></tr>
<tr class="light"><td class="value"><strong>joncalhoun</strong></td><td class="value">FB_Clifton: Did FB create the problems being used in today's SRM?</td></tr>
<tr class="dark"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">FB_Clifton: What chance a person who does not speak English have?</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: why do you need SQL when you use hadoop ? Aren't those different.</td></tr>
<tr class="dark"><td class="value"><strong>kevmo314</strong></td><td class="value">Does Facebook have any internships?</td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">where ?</td></tr>
<tr class="dark"><td class="value"><strong>ntn</strong></td><td class="value">is FB hiring in California?</td></tr>
<tr class="light"><td class="value"><strong>Shinta</strong></td><td class="value">Hi, do you have a recruitment plan for LatinAmerica?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">luizrrodrigues: it's important for everyone to speak english here</span></td></tr>
<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">FB_Clifton: Hello! Does FB have any intership to work online?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">Which countries does FB have workplaces in ?</td></tr>
<tr class="light"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: Awesome. when do you suggest I apply?</td></tr>
<tr class="dark"><td class="value"><strong>dchana</strong></td><td class="value">do you have to be very sociable to work at FB?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">luizrrodrigues: but it's fine if you're not fluent</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">ntn: YES! our headquarters are located in Palo Alto, CA</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: We use them for different applications.  A lot of the raw data used by the site is stored in databases with a memcache layer on top of them</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">ntn: Yes, definitely! We're based in Palo Alto</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: all eng offices</span></td></tr>
<tr class="dark"><td class="value"><strong>TAG</strong></td><td class="value">FB_Matt: Matt - that's URL does not show ANY confirmation if Apply worked or not. Endless loop</td></tr>
<tr class="light"><td class="value"><strong>ntn</strong></td><td class="value">thank you</td></tr>
<tr class="dark"><td class="value"><strong>Rotkiv</strong></td><td class="value">FB_Tim: any part time work for students?</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: sounds like clone of wikipedia :)</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">i mean which countries ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: and a lot of other information is getting crunched in hadoop</span></td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">Do you recruit in India?</td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">can u plz tell me where i submit my cv?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: we can recruit internationally</span></td></tr>
<tr class="light"><td class="value"><strong>luizrrodrigues</strong></td><td class="value">FB_Clifton: Thanks.</td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">email ?</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: or the other way around.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Rotkiv: I have it on good authority that there is in fact part time work for students ;)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Richard</span></td><td class="value"><span class="bigRed">Shinta: Hi, no plans for Latin America in the near term</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: but everyone has to relocate</span></td></tr>
<tr class="light"><td class="value"><strong>ntn</strong></td><td class="value">should I just solve the puzzle to show my interests in Facebook?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: sure</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: email it to me</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Sarah: where to ?</td></tr>
<tr class="light"><td class="value"><strong>Technophilis</strong></td><td class="value">FB_David: When you have to apply to be able to start an internship by the summer ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: : skurien@facebook.com</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">Do you have to live in the US to work at FB?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">vpramod: we can look ait</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">thans</td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">nice</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: yes</span></td></tr>
<tr class="dark"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt:  yeah I understand that. By the way, what is the level you expect from the aplicants for lets say an internship? Should I be able to solve all the puzzles in a week and then just drop you an email that I'm interested?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: you will need to relocate</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: bu we can help you</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: we can hire internationally</span></td></tr>
<tr class="dark"><td class="value"><strong>mystic_tc</strong></td><td class="value">unclever: please direct your question to service@topcoder.com</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: we have already hired several international </span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: ppl this year</span></td></tr>
<tr class="light"><td class="value"><strong>unclever</strong></td><td class="value">mystic_tc: Thanks.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: very possible =)</span></td></tr>
<tr class="light"><td class="value"><strong>diakatana</strong></td><td class="value">FB_Sarah: what prog lang if FB interested in</td></tr>
<tr class="dark"><td class="value"><strong>samshu</strong></td><td class="value">FB_David: hi! do you recruit in India?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: any language is fine</span></td></tr>
<tr class="dark"><td class="value"><strong>ahmed.helal</strong></td><td class="value">FB_Mary_Ann: srry got dc :), did you get my last question ? it was about the qualifications for a designer internship interview </td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: any language is fine</span></td></tr>
<tr class="dark"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: do you build thoose tools yourself , like heartbeat tools or failover , or just use things like linux-ha tools</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: I don't happen to know who invented these various approaches</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: php</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Sarah: so how does one apply for an internship ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: c++</span></td></tr>
<tr class="light"><td class="value"><strong>mystic_tc</strong></td><td class="value">unclever: I believe you can first check http://www.topcoder.com/tc?module=Static&d1=applet&d2=plugins</td></tr>
<tr class="dark"><td class="value"><strong>diakatana</strong></td><td class="value">FB_Sarah: whats the work mainly in?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: is what we mostly work in</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: We have a huge and powerful set of internal tools that we built ourselves</span></td></tr>
<tr class="light"><td class="value"><strong>mystic_tc</strong></td><td class="value">unclever: two links at the top</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: but you can interview in whatever you want</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: language wise</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">luizrrodrigues: Sorry about that... unfortunately English is the preferred language in which we do business in.</span></td></tr>
<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">FB_Sarah: Do you recruit in Singapore?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: Very little of what we use if off-the shelf, if any of it</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: we expect super fast, clean code. If you successfully solve some of our puzzles, the correct submissions will be sent directly to our recruiting team</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: send us your resume</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">so do u work in computer vision ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: skurien@facebook.com</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Sarah: ok, thanks</td></tr>
<tr class="dark"><td class="value"><strong>unclever</strong></td><td class="value">mystic_tc: I checked it,but I can just get the API documents.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Duc: you can come here</span></td></tr>
<tr class="dark"><td class="value"><strong>dimkadimon</strong></td><td class="value">Is it possible to work for FB without relocating, ie to work online?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Duc: singapore is totally great</span></td></tr>
<tr class="dark"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: how are things at facebook different from myspace ? what does it do better in terms of algorithm/processing/data</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Duc: you can come here</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Sarah: what kind of skillsets are you looking forward to, and how long does an internship last usually ?</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: or orkut</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: internships are about 3 months long</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: work is in everything</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Facebook sponsors visas for people from other countries, if you're interested in coming to the US to join us =)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: front end and back end stuff</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Sarah: is 3 months the minimum or maximum or average?</td></tr>
<tr class="light"><td class="value"><strong>sfmunera</strong></td><td class="value">FB_Sarah: Hi, have you hired any colombian?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">diakatana: aout average</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">So how should you apply if you want to relocate to the US?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Richard</span></td><td class="value"><span class="bigRed">dimkadimon: we prefer to have you work in Palo Alto, given our highly collaborative work</span></td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_Matt:  then do you advise me to just keep solving and they will contact me if interested?</td></tr>
<tr class="dark"><td class="value"><strong>Technophilis</strong></td><td class="value">FB_David: A kind of an insider question here : do you think that by solving the medium difficulty puzzles on the facebook's website you can get an interview ?</td></tr>
<tr class="light"><td class="value"><strong>dimkadimon</strong></td><td class="value">Does the work at FB involve algorithms or mostly user interface?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: Well one thing that we do that seems to work well for us is starting and contributing to open-source projects</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">sfmunera: no but we would love to</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">sfmunera: :)</span></td></tr>
<tr class="light"><td class="value"><strong>lantimilan</strong></td><td class="value">When do students apply for next summer's internship?</td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">i just join topcodder today .. only to chat with u guys..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">supo: yes, that's the best way to get our attention and prove your skills</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pt1989: average</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">so do i need to compete here or ..</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: we've started a lot of projects (thrift, scribe, etc) that work on a huge scale and contributed them back to the open-source community</span></td></tr>
<tr class="light"><td class="value"><strong>vpramod</strong></td><td class="value">at the time of interview</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: and we see awesome contributions on those from people outside the company, which is amazing</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">lantimilan: They start applying this fall.</span></td></tr>
<tr class="dark"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: Any numbers on how many facebook plans to hire this fall?</td></tr>
<tr class="light"><td class="value"><strong>jchonphoenix</strong></td><td class="value">just curious</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">lantimilan: Fall being the September time frame.  Our internship posting will be on our careers site in the next week.</span></td></tr>
<tr class="light"><td class="value"><strong>jchonphoenix</strong></td><td class="value">is facebook bringin the hackathon back to cmu this fall</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">agsharath: We don't have concrete numbers right now but I can tell you that if you're good and can hack we'll hire you.</span></td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_Tim:  I loved what you guys did to the memcached and how you put it back to the community!</td></tr>
<tr class="dark"><td class="value"><strong>vpramod</strong></td><td class="value">good</td></tr>
<tr class="light"><td class="value"><strong>sfmunera</strong></td><td class="value">wack-a-mole: wack</td></tr>
<tr class="dark"><td class="value"><strong>vlad_D</strong></td><td class="value">dbh: loza</td></tr>
<tr class="light"><td class="value"><strong>joncalhoun</strong></td><td class="value">FB Sponsors: When would you suggest students who intend to graduate within a year to start applying for a full time job?</td></tr>
<tr class="dark"><td class="value"><strong>sfmunera</strong></td><td class="value">wack-a-mole: Where are you from?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">supo: thanks!  have you gotten any use out of it yourself?</span></td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Facebook folks:  what's your favorite part about your job?</td></tr>
<tr class="light"><td class="value"><strong>dimkadimon</strong></td><td class="value">How many TopCoders are already working for FB?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">agsharath: we plan to do a lot of hiring, especially for engineers</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">dimkadimon: Definitely the people and the feeling that I'm a part of something bigger.</span></td></tr>
<tr class="dark"><td class="value"><strong>FB_Marcia</strong></td><td class="value">jchonphoenix: we're not doing a hackathon again at cmu, but we'll be on campus for a tech talk and for the toc at cmu</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jmpld40: Big problems and big impact are one of the biggest attractions of working here</span></td></tr>
<tr class="dark"><td class="value"><strong>CodeRacer</strong></td><td class="value">Guys, how you score the salaries of developers of FB, are they competitive enough?</td></tr>
<tr class="light"><td class="value"><strong>chandubaba</strong></td><td class="value">FB_Matt: non engineers?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">We currently have over 200 engineers and we're growing very quickly =)</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_Matt: What's the way to apply if I want to relocate to tue US?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jmpld40: We have a relatively tiny team of engineers doing a lot to change the way people communicate and connect around the world</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">chandubaba: what sort of non engineer?</span></td></tr>
<tr class="dark"><td class="value"><strong>supo</strong></td><td class="value">FB_Tim:  not yet, but right now I'm working on a django project that may need memcached quite soon, so I was just checking it out ;-)</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Tim: just curios , do you use haskell or erlang or python or ruby for a parallel problem or you have some libraries of your own</td></tr>
<tr class="dark"><td class="value"><strong>chandubaba</strong></td><td class="value">FB_Matt: doing IT degree</td></tr>
<tr class="light"><td class="value"><strong>agsharath</strong></td><td class="value">FB_Clifton: around how many solved facebook puzzles would guarantee a call?</td></tr>
<tr class="dark"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@Marcia: Thanks!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">My favorite thing about working here is the great coworkers - everyone is brilliant and interesting, and there's a really good sense of being on the same team =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: Personally, I haven't.  However a lot of the back-end of our chat service runs on erlang for that exact reason</span></td></tr>
<tr class="light"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@Marcia: Thanks!</td></tr>
<tr class="dark"><td class="value"><strong>yellowgreen</strong></td><td class="value">we really dont need to be in the dev track to be qualified for facebook hiring?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">definitely a really smart team of co-workers--FB is great!</span></td></tr>
<tr class="dark"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_David what about money you earn?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">supo: that's awesome, I hope it turns out to be helpful for you!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">chandubaba: yes, we're growing immensly and we have opportunities in many areas, but our priority now is hiring the best engineers in the world</span></td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">is mobile development important to FB?</td></tr>
<tr class="dark"><td class="value"><strong>Technophilis</strong></td><td class="value">Does Facebook sponsor H-1B visas for international applicants ? and eventually a Green Card ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Salary is based on experience and ability, we have competitive salaries =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">el_vitucho: definitely, it's an extremely quickly-growing area for us</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Technophilis: Yes we do.</span></td></tr>
<tr class="dark"><td class="value"><strong>yellowgreen</strong></td><td class="value">FB_Clifton: where can we find the fb puzzle?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">CodeRacer: We don't publicly discuss salary of employees at Facebook, but we pay aggressive salaries, equity, and benefits that are based on industry standards and given our company¬ës current stage of development </span></td></tr>
<tr class="dark"><td class="value"><strong>Technophilis</strong></td><td class="value">FB_Clifton: Okay Thanks</td></tr>
<tr class="light"><td class="value"><strong>supo</strong></td><td class="value">FB_Tim:  thanks</td></tr>
<tr class="dark"><td class="value"><strong>andrey_korol</strong></td><td class="value">Are you have some realocation program for developers family?</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">thanks</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">I want to work at Facebook. What should I do?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">el_vitucho: our mobile site is gaining users extremely quickly and we are doing a lot of work to add features and generally improve the experience</span></td></tr>
<tr class="dark"><td class="value"><strong>realitydeviant</strong></td><td class="value">FB_Tim: Do you have a website?</td></tr>
<tr class="light"><td class="value"><strong>dchana</strong></td><td class="value">whos' the best coder in FB?</td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">yellowgreen: http://www.facebook.com/careers/puzzles.php</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">el_vitucho: mobile development is very important. We want facebook everywhere, and mobile is a perfect platform for facebook</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">Do you have like a mobile development team?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">MauricioC: Thanks!</span></td></tr>
<tr class="dark"><td class="value"><strong>yellowgreen</strong></td><td class="value">realitydeviant: have you ever heard of facebook.com?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">MauricioC: Thanks!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">realitydeviant: I'll have to consult my manager</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">I want to work at Facebook. What do I do?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">andrey_korol: Yes, we do offer relocation programs for families of engineers</span></td></tr>
<tr class="light"><td class="value"><strong>MauricioC</strong></td><td class="value">You're welcome :)</td></tr>
<tr class="dark"><td class="value"><strong>Maxi</strong></td><td class="value">maurito.s: http://www.topcoder.com/tc?module=Static&d1=applet&d2=plugins</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">el_vitucho: yep, we have a team dedicated to the mobile site as well as more specific projects like the iphone site</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">el_vitucho: that team has been growing very quickly</span></td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_David could you provide the source for info about family relocation pragrams</td></tr>
<tr class="dark"><td class="value"><strong>andrey_korol</strong></td><td class="value">FB_David: Thanks</td></tr>
<tr class="light"><td class="value"><strong>TiKay</strong></td><td class="value">How's life in silicon valley?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: A good way to get started is to solve a puzzle, see http://www.facebook.com/PuzzleMaster</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">TiKay: I wouldn't leave it for the world =)</span></td></tr>
<tr class="dark"><td class="value"><strong>TiKay</strong></td><td class="value">:)</td></tr>
<tr class="light"><td class="value"><strong>lucasufrn</strong></td><td class="value">In which field is the biggest segment of the employees involved in? (algorithms, architecture, designing, ...)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">TiKay: always interesting and a little warmer than san francisco :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">TiKay: The weather's great =)</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Tim: how many FB challenges should we solve?</td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Will FB help with visas and housing?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Tim: also is the internship flexible ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">CodeRacer: We offer relocation assistance to you and your famil... it is consistent and competitive with what is offered in Silicon Valley.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: Yep =)</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Do you have to be graduated to apply? Or is there any project for students?</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">to apply for Facebook jobs, go here: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pt1989: solving one non-trivial puzzle is enough to get you on our radar, but to stand apart from the crowd I'd recommend doing a few more than that.</span></td></tr>
<tr class="dark"><td class="value"><strong>CodeRacer</strong></td><td class="value">thanks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pt1989: As for internships, they are definitely flexible but you'd have to discuss details with a recruiter</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Tim: thanks, i'll be on it ( but not at 6 AM :) )</td></tr>
<tr class="light"><td class="value"><strong>jaher</strong></td><td class="value">are the schedules flexible? Is it possible to work from midnight to noon?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pt1989: Hah, cool.  best of luck!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">jaher: yes, we're very flexible</span></td></tr>
<tr class="dark"><td class="value"><strong>Pritam</strong></td><td class="value">syco: yo </td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jaher: definitely.  people work on whatever schedule works for them.</span></td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Tim: does FB have a parent company ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jaher: as long as it's conducive to productivity =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">jaher: That's very possible, and lots of engineers do =)</span></td></tr>
<tr class="light"><td class="value"><strong>pt1989</strong></td><td class="value">FB_Tim: or is it independant ?</td></tr>
<tr class="dark"><td class="value"><strong>CodeRacer</strong></td><td class="value">))</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pt1989: it's just us, no strings attached</span></td></tr>
<tr class="dark"><td class="value"><strong>yangweikun</strong></td><td class="value">**yangweikun why are we here</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">pt1989: No parent company just us</span></td></tr>
<tr class="dark"><td class="value"><strong>yangweikun</strong></td><td class="value">**yangweikun hello</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">what is facebook?</td></tr>
<tr class="dark"><td class="value"><strong>syco</strong></td><td class="value">Pritam: pritameeeeee</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: from solving puzzles</span></td></tr>
<tr class="dark"><td class="value"><strong>yangweikun</strong></td><td class="value">why are we here</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: http://www.facebook.com/PuzzleMaster</span></td></tr>
<tr class="dark"><td class="value"><strong>Pritam</strong></td><td class="value">syco: what you doing in this chat lobby?:-P</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">jaher: We have a very flexible working schedule at Facebook. Everyone has different work style preferences about how, where and when they're most productive.</span></td></tr>
<tr class="dark"><td class="value"><strong>syco</strong></td><td class="value">Pritam: er..i logged into this automatically</td></tr>
<tr class="light"><td class="value"><strong>Pritam</strong></td><td class="value">syco: lol</td></tr>
<tr class="dark"><td class="value"><strong>QASH</strong></td><td class="value">what is meant by a "non-trivial" puzzle</td></tr>
<tr class="light"><td class="value"><strong>mohmdadel</strong></td><td class="value">any arabian competitors here  ??</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">QASH: hard puzzle</td></tr>
<tr class="light"><td class="value"><strong>userundefined</strong></td><td class="value">hi there, where does facebook have offices?</td></tr>
<tr class="dark"><td class="value"><strong>mohan8990</strong></td><td class="value">Any career in Facebook in India.?</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">no but i eat arab food</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: I have solved a few of the trivial ones</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">sometimes</td></tr>
<tr class="dark"><td class="value"><strong>oldherl</strong></td><td class="value">do you think being banned in china mainland affects your company a lot?</td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: How many did you solve before they contact you?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">userundefined: Our main office is in Palo Alto for engineering.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">QASH: the ones labeled as hors d'ouevres are considered trivial.  That's just "meep meep" and "Hoppity"</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">userundefined: we're in Palo Alto, California</span></td></tr>
<tr class="light"><td class="value"><strong>jaher</strong></td><td class="value">are the intern positions open to undergrads from all schools or do you have a subset of schools you prefer to hire from?</td></tr>
<tr class="dark"><td class="value"><strong>userundefined</strong></td><td class="value">Thanks. Any branches in Canada?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: I solved 3, one hard and 2 easy</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jaher: intern positions are open to any students that can write awesome code.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">userundefined: Almost all of our Engineers work at the Facebook headquarters in Palo Alto, California, but we do have smaller sales offices located around the world.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">jaher: all schools.  You just need to show your coding prowess</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">userundefined: We have an office in Toronto but it's for sales.</span></td></tr>
<tr class="dark"><td class="value"><strong>userundefined</strong></td><td class="value">gotcha. Thanks.</td></tr>
<tr class="light"><td class="value"><strong>Ariza</strong></td><td class="value">Hey2, what's up</td></tr>
<tr class="dark"><td class="value"><strong>s4sagar</strong></td><td class="value">syco: Hi ! I nver see u online these days ! :)</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_Matt Russia or Kazakhstan?</td></tr>
<tr class="dark"><td class="value"><strong>Atef</strong></td><td class="value">FB_David: how about in the middle east, say around Egypt? :)</td></tr>
<tr class="light"><td class="value"><strong>ank_it</strong></td><td class="value">For Facebook in Mobiles u use J2ME of same PHP??</td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">do you let engineers work on projects that they have proposed? something like google does, one day of the week any googler can work on any other project that they want</td></tr>
<tr class="light"><td class="value"><strong>jaher</strong></td><td class="value">how many interviews on average do you need to do?</td></tr>
<tr class="dark"><td class="value"><strong>QASH</strong></td><td class="value">submission to those puzzles is a bit tough as well as late, can u guys switch them to TC?</td></tr>
<tr class="light"><td class="value"><strong>QASH</strong></td><td class="value">only if it is flexible for u guys</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">ank_it: the mobile site is implemented in php</span></td></tr>
<tr class="light"><td class="value"><strong>Atef</strong></td><td class="value">FB_David: how about in the middle east, say around Egypt? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">jaher: for interns, 2-3 usually</span></td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">FB_Clifton: how much of your time do you spend designing , coding,testing ? Do you have people working on QA or do programmers do both</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">ank_it: as for native clients for various devices, I suspect they are implemented in all sorts of crazy languages</span></td></tr>
<tr class="light"><td class="value"><strong>syco</strong></td><td class="value">s4sagar: :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">CodeRacer: no offices in russia or kazakhstan :)</span></td></tr>
<tr class="light"><td class="value"><strong>syco</strong></td><td class="value">s4sagar: been busy</td></tr>
<tr class="dark"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@el_vitucho:  thats what the hackathons are</td></tr>
<tr class="light"><td class="value"><strong>otter</strong></td><td class="value">Can you guys name a few open-source projects that are particularly relevent to the Applications at FB ?</td></tr>
<tr class="dark"><td class="value"><strong>s4sagar</strong></td><td class="value">syco: ONly chat room @ TopCoder huh ;)</td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">are there any offices based in Singapore?</td></tr>
<tr class="dark"><td class="value"><strong>s4sagar</strong></td><td class="value">syco: Same mail ids ? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">el_vitucho: Yes, there's a lot of freedom in what you want to work on and ability to create new projects when you see a need</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">otter: hive</span></td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_Matt: it's a pity ;)</td></tr>
<tr class="dark"><td class="value"><strong>soparrissays</strong></td><td class="value">serious questions, serious question guys</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">otter: thrift</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">hackathons!!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">otter: all open source</span></td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">FB_David: excelent</td></tr>
<tr class="light"><td class="value"><strong>ankul_iiita</strong></td><td class="value">what kind of projects do we get to see?</td></tr>
<tr class="dark"><td class="value"><strong>soparrissays</strong></td><td class="value">how much wood could a wood chuck chuck if a wood chuck could chuck wood?</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">serious question</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">soparrissays: A LOT</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Very nice, I remember I read the hards and they where indeed tough</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: We don't have any dedicated testing staff.  All engineers are responsible to make sure their code works and handle it if it breaks</span></td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">jchonphoenix: what is hackatons?</td></tr>
<tr class="dark"><td class="value"><strong>pt1989</strong></td><td class="value">soparrissays: as much as CHuck Norris chucks</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">otter: memcached, hive, etc</span></td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: I will try them again</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">where wood is a a factor of constrained optimization</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">otter: we do a lot of open source work</span></td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">Duc: yea im in Singapore (:</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Have you liked Facebook so far? What is what you like the most?</td></tr>
<tr class="light"><td class="value"><strong>wrick</strong></td><td class="value">I have done almost all the Facebook puzzles :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">tryitn2: So ideally, I think we spend the most time designing, then a little less coding, and a little less testing.  But everyone does do at least some testing.</span></td></tr>
<tr class="light"><td class="value"><strong>yellowgreen</strong></td><td class="value">wrick: then what are you waiting for?</td></tr>
<tr class="dark"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@el_vitucho: basically a 24hr time frame to code w/e u want then present it</td></tr>
<tr class="light"><td class="value"><strong>wrick</strong></td><td class="value">FB_Sarah: hi </td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">wack-a-mole: It's a fantastic place to work... I'm really happy here. The atmosphere is great, very relaxed and fun, and everyone is very smart =)</span></td></tr>
<tr class="light"><td class="value"><strong>novicenet</strong></td><td class="value">??????50???</td></tr>
<tr class="dark"><td class="value"><strong>ank_it</strong></td><td class="value">The Developer does the testing of his codE???</td></tr>
<tr class="light"><td class="value"><strong>MasterLuo</strong></td><td class="value">Hello, FB means Facebook?</td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">jchonphoenix: interesting</td></tr>
<tr class="light"><td class="value"><strong>novicenet</strong></td><td class="value">?????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">MasterLuo: yep</span></td></tr>
<tr class="light"><td class="value"><strong>Pomber</strong></td><td class="value">the objetive of the puzzles is efficience?</td></tr>
<tr class="dark"><td class="value"><strong>MasterLuo</strong></td><td class="value">?,?????</td></tr>
<tr class="light"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@el_vitucho: they held one at my university last year</td></tr>
<tr class="dark"><td class="value"><strong>novicenet</strong></td><td class="value">TG</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">MasterLuo: yep</span></td></tr>
<tr class="dark"><td class="value"><strong>jimdavis</strong></td><td class="value">= =~</td></tr>
<tr class="light"><td class="value"><strong>novicenet</strong></td><td class="value">??TG???</td></tr>
<tr class="dark"><td class="value"><strong>novicenet</strong></td><td class="value">??</td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">FB_David: are you planning to open some offices in Europe? sorry if it is asked before..</td></tr>
<tr class="dark"><td class="value"><strong>jaher</strong></td><td class="value">how long do you usually test a feature internally on average before it is launched?</td></tr>
<tr class="light"><td class="value"><strong>Ariza</strong></td><td class="value">Anyone have Facebook??</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Are you originally from the US? How old are you? (If you don't mind)</td></tr>
<tr class="light"><td class="value"><strong>dimkadimon</strong></td><td class="value">How does working at FB compare to working at Google?</td></tr>
<tr class="dark"><td class="value"><strong>soparrissays</strong></td><td class="value">are you going to use the result of this match in a facebook product or service</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">to apply for Facebook jobs, go here: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3</span></td></tr>
<tr class="dark"><td class="value"><strong>MasterLuo</strong></td><td class="value">FB_Clifton: thx. Facebook is very good website for erveryone.</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">:-D</td></tr>
<tr class="dark"><td class="value"><strong>Pawa</strong></td><td class="value">Are you aware of the fact that Russian largest social network Vkontakte is simply cloning Facebook? Any plans to sue them?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">dimkadimon: You have a much bigger impact.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Pomber: It requires efficiency to pass the grading robot, but we also consider style and elegance when determining if we should bring someone in for an interview</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">ortschun: We have branches in Europe, London I think, but not for engineering... that's done only in california</span></td></tr>
<tr class="dark"><td class="value"><strong>Ariza</strong></td><td class="value"> dimkadimon: I think Google is better.... :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">dimkadimon: I came from google and facebook is much faster and a more fun place to work</span></td></tr>
<tr class="dark"><td class="value"><strong>Pomber</strong></td><td class="value">FB_Tim: thanks</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">FB_Mat</td></tr>
<tr class="dark"><td class="value"><strong>dimkadimon</strong></td><td class="value">Pawa: Also odnoklassniki looks similar</td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">Whats the youngest engineer at Facebook ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">jaher: small things can get several hours of testing before they are pushed out, but ideally are always running under unit tests.  larger features can take months or weeks with lots of simulated load and other good stuff.</span></td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">Should I be a fan of FB to start working there )</td></tr>
<tr class="dark"><td class="value"><strong>soparrissays</strong></td><td class="value">what animal is ur favorite in dino island</td></tr>
<tr class="light"><td class="value"><strong>TiKay</strong></td><td class="value">FB_Matt: how much money did you get for that statement? ;P </td></tr>
<tr class="dark"><td class="value"><strong>ZxMYS</strong></td><td class="value">how much is the prize?</td></tr>
<tr class="light"><td class="value"><strong>fun2on</strong></td><td class="value">how to get started for Competition</td></tr>
<tr class="dark"><td class="value"><strong>Pawa</strong></td><td class="value">dimkadimon: they are cloning classmates, not facebook :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">TiKay: Lots.  ;)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Mince: We have lots of people in their early 20s</span></td></tr>
<tr class="light"><td class="value"><strong>MasterLuo</strong></td><td class="value">novicenet: You are so cute.</td></tr>
<tr class="dark"><td class="value"><strong>rem</strong></td><td class="value">Olexiy: you are participating today?</td></tr>
<tr class="light"><td class="value"><strong>ZxMYS</strong></td><td class="value">how much is the prize?</td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">FB_Sarah: sent</td></tr>
<tr class="light"><td class="value"><strong>soparrissays</strong></td><td class="value">i think the prize is a job</td></tr>
<tr class="dark"><td class="value"><strong>soparrissays</strong></td><td class="value">lol</td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">FB_David: cool.. thanks</td></tr>
<tr class="dark"><td class="value"><strong>romelon85</strong></td><td class="value">yisus</td></tr>
<tr class="light"><td class="value"><strong>ZxMYS</strong></td><td class="value">soparrissays: lol</td></tr>
<tr class="dark"><td class="value"><strong>guptavarun</strong></td><td class="value">FB_Matt: I would like to build leaderboard/ranklist for Facebook Puzzeles</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Mince: The average age is late 20s but we have people here from all ages and backgrounds.</span></td></tr>
<tr class="dark"><td class="value"><strong>domino.iiita</strong></td><td class="value">lol</td></tr>
<tr class="light"><td class="value"><strong>otter</strong></td><td class="value">10 mins to go~ </td></tr>
<tr class="dark"><td class="value"><strong>ZxMYS</strong></td><td class="value">ZxMYS: a job at facebook,sounds good.....</td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">FB_Clifton: Any Singaporeans?</td></tr>
<tr class="dark"><td class="value"><strong>atulbansal</strong></td><td class="value">facebook has only 200 engineers?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">wrick: awesome</span></td></tr>
<tr class="dark"><td class="value"><strong>guptavarun</strong></td><td class="value">FB_Matt: Can I be allowed to work on that</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">wrick: i will be in touch!</span></td></tr>
<tr class="dark"><td class="value"><strong>vjtriolo</strong></td><td class="value">I'm lucky if I can write code that works, forget awesome.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">atulbansal: it might be a bit higher than that with all the interns right now, but it's very close to that</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Richard</span></td><td class="value"><span class="bigRed">atulbansal: give or take</span></td></tr>
<tr class="light"><td class="value"><strong>zjintz</strong></td><td class="value">200 engineers?</td></tr>
<tr class="dark"><td class="value"><strong>eraserhd</strong></td><td class="value">Heh, my wife just told me that on the news they said something like "they are thinking about shutting down Facebook because too many people are abusing it."</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">TiKay: it's true, we get to do more and have greater responsibility at facebook</span></td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">FB_Sarah: no probs</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Mince: We had an intern from Singapore.  Not sure offhand... my mom is Singaporean if that counts.  :)</span></td></tr>
<tr class="dark"><td class="value"><strong>sfmunera</strong></td><td class="value">wack-a-mole: Hi, what part of Colombia are you from?</td></tr>
<tr class="light"><td class="value"><strong>Duc</strong></td><td class="value">FB_Sarah: Hi, what's your address to send my resume again? :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">atulbansal: We have a little over 200 engineers. We pride ourselves in having over a million users per engineer - where else can you reach so many people =)</span></td></tr>
<tr class="light"><td class="value"><strong>Ryan</strong></td><td class="value">eraserhd: they aren't shutting it down, just making it lamer</td></tr>
<tr class="dark"><td class="value"><strong>WangDanning</strong></td><td class="value">How do you think a job at TopCoder</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Duc: skurien@facebook.com</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">guptavarun: it could be a side project :)</span></td></tr>
<tr class="light"><td class="value"><strong>Mince</strong></td><td class="value">FB_Clifton: Cool. From all backgrounds, regardless of university?</td></tr>
<tr class="dark"><td class="value"><strong>atulbansal</strong></td><td class="value">whats the average team size?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Mince: Yes!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">guptavarun: to apply for Facebook jobs, go here: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Jedi_Knight: hi</span></td></tr>
<tr class="dark"><td class="value"><strong>vpj</strong></td><td class="value">Duc: hey are you coming to Amrita?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Richard</span></td><td class="value"><span class="bigRed">atulbansal: 3 -5 per project</span></td></tr>
<tr class="dark"><td class="value"><strong>sfmunera</strong></td><td class="value">wack-a-mole: Yo tambi√© y d√≥ estudi√°</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Jedi_Knight: are you interested in an opportunity at Facebook?</span></td></tr>
<tr class="dark"><td class="value"><strong>Mince</strong></td><td class="value">(: Interesting..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">atulbansal: average team size is small. from 3-6 people</span></td></tr>
<tr class="dark"><td class="value"><strong>jchonphoenix</strong></td><td class="value">@el_vitucho: /</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">atulbansal: it's actually impressive how small teams can make such a huge impact</span></td></tr>
<tr class="dark"><td class="value"><strong>eraserhd</strong></td><td class="value">If you ever get positions around Cleveland, Ohio, let me know. :)</td></tr>
<tr class="light"><td class="value"><strong>Maxi</strong></td><td class="value">FB_Sarah: Hi, I would like to know internship opportunities for students.</td></tr>
<tr class="dark"><td class="value"><strong>fmm</strong></td><td class="value">lsa:</td></tr>
<tr class="light"><td class="value"><strong>novicenet</strong></td><td class="value">???</td></tr>
<tr class="dark"><td class="value"><strong>fmm</strong></td><td class="value">lsa: oi verdinha</td></tr>
<tr class="light"><td class="value"><strong>atulbansal</strong></td><td class="value">which technologies/computer languages are mostly used in Facebook</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">eraserhd: Not open to joining us in california? =)</span></td></tr>
<tr class="light"><td class="value"><strong>wack-a-mole</strong></td><td class="value">How many people is working at Palo Alto?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Maxi: hi Maxi</span></td></tr>
<tr class="light"><td class="value"><strong>k4knight</strong></td><td class="value">...???...</td></tr>
<tr class="dark"><td class="value"><strong>aluxisec</strong></td><td class="value">??!</td></tr>
<tr class="light"><td class="value"><strong>guptavarun</strong></td><td class="value">I am expoloring to contribute to Apache Mahout. Are you guys using it?</td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">Is it true that Facebook sucks?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Maxi: great! you should email me your resume: skurien@facebook.com</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Maxi: i can check if we have a fit</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Maxi: sound good?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">wack-a-mole: the majority of our employees work in Palo Alto</span></td></tr>
<tr class="light"><td class="value"><strong>eraserhd</strong></td><td class="value">FB_Tim: Cost of living here is _really_ low.  Last time I got a relo to California offer, they couldn't match, adjusted to cost of living.</td></tr>
<tr class="dark"><td class="value"><strong>novicenet</strong></td><td class="value">?????????</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">wack-a-mole: approx 800-900</span></td></tr>
<tr class="dark"><td class="value"><strong>chhung6</strong></td><td class="value">AEtheReal: HI!!</td></tr>
<tr class="light"><td class="value"><strong>k4knight</strong></td><td class="value">????</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Akim: hi</span></td></tr>
<tr class="light"><td class="value"><strong>s4sagar</strong></td><td class="value">FB_Sarah: Hi, In India too ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">atulbansal: We use many languages, but for a start: PHP, Python, Erlang, Haskell, Perl, C++, Ruby, etc... =)</span></td></tr>
<tr class="light"><td class="value"><strong>eraserhd</strong></td><td class="value">Even though it was &gt; 50% more than I was making.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Akim: are you interested in Facebook</span></td></tr>
<tr class="light"><td class="value"><strong>ortschun</strong></td><td class="value">FB_Sarah: could we apply for 2010 summer internship?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Akim: if you are</span></td></tr>
<tr class="light"><td class="value"><strong>Maxi</strong></td><td class="value">FB_Sarah: Excelent! Thank you :)</td></tr>
<tr class="dark"><td class="value"><strong>fmm</strong></td><td class="value">lsa: sumiu???</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Akim: we woul dlove to chat with you</span></td></tr>
<tr class="dark"><td class="value"><strong>wrick</strong></td><td class="value">FB_David: Haskell? Really????</td></tr>
<tr class="light"><td class="value"><strong>atulbansal</strong></td><td class="value">I see</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">Akim: email me your resume: skurien@facebook.com</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">eraserhd: Hah, fair enough.  The cost of living here is pretty bad but Facebook does compensate engineers agressively relative to companies in the area, especially ones our size</span></td></tr>
<tr class="dark"><td class="value"><strong>k4knight</strong></td><td class="value">do u have internship?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">ortschun: of course</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">ortschun: we have those available as well</span></td></tr>
<tr class="light"><td class="value"><strong>rator10</strong></td><td class="value">FB_David: What does Facebook do where Haskell is useful?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">ortschun: intern@facebook.com</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">ortschun: send me your resime: skurien@facebook.com</span></td></tr>
<tr class="dark"><td class="value"><strong>waitatshu</strong></td><td class="value">ouch i accidentally registered for the agent thing</td></tr>
<tr class="light"><td class="value"><strong>maradonah</strong></td><td class="value">Hello everybody</td></tr>
<tr class="dark"><td class="value"><strong>k4knight</strong></td><td class="value">but where can we find internship information?</td></tr>
<tr class="light"><td class="value"><strong>s4sagar</strong></td><td class="value">FB_Sarah: Internship avl in India too ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">we are definitely looking for 2010 interns right now</span></td></tr>
<tr class="light"><td class="value"><strong>k4knight</strong></td><td class="value">like the intro to each position</td></tr>
<tr class="dark"><td class="value"><strong>MauricioC</strong></td><td class="value">waitatshu: Just don't submit anything and you should be fine :)</td></tr>
<tr class="light"><td class="value"><strong>maradonah</strong></td><td class="value">FB_Sarah: do you have the option of freelancing?</td></tr>
<tr class="dark"><td class="value"><strong>BBTiger</strong></td><td class="value">What a hot day</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">s4sagar: not in india</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">s4sagar: ou can come here</span></td></tr>
<tr class="light"><td class="value"><strong>fmm</strong></td><td class="value">lsa: hello?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">maradonah: no</span></td></tr>
<tr class="light"><td class="value"><strong>fun2on</strong></td><td class="value">you and i in this</td></tr>
<tr class="dark"><td class="value"><strong>Doxi_FreeCoder</strong></td><td class="value">hehe </td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">k4knight: Go to www.facebook.com/careers and go to our "university" tab.</span></td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">FB_Sarah: thx =)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">maradonah: you have to relocate</span></td></tr>
<tr class="dark"><td class="value"><strong>Mince</strong></td><td class="value">Working for facebook -&gt; Must go California? No chance to like remain in Singapore?</td></tr>
<tr class="light"><td class="value"><strong>atulbansal</strong></td><td class="value">1Last question: How many hours does an engineer work per week on an average</td></tr>
<tr class="dark"><td class="value"><strong>fmm</strong></td><td class="value">lsa: enter!!</td></tr>
<tr class="light"><td class="value"><strong>k4knight</strong></td><td class="value">haha, good luck guys</td></tr>
<tr class="dark"><td class="value"><strong>askvij</strong></td><td class="value">FB_Sarah: Internship opportunity is for students only ??</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Mince: Unfortunately, all of our engineering is in Palo Alto, CA.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: yes</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: only for stduents</span></td></tr>
<tr class="dark"><td class="value"><strong>wack-a-mole</strong></td><td class="value">FB_David: Nice talking to you. Thanks!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: must be in school</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">atulbansal: some work more than 50, but nobody is forced to.  We have a lot of people that run on a regular 9 to 5 schedule.</span></td></tr>
<tr class="light"><td class="value"><strong>acm.ua</strong></td><td class="value">good luck!!</td></tr>
<tr class="dark"><td class="value"><strong>TheVipeer</strong></td><td class="value">thanks for FB representatives for being so helpful :) I'll have to go now for the match</td></tr>
<tr class="light"><td class="value"><strong>[VVasi]</strong></td><td class="value">**[VVasi] WTF! LOL!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: yes</span></td></tr>
<tr class="light"><td class="value"><strong>pmnox</strong></td><td class="value">What makes work at Facebook unique?</td></tr>
<tr class="dark"><td class="value"><strong>Mince</strong></td><td class="value">Ic.. How about in the future? Any foresights?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: just fo students</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">good luck everyone!!!!</span></td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">Before the comeptition starts, I just want to thank Facebook for chatting. SO thanks!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: **If anyone is interested in Facebook</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Mary_Ann</span></td><td class="value"><span class="bigRed">Thanks this was fun! Good Luck!!</span></td></tr>
<tr class="dark"><td class="value"><strong>ntn</strong></td><td class="value">thanks to all FB_* :)</td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">thank facebook</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">pmnox: the speed at which we scale and push out code</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: send us your resume: skurien@facebook.com</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">thanks everyone!</span></td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">thanks*</td></tr>
<tr class="dark"><td class="value"><strong>jmpld40</strong></td><td class="value">Additionally, if you want to apply for a job, go here: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco09&d3=overview&d4=sponsors&d5=sponsor3</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">pmnox: We're changing the world =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">askvij: and make sure you say you're interested in learning more about opportunities</span></td></tr>
<tr class="light"><td class="value"><strong>TAG</strong></td><td class="value">What are hard requirements for internation empoyees? Like degree, work exprience, etc. ?</td></tr>
<tr class="dark"><td class="value"><strong>Evadez</strong></td><td class="value">thank you facebook ppl</td></tr>
<tr class="light"><td class="value"><strong>CodeRacer</strong></td><td class="value">thank, friends</td></tr>
<tr class="dark"><td class="value"><strong>Atef</strong></td><td class="value">Thanks facebook :)</td></tr>
<tr class="light"><td class="value"><strong>askvij</strong></td><td class="value">FB_Sarah: :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Good luck everyone!</span></td></tr>
<tr class="light"><td class="value"><strong>psacawa</strong></td><td class="value">damn it I forgot to register!</td></tr>
<tr class="dark"><td class="value"><strong>pmnox</strong></td><td class="value">do you have to write a lot of documentation?</td></tr>
<tr class="light"><td class="value"><strong>fmm</strong></td><td class="value">lsa: why??</td></tr>
<tr class="dark"><td class="value"><strong>zjintz</strong></td><td class="value">thanks for the info!</td></tr>
<tr class="light"><td class="value"><strong>jmpld40</strong></td><td class="value">Finally if you have more questions for Facebook after this chat, you can post in their forum: http://forums.topcoder.com/?module=ThreadList&forumID=528190</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">ccheung@facebook.com</span></td></tr>
<tr class="light"><td class="value"><strong>el_vitucho</strong></td><td class="value">psacawa: hahaha</td></tr>
<tr class="dark"><td class="value"><strong>el_vitucho</strong></td><td class="value">psacawa: thats funny</td></tr>
<tr class="light"><td class="value"><strong>bbharath</strong></td><td class="value">thanks facebook</td></tr>
<tr class="dark"><td class="value"><strong>mbr1</strong></td><td class="value">psacawa: wait until the next month :D</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pmnox: some of our super-awesome engineers do</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pmnox: hi if youa re interested in an opportunity</span></td></tr>
<tr class="light"><td class="value"><strong>ank_it</strong></td><td class="value">Best of Luck 2 all</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pmnox: in generally people should be writing more =)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Sarah</span></td><td class="value"><span class="bigRed">pmnox: please email us: skurien@facebook.com</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">TAG: If you really want to catch our attention, see if you can solve our puzzles  http://www.facebook.com/careers/puzzles.php</span></td></tr>
<tr class="light"><td class="value"><strong>novicenet</strong></td><td class="value">I believe ChunGe</td></tr>
<tr class="dark"><td class="value"><strong>Heruman312</strong></td><td class="value">Thanks facebook!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">pmnox: Writing great docs is one of the things that can help you stand out as a productive engineer here</span></td></tr>
<tr class="dark"><td class="value"><strong>ortschun</strong></td><td class="value">Thanks!</td></tr>
<tr class="light"><td class="value"><strong>TAG</strong></td><td class="value">FB_Matt: but what if something is missing - how you will get around H1B visa requirements?</td></tr>
<tr class="dark"><td class="value"><strong>novicenet</strong></td><td class="value"> believe ChunGe,AC Everyday</td></tr>
<tr class="light"><td class="value"><strong>vpj</strong></td><td class="value">Thanks FB</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Richard</span></td><td class="value"><span class="bigRed">TAG: there are still some h1b remaining and we would sponsor the h1b application</span></td></tr>
<tr class="light"><td class="value"><strong>michaelrpg</strong></td><td class="value">why can't I click enter room? I registered</td></tr>
<tr class="dark"><td class="value"><strong>pmnox</strong></td><td class="value">Yes, I agree. I was curious what was your opition about this subject :)</td></tr>
<tr class="light"><td class="value"><strong>tryitn2</strong></td><td class="value">thanks FB_Tim , FB_Clifton , FB</td></tr>
<tr class="dark"><td class="value"><strong>Pomber</strong></td><td class="value">FB_Sarah: how do i send the answer of a FB puzzle?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">TAG: for really good engineers, there's always a way</span></td></tr>
<tr class="dark"><td class="value"><strong>pmnox</strong></td><td class="value">SRM start, I hate to go</td></tr>
<tr class="light"><td class="value"><strong>fmm</strong></td><td class="value">lsa: gooooood SRM =)</td></tr>
<tr class="dark"><td class="value"><strong>pmnox</strong></td><td class="value">thx for chat</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">thanks for all the good questions tryitn2 </span></td></tr>
<tr class="dark"><td class="value"><strong>TAG</strong></td><td class="value">FB_Matt: OK .. Thanks ..</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Clifton</span></td><td class="value"><span class="bigRed">Good luck everyone!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">bye guys =)</span></td></tr>
<tr class="light"><td class="value"><strong>Thaps</strong></td><td class="value">Thanks Facebook, you really make our lives easy, THANKS!</td></tr>
<tr class="dark"><td class="value"><strong>atulbansal</strong></td><td class="value">Nice ti talk to facebook</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Good luck all!</span></td></tr>
<tr class="dark"><td class="value"><strong>stonet</strong></td><td class="value">screen scrollin fast!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">good luck everyone</span></td></tr>
<tr class="dark"><td class="value"><strong>Pomber</strong></td><td class="value">how do i send the answer of a FB puzzle?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">yeah, good luck everyone</span></td></tr>
<tr class="dark"><td class="value"><strong>Heruman312</strong></td><td class="value">I wanna become a green!</td></tr>
<tr class="light"><td class="value"><strong>Mindhunter74</strong></td><td class="value">Why don't you compete at Topcoder, Facebook guys?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Pomber: by email - there are details on www.facebook.com/puzzlemaster</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Mindhunter74: A lot of us do</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Mindhunter74: David and I are active competitors, among others</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Matt</span></td><td class="value"><span class="bigRed">Pomber: go to our puzzles page to read more about submissions  http://www.facebook.com/careers/puzzles.php</span></td></tr>
<tr class="dark"><td class="value"><strong>Heruman312</strong></td><td class="value">ten seconds more!</td></tr>
<tr class="light"><td class="value"><strong>Heruman312</strong></td><td class="value">Start!</td></tr>
<tr class="dark"><td class="value"><strong>Mindhunter74</strong></td><td class="value">Great. I've expected that :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Mindhunter74: =)</span></td></tr>
<tr class="dark"><td class="value"><strong>Mindhunter74</strong></td><td class="value">FB_Tim: Gotta split! See ya :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_Tim</span></td><td class="value"><span class="bigRed">Mindhunter74: good luck!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">good luck!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">FB_David</span></td><td class="value"><span class="bigRed">Bye everyone!</span></td></tr>

                                                                    </table>
                                                                    </p>
                                                          </div>
                                                      </div>
                                                    </div><!-- End #mainContentInner -->
                                                </div><!-- End #mainContent -->                                                 
                                                
                                                <jsp:include page="../../sponsors.jsp"/>
                                                
                                            </div><!-- End .bottomAreaContent -->
                                        
                                        </div></div>
                                    </div><!-- End .bottomArea -->
                                    
                                </div><!-- End #contentInnerInner -->
                            
                            </div><!-- End #contentInner -->
                            
                            <div class="contentBottomLeft"><div class="contentBottomRight">
                                <div class="contentTopInner"></div>
                            </div></div>
                            
                    </div><!-- End #content -->
                
                </div><!-- End #wrapperContentInner -->
                
            </div>
        </div><!-- End #wrapperInner -->
    </div><!-- End #wrapper -->

<jsp:include page="../../footer.jsp"/>
</body>
</html>
