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

As the first stage draws to an end for the Digital Run, I am going to take stock of this great new competition format. And a great competition it was, with veterans and newbies alike withstanding the challenges of a 13-week marathon and racking up some surprising results. In this article I will recap some of the highlights of the stage (mostly from the design side) and give my perspective on Digital Run strategy. 
<br><br>
On the design side, Stage 1 saw some of TopCoder's top designers pitted against each other.  The result: A new top-ranked designer, as <tc-webtag:handle coderId="11797255" />'s three wins over <tc-webtag:handle coderId="119676" /> in three head-to-head competitions helped him reach #1. <tc-webtag:handle coderId="11797255" /> threw himself into the Digital Run, submitting a record 24 design submissions over the 13 weeks. Rounding out the top three submitters were <tc-webtag:handle coderId="252022" />, with 17, and <tc-webtag:handle coderId="119676" /> with 15 (though I should note that <tc-webtag:handle coderId="119676" /> finished his submissions in about 1/3 of the time that it took me to do mine! It's all about the power of reliability - more about this later).
<br><br>
On the development side, there were great performance from coders such as <tc-webtag:handle coderId="15073791" /> and <tc-webtag:handle coderId="15832162" />, with 13 submissions each, and <tc-webtag:handle coderId="10353806" />, with 9 submissions We have also seen some new designers and developers achieve some great feats against some of the veterans. 
<br><br>
<span class="bodySubtitle">So, is it a marathon or a sprint?</span><br />
One of the common questions about the Digital Run has been what it would take to do well. Does it have to be a full-time, 13-week commitment? Or could occasional bursts of hard work and brilliance suffice? After the first stage, it's clear that the answer is "yes" - it can be both.
<br><br>
The Digital Run requires both long term planning and persistent focused execution, but also rewards sprinters, as competitors can accomplish significant gains in a short period of time.
<br><br>
Looking at the strategies designers have used, we can see these two extremes -- the steady week-in, week-out performance of designers like <tc-webtag:handle coderId="11797255" /> and <tc-webtag:handle coderId="252022" /> on one side, the occasional bursts of multiple submissions from <tc-webtag:handle coderId="119676" /> and <tc-webtag:handle coderId="15891862" /> on the other.
<br><br>
This is a mixed bag of strategies. But the bottom line is that even the occasional competitor who chooses his or her spots can do very well and make some great money. Look at the table at the end of this article to see how <tc-webtag:handle coderId="152342" /> earned $992.11 with just three weeks of submitting. 
<br><br>
<span class="bodySubtitle">Planning is everything</span><br />
Planning when and how to compete is critical, particularly because of the way the Digital Run format awards points. Points are shared among the competitors submitting the same component, with a 500-point pool divided among them. This means that if two competitors go after the same component -- and both pass the review -- then first place gets 325 point and second gets 175. The more competitors that go for the same component, the more that 500-point pie gets divided. This means that you could come up with 10 great designs and potentially only score 300 points for all that work. 
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
Countering like this not only slows your opponent down, but also shows that you mean business. This was the case during Stage 1 when <tc-webtag:handle coderId="119676" /> made a leap and grabbed four component designs. <tc-webtag:handle coderId="11797255" /> countered him in this exact manner (on three submissions) to ensure that he could control <tc-webtag:handle coderId="119676" />' point gains. (Incidentally, getting four components done at all, especially with high quality, is quite an accomplishment in its own right. Congratulations to <tc-webtag:handle coderId="119676" />, <tc-webtag:handle coderId="11797255" />, and <tc-webtag:handle coderId="15891862" />, who all went for the big four!). 
<br><br>
<span class="bodySubtitle">Reliability, reliability&#8230;</span><br />
Ahh, many a coder has wondered about this little aspect of design/development. In case you haven't heard it before, let me be the first to tell you: Reliability is very important for the Digital Run!
<br><br>
Why? If your reliability is greater than 70%, you can potentially register for as many components as you wish and thus earn a LOT of points. This is a great option to have, allowing you to jump in and grab some easy designs as they arise. Consider what <tc-webtag:handle coderId="15891862" /> did in the last week of Stage 1 on the design side, when he went for four components, most with little competition. This is an awesome way to get some great point boosters and he could not have done that if his reliability rating was below 70%.
<br><br>
Bottom line? High reliability is a very important overall asset to have, especially for Digital Run strategizing. Plus, reliability of 80% and above translates into a bonus of 10%-20% on your prizes for winning components (though not on Digital Run prize money). Consider this: The winner of a $1,000 component would actually get $1,200 if their reliability is 100%! 
<br><br>
<span class="bodySubtitle">I am new, I can't do this.</span><br />
"Ahh, but there are too many reds and yellows," you might say. "I am new, no point in doing this." You could not be more wrong. Just look at the performances of some first-time designers such as <tc-webtag:handle coderId="2058798" />, <tc-webtag:handle coderId="16164275" />, or <tc-webtag:handle coderId="7548200" /> (granted, maybe a special case, since he won the TCO in development).  Everyone was new to design or development at some point -- the important thing is to start. That's the only way you will ever get better! Not to mention the Rookie of the Year prizes that are up for grabs.
<br><br>
<span class="bodySubtitle">And now for some stats, ladies and gentlemen:</span><br />
Sometimes numbers tell the story better than words, so let's look at the stats:

<ul>
<li>How many components?<br>
In total, Stage 1 of the Digital Run produced 91 winning designs and 84 winning developments. This is a major spike in both design and development production.</li>
<li>Who had the best ratio of components to points?<br>
<tc-webtag:handle coderId="152342" />, with an average of 442 points per submission, led the designers. Among the developers, several tied for best ratio with 500 each. See the tables below for more details.</li>
<li>Who had the best ratio of components to money made in DR?<br>
<tc-webtag:handle coderId="11797255" /> earned a whopping average of $1,308 in Digital Run winnings for each of his submissions, leading the designers. <tc-webtag:handle coderId="15832162" /> had the best ratio among developers, earning an impressive average of $1,079 per submission. See the tables below for more details.</li>
</ul>

<span class="bodySubtitle">Last but not least: The money</span><br />
We can think of the DR money as being a bonus per component submitted. In such a case <tc-webtag:handle coderId="119676" />, for example, has made $885 extra for each component submitted. Given that the top 1/3 of all submitters will get paid extra this is an amazing way to make money on top of what you could make with a component win! For designers, this translated to $137 as the minimum payout for a top third designer (dplass in the table) for each component submitted. So you can make money when you actually do not even win a component!
<br><br>
<span class="bodySubtitle">Challenges for Stage 2</span><br />
I think that <tc-webtag:handle coderId="15832162" />'s quote is very appropriate here:<br>
    "Do or do not. There is no try."
<br><br>
There are a couple challenges that I would like to put forth to "the doers:"
<br><br>
<b>Design:</b>
<ol>
<li>Break <tc-webtag:handle coderId="11797255" />'s record 24 submissions</li>
<li>Break <tc-webtag:handle coderId="11797255" />'s record of 20 wins</li>
<li>Break through the 10,000 point barrier</li>
</ol>

<b>Development</b>
<ol>
<li>Break <tc-webtag:handle coderId="15073791" />'s record 13 submissions</li>
<li>Break <tc-webtag:handle coderId="15073791" />'s record of 9 wins</li>
<li>Break through the 5,000 point barrier</li>
</ol>

<span class="bodySubtitle">Final thoughts:</span><br />
Stage 1 of the Digital Run was everything I had hoped for: a great challenge, a great opportunity to make some money, great drama when trying to see who is doing what (in fact, as I write this I am not sure if I will lose my second slot to <tc-webtag:handle coderId="119676" />!), and a great experience in all (apart from a couple sleepless nights, but hey - who needs sleep?). 
<br><br>
I want to thank TopCoder for creating such an awesome contest, and I hope to see you all competing in Stage 2.
<br><br>

<b>Table 1. Component submissions to DR-money and DR-points ratios. (Design)</b>
<br><br>
<table class="formFrame" width="500" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center">Competitor</td>
      <td align="center">Current score</td>
      <td align="center"># Submissions</td>
      <td align="center">Money made</td>
      <td align="center">DR Money /submission</td>
      <td align="center">DR Points /submission</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">aubergineanode</td>
      <td align="center">6790</td>
      <td align="center">23*</td>
      <td align="right">$30,084.10</td>
      <td align="right">$1,308</td>
      <td align="center">295</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">Pops</td>
      <td align="center">4375</td>
      <td align="center">13*</td>
      <td align="right">$13,275.84</td>
      <td align="right">$1,021</td>
      <td align="center">337</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">AleaActaEst</td>
      <td align="center">4255</td>
      <td align="center">15*</td>
      <td align="right">$10,185.99</td>
      <td align="right">$679</td>
      <td align="center">284</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">Ghostar</td>
      <td align="center">3580</td>
      <td align="center">13*</td>
      <td align="right">$5,680.57</td>
      <td align="right">$437</td>
      <td align="center">275</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">woodjhon</td>
      <td align="center">2680</td>
      <td align="center">12*</td>
      <td align="right">$4,006.69</td>
      <td align="right">$334</td>
      <td align="center">223</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">tuenm</td>
      <td align="center">1905</td>
      <td align="center">6</td>
      <td align="right">$1,426.39</td>
      <td align="right">$238</td>
      <td align="center">318</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">nicka81</td>
      <td align="center">1770</td>
      <td align="center">6*</td>
      <td align="right">$1,325.31</td>
      <td align="right">$221</td>
      <td align="center">295</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">real_vg</td>
      <td align="center">1755</td>
      <td align="center">7*</td>
      <td align="right">$1,314.08</td>
      <td align="right">$188</td>
      <td align="center">251</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">topgear</td>
      <td align="center">1645</td>
      <td align="center">9</td>
      <td align="right">$1,231.72</td>
      <td align="right">$137</td>
      <td align="center">183</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">saevio</td>
      <td align="center">1500</td>
      <td align="center">5</td>
      <td align="right">$1,123.14</td>
      <td align="right">$225</td>
      <td align="center">300</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">antimatter</td>
      <td align="center">1415</td>
      <td align="center">10*</td>
      <td align="right">$1,059.50</td>
      <td align="right">$106</td>
      <td align="center">142</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">kyky</td>
      <td align="center">1325</td>
      <td align="center">3</td>
      <td align="right">$992.11</td>
      <td align="right">$331</td>
      <td align="center">442</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">ShindouHikaru</td>
      <td align="center">1230</td>
      <td align="center">5</td>
      <td align="right">$920.98</td>
      <td align="right">$184</td>
      <td align="center">246</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">oldbig</td>
      <td align="center">1130</td>
      <td align="center">6</td>
      <td align="right">$846.10</td>
      <td align="right">$141</td>
      <td align="center">188</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">dplass</td>
      <td align="center">1095</td>
      <td align="center">7*</td>
      <td align="right">$819.90</td>
      <td align="right">$117</td>
      <td align="center">156</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">colau</td>
      <td align="center">945</td>
      <td align="center">3*</td>
      <td align="right">$707.58</td>
      <td align="right">$236</td>
      <td align="center">315</td>
   </tr>
</table>
<br>
*This is still not finalized as the designer has outstanding designs
<br><br>
<span class="smallText">
(1) Note that all ratios are rounded up<br>
(2) We can think of the DR money as being a bonus per component submitted. In such a case <tc-webtag:handle coderId="119676" />, for example, made $1,021 extra for each component submitted.<br>
(3) These numbers are still tentative for some members and might result in changes to this table (including changes to position or actual placement in the top 1/3, which this table represents).
</span>
<br><br>

<b>Table 2. Component submissions to DR-money and DR-points ratios. (Development)</b>
<br><br>
<table class="formFrame" width="500" cellpadding="6" cellspacing="2" align="center">
   <tr class="sidebarTitle" nowrap="nowrap">
      <td align="center">Competitor</td>
      <td align="center">Current score</td>
      <td align="center"># Submissions</td>
      <td align="center">Money made</td>
      <td align="center">DR Money /submission</td>
      <td align="center">DR Points /submission</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">haozhangr</td>
      <td align="center">3645</td>
      <td align="center">13</td>
      <td align="right">$14,023.06</td>
      <td align="right">$1,079</td>
      <td align="center">280</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">minhu</td>
      <td align="center">3990</td>
      <td align="center">12*</td>
      <td align="right">$6,458.29</td>
      <td align="right">$538</td>
      <td align="center">333</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">kr00tki</td>
      <td align="center">2720</td>
      <td align="center">9</td>
      <td align="right">$4,636.55</td>
      <td align="right">$515</td>
      <td align="center">302</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">UFP2161</td>
      <td align="center">1650</td>
      <td align="center">6</td>
      <td align="right">$2,189.45</td>
      <td align="right">$365</td>
      <td align="center">275</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">hackerzhut</td>
      <td align="center">1595</td>
      <td align="center">7</td>
      <td align="right">$1,666.47</td>
      <td align="right">$238</td>
      <td align="center">228</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">biotrail</td>
      <td align="center">1530</td>
      <td align="center">5</td>
      <td align="right">$639.31</td>
      <td align="right">$128</td>
      <td align="center">306</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">urtks</td>
      <td align="center">1525</td>
      <td align="center">6</td>
      <td align="right">$637.22</td>
      <td align="right">$106</td>
      <td align="center">254</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">assistant</td>
      <td align="center">1255</td>
      <td align="center">6</td>
      <td align="right">$524.40</td>
      <td align="right">$87</td>
      <td align="center">209</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">PE</td>
      <td align="center">1150</td>
      <td align="center">4</td>
      <td align="right">$480.53</td>
      <td align="right">$120</td>
      <td align="center">288</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">BLE</td>
      <td align="center">1065</td>
      <td align="center">9</td>
      <td align="right">$445.01</td>
      <td align="right">$49</td>
      <td align="center">118</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">littlebull</td>
      <td align="center">1015</td>
      <td align="center">5*</td>
      <td align="right">$424.12</td>
      <td align="right">$85</td>
      <td align="center">203</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">maone</td>
      <td align="center">1000</td>
      <td align="center">2</td>
      <td align="right">$417.85</td>
      <td align="right">$209</td>
      <td align="center">500</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">catcher</td>
      <td align="center">870</td>
      <td align="center">5*</td>
      <td align="right">$363.53</td>
      <td align="right">$73</td>
      <td align="center">174</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">hanno</td>
      <td align="center">780</td>
      <td align="center">7</td>
      <td align="right">$325.92</td>
      <td align="right">$47</td>
      <td align="center">111</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">marian</td>
      <td align="center">770</td>
      <td align="center">2</td>
      <td align="right">$321.74</td>
      <td align="right">$161</td>
      <td align="center">385</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">j3_guile</td>
      <td align="center">705</td>
      <td align="center">3</td>
      <td align="right">$294.58</td>
      <td align="right">$98</td>
      <td align="center">176</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">abelli</td>
      <td align="center">660</td>
      <td align="center">4</td>
      <td align="right">$275.78</td>
      <td align="right">$69</td>
      <td align="center">165</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">aGoodHandle</td>
      <td align="center">650</td>
      <td align="center">6*</td>
      <td align="right">$271.60</td>
      <td align="right">$45</td>
      <td align="center">108</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">magicpig</td>
      <td align="center">640</td>
      <td align="center">3</td>
      <td align="right">$267.42</td>
      <td align="right">$89</td>
      <td align="center">213</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">vividmxx</td>
      <td align="center">615</td>
      <td align="center">3</td>
      <td align="right">$256.98</td>
      <td align="right">$86</td>
      <td align="center">205</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">Chenhong</td>
      <td align="center">605</td>
      <td align="center">4</td>
      <td align="right">$252.80</td>
      <td align="right">$63</td>
      <td align="center">151</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">ch_music</td>
      <td align="center">595</td>
      <td align="center">9</td>
      <td align="right">$248.62</td>
      <td align="right">$28</td>
      <td align="center">66</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">fairytale</td>
      <td align="center">575</td>
      <td align="center">9</td>
      <td align="right">$240.26</td>
      <td align="right">$27</td>
      <td align="center">64</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">superZZ</td>
      <td align="center">515</td>
      <td align="center">7</td>
      <td align="right">$215.19</td>
      <td align="right">$31</td>
      <td align="center">74</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">myxgyy</td>
      <td align="center">505</td>
      <td align="center">5</td>
      <td align="right">$211.01</td>
      <td align="right">$84</td>
      <td align="center">101</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">colau</td>
      <td align="center">500</td>
      <td align="center">1</td>
      <td align="right">$208.92</td>
      <td align="right">$209</td>
      <td align="center">500</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">oodinary</td>
      <td align="center">500</td>
      <td align="center">1</td>
      <td align="right">$208.92</td>
      <td align="right">$208</td>
      <td align="center">500</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">indifferent</td>
      <td align="center">500</td>
      <td align="center">2</td>
      <td align="right">$208.92</td>
      <td align="right">$104</td>
      <td align="center">250</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">iamajia</td>
      <td align="center">490</td>
      <td align="center">3</td>
      <td align="right">$204.75</td>
      <td align="right">$68</td>
      <td align="center">163</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">telly12</td>
      <td align="center">485</td>
      <td align="center">2</td>
      <td align="right">$202.66</td>
      <td align="right">$101</td>
      <td align="center">242</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">qiucx0161</td>
      <td align="center">475</td>
      <td align="center">2</td>
      <td align="right">$198.48</td>
      <td align="right">$99</td>
      <td align="center">238</td>
   </tr>
   <tr class="GAtableText">
      <td align="center">singlewood</td>
      <td align="center">430</td>
      <td align="center">5</td>
      <td align="right">$179.67</td>
      <td align="right">$36</td>
      <td align="center">68</td>
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
