<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="../script.jsp" />
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">

            <h2>Competing <tc-webtag:handle coderId="144400"/>-style</h2>

      <p>
      <img src="/i/m/brett1479_mug.gif" alt="" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<tc-webtag:handle coderId="251317"/><br>
      <span class="smallText"><em>TopCoder Members</em></span><br clear="all" />
      </p>

<a name="introduction"></a>
<span class="bodySubtitle">Introduction: A Recipe for Success</span><br/>
Ever wonder what allows certain TC members to solve 3 hard problems in under an hour, while others
struggle to submit a single solution?  This question has both fascinated and puzzled me for some
time.  
<br><br>
Since his first competition 2 years ago, <tc-webtag:handle coderId="144400"/> has consistently dominated in the arena.  Perhaps most
impressive is his stellar tournament record.  Seemingly unfazed by the high stakes, <tc-webtag:handle coderId="144400"/> always
competes at a practically unbeatable level.  What allows him to win so frequently under any and all
circumstances?  What are the secrets behind <tc-webtag:handle coderId="144400"/>'s skill?
<br><br>
<span class="bodySubtitle">Natural Born Competitor</span><br>
As early as elementary school <tc-webtag:handle coderId="144400"/> was participating in math competitions.  These opened the
doorway to Polish science camps, and eventually the opportunity to study abroad in England.  In high
school, at the Polish Olympiad in Informatics, <tc-webtag:handle coderId="144400"/> began to show interest in the theory of
algorithms.  Years later, during ACM contest training, he was able to hone these skills and help his
team win at the World Finals.  If it hasn't become clear already, <tc-webtag:handle coderId="144400"/> loves to compete.  Through
this passion, he has had many achievements, and reached a level attained by few.
<br><br>
I have spoken to many people about their careers, academics, hobbies, and lives in general.
Frequently their eyes light up while describing the projects they work on, or the goals they have
set for themselves.  Too often these aspirations are pushed aside and forgotten.  Most amazing is to
later see someone who conscientiously followed their pursuits, since they typically bear no resemblance to
their former self.
<div style="padding: 15px;">
<b>Brett</b>: <i>Suppose someone paid you to be their personal coach.  They come to you every day for
advice. What is your plan?</i><br/>
<b><tc-webtag:handle coderId="144400"/></b>:  <i>I guess I would try to figure out what they like doing (like competitions for me).  Then
tell them to be really good at it, and hope that then they can make living out of it.</i>
</div>

<span class="bodySubtitle">University Highlights</span><br>
Discussing university courses, <tc-webtag:handle coderId="144400"/> and I
agreed that professor quality is frequently more important than subject matter.  At the University
of Warsaw, Krzysztof Diks and Marcin Kubica were two of his favorite lecturers.  When
asked which courses he liked best, <tc-webtag:handle coderId="144400"/> replied with the following lists:
<ul>
<li>Favorite CS Courses: Algorithms, Introduction to Programming in OCAML, and Automata Theory.</li>

<li>Most Useful Courses: Probability and Statistics (with Calculus), Algorithms, and Discrete Mathematics.</li>
<li>Favorite Math Courses: Advanced Calculus, Set Theory, and Logic.
</ul>
Being an educator, I am interested in the educational choices made by the professors at other
institutions.  As such, I was surprised to learn that all CS majors at Warsaw are required 
to take separate courses in Set Theory and Logic.  These two topics, which have always 
been personal favorites, are rarely mandatory CS courses.
<br><br>
<span class="bodySubtitle"><tc-webtag:handle coderId="144400"/>'s Picks</span><br>
Our school conversation finished with a discussion about great books.  <tc-webtag:handle coderId="144400"/> said the
following resources proved most useful for TopCoder.
<ul>
<li><i>Introduction to Algorithms</i> by Cormen et al. - Assuming you have the mathematical maturity, this
text provides an excellent treatise on algorithms.  <tc-webtag:handle coderId="144400"/> mentioned how this book entertained him
during the less eventful nights he spent in England.</li>
<li><i>Concrete Mathematics</i> by Knuth et al. - An interesting and sometimes quirky textbook covering the
core mathematical prerequisites for Computer Science.  This was used in the Discrete course at
Warsaw University, and proved both educational and enjoyable.</li>

<li><i>Programming Pearls</i> by Jon Bentley - A great book that helps to develop your &quot;approach&quot;
to coding.  An easy read containing many invaluable coding tips.</li>
<li><a href="http://spoj.sphere.pl">Sphere Online Judge</a> - Great resource for programming practice.</li>
</ul>
<span class="bodySubtitle">Competition Tips</span><br>
Preparation only gets you so far.  Once the competition begins, your skills are put to the test.
Here are some tips from the master competitor:

<ul>
<li><i>Have a strategy planned before the competition.</i> <tc-webtag:handle coderId="144400"/> said his ACM team had, down to the
minute, a schedule planned for each round.  This itinerary even included mandatory breaks for strategic
planning.
</li>
<li><i>Plan out your entire solution before you start typing.</i> If necessary, make notes about all
necessary data structures and algorithms on a piece of paper.
<div style="padding: 15px;"><i>
"Generally, I don't want to make decisions during coding.  
Coding should be quick and one should concentrate on not making mistakes rather than thinking about
the solution."
</i></div>
</li>
<li><i>Proofread your code believing you have an error in it</i>.  <tc-webtag:handle coderId="144400"/> says this `self-deception' is
immensely helpful.
</li>
<li>And last but not least, <tc-webtag:handle coderId="144400"/>'s step-by-step problem solving guide:
<ol>

  <li><i>Transform English into math.</i>  Resolve problem ambiguities.  Verify your understanding by
  perusing the example cases.  Examine the constraints for useful information.  Before you can solve
  the problem, you need to know what is being asked.
  </li>
  <li><i>Search for an algorithm.</i>  For easy tasks, you may recognize the solution immediately.
  If not, try to decompose the problem into simpler subproblems.  If neither of these work, give
  yourself time to discover the answer while you work on each example case by hand.
  </li>
  <li><i>Knowing when to move on.</i> Don't lose the competition just because you are angry at one
  problem.  The next problem may be better worth your time.
  </li>
  <li><i>Sketch it out.</i> Unless the solution is trivial, sketch out the details on
  paper.  Make a note stating the purpose of each data structure.  Label what each function does,
  and what the parameters hold.  Write some very terse pseudocode if necessary.  The amount of
  writing varies with ability and experience.  Don't start typing until everything is laid out.

<div style="padding: 15px;"><i>
"I learned this at ACM practice - being forced to work on paper with 
no terminal access, I found I would solve the problems quicker."
</i></div>
  </li>
  <li><i>Type it in.</i> At this point, the thinking is over.  Your mind is free to proofread while
  you code.  Practice is required to make this step automatic.  In Chess, if you don't know how the
  pieces move, you can't even play, let alone strategize.  At TC, this means being comfortable with your
  preferred programming language and the associated libraries.  The problems are hard enough
  without having to fight with the compiler.
  </li>
  <li><i>It doesn't always work the first time.</i>  Sometimes you have a small bug.  Other times
  you need to optimize.  Worst case scenario, your solution is fundamentally flawed.  It is
  frequently easier to scrap it and start fresh than patch a broken implementation.</li>
<div style="padding: 15px;"><i>
"At the last TCCC my solution was a bit too slow and I never got it to work but could have easily rewrote it."

</i></div>
</ol>
</li>
</ul>
<span class="bodySubtitle">Final Remarks</span><br>
Will carefully following all of the steps listed here make you <tc-webtag:handle coderId="144400"/>?  Probably not, but they could
make you much better.  And who knows? Take a little motivation, combine it with some focussed
training, and maybe you will make a name for yourself in the arena.  People might 
start asking you for advice on how to improve.  Perhaps there will be an article with your name on
it.
        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
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
