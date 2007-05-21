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

                        <p><font size="4"><strong>Performance and Optimization in the "Real World"</strong></font><br />
                        Wednesday, March 2, 2005</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=269886"><strong>n0vice</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><span class="bodySubtitle">Introduction</span><br />
Most people involved with TopCoder are perfectionists, always looking for that fastest and most elegant solution.  During Single Round Matches we strive to write tight code, since every additional line or loop brings us closer to the "eight seconds of doom".  So, higher performance code is always better, right?  Fortunately, wrong.
<br /><br />
This article will talk about the basic performance strategy for software development.  I hope it will curb some of the extreme enthusiasm for CPU optimization innate to all programmers (especially the less experienced ones).  Software performance is a very broad topic.  We will only consider general-purpose software (not scientific computing, data mining, etc).
<br /><br />
<span class="bodySubtitle">Consider the trade-offs</span><br />
Let's start with the following:
<br /><br />
<span class="bodySubtitle">The Cardinal Rules of Optimization:</span><br />
<ol>
<li>Do not optimize</li>
<li>For experts only: do not optimize yet</li>
</ol>
Why is optimizing so discouraged?  Performance is not free.  It usually costs a lot of time and results in less readable and maintainable code, even when done right.  Optimizing too early often results in badly functioning implementations and poor long-term decisions.  In many cases, modern compilers can optimize code output better than the developers who have spent so much of their time tweaking the code.  Programmers have a tendency to focus on local techniques and code fragments to improve performance, when the largest impact is in design and algorithm choices.   Programmers also tend to use their intuition and experience rather than data to recognize performance problems and make fixes.  The list goes on.
<br /><br />
Perhaps the strongest reason for postponing or omitting optimizations is expressed by this great quote:
<br /><br />
<b>"The biggest performance increase you'll ever see is when your system goes from not working to working."<br /> - <A href="http://home.pacbell.net/ouster/">John Ousterhout</A></b>
<br /><br />
In other words, time is better spent making sure the system is correct, rather than that it works fast.  Performance does not matter if software does not work.
<br /><br />
Any project of sufficient size requires a performance strategy.  "Set goals and measure against them" is a simple (yet surprisingly non-obvious) strategy, which allows developers to avoid most pitfalls of performance and optimization.
<br /><br />
<span class="bodySubtitle">Set goals</span><br />
The #1 most important step in performance analysis is goal setting.  It is impossible to achieve good performance without defining, in great detail, what "good performance" means.  We need to define metrics against which a given solution candidate can be compared.  Otherwise, the effort that can be put into optimizing is virtually unbounded.
<br /><br />
For example, let's look at TopCoder SRMs.  While SRMs and their frantic pace encourage some practices that would likely be considered unacceptable for commercial software development, they do a great job setting performance goals.  For TopCoder matches, there is a single performance metric - the solution must execute in eight seconds for any valid input.  It is very important to understand, that as far as performance is concerned, a SRM solution that runs in 7.9s is <i>just as good</i> as the one that runs in 0.1s.  In fact, the better of the two is the one, which can be implemented in the shortest time.
<br /><br />
Of course, correctness is paramount.  A lightning fast piece of code that fails in a corner case is worthless compared to a behemoth that always works right.  To reconcile functionality and performance demands we can use these performance goal-setting guidelines:
<ol>
<li>Make the common case fast</li>
<li>Make the uncommon case work</li>
</ol>
In other words, we take use case analysis into consideration when setting goals that make sense for a given application.  We have to make sure that the implementation, which satisfies the goal, still works correctly in all scenarios.
<br /><br />
Another great example, which illustrates the importance of goals is real time spell checking.  Suppose we are making a text editor, which executes a spell-checker routine after every key press.  Currently, the routine executes in no more than 50ms.  Since we have determined that an average user cannot type faster than a character every 150ms, the 50ms routine satisfies the goal, and no further time needs to be spent improving it.
<br /><br />
<span class="bodySubtitle">Measure</span><br />
Once the goals are set, we must measure against them.  In general, no one should be allowed to make performance claims without having supporting numbers for the defined metrics.  For example, which code is better (assume the compiler does not optimize):
</p>
<pre>
Code A: 
int pow8(int x) {
	return x*x*x*x*x*x*x*x;
}

Code B:
int pow8(int x) {
	int a = x*x;
	int b = a*a;
	return b*b;
}
</pre>
<p>
The answer depends on whether this piece of code has any effect on our performance metrics.  The most direct way to find out is to measure with both versions.  The only justification for optimizing is concrete evidence of improvement relative to preset goals.  
<br /><br />
To find CPU bottlenecks proactively, one can use profiling.  Running benchmarks under a profiler will show the breakdown of time taken by routine.  If it turns out that <b>pow8()</b> generally takes 1% of all time, then no matter how much we optimize it, overall performance will not improve much.
<br /><br />
However, there is a big caveat: CPU is rarely the bottleneck.  Nowadays, processors are so fast and compilers are so good that most issues will come from input/output (I/O).  I/O problems encompass everything from things directly related to the application function to invoked components (such as databases) to the host operating system.  Finding I/O bottlenecks is significantly more difficult and no "one size fits all" approach exists.  In some cases when CPU synchronizes with I/O, I/O time becomes CPU time, and thus profiling can be helpful in identifying problems.  In general, benchmarks used for measurement must collect as much auxiliary data as possible to aid the investigation effort.  For example, Microsoft Windows provides a multitude of performance counters (such as CPU utilization and page faults/second), which can be plotted alongside application-defined counters.
<br /><br />
<span class="bodySubtitle">Conclusion</span><br />
In conclusion, the only way to succeed with performance is to set goals and measure against them.  In the presence of time pressure, it is important to focus on bottlenecks that most affect the metrics defined for the project at hand.  While we always want to create the fastest products possible, a disciplined strategy is necessary to properly weigh trade-offs and efficiently direct programming effort.
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
