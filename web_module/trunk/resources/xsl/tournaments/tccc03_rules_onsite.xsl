<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tccc03_links.xsl"/>
  <xsl:import href="../includes/modules/tccc03rule_links.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
<html>
<head>

<xsl:call-template name="Preload"/>      

<title>TopCoder | Tournaments</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<a name="top_page"></a>

<xsl:variable name="contestId">
    <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
</xsl:variable>

<!-- Top Begins -->
<xsl:call-template name="Top"/>
<!-- Top Ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="180">
              <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->  
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">tournaments_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>
        
            <xsl:call-template name="tccc03_links">
                <xsl:with-param name="selectedTab">rules</xsl:with-param>
            </xsl:call-template>

            
            <xsl:call-template name="tccc03rule_links"/>
    
            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="middle" class="statText">
                                    <div class="statTextBig">Online Elimination Rounds</div>
                                    <p>Everyone who competes in an online round must log on to the TopCoder Competition Arena no later than ten minutes prior 
                                    to the start of the online round. (See below for competition dates and times.) TopCoder members from around the world 
                                    may be participating in these rounds, <b>but all start times will be communicated as Eastern Time, so contestants in 
                                    different time zones must adjust accordingly</b>. If a coder does not participate, for any reason, in an online round 
                                    that they have advanced to, it will be treated as an automatic loss in that round of competition.</p>

                                    <p>All competitors who have qualified for an online round will be assigned to a specific room. TopCoder will determine all 
                                    room assignments prior to the start of each online round in a manner such that the average competitor rating (as of February 
                                    14th) for each room will be similar. The dates and times of the online rounds of competition are as follows:<br /><br /></p>
                                </td>
                            </tr>
                        </table>

                        <div align="center">
                        <table width="100%" border="0" cellpadding="6" cellspacing="1">
                            <tr>
                                <td width="50%" align="center" bgcolor="#000000" class="statText">Round of Competition</td>
                                <td width="50%" align="center" bgcolor="#000000" class="statText">Date &amp; **Time</td>
                            </tr>
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">Regional Online Round #1</td>
                                <td bgcolor="#666666" class="statText">&#160;</td>
                            </tr>                        
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;Northeast and Southeast Regions</td>
                                <td bgcolor="#666666" class="statText">Tuesday, February 18th <br/> 
                                    Registration:  7:00 PM - 8:55 PM<br/>
                                    START: 9:00 PM</td>
                            </tr>
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;West and Midwest Regions</td>
                                <td bgcolor="#666666" class="statText">Thursday, February 20th <br/> 
                                    Registration:  7:00 PM - 8:55 PM<br/>
                                    START: 9:00 PM </td>
                            </tr>
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">&#160;&#160;&#160;&#160;&#160;International Region</td>
                                <td bgcolor="#666666" class="statText">Saturday, February 22nd <br/> 
                                    Registration:  10:00 AM - 11:55 AM<br/>
                                    START: 12:00 PM</td>
                            </tr>
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">Regional Quarterfinals</td>
                                <td bgcolor="#666666" class="statText">Wednesday, February 26th<br/> 
                                    START:  9:00 PM</td>
                            </tr>
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">Regional Semifinals</td>
                                <td bgcolor="#666666" class="statText">Wednesday, March 5th<br/> 
                                    START:  9:00 PM</td>
                            </tr>                                                                                                
                        
                            <tr valign="top">
                                <td bgcolor="#666666" class="statText">Regional Championship</td>
                                <td bgcolor="#666666" class="statText">Wednesday, March 12th<br/> 
                                    START:  9:00 PM</td>
                            </tr>                                                
                        
                            <tr valign="top">
                                <td colspan="2" bgcolor="#666666" class="statText">**NOTE:  In the event that a round must be cancelled for any reason, the "raindate" for the cancelled match will be the following day at the same time.</td>
                            </tr>                                
                        </table>
                        </div>
                        
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr><td class="statText"><br />
                        <strong>Scoring and Advancing during Online Regional Rounds</strong><br/>
                        After each round of competition, the winners from each of the assigned rooms will be identified and will advance to the next online round. Coder advancement in all rounds is determined by comparing the total point values from all three phases of the round  
                        &#40; see <a href="/?t=tournaments&amp;c=tccc03_rules_structure" class="statText">Competition Round Structure</a> &#41; for each coder. In order to advance, a coder must finish each round with a greater-than-zero point total. The structure of the online rounds is as follows:<br/><br/>
                        
                        <b>Online Regional Round One</b><ul>
                        <li>Up to 200 coders per region (totaling 1,000) will compete - A total of 500 competitors, comprised of 20 room winners and 80 wildcard competitors (based on total points across all rooms) per region, will advance to the next round.</li><br/>
                        </ul>
                                                
                        <b>Online Regional Quarterfinal</b><ul>
                        <li>Up to 100 coders per region (totaling 500) will compete - A total of 200 competitors, comprised of 10 room winners and 30 wildcard competitors per region, will advance to the next round.</li><br/>
                        <li>Each of the 200 advancers will win $50 each</li><br/>                    
                        </ul>
                        
                        <b>Online Regional Semifinal</b><ul>
                        <li>40 coders per region (totaling 200) will compete - A total of 50 competitors, comprised of 4 room winners and 6 wildcard competitors per region, will advance to the next round.</li><br/>
                        <li>Each of the 50 advancers will win $50 each </li><br/>
                        </ul>
                        
                        <b>Online Regional Final</b><ul>
                        <li>10 coders per region (totaling 50) will compete</li><br/>
                        <li>The winner of each of the five (5) regions will be crowned that Regional Champion, and will win $600 each.  Each Regional Champion will automatically advance to the onsite Semifinal Round. (NOTE: All Regional Champions must participate in the onsite Semifinal Round to receive his / her prize.)</li><br/>
                        <li>The remaining eleven (11) spots in the onsite Semifinal and Championship Rounds will be handed out based on total points across all rooms (regardless of region).</li><br/>
                        </ul><br/>
                        In order to advance, a coder must finish with a greater-than-zero point total. If a room has no contestants who have more than zero points, the automatic berth for that room will be placed into the regional wildcard pool. Any tie in points for an automatic berth in a room or for the last spot of the wildcard pool will be resolved in the following manner: <ul>
                        <li>Total points acquired (higher is better) during the rounds of the tournament in which all of the tied participants were presented with the same set of problems</li><br/>
                        <li>If a tie still remains, then by rating (higher is better) as of February 14, 2003</li>
                        </ul><br/>
                
                        <hr width="100%" size="1" color="#999999" />

                        <p><strong>Onsite Semifinal and Championship Rounds</strong><br/>
                        The sixteen (16) advancers from the Regional Championship round will travel to the University Park Hotel in Cambridge, MA on Thursday, 
                        April 3rd to compete in the Semifinal round of the tournament being held on April 4th.  All contestants must arrive at the University Park 
                        Hotel no later than 5:00PM on Thursday, April 3rd.  If a contestant is unable to attend the onsite rounds, he/she will forfeit his/her spot in 
                        the tournament, which will be given to the next highest overall scorer from the Regional Championship round.</p>
                        
                        <p>TopCoder will provide travel arrangements for each competitor and a guest of his/her choice, 
                        up to a cost of $1,000 per person.  (That is, if a contestant's airfare is greater than $1,000, 
                        the contestant will be responsible for the difference between the cost of the airfare and $1,000.)  
                        In addition, TopCoder will also provide travel arrangements to and from the airport to the University 
                        Park Hotel and accommodations and certain meals for each contestant and his/her guest.  All other expenses 
                        are the responsibility of the contestant and his/her guest.</p>
                          
                        <p>TopCoder will determine the room assignments for the Semifinal rooms prior to the start of each Semifinal round, in a manner such that the average competitor rating 
                        (as of February 17, 2003) for each room will be similar.  The dates and times of the onsite Semifinal and 
                        Championship rounds are as follows:<br /><br /></p>
                                </td>
                            </tr>
                        </table>

                        <div align="center">
                        <table width="100%" border="0" cellpadding="6" cellspacing="1">
                        <tr>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Round of Competition</td>
                            <td width="50%" align="center" valign="middle" height="21" bgcolor="#000000" class="statText">Date &amp; **Time</td>
                        </tr>
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">Semifinal Room #1</td>
                            <td valign="top" bgcolor="#666666" class="statText">April 4, 2003 at 10:00 AM EST</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">Semifinal Room #2</td>
                            <td valign="top" bgcolor="#666666" class="statText">April 4, 2003 at 1:00 PM EST</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">Semifinal Room #3</td>
                            <td valign="top" bgcolor="#666666" class="statText">April 4, 2003 at 4:00 PM EST</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">Semifinal Room #4</td>
                            <td valign="top" bgcolor="#666666" class="statText">April 4, 2003 at 7:00 PM EST</td>
                        </tr>                        
                        <tr>
                            <td valign="top" bgcolor="#666666" class="statText">Championship Round</td>
                            <td valign="top" bgcolor="#666666" class="statText">April 5, 2003 at 12:00 PM EST</td>
                        </tr>
                        <tr>
                            <td colspan="2" valign="top" bgcolor="#666666" class="statText">**Times are subject to change.</td>
                        </tr>                            
                        </table>
                        </div>
                        
                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
                        <tr><td class="statText"><br />
                        The Semifinal Round will consist of four (4) rooms of four (4) coders each.  The winner in each room will advance to the Championship Round.<br/><br/>

                        <b>The Championship Round</b> will be a single round of four (4) coders.<br/><br/>
                        
                        First, second, third and fourth place in the Championship Round are determined by comparing the total points of each coder, with the highest point 
                        value placing first.  The winner of the Championship Round will be the coder with the highest point total for the round.  In the event of a tie in the Semifinal and/or 
                        Championship rounds, the tie will be resolved in the following manner (in order):<ul>
                        <li>Total points acquired (higher is better) in the 2003 Collegiate Challenge to date</li><br/>
                        <li>If a tie still remains, then by rating (higher is better) as of February 14, 2003</li></ul>
                        </td>
                        </tr>
                    </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

  <!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>

        <xsl:call-template name="public_right_col"/>       

        </td>
  <!-- Right Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer Begins -->
<xsl:call-template name="Foot"/>
<!-- Footer Ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

