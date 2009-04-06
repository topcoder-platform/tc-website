<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="sponsors"/>
    <jsp:param name="tabLev3" value="verisign"/>
    </jsp:include>


        
        
        <h2>VeriSign</h2>
        
        <div style="padding-bottom:10px;">
            <a href="/tc?module=Static&amp;d1=tournaments&amp;d2=tco08&amp;d3=sponsorpatrons&amp;d4=verisign"><img alt="TCO08 Sponsored by VeriSign" src="/i/tournament/tco08/verisign_logo.png" /></a>
        </div>
        <div align="right"><tc-webtag:forumLink forumID="522252" message="Discuss this" /></div><br />
        <table width="100%" cellpadding="0" cellspacing="0" class="stat">
            <tr>
                <th colspan="2">Chat transcript from SRM 409</th>
            </tr>
            <tr>
                <th>Handle</th>
                <th>Comment</th>
            </tr>
<tr class="light"><td><strong>jmpld40</strong></td><td>Welcome to the VeriSign Chat!</td></tr>
<tr class="dark"><td><strong>gmohan</strong></td><td>hai to all</td></tr>
<tr class="light"><td><strong>viswanath</strong></td><td>jmpld40: Thanks :)</td></tr>
<tr class="dark"><td><strong>chtomek</strong></td><td>Hi</td></tr>
<tr class="light"><td><strong>millky</strong></td><td>jmpld40: can us Chinese get an position in VeriSign?</td></tr>
<tr class="dark"><td><strong>jmpld40</strong></td><td>This chat is focused on  DDoS Threats and Mitigation Strategies</td></tr>
<tr class="light"><td><strong>jmpld40</strong></td><td>Scott from VeriSign is here to discuss</td></tr>
<tr class="dark"><td><strong>ika</strong></td><td>what is VeriSign</td></tr>
<tr class="light"><td><strong>ika</strong></td><td>?</td></tr>
<tr class="dark"><td><strong>jmpld40</strong></td><td>yup, but the best way is for you to just start chatting and they will throw out questions or comments</td></tr>
<tr class="light"><td><strong>ahmedsaad</strong></td><td>can we start with simple descriptions</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">VeriSign is a medium-sized Internet infrastructure company.</span></td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">primary focus is on three product lines: Internet naming (think ""domain name system""), digital certificates, and Internet identity</span></td></tr>
<tr class="dark"><td><strong>cska</strong></td><td>would you please brief describe what DDoS is?</td></tr>
<tr class="light"><td><strong>Nutty</strong></td><td>Distributed Denial of service</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">my team develops infrastructure software for the naming business</span></td></tr>
<tr class="light"><td><strong>Amith</strong></td><td>What does Distributed signify here</td></tr>
<tr class="dark"><td><strong>zulo</strong></td><td>DDoS ss some kind of hacker attack on public servers</td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>something like BIND?</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">right, it's a type of attack used to bring down systems by flooding them with traffic</span></td></tr>
<tr class="light"><td><strong>cska</strong></td><td>but how does it work?</td></tr>
<tr class="dark"><td><strong>zzyzz</strong></td><td>hi scott, any difference of internet naming and internet identity?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">think of flooding a web server with lots of http requests</span></td></tr>
<tr class="dark"><td><strong>TheMentor</strong></td><td>Verisign Hi!</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">at some point the server can't keep up, so it effectively stops working</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">naming vs. identity: yes, very different</span></td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>So, Scott, you're trying to find a strategy to fitler the attack, perhaps from identifying pattern in the attack traffic?</td></tr>
<tr class="dark"><td><strong>cska</strong></td><td>so what is the meaning of ""distributed"" in this kind of attack</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">we're implementing software and hardware systems to protect ourselves against DDOS attacks on the DNS infrastructure</span></td></tr>
<tr class="dark"><td><strong>zulo</strong></td><td>distributed means the attack provided from many hosts in the same time</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">distributed: being attacked by many. many systems at once, like with a botnet</span></td></tr>
<tr class="dark"><td><strong>zzyzz</strong></td><td>how can you tell attack from normal service?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">distributed: it's not often easy, which makes this a difficult problem to solve</span></td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>a normal DoS is easier to counter??</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">distributed: lots of repeated queries from the same source is one typical attack pattern, though</span></td></tr>
<tr class="dark"><td><strong>cska</strong></td><td>the normal case should be much easier</td></tr>
<tr class="light"><td><strong>Nutty</strong></td><td>but its natural that the attacker would use some means of spoofing his IP</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>multiple requests from a single source make it quite obvious</td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>it's easy to identify IP spoofing if the DNS query has the same pattern, such as the same query ID</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>hmmm...what about a DDoS?...</td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>however, attackers are often smart enough to fake many many DNS queries without any repeated pattern among those queries</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">truth be told, we believe in adding capacity to absorb most attacks is one of the better ways to deal with them, in addition to filtering and load balancing</span></td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">precisely because it's difficult to distinguish attack patterns from normal heavy volume</span></td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>wont it end up costing a lot?...i mean u cant just increase capacity at will...</td></tr>
<tr class="light"><td><strong>codersingh</strong></td><td>so what do you want from we programmers</td></tr>
<tr class="dark"><td><strong>zzyzz</strong></td><td>so you can dispatch requests to different machines of a cluster, so that the average load of a single machine won't be too heavy</td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>Then, Scott, your are combating with the size of the army controlled by attackers</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">of course there's a cost, but commodity servers get cheaper and cheaper over time</span></td></tr>
<tr class="light"><td><strong>codersingh</strong></td><td>I want to ask some questions'</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">and we operate many resolution sites at locations dispersed all over the world</span></td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>basically, it may be an army race when it comes to absorb attacks</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">correct</span></td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>I have the same question as codersingh.  What do you want from we programmers?</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>resolution of sites at multiple locations is like hosting it on many servers is it?</td></tr>
<tr class="light"><td><strong>fuhjyi.chang</strong></td><td>to design better algorithms to distribute the load?</td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>how can I approach you</td></tr>
<tr class="light"><td><strong>codersingh</strong></td><td>means Verisign</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">I don't know what the specifics of the upcoming challenge are</span></td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">but in general, we've been asking for help with tasks in several different areas'</span></td></tr>
<tr class="dark"><td><strong>fuhjyi.chang</strong></td><td>Scott, such as?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">approach how?</span></td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>you mean to say that I have to top some of the competitions so that I could gather some limelight</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">most recent I was involved with was for a sliimed-down JDBC driver</span></td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>are you talking to me VeriSign_Scott</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">because my team is lean on Java experience, but heavy with C++</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">codersingh: specifically, no</span></td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">what are you looking for, codersingh?</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">we've also looked for help with user interface development</span></td></tr>
<tr class="light"><td><strong>codersingh</strong></td><td>I want you people to give me a chance\</td></tr>
<tr class="dark"><td><strong>kino</strong></td><td>I'm curious how they get a hold of so many hosts. maybe you could track down the malware and analyze it?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">a chance at what?</span></td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>just test my coding skills</td></tr>
<tr class="light"><td><strong>thejdev</strong></td><td>thats why we have topcoder</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">botnets are cheap, kino</span></td></tr>
<tr class="light"><td><strong>balakumar86</strong></td><td>k, let's test his skill</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>topcoder tests well</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>we dont need to</td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>sometimes we programmers do not get times to appear for some competitions and hence it becomes tedious</td></tr>
<tr class="light"><td><strong>balakumar86</strong></td><td>a+b=b+c true or false.. come on codersingh</td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>are you making mess out of me?</td></tr>
<tr class="light"><td><strong>Nutty</strong></td><td>VeriSign_Scott: what do you mean by infrastucture for naming bussiness?</td></tr>
<tr class="dark"><td><strong>balakumar86</strong></td><td>nope, absolutely not</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>hii verisign</td></tr>
<tr class="dark"><td><strong>rokoder</strong></td><td>hi verisign</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Nutty: database optimization, monitoring, ddos protection</span></td></tr>
<tr class="dark"><td><strong>codersingh</strong></td><td>I can modify that silly statement so that you might perish</td></tr>
<tr class="light"><td><strong>codersingh</strong></td><td>OK lets check up</td></tr>
<tr class="dark"><td><strong>balakumar86</strong></td><td>k, come on, do it</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: suppose i am a java programmer..in the programming terms what wud u expect from me???</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: i mean...what things shud i know well.....inorder to have a chance of working with verisign?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: We use Java primarily in our domain name registration systems</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: we look for significant skills in network programming and development of high performance software</span></td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: means u dont require a java programmer who is very good with algorithms?</td></tr>
<tr class="dark"><td><strong>balakumar86</strong></td><td>other than network pgmming, what other reqmts r der in java side?</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: i mean topcoder checks algortihms</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: lots of tcp/ip, for example.  not co much a focus on algorithms.</span></td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: okk.....</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: thank you</td></tr>
<tr class="light"><td><strong>amiune</strong></td><td>VeriSign_Scott: about DDoS do you use some pattern recognition algorithms to detect and mitigate?</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: what about web developers who know jsp, struts</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: are they having a chance???</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">balakumar86: it's mostly about network programming and software optimization</span></td></tr>
<tr class="light"><td><strong>thejdev</strong></td><td>Hey but topcoder tests your familiarity with STL classes (which i'm bad at) ... so its also a test of your familiarity with programming not just algos</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: whats is the default coding language that ull use</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>thejdev: hey buddy...but STL is maibly i guess with algorithms</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>thejdev: although i m not also gooda t it:)</td></tr>
<tr class="light"><td><strong>thejdev</strong></td><td>any1 who knows STL to implement a range of data structs will have the advantage at toopcoder</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: very little jsp, struts, etc, but we do use them a little.  Most infrastructure work is in C++</span></td></tr>
<tr class="light"><td><strong>balakumar86</strong></td><td>>verizon_scott:fine..</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: thank you soo much....</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: np</span></td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: acha one more thing....do you provide internship for indian students?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Did I miss any questions?</span></td></tr>
<tr class="dark"><td><strong>Nikaustr</strong></td><td>VeriSign_Scott: Hi, have you discussed DDoS attacks yet?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">we do have some summer internships, but nothing specifically for Indian students</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Nikaustr: Some</span></td></tr>
<tr class="light"><td><strong>amiune</strong></td><td>VeriSign_Scott: yes I asked about what kind of algorithms do you use to mitigate DDoS attaks?</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: what do you expect from students who apply for internship</td></tr>
<tr class="light"><td><strong>Nutty</strong></td><td>Do you have a presence in India?</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">amiune: they're proprietary</span></td></tr>
<tr class="light"><td><strong>sarbjitsingh</strong></td><td>hi everyone anyone from India</td></tr>
<tr class="dark"><td><strong>shankhs</strong></td><td>a lots of us dude</td></tr>
<tr class="light"><td><strong>vivek_smashy</strong></td><td>sar</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Nutty: yes, VeriSign has offices in India near Bangalore I think</span></td></tr>
<tr class="light"><td><strong>sarbjitsingh</strong></td><td>wow</td></tr>
<tr class="dark"><td><strong>geekru2</strong></td><td>Are there Job opportunities at veriSign</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>VeriSign_Scott: what do you expect from students who apply for internship</td></tr>
<tr class="dark"><td><strong>shankhs</strong></td><td>sarbjitsingh: u r not alone</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: solid programming skills with some exposure to network programming and C++</span></td></tr>
<tr class="dark"><td><strong>amiune</strong></td><td>VeriSign_Scott: Yes I know but in which general area of rearch they are (pattern recognition, etc)?</td></tr>
<tr class="light"><td><strong>sarbjitsingh</strong></td><td>yes evrisign is good company lemme know how can we apply for it</td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>shankhs: Thanks dude</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: other parts of VeriSign look for Java experience</span></td></tr>
<tr class="dark"><td><strong>abhinavkulkarni</strong></td><td>And how do we apply for the internship?</td></tr>
<tr class="light"><td><strong>sarbjitsingh</strong></td><td>I ahve both JAVA as well as C experience</td></tr>
<tr class="dark"><td><strong>progfool</strong></td><td>VeriSign_Scott: what other parts are u referring....can u quote a few?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">sarbjitsingh: Job openings are listed on our corporate web site</span></td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>Thaks scott</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">progfool: The domain registration business, specifically</span></td></tr>
<tr class="dark"><td><strong>abhinavkulkarni</strong></td><td>are jaidev from NITT?</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">abhinavkulkarni: Intern opportunities are also listed on our corporate web site's job openings page</span></td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">abhinavkulkarni: though there aren't many there right now since summer is already here</span></td></tr>
<tr class="light"><td><strong>abhinavkulkarni</strong></td><td>VeriSign_Scott: thank you for that information</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">abhinavkulkarni: np</span></td></tr>
<tr class="light"><td><strong>Nutty</strong></td><td>abhinavkulkarni: hi</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Any other questions?</span></td></tr>
<tr class="light"><td><strong>abhinavkulkarni</strong></td><td>Nutty: hello!</td></tr>
<tr class="dark"><td><strong>woldsom</strong></td><td>This is perhaps a bit off topic, but have Verisign taken a stand on either side of the network neutrality issue?</td></tr>
<tr class="light"><td><strong>MH35</strong></td><td>Hello</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">woldsom: Not that I'm aware</span></td></tr>
<tr class="light"><td><strong>Megal</strong></td><td>hi all</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>abhinavkulkarni: back on the rise in TC eh?..</td></tr>
<tr class="light"><td><strong>aman.mohd</strong></td><td>hey can n e one tell me when does one become a target</td></tr>
<tr class="dark"><td><strong>MH35</strong></td><td>DDoS is evil.</td></tr>
<tr class="light"><td><strong>McKuzmich</strong></td><td>what about amuine's question?</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">what question is that?</span></td></tr>
<tr class="light"><td><strong>abhinavkulkarni</strong></td><td>Nutty: Hey I don't know your name....</td></tr>
<tr class="dark"><td><strong>McKuzmich</strong></td><td>do you use pattern recognition algorithms?</td></tr>
<tr class="light"><td><strong>McKuzmich</strong></td><td>i'm very interested in that area...</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>abhinavkulkarni: Natarajan ...</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Answered: yes, and they're proprietary and developed in-house</span></td></tr>
<tr class="dark"><td><strong>McKuzmich</strong></td><td>thanks</td></tr>
<tr class="light"><td><strong>abhinavkulkarni</strong></td><td>Nutty: Which year are you currentely in?</td></tr>
<tr class="dark"><td><strong>Nutty</strong></td><td>abhinavkulkarni: 3rd yr...</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">we also use some commercial products, inckluding Arbor peakflow and cisco guard technology</span></td></tr>
<tr class="dark"><td><strong>skaterdude69</strong></td><td>Wow.</td></tr>
<tr class="light"><td><strong>skaterdude69</strong></td><td>Lots of people.</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">though such products are only one tool among a suite of tools</span></td></tr>
<tr class="light"><td><strong>McKuzmich</strong></td><td>interesting</td></tr>
<tr class="dark"><td><strong>3d_max</strong></td><td>hi</td></tr>
<tr class="light"><td><strong>3d_max</strong></td><td>hi,everybody</td></tr>
<tr class="dark"><td><strong>3d_max</strong></td><td>good luck</td></tr>
<tr class="light"><td><strong>thundercoder</strong></td><td>good luk</td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>Thanks you too 3D</td></tr>
<tr class="light"><td><strong>billa</strong></td><td>Hello guys</td></tr>
<tr class="dark"><td><strong>aravind_88</strong></td><td>vivekcsemit: hello there</td></tr>
<tr class="light"><td><strong>balakumar86</strong></td><td>billa: hi billa</td></tr>
<tr class="dark"><td><strong>balakumar86</strong></td><td>billa: u from tamilnadu?</td></tr>
<tr class="light"><td><strong>elmariachi1414</strong></td><td>test</td></tr>
<tr class="dark"><td><strong>dlwjdans</strong></td><td>NewSensation: ? ?? ???? ????</td></tr>
<tr class="light"><td><strong>vigilancer</strong></td><td>test accepted =)</td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>i can expect some kind of regular expression problem today..lol</td></tr>
<tr class="light"><td><strong>dlwjdans</strong></td><td>NewSensation: ??? ?? ???? ?? ??</td></tr>
<tr class="dark"><td><strong>13lazyrainy</strong></td><td>gl</td></tr>
<tr class="light"><td><strong>Amith</strong></td><td>VeriSign_Scott: Since DDoS ?&amp; hweavy trafice are tough to distinguish , how did u really know that it was DDos but not heavy trfic</td></tr>
<tr class="dark"><td><strong>nitdgp</strong></td><td>MB__: from when the utilities wil be up for today's SRM?</td></tr>
<tr class="light"><td><strong>progfool</strong></td><td>okk..1 question.....a=0 is false i guess??</td></tr>
<tr class="dark"><td><strong>MB__</strong></td><td>nitdgp: it won't be today</td></tr>
<tr class="light"><td><strong>dlwjdans</strong></td><td>NewSensation: ?????</td></tr>
<tr class="dark"><td><strong>nitdgp</strong></td><td>MB__: ohh.</td></tr>
<tr class="light"><td><strong>MB__</strong></td><td>nitdgp: read news</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Amith: You can't always tell them apart.  As noted earlier, that's part of what makes it a hard problem to solve.</span></td></tr>
<tr class="light"><td><strong>nitdgp</strong></td><td>MB__: ok. fine.</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Amith: we tend to deal with the problem by adding capacity</span></td></tr>
<tr class="light"><td><strong>Amith</strong></td><td>progfool: and also when a = c</td></tr>
<tr class="dark"><td><strong>Amith</strong></td><td>VeriSign_Scott: I see</td></tr>
<tr class="light"><td><strong>nitdgp</strong></td><td>MB__: I loved checking ur site before rating is updated :)</td></tr>
<tr class="dark"><td><strong>spracle</strong></td><td>so many people</td></tr>
<tr class="light"><td><strong>MB__</strong></td><td>nitdgp: check for news in next week</td></tr>
<tr class="dark"><td><strong>theycallmemorty</strong></td><td>exactly 1000 for div 2</td></tr>
<tr class="light"><td><strong>nitdgp</strong></td><td>MB__: okk. thanks.</td></tr>
<tr class="dark"><td><strong>ahmedsaad</strong></td><td>VeriSign_Scott: is that the only soultion for DDoS ?</td></tr>
<tr class="light"><td><strong>huoqui</strong></td><td>hello</td></tr>
<tr class="dark"><td><strong>wixor</strong></td><td>btw2: gawry chyba postanowil ulatwic mi dogonienie go ;)</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">ahmedsaad: No, of course not.  We also use filtering technology and load balancing technology to deal with the proble,</span></td></tr>
<tr class="dark"><td><strong>nishio</strong></td><td>(^o^)</td></tr>
<tr class="light"><td><strong>wixor</strong></td><td>btw2: gawry chyba postanowil ulatwic mi dogonienie go ;)</td></tr>
<tr class="dark"><td><strong>fish_ball</strong></td><td>hello</td></tr>
<tr class="light"><td><strong>MB__</strong></td><td>wixor: :P</td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>filteration is lighter solution than load balancing i guess</td></tr>
<tr class="light"><td><strong>samsam</strong></td><td>all the best to all</td></tr>
<tr class="dark"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">ahmedsaad: but you have to first make sure you stay up</span></td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">no more questions?</span></td></tr>
<tr class="dark"><td><strong>sarbjitsingh</strong></td><td>now we are ready for contest so may be later..:)</td></tr>
<tr class="light"><td><strong>cyclopse</strong></td><td>MB__: does ur site predicts rating bound for coming SRM.</td></tr>
<tr class="dark"><td><strong>Askar</strong></td><td>good luck!!!</td></tr>
<tr class="light"><td><strong>glue2glee</strong></td><td>what is the link of prediction ?</td></tr>
<tr class="dark"><td><strong>nitdgp</strong></td><td>cyclopse: not today!</td></tr>
<tr class="light"><td><strong>vrajesh1989</strong></td><td>vivekcsemit: thanks da.. same to u</td></tr>
<tr class="dark"><td><strong>nitdgp</strong></td><td>cyclopse: read news there</td></tr>
<tr class="light"><td><strong>Askar</strong></td><td>thanks</td></tr>
<tr class="dark"><td><strong>nishio</strong></td><td>good luck</td></tr>
<tr class="light"><td><strong>sarbjitsingh</strong></td><td>chak do phatte</td></tr>
<tr class="dark"><td><strong>abhinavkulkarni</strong></td><td>nitdgp: Best of luck!</td></tr>
<tr class="light"><td><strong>cyclopse</strong></td><td>MB__: thanx</td></tr>
<tr class="dark"><td><strong>rajatkumar</strong></td><td>what next?</td></tr>
<tr class="light"><td><strong>jmpld40</strong></td><td>Thanks to Scott from VeriSign for the chat!</td></tr>
<tr class="dark"><td><strong>jmpld40</strong></td><td>Best of luck to you all in the match</td></tr>
<tr class="light"><td><span class="bigRed">VeriSign_Scott</span></td><td><span class="bigRed">Glad to help -- good luck!</span></td></tr>
<tr class="dark"><td><strong>McKuzmich</strong></td><td>thanks Scott</td></tr>


        </table>

    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
