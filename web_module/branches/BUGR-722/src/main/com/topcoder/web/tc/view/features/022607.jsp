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

<span class="bigTitle">An Introduction to Marathon Matches, Part 2</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/d000hg_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="21464956" /><br>
      <em>TopCoder Member</em>
</div>

<br clear="all">
<p>
In part I, we looked at the basic mechanics of how Marathon Matches work - from finding the problem statement to registering for a match and submitting your solution. Perhaps you've been inspired to take a look at some of the problem statements from past marathons, or to review some of the winning submissions - and, if you're like me, I'm willing to bet you found some of them pretty intimidating. 
</p>
<p>
Don't be dismayed, though. While competing in a marathon match may seem like signing up for an intense one- or two-week software development project - and it can certainly feel like that at times - it is possible to make a good showing in a match without sacrificing too much sleep. In this article, we'll look at how you can approach marathons in a more organized, efficient and professional manner. It's up to you to design the winning algorithm, but this article should help make the time you spend more productive.
</p>
<p>
To try and make things relevant, we'll follow the lifecycle of a specific past marathon match. I've chosen the <a href="/longcontest/?module=ViewProblemStatement&compid=6097&rd=10123">10th Intel marathon</a>, because we can create short solutions for this problem (I wanted to illustrate with real code without drowning you in it). In any case I'm not trying to teach you about any algorithms -- for that, the problem editorials are a better guide. Before we begin, go read that problem statement a couple of times.
</p>
<p>
<span class="bodySubtitle">Starting Out</span><br>
One of the key points I want to hammer home is the importance of being organized. Please don't rush off and start banging out code -- this match is going to take some time, so there's no need to rush.
</p>

<p>
<span class="bodySubtitle">Getting Ready</span><br>
Begin by creating a new folder (or "directory," if you don't like Windows terminology). I have a folder for each marathon match, so I called my folder for this match "IntelMT10," but any system that's easy for you to remember will work. If you use an IDE, like Visual Studio or NetBeans, creating a new project in this folder is a good idea too.
</p>
<p>
As you may remember from Part I, your marathon submission can only consist of one file - nevertheless, I usually start off with two files in my project folder. One will be the actual class I want to submit - MapMaker.java/cpp/etc -- and one will be any code I want to run on my PC but will not submit to TC, which I'll call Main.java/cpp/etc. Typically this will contain some code which simulates the TC tester, allowing me to run tests locally (but more on that later). 
</p>
<p>
I also always save a local copy of the problem statement to this folder and print a paper copy, but that's just preference. I would recommend that you save a copy of the example tests, though -- maybe to a folder called "tctests." When you write your own tester, you can run it on these inputs to compare your tester against TopCoder's. It would be frustrating to work for two weeks only to find your tester's scoring formula was wrong!
</p>
<p>
<span class="bodySubtitle">Creating a Skeleton Submission</span><br>
A good way to test your understanding of the problem statement and the description of the inputs and outputs is by creating a very simple solution. Start by creating a bare-bones implementation of the class described in the problem statement:
</p>

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
            for(int i=0;i&gt;numStates;++i)
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
<p>
As I mentioned in Part I, a trivial solution like this has several uses when used as an initial example test:

<ol>
	<li>We start off knowing we haven't messed up the class/method signatures.</li>
	<li>We check we understood the return format.</li>
	<li>By printing debug information out (you see your output in test submissions) you can check for stupid mistakes, and that the values you are taking from the inputs are correct.</li>
</ol>
</p>
<p>
<b>Write Clear, Structured Code</b><br>
You'll notice that I don't have just one method for doing everything. First I store all the inputs -- now any methods I choose to create can access them. Second, I've started off with the plan to create sensibly named and scoped methods. I want each piece of functionality to be in its own method so that I can alter one piece of my solution later on without having to worry about messing up the other pieces. 
</p>
<p>
<b>A Full Submission?</b><br>
Now, I often have the urge to make a full submission at this point. I try to restrain myself, though - all I would be doing is wasting time and blocking the queue, purely for the sake of seeing a (low) score on the leaderboard. If you're one of the first to register you could be in first place, but so what? You won't stay there for long. If you get into the habit of making a full submission every time you eke out a tiny improvement, by the time the week is over you will have spent several extra hours just refreshing the queue status page, while your competitors are using that time to improve their algorithms.
</p>
<p>
<span class="bodySubtitle">Build a Local Tester</span><br>
<i>"The first 4 hours &#8230; I usually spend writing a testing framework, which includes a test case generator, a primitive solution and directly a tester."</i> - <tc-webtag:handle coderId="21932422" /> <i>(five top-4 finishes during the Intel series)</i>
</p>
<p>
<i>"I always implement a complete tester"</i> - <tc-webtag:handle coderId="20436799" />
</p>
<p>
It's entirely possible to perform all your tests by running test submissions, but one thing the top marathon winners have in common is that they always write a local tester. This code implements the algorithm described in the problem statement to generate test cases, runs your submission against these cases, and scores the result against the scoring algorithm. It can seem an effort to write this code, but consider this: in MM10 ContinuousDiscretizedPacMan, <tc-webtag:handle coderId="7459326" /> deliberately entered a submission which was not his highest scoring one. He realized that the number of cases TC tested against was not enough to give a true picture of his algorithm's ability, and locally wrote a tester which ran his submission against 5000 randomly generated cases. He submitted what this tester told him was the best submission. The system tests proved him right, and he won the match.
</p>
<p>
The scores you get on test submissions are useful, but there are far too few to explore the whole range of input parameters. Even a full submission typically has 100 or fewer cases, which is still not enough -- and you don't get individual scores back on them, either.
</p>
<p>
By making your own tester, you can create as many random cases as you want, or you can create tests for particular edge or corner cases.
</p>
<p>
Try not to spend more than a few hours on your tester, maximum. This code isn't going to be seen by anyone else and once it works you can forget about it -- so this is one place where quick and dirty code is fine. However, you do need to make sure it is correct, perhaps by single-stepping through it and checking that the algorithms from the problem statement are being followed exactly. 
</p>
<p>
One other caveat: I would advise against testing only on a local tester. It's pretty common for people to find that the scores they predict are quite different from the scores given by TopCoder, due to some slight mistake in score calculations or a minor bug in generating test cases. That's why it is great to make sure you can run your code locally against the example cases TopCoder uses - if there are differences which can't be attributed to your PC being faster or slower than the TopCoder servers, you need to fix them! 
</p>
<p>
<span class="bodySubtitle">Working on Your Solution</span><br>
<br>
<b>Thinking</b><br>
<i>"I spend only about 5-10 hours coding, while thinking the whole 2 weeks."</i> - <tc-webtag:handle coderId="21932422" /> 
</p>
<p>
Right then. You've got a nice project folder set up and organized, you've got a way of testing your algorithms locally, and you've written an extremely simple solution. Now you're ready to start&#8230; but how? Well for a start, the really good guys aren't generally in a rush. This is how <tc-webtag:handle coderId="20436799" /> begins a match: 
</p>
<p>
<i>"I read the problem statement two or three times, first to get an idea of the problem and later to get all the details and constraints. After reading the problem statement, I keep checking the forums, as many details which I might have missed are usually posted there by other people, and at the same time I try to figure out some naive approaches. After that, I just let the problem float around in my head for a couple of days before starting to code anything."</i>
</p>
<p>
The majority of the work in a marathon match is not turning your algorithm into code, but designing the algorithm in the first place. I'm not that great at solving these problems, but I've found that I definitely do better by spending some time thinking before I write a serious submission, and it's essential that I take the time to write out my ideas on paper first. I try and think of high-level ways to view the problem, then follow those paths to see where they go.
</p>
<p>
<b>Coding</b><br>
<i>"I would say that I spend 70% thinking about the solution and only 30% coding, debugging and optimizing."</i> - <tc-webtag:handle coderId="20436799" />
</p>
<p>
If you're a genius you might be able to predict fairly well what a particular algorithm will score before you even touch the code, but most of us can't manage that. When you do decide to start writing code, don't get hung up on optimizing it. The thing I waste most time on is tuning parameters. I'll be in 30th place with half the score of the leader, but instead of realizing that my algorithm just isn't good enough I'll spend a day or two trying to get a 10-50% improvement. Tuning parameters is very important, of course, but only after you've got an algorithm you're happy with -- as soon as you change the algorithm all that tuning has to be repeated. Tweaking the algorithm is much more profitable but it's still very easy to find yourself trapped in a cycle of changing a value a little and re-testing. You need to realize that the top marathon competitors are not only very smart, but also tend to be good at focused thinking -- while you're trying to get close to their scores by tuning, they're still honing their algorithms and haven't even begun tuning.
</p>
<p>
<b>Thinking some more</b><br>
I have my initial thoughts written down and things are going quite well, but then somehow I find myself directionless, making minor changes in an automatic way, while people overtake me on the leaderboard. You need to be on the lookout for this -- once you've done everything on your piece of paper, get off the PC and start thinking again. In what particular scenarios does your algorithm fail? Are you trying to evaluate every possible move and using too much time? What assumptions is your heuristic making, or which things is it not considering?
</p>
<p>
At this point, when I have a solution but need to improve it, I tend to sit and think for half an hour, simply writing down a list of everything that might improve my algorithm. Then, I'll try and estimate how hard each would be to implement. That's not too difficult -- the harder part is trying to estimate how useful each change might be. The result of this is an ordered to-do list, which I can then start working my way through. Of course some of the ideas won't work, but odds are at least few will be effective. 
</p>
<p>
<span class="bodySubtitle">Keeping Track of Things</span><br>
I'm sure ever coder has had the situation where they've changed some code, only to find it no longer works, and they <i>can't remember what they changed</i>. This kind of problem is easy to run into in a marathon match - for example, you make a small change and it seems good. You make some more changes and then want to revert to what you had originally. It seems to look like it used to, but somehow your score is down by 2%.
</p>
<p>
<b>Versioning Your Code</b><br>
I quickly disciplined myself to use versioning. Of course, the ideal would be to have a real source control setup, in which you check the file out every time you want to make a change and don't make another change without either reverting to a previous version or checking the file back in. If you have a source control database on your PC, you really should be doing just that.
</p>
<p>
But most of us probably don't want the hassle of configuring a source control database. For a marathon match, where you're basically changing just one file, you can just as easily save each version to a different name. Here's what I do:

<ol>
	<li>In my marathon match folder I create a sub-folder called "old versions".</li>
	<li>Each time I make a submission, I save a copy of my code e.g. "old versions/MapMaker_4.java".</li>
	<li>If I want to see what on earth changed, I use a free diff tool.</li>
</ol>
</p>
<p>
I tend to make copies of my full submissions only, but I still get problems sometimes. I could save backups of every test submission, or every change I make, but without source control the sheer number of files involved would make finding the ones I want that much more difficult.
</p>
<p>
You can get all your old submissions off the TC server, but it's a bit of a pain when you need to do a diff, and if you have test code which you cut out when submitting(like debugging code) this will obviously be missing.
</p>
<p>
<b>Save Your Score Data</b><br>

<div align="center"><A href="/i/education/022607_1_lrg.png" target="blank"><img src="/i/education/022607_1.png" alt="" border="0" style="margin-top: 10px 10px 0px 10px;" /></a><br>(click to enlarge image)<br><br></div>

This is my results sheet from MM11 - SnakePlayer, but I use something very similar in every marathon match. Basically I have a spreadsheet in my marathon match folder, with a column for the score and run-time of each example test case. I enter these values into each row for each example submission I make. I also have columns which automatically calculate the average score and run-time for each example submission. The <b>%change</b> column shows the percentage improvement of each submission over the previous one. Finally the <b>%of best</b> column shows how close each submission's average is to my best score.
</p>
<p>
There are all kinds of extra columns and tables you might want to add. However you do it, I recommend saving this data. One note: you need some way to link your saved versions against their scores; it could be very time-consuming otherwise if you decide to re-submit an older version after failing to make further improvements. Typically you'd be doing this at the end of the contest, and you don't want to face the frustration of submitting the wrong version when it's too late to submit again!
</p>
<p>
<span class="bodySubtitle">Conclusion</span><br>
</p>
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
