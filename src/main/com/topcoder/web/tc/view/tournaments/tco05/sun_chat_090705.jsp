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
Just prior to the TCO05 Online Round 4, Joe Nuxoll from Sun Microsystems&#174; was in arena to chat about JSF components and Java Studio Creator:
<br><br>
<table class="bodyText" cellpadding="0" cellspacing="0" width="100%">
<tr><td class="header">Handle</td><td class="header" width="100%">Comment</td></tr>
<tr><td class="light"><b>TheJanitor</b></td><td class="light">I was just wondering if Sun had any really good summer internship programs.</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">absolutely!</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">we have some great interns on our team right now</span></td></tr>
<tr><td class="dark"><b>TheJanitor</b></td><td class="dark">The IDE team?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">if you're interested in an internship, send an email to me:  joe.nuxoll@sun.com</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I'll forward it on to the right folks</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">yes, the IDE team</span></td></tr>
<tr><td class="dark"><b>TheJanitor</b></td><td class="dark">Cool beans, thanx</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">np</span></td></tr>
<tr><td class="dark"><b>texel</b></td><td class="dark">tzup sun_joe?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Hello texel, do you have a Q?</span></td></tr>
<tr><td class="dark"><b>texel</b></td><td class="dark">asl pls</td></tr>

<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: what is your role with the IDE team?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Hello folks, my name is Joe Nuxoll from Sun Microsystems</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I am one of the architects working on Creator and frameworks for web and desktop applications</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I'm also the spec lead for JSR-273</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I would love to answer any questions pretty much about anything</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">go ahead and shoot</span></td></tr>

<tr><td class="light"><b>mike</b></td><td class="light">so, what is the relationship between Studio Creator and JSF ?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">to better answer mike's Q, on Creator specifically, I built the design-time API and helped with much of the underlying framework for the visual designer</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Studio Creator is a visual design environment initally focused on building JSF applications</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Creator allows you to visually design web apps using JSF components</span></td></tr>
<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: heh</td></tr>
<tr><td class="dark"><b>jmpld40</b></td><td class="dark">nicka81: Hi nick, jessie here</td></tr>

<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: do people use Studio Creator for non-JSF related develpoment ?</td></tr>
<tr><td class="dark"><b>nicka81</b></td><td class="dark">jmpld40: hello Jessie ;-)</td></tr>
<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: kind of as a general purpose IDE?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">at this point Creator is focused on JSF development, but future versions will leverage thick client and other technologies</span></td></tr>
<tr><td class="light"><b>snooking</b></td><td class="light">Is the sun application server robust enough to run enterprise applications compared to JBOSS and others?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">we started with web applications (and JSF) for the first cut</span></td></tr>

<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: makes sense</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">snooking: absolutely</span></td></tr>
<tr><td class="light"><b>snooking</b></td><td class="light">is it still free?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">yes it is - and open source now!</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">check out Glassfish</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">www.glassfish.org I think</span></td></tr>

<tr><td class="light"><b>CVT</b></td><td class="light">Is common copy the new ideas from other tools? And when they copy your idea, do you get angry? Is it a strange question? : )</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">no that's not the righ url... one sec</span></td></tr>
<tr><td class="light"><b>snooking</b></td><td class="light">ok</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">ah - glassfish.dev.java.net</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">its a Java.Net (open source) project</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the full Sun Application Server codebase</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">CVT, I am not sure I understand your question?</span></td></tr>
<tr><td class="dark"><b>snooking</b></td><td class="dark">also, why do u bundle point base with Studio Creator and the Sun App Server?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I think tools copy eachother quite frequently!</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I think the idea was to make sure a lightweight database was available for sure</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">we want to make sure it works out of the box</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">but you don't *have* to use pointbase, of course</span></td></tr>

<tr><td class="light"><b>snooking</b></td><td class="light">i c</td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">Sun_Joe: what version of Java does Studio Creator need?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">it runs on 1.4 or 1.5 - but deploys to 1.4 (matching application servers)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">an IDE is funny in that it has to deal with a lot of different JVMs</span></td></tr>
<tr><td class="light"><b>mike</b></td><td class="light">Sun_Joe: do you notice any performance advantage of using 1.5 to run it?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">it runs on one (or two, etc) - but the projects you build need to be able to deploy on different than what the IDE is running on</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Java 5 seems to be a bit snappier in UI responsiveness</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">they did a lot of Java2D and Swing work</span></td></tr>
<tr><td class="light"><b>snooking</b></td><td class="light">What's the cost of Studio Creator these days?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">we were careful not to include and Java5 code in Creator 2 so that it could still run on 1.4</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Creator is free to download and try...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">and $99/year to own</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">that includes a membership to SDN</span></td></tr>
<tr><td class="dark"><b>snooking</b></td><td class="dark">is that $99 each yr?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">(Sun Developer Network) premium content, etc</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">yep</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">a subscription</span></td></tr>
<tr><td class="dark"><b>snooking</b></td><td class="dark">i c</td></tr>

<tr><td class="light"><b>JJohansson</b></td><td class="light">any student discounts?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">you can buy it once for $99, and get the SDN subscription for one year (and Creator updates)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">after a year, you can't update Creator unless you re-up</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">yes, major student discounts</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I don't know exactly - but I think its free for students</span></td></tr>
<tr><td class="dark"><b>JJohansson</b></td><td class="dark">i like that price</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">free is a good price for students</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">we want you guys to really get into Java</span></td></tr>
<tr><td class="light"><b>JJohansson</b></td><td class="light">yup</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">so we have someone to hire when Joe gets tired and wants to float around in the tropical seas...</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">;-)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">you should be able to get your pricing info on the creator website:  developers.sun.com/jscreator</span></td></tr>

<tr><td class="light"><b>JJohansson</b></td><td class="light">so what's good about the creator?</td></tr>
<tr><td class="dark"><b>JJohansson</b></td><td class="dark">as opposed to eclipse</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Studio Creator makes is *very* easy to build dynamic web applications</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">it leverages JSF (JavaServer Faces) components to make building web applications a point-n-click affair</span></td></tr>
<tr><td class="light"><b>pcalcina</b></td><td class="light">is it oriented mainly to Web Development?</td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Ok. I will do a normal question now. Don't you think that web apps make you mix a lot of tech to work? HTML, CSS, Javascript, JSP, Flash.... What do you see for the future?</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">yes, initally at web - but we're looking at other stuff</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">VERY GOOD QUESTION!</span></td></tr>
<tr><td class="light"><b>pcalcina</b></td><td class="light">Do you plan it to be a Eclipse replacement?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">okay - what I am seeing is a convergence of web and desktop</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">web apps are moving more client-side (AJAX, etc)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">and desktop apps are moving more web-based (dynamic data, etc)</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">take google maps, for example</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">there are two flavors:</span></td></tr>
<tr><td class="light"><b>JJohansson</b></td><td class="light">like visual studio/.NET?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">1) maps.google.com is a web app that has a LOT of very desktop-like features</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">2) Google Earth (desktop app) is a thick client (great graphics) app with a very high-bandwidth data connection</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I think we'll see this merging trend continue</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JJohansson: Eclipse is a general Java tool</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Creator is really a visual designer tool (two-way) for building web applications</span></td></tr>
<tr><td class="light"><b>JJohansson</b></td><td class="light">gotcha</td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">I'm *always* unsteady over anything that automatically generates code, especially code that really does something (as opposed to a one-liner get or set, which is autogen I don't mind). How customizable is this automatic code generation?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Creator is built on top of NetBeans, and can leverage 3rd party modules</span></td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">(Automatic code generation is implied in your statement that it's a "...point 'n click affair".</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">here's the beauty of creator...</span></td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">So you can build your own autocodegen rules?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">its not a "code generator"</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">its a two-way tool</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">it *interprets* and allows visual design of regular JSF applications</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the key is the JSF technology - its a real component framework (like JavaBeans) for web apps</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">this allows tools to present them visually</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">creator goes yet another step beyond this, however...</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JSF itself is very "typical J2EE", where you have to have a PhD to really understand what is going on</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Creator simplifies the model quite a bit to make your life (the developer) a lot easier</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">for example:</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Page1.java / Page1.jsp</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">if you're designing a page, you'll have these two files</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the .jsp file has all the JSF component tags in it - and CSS stuff to layout etc</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">the .java file is a "backing file" with the code behind the page itself</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the IDE really shows these as two "views" of the page</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">anything you do to the page (via visual design *or* via hand-coding in the .jsp file) reflects in the source</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">anything you do in the java file (or jsp) manifests in the visual designer</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">its a *real* two-way tool</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">which basically means it has some pretty wicked rocket-science compiler stuff going on behind the scenese</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">scenes</span></td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">Heh, sounds similar to my advisor's research project. I do understand what you're saying, though.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">that could certainly be - there are many doctoral projects in this field</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">code "modelling" is a very complicated area to play</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">but - very well understood by the tool vendors ;-)</span></td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">So if a programmer has drastically different ideas of "proper curly bracket usage" from your developers, Creator shouldn't do too much damage to it, or can at least be customized?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">yes - that's a code style rule - which you can configure to your heart's content</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">what *really* matters is what the code *does* which is where the tricky stuff comes into play</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">the code style stuff is directly from NetBeans</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">which you can download totally for free at www.netbeans.org</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">NetBeans is pretty darn powerful nowadays</span></td></tr>
<tr><td class="dark"><b>snooking</b></td><td class="dark">what level of java programmer does one have to be to build web apps with Studio Creator?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">As I mentioned before, Creator is built on top of NetBeans - its essentially a package of Modules</span></td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">Sun_Joe: is there a web site or application out there that is available to the public that has been built using Studio Creator?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Creator was originally conceived to target the VB programmers</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">so any corporate programmer should be able to pick it up easily</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">of course, guys like you guys (top coders) should be able to use it in a snap</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">and the visual manipulation stuff is worth its weight in gold - even if you are a rocket scientist</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">to answer mike, there are many apps - and I think the website is the best resource for that:</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">http://developers.sun.com/jscreator</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">there are also several JSF component vendors that have gone the extra mile to provide great design-time experiences for their components</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">leveraging the Creator Design-Time API</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">(which JSR-273 is based on)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">you can check that out too:  https://jbdt-spec-plublic.dev.java.net</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">oops - public</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">not plublic</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JSR-273 is being developed "out in the open" on Java.Net</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">in the project "jbdt-spec-public"</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">(I diverge)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">digress</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">so how can I help anyone else?</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">any questions about anything?</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">architecture?</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">algorhythms?</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">software platforms?</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">favorite pizza toppings?</span></td></tr>
<tr><td class="light"><b>Windrider</b></td><td class="light">I think most of us are thinking about the impending tournament right now...</td></tr>
<tr><td class="dark"><b>JJohansson</b></td><td class="dark">hehe</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">is there anything I can help you with there?</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">What about the JNLP protocol? What do you think about it? Jaca Web Start apps. Just like the TopCoder arena.</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">ah - good one</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Not Jaca. Java. Hehe.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I think this is an element in the "convergence" between desktop and web apps I commented on earlier</span></td></tr>
<tr><td class="dark"><b>Windrider</b></td><td class="dark">Hmm. Digressing from the subject: The TopCoder forums should reveal that people here do not know what they are doing with regard to generics and especially wildcards. I'm one of them. Got a good tutorial?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">the great advantage of a web application is universal distribution and clean updates</span></td></tr>
<tr><td class="dark"><b>pcalcina</b></td><td class="dark">What about SWT?</td></tr>

<tr><td class="light"><b>Windrider</b></td><td class="light">Oops, ignore me, stick to the subject</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I'll go there in a sec, Windrider</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">SWT is an interesting beast altogether</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">it was originally created to handle some threading issues in AWT, and to allow for JFace</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">usually folks are *really* referring to JFace when they mention SWT</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the original reasons for SWT (not JFace) have disappeared</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">AWT has its paint threading handled very well now - and Graphics2D is leaps and bounds beyond the painting primitives in SWT</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">JFace, on the other hand - is really a differing philosophical approach</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JFace uses essentially "peers" - like the original AWT did before Swing</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">what this does is gives you one-to-one look and feel to match the platform you're targetting</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">JFace works great on Windows</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">is works pretty well on Mac</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">it falls on its face anywhere else</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">because of the inherent critical architecture point - is that its based on native peers</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Swing paints the same anywhere, because it does not rely on peers</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">and - this is *critical* - the place where it matters most</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">Swing paints *perfectly* on Windows now because they are using the same paining primitives as IE</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Java 5 fixed the reasons that SWT/JFace was created</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">so...</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">we'll have to see what happens</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I think folks like Eclipse as an IDE</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">but are wary of creating SWT-based desktop apps</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">for very good reason</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">they really should be using Swing, because that's where the Java platform is staying</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">and Swing will out-perform SWT/JFace in many arenas</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">perhaps the most important of those arenas is in the 3rd-party component marketplace</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">if you're building an app and you need a ...  ummm...  DonkeyGraph control</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">you're a lot more likely to get one that works well in your Swing app</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">as SWT/JFace is really a closed component set</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">and that DonkeyGraph will look perfect on Windows, Mac, Linux, Solaris, etc...</span></td></tr>

<tr><td class="light"><b>pcalcina</b></td><td class="light">What do you think about native compilers initiative, like gcj?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">that's also a tricky one</span></td></tr>
<tr><td class="light"><b>pcalcina</b></td><td class="light">they say the main raseon to do it is: Java is slow</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I like native compilers (we made the first Java JIT at Borland)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">folks that say "Java is slow" have not used Java since the introduction of HotSpot</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Java is dynamically compiled to inline native bytecodes based on program *trends*</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">a Java program is statistically faster than a native application</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">the only issue is where the processing crossed the "boundry" of java heap coding into native code</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">if you do a ton of I/O, for example - the "hop" between the Java code and native OS code will be expensive</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">in some cases</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">so you have to program with "java" in mind</span></td></tr>
<tr><td class="dark"><b>pcalcina</b></td><td class="dark">well, swing somtimes is slower than native gui apis</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">lazy loading of resources - batch loading - off-thread prep, etc</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I love this line (because its my line):</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">"It is very easy to write bad Java code, which will perform poorly"</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">"It is also very easy to write bad native code, which will perform well"</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">"But well written Java code will out perform well written native code"</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">"Thank you, hotspot"</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">you can't beat dynamic optimization</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">if you code well - algorhythms are always a good skill - Java shines</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">don't waste Java cycles recalculating things you did two pops ago in the stack, etc</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">pay attention</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">and you will be payed well</span></td></tr>
<tr><td class="dark"><b>pcalcina</b></td><td class="dark">I'm starting in Java programming, after programming a lot in C++ and I wonder where can I get some of the things you mentionsed?</td></tr>

<tr><td class="light"><b>CVT</b></td><td class="light">What is the HotSpot?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">look at high-performant Java apps, like for example, JBuilder</span></td></tr>
<tr><td class="light"><b>pcalcina</b></td><td class="light">about the trickiness of writing well java swing code</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I think following the javadesktop forum on Java.Net is a good place to dig</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">HotSpot - is the key architecture behind the modern Java VM</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">If you've never heard about HotSpot, I highly recommend you read about it</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">especially you C/C++ guys</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Ok, I will. Any good source?</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I could Alt+Tab and Google it for you, but I think you're pretty smart...  ;-)</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Hehe.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">there should be a LOT about it</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">java.sun.com too</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">pcalcina: I recommend using a good profiling tool</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">that is the best way to see where the cycles are being spent</span></td></tr>
<tr><td class="light"><b>CVT</b></td><td class="light">Can we live without Google?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">its amazing isn't it</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">the dependency that has grown...</span></td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Just like the cellphone.</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">there are many other search engines, of course - but nobody but Google has become a verb!</span></td></tr>
<tr><td class="dark"><b>pcalcina</b></td><td class="dark">sorry, what do you mean with a profiling tool?, (English is not my 'native language'?)</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">http://java.sun.com/products/hotspot/</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">there's the HotSpot stuff</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">pretty egg-headed, but a good read</span></td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">Sun_Joe: nice chat once again</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">a profiling tool like OptimizeIt will show you where cycles are being spent by the processor</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">Thanks all!</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">I think we're coming to a close here</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">I'm off to watch USA vs. Guatemala (World Cup Qualifying)</span></td></tr>
<tr><td class="light"><b>jmpld40</b></td><td class="light">Sun_Joe: thanks</td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">Sun_Joe: great job keeping the flow moving</td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">good luck in your competition!</span></td></tr>
<tr><td class="dark"><b>mike</b></td><td class="dark">Sun_Joe: it was very informative</td></tr>
<tr><td class="light"><b>pcalcina</b></td><td class="light">thanks for all</td></tr>
<tr><td class="dark"><b>CVT</b></td><td class="dark">Thank you.</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">You're welcome</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">good luck!</span></td></tr>

<tr><td class="light"><b>pcalcina</b></td><td class="light">Could you tell us about the license of sun products?</td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">there are a few different licenses, actually</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">you'd have to consult the individual product license</span></td></tr>
<tr><td class="dark"><b>pcalcina</b></td><td class="dark">ok</td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">from what I understand - there's not a whole lot of catches to them</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">They would like you to build great apps and go out and become rich and famous</span></td></tr>

<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">(and buy a bunch of Sun hardware to support your fame and fortune)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">(and bandwidth)</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">;-)</span></td></tr>
<tr><td class="dark"><span class="bigRed">Sun_Joe</span></td><td class="dark"><span class="bigRed">okay - off I go</span></td></tr>
<tr><td class="light"><span class="bigRed">Sun_Joe</span></td><td class="light"><span class="bigRed">thanks again everyone</span></td></tr>
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
