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
.code
{
   width: 500;
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
    <tc-webtag:forumLink forumID="514346" message="Discuss this article" />
</div>

<span class="bigTitle">An Introduction to Marathon Matches</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/d000hg_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21464956" /><br>
      <em>TopCoder Member</em>
</div>

<br clear="all">

Unlike SRMs, marathon matches (MMs) place emphasis not on an encyclopedic knowledge of algorithms, but instead test your ingenuity, determination and intelligence. Division 2 coders have won more than one match, defeating yellow, red and even target-ranked members in the process. If you feel that your algorithm ranking doesn't do justice to your abilities, or you just want something different than the hectic sprint of an SRM, then this may be what you've been looking for!
<br><br>
However, don't make the mistake of thinking that MMs are easy. Apart from the main task of finding a smart solution to an NP-hard problem under tight time constraints, you face a number of different issues than you find in an SRM, including time management, motivation, organization, and the intricacies of how marathon matches actually work. How you plan your time and keep yourself motivated aren't topics I shall advise on here, but I can guide you through the structure of a marathon -- creating, testing and submitting your entries. If you manage to negotiate the learning curve and make it unscathed to the end of your first MM there's a good chance you will be hooked.
<br><br>
<span class="bodySubtitle">What <i>is</i> a Marathon Match?</span><br>
A Marathon Match is a programming competition, lasting one or more weeks, in which you write a program to score as well as possible against the scoring system for a particular problem, given constraints on run-time and memory use. Marathon contests are different from algorithm contests because the point is that an exact solution should be impossible to achieve given the constraints - typically this means problems where an exact algorithm grows exponentially in time &amp; memory requirements as the input size increases. Creating a solution to a marathon problem is all about finding clever, high-performance heuristics to get as close to the optimal result as possible in the time provided.
<br><br>
<span class="bodySubtitle">How do I compete?</span><br>
Like every other TopCoder competition, you have to be a registered member of TopCoder to participate. You also have to register individually for each marathon match - there's typically one a month - in order to view the description of the problem you're trying to solve.
<br><br>
The information below covers the basic of competition - check the <a href="/longcontest/?module=Static&d1=instructions">official rules</a> for more details.
<br><br>
<span class="bodySubtitle">Registration</span><br>
To enter a MM you must register; this can be done at any point once the contest has started - there is no need to pre-register like in SRMs. Look in the Competitions-&gt;Marathon Matches menu on the TopCoder website, then select <a href="/longcontest/?module=ViewActiveContests">Active Contests</a>. This page lists all past contests as well as any active contests. Next to the active contests will be a link Register/Submit, which allows registration for the contest. 
<br><br>
<span class="bodySubtitle">Finding the Problem Statement</span><br>
The leftmost column in the list of competitions tells you the names of the contests. For completed contests this text is a link to the problem statement; for active contests, however, you must register to enable the link. If the system later believes you to be logged out, it will revert to plain text until you follow the Register/Submit link and log back in (you won't have to re-register). As an example, follow this link to the problem description for the <a href="/longcontest/?module=ViewProblemStatement&compid=5910&rd=10082">Mastermind</a> contest (Marathon Match 2).
<br><br>
<span class="bodySubtitle">Competing</span><br>
As with algorithm contests, the problem description includes specifications of the class you must submit, as well as any public methods it must implement. It will also specify any library functions that are available for your solution to call. Your code needs to match these specifications.
<br><br>
Marathon Matches don't use the TopCoder Arena so you need to use your favorite code editor or create a new project in your preferred IDE. Note that you're not allowed to submit multiple files so your entry must be a single file; if you're using a language where each class must be in a separate file, then you are limited to a single primary class (as specified by the problem description). If your language supports them, then inner classes may be useful in this case.
<br><br>
A good way to test your understanding of the problem statement, and the description of inputs and outputs, is by starting with a very simple skeleton solution. Start by creating a bare-bones implementation of the class described in the problem statement. For example, here is my initial crack at the MapMaker problem, from the Intel #10 contest:

<pre class="code">
class MapMaker
{
     private int numStates;
     private int []area;
     private String []adj;
     public int[] colorStates(int []_area, String []_adj)
     {
          initialize(_area,_adj);
          int []ret = new int[numStates];
          for(int i=0;i&lt;numStates;++i)
               ret[i]=i;
          return ret;
     }
private void initialize(int []_area,String []_adj)
{
          area=_area;
          adj=_adj;
          numStates=area.length;
          System.out.println("There are "+numStates+" states");
     }
}
</pre>

This is a very simple algorithm, which simply assign every state its own color. While not a particularly good or successful solution in and of itself, it does work for us as a starting point because:
<ol>
	<li>We start off knowing that we haven't messed up the class/method signatures.</li>
	<li>We've confirmed our understanding of the return format.</li>
	<li>By printing debug information out (you see your output in test submissions) you can check for really stupid mistakes - that the values you are taking from the inputs are correct.</li>
</ol>
We'll talk more about refining and improving these initial solutions, along with more tips and advice on competing, in Part II. For now, let's assume that you've got a solution which correctly implements the specified class and all required methods, and returns the correct type. Your next step is to submit it...
<br><br>
<span class="bodySubtitle">Got a question? Take it to the forum.</span><br>
Each match has its own discussion <a href="http://forums.topcoder.com/?module=ThreadList&forumID=506052">forum<a/>, accessible from the main TopCoder forums index as well as the "discuss" link on the <a href="/longcontest/?module=ViewActiveContests">Active Contests</a> page. You do not need to be registered in a match to access its forum.
<br><br>
The forum is the place to seek clarification on the problem statement, or for TopCoder to broadcast any official announcements or rule changes - such as changes to the scoring system, to the problem statement or to the end time of a contest. After the match is over you can discuss solutions, your scores on individual test-cases, or even post parts of your code. Keep in mind, however, that you can't discuss these topics until the match is over -- think of the contest as an exam, and the forum as a way to ask for clarification on what a question says. If you have any issues that cannot be discussed on the forum, email them to <a href="mailto:service@topcoder.com">service@topcoder.com</a> for the TopCoder admins to consider.
<br><br>
<span class="bodySubtitle">Submitting your code</span><br>
Once you've registered, surveyed the problem statement, and have a solution you want to to submit, return to the <a href="/longcontest/?module=ViewActiveContests">Active Contests</a> page. From there, select the <b>Submit</b> link (which may appear to be <b>Register</b>/Submit if you have been logged out). and you'll be directed to a page looking like this:
<br><br>
 
<div align="center"><img src="/i/education/codingArea021507.png" alt="Marathon Match Coding Area" border="0" /><br><br>
<b>The submission page</b>
</div>
<br><br>
Basically, it's a simple web-form. At the very top of this page you may change the compiler which will be used on your code (C++, C#, etc); the text control underneath reminds you of the method signatures for this language. Below this are the following controls:

<ul>
	<li>Submission: This large edit field is where you must paste your code. If you've already submitted in this contest, it will normally contain the last submission you made.</li>
	<li>Messages: Before you make your submission, this field is used to communicate any important messages to you. If there's something here then read it before submitting! After making a submission, this box may contain output from the compiler if your code failed to compile, or an error message of some kind.</li>
	<li>Save: Simply saves the current contents of the Submission field. When you make a submission your code is saved anyway but perhaps you'd like to save your code online without testing it for some reason.</li>
	<li>Examples: Submits the current contents of the Submission control as a Test Submission (see below).</li>
	<li>Submit: Submits the current contents of the Submission control as a Full Submission (see below).</li>
</ul>

<span class="bodySubtitle">Test &amp; Full Submissions</span><br>
As mentioned above, there are two types of submission you can make with your code. In each case, your current code in the <b>Submit</b> page is sent to the TC server. Each type of submission has a minimum period between submissions - if you already made the same type of submission too recently, your submission will fail and the <b>Messages</b> control will inform you how long you must wait. Otherwise, your code will be compiled. If this succeeds, your submission will be placed in the queue to be processed and you will be directed to a new page. If compilation fails, you will be returned to the <b>Submit</b> page and the <b>Messages</b> control will be filled with all compiler output generated.
<br><br>
Two things to note:
<ol>
	<li>Only successful submissions reset the timer to prevent you resubmitting within the minimum period - if your code fails to compile you can change it and re-submit straight away.</li>
	<li>The timers which control how frequently you may submit are independent for Test and Full submissions - making a test submission does not reset the timer for full submissions, and vice versa.</li>
</ol>

<span class="bodySubtitle">Test Submissions</span><br>
Each MM has a small number (typically 10) of example test cases against which you can test your solution. These cases are typically generated by hand rather than according to the generator described in the problem statement, and may be smaller than the limits specified in the description too. This is done to facilitate testing. After it completes, you are able to view the score &amp; run-time for each case in a test submission, as well as any text sent to the standard output or standard error.
<br><br>
Test submissions do not affect your ranking - they are provided to allow you to test and tune your code on the TC servers.
<br><br>
The current minimum period between test submissions is 30 minutes.
<br><br>
<span class="bodySubtitle">Full Submissions</span><br>
In addition to the test cases used for test submissions, a separate set exists for full submissions. There are typically 50-100 cases, and they will all be generated automatically before the contest using the generator described in the problem statement.
<br><br>
When you run a full submission, you are not able to see the individual scores or run-times of each case, and no output from your program is visible. In fact the only data you are given from a full submission is your new score in the ranking table.
<br><br>
The current minimum period between test submissions is 4 hours.
<br><br>
<span class="bodySubtitle">System Tests</span><br>
Although a ranking list is updated whenever a full submission is made, at the end of the contest these are not the final scores. Each contestant's last full submission is run against a larger set of test cases, which are generated randomly using the generator described in the problem statement. Typically there are hundreds or even thousands of system test cases - running them all normally takes several days. After this period, the final scores and rankings will be announced.
<br><br>
<span class="bodySubtitle">The Queue</span><br>
All test and full submissions are queued until the resources become available to test them. You can see the state of the queue from the TopCoder Website by choosing Competitions-&gt;Marathon Matches-&gt;<a href="/longcontest/?module=ViewQueue">Queue Status</a>. As you'd expect, entries in the queue are processed in a first-in-first-out manner, entries at the top of the page being processed while new entries are added at the bottom. There is no difference in priority for full and test submissions - if there are 15 full submissions in front of your quick test then you'll just have to wait.
<br><br>
Technically there are actually two queues at this time. C++ and Java entries are processed by one group of computers, and .NET (C# &amp; VB) entries by another. The <a href="/longcontest/?module=ViewQueue">Queue Status</a> page shows all entries order by the time they were queued, but if the queue holds 30 C++ entries and you submit in C# your entry will be processed immediately.
<br><br>
The <a href="/longcontest/?module=ViewQueue">Queue Status</a> page also shows how many tests are left to run on each submission - by refreshing the page you can see submissions being processed.
<br><br>
When your submission comes to be run, there are a number of test cases. Your code will be compiled, and the resulting application run <i>once per test-case</i>. Each instance of your class will only be used for a single test, not re-used several times.
<br><br>
<span class="bodySubtitle">Scores &amp; Stats</span><br>
There's quite a lot of information you can see for past and current MMs. Obviously the ranking table is of most interest, but there's a lot more. You can see who's registered, details of each submission a competitor makes, and you can retrieve the code you used for any previous submissions. For completed contests you can see what score each competitor scored on each of the test-cases, and you can even see the code submitted by other people too.
<br><br>
<span class="bodySubtitle">The Active Contests Page</span><br>
This page isn't named that well, since the majority of what it contains purports to completed contests! The page is essentially a table where each row corresponds to one MM. The columns are as follows:

<ul>
	<li>Contest: The name and number of the contest.</li>
	<li>Problem: For completed contests, and current contests for which you have registered, this is a link to the problem statement. Otherwise it is simply the name of the contest.</li>
	<li>Results/Standings: A link to a page containing current score, ranking &amp; submission data for the contest. We've been looking at MM2 (Mastermind) - <a href="/longcontest/?module=ViewOverview&rd=10082">here</a> are the final rankings for that contest.</li>
	<li>Registrants: The number of people who are registered for the contest. This is also a link to a page where you can see a list of all those who have registered. <a href="/longcontest/?module=ViewRegistrants&rd=10082">Example</a>.</li>
	<li>Competitors: The number of people who have registered and actually made a submission for the contest.</li>
	<li>Submissions: The total number of full submissions made for the contest.</li>
	<li>Start/End Time: The first and last time at which submissions may be made. These times are given in EST (Eastern Standard Time), which is GMT/UTC - 5 hours.</li>
	<li>Forum: A link to the discussion forum dedicated to the contest.</li>
</ul>

<span class="bodySubtitle">The Results/Standings Pages</span><br>
Each current contest has a results page, which shows information on test and full submissions, and shows a ranking list based on each person's most recent full submission. You can see how many test and full submissions each person has made, and when they made them. You can also see the score that was received for all a person's full submissions, and you can access the code of your own submissions (but not your competitors'!)
<br><br>
<span class="bodySubtitle">Standings Page</span><br>
Completed contests have a standings page, which lists the final scores and rankings of each contestant, based on system test results. It provides similar information to the results page during the contest, but in addition you can look at each person's score on each system test case, and the code they submitted.
<br><br>
<span class="bodySubtitle">Match Editorials</span><br>
After each marathon match, an editorial should be published, normally within a week or so. This is often written by the winner of the contest and is a great way to see what the winning guys did - did they all see the same important thing that you missed, or did they use a variety of very different ideas? Editorials show up on the <a href="/tc">main competition page</a> and you can also see the complete set from the menu panel - Marathon Matches-&gt;<a href="/longcontest/?module=Static&d1=match_editorials&d2=archive">Match Editorials</a>.
<br><br>
<span class="bodySubtitle">Practicing</span><br>
TopCoder makes it possible for you to submit a solution for any past marathon match, from the Marathon Matches-&gt;<a href="/longcontest/?module=ViewPractice&rt=14">Practice</a> menu option. This works in almost exactly the same way as a 'real' contest - you use the same submission page and the same queue processes your submissions. If you want to avoid mucking up your marathon rating before you've even got started, it's a good idea to practice on one or two contests before registering for a 'real' one. Don't spend days or weeks trying to beat the top scores, but make sure you understand what's going on - when you compete for real, you don't want to be handicapped because you don't understand how to submit your code!
<br><br>
As an example, here's the practice room for MM2 (<a href="/longcontest/?module=ViewStandings&rd=10084">Mastermind</a>). One bonus of the practice rooms is that you can view the code each person has submitted.
<br><br>
<span class="bodySubtitle">Conclusion</span><br>
We've covered the mechanics of marathon contests - you should understand how the contests work and the process for creating &amp; submitting a solution. Designing and developing that solution is down to you, but I'll leave you with a few tips:
 
<ol>
	<li>Read the problem statement all the way through, and re-read it, then read it again. Make sure you totally understand every detail before going anywhere near any code. It's vitally important to understand not only the problem you're facing, but also the method used for generating the test-cases, and the details of the scoring algorithm. Writing a good heuristic relies on good understanding of the data it will be working on.</li>
	<li>Rushing to get your name on the ranking list is all well and good - getting a skeleton solution to check you understood the requirements is sensible - but you need to stop and think before continuing. You're not going to do well by simply trying things in a random way.</li>
	<li>Be careful of the submit button! You can only make a full submission every 4 hours - don't waste them. And in particular, be very careful about making any submissions near the end of the contest. If you make a test submission 20 minutes before the deadline, the queue might be too full to process it before the end - leaving you unable to make a full submission!</li>
</ol>

Good luck!
        <br><br>
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
