<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>2007 TopCoder Open - Computer Programming Tournament</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tco07.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
    <jsp:include page="../../script.jsp" />
</head>
<body>

<div align="center" style="background: transparent;">
    <div id="content">

        <jsp:include page="../header.jsp" />

        <table cellpadding="0" cellspacing="0" id="spacer">
        <tbody>
            <tr>
                <td id="navSpacer">

                    <jsp:include page="../nav.jsp" >
                    <jsp:param name="tabLev1" value="overview"/>
                    <jsp:param name="tabLev2" value="sponsors"/>
                    <jsp:param name="tabLev3" value="drw"/>
                    </jsp:include>

                </td>
                <td id="bodySpacer" width="100%">
                    <div id="pageBody">
                        <div style="margin-bottom: 20px;"><a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw" /><img src="/i/tournament/tco07/drwlogo.png" alt="DRW" border="0" /></a>
                        <div align="right"><tc-webtag:forumLink forumID="514387" message="Discuss this" /></div>
                        </div>

<table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from SRM 344</div>
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
<tbody>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">hello!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">Morning everyone</span></td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">Does anyone have a question for the DRW folks?</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Are you looking to hire people for the fixed-income side or the equity side?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: primarily fixed income</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Eurodollar futures and stuff like that?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: yes, and treasuries</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: we also do a lot of commodities, like oil and gas</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@Rachel:  The Eurodollar asset class is our biggest product.  We are one of the worlds leading market makers in the options on the Eurodollar contract.</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Do the software people have to work whenever the markets are open, along with the traders, or is there some flexibility in the schedule?</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">What type of work are your software developers working on?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@Rachel - There is some flexibility, but let me explain.</span></td></tr>
<tr class="light"><td class="value">raviupreti85</td><td class="value">kclune: hello</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">raviupreti85: howdy.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">kclune: The software developers work on the entire software stack involved with trading.  Databases, network programming to the exchange, model implementation, and GUI design work to name a few...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@Rachel - The markets that our company trades on are open 24 hours a day.  So it is impossible to work those hours. Generally we like our programmers to be here from about 8-5, +/- an hour on either side.</span></td></tr>
<tr class="light"><td class="value">raviupreti85</td><td class="value">Javes: hi</td></tr>
<tr class="dark"><td class="value">tyrannus</td><td class="value">Does DRW have summer internship positions for current undergrad students?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Do the software people go through the full training program as described on your web site or just the two-week "boot camp"?</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">DRW_Graham: That's cool.  What languages are you using?</td></tr>
<tr class="light"><td class="value">Javes</td><td class="value">raviupreti85: hey</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@tyrannus DRW offers summer internships for Software, Trading, and Quantitative Research positions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">kclune: We primarily use C# in Windows.  We also write in C++ on both Linux and Windows.  For databases we write in T-SQL on MS SQL 2005</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">I saw ACE/TAO mentioned as a desired skill. Are you using ACE extensively?</td></tr>
<tr class="light"><td class="value">Mloody2000</td><td class="value">Question about internships - would it be possible to make an 6-months internship from january to june ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: we are using it for our linux applications.  right now it isn't endemic across the codebase, but we wouldn't like to incorporate it more</span></td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Are you using full-blown TAO or just the ACE abstractions?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: just the ACE abstractions.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@Mloody2000 : Absolutely, we are very flexible with our internship program.  It basically comes down to whatever you are willing to give us in terms of time...although after a while it becomes a full time job ;)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: There are two parts to the software training.  The first is to get you familiar with the trading industry.  Options, futures, swaps, etc.  This lasts for the entire first year.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: From the software side for the first couple of weeks, we have a crash course in writing trading software, C#, and advanced development practices/techniques.</span></td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">How much coding do your developers do?</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">and what are some of the challenges you are facing?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">kclune: Developers at DRW spend the majority of their day coding.  The rest is spent on feature digging, meeting with traders, design meetings, code reviews, etc...</span></td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">Where is DRW trading located?</td></tr>
<tr class="dark"><td class="value">Mloody2000</td><td class="value">how about coders with financial background - are you looking only for developers or some more financial jobs are also offered ?</td></tr>
<tr class="light"><td class="value">writer</td><td class="value">how come you're sponsoring the TCO?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: DRW has three locations.  Our main office is in Chicago.  We also have offices in New York and London.  As of now most of the programming is done in the Chicago office, though is used in all three.</span></td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">How is the compensation structured in terms of % base salary vs. guaranteed bonus vs. discretionary bonus?</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">Do you have any remote people?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@Kclune (the challenges question) - There are two major challenges, both having to do with speed: Optimization of code (both for run time things and network transmission), and then time to market.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: No we currently do not.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@writer: two reasons.  first, we feel that it is a great way to attract top coding talent.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@KClune - Bottom line, everything needs to be as fast as possible.  The more optimal the code the more money it makes, the quicker it gets to market, the sooner we start making money on the trade.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@Mloody2000 Several divisions within IT find financial experience a plus, like risk infrastructure and model development.  However DRW has many trading and quantitative researcher opportunities as well.</span></td></tr>
<tr class="dark"><td class="value">writer</td><td class="value">DRW_Lyle: I was more interested in how did you find out about the possibility. News? Google? Employees - TC members?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@writer: second, it is a good way to get our name out into the community.  we aren't a huge firm like UBS or AOL, and this is a good way to publicize ourselves.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@writer: one of the partners has had contacts with the top coder guys for a while now.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@writer: they approached us as a potential sponsor this year, and we agreed to sign up.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: The compensation for software developers starting at DRW is mostly salary.  As the developers become more valuable to the firm, then the discretionary bonus increases.</span></td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">Anyone interested in applying to DRW should go here:</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="light"><td class="value">writer</td><td class="value">DRW_Lyle: I see, thanks.</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">DRW_Graham: I'm a developer who has been interested in this market for a long time, and have built several toy trading systems.</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Is it possible to have a car in Chicago?</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Or would it be better to sell your car before moving there?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@writer: no problem!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@KClune (staying with the challenges question) - We also have to deal with absurd amounts of data.  Upwards of 30,000-40,000 messages a second</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">@writer - It takes a lot of creativity to be able handle that much data in real time while at the same time run pricing, GUI's, and order execution.</span></td></tr>
<tr class="dark"><td class="value">lexgas</td><td class="value">DRW_Chris: DRW develops only software for stock exchange markets ?</td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Graham: Yes, I just did</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">DRW_Chris: So, what is the draw to working for DRW.  Why should TopCoder members want to work there?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook Many people have a car in Chicago and commute to work.  The public transportation is very good as well.  Parking can run you around 150 a month, and 14 a day downtown though..</span></td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">DRW_Chris: Why did you decide to go work for DRW?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">lexgas: We actually focus more on fixed income (products based off of interest rate products).  They are the worlds most traded products (more so then stocks).  Some of our main markets include Chicago Merc Exchange, and Chicago Board of Trade</span></td></tr>
<tr class="dark"><td class="value">Mloody2000</td><td class="value">do you require professional experience while applying ?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">How much would an apartment cost that would allow me to commute in less than, say, 30 minutes on public transportation?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook Or you can live in the suburbs, which are very convenient.</span></td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Graham: For the right package, I would be -- what's xkcd?</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">I live in rural Maryland and am somewhat spoiled by my two-minute commute.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">Mloody2000: No we do not.  We heavily recruit out of the top Computer Science universities in both the United States and Canada.</span></td></tr>
<tr class="dark"><td class="value">zhaofu(do_ob)</td><td class="value">Hi, how should be the salary for a recent graduated (BS degree) student?</td></tr>
<tr class="light"><td class="value">tyrannus</td><td class="value">johnnylambada: a webcomic, they once had the line sudo make me a sandwich, which i noticed in your profile ;)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: There were 2 main reasons.  The first is the challenge.  You just wont see the types of problems that we have to code for at places like Google or Microsoft.</span></td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Graham: ah, yes -- I stole that from a web comic, I forgot the name hehe</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook: The rents for 30 minutes away from downtown are around $1 / square foot.  And for a 2 minute commute probably more like $2-3 per square foot</span></td></tr>
<tr class="light"><td class="value">gorbunov</td><td class="value">What requirements should met candidates in order to get a job in DRW?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: We are out there competing with the best people all over the world. Its keeps you on top of your game while solving novel problems.</span></td></tr>
<tr class="light"><td class="value">Mloody2000</td><td class="value">DRW_Graham: being not at Computer Science, but at "Financial markets and risk management" would be an advantage or disadvantage ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: The second that it was (and is) very obvious that the level of responsibility that we give people is not a function of how long you have been here.  It's about how good you are at what you do.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@gorbunov: the most important requirement is that you be a extremely skilled programmer</span></td></tr>
<tr class="dark"><td class="value">svnay</td><td class="value">Does DRW sponsor a H1B for the right candidate?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@svnay: Yes.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@zhaofu: Our offers are competitive with other firms such as Google, Amazon, Citadel etc.</span></td></tr>
<tr class="light"><td class="value">Mloody2000</td><td class="value">DRW_Graham: both :)</td></tr>
<tr class="dark"><td class="value">Abednego</td><td class="value">Which language/system do you primarily use for development?</td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Graham: From some of the other answers, it looks like you're looking for recent graduates.  I, on the other hand, have a lot of experience developing -- about 20 years worth.  So am I someone you'd even look at?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: Just because someone has been here for only a year doesn't mean they won't be working on the high profile systems.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">Abednego: C# on Windows.  We also use C++ on both Linux and Windows.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@gorbunov: clearly, people with finance experience are preferred, but that sort of knowledge can be taught</span></td></tr>
<tr class="light"><td class="value">stanislas</td><td class="value">DRW_* : Do you have sponsorship programs for student needing funding for a MS in CS ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">Mloody2000: If you are looking to program then you will have to have a degree in Computer Science or experience.</span></td></tr>
<tr class="light"><td class="value">Mloody2000</td><td class="value">DRW_Graham: too bad. Even if I get target at TopCoder ?</td></tr>
<tr class="dark"><td class="value">Mloody2000</td><td class="value">DRW_Graham: target means top10</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">DRW_Chris: Is there room for career growth?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@stanislas: we do sponsor advanced degrees for employees through a tuition reimbursement program</span></td></tr>
<tr class="light"><td class="value">zhaofu(do_ob)</td><td class="value">DRW_Liz: hmmm ... what should be the average in these companies ? (I just want to have an idea)</td></tr>
<tr class="dark"><td class="value">firehell</td><td class="value">.</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">What about relocation assistance?</td></tr>
<tr class="dark"><td class="value">firehell</td><td class="value">DRW_Liz: .</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook: Yes.</span></td></tr>
<tr class="dark"><td class="value">firehell</td><td class="value">DRW_Liz: are you interested in hiring only programmers right now, or you hire people who develop trading strategies too?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: Absolutely-that is one of the best parts about working in capital markets.  There is no upper bound on where you can go.  There are a near infinite number of problems we have to/can solve.  So it's all about how passionate you are.  For example:</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@zhaofu: you can expect 20% over industry average, but I'm not at liberty to give exact numbers.  Try vault.com for more specifics in the market:)</span></td></tr>
<tr class="light"><td class="value">slex</td><td class="value">DRW_Dominic: Do you provide relocation assistance for europeans too?</td></tr>
<tr class="dark"><td class="value">stanislas</td><td class="value">DRW_Lyle: I am a french student starting an MSCS next year in a top-ranked university, any idea for me ? In France, companies sponsor students like me if they engage themselves to work for an internship during their program. Anything similar ?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">You mean the industry average for the finance industry or the industry average for all software developers?</td></tr>
<tr class="dark"><td class="value">Larry</td><td class="value">DRW:  how much flexibility is the job?  can you move to other departments?  (say, maybe do some trading in the future, etc)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: I started here about 3 years ago, about 1.5 years ago along with a few other people started a trading desk (specifically algorithmic).  Now I am the technical lead working on trade development also.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: all software developers</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">Larry: There is a lot of flexibility.  People have moved from software to trading and vice versa.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: The financial industry, on average, pays much better than everyone else.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@slex: yes, we provide relocation for international candidates but  a case by case basis.</span></td></tr>
<tr class="dark"><td class="value">Mloody2000</td><td class="value">DRW_Graham: I will wait a little bit, to improve my TopCoder ratings, as I worked hard last time, it should increase soon. When should I apply, for an internship starting in january ?</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">DRW_Chris: Thanks, that's what I was looking for :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">Larry: Look at my previous response, along with what dominic is saying</span></td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">DRW_Chris: What is the office environment like?</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">DRW_Graham: What's the next step, other than clicking on the "you can contact me" button?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Can employees invest their own money in the company?</td></tr>
<tr class="dark"><td class="value">xtra</td><td class="value">is DRW looking for the guys having experience in trading domain?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook: @firehell Trading strategy ideas can come from any group, Software, Trading, or QR. We have several quant/traders, software/traders etc...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: no, for regulatory reasons.  if you make partner, then the answer is yes.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: After applying through the website, the recruiters will take it from there.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">xtra: Are you looking to program or to trade?</span></td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Are you allowed to employ the trading strategies you'd be learning about with your own account as long as you don't attempt to front-run the firm?</td></tr>
<tr class="dark"><td class="value">xtra</td><td class="value">programming but I have around 4 yrs of exp. of programming trading systems</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: No.  You aren't allowed to trade any of the products that we trade.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: It's this strange mix of very casual and intense at the same time.  We are all here to make money so we work hard, but we know you don't have to wear a suit to do it.  For instance, I'm wearing a t-shirt and jeans right now.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">xtra: Absolutely.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: However, we don't trade stock or equity, so you shouldn't have to worry about personal portfolios.</span></td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">I dunno... I have some pretty crazy stuff in my personal portfolio!</td></tr>
<tr class="dark"><td class="value">Larry</td><td class="value">DRW_Lyle: what products do you trade?</td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Graham: what do you trade?  Futures?</td></tr>
<tr class="dark"><td class="value">TheCreeep</td><td class="value">Can you give us an example of an interesting problem you guys have solved?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: that is probably fine, but you have to hold your position for 30 days minimum.</span></td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">What do you trade, futures?  fx?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">kclune: We have free lunch every day made by a really nice cafe.  We also have our game room.  Which has a huge plasma tv, golden tee golf machine, xbox 360, wii, pool, ping pong, poker tables, foosball.</span></td></tr>
<tr class="dark"><td class="value">TheCreeep</td><td class="value">(you mentioned a lot of interesting challenges earlier)</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">How many hours do people work in an average week?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@RachelCook: additionally, if you are doing trades on products that we trade, your trades will have to be cleared through our compliance group.  btw, these policies are standard across the trading industry.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: We are the leading market makers in Eurodollar Options and Natural Gas Options.  We also trade derivatives on weather, crude oil, corn, beans, bean oil, bean, meal, treasuries, and are looking to expand...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: around 50 hrs/week for programmers</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: Let me start by saying that most of the problems that we solve we aren't allowed to talk about, having said that, give me a second and I'll get you one.</span></td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">Once again, for anyone just joining us, if you are interested in this great career opp. w/ DRW, please apply here:</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="dark"><td class="value">xinsanex</td><td class="value">Wow guys you have a nice environment xD :)</td></tr>
<tr class="light"><td class="value">firehell</td><td class="value">DRW_Chris: are you interested in hiring only programmers right now, or you hire people who develop trading strategies too?</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">I enjoy hand trading the DOW future, YM -- would that be a problem?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">How many partners are there?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@johnny: not a problem</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">firehell: Both.  We basically look to hire smart people.  If you gravitate towards trade development (like Dominic and to a lesser extent me) so be it.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: 8 partners</span></td></tr>
<tr class="light"><td class="value">xinsanex</td><td class="value">are you looking for people that work under pressure?</td></tr>
<tr class="dark"><td class="value">abu_gurnah</td><td class="value">hi there</td></tr>
<tr class="light"><td class="value">shalinmangar</td><td class="value">kclune: I just joined in right now so excuse me if this has been already answered, is DRW looking for people right out of college?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">shalinmangar: Yes we are.</span></td></tr>
<tr class="light"><td class="value">firehell</td><td class="value">DRW_Chris: what's the best way to apply for a job? from website?</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">shalinmangar: Yes.</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">firehell: http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="dark"><td class="value">shalinmangar</td><td class="value">kclune: Thank you.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@shalinmangar: yes, we are looking for software engineers and trading assistants straight out of college</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: I'm still working on an example...very sneaky over here ;)</span></td></tr>
<tr class="light"><td class="value">TheCreeep</td><td class="value">drw</td></tr>
<tr class="dark"><td class="value">TheCreeep</td><td class="value">err, Drw_chris, didn't mean to talk about unmentionables :) If you can give a general example of some sort it's ok.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: In a general sense, one of the most common problems is working with the amount of data we have in real time.  Consider this:</span></td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">Does DRW understand that while the TC algorithm contest is interesting, it's not a real measure of a developer's potential -- no one writes code like you do on TC unless you're working for Jack Bauer.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@xinsanex: Like a hyperbolic chamber?  You can pressure yourself as much as you like, but the environment at DRW is very casual.  We make a point to set reasonable deadlines.</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">johnnylambada: If you're interested in working for people like Jack Bauer, that can be arranged. (I am in the defense industry.)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: Yes.  We would hope the code you would write for us would be more maintainable than code you would write under such time constraints.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: On average we see upwards of 15,000 messages coming into any given system.  Right after an economic number is released that can spike to 40,000+.  Dealing with that in real time is hard enough, now factor in real time GUI's that are responsive.</span></td></tr>
<tr class="light"><td class="value">firehell</td><td class="value">DRW_Chris: do you work with recruiters?</td></tr>
<tr class="dark"><td class="value">PaulJefferys</td><td class="value">RachaelLCook: lol</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: Order execution that is as fast as humanly possible, and models that can price multiple contracts without loosing any of that streaming data.</span></td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">RachaelLCook: Naw -- everyone around Jack dies a nasty death</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@firehell: yes we do</span></td></tr>
<tr class="dark"><td class="value">stanislas</td><td class="value">kclune: DRW : is there any chance to get sponsoring from DRW for an MSCS ? As an example by doing an internship ?</td></tr>
<tr class="light"><td class="value">stanislas</td><td class="value">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: It requires some of the most clean cut and advanced threading systems you will ever write (with algorithms that are highly parallel).  We aren't just putting small systems together, these things are beasts.</span></td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">stanislas: DRW_Liz can you answer this?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@stanislas: we do sponsor advanced training for full time employees</span></td></tr>
<tr class="light"><td class="value">xinsanex</td><td class="value">to manage a lot of messages you don't need to give all the efficiency to programmers you need to think also in your infrastructure. (Hardwares)..</td></tr>
<tr class="dark"><td class="value">danielp</td><td class="value">are some internship opportunities at DRW?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">firehell: Yes, Graham and I actually head up the software side of recruiting, Dominic heads up the Quants, and Liz runs it all.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">danielp: Yes there are internship opportunities.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@danielp: yes, we do.  we're fairly flexible on internships.</span></td></tr>
<tr class="dark"><td class="value">svnay</td><td class="value">how do u plan to use this competition? Will the top 5 or 10 coders be interviewed?</td></tr>
<tr class="light"><td class="value">EmperorofUnivrs</td><td class="value">What kind of qualifications is DRW looking for in its entry-level positions?</td></tr>
<tr class="dark"><td class="value">stanislas</td><td class="value">DRW_Lyle: What about people still student ? How much do you pay your interns ? would it be enough to gather some money to help paying an MS ?</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">do you pay for room and board for internships, or at least give a stipend?</td></tr>
<tr class="dark"><td class="value">daguirrem</td><td class="value">wawawiwa, I like</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">xinsanex: Absolutely.  It adds another dimension to our problem, we have the money to get the best hardware, so we get to play with a lot of cool things you won't get to touch elsewhere.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">EmperorofUnivrs: We are looking for coders that are strong with concurrency, object-oriented programming, and quantitative skills.</span></td></tr>
<tr class="light"><td class="value">trss</td><td class="value">is it possible to turn off user entering and leaving notification here?</td></tr>
<tr class="dark"><td class="value">xinsanex</td><td class="value">rite.</td></tr>
<tr class="light"><td class="value">tyrannus</td><td class="value">trss: yes look in Options menu</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@svnay: we don't have any concrete strategy for interviewing just the top five or ten programmers.  we are basically leverage topcoder as a way to get access to very skilled programmers, and also get our name out into the community.</span></td></tr>
<tr class="light"><td class="value">trss</td><td class="value">thnx</td></tr>
<tr class="dark"><td class="value">Abednego</td><td class="value">trss: yes, Options</td></tr>
<tr class="light"><td class="value">svnay</td><td class="value">ok thanks</td></tr>
<tr class="dark"><td class="value">EdOfTheFu</td><td class="value">NormalGeek: man this tab feature is so awesome</td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">What will your interns be working on?</td></tr>
<tr class="dark"><td class="value">TheCreeep</td><td class="value">Interesting. So one part of it is this extreme programming. And I suppose there are more interesting things that you can't talk about ;)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@kclune: yes, we cover all the expenses for housing during the internship.  Yes, out internships are paid.  Salary is competitive</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Can you elaborate on the type of relocation assistance you offer? Is it just money or do you have someone that can help with logistical support (finding apartments, coordinating movers, etc.)?</td></tr>
<tr class="light"><td class="value">EmperorofUnivrs</td><td class="value">DRW_Graham: Is degree important? I'm actually an electrical & computer engineering student and will be graduating in a year, but I'm very interested in the finance sector</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">I have lived in the DC area my entire life and am intimidated by the idea of planning a cross-country move.</td></tr>

<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">TheCreeep: Exactly.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">EmperorofUnivrs: A Computer Science degree helps but is not required.  If you are as strong in object-oriented programming, concurrency, and math as someone with a CS degree then you are qualified.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@RachelLCook: They helped me move from NY, by flying me in to go with apartment hunters in the city, paying for moving costs, and any other expenses.  Easiest move ever ;).</span></td></tr>
<tr class="dark"><td class="value">valentino</td><td class="value">hello</td></tr>
<tr class="light"><td class="value">padmanabhanp</td><td class="value">will DRW recruit non-US citizens also ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@valentino: hi!</span></td></tr>
<tr class="light"><td class="value">trss</td><td class="value">how will we get notified of d contest?</td></tr>
<tr class="dark"><td class="value">trss</td><td class="value">I mean how do we get started?</td></tr>
<tr class="light"><td class="value">Abednego</td><td class="value">trss: a message will pop up</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">padmanabhanp: Yes.  We do help with visa's also.</span></td></tr>
<tr class="light"><td class="value">kclune</td><td class="value">We just had about 150 people join in the last 5 minutes, so if anyone is interested in applying to DRW, please go here:</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="light"><td class="value">trss</td><td class="value">k</td></tr>
<tr class="dark"><td class="value">ainu7</td><td class="value">oh, we'll test a limit of 1350 posed on TCO quals</td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">I'm looking to start a masters.  Where does one go to learn about trading & trading strategies and still be part of a masters program.  Ideas?</td></tr>
<tr class="dark"><td class="value">Arne</td><td class="value">Talking about internships (especially in relation to programming), in which city would one work?</td></tr>
<tr class="light"><td class="value">ainu7</td><td class="value">already over 1300</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">Arne: Chicago</span></td></tr>
<tr class="light"><td class="value">padmanabhanp</td><td class="value">DRW_Chris: how about people who already hold a visa ?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value">@johnny: there are a number of excellent masters programs here in chicago for finance, in particular uchicago and northwestern</td></tr>
<tr class="light"><td class="value">Astein</td><td class="value">hi</td></tr>
<tr class="dark"><td class="value">Kreator</td><td class="value">hi</td></tr>
<tr class="light"><td class="value">lewha0</td><td class="value">hi</td></tr>
<tr class="dark"><td class="value">Kreator</td><td class="value">good luck :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">padmanabhanp: We only accept mastercard...but seriously, international/US citizen, it doesn't matter.</span></td></tr>
<tr class="dark"><td class="value">EmperorofUnivrs</td><td class="value">DRW_Graham: I would say that I am very strong at math, and somewhat qualified in the other two areas. Does your company have any references in OOP, concurrency, and finance it directs the employees too?</td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">So, an MBA with an emphasis on Finance would be best for trading?</td></tr>
<tr class="dark"><td class="value">ExTaras</td><td class="value">GOOD LUCK FOR ALL</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">EmperorofUnivrs: Having prior financial experience is not necessary.</span></td></tr>
<tr class="dark"><td class="value">Shedal</td><td class="value">Is there #ifdef analog in Java?</td></tr>
<tr class="light"><td class="value">tyrannus</td><td class="value">does DRW do any not Quant trading?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@johnny: no, not a great degree for trading</span></td></tr>
<tr class="light"><td class="value">ainu7</td><td class="value">over 1350 :)</td></tr>
<tr class="dark"><td class="value">padmanabhanp</td><td class="value">DRW_Chris: what technologies are DRW looking for in the people to be recruited ?</td></tr>
<tr class="light"><td class="value">xinsanex</td><td class="value">have a nice day DRW workers!! nice chat, rite now I can not be probably a candidate for you because</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">DRW_Lyle: So for trading, what kind of degree?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@tyrannus Can you be more specific.  We are a very quantitative firm, and try to leverage our programming and quants to create replicable strategies.</span></td></tr>
<tr class="dark"><td class="value">xinsanex</td><td class="value">you evaluate see the scores at page but because I don't have score for Algorithm competitions in topcoder just for Marathon Matches so I'll keep working to get a chances of an interview with you or another company! see you asap :) don't let us alone in the</td></tr>
<tr class="light"><td class="value">ainu7</td><td class="value"> there are no more spots available for SRM 344 <-- someone said like this</td></tr>
<tr class="dark"><td class="value">xinsanex</td><td class="value">dark :D hehehe thnx and again have a nice day</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">padmanabhanp: C#, C++, Java, SQL, python ruby, those are some of the big ones.  Windows and Linux where applicable</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">Python?!?!</td></tr>
<tr class="light"><td class="value">tyrannus</td><td class="value">DRW_Dominic: can traders pick a future cause they have a gut feeling about it, or do they need to justify their trades based on a quant model?</td></tr>
<tr class="dark"><td class="value">Shedal</td><td class="value">RachaelLCook: What "Python"?</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">How much are you all using Python?</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">I love Python!</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">padmanabhanp: Python is pretty sick in .NET</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">You use the .NET implementation of Python?</td></tr>
<tr class="light"><td class="value">muntasir_120</td><td class="value">RachaelLCook: me too</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">DRW_Lyle: ok, thx</td></tr>
<tr class="light"><td class="value">xinsanex</td><td class="value">ohh well i think topcoder need to let us write more in the textbox xD</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: Yes we use IronPython in conjunction with .NET.</span></td></tr>
<tr class="light"><td class="value">xinsanex</td><td class="value">and modify all the things we type</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tco07&d3=sponsorspatrons&d4=drw</td></tr>
<tr class="light"><td class="value">padmanabhanp</td><td class="value">DRW_Chris: how about industry experience in C, but good knowledge in C++, SQL</td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">One more time.</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">That's awesome! I have been trying to sell my company on something similar (using Jython as an embedded scripting language for Java applications) but no one seems interested.</td></tr>
<tr class="dark"><td class="value">johnnylambada</td><td class="value">DRW_Lyle: (Gotta go...) What schools?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">padmanabhanp: That works too.  C is even better in some cases for the highly algorithmic things.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: We find it particularly helpful in testing.</span></td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Lyle: Other than Chicago ones you already mentioned</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@tyrannus You have to be able to justify your idea.  Because ultimately the goal is to quantify the trading strategies, to get at the root of their success.</span></td></tr>
<tr class="light"><td class="value">johnnylambada</td><td class="value">DRW_Lyle: ok, thx</td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">So someone in a testing role would get to make extensive use of Python?</td></tr>
<tr class="light"><td class="value">tyrannus</td><td class="value">DRW_Dominic: thanks.  And thanks to all the DRW people :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: Developers test too.</span></td></tr>
<tr class="light"><td class="value">padmanabhanp</td><td class="value">DRW_Chris: can i get your email id ></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: Developers unit test and then use IronPython for integration testing.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Dominic</span></td><td class="value"><span class="bigRed">@tyrannus Welcome.</span></td></tr>
<tr class="dark"><td class="value">jmpld40</td><td class="value">Thanks DRW</td></tr>
<tr class="light"><td class="value">RachaelLCook</td><td class="value">Yes but the website lists positions for dedicated QA people so I am assuming you have people who are primarily concerned with testing.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Liz</span></td><td class="value"><span class="bigRed">@jonnylambada: we recruit at the top programs: CMU, MIT, Stanford, Berkeley, UIUC, IU...</span></td></tr>
<tr class="light"><td class="value">EmperorofUnivrs</td><td class="value">will DRW be here after the match? i have more questions</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: yes, we have a dedicated QA team.  A mix of manual tests and automated tests.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">RachaelLCook: The QA department will also use IronPython for testing.  But we try not to be tool specific.  Whatever helps the developer.  I use Ruby to help me interface with source control.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">GL in the competition everyone.</span></td></tr>
<tr class="light"><td class="value">jmpld40</td><td class="value">feel free to ask more questions for DRW here:  http://forums.topcoder.com/?module=ThreadList&forumID=514387</td></tr>
<tr class="dark"><td class="value">EmperorofUnivrs</td><td class="value">thanks</td></tr>
<tr class="light"><td class="value">padmanabhanp</td><td class="value">DRW_Chris: thanks!!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">DRW_Graham</span></td><td class="value"><span class="bigRed">johnnylambada: we recruit at UofMichigan also</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Chris</span></td><td class="value"><span class="bigRed">Yah, just post on the message boards, we'll keep an eye on it and answer any questions there.</span></td></tr>
<tr class="dark"><td class="value">RachaelLCook</td><td class="value">thanks, see you all later</td></tr>
<tr class="light"><td class="value"><span class="bigRed">DRW_Lyle</span></td><td class="value"><span class="bigRed">@Rachel: *waves* thanks for the good questions Rachael</span></td></tr>
<tr class="dark"><td class="value">kclune</td><td class="value">Thanks DRW.</td></tr>
</tbody>
</table>

                    </div>
                </td>
            </tr>
        </table>


        <jsp:include page="../footer.jsp" />
    </div>
</div>

</body>

</html>
