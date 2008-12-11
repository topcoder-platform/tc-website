<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506190" message="Discuss this article" />
</div>

<span class="bigTitle">Digital Run Stage 2: Going for the win</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/argolite_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<a href="/tc?module=MemberProfile&cr=287614" class="coderTextYellow">argolite</a><br>
      <em>TopCoder Member</em>
</div>

<br clear="all">

<br>
<em>After a respectable 14th-place finish in Stage 1, <tc-webtag:handle coderId="287614" context="design"/> emerged as the early leader in Stage 2 of the Digital Run's Design Cup -- and only opened up the lead from there. In Stage 1, <tc-webtag:handle coderId="11797255" context="design"/> set the bar for victory high with 7,060 points; <tc-webtag:handle coderId="287614" context="design"/> blew past this mark in Stage 2, earning a total of 10,570 points. Over the course of just ten weeks of the stage, <tc-webtag:handle coderId="287614" context="design"/> competed on 35 components, winning 28 and taking second place on 7. Here, he tells us how he did it.</em>
<br>
<br>
<strong>How much work does it take to win?</strong> It's been my full-time job, definitely. Actually, more than that &ndash; it's been full-time, over-time, and, some weeks, sleep-time. I believe <tc-webtag:handle coderId="11797255" context="design"/> estimated 20 hours on average for a medium-to-hard component last stage, and I'd say that's pretty much true for me. Not all of them take quite so long, of course &ndash; there was one component, in week 5, that I was able to get done in 2 hours. That was a big lucky break, because that was a week when I needed to get 3 components done in 24 hours, and it ended up being 24 hours straight of work. Weeks like that show you why a lot of component competitors think of Thursdays [after components are due] as their chance to sleep in.
<br><br>
<strong>I never really planned to break 10,000 points.</strong> My primary goal was to win, and I didn't really care how many points it took. Ten thousand is a nice round number, and it's cool that it was the challenge <tc-webtag:handle coderId="252022" context="design"/> put out there in his Stage 1 article, but it wasn't something I intended to do.
<br><br>
The thing that did it was week 10 of the stage, I believe, when all the UML components came out. There was a lot of speculation that, because all those components were related, someone could build a template or code generator, tackle all the components, and rack up a huge number of points. I was in first place at that point, with around 7,000 points at the start of the week, but I was worried about protecting my lead, so I jumped into all the UML components. I ended up doing 12 designs that week &ndash; I won 8, and got 4 seconds, and racked up around 3,000 DR points. That was the week where I locked up the win.
<br><br>
It was a crazy week. Usually, components are so disparate &ndash; different types of requirements, different technologies &ndash; it's unusual to be able to do so many similar components at once. It was a tremendous opportunity for someone to really rack up points, so I'm glad it happened to be me.
<br><br>
<strong>When did I decide to go for the win? </strong>I wasn't working on components much for the first stage of the DR. I had been on vacation for a while and, when I came back, there were just a few weeks left in the first stage. Pretty quickly, though, I saw that there was still enough time to get involved &ndash; with just a few weeks left, I was able to do well enough to make it into the top-third. It was a great incentive to do a little more than I would have done otherwise, and it gave me momentum going into Stage 2.
<br>
<br>
I didn't really think about going for the win until the third week or so, and it was a week or two later before I felt like it was actually within my reach. At that point, I really wanted to take the lead, and make it clear that I planned to keep it &ndash; I think it was around then, week 4 or 5, that I submitted 4 components and started to open up a lead. Neither of my two closest competitors really made a big push at that point &ndash; <tc-webtag:handle coderId="252022" context="design"/> ran into some reliability issues, and <tc-webtag:handle coderId="151743" context="design"/> seemed to be busy with other stuff &ndash; so I was able to get out ahead.
<br>
<br>
<strong>Reliability is critical.</strong> During week 10 &ndash; that crazy week with all the UML documents &ndash; there were a fair number of competitors asking that the reliability rule be suspended. If my reliability rating wasn't high enough, I could have been forced to sit on the sidelines and watch someone else do 12 designs that week, and watch them take the lead away from me. In order to be flexible and stay competitive, you really need to focus on reliability. Plus, the reliability bonuses you can earn on top of component payments are nice.
<br><br>
<strong>I'd recommend reviewing, too.</strong> It helps me see things from the other side. I know what I should be looking for, and I can really put myself in the shoes of the reviewer based on my own experiences. Even through the DR, I have continued to do reviews. It's a slightly more dependable source of income &ndash; it's a straightforward work-for-pay deal, so I don't have to wonder if I'll come in first or second &ndash; and it's a great way to learn. Dealing with <tc-webtag:handle coderId="119676" context="design"/> as a reviewer, for example, has been a tremendous learning experience. You get access to the people you can learn from, and you get paid for it.
<br><br>
<strong>My approach to components during the Digital Run</strong> is to do a competent job, and make sure I cover all the requirements, but I generally didn't go too far above and beyond or make a lot of enhancements. Figuring out the right amount of information to include in a design is a balancing act. You want to include the most clear, relevant information that you can in as little space as possible, while avoiding digressions and tangents that could confuse developers or cost you points with reviewers. If there's something that could help the developer but that might distract a reviewer, leave it out &ndash; you can always add more information during final fixes.
<br><br>
<strong>When it comes to choosing components</strong>, generally speaking, I like to spread things around. It feels like there are enough components, especially these days, that everybody can take a shot and do pretty well each week. Plus, I think that too much competition can be counterproductive. I was a reviewer, back during Stage 1, during the week when <tc-webtag:handle coderId="11797255" context="design"/> and <tc-webtag:handle coderId="119676" context="design"/> went head-to-head on four components. It's kind of sad to see people doing really excellent work and racking up a score like 98.5 and see them come in second. They deserve a first-place for that.
<br>
<br>
<strong>I also tend to go more for the components I know</strong>. Continually going after new technology isn't the best approach to the Digital Run, in my opinion &ndash; the extra time you spend in research can be rewarding, but it adds up. But there are exceptions, like the Client Extension for Firefox component. It was new technology and scared a lot of people off, so TopCoder had to keep reposting it and increasing the price, until eventually <tc-webtag:handle coderId="151743" context="design"/> jumped on it, got 500 DR points, and a pretty large payment. So most of us don't want to go too far outside our comfort zone, but sometimes the component that everybody else is avoiding can be a great opportunity for both DR points and money.
<br><br>
<strong>It's just been a tremendous experience</strong>, in terms of the work and the reward. I've been doing components for a while now &ndash; my first one in late 2002 &ndash; but it's always been something to do in between contracts, or while I've been doing other things. This is the first time I've thrown myself fully into it, and I've never had an experience like it.
<br><br>
Imagine a contract where you could just work like a dog one week and earn three, four, or five thousand dollars &ndash; then, if you want, take the next week or two off? Especially with the big number of components coming out these days, I get the opportunity to try out new technologies, learn on the job, and get paid for it. In all the different contract and work assignments I've had, I've never had a situation like this where I can pick the work I want to do, get paid very well for it, and take a break any time I like it. 
<br><br>
Nothing compares to the working relationship we have with the PMs and admins, either &ndash; generally, when you're off on a contract, the PM or whomever you're reporting too is pushing you, and there's someone looking over their shoulder pushing them to get things done faster and cheaper, and so on. TopCoder just doesn't feel like that.
<br>
<br>
<strong>And it pays well</strong>. I'd say that, between component payments, reliability bonuses, and DR prizes, I'll end up making a little bit more than $60,000 for Stage 2 &ndash; or, to put it another way, I'll get paid that much for 10 weeks of very hard work and 3 weeks of vacation.
<br><br>
<strong>What will it take to win Stage 3? </strong>My advice is that you really have to be honest with yourself. What are you actually hoping to accomplish with the Digital Run? Based at least on the design side, and on the first two stages, having a shot at winning really takes a full-time approach. You have to commit yourself fully to it &ndash; if you've got another project, or contract, or full-time job, I just can't see it happening. If you can't commit to a more than full-time commitment, for at least 10 or 11 weeks, you can forget it. 
<br>
<br>
But, that said, winning isn't the only option. Second through fifth place are still very competitive, and it's possible to devote just a few serious weeks to the DR and crack the top 5. Look at <tc-webtag:handle coderId="15891862" context="design"/> in Stage 1, or <tc-webtag:handle coderId="310233" context="design"/> in Stage 2 &ndash; they just came out of nowhere, and rocketed up the leaderboard with just a couple heavy weeks. Or look at <tc-webtag:handle coderId="251184" context="design"/>, who doesn't do a component every week, necessarily, but he submits when he registers, his reliability is good, he's earning good bonus money, and he's in the lead for rookie of the year.
<br><br>
The DR can be very much worth your while, I'd say, if you could commit 5 pretty serious weeks to it &ndash; not necessarily quitting your  job, but just making a concerted effort. With some wise choices on component registration, you can lock up some of that top third (or top half) bonus money, and even have a shot at the top 5. 
<br><br>
And again -- if you can, get yourself to 100% reliability. That reliability bonus, on top of the component payment and the DR bonus, can really add up. And keep your Wednesday nights, and early Thursday mornings free, just in case. That extra 10 or 12 hours could come in very handy. Good luck!
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
