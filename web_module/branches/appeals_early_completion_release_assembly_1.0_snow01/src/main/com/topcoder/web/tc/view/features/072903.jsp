<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
function changeImage(image, newImage) {
document[image].src=newImage;
return;
}
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
}
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
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
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>

                        <p><font size="4"><strong>The TopCoder Design Contest #2</strong></font><br />
                        Tuesday, July 29, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=119676"><strong>Pops</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>
<b>Introduction</b><br />
The TopCoder Design Contest #2 was a very different contest than  the 
previous one due to changes in the contest rules, design requirements, and judging. 
The top 3 designers were awarded payments of $3000, $2000 and $1000, based 
on the average of the top 5 submission scores from each designer. Design requirements
changed by removing the need for functional tests.  The scorecard added new categories,
relaxed the wording on others and a much needed appeals process was put into place.  Altogether,
the contest provided a wonderful experience to all and definitely improved the resulting
submissions.
</p>
<p>
Week 1 of the contest was kicked off by submissions from <strong>Mikhail_T</strong>, 
<strong>ozzie</strong>, <strong>Saxophonist</strong> and <strong>WishingBone</strong>.  
This was closely followed in week 2 with <strong>DenisKulagin</strong>, <strong>haha</strong>, 
and <strong>MPhk</strong> submitting first designs, <strong>Mikhail_T</strong> submitting a 
second design and three double submissions by <strong>adic</strong>, <strong>TangentZ</strong> 
and <strong>ttsuchi</strong>.  Week 2 also saw <strong>srowen</strong> submitting a first design 
for an astounding score of 98.75.  Week 3 found <strong>CagedRat</strong>, <strong>diecut13</strong>, 
<strong>isv</strong>, <strong>kislookhin</strong>, <strong>kyky</strong> and <strong>TheCois</strong> 
submitting their first entry and <strong>haha</strong>, <strong>ozzie</strong>, and 
<strong>WishingBone</strong> submitting a second design each.  A single submission from <strong>TangentZ</strong> 
and a double submission from <strong>Saxophonist</strong> brought their totals up to 3 designs each.   Week 4 saw 
only two newcomers - <strong>aksonov</strong> and <strong>Tomson</strong>, who each submitted a single design.  
More entrenchment was seen from the single submissions of <strong>haha</strong>, <strong>isv</strong>, 
<strong>MPhk</strong>, <strong>TangentZ</strong> and <strong>TheCois</strong>.  <strong>TangentZ</strong> was 
now tantalizingly close to the qualify minimum with 4 designs.
</p>
<p>
The halfway point, week 5, saw first submissions from <strong>argolite</strong>, <strong>giginim</strong>, and 
<strong>mishagam</strong>.  <strong>aksonov</strong> and <strong>Tomson</strong> submitted a second design with 
<strong>adic</strong>, <strong>isv</strong> and <strong>ozzie</strong> submitting their third designs.  Of the 
submissions that have been scored up to this point, <strong>srowen</strong> held the point lead followed closely by 
<strong>ozzie</strong> and <strong>WishingBone</strong>.  The current leaders in the number of submissions was 
<strong>TangentZ</strong> with 4 and <strong>adic</strong>, <strong>haha</strong>, <strong>isv</strong>, <strong>ozzie</strong> 
and <strong>Saxaphonist</strong> tied at 3 submissions each.  The top 5 on the leader board stood in order (with 
their average points):  <strong>srowen</strong> (98.75), <strong>ozzie</strong> (90.83), <strong>WishingBone</strong> (89.26), 
<strong>adic</strong> (89.16), and <strong>TangentZ</strong> (88.37).
</p>
<p>
Week 6, surprisingly, saw only a single submission from <strong>aksonov</strong>, tying the six other competitors at the three 
design mark.  Week 7 was likewise calm with only 4 submissions.  <strong>FTolToaster</strong> made a debut with a single submission.  
<strong>argolite</strong> and <strong>mishagam</strong> submitted their second design and <strong>ozzie</strong> submitted a forth design to tie <strong>TangentZ</strong>.  
These two weeks were very surprising due to the lack of activity from the current top competitors given the flurry of activity in the 
prior weeks.  Especially surprising was <strong>TangentZ</strong> who, after submitting 4 designs in 4 weeks, went suddenly silent for three 
weeks straight.
</p>
<p>
Week 8 is where things get interesting.  Designers must make a choice whether they are too far out of the competition or whether to "push" 
for the goal (and maybe tradeoff quality for quantity).  At this point, <strong>schveiguy</strong> posted a forum message wondering if anyone was going 
to make the cut.  Personally, I wondered about <strong>srowen</strong>, who had proved quite capable in the first contest, but had failed to follow-up on 
his outstanding first submission.  Both fears proved groundless beginning in week 8 with 12 submissions.  <strong>Ken Vogel</strong>, <strong>rhett</strong>, 
<strong>scamp</strong>, <strong>shiro</strong> and <strong>ThinMan</strong> entered the contest with single submissions.  <strong>adic</strong>, <strong>aksonov</strong>, <strong>argolite</strong>, 
<strong>isv</strong>, <strong>ozzie</strong>, <strong>srowen</strong>, and <strong>TangentZ</strong> added to their totals by a single submission.  Both <strong>ozzie</strong> and <strong>TangentZ</strong>
became the first competitors to make the 5 design qualifying minimum this week.  Week 9 was another busy week with an additional 7 submissions 
with single submissions from <strong>isv</strong>, <strong>Ken Vogel</strong>, <strong>ozzie</strong>, <strong>schveiguy</strong>, <strong>srowen</strong> and a double submission from 
<strong>ThinMan</strong>.  <strong>isv</strong> joined <strong>ozzie</strong> and <strong>TangentZ</strong> by meeting the minimum requirements of 5 designs.
</p>
<p>
A lot of caffeine and/or more adult oriented beverages must have been consumed on Week 10 because there were 16 submissions in this final week.  
<strong>adic</strong>, <strong>aksonov</strong>, <strong>argolite</strong>, <strong>srowen</strong>, and <strong>ThinMan</strong> submitted enough designs to 
qualify.  <strong>Ken Vogel</strong> made a super human effort and submitted 3 designs to qualify.  Both <strong>ozzie</strong> and <strong>TangentZ</strong> 
submitted extra designs in an attempt to improve their averages.  A big thumbs up has to go to <strong>giginim</strong> who, while having no chance at making the 
minimum bar, submitted a second design in the final week.  On a "bummer" type of note, <strong>Saxophonist</strong> submitted a qualifying 5th design that was 
later rejected in the screening process for reasons you can read in the forum.  When all the designs were reviewed and scored - the top 5 leader stood at:  <strong>TangentZ</strong> 
(91.21), <strong>isv</strong> (90.68), <strong>srowen</strong> (89.16), <strong>adic</strong> (87.96) and <strong>ozzie</strong> (87.85).
</p>
<p>
I had an opportunity to interview the three finalists to get their viewpoints on the contest.  Like the first contest, time played the biggest roll.  <strong>TangentZ</strong> 
clearly didn't want to get into a time crunch and chose to submit as early as possible - the downside being that he was on pins and needles the final weeks wondering if 
his early submissions were good enough.  <strong>isv</strong> swore not to make the mistake he made in the first contest by spreading himself too thinly between projects 
(both the design contest and an application project), thus losing all of them.  He instead committed himself to the contest and decided to submit as many designs as he could.  
<strong>srowen</strong> had commitments outside of the contest that prevented him from submitting throughout the contest until the final two weeks.  The final push to 
submit the required minimum designs cost him in quality and consequently - his final ranking.
</p>
<p>
When asked what designs they chose and which they liked best - the answer was, unsurprisingly, the design(s) that was interesting or challenging.  
<strong>TangentZ's</strong> favorite design was the Priority Queue component.  <strong>TangentZ's</strong>  comment was "Designing this component has forced me to go back to re-learning 
and reading up on many data structures and algorithms that I otherwise have forgotten since my first-year computer science course in university.  It is a 
very creative project because it does not simply follow some industry standards or API.  In essence, I was able to 'invent' (or probably re-invent) some wheels.  
That always gives me a good feeling".  <strong>isv's</strong>  favorite design was the modifications to the config manager version 3.0.  In <strong>isv's</strong>  words, "making modifications to 
existing designs/code is one of my favorite kinds of jobs". <strong> srowen</strong>  thought the Generic Event Manager was the most rewarding one - "It showcases one of Java's 
little-known but powerful reflection-related capabilities -- dynamic proxies and the Proxy class. Everything about that design really came together nicely".
In summary, the TopCoder Design Contest #2 was a great success in introducing new people to the design process, a success to all of the designers who won 
money on each individual winning design, a success to the top three designers who received a bonus and a clear success to the potential customers who will be 
using the resulting high-quality components made from those designs.
</p>
                        <p><br/></p>

                        <p>Would you like to <a href="/tc?module=Static&d1=features&d2=topics" class="bodyGeneric">write a feature?</a></p>



   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
