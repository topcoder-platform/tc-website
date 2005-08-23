<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
</head>

<body>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco05/header_logo.gif"/></td>
      </tr>
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>jdmetz's odds</h2></td>
            <td class="bodyText" align=right>
            <!-- round links-->
            <jsp:include page="odds_links.jsp" >
               <jsp:param name="selectedRound" value="round2"/>
            </jsp:include>
            </td>
         </tr>
         
         <tr>
            <td align="left" class="bodyText" valign="top">
               <img src="/i/m/jdmetz_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left" class="myStatsPhoto"/>
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top" rowspan="2">
            <p>
            Beat the odds! These results of 1,000,000 Monte Carlo simulations predict your chances to advance in the 2005 TopCoder Open based only on your current TopCoder rating and volatility.  Try your best to beat these odds as you advance through the tournament.
            <br><br>
            The model used here is a normal distribution with the mean of your rating and standard deviation of your volatility, assuming every advancing coder competes in every round they are eligible for and scores more than 0 points.  There are obvious flaws with these assumptions, and this information is provided for entertainment purposes only.
            <br><br>
            The "Earnings" column includes prizes for the top three finishers in each room for the online rounds, excluding already completed rounds.
            </p>
            </td>
         </tr>
         <tr>
            <td align="left" class="bodyText" valign="top">
               By&#160;<tc-webtag:handle coderId="7459326" context="algorithm"/><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>

<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>

</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=272072" >SnapDragon</a></td><td class="r1o">3375</td><td class="r1o">251</td><td class="r1o">$10479.30</td><td class="r2o">100.00</td><td class="r2o">100.00</td><td class="r2o">100.00</td><td class="r2o">19.78</td><td class="r2o">14.24</td><td class="r2o">93.87</td><td class="r3o">9.96</td><td class="r3o">16.82</td><td class="r3o">25.90</td><td class="r3o">32.36</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=144400" >tomek</a></td><td class="r1e">3281</td><td class="r1e">291</td><td class="r1e">$7607.62</td><td class="r2e">100.00</td><td class="r2e">100.00</td><td class="r2e">99.94</td><td class="r2e">27.45</td><td class="r2e">16.56</td><td class="r2e">86.37</td><td class="r3e">12.61</td><td class="r3e">16.74</td><td class="r3e">20.06</td><td class="r3e">20.20</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10574855" >Petr</a></td><td class="r1o">3131</td><td class="r1o">342</td><td class="r1o">$4304.96</td><td class="r2o">100.00</td><td class="r2o">99.91</td><td class="r2o">98.91</td><td class="r2o">37.94</td><td class="r2o">16.62</td><td class="r2o">67.35</td><td class="r3o">10.57</td><td class="r3o">11.23</td><td class="r3o">10.68</td><td class="r3o">9.30</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8357090" >misof</a></td><td class="r1e">3127</td><td class="r1e">451</td><td class="r1e">$4291.54</td><td class="r2e">99.86</td><td class="r2e">98.97</td><td class="r2e">95.14</td><td class="r2e">31.20</td><td class="r2e">13.86</td><td class="r2e">61.81</td><td class="r3e">8.07</td><td class="r3e">8.27</td><td class="r3e">8.63</td><td class="r3e">11.14</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=270505" >John Dethridge</a></td><td class="r1o">3038</td><td class="r1o">227</td><td class="r1o">$2148.68</td><td class="r2o">100.00</td><td class="r2o">100.00</td><td class="r2o">99.89</td><td class="r2o">58.49</td><td class="r2o">17.56</td><td class="r2o">50.95</td><td class="r3o">10.67</td><td class="r3o">8.45</td><td class="r3o">4.98</td><td class="r3o">1.95</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=260835" >reid</a></td><td class="r1e">3017</td><td class="r1e">469</td><td class="r1e">$2789.60</td><td class="r2e">99.57</td><td class="r2e">97.57</td><td class="r2e">90.61</td><td class="r2e">35.50</td><td class="r2e">12.76</td><td class="r2e">45.87</td><td class="r3e">5.55</td><td class="r3e">5.30</td><td class="r3e">5.17</td><td class="r3e">6.41</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8355516" >Eryx</a></td><td class="r1o">3011</td><td class="r1o">329</td><td class="r1o">$2246.03</td><td class="r2o">99.99</td><td class="r2o">99.80</td><td class="r2o">97.82</td><td class="r2o">51.46</td><td class="r2o">16.19</td><td class="r2o">46.06</td><td class="r3o">7.44</td><td class="r3o">6.39</td><td class="r3o">4.89</td><td class="r3o">3.28</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10481120" >ivan_metelsky</a></td><td class="r1e">3005</td><td class="r1e">469</td><td class="r1e">$2707.74</td><td class="r2e">99.52</td><td class="r2e">97.39</td><td class="r2e">90.05</td><td class="r2e">33.89</td><td class="r2e">11.89</td><td class="r2e">45.34</td><td class="r3e">5.41</td><td class="r3e">5.19</td><td class="r3e">5.08</td><td class="r3e">6.10</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7445961" >snewman</a></td><td class="r1o">2973</td><td class="r1o">323</td><td class="r1o">$1936.56</td><td class="r2o">99.98</td><td class="r2o">99.75</td><td class="r2o">97.36</td><td class="r2o">48.07</td><td class="r2o">13.18</td><td class="r2o">42.94</td><td class="r3o">6.62</td><td class="r3o">5.37</td><td class="r3o">3.94</td><td class="r3o">2.52</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=311170" >bladerunner</a></td><td class="r1e">2963</td><td class="r1e">314</td><td class="r1e">$1830.04</td><td class="r2e">99.99</td><td class="r2e">99.79</td><td class="r2e">97.56</td><td class="r2e">49.23</td><td class="r2e">12.71</td><td class="r2e">41.37</td><td class="r3e">6.49</td><td class="r3e">5.29</td><td class="r3e">3.72</td><td class="r3e">2.16</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=262056" >mathijs</a></td><td class="r1o">2802</td><td class="r1o">385</td><td class="r1o">$978.44</td><td class="r2o">99.58</td><td class="r2o">96.97</td><td class="r2o">86.26</td><td class="r2o">36.82</td><td class="r2o">6.24</td><td class="r2o">21.75</td><td class="r3o">2.42</td><td class="r3o">1.82</td><td class="r3o">1.27</td><td class="r3o">0.84</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8394868" >rem</a></td><td class="r1e">2774</td><td class="r1e">365</td><td class="r1e">$806.60</td><td class="r2e">99.65</td><td class="r2e">97.19</td><td class="r2e">86.26</td><td class="r2e">38.27</td><td class="r2e">5.44</td><td class="r2e">17.48</td><td class="r3e">1.86</td><td class="r3e">1.32</td><td class="r3e">0.82</td><td class="r3e">0.47</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=310333" >kalinov</a></td><td class="r1o">2754</td><td class="r1o">363</td><td class="r1o">$732.09</td><td class="r2o">99.60</td><td class="r2o">96.91</td><td class="r2o">85.13</td><td class="r2o">37.65</td><td class="r2o">4.94</td><td class="r2o">15.11</td><td class="r3o">1.54</td><td class="r3o">1.05</td><td class="r3o">0.66</td><td class="r3o">0.36</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269554" >Yarin</a></td><td class="r1e">2721</td><td class="r1e">532</td><td class="r1e">$838.36</td><td class="r2e">96.03</td><td class="r2e">85.96</td><td class="r2e">66.08</td><td class="r2e">21.81</td><td class="r2e">4.17</td><td class="r2e">16.37</td><td class="r3e">1.40</td><td class="r3e">1.16</td><td class="r3e">1.02</td><td class="r3e">1.09</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7462740" >ploh</a></td><td class="r1o">2715</td><td class="r1o">427</td><td class="r1o">$711.40</td><td class="r2o">98.48</td><td class="r2o">92.46</td><td class="r2o">75.44</td><td class="r2o">27.88</td><td class="r2o">3.98</td><td class="r2o">14.65</td><td class="r3o">1.34</td><td class="r3o">1.00</td><td class="r3o">0.69</td><td class="r3o">0.50</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274023" >venco</a></td><td class="r1e">2694</td><td class="r1e">252</td><td class="r1e">$532.99</td><td class="r2e">99.98</td><td class="r2e">99.39</td><td class="r2e">91.84</td><td class="r2e">40.07</td><td class="r2e">1.90</td><td class="r2e">6.44</td><td class="r3e">0.53</td><td class="r3e">0.23</td><td class="r3e">0.08</td><td class="r3e">0.02</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287105" >lars</a></td><td class="r1o">2687</td><td class="r1o">298</td><td class="r1o">$545.80</td><td class="r2o">99.87</td><td class="r2o">98.15</td><td class="r2o">86.66</td><td class="r2o">35.38</td><td class="r2o">2.36</td><td class="r2o">8.43</td><td class="r3o">0.72</td><td class="r3o">0.38</td><td class="r3o">0.17</td><td class="r3o">0.05</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9906197" >krijgertje</a></td><td class="r1e">2666</td><td class="r1e">398</td><td class="r1e">$567.58</td><td class="r2e">98.60</td><td class="r2e">92.50</td><td class="r2e">74.11</td><td class="r2e">26.37</td><td class="r2e">2.80</td><td class="r2e">10.71</td><td class="r3e">0.90</td><td class="r3e">0.61</td><td class="r3e">0.38</td><td class="r3e">0.22</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10599449" >natori</a></td><td class="r1o">2651</td><td class="r1o">321</td><td class="r1o">$497.98</td><td class="r2o">99.63</td><td class="r2o">96.45</td><td class="r2o">81.08</td><td class="r2o">30.54</td><td class="r2o">1.95</td><td class="r2o">6.93</td><td class="r3o">0.54</td><td class="r3o">0.29</td><td class="r3o">0.14</td><td class="r3o">0.05</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=277659" >radeye</a></td><td class="r1e">2647</td><td class="r1e">334</td><td class="r1e">$492.34</td><td class="r2e">99.49</td><td class="r2e">95.65</td><td class="r2e">79.17</td><td class="r2e">29.49</td><td class="r2e">2.01</td><td class="r2e">6.91</td><td class="r3e">0.54</td><td class="r3e">0.30</td><td class="r3e">0.15</td><td class="r3e">0.06</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8365685" >pparys</a></td><td class="r1o">2628</td><td class="r1o">318</td><td class="r1o">$464.34</td><td class="r2o">99.58</td><td class="r2o">96.00</td><td class="r2o">79.22</td><td class="r2o">28.30</td><td class="r2o">1.56</td><td class="r2o">5.40</td><td class="r3o">0.38</td><td class="r3o">0.20</td><td class="r3o">0.09</td><td class="r3o">0.03</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156592" >benetin</a></td><td class="r1e">2614</td><td class="r1e">318</td><td class="r1e">$449.31</td><td class="r2e">99.52</td><td class="r2e">95.57</td><td class="r2e">77.68</td><td class="r2e">26.43</td><td class="r2e">1.34</td><td class="r2e">5.03</td><td class="r3e">0.35</td><td class="r3e">0.18</td><td class="r3e">0.07</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301937" >RalphFurmaniak</a></td><td class="r1o">2597</td><td class="r1o">274</td><td class="r1o">$438.30</td><td class="r2o">99.84</td><td class="r2o">97.40</td><td class="r2o">81.23</td><td class="r2o">25.96</td><td class="r2o">0.80</td><td class="r2o">3.15</td><td class="r3o">0.18</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=309982" >cyfra</a></td><td class="r1e">2564</td><td class="r1e">381</td><td class="r1e">$397.20</td><td class="r2e">97.93</td><td class="r2e">89.04</td><td class="r2e">65.03</td><td class="r2e">18.87</td><td class="r2e">1.18</td><td class="r2e">5.23</td><td class="r3e">0.34</td><td class="r3e">0.19</td><td class="r3e">0.10</td><td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7479769" >marian</a></td><td class="r1o">2561</td><td class="r1o">263</td><td class="r1o">$410.53</td><td class="r2o">99.83</td><td class="r2o">97.05</td><td class="r2o">78.40</td><td class="r2o">21.89</td><td class="r2o">0.45</td><td class="r2o">2.01</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958600" >Zis</a></td><td class="r1e">2553</td><td class="r1e">316</td><td class="r1e">$421.36</td><td class="r2e">99.20</td><td class="r2e">93.47</td><td class="r2e">71.00</td><td class="r2e">20.20</td><td class="r2e">0.71</td><td class="r2e">3.12</td><td class="r3e">0.17</td><td class="r3e">0.08</td><td class="r3e">0.03</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390467" >lovro</a></td><td class="r1o">2546</td><td class="r1o">480</td><td class="r1o">$451.35</td><td class="r2o">94.30</td><td class="r2o">79.98</td><td class="r2o">53.85</td><td class="r2o">14.68</td><td class="r2o">1.42</td><td class="r2o">6.45</td><td class="r3o">0.43</td><td class="r3o">0.30</td><td class="r3o">0.21</td><td class="r3o">0.16</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=279471" >haha</a></td><td class="r1e">2535</td><td class="r1e">408</td><td class="r1e">$415.63</td><td class="r2e">96.62</td><td class="r2e">85.04</td><td class="r2e">58.75</td><td class="r2e">16.19</td><td class="r2e">1.05</td><td class="r2e">4.57</td><td class="r3e">0.27</td><td class="r3e">0.16</td><td class="r3e">0.09</td><td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293874" >nicka81</a></td><td class="r1o">2535</td><td class="r1o">442</td><td class="r1o">$424.49</td><td class="r2o">95.44</td><td class="r2o">82.18</td><td class="r2o">55.70</td><td class="r2o">15.20</td><td class="r2o">1.18</td><td class="r2o">5.32</td><td class="r3o">0.33</td><td class="r3o">0.22</td><td class="r3o">0.14</td><td class="r3o">0.08</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=262936" >dgarthur</a></td><td class="r1e">2507</td><td class="r1e">530</td><td class="r1e">$411.59</td><td class="r2e">91.24</td><td class="r2e">73.29</td><td class="r2e">46.16</td><td class="r2e">11.50</td><td class="r2e">1.19</td><td class="r2e">5.84</td><td class="r3e">0.36</td><td class="r3e">0.27</td><td class="r3e">0.20</td><td class="r3e">0.18</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=261024" >grotmol</a></td><td class="r1o">2505</td><td class="r1o">363</td><td class="r1o">$376.31</td><td class="r2o">97.56</td><td class="r2o">87.08</td><td class="r2o">59.59</td><td class="r2o">14.98</td><td class="r2o">0.62</td><td class="r2o">2.87</td><td class="r3o">0.14</td><td class="r3o">0.07</td><td class="r3o">0.04</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7452866" >Im2Good</a></td><td class="r1e">2500</td><td class="r1e">365</td><td class="r1e">$371.73</td><td class="r2e">97.43</td><td class="r2e">86.58</td><td class="r2e">58.79</td><td class="r2e">14.46</td><td class="r2e">0.58</td><td class="r2e">2.82</td><td class="r3e">0.14</td><td class="r3e">0.08</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390224" >gawry</a></td><td class="r1o">2494</td><td class="r1o">478</td><td class="r1o">$377.27</td><td class="r2o">92.98</td><td class="r2o">76.40</td><td class="r2o">48.37</td><td class="r2o">11.89</td><td class="r2o">0.97</td><td class="r2o">4.74</td><td class="r3o">0.28</td><td class="r3o">0.19</td><td class="r3o">0.13</td><td class="r3o">0.08</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7394165" >PaulJefferys</a></td><td class="r1e">2487</td><td class="r1e">390</td><td class="r1e">$356.75</td><td class="r2e">96.36</td><td class="r2e">83.53</td><td class="r2e">54.76</td><td class="r2e">13.08</td><td class="r2e">0.59</td><td class="r2e">3.01</td><td class="r3e">0.16</td><td class="r3e">0.08</td><td class="r3e">0.04</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14970299" >Egor</a></td><td class="r1o">2480</td><td class="r1o">336</td><td class="r1o">$350.97</td><td class="r2o">98.01</td><td class="r2o">87.95</td><td class="r2o">59.10</td><td class="r2o">13.32</td><td class="r2o">0.37</td><td class="r2o">1.90</td><td class="r3o">0.07</td><td class="r3o">0.04</td><td class="r3o">0.02</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7502813" >monsoon</a></td><td class="r1e">2450</td><td class="r1e">348</td><td class="r1e">$316.99</td><td class="r2e">97.13</td><td class="r2e">84.67</td><td class="r2e">53.66</td><td class="r2e">11.16</td><td class="r2e">0.29</td><td class="r2e">1.60</td><td class="r3e">0.06</td><td class="r3e">0.03</td><td class="r3e">0.01</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=264869" >ante</a></td><td class="r1o">2435</td><td class="r1o">339</td><td class="r1o">$302.77</td><td class="r2o">97.16</td><td class="r2o">84.41</td><td class="r2o">52.35</td><td class="r2o">10.15</td><td class="r2o">0.22</td><td class="r2o">1.27</td><td class="r3o">0.04</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8398526" >Tomy</a></td><td class="r1e">2432</td><td class="r1e">271</td><td class="r1e">$314.56</td><td class="r2e">99.12</td><td class="r2e">90.89</td><td class="r2e">58.67</td><td class="r2e">9.36</td><td class="r2e">0.08</td><td class="r2e">0.50</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7393427" >texel</a></td><td class="r1o">2429</td><td class="r1o">365</td><td class="r1o">$293.25</td><td class="r2o">96.02</td><td class="r2o">81.36</td><td class="r2o">49.20</td><td class="r2o">9.76</td><td class="r2o">0.27</td><td class="r2o">1.49</td><td class="r3o">0.05</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153656" >elizarov</a></td><td class="r1e">2425</td><td class="r1e">459</td><td class="r1e">$291.06</td><td class="r2e">91.76</td><td class="r2e">72.54</td><td class="r2e">42.12</td><td class="r2e">8.89</td><td class="r2e">0.49</td><td class="r2e">2.67</td><td class="r3e">0.13</td><td class="r3e">0.08</td><td class="r3e">0.05</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287266" >jms137</a></td><td class="r1o">2422</td><td class="r1o">323</td><td class="r1o">$292.21</td><td class="r2o">97.48</td><td class="r2o">85.02</td><td class="r2o">51.91</td><td class="r2o">9.15</td><td class="r2o">0.15</td><td class="r2o">0.91</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275071" >antimatter</a></td><td class="r1e">2419</td><td class="r1e">450</td><td class="r1e">$283.20</td><td class="r2e">91.94</td><td class="r2e">72.78</td><td class="r2e">41.98</td><td class="r2e">8.72</td><td class="r2e">0.43</td><td class="r2e">2.41</td><td class="r3e">0.12</td><td class="r3e">0.07</td><td class="r3e">0.04</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7433858" >liympanda</a></td><td class="r1o">2411</td><td class="r1o">307</td><td class="r1o">$284.02</td><td class="r2o">97.88</td><td class="r2o">85.74</td><td class="r2o">51.67</td><td class="r2o">8.31</td><td class="r2o">0.11</td><td class="r2o">0.65</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8601171" >HilbertRaum</a></td><td class="r1e">2397</td><td class="r1e">442</td><td class="r1e">$262.72</td><td class="r2e">91.58</td><td class="r2e">71.56</td><td class="r2e">39.98</td><td class="r2e">7.81</td><td class="r2e">0.35</td><td class="r2e">2.02</td><td class="r3e">0.09</td><td class="r3e">0.05</td><td class="r3e">0.03</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7442498" >marek.cygan</a></td><td class="r1o">2393</td><td class="r1o">464</td><td class="r1o">$259.73</td><td class="r2o">90.31</td><td class="r2o">69.25</td><td class="r2o">38.28</td><td class="r2o">7.46</td><td class="r2o">0.36</td><td class="r2o">2.18</td><td class="r3o">0.10</td><td class="r3o">0.06</td><td class="r3o">0.04</td><td class="r3o">0.02</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287568" >tjq</a></td><td class="r1e">2387</td><td class="r1e">285</td><td class="r1e">$265.56</td><td class="r2e">98.21</td><td class="r2e">86.19</td><td class="r2e">49.75</td><td class="r2e">6.55</td><td class="r2e">0.05</td><td class="r2e">0.35</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11829284" >andrewzta</a></td><td class="r1o">2365</td><td class="r1o">246</td><td class="r1o">$254.05</td><td class="r2o">99.03</td><td class="r2o">88.70</td><td class="r2o">49.18</td><td class="r2o">4.67</td><td class="r2o">0.01</td><td class="r2o">0.12</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=284007" >Ryan</a></td><td class="r1e">2361</td><td class="r1e">239</td><td class="r1e">$251.87</td><td class="r2e">99.14</td><td class="r2e">89.11</td><td class="r2e">48.97</td><td class="r2e">4.29</td><td class="r2e">0.01</td><td class="r2e">0.10</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=302501" >PMH</a></td><td class="r1o">2355</td><td class="r1o">326</td><td class="r1o">$228.34</td><td class="r2o">95.87</td><td class="r2o">78.75</td><td class="r2o">41.65</td><td class="r2o">5.57</td><td class="r2o">0.06</td><td class="r2o">0.46</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7311097" >m00tz</a></td><td class="r1e">2346</td><td class="r1e">334</td><td class="r1e">$220.74</td><td class="r2e">95.23</td><td class="r2e">77.00</td><td class="r2e">39.80</td><td class="r2e">5.28</td><td class="r2e">0.06</td><td class="r2e">0.46</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=310430" >gepa</a></td><td class="r1o">2346</td><td class="r1o">290</td><td class="r1o">$232.77</td><td class="r2o">97.26</td><td class="r2o">81.94</td><td class="r2o">42.63</td><td class="r2o">4.63</td><td class="r2o">0.03</td><td class="r2o">0.23</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10332088" >martinp534</a></td><td class="r1e">2343</td><td class="r1e">239</td><td class="r1e">$242.10</td><td class="r2e">98.95</td><td class="r2e">87.57</td><td class="r2e">45.53</td><td class="r2e">3.50</td><td class="r2e">0.01</td><td class="r2e">0.07</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7459080" >ardiankp</a></td><td class="r1o">2328</td><td class="r1o">285</td><td class="r1o">$222.32</td><td class="r2o">97.07</td><td class="r2o">80.68</td><td class="r2o">39.93</td><td class="r2o">3.85</td><td class="r2o">0.02</td><td class="r2o">0.16</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7446789" >JongMan</a></td><td class="r1e">2326</td><td class="r1e">504</td><td class="r1e">$225.22</td><td class="r2e">85.68</td><td class="r2e">60.39</td><td class="r2e">29.93</td><td class="r2e">5.14</td><td class="r2e">0.25</td><td class="r2e">1.62</td><td class="r3e">0.07</td><td class="r3e">0.04</td><td class="r3e">0.03</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=288584" >LunaticFringe</a></td><td class="r1o">2325</td><td class="r1o">382</td><td class="r1o">$218.51</td><td class="r2o">92.03</td><td class="r2o">70.01</td><td class="r2o">34.49</td><td class="r2o">4.86</td><td class="r2o">0.09</td><td class="r2o">0.64</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7485898" >Andrew_Lazarev</a></td><td class="r1e">2282</td><td class="r1e">397</td><td class="r1e">$184.51</td><td class="r2e">89.34</td><td class="r2e">64.00</td><td class="r2e">28.77</td><td class="r2e">3.59</td><td class="r2e">0.06</td><td class="r2e">0.48</td><td class="r3e">0.01</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=297823" >madking</a></td><td class="r1o">2276</td><td class="r1o">218</td><td class="r1o">$177.59</td><td class="r2o">98.71</td><td class="r2o">83.25</td><td class="r2o">33.43</td><td class="r2o">1.24</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=263396" >Abednego</a></td><td class="r1e">2274</td><td class="r1e">424</td><td class="r1e">$184.20</td><td class="r2e">87.40</td><td class="r2e">61.07</td><td class="r2e">27.25</td><td class="r2e">3.59</td><td class="r2e">0.08</td><td class="r2e">0.60</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=308453" >overwise</a></td><td class="r1o">2273</td><td class="r1o">310</td><td class="r1o">$179.37</td><td class="r2o">94.07</td><td class="r2o">71.45</td><td class="r2o">30.40</td><td class="r2o">2.53</td><td class="r2o">0.01</td><td class="r2o">0.12</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=346607" >kalmakka</a></td><td class="r1e">2272</td><td class="r1e">454</td><td class="r1e">$187.10</td><td class="r2e">85.64</td><td class="r2e">58.63</td><td class="r2e">26.26</td><td class="r2e">3.68</td><td class="r2e">0.10</td><td class="r2e">0.75</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.01</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=286375" >bjacoke001</a></td><td class="r1o">2269</td><td class="r1o">366</td><td class="r1o">$180.27</td><td class="r2o">90.52</td><td class="r2o">65.29</td><td class="r2o">28.25</td><td class="r2o">3.03</td><td class="r2o">0.03</td><td class="r2o">0.31</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2058177" >Revenger</a></td><td class="r1e">2265</td><td class="r1e">591</td><td class="r1e">$200.00</td><td class="r2e">79.03</td><td class="r2e">50.52</td><td class="r2e">22.98</td><td class="r2e">3.67</td><td class="r2e">0.23</td><td class="r2e">1.62</td><td class="r3e">0.07</td><td class="r3e">0.05</td><td class="r3e">0.04</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=129672" >doeth</a></td><td class="r1o">2245</td><td class="r1o">273</td><td class="r1o">$154.50</td><td class="r2o">95.25</td><td class="r2o">72.03</td><td class="r2o">27.08</td><td class="r2o">1.47</td><td class="r2o">0.00</td><td class="r2o">0.04</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=12021745" >Rounder</a></td><td class="r1e">2237</td><td class="r1e">522</td><td class="r1e">$171.05</td><td class="r2e">80.51</td><td class="r2e">51.24</td><td class="r2e">21.92</td><td class="r2e">3.10</td><td class="r2e">0.12</td><td class="r2e">0.94</td><td class="r3e">0.03</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.01</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=263379" >StefanPochmann</a></td><td class="r1o">2235</td><td class="r1o">375</td><td class="r1o">$155.04</td><td class="r2o">88.31</td><td class="r2o">60.47</td><td class="r2o">24.07</td><td class="r2o">2.36</td><td class="r2o">0.02</td><td class="r2o">0.22</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7546003" >dmytro</a></td><td class="r1e">2222</td><td class="r1e">295</td><td class="r1e">$138.23</td><td class="r2e">92.92</td><td class="r2e">66.52</td><td class="r2e">23.71</td><td class="r2e">1.32</td><td class="r2e">0.00</td><td class="r2e">0.05</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153505" >ambrose</a></td><td class="r1o">2219</td><td class="r1o">321</td><td class="r1o">$138.06</td><td class="r2o">91.00</td><td class="r2o">63.25</td><td class="r2o">22.97</td><td class="r2o">1.53</td><td class="r2o">0.01</td><td class="r2o">0.08</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7428266" >Klinck</a></td><td class="r1e">2212</td><td class="r1e">427</td><td class="r1e">$144.25</td><td class="r2e">83.91</td><td class="r2e">54.03</td><td class="r2e">21.04</td><td class="r2e">2.27</td><td class="r2e">0.04</td><td class="r2e">0.34</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15616795" >malcin</a></td><td class="r1o">2210</td><td class="r1o">634</td><td class="r1o">$170.53</td><td class="r2o">74.75</td><td class="r2o">44.64</td><td class="r2o">18.88</td><td class="r2o">2.77</td><td class="r2o">0.18</td><td class="r2o">1.33</td><td class="r3o">0.05</td><td class="r3o">0.04</td><td class="r3o">0.03</td><td class="r3o">0.03</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289435" >nullspace</a></td><td class="r1e">2210</td><td class="r1e">409</td><td class="r1e">$140.79</td><td class="r2e">84.84</td><td class="r2e">54.92</td><td class="r2e">21.02</td><td class="r2e">2.13</td><td class="r2e">0.03</td><td class="r2e">0.27</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10676764" >algostorm</a></td><td class="r1o">2208</td><td class="r1o">390</td><td class="r1o">$137.30</td><td class="r2o">85.89</td><td class="r2o">56.16</td><td class="r2o">21.03</td><td class="r2o">1.95</td><td class="r2o">0.02</td><td class="r2o">0.20</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11888018" >Snail</a></td><td class="r1e">2206</td><td class="r1e">364</td><td class="r1e">$133.37</td><td class="r2e">87.43</td><td class="r2e">57.76</td><td class="r2e">21.10</td><td class="r2e">1.70</td><td class="r2e">0.01</td><td class="r2e">0.14</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=154754" >Ken_Vogel</a></td><td class="r1o">2199</td><td class="r1o">424</td><td class="r1o">$135.59</td><td class="r2o">83.38</td><td class="r2o">52.86</td><td class="r2o">19.95</td><td class="r2o">2.02</td><td class="r2o">0.03</td><td class="r2o">0.29</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=308657" >skanthak</a></td><td class="r1e">2199</td><td class="r1e">291</td><td class="r1e">$119.32</td><td class="r2e">92.08</td><td class="r2e">63.56</td><td class="r2e">20.65</td><td class="r2e">0.96</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155880" >NPermyakov</a></td><td class="r1o">2199</td><td class="r1o">488</td><td class="r1o">$142.28</td><td class="r2o">80.03</td><td class="r2o">49.24</td><td class="r2o">19.31</td><td class="r2o">2.34</td><td class="r2o">0.06</td><td class="r2o">0.51</td><td class="r3o">0.01</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155275" >DjinnKahn</a></td><td class="r1e">2191</td><td class="r1e">199</td><td class="r1e">$97.32</td><td class="r2e">97.79</td><td class="r2e">73.55</td><td class="r2e">17.90</td><td class="r2e">0.21</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7210680" >cnettel</a></td><td class="r1o">2186</td><td class="r1o">494</td><td class="r1o">$144.71</td><td class="r2o">78.98</td><td class="r2o">47.75</td><td class="r2o">18.34</td><td class="r2o">2.18</td><td class="r2o">0.06</td><td class="r2o">0.49</td><td class="r3o">0.01</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7358786" >hagman</a></td><td class="r1e">2183</td><td class="r1e">334</td><td class="r1e">$121.73</td><td class="r2e">88.07</td><td class="r2e">57.24</td><td class="r2e">18.76</td><td class="r2e">1.14</td><td class="r2e">0.00</td><td class="r2e">0.06</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301395" >HardCoder</a></td><td class="r1o">2182</td><td class="r1o">452</td><td class="r1o">$139.93</td><td class="r2o">80.85</td><td class="r2o">49.42</td><td class="r2o">18.28</td><td class="r2o">1.92</td><td class="r2o">0.04</td><td class="r2o">0.32</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153902" >evd</a></td><td class="r1e">2178</td><td class="r1e">212</td><td class="r1e">$93.48</td><td class="r2e">96.64</td><td class="r2e">69.56</td><td class="r2e">16.51</td><td class="r2e">0.22</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10428762" >HiltonLange</a></td><td class="r1o">2175</td><td class="r1o">421</td><td class="r1o">$135.23</td><td class="r2o">82.14</td><td class="r2o">50.33</td><td class="r2o">17.86</td><td class="r2o">1.62</td><td class="r2o">0.02</td><td class="r2o">0.21</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=345006" >DAle</a></td><td class="r1e">2160</td><td class="r1e">367</td><td class="r1e">$118.48</td><td class="r2e">84.44</td><td class="r2e">51.79</td><td class="r2e">16.63</td><td class="r2e">1.10</td><td class="r2e">0.01</td><td class="r2e">0.08</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=252076" >Wasteland</a></td><td class="r1o">2158</td><td class="r1o">363</td><td class="r1o">$116.89</td><td class="r2o">84.54</td><td class="r2o">51.79</td><td class="r2o">16.36</td><td class="r2o">1.04</td><td class="r2o">0.01</td><td class="r2o">0.07</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8474430" >kupo</a></td><td class="r1e">2150</td><td class="r1e">266</td><td class="r1e">$91.07</td><td class="r2e">91.27</td><td class="r2e">58.42</td><td class="r2e">14.52</td><td class="r2e">0.35</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=278460" >TAG</a></td><td class="r1o">2136</td><td class="r1o">459</td><td class="r1o">$119.93</td><td class="r2o">77.52</td><td class="r2o">44.22</td><td class="r2o">14.79</td><td class="r2o">1.35</td><td class="r2o">0.02</td><td class="r2o">0.22</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8493941" >asaveljevs</a></td><td class="r1e">2130</td><td class="r1e">331</td><td class="r1e">$93.78</td><td class="r2e">84.85</td><td class="r2e">50.04</td><td class="r2e">13.57</td><td class="r2e">0.57</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9998760" >PE</a></td><td class="r1o">2117</td><td class="r1o">310</td><td class="r1o">$81.60</td><td class="r2o">85.56</td><td class="r2o">49.55</td><td class="r2o">12.16</td><td class="r2o">0.40</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=260828" >Larry</a></td><td class="r1e">2113</td><td class="r1e">342</td><td class="r1e">$86.38</td><td class="r2e">82.89</td><td class="r2e">47.04</td><td class="r2e">12.28</td><td class="r2e">0.53</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274498" >O_O</a></td><td class="r1o">2109</td><td class="r1o">349</td><td class="r1o">$85.54</td><td class="r2o">82.07</td><td class="r2o">46.09</td><td class="r2o">12.05</td><td class="r2o">0.54</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9927526" >Vedensky</a></td><td class="r1e">2104</td><td class="r1e">357</td><td class="r1e">$84.67</td><td class="r2e">81.22</td><td class="r2e">45.04</td><td class="r2e">11.80</td><td class="r2e">0.55</td><td class="r2e">0.00</td><td class="r2e">0.03</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=107835" >sjelkjd</a></td><td class="r1o">2099</td><td class="r1o">363</td><td class="r1o">$83.71</td><td class="r2o">80.38</td><td class="r2o">44.12</td><td class="r2o">11.57</td><td class="r2o">0.55</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9998788" >athenachu71</a></td><td class="r1e">2092</td><td class="r1e">479</td><td class="r1e">$100.80</td><td class="r2e">73.68</td><td class="r2e">39.08</td><td class="r2e">12.04</td><td class="r2e">1.03</td><td class="r2e">0.02</td><td class="r2e">0.17</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2059354" >futo</a></td><td class="r1o">2092</td><td class="r1o">256</td><td class="r1o">$54.22</td><td class="r2o">88.14</td><td class="r2o">49.17</td><td class="r2o">8.72</td><td class="r2o">0.11</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=158658" >ntrhieu</a></td><td class="r1e">2089</td><td class="r1e">431</td><td class="r1e">$91.42</td><td class="r2e">75.76</td><td class="r2e">40.27</td><td class="r2e">11.50</td><td class="r2e">0.78</td><td class="r2e">0.01</td><td class="r2e">0.09</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8349097" >hauser</a></td><td class="r1o">2085</td><td class="r1o">257</td><td class="r1o">$51.32</td><td class="r2o">87.58</td><td class="r2o">47.81</td><td class="r2o">8.18</td><td class="r2o">0.09</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11780323" >stubbscroll</a></td><td class="r1e">2084</td><td class="r1e">302</td><td class="r1e">$62.96</td><td class="r2e">83.56</td><td class="r2e">44.95</td><td class="r2e">9.35</td><td class="r2e">0.21</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=307638" >Wernie</a></td><td class="r1o">2076</td><td class="r1o">382</td><td class="r1o">$76.62</td><td class="r2o">77.40</td><td class="r2o">40.35</td><td class="r2o">10.13</td><td class="r2o">0.49</td><td class="r2o">0.00</td><td class="r2o">0.04</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=278342" >adic</a></td><td class="r1e">2075</td><td class="r1e">318</td><td class="r1e">$63.07</td><td class="r2e">81.66</td><td class="r2e">42.90</td><td class="r2e">9.05</td><td class="r2e">0.24</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=268904" >szymcio</a></td><td class="r1o">2075</td><td class="r1o">310</td><td class="r1o">$61.02</td><td class="r2o">82.21</td><td class="r2o">43.33</td><td class="r2o">8.85</td><td class="r2o">0.22</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8359547" >Jasko</a></td><td class="r1e">2071</td><td class="r1e">402</td><td class="r1e">$79.38</td><td class="r2e">75.89</td><td class="r2e">39.12</td><td class="r2e">10.12</td><td class="r2e">0.54</td><td class="r2e">0.00</td><td class="r2e">0.05</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156216" >daveagp</a></td><td class="r1o">2068</td><td class="r1o">306</td><td class="r1o">$61.47</td><td class="r2o">81.95</td><td class="r2o">42.41</td><td class="r2o">8.30</td><td class="r2o">0.18</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7213681" >wleite</a></td><td class="r1e">2066</td><td class="r1e">311</td><td class="r1e">$62.08</td><td class="r2e">81.42</td><td class="r2e">41.86</td><td class="r2e">8.22</td><td class="r2e">0.18</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7264865" >bogklug</a></td><td class="r1o">2066</td><td class="r1o">281</td><td class="r1o">$54.54</td><td class="r2o">83.82</td><td class="r2o">43.27</td><td class="r2o">7.54</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7210729" >ssancho2</a></td><td class="r1e">2057</td><td class="r1e">369</td><td class="r1e">$72.30</td><td class="r2e">76.67</td><td class="r2e">38.45</td><td class="r2e">8.81</td><td class="r2e">0.34</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=303185" >Cosmin.ro</a></td><td class="r1o">2054</td><td class="r1o">548</td><td class="r1o">$103.52</td><td class="r2o">68.60</td><td class="r2o">34.19</td><td class="r2o">10.45</td><td class="r2o">0.96</td><td class="r2o">0.02</td><td class="r2o">0.25</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10610339" >singlethread</a></td><td class="r1e">2054</td><td class="r1e">300</td><td class="r1e">$55.40</td><td class="r2e">81.17</td><td class="r2e">40.48</td><td class="r2e">7.25</td><td class="r2e">0.13</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10157606" >Ying</a></td><td class="r1o">2039</td><td class="r1o">415</td><td class="r1o">$75.79</td><td class="r2o">72.70</td><td class="r2o">35.21</td><td class="r2o">8.49</td><td class="r2o">0.43</td><td class="r2o">0.00</td><td class="r2o">0.04</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7563318" >sghao126</a></td><td class="r1e">2039</td><td class="r1e">281</td><td class="r1e">$45.03</td><td class="r2e">81.34</td><td class="r2e">38.78</td><td class="r2e">5.85</td><td class="r2e">0.07</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=310431" >sean_henderson</a></td><td class="r1o">2036</td><td class="r1o">331</td><td class="r1o">$57.70</td><td class="r2o">77.30</td><td class="r2o">36.93</td><td class="r2o">6.89</td><td class="r2o">0.17</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10407399" >timmac</a></td><td class="r1e">2034</td><td class="r1e">304</td><td class="r1e">$51.05</td><td class="r2e">79.04</td><td class="r2e">37.32</td><td class="r2e">6.19</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15485957" >embe</a></td><td class="r1o">2025</td><td class="r1o">516</td><td class="r1o">$90.73</td><td class="r2o">67.71</td><td class="r2o">32.28</td><td class="r2o">8.92</td><td class="r2o">0.67</td><td class="r2o">0.01</td><td class="r2o">0.13</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=343657" >lujo</a></td><td class="r1e">2014</td><td class="r1e">616</td><td class="r1e">$101.85</td><td class="r2e">64.38</td><td class="r2e">30.47</td><td class="r2e">9.21</td><td class="r2e">0.88</td><td class="r2e">0.03</td><td class="r2e">0.30</td><td class="r3e">0.01</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275640" >sql_lall</a></td><td class="r1o">2010</td><td class="r1o">325</td><td class="r1o">$48.58</td><td class="r2o">75.23</td><td class="r2o">33.45</td><td class="r2o">5.45</td><td class="r2o">0.10</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14886245" >tomekkulczynski</a></td><td class="r1e">2008</td><td class="r1e">302</td><td class="r1e">$42.56</td><td class="r2e">76.59</td><td class="r2e">33.59</td><td class="r2e">4.80</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7505977" >maze_pallas</a></td><td class="r1o">2003</td><td class="r1o">388</td><td class="r1o">$60.84</td><td class="r2o">70.97</td><td class="r2o">31.60</td><td class="r2o">6.30</td><td class="r2o">0.22</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13411612" >ziqing</a></td><td class="r1e">2002</td><td class="r1e">282</td><td class="r1e">$36.34</td><td class="r2e">77.58</td><td class="r2e">32.94</td><td class="r2e">4.08</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8511003" >Swetko</a></td><td class="r1o">2001</td><td class="r1o">369</td><td class="r1o">$56.91</td><td class="r2o">71.78</td><td class="r2o">31.73</td><td class="r2o">5.90</td><td class="r2o">0.17</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7452777" >CrazyScratcher</a></td><td class="r1e">2000</td><td class="r1e">331</td><td class="r1e">$48.29</td><td class="r2e">73.91</td><td class="r2e">32.10</td><td class="r2e">5.15</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7281980" >eldering</a></td><td class="r1o">1998</td><td class="r1o">228</td><td class="r1o">$21.90</td><td class="r2o">82.04</td><td class="r2o">32.88</td><td class="r2o">2.50</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8440049" >bolu</a></td><td class="r1e">1992</td><td class="r1e">300</td><td class="r1e">$38.20</td><td class="r2e">75.24</td><td class="r2e">31.39</td><td class="r2e">4.11</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269025" >assembler</a></td><td class="r1o">1991</td><td class="r1o">284</td><td class="r1o">$33.74</td><td class="r2o">76.22</td><td class="r2o">31.25</td><td class="r2o">3.66</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7584555" >abi_k</a></td><td class="r1e">1989</td><td class="r1e">359</td><td class="r1e">$50.74</td><td class="r2e">71.23</td><td class="r2e">30.38</td><td class="r2e">5.19</td><td class="r2e">0.12</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8584653" >cheetah</a></td><td class="r1o">1988</td><td class="r1o">528</td><td class="r1o">$82.12</td><td class="r2o">64.67</td><td class="r2o">29.01</td><td class="r2o">7.51</td><td class="r2o">0.53</td><td class="r2o">0.01</td><td class="r2o">0.11</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7233906" >superjoel</a></td><td class="r1e">1983</td><td class="r1e">324</td><td class="r1e">$40.95</td><td class="r2e">72.63</td><td class="r2e">29.92</td><td class="r2e">4.28</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7584235" >agh</a></td><td class="r1o">1978</td><td class="r1o">404</td><td class="r1o">$56.73</td><td class="r2o">68.12</td><td class="r2o">28.96</td><td class="r2o">5.55</td><td class="r2o">0.20</td><td class="r2o">0.00</td><td class="r2o">0.02</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293387" >abiczo</a></td><td class="r1e">1978</td><td class="r1e">314</td><td class="r1e">$39.14</td><td class="r2e">72.68</td><td class="r2e">29.24</td><td class="r2e">3.84</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=284038" >aussie</a></td><td class="r1o">1977</td><td class="r1o">405</td><td class="r1o">$59.31</td><td class="r2o">68.07</td><td class="r2o">28.81</td><td class="r2o">5.51</td><td class="r2o">0.19</td><td class="r2o">0.00</td><td class="r2o">0.02</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15266786" >Gen_Witt</a></td><td class="r1e">1977</td><td class="r1e">485</td><td class="r1e">$74.09</td><td class="r2e">65.14</td><td class="r2e">28.41</td><td class="r2e">6.59</td><td class="r2e">0.38</td><td class="r2e">0.00</td><td class="r2e">0.06</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7501828" >BjarkeDahlEbert</a></td><td class="r1o">1977</td><td class="r1o">268</td><td class="r1o">$27.96</td><td class="r2o">75.93</td><td class="r2o">29.28</td><td class="r2o">2.80</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8518361" >Vovka</a></td><td class="r1e">1975</td><td class="r1e">353</td><td class="r1e">$47.41</td><td class="r2e">70.15</td><td class="r2e">28.77</td><td class="r2e">4.52</td><td class="r2e">0.09</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8584656" >Ulan</a></td><td class="r1o">1974</td><td class="r1o">390</td><td class="r1o">$55.04</td><td class="r2o">68.33</td><td class="r2o">28.53</td><td class="r2o">5.15</td><td class="r2o">0.15</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=306542" >riveria</a></td><td class="r1e">1968</td><td class="r1e">391</td><td class="r1e">$53.42</td><td class="r2e">67.68</td><td class="r2e">27.93</td><td class="r2e">4.98</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11889868" >hyyylr</a></td><td class="r1o">1965</td><td class="r1o">384</td><td class="r1o">$50.70</td><td class="r2o">67.75</td><td class="r2o">27.62</td><td class="r2o">4.71</td><td class="r2o">0.14</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10544397" >CatalinT</a></td><td class="r1e">1963</td><td class="r1e">275</td><td class="r1e">$25.86</td><td class="r2e">73.74</td><td class="r2e">27.19</td><td class="r2e">2.52</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=299993" >cvoinescu</a></td><td class="r1o">1962</td><td class="r1o">355</td><td class="r1o">$43.63</td><td class="r2o">68.73</td><td class="r2o">27.31</td><td class="r2o">4.10</td><td class="r2o">0.08</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289706" >mickle</a></td><td class="r1e">1960</td><td class="r1e">373</td><td class="r1e">$46.88</td><td class="r2e">67.78</td><td class="r2e">27.07</td><td class="r2e">4.37</td><td class="r2e">0.11</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7495076" >jo_chang</a></td><td class="r1o">1953</td><td class="r1o">257</td><td class="r1o">$19.51</td><td class="r2o">73.86</td><td class="r2o">25.59</td><td class="r2o">1.87</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7338095" >tomal</a></td><td class="r1e">1952</td><td class="r1e">351</td><td class="r1e">$39.69</td><td class="r2e">67.95</td><td class="r2e">26.16</td><td class="r2e">3.67</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7444051" >marijnk</a></td><td class="r1o">1951</td><td class="r1o">447</td><td class="r1o">$58.49</td><td class="r2o">64.18</td><td class="r2o">26.08</td><td class="r2o">5.17</td><td class="r2o">0.21</td><td class="r2o">0.00</td><td class="r2o">0.02</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=299709" >Modulator</a></td><td class="r1e">1948</td><td class="r1e">297</td><td class="r1e">$27.30</td><td class="r2e">70.48</td><td class="r2e">25.38</td><td class="r2e">2.57</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14914673" >moskaevka</a></td><td class="r1o">1942</td><td class="r1o">351</td><td class="r1o">$36.91</td><td class="r2o">66.91</td><td class="r2o">24.99</td><td class="r2o">3.34</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7360291" >iforiq</a></td><td class="r1e">1940</td><td class="r1e">468</td><td class="r1e">$59.29</td><td class="r2e">62.66</td><td class="r2e">25.24</td><td class="r2e">5.10</td><td class="r2e">0.23</td><td class="r2e">0.00</td><td class="r2e">0.03</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10603164" >sheiech</a></td><td class="r1o">1936</td><td class="r1o">360</td><td class="r1o">$37.95</td><td class="r2o">65.90</td><td class="r2o">24.46</td><td class="r2o">3.39</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7360309" >dmks</a></td><td class="r1e">1933</td><td class="r1e">481</td><td class="r1e">$59.57</td><td class="r2e">61.80</td><td class="r2e">24.63</td><td class="r2e">5.01</td><td class="r2e">0.24</td><td class="r2e">0.00</td><td class="r2e">0.03</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15231364" >soul-net</a></td><td class="r1o">1931</td><td class="r1o">269</td><td class="r1o">$18.53</td><td class="r2o">70.16</td><td class="r2o">22.65</td><td class="r2o">1.60</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10519715" >IvanRomanov</a></td><td class="r1e">1929</td><td class="r1e">290</td><td class="r1e">$22.48</td><td class="r2e">68.61</td><td class="r2e">22.85</td><td class="r2e">1.93</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7443050" >mics</a></td><td class="r1o">1926</td><td class="r1o">331</td><td class="r1o">$30.38</td><td class="r2o">66.17</td><td class="r2o">23.10</td><td class="r2o">2.59</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15600311" >WSX</a></td><td class="r1e">1925</td><td class="r1e">436</td><td class="r1e">$50.58</td><td class="r2e">62.38</td><td class="r2e">23.88</td><td class="r2e">4.17</td><td class="r2e">0.15</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10611351" >sephiroth79</a></td><td class="r1o">1923</td><td class="r1o">468</td><td class="r1o">$55.67</td><td class="r2o">61.38</td><td class="r2o">23.83</td><td class="r2o">4.53</td><td class="r2o">0.20</td><td class="r2o">0.00</td><td class="r2o">0.02</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14769155" >lukasP</a></td><td class="r1e">1919</td><td class="r1e">246</td><td class="r1e">$13.33</td><td class="r2e">70.12</td><td class="r2e">20.37</td><td class="r2e">1.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7368306" >Matei</a></td><td class="r1o">1917</td><td class="r1o">413</td><td class="r1o">$47.53</td><td class="r2o">62.25</td><td class="r2o">23.00</td><td class="r2o">3.66</td><td class="r2o">0.10</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=152614" >turuthok</a></td><td class="r1e">1914</td><td class="r1e">509</td><td class="r1e">$63.06</td><td class="r2e">59.81</td><td class="r2e">23.37</td><td class="r2e">4.77</td><td class="r2e">0.24</td><td class="r2e">0.00</td><td class="r2e">0.04</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10244237" >yohney</a></td><td class="r1o">1913</td><td class="r1o">492</td><td class="r1o">$60.67</td><td class="r2o">60.10</td><td class="r2o">23.26</td><td class="r2o">4.60</td><td class="r2o">0.22</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=108530" >dpecora</a></td><td class="r1e">1912</td><td class="r1e">353</td><td class="r1e">$35.07</td><td class="r2e">63.75</td><td class="r2e">21.83</td><td class="r2e">2.60</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=159100" >Googly</a></td><td class="r1o">1911</td><td class="r1o">226</td><td class="r1o">$10.89</td><td class="r2o">70.63</td><td class="r2o">18.58</td><td class="r2o">0.64</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7227699" >OvejaCarnivora</a></td><td class="r1e">1909</td><td class="r1e">491</td><td class="r1e">$59.38</td><td class="r2e">59.75</td><td class="r2e">22.78</td><td class="r2e">4.44</td><td class="r2e">0.21</td><td class="r2e">0.00</td><td class="r2e">0.03</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11899489" >Jacek</a></td><td class="r1o">1908</td><td class="r1o">436</td><td class="r1o">$49.62</td><td class="r2o">60.81</td><td class="r2o">22.31</td><td class="r2o">3.69</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7507062" >mdk</a></td><td class="r1e">1905</td><td class="r1e">312</td><td class="r1e">$25.62</td><td class="r2e">64.56</td><td class="r2e">20.38</td><td class="r2e">1.80</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7396310" >ivankovic</a></td><td class="r1o">1899</td><td class="r1o">415</td><td class="r1o">$43.47</td><td class="r2o">60.45</td><td class="r2o">21.36</td><td class="r2o">3.18</td><td class="r2o">0.08</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11923016" >Idle</a></td><td class="r1e">1894</td><td class="r1e">427</td><td class="r1e">$44.48</td><td class="r2e">59.78</td><td class="r2e">21.07</td><td class="r2e">3.23</td><td class="r2e">0.09</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7472513" >szd714</a></td><td class="r1o">1893</td><td class="r1o">342</td><td class="r1o">$28.83</td><td class="r2o">62.02</td><td class="r2o">19.74</td><td class="r2o">2.02</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7268916" >bsauerwine</a></td><td class="r1e">1878</td><td class="r1e">375</td><td class="r1e">$31.29</td><td class="r2e">59.43</td><td class="r2e">19.02</td><td class="r2e">2.15</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156491" >chogyonim</a></td><td class="r1o">1875</td><td class="r1o">394</td><td class="r1o">$34.11</td><td class="r2o">58.73</td><td class="r2o">19.02</td><td class="r2o">2.36</td><td class="r2o">0.04</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15237763" >JuLLaSS</a></td><td class="r1e">1874</td><td class="r1e">364</td><td class="r1e">$28.48</td><td class="r2e">59.39</td><td class="r2e">18.38</td><td class="r2e">1.92</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11773797" >yoho</a></td><td class="r1o">1870</td><td class="r1o">366</td><td class="r1o">$28.07</td><td class="r2o">58.79</td><td class="r2o">18.00</td><td class="r2o">1.89</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15548523" >BenjaminHummel</a></td><td class="r1e">1869</td><td class="r1e">420</td><td class="r1e">$37.22</td><td class="r2e">57.68</td><td class="r2e">18.90</td><td class="r2e">2.59</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8556047" >dzetkulict</a></td><td class="r1o">1867</td><td class="r1o">302</td><td class="r1o">$16.72</td><td class="r2o">60.28</td><td class="r2o">16.18</td><td class="r2o">1.01</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8374582" >ionels</a></td><td class="r1e">1861</td><td class="r1e">327</td><td class="r1e">$19.71</td><td class="r2e">58.77</td><td class="r2e">16.28</td><td class="r2e">1.23</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8391762" >ltank</a></td><td class="r1o">1853</td><td class="r1o">245</td><td class="r1o">$7.31</td><td class="r2o">60.42</td><td class="r2o">12.46</td><td class="r2o">0.35</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11833324" >martin-at-ksp</a></td><td class="r1e">1852</td><td class="r1e">328</td><td class="r1e">$18.56</td><td class="r2e">57.70</td><td class="r2e">15.48</td><td class="r2e">1.13</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7440483" >moggy</a></td><td class="r1o">1849</td><td class="r1o">237</td><td class="r1o">$6.20</td><td class="r2o">60.07</td><td class="r2o">11.64</td><td class="r2o">0.28</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10531352" >vip1711</a></td><td class="r1e">1844</td><td class="r1e">521</td><td class="r1e">$47.46</td><td class="r2e">54.30</td><td class="r2e">18.57</td><td class="r2e">3.24</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9905330" >greco</a></td><td class="r1o">1840</td><td class="r1o">417</td><td class="r1o">$30.51</td><td class="r2o">54.90</td><td class="r2o">16.64</td><td class="r2o">1.99</td><td class="r2o">0.04</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=108262" >mathgodleo</a></td><td class="r1e">1834</td><td class="r1e">215</td><td class="r1e">$3.48</td><td class="r2e">58.32</td><td class="r2e">8.99</td><td class="r2e">0.11</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10673764" >daroon</a></td><td class="r1o">1834</td><td class="r1o">362</td><td class="r1o">$21.08</td><td class="r2o">55.03</td><td class="r2o">14.90</td><td class="r2o">1.29</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7296000" >connect4</a></td><td class="r1e">1833</td><td class="r1e">344</td><td class="r1e">$23.01</td><td class="r2e">55.14</td><td class="r2e">14.26</td><td class="r2e">1.07</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7451795" >jeroen</a></td><td class="r1o">1828</td><td class="r1o">237</td><td class="r1o">$7.70</td><td class="r2o">56.59</td><td class="r2o">9.67</td><td class="r2o">0.17</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11912240" >denpoz</a></td><td class="r1e">1828</td><td class="r1e">576</td><td class="r1e">$57.62</td><td class="r2e">52.73</td><td class="r2e">18.20</td><td class="r2e">3.48</td><td class="r2e">0.18</td><td class="r2e">0.00</td><td class="r2e">0.04</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10398672" >tosomjafakt</a></td><td class="r1o">1825</td><td class="r1o">388</td><td class="r1o">$28.93</td><td class="r2o">53.79</td><td class="r2o">14.85</td><td class="r2o">1.44</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=150796" >paisa</a></td><td class="r1e">1817</td><td class="r1e">250</td><td class="r1e">$8.49</td><td class="r2e">54.50</td><td class="r2e">9.37</td><td class="r2e">0.20</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7454301" >paranoia</a></td><td class="r1o">1813</td><td class="r1o">657</td><td class="r1o">$65.38</td><td class="r2o">51.51</td><td class="r2o">18.32</td><td class="r2o">3.96</td><td class="r2o">0.26</td><td class="r2o">0.01</td><td class="r2o">0.07</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11785316" >achan1058</a></td><td class="r1e">1810</td><td class="r1e">498</td><td class="r1e">$43.24</td><td class="r2e">51.72</td><td class="r2e">16.08</td><td class="r2e">2.38</td><td class="r2e">0.08</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287979" >Oblok</a></td><td class="r1o">1809</td><td class="r1o">315</td><td class="r1o">$16.24</td><td class="r2o">52.70</td><td class="r2o">11.50</td><td class="r2o">0.58</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10483013" >haipt81</a></td><td class="r1e">1808</td><td class="r1e">321</td><td class="r1e">$17.10</td><td class="r2e">52.46</td><td class="r2e">11.63</td><td class="r2e">0.62</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8361901" >niphoton</a></td><td class="r1o">1807</td><td class="r1o">283</td><td class="r1o">$12.20</td><td class="r2o">52.62</td><td class="r2o">10.09</td><td class="r2o">0.34</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8593420" >_efer_</a></td><td class="r1e">1805</td><td class="r1e">282</td><td class="r1e">$12.09</td><td class="r2e">52.31</td><td class="r2e">9.84</td><td class="r2e">0.33</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7555099" >Rostislav</a></td><td class="r1o">1800</td><td class="r1o">265</td><td class="r1o">$9.93</td><td class="r2o">51.66</td><td class="r2o">8.72</td><td class="r2o">0.22</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10684103" >Barlennan</a></td><td class="r1e">1800</td><td class="r1e">320</td><td class="r1e">$16.76</td><td class="r2e">51.45</td><td class="r2e">10.97</td><td class="r2e">0.54</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15580420" >cissy</a></td><td class="r1o">1794</td><td class="r1o">318</td><td class="r1o">$16.27</td><td class="r2o">50.64</td><td class="r2o">10.51</td><td class="r2o">0.51</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=154135" >tck</a></td><td class="r1e">1784</td><td class="r1e">164</td><td class="r1e">$1.76</td><td class="r2e">48.85</td><td class="r2e">2.58</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=154619" >hilfiger</a></td><td class="r1o">1781</td><td class="r1o">339</td><td class="r1o">$17.80</td><td class="r2o">49.12</td><td class="r2o">10.30</td><td class="r2o">0.55</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8369955" >eleusive</a></td><td class="r1e">1775</td><td class="r1e">446</td><td class="r1e">$32.05</td><td class="r2e">48.77</td><td class="r2e">12.97</td><td class="r2e">1.39</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15056181" >vlad89</a></td><td class="r1o">1768</td><td class="r1o">391</td><td class="r1o">$23.50</td><td class="r2o">47.94</td><td class="r2o">11.02</td><td class="r2o">0.84</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11809435" >sidky</a></td><td class="r1e">1768</td><td class="r1e">369</td><td class="r1e">$20.58</td><td class="r2e">47.76</td><td class="r2e">10.42</td><td class="r2e">0.67</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=302670" >kmd-10</a></td><td class="r1o">1767</td><td class="r1o">334</td><td class="r1o">$16.16</td><td class="r2o">47.52</td><td class="r2o">9.19</td><td class="r2o">0.42</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10116099" >blekdrago</a></td><td class="r1e">1765</td><td class="r1e">305</td><td class="r1e">$12.60</td><td class="r2e">46.83</td><td class="r2e">8.02</td><td class="r2e">0.27</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=349303" >OpenGL4Dummies</a></td><td class="r1o">1763</td><td class="r1o">284</td><td class="r1o">$10.27</td><td class="r2o">46.46</td><td class="r2o">7.07</td><td class="r2o">0.17</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2058174" >Parchandri</a></td><td class="r1e">1760</td><td class="r1e">401</td><td class="r1e">$24.54</td><td class="r2e">47.11</td><td class="r2e">10.86</td><td class="r2e">0.85</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=292000" >SmileyGirl256</a></td><td class="r1o">1760</td><td class="r1o">308</td><td class="r1o">$12.68</td><td class="r2o">46.11</td><td class="r2o">7.83</td><td class="r2o">0.25</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274760" >Running Wild</a></td><td class="r1e">1759</td><td class="r1e">320</td><td class="r1e">$14.24</td><td class="r2e">46.34</td><td class="r2e">8.23</td><td class="r2e">0.32</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10185645" >Toivoa</a></td><td class="r1o">1758</td><td class="r1o">366</td><td class="r1o">$22.53</td><td class="r2o">46.70</td><td class="r2o">9.73</td><td class="r2o">0.58</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=298761" >Greyve</a></td><td class="r1e">1755</td><td class="r1e">295</td><td class="r1e">$13.30</td><td class="r2e">45.47</td><td class="r2e">7.04</td><td class="r2e">0.19</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10569084" >wdtseng</a></td><td class="r1o">1755</td><td class="r1o">354</td><td class="r1o">$20.57</td><td class="r2o">46.29</td><td class="r2o">9.21</td><td class="r2o">0.48</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10492682" >tilps_kilm</a></td><td class="r1e">1750</td><td class="r1e">255</td><td class="r1e">$8.76</td><td class="r2e">44.02</td><td class="r2e">5.15</td><td class="r2e">0.07</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9905812" >technobug</a></td><td class="r1o">1747</td><td class="r1o">333</td><td class="r1o">$17.05</td><td class="r2o">45.00</td><td class="r2o">8.01</td><td class="r2o">0.33</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8348794" >kedaizd</a></td><td class="r1e">1747</td><td class="r1e">187</td><td class="r1e">$3.28</td><td class="r2e">41.24</td><td class="r2e">2.16</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=306131" >ilham</a></td><td class="r1o">1746</td><td class="r1o">358</td><td class="r1o">$20.16</td><td class="r2o">45.32</td><td class="r2o">8.78</td><td class="r2o">0.47</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7506429" >Gigz</a></td><td class="r1e">1742</td><td class="r1e">446</td><td class="r1e">$30.94</td><td class="r2e">45.84</td><td class="r2e">11.03</td><td class="r2e">1.03</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14893757" >Aldanur</a></td><td class="r1o">1736</td><td class="r1o">245</td><td class="r1o">$6.88</td><td class="r2o">41.42</td><td class="r2o">4.03</td><td class="r2o">0.04</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=299706" >cruizza</a></td><td class="r1e">1733</td><td class="r1e">351</td><td class="r1e">$17.64</td><td class="r2e">43.66</td><td class="r2e">7.88</td><td class="r2e">0.35</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156485" >the_one_smiley</a></td><td class="r1o">1732</td><td class="r1o">282</td><td class="r1o">$9.94</td><td class="r2o">41.98</td><td class="r2o">5.33</td><td class="r2o">0.10</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10015783" >anikov</a></td><td class="r1e">1731</td><td class="r1e">215</td><td class="r1e">$4.34</td><td class="r2e">39.42</td><td class="r2e">2.69</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7488783" >lyc1977</a></td><td class="r1o">1730</td><td class="r1o">482</td><td class="r1o">$33.82</td><td class="r2o">45.15</td><td class="r2o">11.27</td><td class="r2o">1.20</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14982894" >hungle</a></td><td class="r1e">1725</td><td class="r1e">521</td><td class="r1e">$37.94</td><td class="r2e">45.14</td><td class="r2e">11.86</td><td class="r2e">1.46</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7510875" >Darkmaster</a></td><td class="r1o">1722</td><td class="r1o">288</td><td class="r1o">$9.78</td><td class="r2o">40.84</td><td class="r2o">5.09</td><td class="r2o">0.10</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9972947" >quazee</a></td><td class="r1e">1721</td><td class="r1e">278</td><td class="r1e">$8.69</td><td class="r2e">40.40</td><td class="r2e">4.65</td><td class="r2e">0.07</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=304979" >sinaddcos</a></td><td class="r1o">1719</td><td class="r1o">361</td><td class="r1o">$17.27</td><td class="r2o">42.34</td><td class="r2o">7.50</td><td class="r2o">0.34</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=282560" >leadhyena_inran</a></td><td class="r1e">1717</td><td class="r1e">231</td><td class="r1e">$4.76</td><td class="r2e">37.85</td><td class="r2e">2.81</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11794471" >polchawa</a></td><td class="r1o">1711</td><td class="r1o">397</td><td class="r1o">$20.53</td><td class="r2o">42.25</td><td class="r2o">8.16</td><td class="r2o">0.49</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7400531" >mafattah</a></td><td class="r1e">1708</td><td class="r1e">431</td><td class="r1e">$24.27</td><td class="r2e">42.56</td><td class="r2e">8.98</td><td class="r2e">0.67</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10190739" >Vovik</a></td><td class="r1o">1707</td><td class="r1o">439</td><td class="r1o">$24.97</td><td class="r2o">42.56</td><td class="r2o">9.06</td><td class="r2o">0.71</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13261056" >DamianK</a></td><td class="r1e">1699</td><td class="r1e">431</td><td class="r1e">$22.98</td><td class="r2e">41.69</td><td class="r2e">8.54</td><td class="r2e">0.61</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15082287" >bus</a></td><td class="r1o">1693</td><td class="r1o">819</td><td class="r1o">$65.62</td><td class="r2o">45.32</td><td class="r2o">14.94</td><td class="r2o">3.23</td><td class="r2o">0.24</td><td class="r2o">0.01</td><td class="r2o">0.11</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8392826" >ppp</a></td><td class="r1e">1686</td><td class="r1e">279</td><td class="r1e">$6.56</td><td class="r2e">35.60</td><td class="r2e">3.35</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7578317" >DoctorD</a></td><td class="r1o">1684</td><td class="r1o">303</td><td class="r1o">$8.32</td><td class="r2o">36.49</td><td class="r2o">4.03</td><td class="r2o">0.07</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11904663" >Javi</a></td><td class="r1e">1683</td><td class="r1e">382</td><td class="r1e">$20.40</td><td class="r2e">39.09</td><td class="r2e">6.46</td><td class="r2e">0.29</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=251260" >Rud0lf</a></td><td class="r1o">1677</td><td class="r1o">208</td><td class="r1o">$4.09</td><td class="r2o">29.69</td><td class="r2o">1.08</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10526732" >zjq</a></td><td class="r1e">1671</td><td class="r1e">771</td><td class="r1e">$61.60</td><td class="r2e">43.98</td><td class="r2e">13.62</td><td class="r2e">2.67</td><td class="r2e">0.17</td><td class="r2e">0.00</td><td class="r2e">0.06</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10532080" >danielb</a></td><td class="r1o">1668</td><td class="r1o">307</td><td class="r1o">$11.31</td><td class="r2o">34.67</td><td class="r2o">3.63</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=154090" >merolish</a></td><td class="r1e">1666</td><td class="r1e">347</td><td class="r1e">$15.08</td><td class="r2e">36.21</td><td class="r2e">4.77</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15600321" >MB__</a></td><td class="r1o">1666</td><td class="r1o">230</td><td class="r1o">$5.03</td><td class="r2o">29.68</td><td class="r2o">1.39</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=261043" >fpmc</a></td><td class="r1e">1666</td><td class="r1e">298</td><td class="r1e">$10.35</td><td class="r2e">34.02</td><td class="r2e">3.30</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15389768" >yubgi006</a></td><td class="r1o">1665</td><td class="r1o">404</td><td class="r1o">$20.95</td><td class="r2o">37.90</td><td class="r2o">6.35</td><td class="r2o">0.32</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=261393" >Symme7ry</a></td><td class="r1e">1664</td><td class="r1e">270</td><td class="r1e">$7.90</td><td class="r2e">32.16</td><td class="r2e">2.40</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10323773" >Pawa</a></td><td class="r1o">1663</td><td class="r1o">304</td><td class="r1o">$10.82</td><td class="r2o">33.97</td><td class="r2o">3.37</td><td class="r2o">0.05</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15041938" >pave_m</a></td><td class="r1e">1662</td><td class="r1e">434</td><td class="r1e">$23.96</td><td class="r2e">38.43</td><td class="r2e">7.03</td><td class="r2e">0.43</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=268720" >amorosov</a></td><td class="r1o">1652</td><td class="r1o">252</td><td class="r1o">$5.97</td><td class="r2o">29.38</td><td class="r2o">1.66</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=251134" >plan571</a></td><td class="r1e">1649</td><td class="r1e">401</td><td class="r1e">$19.24</td><td class="r2e">36.37</td><td class="r2e">5.69</td><td class="r2e">0.25</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15174999" >crem</a></td><td class="r1o">1648</td><td class="r1o">298</td><td class="r1o">$9.43</td><td class="r2o">31.79</td><td class="r2o">2.74</td><td class="r2o">0.04</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13320575" >paulhryu</a></td><td class="r1e">1648</td><td class="r1e">398</td><td class="r1e">$18.88</td><td class="r2e">36.20</td><td class="r2e">5.56</td><td class="r2e">0.24</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14864900" >neo_bd</a></td><td class="r1o">1645</td><td class="r1o">335</td><td class="r1o">$12.63</td><td class="r2o">33.41</td><td class="r2o">3.73</td><td class="r2o">0.08</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11962146" >i12xz</a></td><td class="r1e">1643</td><td class="r1e">404</td><td class="r1e">$19.29</td><td class="r2e">35.85</td><td class="r2e">5.56</td><td class="r2e">0.25</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10513872" >ryanprichard</a></td><td class="r1o">1642</td><td class="r1o">245</td><td class="r1o">$5.26</td><td class="r2o">27.49</td><td class="r2o">1.31</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=302085" >userundefined</a></td><td class="r1e">1639</td><td class="r1e">351</td><td class="r1e">$13.84</td><td class="r2e">33.49</td><td class="r2e">3.97</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15632740" >zuzic</a></td><td class="r1o">1636</td><td class="r1o">301</td><td class="r1o">$9.23</td><td class="r2o">30.56</td><td class="r2o">2.54</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10380704" >bluequark</a></td><td class="r1e">1634</td><td class="r1e">238</td><td class="r1e">$4.62</td><td class="r2e">25.86</td><td class="r2e">1.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9928945" >Vigothebest</a></td><td class="r1o">1634</td><td class="r1o">301</td><td class="r1o">$9.17</td><td class="r2o">30.33</td><td class="r2o">2.46</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=271496" >jfreyss</a></td><td class="r1e">1632</td><td class="r1e">277</td><td class="r1e">$7.31</td><td class="r2e">28.61</td><td class="r2e">1.85</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8513659" >satej</a></td><td class="r1o">1632</td><td class="r1o">389</td><td class="r1o">$17.35</td><td class="r2o">34.34</td><td class="r2o">4.80</td><td class="r2o">0.18</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9953294" >andro</a></td><td class="r1e">1630</td><td class="r1e">273</td><td class="r1e">$7.04</td><td class="r2e">28.04</td><td class="r2e">1.71</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8524863" >ZarkT</a></td><td class="r1o">1629</td><td class="r1o">185</td><td class="r1o">$2.13</td><td class="r2o">19.54</td><td class="r2o">0.24</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7269339" >igorsk</a></td><td class="r1e">1627</td><td class="r1e">283</td><td class="r1e">$8.02</td><td class="r2e">28.39</td><td class="r2e">1.87</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15473210" >Wage</a></td><td class="r1o">1624</td><td class="r1o">284</td><td class="r1o">$8.00</td><td class="r2o">28.15</td><td class="r2o">1.87</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=278167" >Merlin[Kyiv]</a></td><td class="r1e">1624</td><td class="r1e">267</td><td class="r1e">$6.75</td><td class="r2e">26.85</td><td class="r2e">1.46</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7364110" >kats</a></td><td class="r1o">1623</td><td class="r1o">376</td><td class="r1o">$16.07</td><td class="r2o">32.97</td><td class="r2o">4.14</td><td class="r2o">0.13</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=159437" >derelikt</a></td><td class="r1e">1620</td><td class="r1e">372</td><td class="r1e">$15.54</td><td class="r2e">32.49</td><td class="r2e">3.96</td><td class="r2e">0.12</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10658366" >unChabonSerio</a></td><td class="r1o">1619</td><td class="r1o">657</td><td class="r1o">$44.36</td><td class="r2o">39.78</td><td class="r2o">10.08</td><td class="r2o">1.40</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8358583" >dispanser</a></td><td class="r1e">1619</td><td class="r1e">283</td><td class="r1e">$7.96</td><td class="r2e">27.46</td><td class="r2e">1.72</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8396270" >lews</a></td><td class="r1o">1617</td><td class="r1o">352</td><td class="r1o">$13.69</td><td class="r2o">31.24</td><td class="r2o">3.37</td><td class="r2o">0.07</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7380147" >BeCool</a></td><td class="r1e">1616</td><td class="r1e">373</td><td class="r1e">$15.69</td><td class="r2e">32.19</td><td class="r2e">3.88</td><td class="r2e">0.11</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7462698" >kolodrub</a></td><td class="r1o">1615</td><td class="r1o">378</td><td class="r1o">$16.13</td><td class="r2o">32.26</td><td class="r2o">3.97</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7340263" >gevak</a></td><td class="r1e">1614</td><td class="r1e">295</td><td class="r1e">$8.88</td><td class="r2e">27.67</td><td class="r2e">1.90</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11797255" >aubergineanode</a></td><td class="r1o">1613</td><td class="r1o">244</td><td class="r1o">$5.19</td><td class="r2o">23.64</td><td class="r2o">0.85</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=152342" >kyky</a></td><td class="r1e">1611</td><td class="r1e">471</td><td class="r1e">$25.25</td><td class="r2e">35.24</td><td class="r2e">6.09</td><td class="r2e">0.38</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13391236" >tcs</a></td><td class="r1o">1611</td><td class="r1o">509</td><td class="r1o">$29.12</td><td class="r2o">36.31</td><td class="r2o">6.97</td><td class="r2o">0.55</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10584013" >Sika</a></td><td class="r1e">1608</td><td class="r1e">374</td><td class="r1e">$15.62</td><td class="r2e">31.46</td><td class="r2e">3.65</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958883" >Minilek</a></td><td class="r1o">1605</td><td class="r1o">371</td><td class="r1o">$15.14</td><td class="r2o">30.97</td><td class="r2o">3.50</td><td class="r2o">0.09</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10581579" >pradhan_ptr</a></td><td class="r1e">1602</td><td class="r1e">230</td><td class="r1e">$4.01</td><td class="r2e">20.90</td><td class="r2e">0.54</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7402415" >wstfgl</a></td><td class="r1o">1599</td><td class="r1o">581</td><td class="r1o">$35.22</td><td class="r2o">37.15</td><td class="r2o">8.01</td><td class="r2o">0.83</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15120142" >GhostStalker</a></td><td class="r1e">1593</td><td class="r1e">324</td><td class="r1e">$10.20</td><td class="r2e">27.26</td><td class="r2e">2.13</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=251832" >dark_lord</a></td><td class="r1o">1592</td><td class="r1o">395</td><td class="r1o">$16.34</td><td class="r2o">30.95</td><td class="r2o">3.73</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8405939" >matias</a></td><td class="r1e">1591</td><td class="r1e">337</td><td class="r1e">$11.20</td><td class="r2e">27.88</td><td class="r2e">2.38</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7248795" >ASab</a></td><td class="r1o">1585</td><td class="r1o">541</td><td class="r1o">$29.85</td><td class="r2o">35.31</td><td class="r2o">6.80</td><td class="r2o">0.57</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=160388" >ubergeek</a></td><td class="r1e">1578</td><td class="r1e">260</td><td class="r1e">$4.85</td><td class="r2e">20.89</td><td class="r2e">0.73</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8395447" >Ragnarok</a></td><td class="r1o">1578</td><td class="r1o">453</td><td class="r1o">$20.56</td><td class="r2o">32.08</td><td class="r2o">4.68</td><td class="r2o">0.23</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=283892" >BillyBob</a></td><td class="r1e">1576</td><td class="r1e">370</td><td class="r1e">$16.25</td><td class="r2e">28.24</td><td class="r2e">2.80</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15656377" >zubair6</a></td><td class="r1o">1576</td><td class="r1o">330</td><td class="r1o">$12.63</td><td class="r2o">25.89</td><td class="r2o">1.90</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155115" >therealsachin</a></td><td class="r1e">1575</td><td class="r1e">188</td><td class="r1e">$2.53</td><td class="r2e">12.89</td><td class="r2e">0.08</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7417879" >victorsin</a></td><td class="r1o">1573</td><td class="r1o">301</td><td class="r1o">$10.09</td><td class="r2o">23.73</td><td class="r2o">1.31</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153891" >mbjorklu</a></td><td class="r1e">1573</td><td class="r1e">366</td><td class="r1e">$15.61</td><td class="r2e">27.77</td><td class="r2e">2.61</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8503599" >BhaGeera</a></td><td class="r1o">1569</td><td class="r1o">287</td><td class="r1o">$8.69</td><td class="r2o">22.25</td><td class="r2o">1.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=268580" >Wasyuu</a></td><td class="r1e">1568</td><td class="r1e">348</td><td class="r1e">$13.73</td><td class="r2e">26.33</td><td class="r2e">2.14</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10035319" >Pisky</a></td><td class="r1o">1567</td><td class="r1o">642</td><td class="r1o">$41.19</td><td class="r2o">36.45</td><td class="r2o">8.14</td><td class="r2o">0.96</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8497166" >SuperRaskao</a></td><td class="r1e">1564</td><td class="r1e">290</td><td class="r1e">$8.57</td><td class="r2e">21.92</td><td class="r2e">1.01</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8563312" >grigorg</a></td><td class="r1o">1560</td><td class="r1o">275</td><td class="r1o">$7.24</td><td class="r2o">20.33</td><td class="r2o">0.74</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11936978" >bruin</a></td><td class="r1e">1555</td><td class="r1e">587</td><td class="r1e">$34.53</td><td class="r2e">34.55</td><td class="r2e">6.78</td><td class="r2e">0.64</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10182238" >TypeONegative</a></td><td class="r1o">1555</td><td class="r1o">409</td><td class="r1o">$17.93</td><td class="r2o">28.38</td><td class="r2o">3.15</td><td class="r2o">0.09</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8460252" >tomek2</a></td><td class="r1e">1553</td><td class="r1e">201</td><td class="r1e">$2.47</td><td class="r2e">12.09</td><td class="r2e">0.09</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=154648" >dana</a></td><td class="r1o">1548</td><td class="r1o">311</td><td class="r1o">$9.24</td><td class="r2o">21.93</td><td class="r2o">1.14</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9922455" >kokos</a></td><td class="r1e">1547</td><td class="r1e">255</td><td class="r1e">$5.23</td><td class="r2e">17.19</td><td class="r2e">0.41</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15635590" >Nickolas</a></td><td class="r1o">1545</td><td class="r1o">302</td><td class="r1o">$8.39</td><td class="r2o">20.98</td><td class="r2o">0.97</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13252136" >goo</a></td><td class="r1e">1544</td><td class="r1e">280</td><td class="r1e">$6.75</td><td class="r2e">19.14</td><td class="r2e">0.66</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390554" >ibonaci</a></td><td class="r1o">1543</td><td class="r1o">509</td><td class="r1o">$25.90</td><td class="r2o">31.48</td><td class="r2o">4.94</td><td class="r2o">0.30</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=277723" >Marvin</a></td><td class="r1e">1543</td><td class="r1e">286</td><td class="r1e">$7.11</td><td class="r2e">19.56</td><td class="r2e">0.73</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10447556" >phoenix53</a></td><td class="r1o">1542</td><td class="r1o">523</td><td class="r1o">$27.13</td><td class="r2o">31.80</td><td class="r2o">5.21</td><td class="r2o">0.34</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10389461" >Janq</a></td><td class="r1e">1542</td><td class="r1e">349</td><td class="r1e">$11.82</td><td class="r2e">23.96</td><td class="r2e">1.72</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7211060" >tavbert</a></td><td class="r1o">1540</td><td class="r1o">302</td><td class="r1o">$8.06</td><td class="r2o">20.46</td><td class="r2o">0.92</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10651584" >jkburt</a></td><td class="r1e">1536</td><td class="r1e">417</td><td class="r1e">$17.12</td><td class="r2e">27.23</td><td class="r2e">2.91</td><td class="r2e">0.08</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7443907" >joely</a></td><td class="r1o">1532</td><td class="r1o">320</td><td class="r1o">$8.95</td><td class="r2o">21.14</td><td class="r2o">1.10</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10056426" >plapro</a></td><td class="r1e">1528</td><td class="r1e">296</td><td class="r1e">$7.02</td><td class="r2e">19.01</td><td class="r2e">0.72</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7546347" >main</a></td><td class="r1o">1527</td><td class="r1o">352</td><td class="r1o">$14.71</td><td class="r2o">22.78</td><td class="r2o">1.52</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7562337" >pppancho</a></td><td class="r1e">1527</td><td class="r1e">200</td><td class="r1e">$3.39</td><td class="r2e">9.59</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10646954" >ben.hwang</a></td><td class="r1o">1526</td><td class="r1o">406</td><td class="r1o">$19.28</td><td class="r2o">25.82</td><td class="r2o">2.49</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7563111" >Osric</a></td><td class="r1e">1525</td><td class="r1e">213</td><td class="r1e">$4.05</td><td class="r2e">10.89</td><td class="r2e">0.07</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8434210" >hirai</a></td><td class="r1o">1521</td><td class="r1o">353</td><td class="r1o">$14.34</td><td class="r2o">22.39</td><td class="r2o">1.45</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8379758" >rajsekar_manok</a></td><td class="r1e">1519</td><td class="r1e">403</td><td class="r1e">$18.42</td><td class="r2e">25.10</td><td class="r2e">2.29</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14946025" >Michael_Levin</a></td><td class="r1o">1515</td><td class="r1o">338</td><td class="r1o">$12.62</td><td class="r2o">20.91</td><td class="r2o">1.15</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7584238" >bl</a></td><td class="r1e">1514</td><td class="r1e">275</td><td class="r1e">$7.66</td><td class="r2e">15.94</td><td class="r2e">0.40</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=251591" >emmpee</a></td><td class="r1o">1513</td><td class="r1o">268</td><td class="r1o">$7.13</td><td class="r2o">15.21</td><td class="r2o">0.34</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=151144" >shuvovse</a></td><td class="r1e">1513</td><td class="r1e">330</td><td class="r1e">$11.89</td><td class="r2e">20.20</td><td class="r2e">1.03</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2058798" >skye85</a></td><td class="r1o">1510</td><td class="r1o">262</td><td class="r1o">$6.50</td><td class="r2o">14.39</td><td class="r2o">0.28</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=280198" >alanm</a></td><td class="r1e">1510</td><td class="r1e">308</td><td class="r1e">$9.90</td><td class="r2e">18.19</td><td class="r2e">0.72</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10574602" >wu</a></td><td class="r1o">1509</td><td class="r1o">260</td><td class="r1o">$6.35</td><td class="r2o">14.10</td><td class="r2o">0.27</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7313615" >covganet</a></td><td class="r1e">1504</td><td class="r1e">405</td><td class="r1e">$17.35</td><td class="r2e">24.09</td><td class="r2e">2.11</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8446151" >vdovichenkoVP</a></td><td class="r1o">1503</td><td class="r1o">420</td><td class="r1o">$18.59</td><td class="r2o">24.80</td><td class="r2o">2.36</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13328140" >kfas</a></td><td class="r1e">1494</td><td class="r1e">344</td><td class="r1e">$11.68</td><td class="r2e">19.57</td><td class="r2e">1.01</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958899" >laibo</a></td><td class="r1o">1492</td><td class="r1o">434</td><td class="r1o">$18.89</td><td class="r2o">24.73</td><td class="r2o">2.43</td><td class="r2o">0.06</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14888428" >premkabir</a></td><td class="r1e">1486</td><td class="r1e">350</td><td class="r1e">$11.64</td><td class="r2e">19.38</td><td class="r2e">1.05</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8536577" >ArtV</a></td><td class="r1o">1486</td><td class="r1o">418</td><td class="r1o">$17.09</td><td class="r2o">23.43</td><td class="r2o">2.08</td><td class="r2o">0.05</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8363863" >tnn</a></td><td class="r1e">1485</td><td class="r1e">300</td><td class="r1e">$7.82</td><td class="r2e">15.53</td><td class="r2e">0.46</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7396531" >RandySaint</a></td><td class="r1o">1482</td><td class="r1o">321</td><td class="r1o">$9.14</td><td class="r2o">16.95</td><td class="r2o">0.63</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7568791" >bramandia</a></td><td class="r1e">1480</td><td class="r1e">329</td><td class="r1e">$9.66</td><td class="r2e">17.42</td><td class="r2e">0.71</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15012061" >JNugget</a></td><td class="r1o">1479</td><td class="r1o">314</td><td class="r1o">$8.52</td><td class="r2o">16.21</td><td class="r2o">0.55</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14884843" >yulka</a></td><td class="r1e">1478</td><td class="r1e">289</td><td class="r1e">$6.81</td><td class="r2e">14.16</td><td class="r2e">0.34</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=276230" >dimkadimon</a></td><td class="r1o">1476</td><td class="r1o">223</td><td class="r1o">$2.91</td><td class="r2o">8.09</td><td class="r2o">0.04</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10603824" >katiej76</a></td><td class="r1e">1474</td><td class="r1e">220</td><td class="r1e">$4.26</td><td class="r2e">7.70</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7583175" >Windrider</a></td><td class="r1o">1473</td><td class="r1o">385</td><td class="r1o">$15.98</td><td class="r2o">20.55</td><td class="r2o">1.35</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8362013" >p45c4l</a></td><td class="r1e">1473</td><td class="r1e">271</td><td class="r1e">$7.43</td><td class="r2e">12.24</td><td class="r2e">0.20</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14940443" >finrod</a></td><td class="r1o">1472</td><td class="r1o">506</td><td class="r1o">$25.71</td><td class="r2o">26.57</td><td class="r2o">3.29</td><td class="r2o">0.15</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7453062" >mcphee</a></td><td class="r1e">1471</td><td class="r1e">237</td><td class="r1e">$5.12</td><td class="r2e">9.03</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8383272" >toschek</a></td><td class="r1o">1470</td><td class="r1o">269</td><td class="r1o">$7.16</td><td class="r2o">11.86</td><td class="r2o">0.19</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9972322" >rsasanka</a></td><td class="r1e">1467</td><td class="r1e">282</td><td class="r1e">$7.91</td><td class="r2e">12.75</td><td class="r2e">0.25</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7445405" >sargentm</a></td><td class="r1o">1464</td><td class="r1o">368</td><td class="r1o">$14.07</td><td class="r2o">18.87</td><td class="r2o">1.04</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15099923" >protik</a></td><td class="r1e">1463</td><td class="r1e">180</td><td class="r1e">$1.99</td><td class="r2e">3.59</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289307" >wrjxm</a></td><td class="r1o">1461</td><td class="r1o">280</td><td class="r1o">$7.47</td><td class="r2o">12.13</td><td class="r2o">0.22</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7515298" >TheJanitor</a></td><td class="r1e">1456</td><td class="r1e">483</td><td class="r1e">$22.35</td><td class="r2e">24.47</td><td class="r2e">2.68</td><td class="r2e">0.09</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14932295" >rusnakp</a></td><td class="r1o">1453</td><td class="r1o">338</td><td class="r1o">$11.06</td><td class="r2o">16.04</td><td class="r2o">0.60</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10688250" >aramis(vntu)</a></td><td class="r1e">1451</td><td class="r1e">240</td><td class="r1e">$4.50</td><td class="r2e">8.01</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15607604" >dynamitehacker</a></td><td class="r1o">1446</td><td class="r1o">288</td><td class="r1o">$7.21</td><td class="r2o">11.69</td><td class="r2o">0.21</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9971384" >smell</a></td><td class="r1e">1445</td><td class="r1e">431</td><td class="r1e">$17.49</td><td class="r2e">21.20</td><td class="r2e">1.67</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15499189" >MoodCrimson</a></td><td class="r1o">1439</td><td class="r1o">342</td><td class="r1o">$10.53</td><td class="r2o">15.35</td><td class="r2o">0.57</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15654085" >mpr</a></td><td class="r1e">1439</td><td class="r1e">329</td><td class="r1e">$9.65</td><td class="r2e">14.46</td><td class="r2e">0.45</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13288666" >mohandasks</a></td><td class="r1o">1439</td><td class="r1o">313</td><td class="r1o">$8.53</td><td class="r2o">13.27</td><td class="r2o">0.33</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11998907" >Doomitru</a></td><td class="r1e">1438</td><td class="r1e">339</td><td class="r1e">$10.26</td><td class="r2e">15.06</td><td class="r2e">0.53</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7348476" >zsacul</a></td><td class="r1o">1435</td><td class="r1o">319</td><td class="r1o">$8.73</td><td class="r2o">13.42</td><td class="r2o">0.36</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8557563" >stachs</a></td><td class="r1e">1434</td><td class="r1e">274</td><td class="r1e">$5.82</td><td class="r2e">9.79</td><td class="r2e">0.12</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15161606" >mayop</a></td><td class="r1o">1431</td><td class="r1o">482</td><td class="r1o">$20.27</td><td class="r2o">22.84</td><td class="r2o">2.23</td><td class="r2o">0.07</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9978873" >alsomagic</a></td><td class="r1e">1430</td><td class="r1e">315</td><td class="r1e">$8.11</td><td class="r2e">12.71</td><td class="r2e">0.30</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10474664" >lifeisbeautiful</a></td><td class="r1o">1429</td><td class="r1o">311</td><td class="r1o">$7.88</td><td class="r2o">12.38</td><td class="r2o">0.29</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7402446" >Mikhos</a></td><td class="r1e">1428</td><td class="r1e">356</td><td class="r1e">$10.88</td><td class="r2e">15.57</td><td class="r2e">0.62</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8376247" >hidralisk</a></td><td class="r1o">1424</td><td class="r1o">224</td><td class="r1o">$6.02</td><td class="r2o">5.25</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10435847" >Baton</a></td><td class="r1e">1421</td><td class="r1e">335</td><td class="r1e">$13.78</td><td class="r2e">13.56</td><td class="r2e">0.41</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=265558" >LehooZeher</a></td><td class="r1o">1415</td><td class="r1o">246</td><td class="r1o">$7.04</td><td class="r2o">6.48</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15186340" >staufk</a></td><td class="r1e">1412</td><td class="r1e">347</td><td class="r1e">$14.08</td><td class="r2e">13.90</td><td class="r2e">0.45</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13330388" >RizLA</a></td><td class="r1o">1411</td><td class="r1o">545</td><td class="r1o">$28.56</td><td class="r2o">24.46</td><td class="r2o">2.89</td><td class="r2o">0.13</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301982" >jkl</a></td><td class="r1e">1399</td><td class="r1e">315</td><td class="r1e">$10.91</td><td class="r2e">10.77</td><td class="r2e">0.21</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7325628" >therealmoose</a></td><td class="r1o">1394</td><td class="r1o">349</td><td class="r1o">$13.04</td><td class="r2o">12.89</td><td class="r2o">0.40</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15658850" >caihl</a></td><td class="r1e">1389</td><td class="r1e">254</td><td class="r1e">$6.28</td><td class="r2e">5.81</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287130" >NeverMore</a></td><td class="r1o">1388</td><td class="r1o">302</td><td class="r1o">$9.38</td><td class="r2o">9.22</td><td class="r2o">0.13</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7213822" >YBGourry</a></td><td class="r1e">1378</td><td class="r1e">296</td><td class="r1e">$8.43</td><td class="r2e">8.28</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8354434" >Artur</a></td><td class="r1o">1377</td><td class="r1o">264</td><td class="r1o">$6.32</td><td class="r2o">5.96</td><td class="r2o">0.03</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8592565" >felix_halim</a></td><td class="r1e">1376</td><td class="r1e">298</td><td class="r1e">$8.41</td><td class="r2e">8.28</td><td class="r2e">0.10</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15659118" >konglong</a></td><td class="r1o">1376</td><td class="r1o">373</td><td class="r1o">$13.59</td><td class="r2o">13.47</td><td class="r2o">0.46</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7393957" >smartgirl</a></td><td class="r1e">1375</td><td class="r1e">272</td><td class="r1e">$6.75</td><td class="r2e">6.42</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8472433" >bwpow</a></td><td class="r1o">1367</td><td class="r1o">255</td><td class="r1o">$5.38</td><td class="r2o">4.96</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=272999" >sh_maestro</a></td><td class="r1e">1365</td><td class="r1e">271</td><td class="r1e">$6.24</td><td class="r2e">5.95</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269694" >nnahas</a></td><td class="r1o">1360</td><td class="r1o">322</td><td class="r1o">$9.19</td><td class="r2o">9.10</td><td class="r2o">0.14</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15419048" >sclo</a></td><td class="r1e">1360</td><td class="r1e">314</td><td class="r1e">$8.66</td><td class="r2e">8.60</td><td class="r2e">0.12</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10219006" >kranjit</a></td><td class="r1o">1354</td><td class="r1o">264</td><td class="r1o">$5.40</td><td class="r2o">5.04</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7463225" >oog</a></td><td class="r1e">1352</td><td class="r1e">276</td><td class="r1e">$5.99</td><td class="r2e">5.71</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11878766" >nowakpl</a></td><td class="r1o">1349</td><td class="r1o">314</td><td class="r1o">$8.19</td><td class="r2o">8.13</td><td class="r2o">0.11</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15456822" >Shamaniac</a></td><td class="r1e">1348</td><td class="r1e">326</td><td class="r1e">$8.87</td><td class="r2e">8.83</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11909635" >Breusov</a></td><td class="r1o">1344</td><td class="r1o">323</td><td class="r1o">$8.46</td><td class="r2o">8.42</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8347010" >mkschmidt</a></td><td class="r1e">1344</td><td class="r1e">449</td><td class="r1e">$16.66</td><td class="r2e">16.09</td><td class="r2e">0.91</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8521800" >Pengembara</a></td><td class="r1o">1340</td><td class="r1o">247</td><td class="r1o">$3.97</td><td class="r2o">3.51</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=296232" >y</a></td><td class="r1e">1337</td><td class="r1e">312</td><td class="r1e">$9.67</td><td class="r2e">7.42</td><td class="r2e">0.08</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8397059" >nahpets</a></td><td class="r1o">1335</td><td class="r1o">257</td><td class="r1o">$6.31</td><td class="r2o">3.90</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=267455" >cocoapi</a></td><td class="r1e">1326</td><td class="r1e">342</td><td class="r1e">$10.93</td><td class="r2e">8.84</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15228811" >Zheng</a></td><td class="r1o">1323</td><td class="r1o">403</td><td class="r1o">$14.50</td><td class="r2o">12.36</td><td class="r2o">0.43</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15325371" >david_angga888</a></td><td class="r1e">1317</td><td class="r1e">411</td><td class="r1e">$14.62</td><td class="r2e">12.57</td><td class="r2e">0.46</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7422993" >tanmoy</a></td><td class="r1o">1304</td><td class="r1o">370</td><td class="r1o">$11.45</td><td class="r2o">9.54</td><td class="r2o">0.21</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15043356" >crooks_dwayne</a></td><td class="r1e">1287</td><td class="r1e">302</td><td class="r1e">$6.72</td><td class="r2e">4.83</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10661041" >Jarkel</a></td><td class="r1o">1286</td><td class="r1o">275</td><td class="r1o">$5.28</td><td class="r2o">3.37</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=109623" >empraptor</a></td><td class="r1e">1283</td><td class="r1e">371</td><td class="r1e">$10.41</td><td class="r2e">8.62</td><td class="r2e">0.16</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="6">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7503573" >nerd256</a></td><td class="r1o">1281</td><td class="r1o">280</td><td class="r1o">$5.36</td><td class="r2o">3.51</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10169506" >telly12</a></td><td class="r1e">1276</td><td class="r1e">487</td><td class="r1e">$16.83</td><td class="r2e">14.56</td><td class="r2e">0.81</td><td class="r2e">0.01</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15269333" >vbvan</a></td><td class="r1o">1274</td><td class="r1o">304</td><td class="r1o">$6.35</td><td class="r2o">4.55</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10667770" >hhen926</a></td><td class="r1e">1264</td><td class="r1e">415</td><td class="r1e">$11.99</td><td class="r2e">10.29</td><td class="r2e">0.30</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8471704" >cypressx</a></td><td class="r1o">1260</td><td class="r1o">426</td><td class="r1o">$12.41</td><td class="r2o">10.70</td><td class="r2o">0.34</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8544994" >nerix</a></td><td class="r1e">1237</td><td class="r1e">343</td><td class="r1e">$6.94</td><td class="r2e">5.41</td><td class="r2e">0.05</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=298106" >FatHendrix</a></td><td class="r1o">1228</td><td class="r1o">301</td><td class="r1o">$4.62</td><td class="r2o">3.14</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15184944" >dimple</a></td><td class="r1e">1194</td><td class="r1e">411</td><td class="r1e">$8.68</td><td class="r2e">7.41</td><td class="r2e">0.13</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15502252" >Dizzy.exe</a></td><td class="r1o">1188</td><td class="r1o">492</td><td class="r1o">$12.62</td><td class="r2o">11.10</td><td class="r2o">0.44</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11880068" >mariobros</a></td><td class="r1e">1183</td><td class="r1e">281</td><td class="r1e">$2.75</td><td class="r2e">1.58</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15135745" >caopeng</a></td><td class="r1o">1158</td><td class="r1o">427</td><td class="r1o">$8.14</td><td class="r2o">7.01</td><td class="r2o">0.12</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10582231" >ctynan</a></td><td class="r1e">1115</td><td class="r1e">655</td><td class="r1e">$17.45</td><td class="r2e">15.14</td><td class="r2e">1.15</td><td class="r2e">0.04</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289235" >HoldMeDown</a></td><td class="r1o">1111</td><td class="r1o">530</td><td class="r1o">$11.24</td><td class="r2o">10.08</td><td class="r2o">0.37</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11925555" >lexgas</a></td><td class="r1e">1101</td><td class="r1e">394</td><td class="r1e">$5.00</td><td class="r2e">4.05</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10092045" >twhite5</a></td><td class="r1o">1046</td><td class="r1o">374</td><td class="r1o">$3.12</td><td class="r2o">2.38</td><td class="r2o">0.01</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextGreen" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11833327" >metaljaguar</a></td><td class="r1e">985</td><td class="r1e">674</td><td class="r1e">$12.95</td><td class="r2e">11.64</td><td class="r2e">0.66</td><td class="r2e">0.02</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
