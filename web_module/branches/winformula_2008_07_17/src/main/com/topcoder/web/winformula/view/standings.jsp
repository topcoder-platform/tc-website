<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head>
    <title>ESPN Winning Formula Challange :: Powered by TopCoder - Standings</title>
    <%-- Meta Tags --%>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="style.jsp">
        <jsp:param name="key" value="tc_winformula"/>
    </jsp:include>
    <script type="text/javascript" src="js/scripts.js"></script>
  
</head>

<body>
    <div id="wrapper">
    <%-- Wrapper --%>
    
        <jsp:include page="nav.jsp">
        <jsp:param name="tabLev1" value="standings" />
        <jsp:param name="tabLev2" value="" />
        <jsp:param name="tabLev3" value="" />
        </jsp:include>
        
        <div id="container">
        <%-- Container --%>
        <div id="main-content">
        <%-- Main Content --%>
        
            <%-- Temporarily Hidden 
            <div class="sub-navigation">Weekly Standings | <a href="standings_mini.htm">Mini-Season Standings</a></div>
            --%>
            <h1>Standings - Overall</h1>
                <div class="full-content">
                    <p style="font-size:20px;"><strong>Coming Soon</strong></p>
                </div>
            
            <%-- Temporarily Hidden 
            <div class="tab-navigation" id="inner-tab-navigation">
                <ul>
                    <li class="small selected"><a href="standings.htm">Overall</a></li>
                    <li class="small"><a href="standings_weekx.htm">Week 1</a></li>
                    <li class="small"><a href="standings_weekx.htm">W2</a></li>
                    <li class="small"><a href="standings_weekx.htm">W3</a></li>
                    <li class="small"><a href="standings_weekx.htm">W4</a></li>
                    <li class="small"><span>W5</span></li>
                    <li class="small"><span>W6</span></li>
                    <li class="small"><span>W7</span></li>
                    <li class="small"><span>W8</span></li>
                    <li class="small"><span>W9</span></li>
                    <li class="small"><span>W10</span></li>
                    <li class="small"><span>W11</span></li>
                    <li class="small"><span>W12</span></li>
                    <li class="small"><span>W13</span></li>
                    <li class="small"><span>W14</span></li>
                    <li class="small"><span>W15</span></li>
                    <li class="small"><span>W16</span></li>
                </ul>
            </div>

            <div class="full-content">
                
                <div class="dataArea" >
                <div class="dataArea_Above">
                    <p class="pagination"><span class="disabled">&lt;&lt; First</span> | <span class="disabled">&lt; Prev</span> | <strong>1</strong> <a href="javascript:;">2</a> <a href="javascript:;">3</a> <a href="javascript:;">4</a> <a href="javascript:;">5</a> <a href="javascript:;">6</a> <a href="javascript:;">7</a> <a href="javascript:;">8</a> <a href="javascript:;">9</a> <a href="javascript:;">10</a> | <a href="javascript:;">Next</a> &gt; | <a href="javascript:;">Last</a> &gt;&gt;</p>
                    <p class="numResults">Show Results: <select name="select-Result">
                        <option>10</option>
                        <option>25</option>
                        <option>50</option>
                        <option>ALL</option>
                    </select></p>
                </div>
                <table width="100%" border="0" cellpadding="0" cellspacing="0" class="current-data">
                    <tr class="resultTH">
                        <th scope="col"><a href="#" class="sortDown">Rank (change)</a></th>
                        <th scope="col"><a href="#">Handle</a></th>
                        <th scope="col" class="center"><a href="#">Points</a></th>
                        <th scope="col" class="center"><a href="#">Win %</a></th>
                        <th scope="col" class="center"><a href="#">Avg Total Score Variance</a></th>
                        <th scope="col" class="center"><a href="#">Avg Victory Margin Variance</a></th>
                    </tr>
                    <tr>
                        <td><strong class="green">1</strong> (+2)</td>
                        <td><a href="member.htm">SouthSyde</a></td>
                        <td class="alignCenter">1432</td>
                        <td class="alignCenter">84%</td>
                        <td class="alignCenter">9</td>
                        <td class="alignCenter">4</td>
                    </tr>
                    <tr class="alt">
                        <td><strong class="green">2</strong> (-1)</td>
                        <td class="alt"><a href="member.htm">wicked_games</a></td>
                        <td class="alignCenter">1388</td>
                        <td class="alignCenter">81%</td>
                        <td class="alignCenter">10</td>
                        <td class="alignCenter">4</td>
                    </tr>
                    <tr>
                        <td><strong class="green">3</strong> (-1)</td>
                        <td><a href="member.htm">enterDragon</a></td>
                        <td class="alignCenter">1355</td>
                        <td class="alignCenter">77%</td>
                        <td class="alignCenter">12</td>
                        <td class="alignCenter">4</td>
                    </tr>
                    <tr class="alt">
                        <td><strong class="green">4</strong> (+5)</td>
                        <td class="alt"><a href="member.htm">fb_boss</a></td>
                        <td class="alignCenter">1279</td>
                        <td class="alignCenter">72%</td>
                        <td class="alignCenter">12</td>
                        <td class="alignCenter">5</td>
                    </tr>
                    <tr>
                        <td><strong class="green">5</strong> (+9)</td>
                        <td><a href="member.htm">call_me_sista</a></td>
                        <td class="alignCenter">1232</td>
                        <td class="alignCenter">71%</td>
                        <td class="alignCenter">14</td>
                        <td class="alignCenter">6</td>
                    </tr>
                    <tr class="alt">
                        <td><strong class="green">6</strong> (-2)</td>
                        <td class="alt"><a href="member.htm">LSUfan</a></td>
                        <td class="alignCenter">1287</td>
                        <td class="alignCenter">68%</td>
                        <td class="alignCenter">16</td>
                        <td class="alignCenter">7</td>
                    </tr>
                    <tr>
                        <td><strong class="green">7</strong> (+6)</td>
                        <td><a href="member.htm">theprophet</a></td>
                        <td class="alignCenter">1188</td>
                        <td class="alignCenter">68%</td>
                        <td class="alignCenter">16</td>
                        <td class="alignCenter">7</td>
                    </tr>
                    <tr class="alt">
                        <td><strong class="green">8</strong> (-1)</td>
                        <td class="alt"><a href="member.htm">motrrrhead</a></td>
                        <td class="alignCenter">1045</td>
                        <td class="alignCenter">62%</td>
                        <td class="alignCenter">17</td>
                        <td class="alignCenter">8</td>
                    </tr>
                    <tr>
                        <td><strong class="green">9</strong> (+15)</td>
                        <td><a href="member.htm">somegirl</a></td>
                        <td class="alignCenter">997</td>
                        <td class="alignCenter">61%</td>
                        <td class="alignCenter">17</td>
                        <td class="alignCenter">9</td>
                    </tr>
                    <tr class="alt">
                        <td><strong class="green">10</strong> (-5)</td>
                        <td class="alt"><a href="member.htm">chekm8</a></td>
                        <td class="alignCenter">984</td>
                        <td class="alignCenter">61%</td>
                        <td class="alignCenter">18</td>
                        <td class="alignCenter">10</td>
                    </tr>
                </table>
                
                
              </div>
              
            </div>
            --%>


        </div>
        
  </div>
  
  <div id="footer">
  <%-- Footer --%>
  </div>

<%-- End Wrapper --%>
</div>    
</body>
</html>