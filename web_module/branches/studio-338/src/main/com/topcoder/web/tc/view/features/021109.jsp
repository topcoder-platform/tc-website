<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles: Spotlight Sessions: Component Chat Transcript</title>
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
    <tc-webtag:forumLink forumID="525973" message="Discuss this article" /><br />
    <a href="/tc?module=Static&amp;d1=help&amp;d2=writeForTC">Write for TopCoder</a>
</div>
 
<span class="bigTitle">Spotlight Sessions: Component Chat Transcript</span>
<br />
<br />
<br clear="all">

<div>
<table class="stat" style="width: 100%;" cellpadding="0" cellspacing="0">
<thead>
    <tr>
        <td class="title" colspan="2">
        <div>Chat transcript from <span class="bigTitle">Component Chat</span>: Spotlight Session with 
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

<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">Welcome to the final Spotlight Sessions Chat!</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">Hello EVERYONE!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">Hi all</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">Hi everybody</td></tr>
<tr class="light"><td class="value"><strong>seckin_</strong></td><td class="value">hi</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">ivern is on his way</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">nm he is here</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">make sure to ask him the hard questions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">We are outnumbered by the admins...</span></td></tr>
<tr class="dark"><td class="value"><strong>seckin_</strong></td><td class="value">so, what is component design? :)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">oh, do we have just an hour to answer that?!</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">how come a c/c++ programmer take part in components design contests?What else do we need to learn?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">seckin_: A great way to have fun ... make some good money</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: Meet new red friends</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: +1</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">seckin_: it is bascially a structured system for making a design which developers can then take and write code from.</span></td></tr>
<tr class="light"><td class="value"><strong>seckin_</strong></td><td class="value">argolite: i mean what is expected from a component designer and what kind of problems you face to solve?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: In desing I would say we take a small part of an application, and attempt to outline a detailed solution for it</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">seckin_: and starting with the time line... a typical design competition is about 5-6 days</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: can you plz explain this  a bit more?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: Something the developers, who actually provide the code, can take and, well, code it</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">whats the programming language do you use?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: currently mostly java and C#</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: I think the best way is to start with an example. Right now there is a competition to design some DAOs for an application</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: but also some C++, Flash (action script) and we had PHP as well</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: Mostly java and C# though</span></td></tr>
<tr class="light"><td class="value"><strong>seckin_</strong></td><td class="value">argolite: so we can say that you determine what kind of prosedures will be used and developers fill in those?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: That is one way of looking at it</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: I will provide the details of what needs to happen</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: It may not just be procedures, but classes, etcs</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: then how its different from the design competitions?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: we will basically provide the goty details exactly what needs to happen in that procedure and class, and exactly what classes and procedures are needed, and how they interact with each other</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: Not sure I follow</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: how is software design and component design different?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: the main difference is that in component design we generally focus on a small part of an application, and software design refers to the techniques of gotting it done.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: The focus of Component Design is to create a solution to a problem, in 6 days, that can be developed, tested, and then reu-sed with other compoennts to build an application...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: reu-sed ==&gt; re-used</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: Something relatively small</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">got it</td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">i must be fun then an action pack 6 days</td></tr>
<tr class="light"><td class="value"><strong>seckin_</strong></td><td class="value">argolite: what is DAO?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: DAO means Data Access Object. It refers to a class that completely encapsulates access to the database.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">seckin_: DAO = A design pattern for accessing data</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: lol - it definitely is a lot of fun</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: we then can use a DAO to save data, get data, without the need to know the details of doing that dirty job of calling SQL, etc</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: once you do a couple of the competitions you can become very efficient</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: It can get intense, especially in that last 6 hours</span></td></tr>
<tr class="dark"><td class="value"><strong>seckin_</strong></td><td class="value">argolite: what is needed to be successful in that area?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: when you realize you need more time</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">:)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: some development background is good</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">seckin_: some grounding on object oriented techniques</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">do you have to implement tough algos to get an edge or just design matters? </td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: both...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: sometimes we do need a very good algo to win, but that is somewhat rare</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: but in general it is the design that is most important </span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">definitely</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">This question is for both of you. How much time to you spend studying new technologies and what is your approach for learning them? </td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">Do you sit down and read books cover to cover? Or do you just use the "crash course" approach (i.e. use web tutorials and try to learn the technology as fst as you can)?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: both</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: crash course, and prayer</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I personally do a lot of tutorials</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">I find that reading books takes too much time, which is why I asked.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: try to set up a small environment to try things out... etc...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: totorials, examples, something that get give me quick onfpo how to do something I have not done before</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: I never have time to read a whole subject cover-toi-cover. too many deisgns to do</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I am a big fan of Safary Book Online... :)</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">Yeah, that was my next question (Safari)</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: Safari Books online I mean</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: invaluable</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">Do you use it heavily? I'm trying to talk my employer into buying it, but with the economy, well, you get the idea.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: but we all know that google is your friend... :)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: Usually, though, if I run into a new subject, I got a book. I prefer paper when possible</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I use Safari quite a bit... but I also have probably about 500 actual vbooks as well... as reference</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: can you share your account with other people in your workplace?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: that may be a good selling point with your employer</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">Yes, it's just a really bad time in US right now, as I'm sure you're aware. So asking for *anything* is not a good idea.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: ah, but it is an excellent time to ask to be more efficient</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">Sure, I pointed that out :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: yeah I know what you mean... but Safaru has a number of options</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: that can be relative cheap...</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">It's still being considered.</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">Whats ususally your approach when you get a new challenge?How do you decide a single design pattern?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">dcp: after all, it could be looked upon as trying to save on other resources, and lets you be more efficient</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: bascially for a price of a single book... you can get a full subscription (p/month)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: I have done so many designs, that it usually comes to me quickly, and moist designs usually follow the same patterns</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: *most* designs, not *moist*</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: I know argolite does TC full time, but I think you have a regular job right?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: you need to study the design patterns a bit to become comfortable...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I run my own business</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: BUT... I try to put as much time into TC as I can</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: you mean practice?</td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: Did I read in the forum somewhere that you sleep like an hour a day or soemthing :)</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: no, I mean business a consulting business...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">and what will you suggest for starters read a lot of books or start prcticing?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: lol - NO not that little (well occasionally yes)</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: definitely start practicing</span></td></tr>
<tr class="dark"><td class="value"><strong>Samlovesyou</strong></td><td class="value">how do i get started practicing?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: start practicing. do a simple design, and get feedback</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: how come you manage from just an hour?</td></tr>
<tr class="light"><td class="value"><strong>Samlovesyou</strong></td><td class="value">i want to implement algorithms</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">Samlovesyou: take a look at some recent designs to see what it takes. </span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: I do not really... I sleep on average about 4-5 hours... but I do sometimes go for a couple days on limited time...</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: kudos to you</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: when there is heavy competition... it is not a good idea to cut sleepp for too long</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: Ok, that sounds a bit more realistic then :). </td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: :)</td></tr>
<tr class="dark"><td class="value"><strong>Samlovesyou</strong></td><td class="value">i've competed in ACM before</td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: I find that if you eat extremely well you can cheat a little on the sleep.</td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">Is it possible in TC to design small stuffs and get a feedback?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">Samlovesyou: so what makes you interested in designs</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: definitely true, at least in my experience...</span></td></tr>
<tr class="light"><td class="value"><strong>Samlovesyou</strong></td><td class="value">im not interested in design</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: definitely</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: food has an effect on how you feel and that helps with everything...</span></td></tr>
<tr class="dark"><td class="value"><strong>Samlovesyou</strong></td><td class="value">i am interested in coding..systems apps..raw socks etc</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: How?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: it is important to be focused in general and have well defined goals...</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: I sleep about 5-6 and usually try to do a "catch-up" on Sunday afternoons. It seems to work well.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: I believe there are some giudelines for submitting that may be available. One of the  admins can chime in</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: then you can see if for example sleep depravation coudl eneter the equation... :)</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: But when there's a heavy comp, yeah, I've done the 2-3 days without sleep thing as well.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: that should then tell you how to get started, what you general deliverables are, etc</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: In general... you do what works for you... we are all a littel different... but I just hate sleep...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: then once you know this, you should look at some past contests, in the catalog,</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: and from where will i get the problem statement?The practice rooms dont have component designs' problems?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: there is so much to DO!... and so littel time ;)</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: Ever tried that polywhatever (can't remember the term) pattern? It's something like you take a nap every 3-4 hours?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: right. you would go to the main topcoder page, and go to design section</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: there would would see something like this: http://www.topcoder.com/tc?module=ViewActiveContests&ph=112</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: No... I do not think taht I did... I tend not to nap at all...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: that shows the design competitoins currently open</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: what I mean is I fight it...</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">and then post to the forum to get the feedback...</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: yup</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I have a great fear for examle of going to sleep before i submit something...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">thanx argolite </td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: As long as I'm typing or thining I can stay awake. But if I have to listen to someone talk for any length of time, I'm toast.</td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: thining = thinking</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: yes, spelling is not my greatest strength... lol</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: That was actually my typo, not yours :P</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: But there are many thinngs you can do to improve your chances during the competitions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: and being sleep deprived is really only a weaker option...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: there are a couple rules that I follow:</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 1. know Your Stuff</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: Design Patterns - Study The classic Gof Book "Design Patterns" </span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: I woudl also try some of te J2EE design patterns: http://java.sun.com/blueprints/patterns/index.html</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: know the ScoreCard...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: You need to know what you can get docked for... look at the design competition scorecard and study it... you need to know what you can lose points for</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 2. Study other people's submissions...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: TopCoder is awesome in the simple way that it allows you to see what other people did to WIN... This is invaluable.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 3. Start simple... Do easy competitions...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: you do not have to win initially... you have to pay your dues... do one competition a week... fnish it... go through the appeals process... then see what the winners did...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 4. Focus.</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: Do not go after things you cannot finish. Winning is really about knowing your limits.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: but then hey... :) you gotta try... and there is alwasy that sleep depravation we talked about... it helps for a couple days...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 5. Make time...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">yes, there's always that reserve time between 11 pm and 9 am</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: It is hard to gauge how much time a competition will take... remember... this is very importamnt in any competition... TO KNOW what it takes... I think that is half the battle...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: 6. Do not give up...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: Failures are as useful as wins (except for the money part of course)</span></td></tr>
<tr class="dark"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: Good advice, thanks.</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">and once you learn all these steps, you can move on to advanced techniques...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">reappealing</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: I enjoy dev so much though and it's easier to win typically. I mean, it's hard to compete against full time designers and win.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">dcp: definitely true...</span></td></tr>
<tr class="light"><td class="value"><strong>dcp</strong></td><td class="value">AleaActaEst: But I haven't ruled out trying design at some point, especially with the price changes for dev.</td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite:  Thanx many a time for your very very valuable suggestion </td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: Thanx many a time for your very very valuable suggestion </td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: glad to help. Hope to see you competing</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: You are wolcome! Glad to be of help... :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: my spelling is aweful :(</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: I alwyays plan to ... but seeing the level of competition I always backoff</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: Do not back off...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: np</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: try it... </span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: I know that it can be intimidating... but you will get better as you do it.</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: yes, dont back off. it may take some time, but often you will not have that competition there</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">this time I will try accumulate all my strength and compete...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: contrary to publuc opinion, we do not go for every design</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: it is really about DOING...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: also start early and set goals each day to accomplish something for the competition...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: divide and conquer approach is very useful here (and in life in general)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: so you might start with Use-Case diagram first...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: then...</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: get it done... do a couple iterations... look at other people's use-cases diagrams from past cometitions...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: then you can create the outline of the classes that you will need in your deisgn</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: and ask yourself... how will they interact?</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: to solve the problem9s)?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: problem(s) I mean</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: You can then do a quick Sequcne Diagram to see how all the actions would flow from one class to another...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: for example... lets say that you wanted to ensure that a wen application alweays made sure that a user is logged in...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: god... spelling... wen= WEB</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: let's say you are using a servlet...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: ok</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: how woudl you ensure that each user gesture (i.e. user action in the web page) was checked  for authentication</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: ... that kind of divide and conquer... one main aspect at a time...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: after a while you will see taht you are becoming better, faster, and... more efficient</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: but form design pattern perspective I woudl say the ones that I use the most are:</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: - Strategy Pattern</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: - DAO and DTO </span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: aha i never thought that way before thanx...</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: you mentioned the book "design patterns" ( a Gof book ) can you please tell the name of the author?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: sure...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: you mean you take a design pattern to start with and then see if its best in the scenario?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">authors: Erich Gamma, Richard Helm, Ralph Johnson, John Vlissides</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">authors: thay are known as the gang of four</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: :)</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: thanx for such morale boosting</td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: thanx for such morale boosting</td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: you bet</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">http://www.amazon.com/Design-Patterns-Object-Oriented-Addison-Wesley-Professional/dp/0201633612/ref=pd_bbs_sr_1?ie=UTF8&s=books&qid=1234370914&sr=8-1</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: whats you favourite design pattern and how do you approach a new challenge?</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: going over patterns book will be something you do a lot of as you compete. I still do it myself often</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: well, the most commom one has to be Strategy</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: so that one I dont have to think about</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: but there are many cases where I look at the problem, and go "hmm, maybe this patter or that pattern applies"</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: my favorite apttern is the null pattern... but I never really get to use it ;) http://en.wikipedia.org/wiki/Null_Object_pattern</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: then I read up on it to see if it could be applied</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: my favorite pattern has to be DTO</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: the one case where dubming down the code is a  good thing</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: dumbing down, that is</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: patterns are a bit general and sometimes two or three different patterns could be utilized... and of course opnions will differ...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: So do not get discouraged when a reviewer ina compeition tells you that you are not using the correct pattern... this way you will learn more...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: the good thing about reviews is that often they give you a lot of good feedback</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: it take s abit of time to learn their (i.e. the patterns) specific characterstics...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: The main ones to study would be strategy design patter, DAO, DTO, Facade, Factory (there are two of those), and Method Template pattern</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: it is also a good ide to llok at the MVC (Model View Controller) pattern as well...</span></td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: for the GUI ones?</td></tr>
<tr class="dark"><td class="value"><strong>carlogiordano</strong></td><td class="value">to argolite and AleaActaEst: what is your favorite competition Architecture or Component Design ?</td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: yes MVC is sually ised for view (i.e. GIU) interactions...</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">carlogiordano: for me it is design...</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: In what way?</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">carlogiordano: sually ised ==&gt; usually used</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: I like both alot</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: they are similar</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: another cool pattern is the Proxy pattern and the Decorator pattern</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: but in architecture, less documenting</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: and more high level</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">carlogiordano: but more decisions too</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: actually... I love patterns... they are like a bit of good design DNA... apply them and see you designs grow to be strond and fit :)</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">before we end here in a few minutes I want to thank argolite and AleaActaEst for chatting today</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: strond ==&gt; strong</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">and I want to thank you all for joining us as well.  i hope you all start adding design competitions to your list!</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">thanx and good luck to all</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AdamSelene</span></td><td class="value"><span class="bigRed">thanks all</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">Nike got it right: JUST DO IT :) and you will see results</span></td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">thx guys! See you during the competitions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">jmpld40</span></td><td class="value"><span class="bigRed">:)</span></td></tr>
<tr class="dark"><td class="value"><strong>Mafy</strong></td><td class="value">goog luck to all!</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: AleaActaEst thanx for you valuable suggestions I am going to archive this .... Thanx TC also for arranging such a wonderful session.</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: and when you compete, do not hesitate to ask even the most basic questions</span></td></tr>
<tr class="light"><td class="value"><span class="bigRed">argolite</span></td><td class="value"><span class="bigRed">shankhs: the worst question is the one that is not asked</span></td></tr>
<tr class="dark"><td class="value"><strong>shankhs</strong></td><td class="value">argolite: I will</td></tr>
<tr class="light"><td class="value"><strong>shankhs</strong></td><td class="value">AleaActaEst: thankyou</td></tr>
<tr class="dark"><td class="value"><span class="bigRed">AleaActaEst</span></td><td class="value"><span class="bigRed">shankhs: You are welcome.</span></td></tr>
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
