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
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <tc-webtag:forumLink forumID="517014" message="Discuss this article" />
</div>

<span class="bigTitle">Going pro: Turning TopCoder into my full-time job</span>
<br /><br />

<div class="authorPhoto">
    <img src="/i/m/Ghostar_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="151743" context="design"/><br />
      <em>TopCoder Member</em>
</div>
<br clear="all">

<p><em><tc-webtag:handle coderId="151743" context="design"/> has had an exemplary TopCoder career: He's in second place in the current stage of the <a href="http://www.topcoder.com/tc?&ph=112&module=LeaderBoard">Digital Run</a>, and he's finished in the Top 5 in <a href="http://www.topcoder.com/tc?module=SimpleStats&c=coder_achievements&d1=statistics&d2=coderAchievements&cr=151743">two previous stages</a>. On top of that, he found time to manage the development of TopCoder's new <a href="http://www.topcoder.com/tc?module=Static&d1=dev&d2=umltool&d3=description">UML Tool</a>. In this conversation, he outlines how he &quot;went pro&quot; with TopCoder, combining Software Design competitions, review board work, and projects into a full-time job. </em></p>
<p><strong>Q: What made you decide to work on TopCoder stuff full-time?</strong></p>
<p>A: I went full-time with TopCoder in December of 2005. I was previously working as a software engineer for <a href="http://www.renlearn.com/">Renaissance Learning Inc.</a> in Wisconsin Rapids, WI. At that time, I had been involved in TopCoder for almost a year, doing basically designs and design review. In that year of doing part-time TopCoder work, I made a similar amount of money in a much reduced amount of hours compared to my full-time position. A big part of my decision was the ability to make potentially more money, but I also like not having to drive to work and being able to set my own schedule. Driving to work in Wisconsin (more than 5 miles or so) can be a bit harrowing in the winter, so I like not having that stress to deal with. In the 18 months I worked as an engineer, I had to help people in both a nasty head-on collision and a rollover accident, and hit a deer on the drives to and from work.</p>
<p>I actually work less than 40 hours a week on an average week mainly because I am not constrained to a cubicle for 8 hours a day. That being said, I am actually more productive than I used to be, because every hour worked is actually work-related. In a cubicle setting, you may be at work for 8 hours a day, but there is rarely a day when all 8 hours of that is actually productive.</p><br />
<div align="center"><img style="border: 1px solid #000000;" src="/i/education/ghostar-office.jpg"></div>
<p>At the beginning of going full-time with TopCoder, it was definitely a little &ldquo;tight&rdquo; --  for the first 5 months or so, my wife and I had to adjust to not having a set income -- but the last year has been great, with better design choices and of course the addition of the <a href="/dr">Digital Run</a>. I actually interviewed with a different company in my area to go back to full-time work last year. I eventually decided to turn them down, and later that the same week the Digital Run was announced, so that worked out pretty well.</p>
<p>The flexibility of the schedule has just been a great thing. I like being able to go golfing during the day in the summer, and the flexible schedule allows me to help out in different community capacities by volunteering. It is also great to be able to go on vacation and not really have to ask for time off. When we go on vacation I normally do about 15-30 minutes worth of work a day, mainly answering questions and email, but I don&rsquo;t do any new designs or reviews, usually. </p>
<p>All in all, I absolutely love the way that this has panned out. I get to work on cool, new technology on a schedule that works for me, making more money than I ever could doing the same thing in my area.</p>
<p><strong>Q: How do you explain it to people?</strong></p>
<p>A: I actually don&rsquo;t try to explain it to most people. I just say I am a software designer for a firm in Connecticut and usually leave it at that. Normally people just hear that and lose all interest. :) A few of my old co-workers have been exposed to TopCoder somewhat through my trying to bring them in to assembly competitions, and I was lucky enough to bring my wife, her mom, and her aunt along to the <a href="/tc?module=Static&d1=tournaments&d2=tco07&d3=about">TCO</a> in Las Vegas, so they know a little better how things work and what the company actually does.</p>
<p><strong>Q: How do you figure out where to invest your time? </strong></p>
<p>A: I don&rsquo;t really analyze this too much. I usually just sign up for designs that interest me and that I understand, based on the Requirements Specification. I like to do .NET designs, as I have a much better success rate with those designs, and I understand the .NET framework a lot better than Java. I have never really programmed in Java, besides college classes, so those designs take a lot more time for me to do. </p>
<p>I tend to shy away from complicated designs for a number of reasons. Normally these designs take 2-3 times as much time to complete, but only pay 1.5 - 2 times as much, so the time / payout ratio doesn&rsquo;t usually work out in my favor. Secondly, I am not good at the intricacies of complicated designs, normally. I am not usually able to visualize a complex design, and I am not very good at language parsing, complex database interactions, or designs that require heavy computation, especially if optimizations are involved. I usually stick to things that are pretty straightforward, and I especially like getting in on the &ldquo;ground floor&rdquo; of designs that build upon each other. For instance, the WCF and WF Activity components have been a great set of components for me [note: you can see the list of these and other components in <tc-webtag:handle coderId="151743" context="design"/>'s <a href="/tc?module=CompetitionHistory&ph=112&cr=151743">competition history</a>]. They all build on each other, allowing me to improve upon the designs with each iteration, with usually less time put into the designs with each iteration as well.</p>
<p><strong>Q: Is it tough to know how much work you really need to do?</strong></p>
<p>A: I don&rsquo;t have a certain quota or anything usually to tell me when I&rsquo;m &ldquo;done.&rdquo; Some weeks there are a bunch of designs that I know I can do, so I will try to do 3 or 4 of them, and other weeks there are only 1 or 2 designs that interest me, so I do less, possibly filling in with a review. Normally this all evens out over a month to a payment that is more than fine. The <a href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=desPrizes">Digital Run bonuses</a> help to even out the months that I don&rsquo;t do as much.</p>
<p><strong>Q: How do you avoid distraction while working at home?</strong></p>
<p>A: I don&rsquo;t really avoid them at all. I work in &ldquo;spurts,&rdquo; allowing the distractions to happen. For instance, on a given day I will usually only work 1.5 - 2 hours at a time, doing stuff in between 2 hour blocks around the house or randomly surfing the Internet. This works for me, as I am very focused for my &ldquo;work&rdquo; time and I let my mind wander in between. This wouldn&rsquo;t work in a &ldquo;regular&rdquo; cubicle environment.</p>
<p>Here are pictures of my two biggest distractions, one of who can be seen sitting in my official TopCoder backpack. Normally I can just lock them out of my office and they don&rsquo;t bother me too much, unless it is dinner time.</p>
<div align=center><img style="border: 1px solid #000000;" src="/i/education/ghostar-distraction1.jpg"></div><br />
<div align=center><img style="border: 1px solid #000000;" src="/i/education/ghostar-distraction2.jpg"></div>
<p><strong>Q: Apart from wrangling cats, do you have any other routines that help you stay focused?</strong></p>
<p>A: I usually just crank up iTunes and go to town. I don&rsquo;t really have any habits or routines that get me focused.</p>
<p><strong>Q: How do you deal with  fluctuations in your income, especially in </strong><strong>times when you're not winning? </strong></p>
<p>A: I am still figuring this out, but it is getting a little easier. My wife and I have a fairly set budget we work off of, and we usually have a &ldquo;buffer&rdquo; set aside for those times when I don&rsquo;t get paid a lot. I was getting paid bi-weekly for about a year, thanks to my work on the <a href="/tc?module=Static&d1=dev&d2=umltool&d3=description">UML Tool</a>, which made things easier, but I am now transitioning over to the monthly payment schedule. This current time is a little tight since I am right at the end of that transition, so I am looking forward to the August 15th payment. Normally when I get a larger payment, we pay monthly expenses more than a month in advance, which allows us a month or two of not having to worry about mortgage, utilities, etc. The &ldquo;buffer&rdquo; is also extended for unexpected expenses, like medical bills or miscellaneous car repairs.</p>
<p><strong>Q: How do you deal with the practical issues, like insurance, taxes, and savings? </strong></p>
<p>A: I haven&rsquo;t brought myself to watch &ldquo;<a href="http://www.imdb.com/title/tt0386032/">Sicko</a>&rdquo; yet, but I am sure I am in the target audience. Health insurance is just a tough thing to deal with, especially since I was fairly well taken care of in my last &ldquo;real&rdquo; job. We basically just have a large deductible on our health insurance, taking care of things like medications out of pocket. We try to keep a majority of the deductible in the &ldquo;buffer&rdquo; in case something happens. When you pay your own health insurance, it is definitely a large incentive to be in shape as you can get a &ldquo;preferred&rdquo; rate.</p>
<p>Life insurance is pretty standard. Both my wife and I have policies that pay quite a bit more than what I had through my last employer. Compared to the expense of health insurance, life insurance isn&rsquo;t that big a deal. </p>
<p>The one thing that we have been looking into is long term disability insurance, in case I get hurt and can&rsquo;t work for an extended period of time. We didn&rsquo;t get this right away when I quit because they calculate your potential benefits based on past salaries, which would have included my time working for my previous employer. Because of this, and the fact that I make quite a bit more now, the potential benefits weren&rsquo;t worth the expense at the time. We will be revisiting this soon to see if the potential benefits are greater now.</p>
<p>Taxes are a constant struggle. I have actually received a lot of advice from my dad, who owns a software company and has experience with the self-employment tax, among other things. The big thing I try to do is make sure my quarterly payments are enough to not receive a penalty and keep enough saved to make sure I can pay in full in April. I also make sure to save all receipts for all utilities and my computer equipment, as I can deduct a portion of my utilities, since my office is in my house, and my equipment is mostly deductible.</p>
<p>Savings are another thing we are still tweaking. My wife and I both have ROTH IRA&rsquo;s that we contribute our maximum amount to each year. We will probably be looking into a 401(k) or similar account at some time in the near future.</p>
<p><strong>Q: What are the pros and cons of doing TopCoder work full-time? </strong></p>
<p>The plusses are a much larger salary than I could ever expect in my area, a flexible schedule, lots of free time, the ability to only do the work I want to do, and the chance to work on new technology. I honestly think I am extremely lucky to be able to do this, I can&rsquo;t think of a better job to have. With the Digital Run, I have absolutely no desire or incentive to even look for new opportunities, since there is no way they could be anywhere near as good as doing TopCoder work.</p>
<p>The cons are minor compared to the pros. I don&rsquo;t like not having anyone to talk to in my office. The highlight of my last job was basically just talking to people and having fun with co-workers. The complexities of taxes and insurance aren&rsquo;t fun, but once you get them figured out, they really aren&rsquo;t a  big deal.</p>
<p>&nbsp; </p>
<p><em>What's your TopCoder story? We're looking for new educational tutorials and feature articles -- if you've got ideas, email them to <a href="mailto:editorial@topcoder.com">editorial@topcoder.com</a>.</em> </p>
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
