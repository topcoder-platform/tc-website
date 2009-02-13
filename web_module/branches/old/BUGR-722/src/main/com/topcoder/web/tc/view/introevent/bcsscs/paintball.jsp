<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            
            <jsp:include page="/page_title.jsp" >
               <jsp:param name="image" value="algorithm"/>
               <jsp:param name="title" value="Introduction Event"/>
            </jsp:include>

            <div style="float:right; margin-top: 6px;"><A href="/tc?module=Static&d1=help&d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></A></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for Paintball</h2>

            <div>
            <strong>
            Problem Statement 
            | <A href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=paintballSol" class="bcLink">Solution</A>
            </strong>
            </div>
            
            <table>
                <tbody>
                    <tr>
                        <td colspan="2"><h3>Problem Statement</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <p>For his birthday, Bart received the brand new video game "Paintball!". In this game, a person plays on teams over the Internet against various competitors, attempting to hit their opponents with paint balls. Each player earns a point each time that they "splatter" an opponent with a paintball, and lose a point for each time they get "splattered". Due to the way that the game is played, it is also possible to accidentally splatter yourself or a teammate. In that case, the shooter loses a point, and the person who was splattered (if not the shooter) does not lose any points. A team's score is simply the sum of the scores of its players.</p>
                            <p>Although Bart loves the game, he is disappointed that the game does not provide a leaderboard during gameplay. However, it does provide the list of <strong>players</strong>, formatted as "NAME TEAM" (where NAME is the player's name, and TEAM is his team), and a series of <strong>messages</strong>, each formatted as "NAME1 SPLATTERED NAME2" (all quotes for clarity), where NAME1 indicates the name of the person who shot the paintball, and NAME2 indicates the name of the person who got splattered. Bart would like to have an updated scoreboard, and that is where you come in.</p>
                            <p>All teams will receive a rank number from 1 to M (the total number of teams), based on the team scores (with 1 corresponding to the highest score). If multiple teams have the same score, then the team with the name that comes first alphabetically will receive a lower rank number. For each team (in order from 1 to M), its leaderboard entry will be formatted as follows:</p>
                                <ol>
                                    <li>The first line will be "TEAM SCORE" (quotes for clarity), where TEAM is the team name, and SCORE is the team score (with no extra leading zeroes).</li>
                                    <li>Let N be the number of players on the team. Assign rank numbers to the N players from 1 to N, giving a lower rank number to a higher score. If multiple players have the same score, assign the player whose name comes first alphabetically to the lower rank number.</li>
                                    <li>From the player with rank 1 to rank N, output a line with 2 spaces, the player's name, a single space, and then the player's score (with no extra leading zeroes).</li>
                                </ol>
                            <p>Thus, if player A from team RED splatters player B from team BLUE (and they are the only players in the game), the leaderboard will be:</p>
                            <pre>RED 1
  A 1
BLUE -1
  B -1
</pre>
                            <p>You are to generate the leaderboard and return it.</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Definition</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Class:</td>
                                        <td>Paintball</td>
                                    </tr>
                                    <tr>
                                        <td>Method:</td>
                                        <td>getLeaderboard</td>
                                    </tr>
                                    <tr>
                                        <td>Parameters:</td>
                                        <td>String[], String[]</td>
                                    </tr>
                                    <tr>
                                        <td>Returns:</td>
                                        <td>String[]</td>
                                    </tr>
                                    <tr>
                                        <td>Method signature:</td>
                                        <td>String[] getLeaderboard(String[] players, String[] messages)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">(be sure your method is public)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Notes</h3></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>A SCORE of 0 should be output as 0, not as -0.</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Constraints</h3></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>players</strong> will contain between 1 and 50 elements, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>players</strong> will be contain between 3 and 50 characters, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>players</strong> will be formatted as "NAME TEAM" (quotes for clarity).</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>In each element of <strong>players</strong>, NAME will consist of uppercase characters ('A'-'Z') and will contain at least 1 character.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>There will be no duplicate NAMEs in <strong>players</strong>.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>In each element of <strong>players</strong>, TEAM will consist of uppercase characters ('A'-'Z') and will contain at least 1 character.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><strong>messages</strong> will contain between 1 and 50 elements, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>messages</strong> will contain between 14 and 50 characters, inclusive.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>Each element of <strong>messages</strong> will be formatted as described in the problem statement.</td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td>In each element of <strong>messages</strong>, NAME1 and NAME2 will be NAMEs found in <strong>players</strong>.</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Examples</h3></td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">0)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"A RED", "B BLUE"}
{"A SPLATTERED B"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"RED 1", "  A 1", "BLUE -1", "  B -1" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">The example from the statement.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">1)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"LISA RED", "BART RED", "HOMER BLUE", "MARGE BLUE", "MAGGIE GREEN"}
{"MAGGIE SPLATTERED HOMER", "MAGGIE SPLATTERED MARGE"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 
{"GREEN 2",
"  MAGGIE 2",
"RED 0",
"  BART 0",
"  LISA 0",
"BLUE -2",
"  HOMER -1",
"  MARGE -1" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">2)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"TODD STRIKEFORCE",
 "BART OMEGA",
 "DATA STRIKEFORCE",
 "MILHOUSE OMEGA",
 "NELSON DISCOVERYCHANNEL",
 "MARTIN DISCOVERYCHANNEL"}
{"BART SPLATTERED MARTIN","TODD SPLATTERED MARTIN"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: 
{"OMEGA 1",
"  BART 1",
"  MILHOUSE 0",
"STRIKEFORCE 1",
"  TODD 1",
"  DATA 0",
"DISCOVERYCHANNEL -2",
"  NELSON 0",
"  MARTIN -2" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">3)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"DR COHO", "ST COHO", "PE COHO"}
{"DR SPLATTERED ST",
 "ST SPLATTERED PE"}
</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"COHO -2", "  PE 0", "  DR -1", "  ST -1" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">Don't shoot your teammates!</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">4)</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>{"A B", "AA AA", "AAA AAA"}
{"A SPLATTERED AAA", "A SPLATTERED AAA", "A SPLATTERED AAA", 
"AA SPLATTERED AAA", "AA SPLATTERED AAA"}</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {"B 3", "  A 3", "AA 2", "  AA 2", "AAA -5", "  AAA -5" }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    
                </tbody>
            </table>
            
            <hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. &copy;2006, TopCoder, Inc. All rights reserved. </p></hr>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>