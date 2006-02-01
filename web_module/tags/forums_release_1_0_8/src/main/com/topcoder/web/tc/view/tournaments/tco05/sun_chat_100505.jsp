<%@  page language="java"  %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
<jsp:include page="../../script.jsp" />
<STYLE TYPE="text/css">
.light
{
background-color: #FFFFFF;
color: #333333;
font-size: 12px;
font-weight: normal;
text-decoration: none;
vertical-align:top;
padding: 3px 5px 3px 5px;
}

.dark
{
background-color: #EEEEEE;
color: #333333;
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
<jsp:param name="tabLev3" value="sun"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
   <tr valign="top">
      <td valign="top" align="center">
      <div class="bodySpacer">
            
<div align="center"><img src="/i/tournament/tco05/sun_logo.gif" alt="Sun" border="0" /></div>
<br><br>
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Just to clarify from what was said in the broadcast - I'm willing to answer any Java questions...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">(if I can)  ;-)</span></td></tr>
<tr><td class="light"><b>CVT</b></td><td class="light">Ok. What do you think about building the screen in XML and then use the right api to bind it into the code?</td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">Is this new development tool faster then Netbeans? I liked netbeans, but my laptop just doesn't have the ram to run it well.</td></tr>
<tr><td class="light"><b>CVT</b></td><td class="light">thinlet, swixml....</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">CVT: building a screen in XML implies an XML-based UI schema</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT: if you have one, it should have a layer that binds it to code already</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">CVT: so you'd have to be more specific</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">aradil: The Creator product is built on top of Netbeans</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">aradil: as a set of modules</span></td></tr>
<tr><td class="light"><b>aradil</b></td><td class="light">Ah, ok.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">aradil: I hate to sound cliche' - but it really isn't very expensive to setup a machine that is suitable for IDE development</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">aradil: go get some RAM!  ;-)</span></td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">Hahaha...Yeah. I was just about to say that.</td></tr>
<tr><td class="light"><b>aradil</b></td><td class="light">However...</td></tr>
<tr><td class="dark"><b>mkhan5</b></td><td class="dark">does Java Studio Creator functionality close to VS.net</td></tr>
<tr><td class="light"><b>aradil</b></td><td class="light">My multi-thousand dollar per year tuition makes that hard;)</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">aradil: I hear you!  I did finally pay it all off...</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">aradil: and it was worth it</span></td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">hahaha</td></tr>
<tr><td class="light"><b>aradil</b></td><td class="light">Yea.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mkhan5: the intent of JSC was to appeal to the muscle memory of VB folks</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: and follow a model similar to VS.NET</span></td></tr>
<tr><td class="dark"><b>mkhan5</b></td><td class="dark">wat JSC offers that VS does not</td></tr>

<tr><td class="light"><b>Sartak</b></td><td class="light">Hmm. That's good. :) One of the very few things I miss about Visual Basic is its rapid GUI generation.</td></tr>
<tr><td class="dark"><b>red_gladiator</b></td><td class="dark">admins: can JSC be used to make GUI for non-web applications. for example, a chat client</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: JSC offers a Java deployment platform - that has to be the #1 thing</span></td></tr>
<tr><td class="dark"><b>red_gladiator</b></td><td class="dark">Sun_Joe: can JSC be used to make GUI for non-web applications. for example, a chat client</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: in its current form, it is focused on web applications</span></td></tr>
<tr><td class="dark"><b>mkhan5</b></td><td class="dark">in VS  there are redundant code that gets generated when we drag-drop any graphical component, how about JSC</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: but thick client apps are in the plans</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: have a look at the matisse project on netbeans (incluced in netbeans 5 beta)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: when a comp is dropped in JSC, the code *is* the persistence</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mkhan5: meaning - it is a two-way tool</span></td></tr>
<tr><td class="light"><b>red_gladiator</b></td><td class="light">Sun_Joe: Are there any good tools for fast GUI generation in Java? All those API's take a lot of time to learn</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mkhan5: you can hand code and it will show the visual layout</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: and when you manipulate the visual layout, it uses regular Java/JSP code to persist it</span></td></tr>
<tr><td class="dark"><b>mkhan5</b></td><td class="dark">Sun_Joe: how about debugging</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: I highly recommend checking out Matisse (in NetBeans 5 beta)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: its free too</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: and quite impressive</span></td></tr>
<tr><td class="dark"><b>red_gladiator</b></td><td class="dark">Sun_Joe: Is matisse in the beta stage?</td></tr>

<tr><td class="light"><b>red_gladiator</b></td><td class="light">Sun_Joe: I mean, is it reliable?</td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">Sun_Joe:  What IS matisse?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: the debugging in Creator is based on Netbeans' JSP/web debugger, with is *very* powerful and full-featured</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: Matisse is very stable</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: it is technically beta - but that's just a formality</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: it works very very well</span></td></tr>

<tr><td class="light"><b>mkhan5</b></td><td class="light">Sun_Joe:  JSC supports any report generation tool like crystal report</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">if you're familiar with the Apple interface builder product - it feels kinda like that</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: the crystal reports folks have a set of JavaServer Faces (JSF) components for their reporting</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mkhan5: which work fine in Creator</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mkhan5: any JSF comps do</span></td></tr>
<tr><td class="dark"><b>red_gladiator</b></td><td class="dark">Sun_Joe: Where do you see Java in 10 years from now? Will its mainstream place be taken over by some other language?</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: Ooooh!  FUN QUESTION!  I love these!</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: &lt;crystal ball&gt;</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: In 10 years...</span></td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">lawl</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: Java will still be a strong language, though it will have evolved quite a bit</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: the line between desktop, web, and mobile applications will have dissolved completely</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: we'll just talk about "applications"</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: or "services"</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: also, the voice (VOIP) stuff will start to play a larger role in applications</span></td></tr>
<tr><td class="dark"><b>red_gladiator</b></td><td class="dark">Sun_Joe: Are the new features in JDK 5.0 stable enough to be deployed in a large work environment?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: voice reco is very far along (I used to be a CTO at a voice company), but hasn't hit the "mainstream" because access to the phone systems was limited</span></td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">Sun_Joe: You are talking about voice, but I belive voice is only now, not future. Can you look a little bit FURTHER?</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: now that VOIP is becoming popular, voice apps will become mainstream</span></td></tr>
<tr><td class="dark"><b>Sartak</b></td><td class="dark">ludovic: Do you mean telepathy? :)</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">red_gladiator: is JDK 5.0 stable enough for large deployments?  Ask Google!</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">red_gladiator: they are totally deployed on JDK 5</span></td></tr>
<tr><td class="light"><b>red_gladiator</b></td><td class="light">Sun_Joe: :)</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ok - further than 10 years</span></td></tr>

<tr><td class="light"><b>ivern</b></td><td class="light">Sun_Joe: a little question of my own.  do you see voice becoming a viable source of input in the near future?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the screen, keyboard, mouse thing will go the way of the dinosaur</span></td></tr>
<tr><td class="light"><b>Sartak</b></td><td class="light">I rather like keyboard input.</td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">Me too</td></tr>
<tr><td class="light"><b>Tseng</b></td><td class="light">Me too.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">look at telematics (like OnStar) as a model of the type of interaction you will have with connected applications</span></td></tr>

<tr><td class="light"><b>Tseng</b></td><td class="light">Don't take my vim away.</td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">"  "   " emacs ".</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">or - this sounds funny - look at Star Trek</span></td></tr>
<tr><td class="dark"><b>Sartak</b></td><td class="dark">**Sartak chuckles at ludovic.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">"computer, make me a latte"</span></td></tr>
<tr><td class="dark"><b>Tseng</b></td><td class="dark">I look forward to that.</td></tr>

<tr><td class="light"><b>acsaba</b></td><td class="light">/msg abi</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I look forward to making that sort of thing happen</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">"the only way to predict the future acurrately is to make it happen yourself"</span></td></tr>
<tr><td class="dark"><b>Sartak</b></td><td class="dark">Sun_Joe: What do you think JSC's biggest shortcoming is right now?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">that quote is from the Ansari X-Prize guy</span></td></tr>
<tr><td class="dark"><b>ivern</b></td><td class="dark">Sun_Joe: i think that's why we all got into programming :)</td></tr>

<tr><td class="light"><b>ludovic</b></td><td class="light">Sun_Joe: What do you think are the advantages that JDK 5 has over .Net?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Sartak: the biggest shortcoming of JSC (in my opinion) is probably the footprint issues</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Sartak: as were alluded to earlier</span></td></tr>
<tr><td class="dark"><b>Sartak</b></td><td class="dark">Ah, yeah.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Sartak: it could and will be tighter</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: another fun one...</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: the biggest advantage is totally non-technical</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: its a business decision to use a more open platform</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: where more companies have a stake</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: and the competition is strong</span></td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: Can we use JSC for creating DeskTop applications...?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: for technical differences there are a lot of ways to look at it</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: I would be hard-pressed to say one is better than the other on technical merits alone</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: they are very similar</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: (MS paid a lot of money for Sun patents)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: I think the real key difference is the business one I described earlier</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: more innovation happens in Java</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: which you get to leverage</span></td></tr>

<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: Can we develop swing based in JSC</td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Can you give an example of one these patents?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">srinivaspsr: JSC is initially focused on web apps, but desktop is in the roadmap</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: same answer as above</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT: I don't know of a specific one, but I bet there are a bunch having to do with portable bytecodes</span></td></tr>
<tr><td class="dark"><b>lordhiru</b></td><td class="dark">Sun_Joe: so what are major advantages of JSC over netbeans or eclipse</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT: and a bunch of the language features of C#</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">I didn't know about that. Intersting.</td></tr>
<tr><td class="light"><b>Sartak</b></td><td class="light">How many developers are working on JSC?</td></tr>
<tr><td class="dark"><b>anand_nalya</b></td><td class="dark">Sun_Joe: What does Sun-Google alliance means for Microsoft?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lordhiru: JSC vs NetBeans vs Eclipse</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: these are really different animals</span></td></tr>

<tr><td class="light"><b>Sartak</b></td><td class="light">I'm afraid I don't have many Java-intensive questions, I don't use the language much. ;)</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: NetBeans and Eclipse are certainly in the same camp (apples to apples)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lordhiru: but JSC is something built on top of NB to make building web applications easy</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: (and *very* easy for VB folks)</span></td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: oh right!</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Sartak: I don't know the exact number, but I know there is a lot of traffic in the forums (developers.sun.com)</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">its free to download and try out</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">so lots of folks have</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">and its only $99/year to own</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">which includes an SDN (Sun Developer Network) subscription</span></td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: is JSC is extendable?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">so here's a Q for you all...</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">how many of you have tried JSC?</span></td></tr>
<tr><td class="dark"><b>srinivaspsr</b></td><td class="dark">Sun_Joe: me not yet :(</td></tr>
<tr><td class="light"><b>miller</b></td><td class="light">no</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">or even better - how many of you participated in the top coder components event with JSC?</span></td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">Yeah.  Another touch question. I did see Java lack official documents when compared with MSDN, what is the best way to get rich and easy-to-access documents?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: Yes, JSC is extendable - its built on NetBeans</span></td></tr>

<tr><td class="light"><b>miller</b></td><td class="light">i use eclipse</td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">I didn't because I don't like the way we have to develop web app's today.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: sorry to hear that ;-)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: I hope you get better soon  ;-)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT: elaborate on that</span></td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">Not a lot time during semsters. So, no way to do compoments now</td></tr>

<tr><td class="light"><b>miller</b></td><td class="light">i hope so</td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">so what's up with the joint google initiative? is it something that can really take down MS-Office, or just unrealistic publicity?</td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: But I a suprised not to see much promotions from SUN on JSC? at least in its sites?</td></tr>
<tr><td class="dark"><b>lordhiru</b></td><td class="dark">Sun_Joe: what facilities available in JSC for languages other than java. For instance javascript is a nightmare for webapp developers</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lironk: you know what I know about the joint Google initiative</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Html + Css + Javascript + JSP (for example).. A mix of things....</td></tr>

<tr><td class="light"><b>CVT</b></td><td class="light">The user interface is poor when we talk about interaction.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: There are a lot of promotions that I have seen for JSC, but I suppose I am pre-disposed to notice them</span></td></tr>
<tr><td class="light"><b>CVT</b></td><td class="light">Drag & Drop, right click...</td></tr>
<tr><td class="dark"><b>lironk</b></td><td class="dark">i know only what i read in the news. i thought they might be telling you guys more :(</td></tr>
<tr><td class="light"><b>CVT</b></td><td class="light">lot of pages reloading.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: There is a JavaScript editor (syntax highlighting, etc) - but no *major* support as I'm sure you're after</span></td></tr>

<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: does it support javascript debugger?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">CVT: you should look into JSF (JavaServer Faces) - this is a component model for web apps</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT: it encapsulates a lot of that stuff so you don't have to think about it</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">CVT: puts the work in the hands of the "component developer"</span></td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: So the latest version of JSC is compliant with what version of J2EE?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">lordhiru: that would have to be client-side (embedded in a browser) so no - but I recommend using FireFox for that</span></td></tr>

<tr><td class="light"><b>CVT</b></td><td class="light">Ok. I'll take a look.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: I am really bad about version numbers...  so I'm not even going to try to guess</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">srinivaspsr: check out developers.sun.com/jscreator</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: I'm sure its listed there</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ok - another Q from me...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">What frameworks are you folks using for building web apps?</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JSF, Struts, Ruby on Rails, ....</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">(or raw hand-coding of servlets)</span></td></tr>
<tr><td class="light"><b>codelion</b></td><td class="light">Sun_Joe: visual web developer</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">codelion: as in MS VS.NET?</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">or is that another product?</span></td></tr>
<tr><td class="dark"><b>srinivaspsr</b></td><td class="dark">Sun_Joe: Struts</td></tr>

<tr><td class="light"><b>CVT</b></td><td class="light">Hibernate</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">from what I understand, Struts is the current dominant framework out there...</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">with folks starting to look at JSF</span></td></tr>
<tr><td class="dark"><b>srinivaspsr</b></td><td class="dark">Sun_Joe: JSTL + Stuts</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">(which is really an evolution of struts)</span></td></tr>
<tr><td class="dark"><b>aradil</b></td><td class="dark">I helped with a web events calendar made in Ruby on Rails</td></tr>

<tr><td class="light"><b>miller</b></td><td class="light">is it faster than eclipse?you know i still cannot resist the v of eclipse</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">personally - I find Eclipse to be pretty slow...</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">but I *was* the architect of JBuilder...  so...</span></td></tr>
<tr><td class="dark"><b>miller</b></td><td class="dark">i hope java will as fast as c++ someday</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">uhhh... news flash!</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">if you're not familiar with HotSpot, I suggest you do some homework</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Java *is* FASTER than C++ in many cases</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">it is dynamically optimized at runtime</span></td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: Yeah I agree</td></tr>
<tr><td class="dark"><b>hazzaz</b></td><td class="dark">this may be slightly offtopic, is there a possibilty that java will truly be used for embedded systems?</td></tr>
<tr><td class="light"><b>miller</b></td><td class="light">for example</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">where it appears slower is usually just bad code - no joke</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">you really *pay* for bad code in a bytecode system</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">hazzaz: I believe it is used for embedded systems today</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">hazzaz: have a look at the real-time java stuff</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">hazzaz: and at mobile phones</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: for example..</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: any java bytecode that spends a lot of time in the Java heap mucking about with stuff</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: will be dynamically optimized to make branches into inline segments</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: and *statistically* optimized based on the running code</span></td></tr>
<tr><td class="light"><b>vaibhav_ace</b></td><td class="light">Hello Joe</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: where you "pay" is when you "thunk" from the java heap into native code (file i/o, etc)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: in those spots it has to call externally and marshall</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: so you have to design java apps to be smart about this fact</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: suck up what you need from the "outside world" then process as much as possible in Java</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: it will *blaze*</span></td></tr>
<tr><td class="light"><b>mutunus</b></td><td class="light">Sun_Joe:  I'm runninh EA2 on MacosX tiger on an 867Mhz G4 -- and the responsiveness of creator is dismal -- do you guys plan to address this -- i Mean the IDE really drags...</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: another issue in java apps is "over-painting", or as I call it "bad code"</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: if you repaint something 1000 times in a java app, it will feel slow</span></td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">Sun_Joe: So, based on your answe for miller, Java would not suppose to support 3D graphics well in future?</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: if you do it 1000 times in a native app, you won't even notice</span></td></tr>
<tr><td class="dark"><b>miller</b></td><td class="dark">i think i need more study</td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">Sun_Joe: I mean, 3D graphics nowdays needs a lot of direct access to memory and hardware, native code is necessory for these cases.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: create some tests and prove it to yourself</span></td></tr>
<tr><td class="light"><b>miller</b></td><td class="light">i will thanks</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: actually, the 3D graphics stuff is pretty well optimized in a Java library</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: and does the "right" thing for pipelining</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: it is very fast</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: if you were calling your own JNI calls to do the work, it would have issues probably</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: but the built-in Java3D stuff is very fast</span></td></tr>
<tr><td class="light"><b>mihireng</b></td><td class="light">hi joe</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: curious, how much RAM?</span></td></tr>

<tr><td class="light"><b>mihireng</b></td><td class="light">i wanted to konw from where i can download creator</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: and just a note that we are working very closely with the Apple Java VM team (at Apple)</span></td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">Sun_Joe: I'm not very familiar with java. But I'm wondering if java can work with DirectX or OpenGL well? As fast as if I use C++?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: they use Creator as one of their testbeds for the VM</span></td></tr>
<tr><td class="light"><b>mutunus</b></td><td class="light">Sun_Joe: 384 ddr on a g4 powerbook..</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: oooh - that's not much ram, really</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mutunus: I know that a lot of our R&D guys use macs and don't complain</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: but they have at least 1G ram</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mutunus: some have more</span></td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">Sun_Joe: How much ram does the IDE need? I mean g4 laptops gap out at 512 I think...</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mihireng: http://developers.sun.com/jscreator</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: I really am not sure (honestly), but the recommendations are posted at the above address</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">mutunus: "system requirements"</span></td></tr>
<tr><td class="dark"><b>miller</b></td><td class="dark">we don't so rich as you ,i use 256m ram</td></tr>
<tr><td class="light"><b>crystal_xmy</b></td><td class="light">Hi joe. I am curious how JRE handle the native code and managed code both and prevent the former one from the later?</td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">Sun_Joe: I'll check them out -- but I really do think its an excelent ID though -- udos to the developers...</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ludovic: Java uses DirectX and OpenGL direclty (internally) when you use Java2D</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: there is a full graphics library in Java that translates into those - in a very efficient way</span></td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">Sun_Joe: Thanks. That's quite helpful information. Do you know can I use java to directly call opengl in my application?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ludovic: java.awt.Graphics2D</span></td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: if java3d is using opengl and/or directX is it stil patform independent?</td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">Sun_Joe: Thanks. I will check that out.</td></tr>
<tr><td class="light"><b>hazzaz</b></td><td class="light">joe do u see java replace something like c++ as preferred lang for embedded systems in near future?</td></tr>

<tr><td class="dark"><b>galantonp</b></td><td class="dark">Sun_Joe: how about Java3D ? I was thinking about looking into it ....</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lordhiru: Yes, the Java2D stuff is totally portable</span></td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">lordhiru: opengl is not a problem. it is cross-platform</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lordhiru: and gracefully degrades or emulates where it needs to</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">hazzaz: Yes, I do</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">hazzaz: but you would be best served by digging into the Real-Time Java stuff</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">hazzaz: which I believe James G is heavily into</span></td></tr>
<tr><td class="light"><b>mutunus</b></td><td class="light">Sun_Joe: yeag its 1GB -- time to upgrade...</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">sorry about that :-(</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">but it will be worth it</span></td></tr>
<tr><td class="dark"><b>hazzaz</b></td><td class="dark">i ll do that joe thanks</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I hope you find what you need!</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">(and it makes your job a lot easier)</span></td></tr>
<tr><td class="light"><b>Otaku</b></td><td class="light">I'm c++ and like customization at rather low level (e.g. change the title bar color of a window...) simple (neophytic) question : is it possible with Java creator?</td></tr>
<tr><td class="dark"><b>johny.pl</b></td><td class="dark">Hello, Joe. I've tried to use Sun JSC and I have problem with registering optional components in this tool under Linux</td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">1G for JSC?</td></tr>
<tr><td class="dark"><b>johny.pl</b></td><td class="dark">on JSC 2..0EA and on 1.0p7</td></tr>
<tr><td class="light"><b>mutunus</b></td><td class="light">ludovic: That what it says for macosx</td></tr>

<tr><td class="dark"><b>ludovic</b></td><td class="dark">Otaku: I think that might be then platform dependent</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Otaku: Java Studio Creator (JSC) is initially targetted at building web applications</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Otaku: so at this point, no :-(</span></td></tr>
<tr><td class="light"><b>Otaku</b></td><td class="light">ok thanks.</td></tr>
<tr><td class="dark"><b>lordhiru</b></td><td class="dark">Sun_Joe: can I ask you a question about java swings? can we have custome shaped forms such as  windows media player</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">sure</span></td></tr>

<tr><td class="dark"><b>ludovic</b></td><td class="dark">mutunus: Huge! i cannt believe. VS2005 takes around 300M at startup, I think that is already huge!</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">that's actually an AWT question - and the current answer is no...  :-(</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">we were just talking about this yesterday, actually (the Swing/AWT guys and myself)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">it keeps getting put off</span></td></tr>
<tr><td class="dark"><b>lordhiru</b></td><td class="dark">Sun_Joe: hope there will be a way to do it soon</td></tr>
<tr><td class="light"><b>Otaku</b></td><td class="light">simply speaking: what *cannot* be done with JSC that can be done with the usual runtime...(roughly)?</td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I hope so too!</span></td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: im realy in troube with that</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">well - actually there is a way...</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">but its tricky</span></td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">ludovic: I know ! I cant belive it either -- its a major memory hog... When I run EA2 it drags for about i minute when it creates a new projects...</td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: use native code?</td></tr>

<tr><td class="dark"><b>ludovic</b></td><td class="dark">Otaku: That's platform dependent. You need either your own libaray for the form rendering or hack it I think.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">actually - you can do that too (use native code)</span></td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">Sun_Joe: Care to give us the inside scoop on the Google/Sun thing? wink wink...</td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: any other way?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">or you can have a single Java frame, and do non-rectangular components inside it)</span></td></tr>
<tr><td class="light"><b>johny.pl</b></td><td class="light">I'm disappointed JSC 2.0EA, because it has lower functionality, than NB 4.1, which JSC is based on :(</td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: Sun is buying Google</span></td></tr>
<tr><td class="light"><b>ludovic</b></td><td class="light">mutunus: Hope sun is improving it. Originally vs2005 has the same problem but they are improving it.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">mutunus: ;-)</span></td></tr>
<tr><td class="light"><b>miller</b></td><td class="light">Sun is buying Google?!</td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">Sun_Joe: That'd be great ...</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: A joke</span></td></tr>

<tr><td class="dark"><b>shomishu</b></td><td class="dark">renaming it to jGoogle</td></tr>
<tr><td class="light"><b>crystal_xmy</b></td><td class="light">really?</td></tr>
<tr><td class="dark"><b>butler</b></td><td class="dark">haha</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: Soogle</span></td></tr>
<tr><td class="dark"><b>mutunus</b></td><td class="dark">ludovic: I hope they fix it too...</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">miller: Sungle</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">miller: Goose</span></td></tr>
<tr><td class="light"><b>miller</b></td><td class="light">aha</td></tr>
<tr><td class="dark"><b>lordhiru</b></td><td class="dark">Sun_Joe: jaggle</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ok folks wrapping up soon...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">any more questions?</span></td></tr>
<tr><td class="light"><b>lordhiru</b></td><td class="light">Sun_Joe: thanks joe</td></tr>

<tr><td class="dark"><b>srinivaspsr</b></td><td class="dark">Sun_Joe: Can I use JSC as an alternate to SwingLayout?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I see folks dropping off to compete in their respective rooms...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">good luck folks!</span></td></tr>
<tr><td class="light"><b>johny.pl</b></td><td class="light">why JSC 2.0 has lower funct., than NB 4.1?</td></tr>
<tr><td class="dark"><b>ludovic</b></td><td class="dark">Sun_Joe: Thanks Joe. Game is coming. See you!</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">srinivaspsr: it really uses CSS to do web layout</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: (not a java.awt.LayoutManager realm)</span></td></tr>
<tr><td class="light"><b>srinivaspsr</b></td><td class="light">Sun_Joe: I mean componenets like Tree, Tabs etc..?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: those components are included in JSC</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">srinivaspsr: they are JSF (JavaServer Faces) components</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">srinivaspsr: basically web versions of those things</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">srinivaspsr: they feel a lot like Swing comps - only for web</span></td></tr>

<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ok folks - I have to go too</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">thanks for the questions, and good luck!</span></td></tr>
<tr><td class="dark"><b>ivern</b></td><td class="dark">thanks for stopping by, joe.  good talk :)</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">thanks!</span></td></tr>

</table>
<br><br>

        </div>
      </td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tco05"/>
            </jsp:include>
         </td>
      
   </tr>
   
</table>
   
   


<jsp:include page="../../foot.jsp" />

</body>

</html>
