<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
</head>

<body>
<%--
<jsp:include page="tco04Head.jsp" />
--%>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco04/header_logo.gif"/></td>
		</tr>
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>radeye's odds</h2></td>
            <td class="bodyText" align=right>
            <!-- round links-->
            <jsp:include page="radeyelinks.jsp" >
               <jsp:param name="selectedRound" value="semi"/>
            </jsp:include>
            </td>
         </tr>

         <tr>
            <td align="left" class="bodyText" valign="top">
               <img src="/i/m/radeye_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left" class="myStatsPhoto"/>
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top" rowspan="2">
               <p>Beat the odds!  These results of over 10,000,000 Monte Carlo simulations
               predict your chances to advance in the 2004 TopCoder Open based only on
               your current TopCoder rating and volatility.  Prove that you're
               underrated as you advance through the Tournament.  Also remember that in any
               sufficiently large set of events, some will be of vanishingly small
               probability.</p>

               <p>The model used here is a normal distribution with the mean of your rating and
               standard deviation of your volatility, assuming every advancing coder
               scores at least 0 points, and everyone competes in every round they are
               eligible for.  This information is provided for entertainment purposes
               only.</p>
            </td>
         </tr>
         <tr>
            <td align="left" class="bodyText" valign="top">
               By&#160;<a class="bodyText" href="/tc?module=MemberProfile&cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="3">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=144400">tomek</a></td>
<td class="r1o">3373</td>
<td class="r1o">332</td>
<td class="r1o">$9,697.76</td>
<td class="r2o">31.11</td>
<td class="r2o">12.67</td>
<td class="r2o">76.66</td>
<td class="r3o">6.17</td>
<td class="r3o">15.39</td>
<td class="r3o">24.12</td>
<td class="r3o">30.98</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=272072">SnapDragon</a></td>
<td class="r1e">3302</td>
<td class="r1e">345</td>
<td class="r1e">$6,903.13</td>
<td class="r2e">43.31</td>
<td class="r2e">16.04</td>
<td class="r2e">60.14</td>
<td class="r3e">7.22</td>
<td class="r3e">14.89</td>
<td class="r3e">18.76</td>
<td class="r3e">19.26</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7445961">snewman</a></td>
<td class="r1o">3258</td>
<td class="r1o">325</td>
<td class="r1o">$5,690.82</td>
<td class="r2o">50.98</td>
<td class="r2o">17.50</td>
<td class="r2o">52.36</td>
<td class="r3o">7.34</td>
<td class="r3o">14.21</td>
<td class="r3o">16.54</td>
<td class="r3o">14.27</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=260835">reid</a></td>
<td class="r1e">3284</td>
<td class="r1e">402</td>
<td class="r1e">$6,444.30</td>
<td class="r2e">42.90</td>
<td class="r2e">16.29</td>
<td class="r2e">56.86</td>
<td class="r3e">8.63</td>
<td class="r3e">13.87</td>
<td class="r3e">16.01</td>
<td class="r3e">18.34</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=270505">John Dethridge</a></td>
<td class="r1o">3109</td>
<td class="r1o">475</td>
<td class="r1o">$3,709.96</td>
<td class="r2o">40.08</td>
<td class="r2o">10.58</td>
<td class="r2o">38.16</td>
<td class="r3o">10.69</td>
<td class="r3o">10.30</td>
<td class="r3o">8.64</td>
<td class="r3o">8.52</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=275071">antimatter</a></td>
<td class="r1e">2835</td>
<td class="r1e">342</td>
<td class="r1e">$1,101.96</td>
<td class="r2e">45.08</td>
<td class="r2e">3.13</td>
<td class="r2e">10.80</td>
<td class="r3e">4.87</td>
<td class="r3e">3.51</td>
<td class="r3e">1.76</td>
<td class="r3e">0.66</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=287496">bstanescu</a></td>
<td class="r1o">2888</td>
<td class="r1o">360</td>
<td class="r1o">$1,407.94</td>
<td class="r2o">48.17</td>
<td class="r2o">4.58</td>
<td class="r2o">15.25</td>
<td class="r3o">6.27</td>
<td class="r3o">4.93</td>
<td class="r3o">2.79</td>
<td class="r3o">1.26</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=262936">dgarthur</a></td>
<td class="r1e">2833</td>
<td class="r1e">462</td>
<td class="r1e">$1,381.46</td>
<td class="r2e">32.25</td>
<td class="r2e">3.73</td>
<td class="r2e">14.62</td>
<td class="r3e">6.58</td>
<td class="r3e">4.19</td>
<td class="r3e">2.41</td>
<td class="r3e">1.45</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=279471">haha</a></td>
<td class="r1o">2803</td>
<td class="r1o">419</td>
<td class="r1o">$1,099.18</td>
<td class="r2o">32.13</td>
<td class="r2o">2.87</td>
<td class="r2o">10.37</td>
<td class="r3o">4.80</td>
<td class="r3o">3.11</td>
<td class="r3o">1.65</td>
<td class="r3o">0.80</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=310430">gepa</a></td>
<td class="r1e">2630</td>
<td class="r1e">447</td>
<td class="r1e">$781.40</td>
<td class="r2e">21.18</td>
<td class="r2e">1.14</td>
<td class="r2e">5.33</td>
<td class="r3e">3.06</td>
<td class="r3e">1.42</td>
<td class="r3e">0.60</td>
<td class="r3e">0.25</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=287266">jms137</a></td>
<td class="r1o">2764</td>
<td class="r1o">342</td>
<td class="r1o">$816.67</td>
<td class="r2o">28.83</td>
<td class="r2o">1.53</td>
<td class="r2o">5.84</td>
<td class="r3o">2.94</td>
<td class="r3o">1.86</td>
<td class="r3o">0.79</td>
<td class="r3o">0.25</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=261024">grotmol</a></td>
<td class="r1e">2624</td>
<td class="r1e">678</td>
<td class="r1e">$1,408.09</td>
<td class="r2e">25.07</td>
<td class="r2e">2.98</td>
<td class="r2e">16.05</td>
<td class="r3e">9.05</td>
<td class="r3e">3.31</td>
<td class="r3e">1.92</td>
<td class="r3e">1.77</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=307060">AdrianKuegel</a></td>
<td class="r1o">2595</td>
<td class="r1o">217</td>
<td class="r1o">$566.57</td>
<td class="r2o">17.24</td>
<td class="r2o">0.10</td>
<td class="r2o">0.51</td>
<td class="r3o">0.33</td>
<td class="r3o">0.15</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7502813">monsoon</a></td>
<td class="r1e">2786</td>
<td class="r1e">438</td>
<td class="r1e">$1,122.25</td>
<td class="r2e">30.03</td>
<td class="r2e">2.73</td>
<td class="r2e">10.99</td>
<td class="r3e">5.28</td>
<td class="r3e">3.21</td>
<td class="r3e">1.66</td>
<td class="r3e">0.84</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=129672">doeth</a></td>
<td class="r1o">2402</td>
<td class="r1o">326</td>
<td class="r1o">$560.08</td>
<td class="r2o">6.28</td>
<td class="r2o">0.04</td>
<td class="r2o">0.34</td>
<td class="r3o">0.25</td>
<td class="r3o">0.08</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=153505">ambrose</a></td>
<td class="r1e">2503</td>
<td class="r1e">447</td>
<td class="r1e">$654.94</td>
<td class="r2e">14.69</td>
<td class="r2e">0.48</td>
<td class="r2e">2.83</td>
<td class="r3e">1.83</td>
<td class="r3e">0.68</td>
<td class="r3e">0.23</td>
<td class="r3e">0.08</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="3">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7210680">cnettel</a></td>
<td class="r1o">2411</td>
<td class="r1o">564</td>
<td class="r1o">$719.87</td>
<td class="r2o">13.72</td>
<td class="r2o">0.62</td>
<td class="r2o">4.50</td>
<td class="r3o">3.04</td>
<td class="r3o">0.93</td>
<td class="r3o">0.35</td>
<td class="r3o">0.17</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8547850">tmyklebu</a></td>
<td class="r1e">2369</td>
<td class="r1e">341</td>
<td class="r1e">$565.00</td>
<td class="r2e">8.87</td>
<td class="r2e">0.05</td>
<td class="r2e">0.53</td>
<td class="r3e">0.40</td>
<td class="r3e">0.10</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=301937">RalphFurmaniak</a></td>
<td class="r1o">2433</td>
<td class="r1o">472</td>
<td class="r1o">$661.15</td>
<td class="r2o">16.73</td>
<td class="r2o">0.45</td>
<td class="r2o">3.17</td>
<td class="r3o">2.20</td>
<td class="r3o">0.67</td>
<td class="r3o">0.22</td>
<td class="r3o">0.08</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7210729">ssancho2</a></td>
<td class="r1e">2410</td>
<td class="r1e">375</td>
<td class="r1e">$576.31</td>
<td class="r2e">8.35</td>
<td class="r2e">0.10</td>
<td class="r2e">0.86</td>
<td class="r3e">0.62</td>
<td class="r3e">0.19</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8365685">pparys</a></td>
<td class="r1o">2608</td>
<td class="r1o">611</td>
<td class="r1o">$1,085.00</td>
<td class="r2o">21.19</td>
<td class="r2o">2.06</td>
<td class="r2o">10.73</td>
<td class="r3o">6.09</td>
<td class="r3o">2.43</td>
<td class="r3o">1.27</td>
<td class="r3o">0.94</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8349097">hauser</a></td>
<td class="r1e">2390</td>
<td class="r1e">463</td>
<td class="r1e">$609.93</td>
<td class="r2e">10.65</td>
<td class="r2e">0.24</td>
<td class="r2e">1.80</td>
<td class="r3e">1.27</td>
<td class="r3e">0.38</td>
<td class="r3e">0.11</td>
<td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=158333">dvickrey</a></td>
<td class="r1o">2209</td>
<td class="r1o">384</td>
<td class="r1o">$556.34</td>
<td class="r2o">3.43</td>
<td class="r2o">0.01</td>
<td class="r2o">0.24</td>
<td class="r3o">0.20</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=307070">qsort</a></td>
<td class="r1e">2164</td>
<td class="r1e">499</td>
<td class="r1e">$579.87</td>
<td class="r2e">7.75</td>
<td class="r2e">0.08</td>
<td class="r2e">1.07</td>
<td class="r3e">0.87</td>
<td class="r3e">0.16</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td></tr>

</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
