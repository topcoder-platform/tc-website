<%@  page language="java"  %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
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
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tccc05/header_logo.gif"/></td>
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
               predict your chances to advance in the 2005 TopCoder Collegiate Challenge based only on
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
               By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=277659"><strong>radeye</strong></a><br />
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="r1o">3464</td>
<td class="r1o">234</td>
<td class="r1o">$12,391.50</td>
<td class="r2o">27.87</td>
<td class="r2o">16.24</td>
<td class="r2o">87.12</td>
<td class="r3o">2.05</td>
<td class="r3o">12.31</td>
<td class="r3o">31.29</td>
<td class="r3o">41.47</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="r1e">3353</td>
<td class="r1e">349</td>
<td class="r1e">$8,979.96</td>
<td class="r2e">29.12</td>
<td class="r2e">13.13</td>
<td class="r2e">76.43</td>
<td class="r3e">6.85</td>
<td class="r3e">19.00</td>
<td class="r3e">25.52</td>
<td class="r3e">25.06</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="r1o">3287</td>
<td class="r1o">465</td>
<td class="r1o">$7,186.99</td>
<td class="r2o">35.54</td>
<td class="r2o">15.45</td>
<td class="r2o">65.11</td>
<td class="r3o">10.66</td>
<td class="r3o">17.52</td>
<td class="r3o">16.81</td>
<td class="r3o">20.12</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="r1e">3077</td>
<td class="r1e">412</td>
<td class="r1e">$3,399.75</td>
<td class="r2e">48.21</td>
<td class="r2e">13.22</td>
<td class="r2e">39.38</td>
<td class="r3e">11.57</td>
<td class="r3e">12.96</td>
<td class="r3e">8.95</td>
<td class="r3e">5.90</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="r1o">2824</td>
<td class="r1o">282</td>
<td class="r1o">$865.99</td>
<td class="r2o">40.70</td>
<td class="r2o">2.99</td>
<td class="r2o">8.45</td>
<td class="r3o">4.14</td>
<td class="r3o">2.99</td>
<td class="r3o">1.11</td>
<td class="r3o">0.20</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="r1e">2982</td>
<td class="r1e">421</td>
<td class="r1e">$2,121.52</td>
<td class="r2e">51.23</td>
<td class="r2e">11.10</td>
<td class="r2e">24.66</td>
<td class="r3e">9.24</td>
<td class="r3e">7.68</td>
<td class="r3e">4.88</td>
<td class="r3e">2.86</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310333">kalinov</a></td>
<td class="r1o">2472</td>
<td class="r1o">483</td>
<td class="r1o">$640.17</td>
<td class="r2o">18.91</td>
<td class="r2o">0.90</td>
<td class="r2o">3.16</td>
<td class="r3o">2.17</td>
<td class="r3o">0.68</td>
<td class="r3o">0.24</td>
<td class="r3o">0.08</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7479769">marian</a></td>
<td class="r1e">2828</td>
<td class="r1e">324</td>
<td class="r1e">$995.80</td>
<td class="r2e">39.82</td>
<td class="r2e">3.57</td>
<td class="r2e">10.83</td>
<td class="r3e">5.22</td>
<td class="r3e">3.70</td>
<td class="r3e">1.54</td>
<td class="r3e">0.38</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310430">gepa</a></td>
<td class="r1o">2738</td>
<td class="r1o">308</td>
<td class="r1o">$744.33</td>
<td class="r2o">34.13</td>
<td class="r2o">1.95</td>
<td class="r2o">6.16</td>
<td class="r3o">3.32</td>
<td class="r3o">2.08</td>
<td class="r3o">0.65</td>
<td class="r3o">0.11</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262056">mathijs</a></td>
<td class="r1e">2744</td>
<td class="r1e">463</td>
<td class="r1e">$1,208.03</td>
<td class="r2e">32.87</td>
<td class="r2e">3.65</td>
<td class="r2e">13.23</td>
<td class="r3e">6.85</td>
<td class="r3e">3.89</td>
<td class="r3e">1.72</td>
<td class="r3e">0.77</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308453">overwise</a></td>
<td class="r1o">2652</td>
<td class="r1o">475</td>
<td class="r1o">$1,064.00</td>
<td class="r2o">25.30</td>
<td class="r2o">2.13</td>
<td class="r2o">9.50</td>
<td class="r3o">5.54</td>
<td class="r3o">2.49</td>
<td class="r3o">1.06</td>
<td class="r3o">0.42</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=9906197">krijgertje</a></td>
<td class="r1e">2676</td>
<td class="r1e">488</td>
<td class="r1e">$941.81</td>
<td class="r2e">30.65</td>
<td class="r2e">2.99</td>
<td class="r2e">8.62</td>
<td class="r3e">4.89</td>
<td class="r3e">2.23</td>
<td class="r3e">1.02</td>
<td class="r3e">0.48</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="r1o">2512</td>
<td class="r1o">240</td>
<td class="r1o">$499.81</td>
<td class="r2o">11.31</td>
<td class="r2o">0.10</td>
<td class="r2o">0.17</td>
<td class="r3o">0.13</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7452866">Im2Good</a></td>
<td class="r1e">2671</td>
<td class="r1e">485</td>
<td class="r1e">$1,082.72</td>
<td class="r2e">26.24</td>
<td class="r2e">2.44</td>
<td class="r2e">10.72</td>
<td class="r3e">6.11</td>
<td class="r3e">2.83</td>
<td class="r3e">1.25</td>
<td class="r3e">0.53</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309982">cyfra</a></td>
<td class="r1o">2714</td>
<td class="r1o">491</td>
<td class="r1o">$1,241.14</td>
<td class="r2o">30.69</td>
<td class="r2o">3.40</td>
<td class="r2o">12.97</td>
<td class="r3o">6.93</td>
<td class="r3o">3.65</td>
<td class="r3o">1.62</td>
<td class="r3o">0.78</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260987">dangelo</a></td>
<td class="r1e">2395</td>
<td class="r1e">283</td>
<td class="r1e">$505.05</td>
<td class="r2e">6.90</td>
<td class="r2e">0.05</td>
<td class="r2e">0.35</td>
<td class="r3e">0.27</td>
<td class="r3e">0.07</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="r1o">2632</td>
<td class="r1o">473</td>
<td class="r1o">$987.19</td>
<td class="r2o">24.26</td>
<td class="r2o">1.90</td>
<td class="r2o">8.65</td>
<td class="r3o">5.14</td>
<td class="r3o">2.24</td>
<td class="r3o">0.92</td>
<td class="r3o">0.35</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8357090">misof</a></td>
<td class="r1e">2730</td>
<td class="r1e">420</td>
<td class="r1e">$850.67</td>
<td class="r2e">34.88</td>
<td class="r2e">3.19</td>
<td class="r2e">7.80</td>
<td class="r3e">4.24</td>
<td class="r3e">2.23</td>
<td class="r3e">0.97</td>
<td class="r3e">0.36</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=264869">ante</a></td>
<td class="r1o">2539</td>
<td class="r1o">472</td>
<td class="r1o">$758.27</td>
<td class="r2o">22.29</td>
<td class="r2o">1.29</td>
<td class="r2o">4.10</td>
<td class="r3o">2.67</td>
<td class="r3o">0.95</td>
<td class="r3o">0.35</td>
<td class="r3o">0.12</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7502813">monsoon</a></td>
<td class="r1e">2415</td>
<td class="r1e">248</td>
<td class="r1e">$529.47</td>
<td class="r2e">5.01</td>
<td class="r2e">0.02</td>
<td class="r2e">0.16</td>
<td class="r3e">0.12</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="r1o">2408</td>
<td class="r1o">283</td>
<td class="r1o">$506.34</td>
<td class="r2o">7.44</td>
<td class="r2o">0.06</td>
<td class="r2o">0.39</td>
<td class="r3o">0.29</td>
<td class="r3o">0.09</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=158333">dvickrey</a></td>
<td class="r1e">2284</td>
<td class="r1e">306</td>
<td class="r1e">$575.37</td>
<td class="r2e">4.21</td>
<td class="r2e">0.02</td>
<td class="r2e">0.20</td>
<td class="r3e">0.16</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=289309">qixin99</a></td>
<td class="r1o">2315</td>
<td class="r1o">453</td>
<td class="r1o">$669.34</td>
<td class="r2o">9.55</td>
<td class="r2o">0.20</td>
<td class="r2o">1.63</td>
<td class="r3o">1.25</td>
<td class="r3o">0.29</td>
<td class="r3o">0.07</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10540401">kindloaf</a></td>
<td class="r1e">1827</td>
<td class="r1e">547</td>
<td class="r1e">$574.79</td>
<td class="r2e">2.86</td>
<td class="r2e">0.02</td>
<td class="r2e">0.20</td>
<td class="r3e">0.18</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
</table>
<br/>
<br/>
</td></tr>
</table>
</body>

</html>
