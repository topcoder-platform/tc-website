<%@ page contentType="text/html;charset=utf-8" %> 
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/> 
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/> 
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
   background-color: #EEEEEE
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
    <tc-webtag:forumLink forumID="506171" message="Discuss this article" />
</div>

<span class="bigTitle">TopCoder @ Work: Your Career and the TCCC</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/timmac_big.jpg" alt="Author" />
    <img src="/i/m/rhudson_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="10407399" /> &amp; <tc-webtag:handle coderId="22627518" /><br />
      <em>TopCoder Members</em>
</div>

<br clear="all">

"A text &lt;SPAN&gt; called "Hello World" blinks.<br>
Your home page offers mini links<br>
to algorithms you re-coded --<br>
"bubble sort," it's so outmoded!<br>
Computer school gave you an "A,"<br>
but classroom grades won't earn your pay."
<br><br>
-- Rob Hudson, professional writer, part-time programmer, (not poet)
<br><br>
I spent my first two years of college debugging control-break routines in Pascal and churning out Cobol reports for simple classroom "Accounting" programs. These trivial demonstrations easily met the requirements of a college classroom, yet wouldn't carry me into a job "on the outside." The bare, cold world provided me with a meager student paycheck for picking up golf balls in a field. 
<br><br>
My indoor options were limited to working in the school's computer lab -- but troubleshooting Wordperfect and breaking print jobs weren't likely to score me a high-paying gig after college. I didn't get "real" experience until my kindly professors, Dr.'s Strouse and Eddins, led me to internships in "my field." I spent two years creating tiny web pages, documenting JCL (an arcane batch language), and converting megabytes of accounting data from text files to Microsoft Access. Somehow, this professional experience opened the door for me to get a job after college. Even so, I struggled for five more years to develop a career path that was even moderately satisfying.
With the TopCoder Collegiate Challenge coming up soon, now is a good time to consider how the choices you make in college can shape the future of your career. 
<br><br>
<span class="subtitle">Building up your experience (and your resume) through TopCoder</span><br>
Were I attending university today, I would scrap my career as a ball chaser and direct my energy and effort to the Topcoder Collegiate Challenge. There, I could engage my interest, develop "real" software, interact with talented developers, and showcase my abilities to major corporations. Sponsors like AOL provide a major credibility boost to contests that not only require excellent development quality, but also solid design and testing strategies. This complete package of skills provides the college student "top coder" with an absolute advantage in the workforce.
<br><br>
<div style="float: right; padding: 0px 0px 10px 15px;">
<table class="formFrame" width="170" cellpadding="6" cellspacing="2">
   <tr class="GAtableText" nowrap="nowrap">
      <td><span class="subtitle">The TopCoder College Tour</span><br>Enjoy TopCoder? Want to build more of a TopCoder community on your campus? Invite the TopCoder College Tour to your school! Spots are still available for this spring – check out the <A href="/tc?module=CollegeTourDescription">2006-7 TopCoder College Tour</A> for more information, or email <A href="mailto:collegetour@topcoder.com">collegetour@topcoder.com</A> to discuss setting up a visit.</td>
   </tr>
</table>
</div>
Employers seek developers who can actively solve problems under often tight deadlines. TopCoder's regular contests are timed situations; programmers must not only provide working code but also determine how that code can be "broken." Discover a terminal bug in a TopCoder contest and you earn critical points, prizes, and the ultimate: "high ranking." Find a serious bug in a mission-critical application at a job and you earn reputation, security, and higher pay.
<br><br>
There's a joke that goes something like this&#8230; a Harvard graduate shows up for his first day at work, and approaches his boss, who hands him a broom, instructing him to sweep the hallway.  When he balks, and explains that he's a Harvard graduate, the boss takes the broom back and says, "I'm sorry, you're right&#8230; let me show you how to use that broom." 
<br><br>
Apart from being a cheap shot at Harvard students, the joke illustrates an important point.  College coursework does not always equate with useful on-the-job knowledge; a computer science degree, even from a great school, does not necessarily make someone a good job candidate.  To stand out, it’s important to have job-relevant experiences that demonstrate your ability to do well – and, even better, your ability to “hit the ground running” and add value to the organization from day one. This is one area where your TopCoder experience can really help. 
<br><br>
<span class="subtitle">"Bill Gates never went to college&#8230;" </span><br>
While a degree doesn't necessarily make a good job candidate, sometimes lacking such a degree can be a real hurdle. While there are certainly plenty of smart, talented individuals who have never finished their undergraduate studies -- examples like Bill Gates and Richard Branson are often cited -- this is far from the end of the story.  As someone who is "on a long term break" from college, <tc-webtag:handle coderId="10407399" /> can speak with experience about some of the unique circumstances that have come along ‘the road less traveled.’
<br><br>
“Two competing schools of thought stand out.  On one hand, my parents (and even grandparents) could not say often enough that I needed to go to college.  Old teachers and friends had a similar reaction, expressing a mix of disbelief and disappointment.  The obvious assumption was that after leaving high school, students finish college.  Having seen ‘B.S. in computer science or related field’ in most job descriptions, I can’t fault them for this mode of thinking.
<br><br>
“On the other hand, there is an expression, ‘the cream always rises to the top.’  At the time I left college, I was working in the fast food industry.  It was laborious, menial work at times, but it was a paycheck that I needed (and the free food was nice, too). After only a few months I found myself in a management role. Among other things, this meant doing some maintenance on our Point of Sale system, which rapidly became my strong suit and something that helped me stand out.  It wasn’t my ideal career path, but I did see that hard work and an eagerness to learn are critical.
<br><br>
"For my next job, I found myself in a manufacturing environment.  Obviously, this was still far from what I wanted in a career, but it was easy to get the job quickly, and the pay was, relatively speaking, not bad.  Most of my direct and indirect supervisors noticed that I had a good feel for how things ran, and typically had some intelligent input on any matters of importance.  On one occasion, I noticed a subtle flaw in the way a testing procedure worked, whereby a suspect product lot might not be identified until the end of the process, after time and materials have been spent in vain.  In a brilliant blend of insight and general avoidance of the task I was supposed to be doing, I put together a little explanation, complete with statistical analysis, explaining the issue.  Certainly out of the ordinary, this definitely attracted some attention, but alas, still did not get me into the job field of my choosing.
<br><br>
"It was not until a few temp jobs later that I finally landed in a small company where I had an opportunity to do some web site development that really showed my skill set.  And even then, it was another year until I found a job with a pay scale that was more in line with the type of work I was doing.  So, while in some ways my abilities stood out, that was only part of the puzzle.  Either way, they may not exactly be a substitute for a degree, in the long run, but they can still take you pretty far."
<br><br>
<span class="subtitle">More education?</span><br>
Of course, sometimes demonstrating your skills isn’t enough. No matter how proficient you may be, or how hard you’re willing to work, some companies just need to see that degree, especially if they view your position as "promotable." 
<br><br>
Not all degrees are created equal, though. Some contracts pay more money for higher-pedigreed employees, so an MBA or MS can translate into a higher billing rate. Graduate degrees can also help you escape the stigma of your undergraduate experience. For example, a friend of mine who began with a BA in art found his job hunt much easier once he completed his Information Systems MBA.
<br><br>
There is also the common belief that a graduate degree may help you earn more money over the course of your career, which seems to be borne out by surveys of average income by education level.  While income and education may be related, though, there is a big difference between correlation and causation. 
<br><br>
As discussed above, the <tc-webtag:handle coderId="10407399" /> experience of not getting a degree had some mixed results initially, but ultimately ended on a positive note: "The downside was that the amount of effort (read as: frustration and disappointment) along the way was far higher than it needed to be.  On the upshot, I also got my feet wet in many different industries and job types, and felt well-prepared once I was finally working "real" jobs.  My current boss is a strong believer in employees having a degree, and actually cites me being the counterexample that has made him reconsider such a firm stance.  Nonetheless, he also points out that eventually I should finish my degree.  He is probably right."
<br><br>
An alphabet soup of degrees after your name is no guarantee of success, just as attending a top-ranked university is no guarantee of success – and, indeed, just as being the top seeded competitor in your bracket at the TCCC is no guarantee of success. Ultimately, this may be the best lesson that TopCoder can teach you as you prepare for your career. No matter who you are, or where you’re starting from, when the match starts you can’t rest on your laurels. If you want to win, you need to compete. Learn that lesson during the Collegiate Challenge, and you’ll already have a tremendous advantage as you enter the working world.
<br><br>
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
