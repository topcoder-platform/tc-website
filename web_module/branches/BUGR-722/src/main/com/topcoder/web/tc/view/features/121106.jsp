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
    <tc-webtag:forumLink forumID="506196" message="Discuss this article" />
</div>

<span class="bigTitle">TopCoder @ Work: Professional Ethics, Part 2</span>
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

<A href="/tc?module=Static&d1=features&d2=120106">Part 1</A> of this article describes ethical quandaries in which common practice and company policy are at odds. These situations can be resolved quite simply; solutions can be distilled into catchy sayings like "Don't look for work while you're at work," or "Don't use the net for fun unless you've got your work done." Cheeky clauses and cartoonish cliche's crumble, however, when serious ethical challenges arise. When workplace practices confront personal values, conflicts have consequences. Outcomes that effect your very employment depend less on making the "right choice" and more on making the "least worst" one. Can you save your job without losing your soul?
<br><br>
Consider the following scenarios that pit survival against doing the right thing. What would you do?
<br><br>
<span class="subtitle">Take the Credit, Keep the Job</span><br>
You're struggling to eke out a single productive line of code during a particularly rough development cycle. Efficiency problems plague the source; testers have rejected release after release, and your status as senior developer makes you the ultimate responsible party. A tinny alarm sounds from your speaker, announcing another meeting with quality control. You get up, and as you trudge towards the conference room you pass Fred, another senior developer on the project. "I can't make the meeting," he says, " but I think I know how we can debug our process." Fred utters 30 seconds of sheer brilliance before he disappears behind the cloth wall of his cubicle.
<br><br>
Fred's ideas create a frenzy of enthusiasm at the meeting. Grumbling managers smile and testers cheer as you present the solution to the woes that have befallen the project. You accept a grateful handshake from a vice-president, who announces you as "the new project manager." There's only one problem.
<br><br>
Somehow, you forgot to give Fred the credit he deserved. 
<br><br>
Now, you are managing an initiative you do not fully understand.  Worse yet, a now-alienated Fred, once your peer, now reports to you directly. How do you right this situation? Confess the truth, and you lose credibility -- perhaps even your job. Maintain the lie, and you'll keep your dignity, but might lose Fred.
<br><br>
<span class="subtitle">Dump the Chum, Keep the Chump</span><br>
What do you do when the right choice, based on your morals and values, is the wrong choice for your company? 
<br><br>
Your boss insists that you fire one of your two programmers. "Jim" is young, sharp, and competent. He's in perfect health -- he goes to the gym daily and avoids sick leave. In fact, Jim often works ten hours a day, and presumably has no family waiting for him at home. "Paul", however, is middle-aged, supports his wife and two children, one of whom needs frequent and serious medical care. Paul has been struggling lately -- he doesn't finish his assignments on time and he leaves early to deal with family issues. He spends most of his time at work trying to understand the "new" object-oriented programming techniques that the rest of your company has been integrating for years.
<br><br>
You know that if you fire Jim, he'll find another job quickly. Paul, however, could crumble under the pressure of finding a new job and the weight of supporting his family -- not to mention the cost of paying out-of-pocket for healthcare. What's "fair" in the context of company productivity, though, is obvious: fire Paul, your least productive worker, and retain Jim, your most productive worker.
<br><br>
<span class="subtitle">Tell a Lie, Do the Truth</span><br>
"Choosing your battles" means keeping your mouth shut unless it's strategically viable for you to speak. In some cases, it means agreeing with the boss even when you disagree. Further, you may even tell the boss "What he wants to hear" and do things your own way. He'll never know the difference, and the project will work better -- maybe.
<br><br>
In a former job, I was tasked with writing a module to generate some reports that included charts and graphs. To create these visual representations of data, I employed the rather basic graphics capabilities of .NET's GDI+ libraries. The simple yet (in my opinion) effective results weren't up to the standards of senior managers. They insisted that I develop the graphics using a third-party package with built-in charting functions. These capabilities would provide standard functionality and save development hours, my superiors reasoned.
<br><br>
Several days later, I was still struggling to duplicate my home-grown charts with the new tool. This "standard" package provided an "automated" color palette with hues so similar in tone that they could not be distinguished from one another. Something so fickle as the variance of color displays between monitors thwarted meaningful presentation of information. I presented this problem to the boss, bolstered by the fact that even the vendor couldn't provide a resolution. "We're paying you to find solutions, not point out problems," he said, stone-faced and sour. "And don't start that 'home-grown' nonsense again."
<br><br>
Was I ethically bound to obey orders and create a solution that wouldn't meet requirements? Or, did the "bigger picture" demand that I defy the operational demands of my ignorant superiors and produce a solution that met their requirements? Should I risk immediate termination for contradicting a direct order, or take a chance on long-term failure by proceeding with a flawed process? 
<br><br>
None of the choices seemed particularly viable, so I chose to do things "both ways." I secretly toiled on a "switchable" solution that permitted charting in either .NET's GDI+ or the third-party tool. While I didn't "lie" to the boss directly, I exercised my dishonestly more subtly -- by concealing what I was actually doing. My action satisfied my clueless boss in the short-term,  but created more long-term maintenance work for future developers, whose schedules were already burdened with excessive time. I, too, could have spent the hours I wasted on a dual solution on something more productive, like extra features, testing, or optimization. 
<br><br>
<span class="subtitle">Leave with Dignity, Enter with Shame</span><br>
"Forget these choices," you might say, "and quit your job." Leaving your employer is relatively simple, but how do you ethically describe your reason for doing so during your next interview?  In an ideal world, you could walk into a job interview and explain that you left your previous employer over an "ethical issue." Yet, by announcing your virtue, you cast aspersions of vice on your former company. You might as well be accusing your former employer of dishonest business practices. The mere assessment of blame labels you as troublesome at the best, libelous at the worst.
<br><br>
If you choose not to disclose the "reality," you can choose your degree of dishonesty by lying outright or generalizing the situation to the point of absurdity. Specifically, you might say "Our company declared bankruptcy and was going out of business." In the abstract, you may opt for "I decided that our mutually benevolent philosophies were incompatible." Complete honesty, however, is not a reasonable option. You can't say that you left because "My boss was lying to customers and expecting me to produce software that met his arbitrary and frequently-changing requirements."
<br><br>
<span class="subtitle">Choose the Form of the Destroyer</span><br>
These scenarios suggest that workplaces are rife with confusing, conflicting, higher-order ethical issues that collide with lower-order personal values.  Resolve disagreements with lies, and you may survive for quite a while. Do nothing, and you may minimize the damage -- until you are forced to choose a course of action. Follow your sense of honesty, and the truth might get you disciplined, discredited, or terminated completely.
<br><br>
This last category of choice -- a firm commitment to honesty --  carries the most risk. The popular adage that "the squeaky wheel gets the grease" implies that those who speak up will receive positive attention. I prefer the phrase "The squeaky wheel gets released," for it's often easier to replace a troublesome component than to understand why it failed in the first place.
<br><br>
Most of us live in a structure that depends on regular income for housing, food, and health benefits. Unless we've managed to acquire independent wealth, we might not be able to weather the storm of a losing a job -- especially if it happens in a public or controversial way. Complete honesty, if ill-received, can devastate you and your family.
<br><br>
To survive an ethical hurricane, prepare yourself as you would for an actual natural disaster. Ensure that you have a place to go after the chaos by developing a strong network of professional associates who might hire you someday. Take out "job security" insurance by investing in a sound policy of self-education to keep skills fresh. Diversify your employment "holdings" with freelance work to soften the blow of losing a single source of income.
<br><br>
So, where to start? You're not in a bad place -- at TopCoder, you can make new programming contacts, learn new skills, and earn some supplemental cash, all of which could come in very handy one day. Good luck, and let us know about some of the challenging situations you have encountered in the <tc-webtag:forumLink forumID="506196" message="forums" />.
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
