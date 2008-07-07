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
.GAtableText, .GAtableText2, .GAtableText3, .GAtableText4, .GAtableText5
{
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
}
.GAtableText{   background-color: #EEEEEE; }
.GAtableText2{   background-color: #FF6600; }
.GAtableText3{   background-color: #FFCC00; }
.GAtableText4{   background-color: #FFFF00; }
.GAtableText5{   background-color: #FFFF99; }

</style>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
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

<div style="float: right;"><tc-webtag:forumLink forumID="506095" message="Discuss this article" /></div>
<span class="bigTitle">The Digital Run: Highlights from Stage 1</span>

      <p>
      <img src="/i/m/AleaActaEst_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/>
      By&#160;<tc-webtag:handle coderId="252022" /><br>
      <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
      </p>
<span class="bodySubtitle">Check out the Stage 1 Leaderboards: <br>
<A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=1&nr=50&sr=1">Design Cup Series</A> &#160; <A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=1">Development Cup Series</A></span>
<br><br>
As the first stage draws to an end for The Digital Run, I am going to take stock of this great new competition format. And a great competition it was, with veterans and newbies alike withstanding the challenges of a 13-week marathon and racking up some surprising results. In this article I will recap some of the highlights of the stage (mostly from the design side) and give my perspective on Digital Run strategy. 
<br><br>
On the design side, Stage 1 saw some of TopCoder's top designers pitted against each other.  The result: A new top-ranked designer, as <tc-webtag:handle coderId="11797255" context="design" />'s three wins over <tc-webtag:handle coderId="119676" context="design" /> in three head-to-head competitions helped him reach #1. <tc-webtag:handle coderId="11797255" context="design" /> threw himself into The Digital Run, submitting a record 24 design submissions over the 13 weeks. Rounding out the top three submitters were <tc-webtag:handle coderId="252022" context="design" />, with 17, and <tc-webtag:handle coderId="119676" context="design" /> with 15 (though I should note that <tc-webtag:handle coderId="119676" context="design" /> finished his submissions in about 1/3 of the time that it took me to do mine! It's all about the power of reliability - more about this later).
<br><br>
On the development side, there were great performance from coders such as <tc-webtag:handle coderId="15073791" context="development" /> and <tc-webtag:handle coderId="15832162" context="development" />, with 13 submissions each, and <tc-webtag:handle coderId="10353806" context="development" />, with 9 submissions We have also seen some new designers and developers achieve some great feats against some of the veterans. 
<br><br>
<span class="bodySubtitle">So, is it a marathon or a sprint?</span><br />
One of the common questions about The Digital Run has been what it would take to do well. Does it have to be a full-time, 13-week commitment? Or could occasional bursts of hard work and brilliance suffice? After the first stage, it's clear that the answer is "yes" - it can be both.
<br><br>
The Digital Run requires both long term planning and persistent focused execution, but also rewards sprinters, as competitors can accomplish significant gains in a short period of time.
<br><br>
Looking at the strategies designers have used, we can see these two extremes -- the steady week-in, week-out performance of designers like <tc-webtag:handle coderId="11797255" context="design" /> and <tc-webtag:handle coderId="252022" context="design" /> on one side, the occasional bursts of multiple submissions from <tc-webtag:handle coderId="119676" context="design" /> and <tc-webtag:handle coderId="15891862" context="design" /> on the other.
<br><br>
This is a mixed bag of strategies. But the bottom line is that even the occasional competitor who chooses his or her spots can do very well and make some great money. Look at the table at the end of this article to see how <tc-webtag:handle coderId="152342" context="design" /> earned $992.11 with just three weeks of submitting. 
<br><br>
<span class="bodySubtitle">Planning is everything</span><br />
Planning when and how to compete is critical, particularly because of the way The Digital Run format awards points. Points are shared among the competitors submitting the same component, with a 500-point pool divided among them. This means that if two competitors go after the same component -- and both pass the review -- then first place gets 325 point and second gets 175. The more competitors that go for the same component, the more that 500-point pie gets divided. This means that you could come up with 10 great designs and potentially only score 300 points for all that work. 
<br><br>
<span class="bodySubtitle">Maximizing your gain:</span><br />
So, how do you maximize your point booty? One strategy is to wait and watch who is interested in what designs. This can be done by 
<ul>
<li>Watching the forums, since if a designer is asking questions they are probably indicating which component they will pursue.</li>
<li>Waiting to see who registers for what. In some cases, designers will wait until the last minute of registration and try to pick components that have not been chosen, which guarantees them 500 points all to themselves if they pass review.</li>
</ul>
Some other strategies of trying to garner more points:
<ul>
<li>Going after a component that looks hard (i.e., many dependencies or many requirements).</li>
<li>Going after components that look like they are based on new technology.</li>
</ul>

One very important aspect of what is happening right now in TopCoder is the visible increase in component design (and, by default, component development) projects. This means that, most of the time, there are enough projects available so that everyone should have the opportunity to get quality points.
<br><br>
And remember: Watch the leader board all the time to see what the competitors are doing. Remember that great intelligence gives one intelligent alternatives.
<br><br>
<span class="bodySubtitle">Countering (or holding on to your spoils):</span><br />
Sometimes you work hard on a component and submit a great design but find yourself getting only 75 of the 500 points because of so many submissions. Meanwhile, some other guy goes solo on an unpopular component and earns 500. With that stroke of bad luck, you have slipped down a spot or two in the standings.
<br><br>
In addition to picking your competitions carefully, you may also need to play defensively. In the scenario above, if you paid attention sooner and countered the other guy's move, you could have defended your spot on the leader board. Assuming you came in second and only the two of you competed, the other guy would only get 150 points more than you (his 325 for first place versus your 175 for second place), which is much better than the 500 points he could have gained with an uncontested submission.
<br><br>
Countering like this not only slows your opponent down, but also shows that you mean business. This was the case during Stage 1 when <tc-webtag:handle coderId="119676" context="design" /> made a leap and grabbed four component designs. <tc-webtag:handle coderId="11797255" context="design" /> countered him in this exact manner (on three submissions) to ensure that he could control <tc-webtag:handle coderId="119676" context="design" />' point gains. (Incidentally, getting four components done at all, especially with high quality, is quite an accomplishment in its own right. Congratulations to <tc-webtag:handle coderId="119676" context="design" />, <tc-webtag:handle coderId="11797255" context="design" />, and <tc-webtag:handle coderId="15891862" context="design" />, who all went for the big four!). 
<br><br>
<span class="bodySubtitle">Reliability, reliability&#8230;</span><br />
Ahh, many a coder has wondered about this little aspect of design/development. In case you haven't heard it before, let me be the first to tell you: Reliability is very important for The Digital Run!
<br><br>
Why? If your reliability is greater than 70%, you can potentially register for as many components as you wish and thus earn a LOT of points. This is a great option to have, allowing you to jump in and grab some easy designs as they arise. Consider what <tc-webtag:handle coderId="15891862" context="design" /> did in the last week of Stage 1 on the design side, when he went for four components, most with little competition. This is an awesome way to get some great point boosters and he could not have done that if his reliability rating was below 70%.
<br><br>
Bottom line? High reliability is a very important overall asset to have, especially for Digital Run strategizing. Plus, reliability of 80% and above translates into a bonus of 10%-20% on your prizes for winning components (though not on Digital Run prize money). Consider this: The winner of a $1,000 component would actually get $1,200 if their reliability is 100%! 
<br><br>
<span class="bodySubtitle">I am new, I can't do this.</span><br />
"Ahh, but there are too many reds and yellows," you might say. "I am new, no point in doing this." You could not be more wrong. Just look at the performances of some first-time designers such as <tc-webtag:handle coderId="2058798" context="design" />, <tc-webtag:handle coderId="16164275" context="development" />, or <tc-webtag:handle coderId="7548200" context="development" /> (granted, maybe a special case, since he won the TCO in development).  Everyone was new to design or development at some point -- the important thing is to start. That's the only way you will ever get better! Not to mention the Rookie of the Year prizes that are up for grabs.
<br><br>
<span class="bodySubtitle">And now for some stats, ladies and gentlemen:</span><br />
Sometimes numbers tell the story better than words, so let's look at the stats:

<ul>
<li>How many components?<br>
In total, Stage 1 of The Digital Run produced 91 winning designs and 84 winning developments. This is a major spike in both design and development production.</li>
<li>Who had the best ratio of components to points?<br>
<tc-webtag:handle coderId="152342" context="design" />, with an average of 442 points per submission, led the designers. Among the developers, several tied for best ratio with 500 each. See the tables below for more details.</li>
<li>Who had the best ratio of components to money made in The Digital Run?<br>
<tc-webtag:handle coderId="11797255" context="design" /> earned a whopping average of $1,308 in Digital Run winnings for each of his submissions, leading the designers. <tc-webtag:handle coderId="15832162" context="development" /> had the best ratio among developers, earning an impressive average of $1,079 per submission. See the tables below for more details.</li>
</ul>

<span class="bodySubtitle">Last but not least: The money</span><br />
We can think of The Digital Run money as being a bonus per component submitted. In such a case <tc-webtag:handle coderId="119676" />, for example, has made $885 extra for each component submitted. Given that the top 1/3 of all submitters will get paid extra this is an amazing way to make money on top of what you could make with a component win! For designers, this translated to $137 as the minimum payout for a top third designer (<tc-webtag:handle coderId="251184" context="design" /> in the table) for each component submitted. So you can make money when you actually do not even win a component!
<br><br>
<span class="bodySubtitle">Challenges for Stage 2</span><br />
I think that <tc-webtag:handle coderId="15832162" context="development" />'s quote is very appropriate here: <i>"Do or do not. There is no try."</i>
<br><br>
There are a couple challenges that I would like to put forth to "the doers:"
<br><br>
<b>Design:</b>
<ol>
<li>Break <tc-webtag:handle coderId="11797255" context="design" />'s record 24 submissions</li>
<li>Break <tc-webtag:handle coderId="11797255" context="design" />'s record of 20 wins</li>
<li>Break through the 10,000 point barrier</li>
</ol>

<b>Development</b>
<ol>
<li>Break <tc-webtag:handle coderId="15073791" context="development" />'s record 13 submissions</li>
<li>Break <tc-webtag:handle coderId="15073791" context="development" />'s record of 9 wins</li>
<li>Break through the 5,000 point barrier</li>
</ol>

<span class="bodySubtitle">Final thoughts:</span><br />
Stage 1 of The Digital Run was everything I had hoped for: a great challenge, a great opportunity to make some money, great drama when trying to see who is doing what (in fact, as I write this I am not sure if I will lose my second slot to <tc-webtag:handle coderId="119676" context="design" />!), and a great experience in all (apart from a couple sleepless nights, but hey - who needs sleep?). 
<br><br>
I want to thank TopCoder for creating such an awesome contest, and I hope to see you all competing in Stage 2.
<br><br>

<table class="stat" width="500" cellpadding="0" cellspacing="0" align="center">
   <tr>
      <td class="title" colspan="6">Design Cup Series Statistics</td>
   </tr>
   <tr>
      <td class="header" width="100">Competitor</td>
      <td class="headerC" width="80">Points</td>
      <td class="headerC" width="45">Submissions</td>
      <td class="headerR" width="85">Total <br>Prizes</td>
      <td class="headerR" width="95"><A href="/dr"><img src="/i/interface/emblem/digitalrun.png"></A><br> Prize <br>/ Submission</td>
      <td class="headerR" width="95"><A href="/dr"><img src="/i/interface/emblem/digitalrun.png"></A><br> Points <br>/ Submission</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="11797255" context="design" /></td>
      <td class="valueC">6790</td>
      <td class="valueC">23*</td>
      <td class="valueR">$30,084</td>
      <td class="valueR">$1,308</td>
      <td class="valueR">295</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="119676" context="design" /></td>
      <td class="valueC">4375</td>
      <td class="valueC">13*</td>
      <td class="valueR">$13,275</td>
      <td class="valueR">$1,021</td>
      <td class="valueR">337</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="252022" context="design" /></td>
      <td class="valueC">4255</td>
      <td class="valueC">15*</td>
      <td class="valueR">$10,185</td>
      <td class="valueR">$679</td>
      <td class="valueR">284</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="151743" context="design" /></td>
      <td class="valueC">3580</td>
      <td class="valueC">13*</td>
      <td class="valueR">$5,680</td>
      <td class="valueR">$437</td>
      <td class="valueR">275</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="9981727" context="design" /></td>
      <td class="valueC">2680</td>
      <td class="valueC">12*</td>
      <td class="valueR">$4,006</td>
      <td class="valueR">$334</td>
      <td class="valueR">223</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="11781622" context="design" /></td>
      <td class="valueC">1905</td>
      <td class="valueC">6</td>
      <td class="valueR">$1,426</td>
      <td class="valueR">$238</td>
      <td class="valueR">318</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="293874" context="design" /></td>
      <td class="valueC">1770</td>
      <td class="valueC">6*</td>
      <td class="valueR">$1,325</td>
      <td class="valueR">$221</td>
      <td class="valueR">295</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="15891862" context="design" /></td>
      <td class="valueC">1755</td>
      <td class="valueC">7*</td>
      <td class="valueR">$1,314</td>
      <td class="valueR">$188</td>
      <td class="valueR">251</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="15608845" context="design" /></td>
      <td class="valueC">1645</td>
      <td class="valueC">9</td>
      <td class="valueR">$1,231</td>
      <td class="valueR">$137</td>
      <td class="valueR">183</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="14840263" context="design" /></td>
      <td class="valueC">1500</td>
      <td class="valueC">5</td>
      <td class="valueR">$1,123</td>
      <td class="valueR">$225</td>
      <td class="valueR">300</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="275071" context="design" /></td>
      <td class="valueC">1415</td>
      <td class="valueC">10*</td>
      <td class="valueR">$1,059</td>
      <td class="valueR">$106</td>
      <td class="valueR">142</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="152342" context="design" /></td>
      <td class="valueC">1325</td>
      <td class="valueC">3</td>
      <td class="valueR">$992</td>
      <td class="valueR">$331</td>
      <td class="valueR">442</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="7463987" context="design" /></td>
      <td class="valueC">1230</td>
      <td class="valueC">5</td>
      <td class="valueR">$920</td>
      <td class="valueR">$184</td>
      <td class="valueR">246</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="302053" context="design" /></td>
      <td class="valueC">1130</td>
      <td class="valueC">6</td>
      <td class="valueR">$846</td>
      <td class="valueR">$141</td>
      <td class="valueR">188</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="251184" context="design" /></td>
      <td class="valueC">1095</td>
      <td class="valueC">7*</td>
      <td class="valueR">$819</td>
      <td class="valueR">$117</td>
      <td class="valueR">156</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="10098406" context="design" /></td>
      <td class="valueC">945</td>
      <td class="valueC">3*</td>
      <td class="valueR">$707</td>
      <td class="valueR">$236</td>
      <td class="valueR">315</td>
   </tr>
</table>
<br>
*This is still not finalized as the designer has outstanding designs
<br><br>
<span class="smallText">
(1) Note that all ratios are rounded up<br>
(2) We can think of The Digital Run money as being a bonus per component submitted. In such a case <tc-webtag:handle coderId="119676" />, for example, made $1,021 extra for each component submitted.<br>
(3) These numbers are still tentative for some members and might result in changes to this table (including changes to position or actual placement in the top 1/3, which this table represents).
</span>
<br><br>

<table class="stat" width="500" cellpadding="0" cellspacing="0" align="center">
   <tr>
      <td class="title" colspan="6">Development Cup Series Statistics</td>
   </tr>
   <tr class="sidebarTitle" nowrap="nowrap">
      <td class="header" width="100">Competitor</td>
      <td class="headerC" width="80">Points</td>
      <td class="headerC" width="45">Submissions</td>
      <td class="headerR" width="85">Total <br>Prizes</td>
      <td class="headerR" width="95"><A href="/dr"><img src="/i/interface/emblem/digitalrun.png"></A><br> Prize <br>/ Submission</td>
      <td class="headerR" width="95"><A href="/dr"><img src="/i/interface/emblem/digitalrun.png"></A><br> Points <br>/ Submission</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="15832162" context="development" /></td>
      <td class="valueC">3645</td>
      <td class="valueC">13</td>
      <td class="valueR">$14,023</td>
      <td class="valueR">$1,079</td>
      <td class="valueR">280</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="15073791" context="development" /></td>
      <td class="valueC">3990</td>
      <td class="valueC">12*</td>
      <td class="valueR">$6,458</td>
      <td class="valueR">$538</td>
      <td class="valueR">333</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="10353806" context="development" /></td>
      <td class="valueC">2720</td>
      <td class="valueC">9</td>
      <td class="valueR">$4,636</td>
      <td class="valueR">$515</td>
      <td class="valueR">302</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="260952" context="development" /></td>
      <td class="valueC">1650</td>
      <td class="valueC">6</td>
      <td class="valueR">$2,189</td>
      <td class="valueR">$365</td>
      <td class="valueR">275</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="21237755" context="development" /></td>
      <td class="valueC">1595</td>
      <td class="valueC">7</td>
      <td class="valueR">$1,666</td>
      <td class="valueR">$238</td>
      <td class="valueR">228</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="14926554" context="development" /></td>
      <td class="valueC">1530</td>
      <td class="valueC">5</td>
      <td class="valueR">$639</td>
      <td class="valueR">$128</td>
      <td class="valueR">306</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="21471587" context="development" /></td>
      <td class="valueC">1525</td>
      <td class="valueC">6</td>
      <td class="valueR">$637</td>
      <td class="valueR">$106</td>
      <td class="valueR">254</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="20076717" context="development" /></td>
      <td class="valueC">1255</td>
      <td class="valueC">6</td>
      <td class="valueR">$524</td>
      <td class="valueR">$87</td>
      <td class="valueR">209</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="9998760" context="development" /></td>
      <td class="valueC">1150</td>
      <td class="valueC">4</td>
      <td class="valueR">$480</td>
      <td class="valueR">$120</td>
      <td class="valueR">288</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="21221008" context="development" /></td>
      <td class="valueC">1065</td>
      <td class="valueC">9</td>
      <td class="valueR">$445</td>
      <td class="valueR">$49</td>
      <td class="valueR">118</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="15147311" context="development" /></td>
      <td class="valueC">1015</td>
      <td class="valueC">5*</td>
      <td class="valueR">$424</td>
      <td class="valueR">$85</td>
      <td class="valueR">203</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="10425804" context="development" /></td>
      <td class="valueC">1000</td>
      <td class="valueC">2</td>
      <td class="valueR">$417</td>
      <td class="valueR">$209</td>
      <td class="valueR">500</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="10063132" context="development" /></td>
      <td class="valueC">870</td>
      <td class="valueC">5*</td>
      <td class="valueR">$363</td>
      <td class="valueR">$73</td>
      <td class="valueR">174</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="20771475" context="development" /></td>
      <td class="valueC">780</td>
      <td class="valueC">7</td>
      <td class="valueR">$325</td>
      <td class="valueR">$47</td>
      <td class="valueR">111</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="7479769" context="development" /></td>
      <td class="valueC">770</td>
      <td class="valueC">2</td>
      <td class="valueR">$321</td>
      <td class="valueR">$161</td>
      <td class="valueR">385</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="11790647" context="development" /></td>
      <td class="valueC">705</td>
      <td class="valueC">3</td>
      <td class="valueR">$294</td>
      <td class="valueR">$98</td>
      <td class="valueR">176</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="20188980" context="development" /></td>
      <td class="valueC">660</td>
      <td class="valueC">4</td>
      <td class="valueR">$275</td>
      <td class="valueR">$69</td>
      <td class="valueR">165</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="22069758" context="development" /></td>
      <td class="valueC">650</td>
      <td class="valueC">6*</td>
      <td class="valueR">$271</td>
      <td class="valueR">$45</td>
      <td class="valueR">108</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="14788013" context="development" /></td>
      <td class="valueC">640</td>
      <td class="valueC">3</td>
      <td class="valueR">$267</td>
      <td class="valueR">$89</td>
      <td class="valueR">213</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="8375801" context="development" /></td>
      <td class="valueC">615</td>
      <td class="valueC">3</td>
      <td class="valueR">$256</td>
      <td class="valueR">$86</td>
      <td class="valueR">205</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="12006665" context="development" /></td>
      <td class="valueC">605</td>
      <td class="valueC">4</td>
      <td class="valueR">$252</td>
      <td class="valueR">$63</td>
      <td class="valueR">151</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="21706245" context="development" /></td>
      <td class="valueC">595</td>
      <td class="valueC">9</td>
      <td class="valueR">$248</td>
      <td class="valueR">$28</td>
      <td class="valueR">66</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="13324255" context="development" /></td>
      <td class="valueC">575</td>
      <td class="valueC">9</td>
      <td class="valueR">$240</td>
      <td class="valueR">$27</td>
      <td class="valueR">64</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="21271044" context="development" /></td>
      <td class="valueC">515</td>
      <td class="valueC">7</td>
      <td class="valueR">$215</td>
      <td class="valueR">$31</td>
      <td class="valueR">74</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="20758806" context="development" /></td>
      <td class="valueC">505</td>
      <td class="valueC">5</td>
      <td class="valueR">$211</td>
      <td class="valueR">$84</td>
      <td class="valueR">101</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="10098406" context="development" /></td>
      <td class="valueC">500</td>
      <td class="valueC">1</td>
      <td class="valueR">$208</td>
      <td class="valueR">$209</td>
      <td class="valueR">500</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="15832159" context="development" /></td>
      <td class="valueC">500</td>
      <td class="valueC">1</td>
      <td class="valueR">$208</td>
      <td class="valueR">$208</td>
      <td class="valueR">500</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="21145630" context="development" /></td>
      <td class="valueC">500</td>
      <td class="valueC">2</td>
      <td class="valueR">$208</td>
      <td class="valueR">$104</td>
      <td class="valueR">250</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="22627015" context="development" /></td>
      <td class="valueC">490</td>
      <td class="valueC">3</td>
      <td class="valueR">$204</td>
      <td class="valueR">$68</td>
      <td class="valueR">163</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="10169506" context="development" /></td>
      <td class="valueC">485</td>
      <td class="valueC">2</td>
      <td class="valueR">$202</td>
      <td class="valueR">$101</td>
      <td class="valueR">242</td>
   </tr>
   <tr class="light">
      <td class="value"><tc-webtag:handle coderId="10650643" context="development" /></td>
      <td class="valueC">475</td>
      <td class="valueC">2</td>
      <td class="valueR">$198</td>
      <td class="valueR">$99</td>
      <td class="valueR">238</td>
   </tr>
   <tr class="dark">
      <td class="value"><tc-webtag:handle coderId="15845095" context="development" /></td>
      <td class="valueC">430</td>
      <td class="valueC">5</td>
      <td class="valueR">$179</td>
      <td class="valueR">$36</td>
      <td class="valueR">68</td>
   </tr>
</table>
<br>
*This is still not finalized as the developers have outstanding components.
<br><br>
<span class="smallText">
(1) These numbers are still tentative for some members and might result in changes to this table (including changes to position or actual placement in the top 1/3, which this table represents).
</span>
<br><br>

        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../foot.jsp" />

</body>

</html>
