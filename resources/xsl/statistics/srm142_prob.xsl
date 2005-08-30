<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>TopCoder | Statistics</title>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0" /><br />

<!--body contextual links-->
                        <table border="0" cellspacing="1" cellpadding="3" width="100%">
                            <tr valign="middle">
                                <td bgcolor="#43515E" class="moduleTitle" colspan="2">MATCH EDITORIAL LINKS:</td>
                            </tr>
                          
                            <tr valign="middle">
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" class="bodyGeneric">Archive</a></td>
                                <td class="bodyText" align="center" bgcolor="#CCCCCC"><a href="mailto:editorial@topcoder.com" class="bodyGeneric">Comments/Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
                   
                        <img src="/i/clear.gif" alt="" width="1" height="6" border="0" /><br />
                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
                                        
                        <p><strong>Single Round Match 142</strong><br />
                        Tuesday, April 15, 2003</p>
                              
                        <h2>Match summary</h2>

                        <p>The top two scorers in Division-I, <strong>Yarin</strong> and <strong>dgarthur</strong> were the same as in the recent TCCC final, but 
                        this time with <strong>Yarin</strong> as the winner. In third place came <strong>dary</strong> after a very impressive performance in only 
                        his second SRM! In Division-II, <strong>PJYelton</strong> took a comfortable win after delivering 5 successful challenges. The 
                        difficulty level of the problem set was very good, with a good distribution of scores and submits.</p>

                        <p><strong>Problem Set Analysis &amp; Opinion</strong></p>

                        <font size="+2"><strong>FarmFence</strong></font><br />
                        Used as: Division-II, Level 1:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">300</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">165 / 182  (95.38%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">104 / 165  (63.03%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>lordduke</strong> for 295.83 points</td></tr>
                        </table>
                        </blockquote>

                        <p>Reference implementation: <strong>qsort</strong></p>

                        <h4>Implementation</h4>

                        <p>Since the area of the rectangular area must match crops exactly, we will have to loop through all possible rectangles of integral size. We only need
                        to loop one side of the rectangle; the other side can be calculated by taking crops/first_side, assuming this value is an integer. This is true if
                        crops%first_side==0 (if you're unsure about the % operator, you should check this out more carefully as it's a very useful operator!).</p>

                        <p>It's possible to loop first_side from 1 to crops, but we actually only have to loop it to sqrt(crops). The reason is that once first_side is greater
                        than sqrt(crops), the second side of the rectangle will be less than the first_side, and those rectangles we have already checked!</p>

                        <p>For each rectangle, we sum up the sides and check if this is better than the best found so far.</p>

                        <font size="+2"><strong>MedianOfThree</strong></font><br />
                        Used as: Division-II, Level 2:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">550</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">131 / 182  (71.98%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">110 / 131  (83.97%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>jwjchap</strong> for 538.69 points</td></tr>
                        </table>
                        </blockquote>

                        <p>Reference implementation: <strong>cnettel</strong></p>

                        <h4>Implementation</h4>

                        <p>The easiest way to find all 3-number combinations is to have three nested loops:</p>

<pre>
for(int i=0;i&lt;n;i++)
  for(int j=i+1;j&lt;n;j++)
    for(int k=j+1;k&lt;n;k++)
</pre>

                        <p>One can also use recursion, but when the number (in this case 3) elements are fixed and sufficiently small (3 or 4), having 
                        several nested for-loops is usually better.</p>

                        <p>Once we have the 3-number combinations, to find the median we can either apply several if-statements or we can put the 3 
                        numbers in an array, sort the array and pick the middle element. The latter method is definitely shorter to code, if using the built 
                        in sort function in your programming language.</p>
     
                        <font size="+2"><strong>LambChop</strong></font><br />
                        Used as: Division-II, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">1000</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">57 / 182  (31.32%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">33 / 57  (57.89%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>Parchandri</strong> for 698.74 points</td></tr>
                        </table>
                        </blockquote>

Used as: Division-I, Level 2:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">500</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">105 / 125  (84.00%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">94 / 105  (89.52%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>Yarin</strong> for 452.48 points</td></tr>
                        </table>
                        </blockquote>

                        <p>Reference implementation: <strong>Yarin</strong></p>

                        <h4>Implementation</h4>

                        <p>Card simulation games occurs frequently in TopCoder competitions. They usually have one thing in common if you want so solve 
                        them: Following the instructions <i>precisely</i> and do not try to be clever by doing things in a different order than what is stated.</p>

                        <p>Each game is run independently (or almost so, you need to know who starts pulling a card from the previous game). For each 
                        game, we can keep an array of booleans marking if a player is lamb or not. For simplicity we also keep a counter of how many 
                        players are not lambs. We of course also need to know who the current player is (at the very start of the method we initialize 
                        this to 0) and the value of the <i>counter</i>, which we set to 1 at the start of a round.</p>

                        <p>The easiest, and less error-prone, way to do the inner loop of the problem is to not loop over all cards but to have an infinite 
                        loop (while (true) ) that is jumped out of when that round is over. Inside this loop we check if the rightmost digit of the counter 
                        (counter modulo 10; one can also convert the number to a string and check the last character) is the same as the card value. If 
                        this is so, we mark the player as lamb and decrease the number of players left, in other case we increase the counter.</p>

                        <p>After this we check if we have run out of cards, and if so take the appropriate action (increase the score of all remaining 
                        players by one). Otherwise we check if there's only one player left, in which case he gets his score increase by the total number 
                        of players. If the game still goes on, we find out who is next in turn, making sure we don't select a player who is lamb.</p>

                        <p>The most common error in this problem is that people first checked if there was only one player left, then if there are no 
                        cards left. This won't work if the final card reduced the number of players from 2 to 1, in which case you would award the last 
                        player with too much. Another possible error was to compare the card value with counter instead of the last digit of it. Both these 
                        errors would have been caught if you tried all examples. Now when it's so easy to check all examples quickly, one should always 
                        check them all! If you get the wrong answer, there's really no point of submitting as this will only give your opponents a chance 
                        of 50 extra points.</p>

                        <font size="+2"><strong>Vigesimal</strong></font><br />
                        Used as: Division-I, Level 1:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">250</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">119 / 125  (95.20%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">93 / 119  (78.15%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>Yarin</strong> for 244.93 points</td></tr>
                        </table>
                        </blockquote>

                        <p>Reference implementation: <strong>Yarin</strong></p>

                        <h4>Implementation</h4>

                        <p>This problem consists of two separate sub problems: convert a number to base 20 (vigesimal) and sort those numbers 
                        using a given sorting order. Converting numbers to other bases is something most programmers have done before, although 
                        I'm sure not that many had converted a number to base 20 before... Still, the method is the same as ever: we find the last digit 
                        by doing modulo 20, then divide by 20 and take modulo 20 again to find the second last digit etc, until there are no more digits 
                        left (the value is 0). This method is, if I remember correctly, taught early in high school math. We just have to make sure 
                        we convert 0 to "0", and not ""! This happens automatically if we have a do { ... } while (value>0); loop instead of while 
                        (value>0) { ... }.</p>

                        <p>If you don't know how to specify your own sorting operator to your programming language sorting function, that's something 
                        you should learn. In this problem, a vigesimal value is before another value if it's shorter or if its rightmost different digit 
                        is less. The latter can be checked by looping through all digits (in base 20) from the right and halt on the first different digit.</p>

                        <font size="+2"><strong>FlipFlop</strong></font><br />
                        Used as: Division-I, Level 3:

                        <blockquote>
                        <table border="0" cellspacing="2" cellpadding="3">
                            <tr><td class="bodyText" style="background: #eee;"><strong>Value</strong></td><td class="bodyText" style="background: #eee;">1050</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Submission Rate</strong></td><td class="bodyText" style="background: #eee;">19 / 125  (15.20%) </td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>Success Rate</strong></td><td class="bodyText" style="background: #eee;">13 / 19  (68.42%)</td></tr>
                            <tr><td class="bodyText" style="background: #eee;"><strong>High Score</strong></td><td class="bodyText" style="background: #eee;"><strong>dary</strong> for 837.80 points</td></tr>
                        </table>
                        </blockquote>

                        <p>Reference implementation: <strong>Yarin </strong><i>(practice room)</i></p>

                        <h4>Implementation</h4>

                        <p>The first thing to realize is that you never have to do a color switch more than two times on a square. If you do a color-switch 
                        3 times, it's the same thing as doing it 0 times etc. Thus there are 3<sup>n*m</sup> combinations of switches that are relevant, 
                        which is way too much since n*m can be 100.</p>

                        <p>The trick is to only consider all relevant switches on the first row. There are at most 3<sup>10</sup> = 59049 such 
                        combinations, which is feasible. The nice thing now is that on all remaining rows, the number of color-switches for each 
                        square is forced: we don't have to try switch it 0, 1 or 2 times, because there is only one possibility if we are to color all 
                        squares blue! Assume the squares look like this after we have tested one combination of color-switches on the first row:</p>

<pre>
BGBRB
RBRBR
BRGRB
BGRBB
RBBRG
</pre>

                        <p>We will not do any more color-switches on the first (since we will try those combinations later on anyway). So the <i>only</i> 
                        way to now affect the squares in the first row that are not B, is to color-switch the square in the row below. Since the first row 
                        above is BGBRB, in order to turn that to BBBBB we must color switch, in row 2, column 2 one time and column 4 two times. Any 
                        other color switch in row 2 will make the squares in row 0 to be something other than BBBBB. When doing this color switches, 
                        we have changed the colors of the squares in row 2 and row 3 as well. Now we can repeat this procedure: the only way to fix those 
                        squares in row 2 that are not B is to color-switch the squares beneath those in row 3 etc. This procedure is repeated through all 
                        rows; row y-1 tells us how to color switch row y.</p>

                        <p>Once we have looped through all rows, we just check that the final row also turned up BBBBB. Since there is no row after the 
                        last row, if the last row is not BBBBB right away then there's no way to fix this. If the last row is BBBBB, we check if the number 
                        of color switches we did is less than the best so far, and then update this value.</p>

                        <p>One can also solve this problem using recursion, working row by row, column by column. If the current square is x,y, then 
                        the only pruning you have to do is make sure the square at x-1,y-1 is B (or if x=0, check square n-1,y-2). This will actually 
                        be the same thing as the solution described above, but requires less code. My practice room solution uses this method.</p>

                        <p>It's also possible to find a solution by solving a linear system equation in modulus 3. The drawback with this is that I'm not 
                        sure how you actually find the <i>smallest</i> solution.</p>

                        <p>Some people solved this problem quite fast. One reason for that is most likely because they've seen this kind of problems 
                        before, as similar problems have occurred in other programming competitions before. For a more general analysis of the 
                        problem, one can check out the following link: <a href="http://www.rose-hulman.edu/mathjournal/2000/vol1-n1/paper2/v1n1-2pd.pdf">Turning the Lights Out in Three Dimensions</a>.</p>


                        <img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" />
                        By&#160;<a href="/tc?module=MemberProfile&amp;cr=269554"><strong>Yarin</strong></a><br/>
                        <div class="smallText"><em>TopCoder Member</em></div><br clear="all" />
                                       
                        <p><br /></p>
                    
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>
