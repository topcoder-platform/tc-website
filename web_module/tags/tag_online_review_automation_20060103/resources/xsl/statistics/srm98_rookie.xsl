<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
       <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm98_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 98</B><BR/>
June 19, 2002</P>
<P><B>Rookie Review</B></P>

<B>Coding Phase</B>
<p>
            There were only four rookie rooms in SRM 98.  In 
        Room 60, only <B>purpleurple</B>
            submitted solutions to all three problems, for a total of 954.81.  However, he was followed not too far behind by
            <B>Celeborn</B>, with 608.92 points from two submissions.
        </p>
<p>
            In 
        Room 61, <B>bchadwick</B> submitted three solutions for 1122.82.  <B>jewphoria</B>
            followed far behind with two submissions for 584.50 points.
        </p>
<p>
            
        Room 62 saw the most submissions, where six coders submitted solutions to all three problems.
            <B>liviutzu</B> led the pack with 1269.22 points.
        </p>
<p>
            
        Room 63 had nearly the same amount of submissions as 
        Room 62, with five coders submitting
            solutions to all three problems.  <B>ragnabot</B> was quickest, with 1188.44 points.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <B>purpleurple</B>
                    - 954.81</li>
    <li>
      <B>Celeborn</B>
                    - 608.92</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>bchadwick</B>
                    - 1122.82</li>
    <li>
      <B>jewphoria</B>
                    - 584.50</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 1269.22</li>
    <li>
      <B>jbwmubrncs</B>
                    - 1019.61</li>
    <li>
      <B>dodja</B>
                    - 1016.82</li>
    <li>
      <B>rreyelts</B>
                    - 985.91</li>
    <li>
      <B>flip</B>
                    - 953.12</li>
    <li>
      <B>Catalepsy</B>
                    - 941.47</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1188.44</li>
    <li>
      <B>sirishks</B>
                    - 1109.74</li>
    <li>
      <B>Unknown</B>
                    - 1021.71</li>
    <li>
      <B>ahertz</B>
                    - 996.32</li>
    <li>
      <B>aycock</B>
                    - 983.20</li>
  </ol>
</ul>
<B>Challenge Phase</B>
<p>
            In 
        Room 60, <B>purpleurple</B> and <B>Celeborn</B> each successfully challenged
            another coder.  <B>purpleurple</B> challenged <B>mistaceo</B>'s Level 1 submission, which neglected
            to handle the special case of being able to provide change to every customer.  <B>Celeborn</B> challenged
            <B>asva</B>'s Level 2 submission, which didn't quite cover all the possible ways in which the last four
            digits could constitute a vanity number.
        </p>
<p>
            In 
        Room 61, <B>jewphoria</B> took over the lead by taking out <B>bchadwick</B>'s
            Level 3 submission, which was very inefficient.  <B>bingo</B> also got a piece of <B>bchadwick</B>,
            taking out his Level 2 submission, which also failed to cover all the possible ways in which a vanity number
            could be constructed.   <B>bingo</B> also successfully challenged <B>vadim_li</B>'s Level 2
            submission with the same test case.
        </p>
<p>
            With so many submissions, one would expect many challenges to occur in 
        Room 62, and indeed this was the case.
            <B>dodja</B> managed to be challenged more than anyone else, accruing five defenses.  <B>rreyelts</B>
            and <B>Catalepsy</B> each challenged <B>dodja</B>'s Level 3 submission, but neither was successful.
            <B>liviutzu</B> then challenged <B>dodja</B>'s Level 2 submission, and succeeded.  This was followed
            by another two unsuccessful challenges, this time by <B>jbwmubrncs</B> and again by <B>rreyelts</B>,
            both against his Level 1 submission.
        </p>
<p>
            <B>liviutzu</B> was the next popular target, being challenged three times.  The first two challenges came
            from <B>Catalepsy</B> and <B>flip</B> against his Level 3 submission, and the third came from
            <B>Catalepsy</B> again, against his Level 2 submission.  None of these challenges succeeded.
        </p>
<p>
            As for other successful challenges, <B>rreyelts</B> successfully challenged <B>jbwmubrncs</B>'s
            Level 3 submission.  However, <B>rreyelts</B>'s own Level 3 submission was successfully challenged
            by <B>Catalepsy</B>.  <B>Catalepsy</B> did not escape unscathed, either, with his Level 1 submission
            being successfully challenged by <B>jbwmubrncs</B> (thus completing the cycle).  <B>Catalepsy</B>
            also succesfully challenged <B>flip</B>'s Level 3 submission.
            At the end of the Challenge Phase, <B>liviutzu</B> was the only coder in
        Room 62 to end up
            with a higher score than he had when the Challenge Phase began.
        </p>
<p>
            
        Room 63 was nearly as active as 
        Room 62 during the Challenge Phase.
            <B>sirishks</B> submitted six challenges, exactly half of which were successful (giving him
            no net gain in terms of offense).  <B>sirishks</B> succeeded against the Level 3 submissions
            of <B>ahertz</B>, <B>Unknown</B>, and <B>aycock</B>, with the same test case
            against all three.  <B>ahertz</B>'s solution overflowed (due to using 32-bit <code>int</code>s
            to hold intermediate results), while the other two solutions timed out.  <B>sirishks</B> 
            also tried a similar test case against <B>ragnabot</B> and <B>diango</B>'s Level 3 submissions, but was unsuccessful
            on both counts.
            <B>sirishks</B> also challenged <B>ragnabot</B>'s Level 2 submission unsucessfully.
        </p>
<p>
            <B>ragnabot</B>, on the other hand, was a little less active, yet more productive.
            <B>ragnabot</B>'s only challenge was against <B>sirishks</B>'s Level 3 submission,
            which really didn't do anything at all.  <B>ahertz</B> and <B>diango</B> were
            not as careful, however, each submitting an unsuccessful challenge.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <B>purpleurple</B>
                    - 1004.81</li>
    <li>
      <B>Celeborn</B>
                    - 658.92</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>jewphoria</B>
                    - 634.50</li>
    <li>
      <B>bingo</B>
                    - 568.96</li>
    <li>
      <B>MMDDay</B>
                    - 566.40</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 1319.22</li>
    <li>
      <B>dodja</B>
                    - 636.12</li>
    <li>
      <B>jbwmubrncs</B>
                    - 605.94</li>
    <li>
      <B>Catalepsy</B>
                    - 597.58</li>
    <li>
      <B>rreyelts</B>
                    - 550.93</li>
    <li>
      <B>flip</B>
                    - 436.09</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1238.44</li>
    <li>
      <B>diango</B>
                    - 624.69</li>
    <li>
      <B>aycock</B>
                    - 510.55</li>
    <li>
      <B>Unknown</B>
                    - 428.58</li>
    <li>
      <B>sirishks</B>
                    - 406.22</li>
  </ol>
</ul>
<B>System Test Phase</B>
<p>
            In 
        Room 60, the lead changed again, as <B>purpleurple</B>'s Level 2 and Level 3 submissions both failed.
            In 
        Room 62, <B>liviutzu</B> lost his Level 2 submission, but this hardly dented his commanding lead.
            <B>dodja</B> and <B>Catalepsy</B> each lost their Level 3 submissions, and <B>Catalepsy</B> lost his
            Level 2 submission as well.
        </p>
<B>Final Results</B>
<ul>
            Room 60:
            <ol>
    <li>
      <B>Celeborn</B>
                    - 658.92</li>
    <li>
      <B>purpleurple</B>
                    - 275.02</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>jewphoria</B>
                    - 634.50</li>
    <li>
      <B>bingo</B>
                    - 568.96</li>
    <li>
      <B>MMDDay</B>
                    - 566.40</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 961.95</li>
    <li>
      <B>jbwmubrncs</B>
                    - 605.94</li>
    <li>
      <B>rreyelts</B>
                    - 550.93</li>
    <li>
      <B>flip</B>
                    - 436.09</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1238.44</li>
    <li>
      <B>diango</B>
                    - 624.69</li>
    <li>
      <B>aycock</B>
                    - 510.55</li>
    <li>
      <B>zia</B>
                    - 467.00</li>
  </ol>
</ul>
<p>
                    <B>ragnabot</B> was the only rookie to submit all three problems correctly.  As a result,
                    he wins the rookie rooms by a rather large margin, and his new yellow rating of 1578 is well-earned.
                </p>


<!-- <P>
At the time of this writing, it was not known to ZorbaTHut that jello (the
rookie winner) was disqualified from the match and future competitions for
cheating. Jello's results will not be found in the match results.
</P> -->

<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
<!-- <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
<A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->       
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


