<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: Spotlight Sessions: Architecture Chat Transcript</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.GAtableText
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
}
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

<div class="linkBox">
    <a href="/tc?module=Static&amp;d1=features&amp;d2=archive">Archive</a><br />
    <span id="printableLink"><a href="Javascript:makeInvisible();">Printable view</a><br /></span>
    <span id="navigableLink" class="invisible"><a href="Javascript:makeNavigable();">Normal view</a><br /></span>
    <tc-webtag:forumLink forumID="525972" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Spotlight Sessions: Architecture Chat Transcript</span>
<br />
<br />
<br clear="all">

<div>
<table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from <span class="bigTitle">Architecture Chat</span>: Spotlight Session with 
          <tc-webtag:handle coderId="151743" context="algorithm" /></div>
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

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Welcome to the Architecture Chat!</span></td></tr>
<tr class="dark"><td class="value"><strong>ahm.kam_92</strong></td><td class="value">Ghostar: who r u ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">We've got Ghostar here to answer questions about competing so ask away!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">I'm Justin Gasper.  I live in Wisconsin, in the US</span></td></tr>
<tr class="light"><td class="value"><strong>phars_alnmr</strong></td><td class="value">i am phars</td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: can you tell us what architecture is all about</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Architecture comes after the specification and conceptualization phases</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Basically it involves looking at a large system and then breaking it up into individual components</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">The archtiecture must define security and threading functionality, as well as provide a "big picture" look at a particular system</span></td></tr>
<tr class="dark"><td class="value"><strong>phars_alnmr</strong></td><td class="value">if i have a string like that " bhjbk" and i want to loop to each char how can i do that?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">To see how architecture fits in to the general TC methodology, you can take a look here, as well : http://www.topcoder.com/wiki/display/tc/The+TopCoder+Platform+-+Software+Application+Development+Methodology</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">The deliverables include sequence diagrams that define the flow of information, interface (API) diagrams for systems, and the specifications for components</span></td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">phars_alnmr: are you seriously asking that question?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">phars_alnmr: This chat is specifically about architecture competitions at TopCoder, you might find better answers in the main lobby.</span></td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">lol</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: I assume the question's already been asked, but what's the easiest way you've found to get started in one of these Architecture competition thingies?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Just started, hadn't been asked yet =)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I would say the easiest thing to do is just to try one</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: There's no penalty for failing :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: By actually working through one and comparing with other submissions, you can easily see what you did right and wrong</span></td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: is there any way we can practice for it?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: Not that I know of.  </span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: Going through one is kind of like practice, but you have the opportunity to win some $ if you do well</span></td></tr>
<tr class="dark"><td class="value"><strong>chtomek</strong></td><td class="value">Ghostar: which design patterns do you find the most usefull to learn</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: The easiest thing to do is look at the deliverables, which AdamSelene posted a link to above, and then just dive in</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: In a few minutes, care to repost the link? :)</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: (doesn't have to be done yet)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">/wsp connect4 http://www.topcoder.com/wiki/display/tc/The+TopCoder+Platform+-+Software+Application+Development+Methodology</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">woops</span></td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: thank you. </td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">my command skills are poor</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: How much time do you usually put into one of these magical competition things?</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: no worries, now it's there for everyone else!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: Because I have done a bunch of this type of work in the past, I normally put in less than 10 hours</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: A lot of what goes into an architecture I have already done before, so I pull bits and pieces from past projects, where appropriate</span></td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: do you think. algorithmic skill is needed in this type of competition?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: Very little, if any algorithmic skill is needed for this type of competition</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: The majority of the work has to do with designing: API definition, sequence diagrams, and use cases</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: As well as a bunch of documentation in Word files</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">that's the beauty of the thing :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">the most useful skill that would translate is probably around rutnime efficiency, understanding where problems may arise and ensuring the architecture accoutns for that</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">That is correct</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Some architectures have very strict requirements for efficiency that has to be taken into account</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar, where do you work?</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: It's ok.  You have the same command skills than Ian Kennedy did pitching :)</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: (and if you don't get that, ask jmpld40 :)</td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: oh. thats a lot of work to be done. and im used with paper works</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I am currently looking for a fulltime job, doing TC to help pay the bills</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">=)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">connect4: you always find a way to bring up the yanks... :)</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">jmpld40: but would you be disappointed if I didn't? :)</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: hmmm... How old are you?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">connect4: :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: 28</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">he is also very tall</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">(relative at least to me)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AdamSelene: I'm the shortest one in my family :)</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: do you have a degree?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AdamSelene: My dad's 6'6, and my brothers are 6'3 and 6'4</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: How many competitions did it take you before you got comfortable with these competitions?</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Adam, I'm very tall too :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I have a B.S. in C.S.</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: like... 2meters</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: W00t!  I'm taller than you :)</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: hhehe</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I was actually pretty comfortable right out of the gate</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Hmm.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I had had experience with architecture before TC started the competitions through some contracting I did with TC for things like the UML Tool</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Do you think that TC will help you get a nice job?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: And a couple of other projects</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: That remains to be seen.  I hope so</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Does TC takes too much of your time?</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: (Does that sounded correct?)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I have done TC exclusively for the last 3 years, so it has taken quite a bit of my time.</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: (my english skills are poor)</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: hmmm</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: but that's nice</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: I mean...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: With the current economic situation, it just isn't as viable as it used to be</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I work pretty much 30-40 hours a week</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Hmmm</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: And does the "salary" good for you?</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: I mean</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Is it confortable?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: Until about November of last year, it was more than comfortable</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: Since then, not so much</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Why? The economic situation?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: Yep</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: :/</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: Keep working with TC</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I will try to</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: that way we know that it will never ie :)</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: *die</td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: what PL do we need in this compe?</td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">Ghostar: What is differnece between system architecture and module architecture?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">PL?</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Probably Programming Language</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: A system architecture is higher level than a module architecture</span></td></tr>
<tr class="light"><td class="value"><strong>AssertionsOn</strong></td><td class="value">Ghostar: I have never particicpated in an architecture competition before, so can you explain about how muct time it would take a new architect to complete a competition?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: A system architecture tends to define the module architectures and assemblies for an application as a whole</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">[hitcher]: if programming language. we typically use either Java or C#, occasionally c++</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: And the module architectures are just big pieces of the application</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AssertionsOn: That</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AssertionsOn: That's a hard one to estimate</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Are there plans to use Ruby? Rails?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AssertionsOn: I tend to take around 10 hours to complete one, but I pull from a lot of past contests I have done</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">afonseca: RoR is an option we explored late last year, right now we don't have any client demand but we are definitely open to it</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">Ghostar: So given an architecture competition, how do we know what's required?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AssertionsOn: Also, I am very familiar with the templates and deliverables</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Hmmm...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The specification on the wiki should always be clear exactly which deliverables you have to deliver</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Good to know.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: If you have any questions whatsoever, raise it on the forums immediately</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: The number of app in RoR is rising</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">AdamSelene: Better, growing</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: I almost had TC convinced to do some RoR stuff towards the end of last year</span></td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: HEehe</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: it's really really fast develop, don't you think?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">afonseca: That's why I chose it :)</span></td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: hehe</td></tr>
<tr class="light"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: I gotta go</td></tr>
<tr class="dark"><td class="value"><strong>afonseca</strong></td><td class="value">Ghostar: nice talking to you all</td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">Ghostar: ok. does it involve web programming?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: Depends on the project</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: Some are fat clients, some are web based</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">[hitcher]: I would say the majority are web based, but it could be just about anything</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: In brief can you explain the differences in the deliverables for module/system?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Sure.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: In a system architecture, the main deliverable is a System Design Spec (SDS).</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: This spec lays out the overall architecture for the entire application - how the tiers are broken up, how each tier should work</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The logical layout of the system, basically.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The pieces of this system need to be "modules"</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: For example in an eCommerce application this might be a customer facing web site and an inventory system that back that site</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The system architecture needs to define the interactions between the two</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: and the underlying technical approach for common functionality - configuration, logging, and so on.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: Each module that the system architecture defines goes to specification, and then module architecture.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The module architecture is a lower level architecture - it declares the components to be used, and lays out sequence diagrams for each concrete requirement</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: Continuing the example, say, add item to cart in the consumer web site.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: It is responsible for detailing how the system architecture's patterns and rules are followed - e.g. requiring a specific method or area of configuration for a component.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: Here is a link about system architecture that goes into more detail: http://www.topcoder.com/wiki/display/training/System+Architecture</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: Stop answering a question I was about to ask right before I ask it!</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">=)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Anybody else?  Bueller?</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">I can come up with non-architecture questions if we need to to kill time :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">I'm here for an hour</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">jmpld40 could tell you all about some of the ones I've come up with in the past :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Bringing up the Yankees won't work for me, I'm a Brewers fan</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I'm happy to answer any other TopCoder competition related questions as well.</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ah the Brewers!  I got to see a game there as part of my bachelor party :)</td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: So in the module architecture, the main task is 'component breakdown'?</td></tr>
<tr class="light"><td class="value"><strong>[hitcher]</strong></td><td class="value">AdamSelene: will the number of SRMs increased after the TCO?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: yes, more or less</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">[hitcher]: that I do not know</span></td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">AdamSelene: i hope, it will :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">[hitcher]: for now they will stay at 2 per month</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">So any more questions about Architecture Competitions?  Are you all going to try them out now? :)</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">How much time does one get for these competition thingies?  I haven't looked into them much, but extra income (if I can win it) isn't a bad thing.  10 hours for Ghostar isn't bad, but if you're only given 15 hours total... :)</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">jmpld40: That depends.  The entry barrier still seems high and scary.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Usually at least 4 days or so</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Architecture competitions tend to have submission of 4-7 days</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">probably average 5.</span></td></tr>
<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">AdamSelene: does the interface include in the criteria?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">[hitcher]: Not sure I understand the question - architects are responsible for designing certain interfaces</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AdamSelene: Do you forsee more .Net dev/design comps in the future (I realize it depends on client demand, but just wondered if you had anything "in the works"). Like, for the TCO for example, is it going to be all Java?</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">So to clarify, from the little I'm looking at right now, architecture competitions are more about setting up a design and less about writing code?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: That's correct</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: Depending on the project, you may not write any code at all</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">dcp: At least a major part of the TCO will be the SDC contests.  You can help influence the platform for those by participating in the concept and architecture for those =)</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: Recently I have seen many design competitions launched which already have an almost complete tcuml as input. Are these the output of an architecture competition?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: I would assume so</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AdamSelene: Sorry, not sure what SDC contest is, is that "specification"?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: That is possibly the case but I am not sure - normally the architecture will only provide the API which is shared between two components so that they can be performed in parallel</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: I personally tend to provide pretty detailed sequence and interface documents</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: dcp - the Sensations Developer Challenge - link in a second</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: promising :)  And coming up with tests is part of those "testing" competitions I assume that are related but 12 steps or so down the line.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: Especially for custom components that are interdependent</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: http://sensations.aol.com/</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: oops, that was at cp</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: *d</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: argh.  @dcp</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: :)</td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">lol</td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AdamSelene: 3rd times the charm :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">there we go!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">=)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: That's right.  I think the testing competitions are towards the end of the process</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">You're a smrt typer there adam :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I think the test competitions are broken up into specification and implementation contests</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: At least they were in the past</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Yes, that is how they tend to run still.</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: Cool, thanks for the learneding :)  Do you have to administer the architecture thing once you win it?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">They are not part of architecture.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: Yep, support for all contests that come out of the competition is the responsibility of the winner</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: Ah ok.  Then I'll retract all testing questions until the future "testing" chat :)</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: Sounds fun.  Although potentially a lot of work!</td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">Ghostar: I'm not quite sure what 'sequence and interface documents' mean exactly? By interface, do you mean API?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: It can be a lot of work, but the payout is usually more than a design, although lately the prizes have been a little weak</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: Yep, I call them interface diagrams, but they are basically just class diagrams that describe the API</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">System architecture is responsible for defining any API between modules, and module architecture is responsible for API between components.</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: Yea, I figured the prize issue hurts things a little, but hopefully the economomy will turn around soon :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I hope so.  My wife wants to start a bakery.  We have some of the equipment, but the $ situation sucks so we are waiting to do more</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">Ghostar: And are the 'sequence diagrams' like the usual SDs, just that these connect components instead of classes?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: That's the intent</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">Ghostar: Sorry for converting this chat into a interactive tutorial!</td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: ooh that sounsd like fun!  Next time I'm in your area, I'll definitely patronize you</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: I tend to be more detailed than required in most of mine, only a little higher level than a design</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">Ghostar: err I mean your business.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: No one ever tends to be in my area :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: I live in the middle of nowhere in northern Wisconsin</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: That's part of why TC has so much appeal.  I get to do work for big projects, while living in a place where I would never have that kind of opportunity</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: Will these chats be published on TC?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I believe so, jmpld40 can cofirm.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">*confirm</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">yes</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">I love the idea.  I hope things turn around to make life easier for you.  Then you can mail me some baked goods... I'm partial to garlic bread! :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">garlic bread in the mail would be horrible</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">jmpld40: ok, will this be soon?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: My wife can bake just about anything, but like AdamSelene said, who knows if it would work in the mail.</span></td></tr>
<tr class="light"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: You mean you don't like a mixture of garlic, cardboard and postage stamps?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">connect4: Everything in the mail truck would smell like garlic :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">as soon as I can get it posted :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I am partial to garlic</span></td></tr>
<tr class="light"><td class="value"><strong>Mafy</strong></td><td class="value">AdamSelene: Will the SDCs have designs? Or they will be passed from architecture directly to assembly?</td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">jmpld40: Ok :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">ooh ooh!  i'll take some cookies! ;)</span></td></tr>
<tr class="dark"><td class="value"><strong>connect4</strong></td><td class="value">AdamSelene: It's delightful, especially when combined with Roasted chicken with peppers and duct tape</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Mafy: it is expected that they will generate component designs.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">jmpld40: You should check out our blog (find it on LinkedIn), it has all sorts of her favorite recipes</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">jmpld40: Although it is easier when she just makes it for you :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">cool, thanks!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">i'm sure</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">jmpld40: One of the problems of having a home office is that I am only 10 feet away from the kitchen</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">lol</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: How many online competitors will there be for each track in this TCO?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Ghostar: i have the same problem as my husband is a fabulous chef :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: There is no limit on the number of competitors.  The first round of conceptualizations generated roughly 12 per project.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">jmpld40: You guys want to adopt me?</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: No, I meant the number of online finalists for TCO</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Ghostar: haha, only if you bring your baker wife!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">jmpld40: Will do</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: This will be announced as soon as possible</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: jmpld40 may have more info</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">kurtrips: to be announced... :)</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: ok.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">any other architecture questions?  anyone anyone</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: Is there any distinction b/w architectures which go straight to assmebly and those that go to design?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">kurtrips: That's one of the thing argolite and I are trying to accomplish</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: The only time an architecture should go straight to assembly is if the architect can document all code at effectively component design level</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">one key thing, that I realize isn't necessarily expressed well through training etc, is that all implemented code should have a design to it</span></td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: Really? Has this not happened yet?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">so if the code is not covered by a component, it should be covered in the architecture</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I believe some projects have gone directly to assembly, Xanthus projects for one.  In these cases, the architecture must document at a higher level of detail than if the code is going to a component</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">For example if for some use case, say, generate report</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">if straight to assembly, your sequence needs to cover all the calls to generate the report</span></td></tr>
<tr class="light"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: But why would an architect document all code at effectively componet design level when that's not part of the deliverable</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">that is part of the deliverable if no components are generated</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">the deliverables include sequence diagrams for all requirements</span></td></tr>
<tr class="dark"><td class="value"><strong>argolite</strong></td><td class="value">kurtrips: that 's part of the assembly vs desing debate</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">looking at the process as something to generate software, it is not fair to expect the assemblers to figure out everything on their own, nor will it work well</span></td></tr>
<tr class="dark"><td class="value"><strong>argolite</strong></td><td class="value">kurtrips: IMO all the xanhthus atchitectures should have gone via the design route because the scope was big enough to warant one</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I tend to agree with argolite, the only case in which we should go straight to assembly is if the requirements and scope are simple enough to allow the architect to cover the requirements in the standard submission period at componetn level detail</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">this is not possible if the project would be implemented in 5+ components</span></td></tr>
<tr class="light"><td class="value"><strong>argolite</strong></td><td class="value">AdamSelene: Is there a general rule for when it goes directly to assembly, and when to design?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">argolite: the general rule is that it never goes directly to assembly =)</span></td></tr>
<tr class="light"><td class="value"><strong>argolite</strong></td><td class="value">AdamSelene: LOL</td></tr>
<tr class="dark"><td class="value"><strong>kurtrips</strong></td><td class="value">AdamSelene: Yeah, how can the architect himself figure out the scope? It's subjective.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AdamSelene: You may want to start enforcing that :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">trying, trying</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">kurtrips: the scope should be obvious from the requirements. if it is not, the spec should be stopped in review</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">(thanks for that yesterday justin)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">AdamSelene: No problem :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">if you ever have any questions or concerns about the scope, you should immediately notify the PM via the forum</span></td></tr>
<tr class="light"><td class="value"><strong>argolite</strong></td><td class="value">AdamSelene: Yes, it seems to put some architects in a bind, as the scorecard is not meant to judge design-level details</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">argolite: yes, that is another problem</span></td></tr>
<tr class="light"><td class="value"><strong>argolite</strong></td><td class="value">AdamSelene: So, can we at leats bimplement a startegy where the requirements clearly state that the expectatio is desogn/vs assembly?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">that should be the case as is - firstly it should rarely be direct to assembly, and secondly, in "competition task" it should be stated clearly</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">this has been explained internally, if you think it is a problem I can reiterate and try to find a good place on the wiki to note it.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">Any other architecture questions?</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Before we end here, thank you so much Ghostar for coming to chat today.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">and thanks for all of you being here as well</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">Ghostar</span></td><td class="value"><span class="bigRed">My pleasure!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">thanks everyone!</span></td></tr>
</tbody>
</table>
                <br /><br />
            </div>


<p>&nbsp;</p>
     </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
