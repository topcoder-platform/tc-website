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
                        <p><font size="4"><strong>TopCoder Competitions vs. The Real World</strong></font><br />
                        Tuesday, April 8, 2003</p>

                        <p>By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=303718"><strong>nicomp</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span></p>
                        
                        <p>Reality Television has become extremely popular. TV networks combine groups of 'average' people, place 
                        them under modest duress, and film the proceedings. Of course the stress of surviving on a jungle island or 
                        selecting a beau from 50 attractive strangers pales in comparison to cranking out the 1000 point problem 
                        in the last 15 minutes of an SRM. Since most TopCoder competitors prefer ones and zeroes to TV, it's 
                        interesting to consider how the SRM paradigm compares to software development in the real world.</p>
                        
                        <h3>TopCoder Competitions relate positively to the real world</h3>
                          
                        <p>The SRM arena offers positive comparisons to software development in the real world. SRM-style problems 
                        require competitors to recognize and apply classic data structures and algorithms. Programming on the job 
                        makes similar demands. A TopCoder problem is relatively brief but still contains liberal helpings of ancillary 
                        verbiage and downright unnecessary information. Life is also replete with red-herrings. From my perspective 
                        the actual coding is less important than the ability to visualize the problem solution. I appreciate the skill 
                        required to filter through excess information in order to identify algorithms and data structures.</p>
                        
                        <p>Deadlines are a fact of life. Pressure applied by programming against the clock approximates the pressure 
                        of on the job deadlines. A real world deadline, however, is hopefully derived by considering the complexity of 
                        the job, the skill of the team, and the requirements of the customer. We should never see an arbitrary time 
                        limit applied to a job, but it has been known to occur. Don't expect your supervisor burst into your cubicle 
                        and insist that "You've got 35 minutes to deliver that linked list" but don't become flustered if it does happen.</p>
                        
                        <p>Every decent software engineering text book emphasizes reusable code. I press such a philosophy into my 
                        students no matter what language I'm teaching. In order to complete 3 SRM problems in 75 minutes one must 
                        have a set of utilities/objects at the ready. In order to develop commercial applications similar types of code 
                        must be available. A programmer may choose to either create or obtain. Professional programmers generally 
                        disdain writing code from scratch unless absolutely necessary. That's not to imply that the world would be 
                        complete with only one binary tree class. On the contrary,  seasoned TopCoders can bolster their resumes 
                        with their own unique implementations of classic algorithms and data structures. As someone who has hired 
                        and fired programmers, I know I'm impressed with those candidates with the skill to write code that can be 
                        reused to solve multiple problems.</p>
                        
                        <h3>What's missing from an SRM?</h3>
                        
                        <p>Before I took part in my first TopCoder competition I visited many of the practice rooms and studied 
                        the solutions of other competitors. My first reaction (being an teacher) was "What's up with these 
                        variable names? Where are the comments?". I shortly realized that no points were awarded for conforming 
                        to coding standards.  One letter variable names take less time to type than more descriptive ones. Comments 
                        only help others during the challenge phase. On the other hand, the mindset of a professional programmer 
                        must be that code is written once to be read many times. An effective SRM solution is written once to be 
                        tested shortly thereafter. As I write production code I tend to ask myself if I'll be able to understand it in 
                        6 months. I understand that I'll often be required to revisit it. My employees labor under the same 
                        expectations. None of us wants our cell phone to ring on Sunday morning because something we wrote is 
                        dividing by zero. If such a problem does arise, however, it's comforting to know that our code will still 
                        be readable. A future SRM might be structured to require competitors to make specific modifications to 
                        past submissions and resubmit for new rounds of system testing.</p>
                        
                        <p>Most software breaks down into 3 broad components: algorithms, input/output, and user interfaces. 
                        TopCoder exercises emphasize algorithmic programming. User interfaces are problematic as they 
                        cannot be objectively tested. Low level I/O programming quickly becomes tedious (how many ways can 
                        you query a port?). At the high end we find specialized languages such as SQL rather than C++ or Java. </p>
                        
                        <p>We live in a microwave society. We can prepare popcorn in 3 minutes or we can retrieve 42 biographies 
                        of Grace Hopper by simply asking Google. TopCoder provides almost instant gratification with a submission 
                        score,  system test, and rating points all in less time than the average commute. The development cycle of 
                        most production code lasts a bit longer. Gratification tends to come in smaller increments over extended 
                        periods. Your code depends on the work of others including salespeople (argh!) and supervisors. Your best 
                        work may suffer interminable delays or never reach its intended audience through no fault of your own. 
                        Hopefully you will still get paid.</p>
                        
                        <h3>Conclusion</h3>
                        
                        <p>I conclude that TopCoder provides an extremely useful metric for programmers. SRMs do not challenge 
                        all aspects of software development but the algorithmic portion of programming is implemented in such 
                        way as to mirror Real World endeavors. Any job seeker would be prudent to enhance their portfolio by 
                        leveraging the services offered by TopCoder. It's also a lot of fun for geeks like me.</p>
                        
                        <h3>Biography</h3>
                        
                        <p>Bill Nicholson graduated from the University of Cincinnati Engineering College in 1982 with a degree 
                        in Engineering Science. His first real job was writing engine control software in 6801 assembly language 
                        for General Motors. From there he found work developing warehouse management systems in C and then 
                        C++. Currently he owns Nicholson Computer Consulting in Cincinnati, Ohio. He also teaches C++ and 
                        Visual Basic at Cincinnati State Technical and Community College.</p>
                        
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

