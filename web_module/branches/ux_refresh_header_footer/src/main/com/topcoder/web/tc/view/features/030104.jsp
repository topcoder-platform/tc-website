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

                        <p><font size="4"><strong>The Educational Component of TopCoding</strong></font><br />
                        Monday, March 1, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=290395"><strong>pmadden</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
In the real world, I teach graduate and undergraduate algorithms at an
upstate New York university; for the past year, I've been requiring my
students to compete in SRMs (Single Round Matches).  While there's a wide range on how well
the students do, and I've destroyed the university TopCoder rating,
most are better off for the experience.</p>

<p>As a new semester has begun, and there will be the usual
flurry of "why do you make us do this" questions, it's a good time
to talk about the benefits (and also pitfalls) of TopCoding.
My objective is to make my students smarter and more
competitive in the job market.  While writing software is by no means
the only thing a computer scientist needs to do, it is a fundamental
skill.  A weak coder is sure to have problems in many other areas, and
the best way to improve is to buckle down and start writing.</p>

<p><span class="bodySubtitle">Benefits</span><br/>
While there's a long list of things I like about TopCoder, I see
the main educational benefits to be the following.</p>

<ul>
<li><b>TopCoding requires mastery of a language</b><br/>With normal classroom assignments, there's enough time for a poor programmer to stumble through the textbook, recompiling for hours on end, finally cobbling together something that works.  In the arena, as well as in a real job, there's no time for this.  If an employee needs two days and the help of a friend to put together "Hello World," they'll be out on the street in no time.  The hard time limit of the arena makes it easy for a professor such as myself to find and help the students who have weak coding skills. </li>
<li><b>Algorithms figure prominently</b><br/>While some SRM problems are simply hacking exercises, many require knowing and being able to code classic algorithms.  I doubt that there are any Div-1 coders who don't know Dijkstra, Floyd-Warshall, Quicksort, or 0-1 knapsack off the top of their heads; for a computer science career, being able to recognize problem structures is essential.</li>
<li><b>Creativity is required</b><br/>In most university courses, there's an "expected answer" that is hinted at in the textbook.  With an SRM problem, the time limit requires creativity and new thinking.  One SRM pushed me into thinking about an old problem in a new way--resulting in one of my recent research publications, and a probable dissertation topic for one of my PhD students.  While one might wish to have a university course teach "creativity," this is extremely hard to do.</li>
<li><b>Competition is Good</b><br/> Head-to-head challenges bring out the best in anyone.  With TopCoder, grey coders strive to become red, Div-2s hope to break into Div-1; all it takes is patience, effort, and the will to improve.  I've noticed that both grad and undergrad students become more serious about their studies after getting trounced by a 13-year-old kid in his bedroom half a world away.</li>
</ul>

<p><span class="bodySubtitle">Pitfalls</span><br/>
While there are many good things to be said about programming challenges,
there are some real dangers as well--things that everyone should be
aware of.</p>

<ul>
<li><b>Not all of Computer Science is Hacking</b><br/>
 There is a great deal to learn that has little to do with writing
 software; hardware, operating systems, formal languages, theory.  I
 would hope that no one would construe my belief that coding is
 important with the idea that it's the only thing one needs to know.
 In my career, I find that what I learned in my English classes is as
 important as anything else.</li>

<li><b>Not all problems should be solved in 75 minutes</b><br/>
 To say that some correct SRM solutions are poorly designed would be
 an understatement.  TopCoder has design competitions for good reason;
 the best solutions may take weeks or months to develop, so that the
 code is robust and useful in many different situations.</li>

<li><b>Not all problems should run in less than 8 seconds</b><br/>
 For any problem, there may be a number of different solutions.  As an
 algorithms buff, I find myself looking for the lowest big-O
 complexity solution, rather than something that takes very few lines
 of code.  So, while I'm working on a tricky O(n log n) convex hull,
 someone else cranks out a brute force solution in a fraction of the
 coding time.  In the real world, the more efficient algorithm might
 be the right way to go; in the arena, that's seldom the case.</li>
 </ul>

<p><span class="bodySubtitle">Conclusion</span><br/>
From the outside, SRMs might look like an exercise in hacking.  There
is, however, a great deal to be learned by good students, poor
students, professionals, and even a university professor.  As should be
obvious from my first few competitions, I learned C++ in the arena.</p>

<p>While it may be uncommon to find TopCoder in a university course
today, over time this may change.  Time constrained challenges are a
great way to sharpen coding chops, and better coders produce much more
reliable software.  The Association for Computing Machinery understands
this--they've been doing competitions for thirty years.  Perhaps it's
time for mainstream academia to get with the program.</p>



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
