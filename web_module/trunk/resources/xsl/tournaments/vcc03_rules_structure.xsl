<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/vcc03_links.xsl"/>
  <xsl:import href="../includes/modules/vcc03_sublinks.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>2003 Verizon Coding Challenge - Computer Programming Tournament - Rules - Structure</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

</head>

<body>

<a name="top_page"></a>
<table valign="top" width="100%" cellpadding="0" cellspacing="0">
   <tr valign="top" width="100%">
      <td align="center" width="100%">
         <div align="center"><object 
            type="application/x-shockwave-flash"
            data="/i/tournament/vcc03/vcc03_still.swf"
            width="100%"
            height="125"
            valign="top">
            <param name="movie" value="/i/tournament/vcc03/vcc03_still.swf" />
            <param name="quality" value="high" />
         </object></div>
      </td>
   </tr>
</table>
<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins
<xsl:call-template name="Top"/>
Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/>
        </td>
<!-- Gutter Ends -->

<!-- Left Column Begins-->
         <td>
         <p><img src="/i/clear.gif" width="180" height="10" border="0"/><br />
         <img src="/i/tournament/vcc03/vcc03_right.gif" width="180" height="400" border="0"/><br />
         <img src="/i/clear.gif" width="180" height="40" border="0"/>
         </p>
         </td>         
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
<!-- TCO Header -->
<!-- Tab bar links-->
            <xsl:call-template name="vcc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

<!-- Tab bar sub links-->
            <xsl:call-template name="vcc03_sublinks">
                <xsl:with-param name="selectedList">rules</xsl:with-param>
                <xsl:with-param name="selectedTab">structure</xsl:with-param>
            </xsl:call-template>
    
            <blockquote>
            <h2>Competition Structure</h2>
            
<!-- The Competition Field -->
            <p><span class="bodySubtitle">The Competition Field</span><br />
            A total of 500 individuals will be invited to compete in Round #1.  The top 250 scorers will advance to Round 2.  The top 25 
            scorers from Round 2 will advance to Round #3 (the Championship Round), which will be held onsite at Verizon's Chennai VDSI 
            facility.</p>
            
<!-- Online Elimination Rounds -->
            <p><span class="bodySubtitle">Online Elimination Rounds</span><br />
            Everyone who competes in Round #1 must log in to the TopCoder Competition Arena no later than ten minutes prior to the 
            start of the online round.  <strong><em>All start times will be communicated as Chennai Time</em></strong>.  If a coder 
            does not participate, for any reason, in an online round he/she has advanced to, it will be treated as an automatic loss in 
            that round of competition. </p>

            <p>All competitors who have been invited to compete will be randomly assigned to specific rooms, with up to 10 people in 
            each room.  TopCoder will determine all room assignments prior to the start of each online round. </p>

            <p><span class="bodySubtitle">Scoring and Advancing During Online Rounds</span><br />
            After each round of competition, the top scorers will be identified and will advance to the next round.  Coder advancement in 
            all rounds is determined by comparing the total point values from all three phases of the round (see Competition Round Structure) 
            for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the 
            online rounds is as follows:</p>
            
            <ul>
               <li><span class="bodySubtitle">Round #1</span><br />
               Up to 500 coders will compete in Round #1 and up to 250 will advance.  The 250 highest scoring competitors will advance to 
               Round #2.  Each coder must have positive points to advance, so if there are less than 250 competitors who score positive 
               points, only those competitors with a positive point total will advance.</li>
               
               <li><span class="bodySubtitle">Round #2</span><br />
               Up to 250 coders will compete and up to 25 will advance.  The 25 highest scoring competitors will advance to Round #3.  
               Each coder must have positive points to advance, so if there are less than 25 competitors who score positive points, only those 
               competitors with a  positive point total will advance.</li>
               
               <li><span class="bodySubtitle">Round #3 Championship Round</span><br />
               Up to 25 coders will compete in the Championship Round being held onsite at Verizon's Chennai facility.  Each finalist is 
               responsible for arriving at Verizon's facility to compete.</li>
            </ul>
            
            <p><strong>NOTE:</strong>  In the event of a tie for any advancing position, the tie will be resolved in the following manner:<br/>
            <ul>
               <li>Total points acquired (higher is better) during the previous rounds of the tournament</li>
               <li>If a tie still remains, all tied coders will advance to the next round</li>
            </ul>
            </p>

<!-- Round Structure -->
            
            <p><span class="bodySubtitle">Competition Round Structure</span><br />
            Each online and onsite round of competition consists of three phases: the Coding Phase, Challenge Phase, and System Testing Phase. 
            (Note: the format of these competition rounds is similar to the format of the Single Round Matches.)</p>
            
            <ul>
                <li><strong>The Coding Phase</strong> is a timed event where all contestants are presented with the same three questions 
                representing three levels of complexity and, accordingly, three levels of point earnings potential. Points for a problem are 
                awarded upon submission of any solution that successfully compiles and are calculated on the total time elapsed from the time 
                the problem was opened to the time it was submitted.</li>

                <li><strong>The Challenge Phase</strong> is a timed event wherein each competitor has a chance to challenge the functionality 
                of other competitors' code. A successful challenge will result in a loss of the original problem submission points by the 
                defendant, and a 50-point reward for the challenger.  Unsuccessful challengers will incur a point reduction of 50 points as 
                a penalty, applied against their total score in that round of competition.</li>

                <li><strong>The System Testing Phase</strong> is applied to all submitted code that has not already been successfully 
                challenged. If the TopCoder System Test finds code that is flawed, the author of that code submission will lose all of the 
                points that were originally earned for that code submission. The automated tester will apply a set of inputs, expecting the 
                output from the code submission to be correct. If the output from a coder's submission does not match the expected output, 
                the submission is considered flawed. The same set of input/output test cases will be applied to all code submissions for a 
                given problem. All successful challenges from the Challenge Phase will be added to the sets of inputs for the System Testing 
                Phase.</li>
            </ul><br />

<!-- Championship Round -->
            <p><span class="bodySubtitle">Onsite Championship Round</span><br />
            The 25 advancers from Round #2 must travel to Verizon's Chennai VDSI facility to compete in the Championship round of the 
            tournament.  All finalists must arrive at Verizon's Chennai VDSI no later than 10:00 AM on Friday, August 29th.  If a contestant 
            is unable to attend the onsite rounds, he/she will forfeit eligibility to receive a prize, and his/her spot in the tournament will be 
            given to the next highest scorer from Round #2.</p>

            <p>Verizon and TopCoder will NOT provide travel arrangements for each finalist.  All expenses to attend the onsite finals are the 
            responsibility of the finalist.</p>

            <p>TopCoder will determine the room assignments for the Championship Round prior to the start of the Championship round. </p>

            <p>The Championship Round will be a single round of 25 coders. First, second, third and fourth place in the Championship round 
            are determined by comparing the total points of each coder, with the highest point value placing first. The winner of the Championship 
            Round will be the coder with the highest point total for the round. In the event of a tie in the Championship rounds, the tie will be 
            resolved in the following manner (in order):</p>
            
            <ul>
            <li>Total points acquired (higher is better) during Rounds #1 and #2</li>
            <li>If a tie still remains in the Championship round, then the prize money will be distributed equally amongst the tied coders</li>
            </ul><br />
            
        </blockquote>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
<!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="FootVCC"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

