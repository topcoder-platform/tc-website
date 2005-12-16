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
                        <p><font size="4"><strong>All I really need to know about Software Development I learned from TopCoder</strong></font><br />
                        Thursday, April 29, 2004</p>

                        <p>By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251184"><strong>dplass</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
<p><b>Introduction</b><br/>
With apologies to <A href="http://www.amazon.com/exec/obidos/tg/detail/-/0449908577/qid=1077503500/sr=1-4/ref=sr_1_4/104-2097518-7471167?v=glance&amp;s=books">Robert Fulghum</A>, here is my interpretation of TopCoder being a microcosm of the Software Development world.
</p>

<ol>
<li>
<p><span class="bodySubtitle">Well-worded problem statements can make a big difference.</span><br/>
A clearly-written problem statement allows the coders to internalize the problem easier and start coding faster.  A variety of examples help you figure out what was meant in the prose.  Part of this <A href="http://www.topcoder.com/rtables/viewThread.jsp?forum=7167&amp;thread=241905&amp;mc=43">round table thread</A> discusses this exact topic.
<br/><br/>
In the "real world", a good requirements document, or a well-written specification, is worth its weight in gold.   The designers know what to design, and can hand the coders a more complete design as a result.  Confusion is reduced, and re-work can be eliminated.  The guess-work is taken out of coding and the coders can complete their job with fewer bugs.
</p>
</li>
<li>
<p><span class="bodySubtitle">Think before you code</span><br/>
During an SRM, instead of just starting to hack away at a problem, I stop and think for a minute or two, or ten.  I take notes and maybe jot down an algorithm.  This has definitely helped me improve.  The same thing applies in software development.  Take a moment to write down what you're going to code before you code it.  Show it to someone so they can review it and, in some companies, approve it, before you code.
</p>
</li>
<li>
<p><span class="bodySubtitle">Test early, test often</span><br/>
TopCoder SRMs are notoriously insensitive to bugs.  You should start testing even before your code is complete!  Sometimes, especially on a medium or hard problem, I'll write a section at a time, and test it as I go along.  Also, don't just test on the "samples" - you should run as many possible test cases as possible.  One failed system test case, and you're sunk.
<br/><br/>
A major tenet of Extreme Programming , a very popular software development paradigm, is to test, test, test.   You are advised to write the tests BEFORE you write the code!   Another variety is called "Test-Driven Development," in which each phase of development is driven by its own testing phase.
</p>
</li>
<li>
<p><span class="bodySubtitle">Test your code or someone else will test it for you</span><br/>
Ah, the challenge phase.  Having recently been burned by this, I can attest that the more you test your own submissions BEFORE you submit them, the better.  Otherwise, someone else will find that elusive (or maybe not-so-elusive) bug and pick up 50 points in the process.  Had I just remembered to write ">=" instead of "==", I might've gotten those 216 points.  Instead, someone else found it, and I'm out.
<br/><br/>
In the "real world", the last person you want to test your code is your customer.   When a bug is exposed by the end-user, it's worse than just losing 216 points.  Your company's reputation is on the line.  Your competition is ready to pounce at the first sign of weakness (hmm, sound familiar?)  Not to mention the potential lost sales might result!  Testing is one of the fundamental tenets of many software development methodologies (see above, "Test early, test often").
</p>
</li>
<li>
<p><span class="bodySubtitle">Finding a bug during the coding phase is cheaper than during the challenge phase, is cheaper than during systest</span><br/>
If you find your bugs during the coding phase, and submit the solution for, say, 200 points, you'll get 200 points.  If someone finds it in the challenge phase, you'll be out 200 points, but at least someone got 50 points for it.  The overall "benefit" to society is 50 points.  However, if nobody finds the bugs during coding OR challenge phases, you'll be out 200 points, and nobody will get the 50 points.  The overall "benefit" to society is zero.
<br/><br/>
In software development, it has been proven time and again, that when bugs are found earlier in the process, the better.  Finding a bug in one phase can be 5 to 10 TIMES cheaper than finding it in the next phase.  Finding a bug during requirements is 5 cheaper than finding it in design; finding it in design is 5 times cheaper than in coding; findng it in coding is 5 times cheaper than in testing, and finding it in testing is 5 times cheaper than in production. This effect multiplies - so if you squash that bug in requirements phase, it is 25 to 1000 times cheaper than finding it (and fixing it!) in production.
<br/><br/>
So fix those bugs NOW!
</p>
</li>
<li>
<p><span class="bodySubtitle">Spelling counts</span><br/>
A spelling error cost at least two coders the "easy" Div 1 problem, in a recent <A href="http://www.topcoder.com/index?t=statistics&amp;c=srm176_prob">SRM</A>.  They spelled SQUIGGLE wrong, and it cost them points.
<br/><br/>
When you're writing code, sometimes the only person reading it is you.  The occasional typo doesn't affect the operation of the program.  But, when developing a website, or end-user software, spelling counts!  If you spell your client's name wrong, they'll not take it lightly.  Even if an error message has poor grammar or incorrect spelling, that will reflect on your ability. 
</p>
</li>
<li>
<p><span class="bodySubtitle">Speed matters</span><br/>
All of the above doesn't matter if you don't have the speed!  In TopCoder competitions, whether they are on-line or in-person, you have to be fast.  This might be obvious, but the faster you are, the more points you get.  Also, the faster you complete one problem, the more time you have to solve the other problems.  Since there is a limited amount of time for SRMs, if you take 1 hour and 16 minutes to come up with a perfect solution, it won't be worth anything.
<br/><br/>
In software development, the same holds true at two scales:
<ul>
<li>For the individual developer, the faster you complete one task, the faster you can complete ALL your tasks.  More tasks completed means the boss is happier (he gives you more "points").</li>
<li>For the company as a whole, the faster the product gets to market, the better.  If you trump your competition, you can enjoy larger market share, more sales, etc.  More sales means your boss's boss is happier (she gives you and your boss more points.)   Getting a robust product faster means the customer is happier so he gives you more points too.</li>
</ul>
<br/>
Sometimes, unfortunately, in both TopCoder and software development, even if you're first-to-finish, you don't always succeed.  In TopCoder, if someone has more successful challenges than you, they might just edge you out even if you were faster.  Similarly, take Netscape as an example; even though they had one of the first widely-available browsers, they were "challenged" by Microsoft and lost.
</p>
</li>
<li>
<p><span class="bodySubtitle">There are people who can help</span><br/>
During an SRM, if you have a question, the admins are always there to help.  (Well, they try to help...)  Seriously, though, there is always someone to answer the question.  Also, the round tables are a great place to ask questions and make comments, whether they are in reference to a SRM, a write-up, or a general algorithmic question.
<br/><br/>
In software development, your project manager, senior developer, or other "mentor-type-person" is the person to go to.  They're the one who can answer your questions.  Similarly, there are literally hundreds of on-line sources to get your questions answered about your development language, compiler, environment, operating system, database, etc .etc. etc.
</p>
</li>
<li>
<p><span class="bodySubtitle">There's money to be made!</span><br/>
I finally was able to make money coding!  After making it to the third round of the 2003 TopCoder Open, I was the proud recipient of a $75 check from TopCoder.
<br/><br/>
Believe it or not, in the real world, you can be paid to code on a regular basis!  Seriously, despite downturns in hiring in software development, the number of unfilled software jobs is still predicted to rise for many years to come.   I myself recently got a new job, near my home, doing exactly what I wanted.
</p>
</li>
<li>
<p><span class="bodySubtitle">Don't judge someone by their "color"</span><br/>
TopCoder can teach us a life lesson.  Just because a coder is a "gray" doesn't mean they don't have something to contribute.  Conversely, just because a coder is red doesn't mean they have the answer to everything.   In a recent <A href="http://www.topcoder.com/rtables/viewThread.jsp?forum=7167&amp;thread=238721">round table discussion</A>, a "blue" coder came up with a solution to a research question before a "red" coder did.
<br/><br/>
Professionally, everyone's ideas are important and should be given a chance, from the newbie HTML coder, to the hot-shot Java guru.  You never know from whose brain the "next big thing" will come from.  By mentoring and listening to junior developers, you can foster team morale and improve everyone's performance.   The hoary software architect can learn new things as they teach, and vice versa.
</p>
</li>
<li>
<p><span class="bodySubtitle">Have fun</span><br/>
At the top of my Mantra list is now "Have Fun".  It's important to remember that!  (I know I have a hard time remembering that too.)   The instant gratification of software development is probably one of the reasons it is one of the most popular university majors.  And admittedly, it is a lot of fun.  So go out there, have fun, and write some great code!
</p>
</li>
</ol>
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

