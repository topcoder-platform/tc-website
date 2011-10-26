<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="/script.jsp" />

<title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
<STYLE TYPE="text/css">
.light
{
background-color: #106363;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}

.dark
{
background-color: #0B4E4E;
color: #FFFFFF;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}
</STYLE>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="overview"/>
<jsp:param name="tabLev2" value="sponsors"/>
<jsp:param name="tabLev3" value="bloomberg"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="left"><A href="/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg"><img src="/i/tournament/tccc06/bloomberg_logo.gif" alt="Bloomberg" border="0" /></A></div>
<br><br>
<h2>SRM 323 Chat Transcript</h2>
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">Welcome</td></tr>
<tr><td class="dark"><b>mastermage</b></td><td class="dark">hi</td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">i must admit I know very little about bloomberg</td></tr>
<tr><td class="dark"><b>harvey6ft</b></td><td class="dark">Hello everyone!</td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">hi!</td></tr>
<tr><td class="dark"><b>tywok</b></td><td class="dark">are you going to be at TCCC?</td></tr>
<tr><td class="light"><b>harvey6ft</b></td><td class="light">Where is Bloomberg?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">tywok: definetly. I will be there. With 3 other programmers and an HR rep</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">Hi superkinhluan&gt;: A great place to learn more about us at bloomberg.com. We are a leading global provider in data, news and analytics</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">We are Located in 126 countries around the world.</td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">BB_Stuart: cool</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">We are headquatered in NY. But have many offices in 126 countries</span></td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">BB_Stuart: I suppose we'll meet there</td></tr>
<tr><td class="dark"><b>harvey6ft</b></td><td class="dark">What countries are you hiring in now?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">NY, NJ, London</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">we are hiring in NY, Princetion (US) and London (UK)</span></td></tr>
<tr><td class="light"><b>harvey6ft</b></td><td class="light">What technologies do you work with at Bloomberg?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">we largely use C++ on Unix.</span></td></tr>
<tr><td class="light"><b>Peterpay</b></td><td class="light">a lot of multithread programming??</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">depends on the project</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">fair</span></td></tr>
<tr><td class="dark"><b>mastermage</b></td><td class="dark">why Unix and not Windows?</td></tr>
<tr><td class="light"><b>n_i_r_a_n_j_a_n</b></td><td class="light">How much are you guys in to Java</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">well our clients do run the bloomberg on windows (and can run through citrix on macs and linux as well), but our data centers where all the stuff happens and where all the software runs run unix</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">we use a little Java. It is increasing</span></td></tr>
<tr><td class="dark"><b>n_i_r_a_n_j_a_n</b></td><td class="dark">Which part of your products are developed using Java..?</td></tr>
<tr><td class="light"><b>harvey6ft</b></td><td class="light">What sort of problems could a new person expect to work on during an average day?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">there are apps through out the firm that are Java. But it is a much smaller thing compared to C++</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">a new person in an average day will be working on new projects, enhancements, working on a BF. Everyone is involved in all aspects all the time</span></td></tr>
<tr><td class="dark"><b>n_i_r_a_n_j_a_n</b></td><td class="dark">Ok.so what is your general expectations from a prospective developer</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">Not to sounds too Joel Spolsky, but we are looking for smart people who get things done.</span></td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">LOL</td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">I like Joel</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">Joel has an interesting point of view and is a very clear and interesting writer</span></td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">agree, but sometimes he goes too much</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">yeah, he does. But to some extent he has earned a little of that.</span></td></tr>
<tr><td class="light"><b>harvey6ft</b></td><td class="light">if someone were interested in applying to Bloomberg, what's the best way to do it?</td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">does BB have office in Singapore?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">we do. but it is NOT a development office. Just the less important things like Sales</span></td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">then, do you hire international candidate?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">Yes we do hire international candidate</td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">how do I apply?</td></tr>
<tr><td class="light"><b>harvey6ft</b></td><td class="light">How many people are you going to hire this year out of college?</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">BB_Christine: What technical skills you are looking for?</td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">how are the interviews conducted?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">Hello Everyone. My name is Stuart. I am a senior developer at Bloomberg. With me is Tara (currently known as Christine) from HR. We are here to answer any questions you may have. If you havent got that already</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">http://www.topcoder.com/tc?module=Static&d1=tournaments&d2=tccc06&d3=bloomberg</td></tr>
<tr><td class="dark"><b>ali_raza_shaikh</b></td><td class="dark">BB_Christine: any prefferend languages?</td></tr>
<tr><td class="light"><b>ali_raza_shaikh</b></td><td class="light">BB_Christine: * any preferred language?</td></tr>
<tr><td class="dark"><b>Peterpay</b></td><td class="dark">BB_Christine: is there any way to follow the process of my job application</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">BB_Stuart: Do you offer internship for international students?</td></tr>
<tr><td class="dark"><b>harvey6ft</b></td><td class="dark">Also, you can "opt-in" during this SRM and upload your information here at Topcoder to apply</td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">what is BB's policy on relocation?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">for progs out of school we look for strong tech skills,but not for a particular tech.Different schools teach different things: Java, C++ as the primary language. We look for good people and will help get up to speed on the things we use internally and C+</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">there are a few rounds of interviews.</span></td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">how's the interview conducted for international candidates?</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">BB_Christine: Do you offer internship for international students?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">We do relocation, more information will be provided once we move forward in the process</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">yes we do offer internships for international students</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">Are you an international candidate studying in the US?</td></tr>
<tr><td class="light"><b>Peterpay</b></td><td class="light">superkinhluan: first resume review, then phone screen adn then face to face interview the normal way</td></tr>
<tr><td class="dark"><b>nikzzz</b></td><td class="dark">I just interested in international intership, how can i find more info?</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">BB_Christine: No. I study in Yerevan, Armenia.</td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">Peterpay: is that applied to international candidates too?</td></tr>
<tr><td class="light"><b>superkinhluan</b></td><td class="light">Peterpay: if I don't stay in US, how can I have a face-to-face interview?</td></tr>
<tr><td class="dark"><b>vahem</b></td><td class="dark">BB_Christine: Do you offer internship for students studying out of US? I do well at TopCoder. What are my chances to be accepted for internship at Bloomberg?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">The interview process will start with a phone screen and if there is interested the face to face will be conducted in the NY or London.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">For HR Questions ask "Christine" for R&D ask Stuart</span></td></tr>
<tr><td class="light"><b>Peterpay</b></td><td class="light">superkinhluan: ive applied from mexic</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">We have internships in London is that something you are interested in? vahem&gt;</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">Mexico can be a US internship.</td></tr>
<tr><td class="dark"><b>superkinhluan</b></td><td class="dark">BB_Stuart: what projects are you recruiting for right now?</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">BB_Christine: Yes I am interested in internship in London. Is it going to take place during summer vacations?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">we recruit for Programming in general across all areas. Fixed Income, Equity, Trading Systems, Execution, Technology</span></td></tr>
<tr><td class="light"><b>tywok</b></td><td class="light">after which year of university is it possible to get an intership?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">usually between junior and senior and in the us system</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">vahem&gt; yes it is during the summer, please visit careers.bloomberg.com -&gt; Europe --&gt; Internships</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">vahem&gt; more then 85% of our internships to Jr And Seniors.</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">I am a sophomore now.</td></tr>
<tr><td class="dark"><b>emka207</b></td><td class="dark">BB_Stuart: are the openings only for positions based in US?</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">Is it possible for me to have internship between this year and my junior year.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">thats perfect when you take the internship you will be an incoming Junior</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">yes</td></tr>
<tr><td class="dark"><b>vahem</b></td><td class="dark">OK. Nice to hear that.</td></tr>
<tr><td class="light"><b>emka207</b></td><td class="light">BB_Stuart: will there be any training given for some of us that has no finance background?</td></tr>
<tr><td class="dark"><b>vahem</b></td><td class="dark">BB_Christine: Thanks for the link.</td></tr>
<tr><td class="light"><b>vahem</b></td><td class="light">BB_Christine: That will be great.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">yes there is training for people without a finance background</span></td></tr>
<tr><td class="light"><b>UWFhollaback</b></td><td class="light">is Bloomberg in the US?</td></tr>
<tr><td class="dark"><b>UWFhollaback</b></td><td class="dark">I'm here in Florida, US.</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">bloomberg's main office is in NY, NY</span></td></tr>
<tr><td class="dark"><b>UWFhollaback</b></td><td class="dark">I have no financial background.</td></tr>
<tr><td class="light"><b>UWFhollaback</b></td><td class="light">should i still apply?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">having a financial background is not a requirement</span></td></tr>
<tr><td class="light"><b>UWFhollaback</b></td><td class="light">i have a BS in CS and will finish my MS in CS soon (May2007)</td></tr>
<tr><td class="dark"><b>emka207</b></td><td class="dark">BB_Stuart: for which part of the US the positions being available?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">Ny, NY and princeton NJ</span></td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">We are now looking for people who are graduating in May 2007</span></td></tr>
<tr><td class="light"><b>UWFhollaback</b></td><td class="light">oh cool!!</td></tr>
<tr><td class="dark"><b>emka207</b></td><td class="dark">BB_Stuart: I'm aware that the company will support relocation, right?</td></tr>
<tr><td class="light"><b>UWFhollaback</b></td><td class="light">what abt lack of experience, Stuart?</td></tr>
<tr><td class="dark"><b>UWFhollaback</b></td><td class="dark">just straight out of schooling.</td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">hello BB_Stuart.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">we are looking for JR programmers right out of school. that is why were are doing the TCCC</span></td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">Well, i'm graduating in 2007 may.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">MadGuy: Hello</span></td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">can i apply for bloomberg?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">Hi</td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">i'm doing my bsc in se at IIT-Sri lanka.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">MadGuy: Thats fine. We are looking for people who grad this year</span></td></tr>
<tr><td class="light"><b>emka207</b></td><td class="light">BB_Stuart: I graduated last year, and had been writing my own trading system for a couple of months.. not for my full time Job..</td></tr>
<tr><td class="dark"><b>MadGuy</b></td><td class="dark">which is a internal degree provided by university of westminster</td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">what are the positions available for me to apply?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">we are looking for software developers in NY, NJ and London</span></td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">i'm doing the 4 yrs honours degree.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">we have the financial software developer position in NY&lt; NJ and LO</td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">i'm more good in java and less in c++ of course.</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">emka: thats pretty cool. we do look for people up to a few years out of school for this position as well</span></td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">thats fine if your main lang isnt c++. However, if Java is your lang, your should be strong in that, because that is what we will interview you on. If you are a good programmer you will pick up the C++ quickly</span></td></tr>
<tr><td class="dark"><b>emka207</b></td><td class="dark">BB_Stuart: if you are saying that you are looking for a software developer.. what kind of software/system that we are going to build for this positions?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">Bloomberg builds large scale financial systems that are used around the world 24/7. It covers all markets (FI, Equity) and countries</span></td></tr>
<tr><td class="dark"><b>MadGuy</b></td><td class="dark">since i live in SL and i dont have financial facility to go abroad, what are the chances for me to apply? how are you gonna interview me in such a senario?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">emka: talk to chrisitne on HR questions. but you can apply through the website</span></td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">We do some international recruiting for both internships are Full Time positions, since we do not visit SL you can visit our career site and apply via careers.bloomberg.com</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">your interview will start with a phone screen and if you are selected you will have a face to face interview at the closest R&D office</td></tr>
<tr><td class="dark"><b>MadGuy</b></td><td class="dark">can i apply eventhough i'm not a rated topcoder member? :D since this is my first time here.</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">Yes, Ofcourse</td></tr>
<tr><td class="dark"><b>dai_yx</b></td><td class="dark">hello boys</td></tr>
<tr><td class="light"><b>MadGuy</b></td><td class="light">where else do you have offices except usa?</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Stuart</span></td><td class="dark"><span class="bigRed">london</span></td></tr>
<tr><td class="light"><b>dai_yx</b></td><td class="light">how about you</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">around the world...126 countries..technology is is in NY and London</td></tr>
<tr><td class="light"><span class="bigRed">BB_Christine</span></td><td class="light"><span class="bigRed">NJ also (US)</td></tr>
<tr><td class="dark"><b>d0nJuan_</b></td><td class="dark">hey mr</td></tr>
<tr><td class="light"><b>d0nJuan_</b></td><td class="light">hey mrbobguy whatsup</td></tr>
<tr><td class="dark"><b>UWFhollaback</b></td><td class="dark">Stuart: how can i send you my resume?</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">through topcoder or on the bloomberg website</span></td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">careers.bloomberg.com</td></tr>
<tr><td class="light"><b>thanhtung</b></td><td class="light">N.M.Hieu: dong chi cung thi ah</td></tr>
<tr><td class="dark"><b>N.M.Hieu</b></td><td class="dark">thanhtung: Ko , register thoi</td></tr>
<tr><td class="light"><b>N.M.Hieu</b></td><td class="light">thanhtung: con thi hay ko thi chua biet</td></tr>
<tr><td class="dark"><b>N.M.Hieu</b></td><td class="dark">thanhtung: vua di hoc ve</td></tr>
<tr><td class="light"><b>N.M.Hieu</b></td><td class="light">thanhtung: met lam</td></tr>
<tr><td class="dark"><b>thanhtung</b></td><td class="dark">N.M.Hieu: lai con the nua</td></tr>
<tr><td class="light"><b>thanhtung</b></td><td class="light">N.M.Hieu: to cung the</td></tr>
<tr><td class="dark"><b>chanson</b></td><td class="dark">why can't i enter</td></tr>
<tr><td class="light"><b>superzn</b></td><td class="light">.</td></tr>
<tr><td class="dark"><b>thanhtung</b></td><td class="dark">N.M.Hieu: vua moi di hoc ve</td></tr>
<tr><td class="light"><b>SuperFly</b></td><td class="light">AAAA I'm late (</td></tr>
<tr><td class="dark"><b>thanhtung</b></td><td class="dark">N.M.Hieu: met qua</td></tr>
<tr><td class="light"><b>ibiro</b></td><td class="light">I cannot enter the room can anyone help me what is the problem?</td></tr>
<tr><td class="dark"><b>N.M.Hieu</b></td><td class="dark">thanhtung: hom nay ngay khi gio gi` ma lam viec het ca 18 tieng T__T</td></tr>
<tr><td class="light"><b>entity</b></td><td class="light">wait til the system assigns your room</td></tr>
<tr><td class="dark"><b>shalinmangar</b></td><td class="dark">My first SRM from office</td></tr>
<tr><td class="light"><b>niphoton</b></td><td class="light">ibiro: wait for some more time</td></tr>
<tr><td class="dark"><b>SuperFly</b></td><td class="dark">Wait a bit</td></tr>
<tr><td class="light"><b>martin-g</b></td><td class="light">ibiro: it's not time yet</td></tr>
<tr><td class="dark"><b>windbreaker</b></td><td class="dark">d</td></tr>
<tr><td class="light"><b>windbreaker</b></td><td class="light">dddd</td></tr>
<tr><td class="dark"><b>nimisis</b></td><td class="dark">ibiro: rooms haven't been assigned yet</td></tr>
<tr><td class="light"><b>olga_k</b></td><td class="light">Still early</td></tr>
<tr><td class="dark"><b>srik_sama</b></td><td class="dark">ibiro: You can enter the room only after you get the message from admin</td></tr>
<tr><td class="light"><b>prokofyev</b></td><td class="light">ibiro: Wait 2 minutes. System is assigning participants by rooms.</td></tr>
<tr><td class="dark"><b>MadGuy</b></td><td class="dark">bb_s</td></tr>
<tr><td class="light"><b>thanhtung</b></td><td class="light">N.M.Hieu: cha biet nua</td></tr>
<tr><td class="dark"><b>thanhtung</b></td><td class="dark">N.M.Hieu: met qua</td></tr>
<tr><td class="light"><b>prokofyev</b></td><td class="light">ibiro: Now you can enter.</td></tr>
<tr><td class="dark"><b>N.M.Hieu</b></td><td class="dark">thanhtung: uh` T__T</td></tr>
<tr><td class="light"><b>quarkz</b></td><td class="light">let's go</td></tr>
<tr><td class="dark"><b>MadGuy</b></td><td class="dark">BB_Stuart: thank you verymuch for the information provided.</td></tr>
<tr><td class="light"><span class="bigRed">BB_Stuart</span></td><td class="light"><span class="bigRed">sure</span></td></tr>
<tr><td class="dark"><b>N.M.Hieu</b></td><td class="dark">thanhtung: dang lam gi the ?</td></tr>
<tr><td class="light"><b>N.M.Hieu</b></td><td class="light">thanhtung: ca tien la dang an com :D</td></tr>
<tr><td class="dark"><b>thanhtung</b></td><td class="dark">N.M.Hieu: ko</td></tr>
<tr><td class="light"><b>thanhtung</b></td><td class="light">N.M.Hieu: da an uong gi dau</td></tr>
<tr><td class="dark"><span class="bigRed">BB_Christine</span></td><td class="dark"><span class="bigRed">Thanks everyone: GOOD LUCK!</td></tr>
<tr><td class="light"><b></b></td><td class="light"></td></tr>
</table>

        </div>
      </td>
        
         
<!-- Right Column-->
<td>&#160;</td>
<%--
        <td width="170" align="right">
            <jsp:include page="right.jsp">
            <jsp:param name="level1" value="bloomberg"/>
            </jsp:include>
         </td>
--%>      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />
</body>

</html>
