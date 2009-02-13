<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: Spotlight Sessions: Specification Chat Transcript</title>
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
    <tc-webtag:forumLink forumID="525971" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Spotlight Sessions: Specification Chat Transcript</span>
<br />
<br />
<br clear="all">

<div>
<table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from <span class="bigTitle">Specification Chat</span>: Spotlight Session with 
          <tc-webtag:handle coderId="7442703" context="algorithm" /></div>
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

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Welcome to the chat everyone</span></td></tr>

<tr class="dark"><td class="value"><strong>RaulEnriqueSil</strong></td><td class="value">Hi all word</td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Welcome to AssertionsOn as well</span></td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">is it starting?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">We'd like to keep this chat focused on Specification competitions and what they are all about</span></td></tr>

<tr class="dark"><td class="value"><strong>chownikhil</strong></td><td class="value">can any one explain what this is all about</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Thanks everyone for joining us in todays chat.</span></td></tr>

<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">so.. what is it all about?</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">hi all!</td></tr>

<tr class="dark"><td class="value"><strong>zhch12121</strong></td><td class="value">e...</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">its midnight in the philippines</td></tr>

<tr class="dark"><td class="value"><strong>zhch12121</strong></td><td class="value">its midnight in china</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">First of all, I saw your posts in the forums.  Congratulations for representing the Specifications Spotlight Sessions.  So here are my questions: </td></tr>

<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">yoitsfrancis: you from the philippines?</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #1: Lets say that I'm new to this type of track.  I have a feeling that in order for someone to win in this contest, you must have some experience in doing Specifications or similar tasks in Software Engineering.  Let's say that I don't have that</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">[hitcher]:  Maininly, specification (and concept) competitions deal with looking at a very high level at a clients idea and coming up with a technical solution.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">I notice that there are no good Specifications deliverables for us to study unlike Design and Development that is available in the TC Catalog because of the obvious nature that this type of competition is client specific.</td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #1a: Are there good books that you can train yourself to be good at this? Question #1b: Are there good websites or links that are worth studying for this type of competitions?</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #1c: Is there more good resource that you might share that I missed?</td></tr>

<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">AssertionsOn: oh. got nosebleed.</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">[hitcher]: yup</td></tr>

<tr class="dark"><td class="value"><strong>[hitcher]</strong></td><td class="value">yoitsfrancis: kabayan :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Not necessarily. Any exp. in building applications will be helpful, especially web applications.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: I mainly  rely on  past experiences for guiding my submissions, as well as my creativity. It helps a lot to think outside the box. </span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Google and TopCoder are great references</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Also, by looking at what past winners have produced greatly helps.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: Also, we have some resources on our wiki.  They are not 100% up to date to the current specification contests, but the content should still be helpful for the basics of what we are looking for.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: Check this link:  http://www.topcoder.com/wiki/display/tc/Application+Requirements+Specifications</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">oh i see!</td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">thanks!</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #2: Let's say that I am equally good in Specifications, Architecture, Design, Development, Studio, Assembly and Testing.  Is Specifications a track is really really really worthwhile pursuing?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: For conceptualization, see here: http://www.topcoder.com/wiki/display/tc/Conceptualization+Competitions</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">I know that this track is relavitely young compared to others but do you think money has already been made in Design and Development based on the vast number of components in the Catalog and you would recommend on shifting to Specifications?</td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">And may I know the reason why?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Plus, all, yo u have to remember that these contests are not as technical as design and developement contests, so you don't have to be too techincal. If you can explain your ideas in a straightforward way, you have a great chance of  winning.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: The specification track will have less trips to the TCO, but for every project we do we expect to have conceptualization, specification, and architecture work.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: Realistically, though we do have a large catalog, some amount of component work may be necessary for most projects... so I wouldn't write those off yet.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Yes. Just look at the last 2 months of competitions. There has been a ton of Concept/Spec contests been put out.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Some people don't have the tech background for those types of competitions, and these would allow them to be involved in the TC process, as well as gain experience, feedback, and potentially some cash.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: Yes, indeed - we don't expect everyone from component competitions to be great at specification, and vice versa.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">that was @AssertionsOn, been a while since I messed with the arena chat interface =)</span></td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AdamSelene: Yup, I understand</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #3: I saw fellow member's post in the forums and feel them that its hard to earn prize money at TopCoder.  Let's say that I have a full time job, work 8-12 hours a day earning $400-$900 a month.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Exactly, I am not great at design and development competitions, but I love these competitions since I don't have to dive into all the technical aspects of an appllication. I can come up with some great ideas and present them in a meaningful way.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">(I love Software Engineering so if ever I land in Specifications that would be totally fine with me).  Is devoting full time in Specifications the answer?  If so, how would I make that shift from a full time job to a full time TopCoder competing member?</td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">(Well, if you personally ask me on the shift thing, that is really really tough, especially that you don't get enough rest so if you have a better technique in shifting, I am all ears).</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: Competing full time at TopCoder is an important personal choice - you need to weigh the factors involved.  I don't think we can guarantee that any single type of competition will always have enough volume...</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Remember there are some full time design/devs at TopCoder who rely on it for their only income. For us 40hr/week guys, it can be tough to keep up with them.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AssertionsOn: good for you then!</td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AssertionsOn: you do the things you love!</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: we would love for that to be the case, but it is dependent on a lot of factors - client work volume, the overall economy, etc.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: I personally work 40+ a week and have children, so it is semi-stressful. But when you win, it is so worth it.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AssertionsOn: yeah i feel you on that one</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: I agree. Don't expect to put 1-2 hours into these compeititons. Usually, I put in about 10-20 per contest.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Plus, these competitions (as all of them) are very addictive. After my first one, I wanted to beat the other competitors so bad it kept me up at night trying to figure out how to beat them.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Cause with members like Mig-29, argolite, Ghostar, AleaActaEst, and others, it is both intimidating yet inspirational when you go against them and win.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AssertionsOn: so, how does that feel?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: What feeling are you referencing ?</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Well, it feels good to think you can be in the same sentence with them (wrt Spec/Concept competitions). They are all great at what they do, and you hope to achieve their level of work.</span></td></tr>

<tr class="dark"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">Question #4: Let's say that my happiness can be simply defined as me having $100,000 every year in my pocket (Hey, I'm totally happy with SRMs, but as long as we humans have a civilization and society, I need the money!), is Specifications the track to</td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">go through compared to others?  And may I know the reason why?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">So, let me ask the members a question: What keeps you from participating in these competitions?</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">guys, thats all the questions i have on my side</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">ivern</span></td><td class="value"><span class="bigRed">yoitsfrancis: have you considered trying a competition or two and seeing how it works for you?</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">The lack of a real straightforward scorecard keeps me from competing.  </td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">I like a little bit of structure to the review process</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: Are you saying it is it worth it, to me personally?</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: We would like all our competition tracks to be very profitable for our members.  Given volume of work, we hope any track will be able to keep people happy.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">yoitsfrancis: I think competiting in these is both fun and gives you great experience, even if you don't win.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: I would recommend picking a track based on your aptitude more than anything else</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">yoitsfrancis: I think that will give you the most money in the long run, all external factors being equal.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: I agree with you here, about picking the right track for your personality and exp. </span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: In your experience are problems more in the scorecard or in inexperienced reviewers?  We'd like to fix both problems obviously</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: For me, I can develop and design components, but not at the speed some of the current ones do it. But I know I can push out some specifications really quick.</span></td></tr>

<tr class="light"><td class="value"><strong>yoitsfrancis</strong></td><td class="value">AssertionsOn: answering your question, i have an affinity for a good design</td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">I haven't actually gone through the review process in a spec. contest, but from what I saw in the scorecard, it was fairly subjective as to what the client liked</td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">This is kind of intimidating, since it's hard to judge what the client is exactly looking for</td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">The questions help, but it still can be confusing</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: (wrt Ghostar issues) These are being worked actively by TC . It just takes a little time to get those issues worked out. But I have also had some frustrations along the way myself.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: Understood - so as a barrier to entry you expect clear scorecards and guidelines.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Ghostar: Just so you are all aware, COncept and SPec comps are in the spotlight right now at TC and visit the threads or post here if you have ideas that should be on our radar</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Ghostar: and we have a team dedicated to reviewing the contests so far, and the feedback, and will implement changes</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">That would help.  I'm not sure I like the idea of having the client actively involved in the review process</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: Have you had a chance to look at the architecture scorecards that were posted?  Would posting scorecards in that format help for these contests?  We didn't get much feedback on the arch cards.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">I did look them over, but didn't have time to get too in depth with them</td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">I think that posting the scorecards will help, and I know that is being worked on, from what I have seen in the forums</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: But, would a presentation like that help?  Updating to have all guidelines, including scoring</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">I think so</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: "client in the review process" -&gt; Unfortunately, this is going to keep happening (I think). They need to be involved to make sure their business needs are met at this high of a level.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">I understand that, but it definitely makes the process more initimidating, and a little more chaotic</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: But they are getting members more involved in the review, so the comments/appeals/etc are getting extremely better.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I think what we are moving towards is client review only at a high level during conceptualization.  I think everyone agrees with Ghostar that we need accountability and regularity in more detailed review</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: Agreed</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">Asser</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: (Don't mess up my handle or you might get flagged for profanity ;) )</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn:  It seems like Mig-29 is winning most of these.  Do you have a strategy to beat him?</td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: I'm new to the chat room :)</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: Yes I have a strategy to beat them, but I can't give that away unfortunately. Then I would have everyone else beating me, and that would not be fun.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn:  Do you find that a lot of these competitions are similar enough in nature to pull together different pieces of past competitions?  I do that quite a bit with architecture competitions, and it saves a bunch of time, and cuts down on mistakes</td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn:  I figured :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: I would expect to see that sooner than later - especially with conceptualization - many clients for instance need social networking features</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: There are small instances of reusing past competition content, but not really. I would say about 90% of my submission is brand new information. That is one area I need to improve in.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: That's kind of another barrier to entry, since there isn't a way (that I know of) to download past submissions</td></tr>

<tr class="dark"><td class="value"><strong>barbarab</strong></td><td class="value">Are there any good examples of past specification winners available?  There are some great algo tutorials, but none for specifications or architecture that I can find.</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: I do think TC has posted sample competitions up in the forums and included them in the distrobutions, so if you follow that you should be fine.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">barbarab: We are working on providing more examples, but it is a tough issue as the output for these competitions is often very client specific</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: I like to be able to see all of them, not just a single sample.  That way I can find ones that have similar goals to a new one posted.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">barbarab: Not that I know of, to date. There is a sample set of deliverables, but I don't know if they are pubically available or not. </span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I know we posted a couple of architecture submissions in the wiki awhile back.  I'm not sure if they are still there.  They were for internal TC systems</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: I think that is fairly unlikely, again because of client concerns.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: That's true :(</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: yes, for internal projects I'm sure we will post them; I do not know that there has been more than one completed so far though</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: Agreed. I would like to see personally the differences between the Round 1 and Round 2 submissions, just to see how much difference there is.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">You brought up the round concept so I will jump on that...</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">The round 1 submissions are NOT intended to be full submissions</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Has that been at all clear in recent competitions?</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">The idea is that round 1 will flesh out use cases, and round 2 will provide the complete document.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: Aren't only the top 3 allowed to go on to round 2?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I don't believe so, round 1 is not intended to winnow competition.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">It may have been tried that way in the past.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: Nope, only those who submit for R1 can go to R2</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">The reasoning behind rounds is just that we have often had this situation:</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Client likes submission #1, and #2, and #3</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">not because of styling, or quality</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">But because #2 has an idea that the other 2 missed</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">and #3 integrates the uses cases more clearly</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">but say #1 is the best written and won the contest.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: But, remember that R1 submissions get screened so if you don't have everything filled out, you may not go to R2</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">To avoid this situation, round 1 should unify the core content of the submissions</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: Yes, I believe that is just to try to ensure that all competitors in round 1 are actively participating</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: and not just waiting for round 2 to decide whether to compete</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: Agreed.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I guess this is another concern I have with the competition.  Doesn't that cut down on the competitive advantage I may have by coming up with good ideas? </td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: Since those ideas may be shared with the rest of the competitors?</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: yes and no</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: Yes. This is one issue I have with the new round formats.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: yes - it may slightly, but the intention is by paying round 1, you are compensated for the best ideas</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: the net intended effect of the contest is to deliver a complete, quality business requirements document to the client</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Ghostar: the advantage should be the ability to do that, in the end</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: But, these prizes are sometimes too low to warrant putting out all the good ideas for others to latch onto.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: I agree with that</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I am at a bit of a loss to answer that, thinking.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I know that TC's main concern is getting the client what it needs, but in this particular case, that goal and how it is achieved seems to go against the competition concept</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: And therefore results in the construction of your winning strategy.....</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">OK, so we need two things</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">1) all the good ideas</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">2) a document that is written well and clearly that contains all of #1</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">we are certainly open to any format that arrives at that</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">If we shift the balance of money, does that solve your concern with the round format?</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">e.g. 50% round 1, 50% roudn 2?</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: In my mind, why not do it like Studio?  The client picks a winner, and if they want ideas from other submissions, they pay for those as well, and then the overall winner goes through final fixes, adding in the things the client wants</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">we can't go any further than that, because then people won't take the time to complete #2, will they?</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: Interesting idea.....</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">But that's what we're doing with the two round format, basically</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: People like me and Mig-29 will still compete ;)</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">in theoretically, a lot less time</span></td></tr>

<tr class="light"><td class="value"><strong>cyGNUs</strong></td><td class="value">AdamSelene: then make payouts only after competing in round #2</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I guess in your model you have potetntially more money in round 1</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: True, but at the expense of not having a true "competition"</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">no, it's still competitive imo, you're still conflating the two competitions</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">#1 idea generation, #2 idea documentation</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I may come up with a great idea and not be able to write it down concisely</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: Why not break it up into two competitions then?  </td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">that is the intention with the round format =)</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Is there anyone new to specification contests that need more information about how to compete, etc.?  I know we are diving into contest specifics, so if anyone has any more general questions, speak  up.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: Yes, but you *have* to compete in the idea generation to compete in the documentation portion</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">So you would be OK with open registration for rd 2?</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: Not really.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I guess so.  I still am uncomfortable with the idea of rounds.  I think it should be two distinct competitions, with separate reviews and payments for each</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Well, they are.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Round 1: reviewed by client, paid</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Round 2: reviewed by members hopefully, paid</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">This is exactly the intent behind the roudn format, with the minimum of overhead.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I still don't like it :)  </td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">hehehe</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I want to be the winner of a full contest, not just 1/2 of one</td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I want my competition history to say that I won this or that</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: They are working on this, I believe.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I see.  So if we presented it as clearly two separate competitions, you would like it better.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Anyone else agree?  AssertionsOn?</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I think so, but don't hold me to that :)</td></tr>

<tr class="dark"><td class="value"><strong>gt494</strong></td><td class="value">AdamSelene: would reg of round 2 depend on participation in round 1?</td></tr>

<tr class="light"><td class="value"><strong>barbarab</strong></td><td class="value">AdamSelene: Yes, two separate contests will encourage and reward teamwork - especially if all good ideas are rewarded appropriately in the ideas competition.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: I personally don't like that idea.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">gt494: I don't have any preference, Ghostar seems to like no, AssertionsOn, yes.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: But, I would have to think about it some more.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">gt494: I think that idea generation and documentation are two separate skills</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: I am just starting to like the new format myself.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">gt494: Look at how many submissions were received for the AOL contest, which was purely idea generation</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: The senstations contest?</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">That was much lower resolution than conceptualization would need to be though.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">gt494: Yes</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">(Believe me, I've read almost every submission)</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">That was just a call for projects.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: True.</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: I think they are totally different, and you would not get 100+ submissions.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Conceptualization needs to identify all core use cases.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Personally I don't think that they are particularly disjoint because the same skill that lets you analyze what the client says and figure out what they really want will also guide you in the details of your submission.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I think it would definitely need to be not quite so free form, for obvious reasons, but I think that splitting the two couldn't hurt</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">I think if you are the only one who thought of Use Case XXX, you've been thinking about it for that much longer and have a basic understanding of why the client wants it</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">that your competitors lack.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">It certainly helps the competitors to be given your idea</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">But I think you still have an edge over them.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">But I am not the one actually doing these competitions so I will tend to believe you guys more than what I dream up =)</span></td></tr>

<tr class="light"><td class="value"><strong>barbarab</strong></td><td class="value">AdamSelene: It would probably improve round 2 submissions if you had an example or two of well written specs - possibly from TopCoder internal projects</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: I don't think there is any advantage once competitors have you solution. It is better for the client though.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: True.  It's hard for me to have a different perspective on this, since I am pretty good at documenting ideas, but not so good at actual idea generation</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">barbarab: Yes, we understand and will get examples clearly posted as soon as we are able.</span></td></tr>

<tr class="light"><td class="value"><strong>Ghostar</strong></td><td class="value">AdamSelene: I guess I just feel that there is much more straight creativity in round 1 which may suite certain members more than round 2</td></tr>

<tr class="dark"><td class="value"><strong>barbarab</strong></td><td class="value">AdamSelene: Thank you</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: they won't have your solution though, all that should be shared after round 1 is the core use case.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: If I tell everyone that "Vote for comment" is a core use case</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: Do I end up with TC's +/-?  Slashdot's karma system? what?</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: there is still a lot of room to distinguish yourself.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">(imo)</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: Disagreed. Past comments have been extremely detailed, and stated details that one document had and the others did not. </span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">AssertionsOn: OK, that is a problem and not the intent of the round system.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">AdamSelene: All for the price of $50.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">As we start winding down this chat, does anyone else have any questions about how to compete or about the actual competition for AssertionsOn or the TC Admins?</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Specification Competition will be part of the TCO and all the details will be anounced next week..</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">I want to personally thank everyone for joining the chat and asking questions. I hope to see you all in these competitions.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: I have a feeling I will see you in Vegas :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">however...the AOL/TC Sensations Developer Challenge Idea Generation Competition is over now so apps will need to be built!</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Even if you don't win, they give you great experience for future endeavors.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: I hope so. It would be an honor.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">These competitions are starting sooner than you think so i'm hoping you'll all give them a try</span></td></tr>

<tr class="light"><td class="value"><strong>kalc</strong></td><td class="value">any one here???</td></tr>

<tr class="dark"><td class="value"><strong>barbarab</strong></td><td class="value">AdamSelene: Good luck finding a system that rewards teamwork!</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">barbarab: LOL!</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">A big thank you to AssertionsOn, AdamSelene and all others for participating in the chat.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Thank you TopCoder for asking me to join this chat. I had a great time discussing these competitions.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">I'll be posting the entire transcript as soon as I can and we can discuss things further in the accompnaying forum.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Remember we will have 2 other chats, one next week with Ghostar about Architecture so don't miss them.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Any other questions about Spec competitions?  anyone? :)</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: I'll be at that chat, so get ready for some tough questions.</span></td></tr>

<tr class="dark"><td class="value"><strong>Ghostar</strong></td><td class="value">AssertionsOn: Bring it on :)</td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Ghostar: Consider yourself served ;)</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">burn</span></td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">hi !</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: Hello</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">lancord: Hi there, you're coming in on the tail end of the chat =) Do you have any questions about Concept/Spec contests?</span></td></tr>

<tr class="dark"><td class="value"><strong>lancord</strong></td><td class="value">yeah</td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">jus in short plzz tell me wat in specific i nee dto know for design and ev.</td></tr>

<tr class="dark"><td class="value"><strong>lancord</strong></td><td class="value">i mean a;lgo is not making me money</td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">thr ?</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: High level system use cases and good documentation/idea skills</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">There are some tutorials and other information on our wiki: http://www.topcoder.com/wiki/display/tc/Getting+Started+in+Component+Design+Competitions</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">http://www.topcoder.com/wiki/display/tc/How+to+Compete+in+Component+Development+Competitions</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: I would chekc out the wiki page AdamSelene put up</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: it is very helpful in giving a brief intro to these new competition types</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">If you are interested in Conceptualization, see http://www.topcoder.com/wiki/display/tc/TopCoder+Conceptualization+Contests</span></td></tr>

<tr class="dark"><td class="value"><strong>lancord</strong></td><td class="value">okay.......i and how much time will it take to get good in these things</td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">like if u i devote 5-6 hrs daily</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: I personally put in about 10 hrs a day on contests, if not more.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">If you can spend that much time per day, I would expect you to start seeing results within 3 to 4 competitions.  Every competition should give you feedback on how well you are doing, and where you need to improve.</span></td></tr>

<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">we'll also have a chat about design and dev right here on wed. feb 11 at 11:00 a.m. EST</span></td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">okay hmmm......thanks </td></tr>

<tr class="dark"><td class="value"><strong>lancord</strong></td><td class="value">okay</td></tr>

<tr class="light"><td class="value"><strong>lancord</strong></td><td class="value">thanks for the advices</td></tr>

<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">lancord: No prob. also check out the forums for future discussions about these comp.</span></td></tr>

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">read more here:  http://www.topcoder.com/news/2009/01/27/new-spotlight-sessions-at-topcoder/</span></td></tr>
<tr class="dark"><td class="value"><strong>lancord</strong></td><td class="value">k</td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">thanks again everyone and hope to see you next week!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AssertionsOn</span></td><td class="value"><span class="bigRed">Thanks everyone!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Thanks everyone, feel free to email me at geldridge@topcoder.com if you have more questions.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">Bye!</span></td></tr>
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
