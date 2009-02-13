<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>

<body>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco06/header_logo.gif"/></td>
      </tr>
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>jdmetz's odds</h2></td>
            <td class="bodyText" align=right>
            <!-- round links-->
            <jsp:include page="odds_links.jsp" >
               <jsp:param name="selectedRound" value="round4"/>
            </jsp:include>
            </td>
         </tr>

         <tr>
            <td align="left" class="bodyText" valign="top">
               <img src="/i/m/jdmetz_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left" class="myStatsPhoto"/>
               By&#160;<tc-webtag:handle coderId="7459326" context="algorithm"/><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top" rowspan="2">
            Beat the odds! These results of 1,000,000 Monte Carlo simulations predict your chances to advance in the 2006 TopCoder Open based only on your current TopCoder rating and volatility.  Try your best to beat these odds as you advance through the tournament.
            <br><br>
            The model used here is a normal distribution with the mean of your rating and standard deviation of your volatility, assuming every advancing coder competes in every round they are eligible for and scores more than 0 points.  There are obvious flaws with these assumptions, and this information is provided for entertainment purposes only.
            <br><br>
            The "Earnings" column includes prizes for the top three finishers in each room for the online rounds, excluding already completed rounds.
            </td>
         </tr>
      </table>
<br/>

<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>

<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=144400" >tomek</a></td><td class="r1o">3330</td><td class="r1o">271</td><td class="r1o">$8695.74</td><td class="r2o">99.99</td><td class="r2o">21.02</td><td class="r2o">14.45</td><td class="r2o">92.39</td><td class="r3o">12.84</td><td class="r3o">18.12</td><td class="r3o">22.50</td><td class="r3o">24.67</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=272072" >SnapDragon</a></td><td class="r1e">3321</td><td class="r1e">242</td><td class="r1e">$8396.92</td><td class="r2e">100.00</td><td class="r2e">22.70</td><td class="r2e">15.73</td><td class="r2e">92.47</td><td class="r3e">13.69</td><td class="r3e">19.65</td><td class="r3e">23.79</td><td class="r3e">22.13</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10574855" >Petr</a></td><td class="r1o">3257</td><td class="r1o">337</td><td class="r1o">$6853.44</td><td class="r2o">99.73</td><td class="r2o">28.20</td><td class="r2o">16.73</td><td class="r2o">84.06</td><td class="r3o">12.41</td><td class="r3o">14.34</td><td class="r3o">15.85</td><td class="r3o">19.16</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8357090" >misof</a></td><td class="r1e">3092</td><td class="r1e">383</td><td class="r1e">$3589.10</td><td class="r2e">97.91</td><td class="r2e">38.43</td><td class="r2e">16.59</td><td class="r2e">63.16</td><td class="r3e">9.48</td><td class="r3e">8.59</td><td class="r3e">7.73</td><td class="r3e">7.92</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7445961" >snewman</a></td><td class="r1o">3058</td><td class="r1o">415</td><td class="r1o">$3225.32</td><td class="r2o">96.38</td><td class="r2o">40.68</td><td class="r2o">16.65</td><td class="r2o">56.47</td><td class="r3o">7.73</td><td class="r3o">6.97</td><td class="r3o">6.48</td><td class="r3o">7.31</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8355516" >Eryx</a></td><td class="r1e">3044</td><td class="r1e">316</td><td class="r1e">$2656.75</td><td class="r2e">98.94</td><td class="r2e">49.04</td><td class="r2e">18.43</td><td class="r2e">56.55</td><td class="r3e">9.70</td><td class="r3e">7.89</td><td class="r3e">5.99</td><td class="r3e">4.20</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=311170" >bladerunner</a></td><td class="r1o">3019</td><td class="r1o">297</td><td class="r1o">$2237.79</td><td class="r2o">99.10</td><td class="r2o">52.78</td><td class="r2o">18.07</td><td class="r2o">52.28</td><td class="r3o">9.15</td><td class="r3o">6.99</td><td class="r3o">4.83</td><td class="r3o">2.91</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10481120" >ivan_metelsky</a></td><td class="r1e">3004</td><td class="r1e">444</td><td class="r1e">$2664.25</td><td class="r2e">94.03</td><td class="r2e">39.35</td><td class="r2e">14.50</td><td class="r2e">49.01</td><td class="r3e">6.19</td><td class="r3e">5.44</td><td class="r3e">4.94</td><td class="r3e">5.82</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=270505" >John Dethridge</a></td><td class="r1o">2899</td><td class="r1o">399</td><td class="r1o">$1599.74</td><td class="r2o">92.94</td><td class="r2o">41.64</td><td class="r2o">11.08</td><td class="r2o">36.45</td><td class="r3o">4.33</td><td class="r3o">3.39</td><td class="r3o">2.70</td><td class="r3o">2.33</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8394868" >rem</a></td><td class="r1e">2839</td><td class="r1e">293</td><td class="r1e">$941.79</td><td class="r2e">96.32</td><td class="r2e">53.26</td><td class="r2e">8.86</td><td class="r2e">24.87</td><td class="r3e">3.14</td><td class="r3e">1.87</td><td class="r3e">0.97</td><td class="r3e">0.44</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7462740" >ploh</a></td><td class="r1o">2684</td><td class="r1o">378</td><td class="r1o">$634.07</td><td class="r2o">83.72</td><td class="r2o">34.90</td><td class="r2o">4.10</td><td class="r2o">13.14</td><td class="r3o">1.10</td><td class="r3o">0.67</td><td class="r3o">0.38</td><td class="r3o">0.24</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=262936" >dgarthur</a></td><td class="r1e">2680</td><td class="r1e">526</td><td class="r1e">$841.19</td><td class="r2e">75.87</td><td class="r2e">25.34</td><td class="r2e">4.65</td><td class="r2e">17.87</td><td class="r3e">1.44</td><td class="r3e">1.09</td><td class="r3e">0.90</td><td class="r3e">0.97</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293874" >nicka81</a></td><td class="r1o">2658</td><td class="r1o">374</td><td class="r1o">$575.91</td><td class="r2o">82.30</td><td class="r2o">32.24</td><td class="r2o">3.36</td><td class="r2o">10.98</td><td class="r3o">0.85</td><td class="r3o">0.49</td><td class="r3o">0.29</td><td class="r3o">0.15</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8365685" >pparys</a></td><td class="r1e">2639</td><td class="r1e">268</td><td class="r1e">$494.20</td><td class="r2e">88.75</td><td class="r2e">37.20</td><td class="r2e">1.77</td><td class="r2e">5.09</td><td class="r3e">0.30</td><td class="r3e">0.11</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274023" >venco</a></td><td class="r1o">2630</td><td class="r1o">308</td><td class="r1o">$497.53</td><td class="r2o">84.88</td><td class="r2o">33.67</td><td class="r2o">2.07</td><td class="r2o">6.62</td><td class="r3o">0.43</td><td class="r3o">0.19</td><td class="r3o">0.09</td><td class="r3o">0.03</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=279471" >haha</a></td><td class="r1e">2610</td><td class="r1e">365</td><td class="r1e">$502.17</td><td class="r2e">79.30</td><td class="r2e">28.36</td><td class="r2e">2.26</td><td class="r2e">8.16</td><td class="r3e">0.54</td><td class="r3e">0.30</td><td class="r3e">0.16</td><td class="r3e">0.07</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>

</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7442498" >marek.cygan</a></td><td class="r1o">2605</td><td class="r1o">497</td><td class="r1o">$613.02</td><td class="r2o">72.30</td><td class="r2o">22.80</td><td class="r2o">3.10</td><td class="r2o">12.52</td><td class="r3o">0.89</td><td class="r3o">0.65</td><td class="r3o">0.46</td><td class="r3o">0.41</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=308453" >overwise</a></td><td class="r1e">2582</td><td class="r1e">469</td><td class="r1e">$540.24</td><td class="r2e">71.84</td><td class="r2e">22.84</td><td class="r2e">2.62</td><td class="r2e">10.32</td><td class="r3e">0.71</td><td class="r3e">0.47</td><td class="r3e">0.33</td><td class="r3e">0.24</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=277659" >radeye</a></td><td class="r1o">2580</td><td class="r1o">293</td><td class="r1o">$447.38</td><td class="r2o">81.92</td><td class="r2o">28.57</td><td class="r2o">1.17</td><td class="r2o">3.96</td><td class="r3o">0.20</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275071" >antimatter</a></td><td class="r1e">2569</td><td class="r1e">444</td><td class="r1e">$497.00</td><td class="r2e">71.88</td><td class="r2e">22.79</td><td class="r2e">2.25</td><td class="r2e">8.73</td><td class="r3e">0.55</td><td class="r3e">0.37</td><td class="r3e">0.23</td><td class="r3e">0.16</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7394165" >PaulJefferys</a></td><td class="r1o">2568</td><td class="r1o">315</td><td class="r1o">$437.86</td><td class="r2o">79.12</td><td class="r2o">26.35</td><td class="r2o">1.23</td><td class="r2o">4.21</td><td class="r3o">0.22</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287105" >lars</a></td><td class="r1e">2566</td><td class="r1e">302</td><td class="r1e">$436.37</td><td class="r2e">79.93</td><td class="r2e">26.44</td><td class="r2e">1.10</td><td class="r2e">3.83</td><td class="r3e">0.18</td><td class="r3e">0.08</td><td class="r3e">0.03</td><td class="r3e">0.01</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301937" >RalphFurmaniak</a></td><td class="r1o">2562</td><td class="r1o">315</td><td class="r1o">$434.36</td><td class="r2o">78.62</td><td class="r2o">25.64</td><td class="r2o">1.16</td><td class="r2o">4.10</td><td class="r3o">0.20</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9906197" >krijgertje</a></td><td class="r1e">2558</td><td class="r1e">440</td><td class="r1e">$479.94</td><td class="r2e">71.27</td><td class="r2e">22.01</td><td class="r2e">2.08</td><td class="r2e">8.18</td><td class="r3e">0.51</td><td class="r3e">0.32</td><td class="r3e">0.20</td><td class="r3e">0.13</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=261024" >grotmol</a></td><td class="r1o">2552</td><td class="r1o">324</td><td class="r1o">$426.33</td><td class="r2o">77.05</td><td class="r2o">24.46</td><td class="r2o">1.12</td><td class="r2o">4.07</td><td class="r3o">0.19</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=309982" >cyfra</a></td><td class="r1e">2542</td><td class="r1e">335</td><td class="r1e">$445.76</td><td class="r2e">75.39</td><td class="r2e">23.48</td><td class="r2e">1.13</td><td class="r2e">4.16</td><td class="r3e">0.20</td><td class="r3e">0.10</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7479769" >marian</a></td><td class="r1o">2535</td><td class="r1o">192</td><td class="r1o">$450.84</td><td class="r2o">87.36</td><td class="r2o">22.78</td><td class="r2o">0.18</td><td class="r2o">0.62</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=14970299" >Egor</a></td><td class="r1e">2534</td><td class="r1e">492</td><td class="r1e">$522.75</td><td class="r2e">67.44</td><td class="r2e">19.44</td><td class="r2e">2.10</td><td class="r2e">8.73</td><td class="r3e">0.54</td><td class="r3e">0.36</td><td class="r3e">0.26</td><td class="r3e">0.21</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958600" >Zis</a></td><td class="r1o">2525</td><td class="r1o">404</td><td class="r1o">$452.72</td><td class="r2o">70.18</td><td class="r2o">20.66</td><td class="r2o">1.44</td><td class="r2o">5.68</td><td class="r3o">0.32</td><td class="r3o">0.18</td><td class="r3o">0.10</td><td class="r3o">0.05</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10599449" >natori</a></td><td class="r1e">2512</td><td class="r1e">301</td><td class="r1e">$414.24</td><td class="r2e">74.78</td><td class="r2e">20.70</td><td class="r2e">0.61</td><td class="r2e">2.35</td><td class="r3e">0.09</td><td class="r3e">0.03</td><td class="r3e">0.01</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8601171" >HilbertRaum</a></td><td class="r1o">2511</td><td class="r1o">419</td><td class="r1o">$443.27</td><td class="r2o">68.31</td><td class="r2o">19.28</td><td class="r2o">1.37</td><td class="r2o">5.64</td><td class="r3o">0.31</td><td class="r3o">0.18</td><td class="r3o">0.09</td><td class="r3o">0.05</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153656" >elizarov</a></td><td class="r1e">2500</td><td class="r1e">363</td><td class="r1e">$412.04</td><td class="r2e">69.81</td><td class="r2e">19.21</td><td class="r2e">0.91</td><td class="r2e">3.71</td><td class="r3e">0.17</td><td class="r3e">0.08</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>

<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390224" >gawry</a></td><td class="r1o">2460</td><td class="r1o">451</td><td class="r1o">$406.53</td><td class="r2o">62.83</td><td class="r2o">15.94</td><td class="r2o">1.10</td><td class="r2o">4.97</td><td class="r3o">0.25</td><td class="r3o">0.15</td><td class="r3o">0.09</td><td class="r3o">0.05</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10428762" >HiltonLange</a></td><td class="r1e">2449</td><td class="r1e">431</td><td class="r1e">$386.58</td><td class="r2e">62.51</td><td class="r2e">15.50</td><td class="r2e">0.90</td><td class="r2e">4.13</td><td class="r3e">0.20</td><td class="r3e">0.10</td><td class="r3e">0.06</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287266" >jms137</a></td><td class="r1o">2429</td><td class="r1o">250</td><td class="r1o">$350.84</td><td class="r2o">67.94</td><td class="r2o">11.83</td><td class="r2o">0.10</td><td class="r2o">0.48</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7452866" >Im2Good</a></td><td class="r1e">2414</td><td class="r1e">407</td><td class="r1e">$349.35</td><td class="r2e">59.94</td><td class="r2e">13.39</td><td class="r2e">0.57</td><td class="r2e">2.76</td><td class="r3e">0.11</td><td class="r3e">0.06</td><td class="r3e">0.03</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7485898" >Andrew_Lazarev</a></td><td class="r1o">2409</td><td class="r1o">378</td><td class="r1o">$337.77</td><td class="r2o">60.13</td><td class="r2o">12.76</td><td class="r2o">0.42</td><td class="r2o">2.05</td><td class="r3o">0.07</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7459080" >ardiankp</a></td><td class="r1e">2401</td><td class="r1e">232</td><td class="r1e">$330.00</td><td class="r2e">64.73</td><td class="r2e">8.59</td><td class="r2e">0.04</td><td class="r2e">0.21</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390467" >lovro</a></td><td class="r1o">2382</td><td class="r1o">395</td><td class="r1o">$320.84</td><td class="r2o">57.03</td><td class="r2o">11.30</td><td class="r2o">0.36</td><td class="r2o">1.92</td><td class="r3o">0.06</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=284007" >Ryan</a></td><td class="r1e">2378</td><td class="r1e">263</td><td class="r1e">$307.42</td><td class="r2e">59.83</td><td class="r2e">8.07</td><td class="r2e">0.05</td><td class="r2e">0.31</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10332088" >martinp534</a></td><td class="r1o">2377</td><td class="r1o">202</td><td class="r1o">$315.37</td><td class="r2o">62.53</td><td class="r2o">5.80</td><td class="r2o">0.01</td><td class="r2o">0.07</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11829284" >andrewzta</a></td><td class="r1e">2374</td><td class="r1e">323</td><td class="r1e">$304.59</td><td class="r2e">57.55</td><td class="r2e">9.62</td><td class="r2e">0.14</td><td class="r2e">0.81</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=297823" >madking</a></td><td class="r1o">2374</td><td class="r1o">258</td><td class="r1o">$304.80</td><td class="r2o">59.48</td><td class="r2o">7.81</td><td class="r2o">0.04</td><td class="r2o">0.27</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=346607" >kalmakka</a></td><td class="r1e">2361</td><td class="r1e">402</td><td class="r1e">$307.49</td><td class="r2e">54.81</td><td class="r2e">10.36</td><td class="r2e">0.33</td><td class="r2e">1.78</td><td class="r3e">0.06</td><td class="r3e">0.03</td><td class="r3e">0.01</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=288584" >LunaticFringe</a></td><td class="r1o">2359</td><td class="r1o">299</td><td class="r1o">$292.65</td><td class="r2o">56.23</td><td class="r2o">8.17</td><td class="r2o">0.08</td><td class="r2o">0.49</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287568" >tjq</a></td><td class="r1e">2348</td><td class="r1e">258</td><td class="r1e">$283.73</td><td class="r2e">55.60</td><td class="r2e">6.39</td><td class="r2e">0.03</td><td class="r2e">0.19</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156216" >daveagp</a></td><td class="r1o">2338</td><td class="r1o">472</td><td class="r1o">$310.18</td><td class="r2o">52.17</td><td class="r2o">10.03</td><td class="r2o">0.48</td><td class="r2o">2.61</td><td class="r3o">0.10</td><td class="r3o">0.05</td><td class="r3o">0.03</td><td class="r3o">0.02</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10157606" >Ying</a></td><td class="r1e">2328</td><td class="r1e">589</td><td class="r1e">$354.81</td><td class="r2e">51.09</td><td class="r2e">9.99</td><td class="r2e">0.83</td><td class="r2e">4.67</td><td class="r3e">0.20</td><td class="r3e">0.13</td><td class="r3e">0.10</td><td class="r3e">0.10</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>

</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155880" >NPermyakov</a></td><td class="r1o">2311</td><td class="r1o">424</td><td class="r1o">$278.57</td><td class="r2o">49.90</td><td class="r2o">8.38</td><td class="r2o">0.25</td><td class="r2o">1.51</td><td class="r3o">0.04</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7393427" >texel</a></td><td class="r1e">2305</td><td class="r1e">346</td><td class="r1e">$258.55</td><td class="r2e">49.08</td><td class="r2e">6.68</td><td class="r2e">0.08</td><td class="r2e">0.56</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2058177" >Revenger</a></td><td class="r1o">2304</td><td class="r1o">452</td><td class="r1o">$308.23</td><td class="r2o">49.15</td><td class="r2o">8.42</td><td class="r2o">0.30</td><td class="r2o">1.80</td><td class="r3o">0.05</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10676764" >algostorm</a></td><td class="r1e">2296</td><td class="r1e">473</td><td class="r1e">$309.90</td><td class="r2e">48.67</td><td class="r2e">8.36</td><td class="r2e">0.33</td><td class="r2e">2.02</td><td class="r3e">0.06</td><td class="r3e">0.04</td><td class="r3e">0.02</td><td class="r3e">0.01</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8359547" >Jasko</a></td><td class="r1o">2285</td><td class="r1o">399</td><td class="r1o">$281.59</td><td class="r2o">47.22</td><td class="r2o">6.92</td><td class="r2o">0.14</td><td class="r2o">0.95</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=302501" >PMH</a></td><td class="r1e">2269</td><td class="r1e">300</td><td class="r1e">$246.03</td><td class="r2e">44.20</td><td class="r2e">4.08</td><td class="r2e">0.02</td><td class="r2e">0.17</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8349097" >hauser</a></td><td class="r1o">2243</td><td class="r1o">281</td><td class="r1o">$220.17</td><td class="r2o">40.22</td><td class="r2o">2.82</td><td class="r2o">0.01</td><td class="r2o">0.08</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9927526" >Vedensky</a></td><td class="r1e">2224</td><td class="r1e">307</td><td class="r1e">$213.96</td><td class="r2e">38.70</td><td class="r2e">2.92</td><td class="r2e">0.01</td><td class="r2e">0.12</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301395" >HardCoder</a></td><td class="r1o">2200</td><td class="r1o">338</td><td class="r1o">$206.28</td><td class="r2o">36.88</td><td class="r2o">2.95</td><td class="r2o">0.02</td><td class="r2o">0.17</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10610339" >singlethread</a></td><td class="r1e">2198</td><td class="r1e">339</td><td class="r1e">$205.78</td><td class="r2e">36.77</td><td class="r2e">2.96</td><td class="r2e">0.02</td><td class="r2e">0.16</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2059354" >futo</a></td><td class="r1o">2192</td><td class="r1o">315</td><td class="r1o">$192.66</td><td class="r2o">34.94</td><td class="r2o">2.29</td><td class="r2o">0.01</td><td class="r2o">0.09</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=252076" >Wasteland</a></td><td class="r1e">2184</td><td class="r1e">308</td><td class="r1e">$185.14</td><td class="r2e">33.75</td><td class="r2e">2.04</td><td class="r2e">0.01</td><td class="r2e">0.07</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8556047" >dzetkulict</a></td><td class="r1o">2166</td><td class="r1o">406</td><td class="r1o">$206.45</td><td class="r2o">35.83</td><td class="r2o">3.46</td><td class="r2o">0.04</td><td class="r2o">0.35</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7454301" >paranoia</a></td><td class="r1e">2164</td><td class="r1e">601</td><td class="r1e">$268.42</td><td class="r2e">40.18</td><td class="r2e">5.78</td><td class="r2e">0.31</td><td class="r2e">2.19</td><td class="r3e">0.07</td><td class="r3e">0.04</td><td class="r3e">0.03</td><td class="r3e">0.03</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153902" >evd</a></td><td class="r1o">2157</td><td class="r1o">219</td><td class="r1o">$125.16</td><td class="r2o">23.97</td><td class="r2o">0.40</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7563318" >sghao126</a></td><td class="r1e">2123</td><td class="r1e">244</td><td class="r1e">$115.19</td><td class="r2e">21.92</td><td class="r2e">0.40</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293387" >abiczo</a></td><td class="r1o">2120</td><td class="r1o">451</td><td class="r1o">$194.97</td><td class="r2o">33.32</td><td class="r2o">3.20</td><td class="r2o">0.05</td><td class="r2o">0.45</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=108530" >dpecora</a></td><td class="r1e">2094</td><td class="r1e">392</td><td class="r1e">$161.55</td><td class="r2e">28.69</td><td class="r2e">1.89</td><td class="r2e">0.01</td><td class="r2e">0.14</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7360309" >dmks</a></td><td class="r1o">2091</td><td class="r1o">399</td><td class="r1o">$163.07</td><td class="r2o">28.88</td><td class="r2o">1.97</td><td class="r2o">0.02</td><td class="r2o">0.16</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=278342" >adic</a></td><td class="r1e">2089</td><td class="r1e">247</td><td class="r1e">$95.98</td><td class="r2e">18.32</td><td class="r2e">0.26</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=107835" >sjelkjd</a></td><td class="r1o">2086</td><td class="r1o">296</td><td class="r1o">$118.77</td><td class="r2o">22.17</td><td class="r2o">0.62</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11923016" >Idle</a></td><td class="r1e">2065</td><td class="r1e">323</td><td class="r1e">$119.16</td><td class="r2e">22.03</td><td class="r2e">0.74</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7495076" >jo_chang</a></td><td class="r1o">2051</td><td class="r1o">243</td><td class="r1o">$73.43</td><td class="r2o">14.10</td><td class="r2o">0.13</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10407399" >timmac</a></td><td class="r1e">2045</td><td class="r1e">246</td><td class="r1e">$72.56</td><td class="r2e">13.93</td><td class="r2e">0.14</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11899489" >Jacek</a></td><td class="r1o">2042</td><td class="r1o">324</td><td class="r1o">$108.47</td><td class="r2o">20.12</td><td class="r2o">0.58</td><td class="r2o">0.00</td><td class="r2o">0.02</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=299709" >Modulator</a></td><td class="r1e">2034</td><td class="r1e">271</td><td class="r1e">$79.99</td><td class="r2e">15.21</td><td class="r2e">0.21</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7338095" >tomal</a></td><td class="r1o">2032</td><td class="r1o">353</td><td class="r1o">$115.95</td><td class="r2o">21.23</td><td class="r2o">0.78</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7505977" >maze_pallas</a></td><td class="r1e">2011</td><td class="r1e">291</td><td class="r1e">$94.81</td><td class="r2e">14.94</td><td class="r2e">0.22</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=108262" >mathgodleo</a></td><td class="r1o">2009</td><td class="r1o">363</td><td class="r1o">$128.43</td><td class="r2o">19.98</td><td class="r2o">0.69</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269025" >assembler</a></td><td class="r1e">2009</td><td class="r1e">225</td><td class="r1e">$57.11</td><td class="r2e">9.02</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8440049" >bolu</a></td><td class="r1o">2006</td><td class="r1o">274</td><td class="r1o">$83.10</td><td class="r2o">13.13</td><td class="r2o">0.15</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289706" >mickle</a></td><td class="r1e">2002</td><td class="r1e">255</td><td class="r1e">$70.87</td><td class="r2e">11.21</td><td class="r2e">0.09</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>

</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>

</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7368306" >Matei</a></td><td class="r1o">1969</td><td class="r1o">339</td><td class="r1o">$99.15</td><td class="r2o">15.55</td><td class="r2o">0.34</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156491" >chogyonim</a></td><td class="r1e">1961</td><td class="r1e">360</td><td class="r1e">$104.91</td><td class="r2e">16.40</td><td class="r2e">0.43</td><td class="r2e">0.00</td><td class="r2e">0.02</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=292000" >SmileyGirl256</a></td><td class="r1o">1941</td><td class="r1o">352</td><td class="r1o">$92.35</td><td class="r2o">14.48</td><td class="r2o">0.30</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10603164" >sheiech</a></td><td class="r1e">1940</td><td class="r1e">478</td><td class="r1e">$142.08</td><td class="r2e">21.68</td><td class="r2e">1.20</td><td class="r2e">0.01</td><td class="r2e">0.15</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=268720" >amorosov</a></td><td class="r1o">1910</td><td class="r1o">410</td><td class="r1o">$104.50</td><td class="r2o">16.23</td><td class="r2o">0.50</td><td class="r2o">0.00</td><td class="r2o">0.03</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11797255" >aubergineanode</a></td><td class="r1e">1876</td><td class="r1e">389</td><td class="r1e">$83.32</td><td class="r2e">13.03</td><td class="r2e">0.27</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7268916" >bsauerwine</a></td><td class="r1o">1875</td><td class="r1o">438</td><td class="r1o">$102.05</td><td class="r2o">15.82</td><td class="r2o">0.54</td><td class="r2o">0.00</td><td class="r2o">0.04</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10684103" >Barlennan</a></td><td class="r1e">1870</td><td class="r1e">292</td><td class="r1e">$41.10</td><td class="r2e">6.51</td><td class="r2e">0.03</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13261056" >DamianK</a></td><td class="r1o">1851</td><td class="r1o">404</td><td class="r1o">$80.29</td><td class="r2o">12.54</td><td class="r2o">0.26</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15082287" >bus</a></td><td class="r1e">1841</td><td class="r1e">602</td><td class="r1e">$144.69</td><td class="r2e">21.60</td><td class="r2e">1.46</td><td class="r2e">0.02</td><td class="r2e">0.32</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7472513" >szd714</a></td><td class="r1o">1834</td><td class="r1o">386</td><td class="r1o">$68.26</td><td class="r2o">10.71</td><td class="r2o">0.18</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13252136" >goo</a></td><td class="r1e">1815</td><td class="r1e">355</td><td class="r1e">$51.21</td><td class="r2e">8.07</td><td class="r2e">0.08</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10513872" >ryanprichard</a></td><td class="r1o">1807</td><td class="r1o">302</td><td class="r1o">$30.18</td><td class="r2o">4.77</td><td class="r2o">0.02</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7313615" >covganet</a></td><td class="r1e">1802</td><td class="r1e">436</td><td class="r1e">$77.01</td><td class="r2e">12.00</td><td class="r2e">0.28</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289307" >wrjxm</a></td><td class="r1o">1794</td><td class="r1o">546</td><td class="r1o">$111.65</td><td class="r2o">17.02</td><td class="r2o">0.79</td><td class="r2o">0.01</td><td class="r2o">0.11</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=15056181" >vlad89</a></td><td class="r1e">1787</td><td class="r1e">404</td><td class="r1e">$61.27</td><td class="r2e">9.61</td><td class="r2e">0.15</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>

<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="4">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>

<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11936978" >bruin</a></td><td class="r1o">1765</td><td class="r1o">534</td><td class="r1o">$99.06</td><td class="r2o">15.18</td><td class="r2o">0.59</td><td class="r2o">0.00</td><td class="r2o">0.08</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7583175" >Windrider</a></td><td class="r1e">1746</td><td class="r1e">442</td><td class="r1e">$63.85</td><td class="r2e">9.97</td><td class="r2e">0.18</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=160388" >ubergeek</a></td><td class="r1o">1710</td><td class="r1o">316</td><td class="r1o">$18.01</td><td class="r2o">2.85</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r2o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9971384" >smell</a></td><td class="r1e">1655</td><td class="r1e">436</td><td class="r1e">$41.76</td><td class="r2e">6.56</td><td class="r2e">0.06</td><td class="r2e">0.00</td><td class="r2e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
