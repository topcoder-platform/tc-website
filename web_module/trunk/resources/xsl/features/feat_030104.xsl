<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <html>
      <head>

        <xsl:call-template name="Preload"/>      

        <title>TopCoder | Features</title>

        <xsl:call-template name="CSS"/>      

        <meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

      </head>

      <body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

        <xsl:call-template name="Top"/>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">

            <xsl:call-template name="global_left"/>

        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="bodyText" width="100%">
        
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">features</xsl:with-param>
                <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td colspan="3"><img src="/i/clear.gif" alt="" width="1" height="21" border="0"/></td></tr>                        
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%">         
                        <p><font size="4"><strong>The Educational Component of TopCoding</strong></font><br />
                        Monday, March 1, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=290395"><strong>pmadden</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
In the real world, I teach graduate and undergraduate algorithms at an
upstate New York university; for the past year, I've been requiring my
students to compete in SRMs.  While there's a wide range on how well
the students do, and I've destroyed the university TopCoder rating,
most are better off for the experience.</p>

<p>As a new semester has just started, and there will be the usual
flurry of "why do you make us do this" questions, it's a good time
to talk about the benefits (and also pitfalls) of TopCoding.
My objective is to make my students smarter and more
competative in the job market.  While writing software is by no means
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
While there are many good things to be said about programming contests,
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
today, over time this may change.  Time constrained contests are a
great way to sharpen coding chops, and better coders produce much more
reliable software.  The Association for Computing Machinery understands
this--they've been doing competitions for thirty years.  Perhaps it's
time for mainstream academia to get with the program.</p>

                        <p><br/></p>

                        <p>Would you like to <a href="/?&amp;t=features&amp;c=feat_topics" class="bodyGeneric">write a feature?</a></p>
                    </td>
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>                                                                 
            </table>
            <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

            <xsl:call-template name="public_right_col"/>       

        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

