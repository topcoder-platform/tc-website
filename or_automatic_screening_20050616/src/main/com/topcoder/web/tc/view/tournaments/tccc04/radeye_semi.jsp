<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
</head>

<body>
<jsp:include page="tccc04Head.jsp" />

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>radeye's odds</h2></td>
            <td align="right" class="bodyText">
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
               predict your chances to advance in the 2004 TopCoder Collegiate Challenge based only on
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
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="3">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="ccrt1o" align="right">3472</td>
<td class="ccrt1o" align="right">327</td>
<td class="ccrt1o" align="right">$16 820.32</td>
<td class="ccrt2o" align="right">29.72</td>
<td class="ccrt2o" align="right">20.24</td>
<td class="ccrt2o" align="right">87.58</td>
<td class="ccrt3o" align="right">1.76</td>
<td class="ccrt3o" align="right">6.91</td>
<td class="ccrt3o" align="right">20.12</td>
<td class="ccrt3o" align="right">58.79</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260835">reid</a></td>
<td class="ccrt1e" align="right">3061</td>
<td class="ccrt1e" align="right">383</td>
<td class="ccrt1e" align="right">$5 015.44</td>
<td class="ccrt2e" align="right">36.18</td>
<td class="ccrt2e" align="right">10.07</td>
<td class="ccrt2e" align="right">55.63</td>
<td class="ccrt3e" align="right">11.27</td>
<td class="ccrt3e" align="right">16.74</td>
<td class="ccrt3e" align="right">17.42</td>
<td class="ccrt3e" align="right">10.21</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="ccrt1o" align="right">3114</td>
<td class="ccrt1o" align="right">347</td>
<td class="ccrt1o" align="right">$5 655.28</td>
<td class="ccrt2o" align="right">43.00</td>
<td class="ccrt2o" align="right">14.05</td>
<td class="ccrt2o" align="right">57.56</td>
<td class="ccrt3o" align="right">8.57</td>
<td class="ccrt3o" align="right">16.39</td>
<td class="ccrt3o" align="right">20.75</td>
<td class="ccrt3o" align="right">11.84</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=152347">ZorbaTHut</a></td>
<td class="ccrt1e" align="right">3020</td>
<td class="ccrt1e" align="right">236</td>
<td class="ccrt1e" align="right">$2 946.92</td>
<td class="ccrt2e" align="right">60.51</td>
<td class="ccrt2e" align="right">13.23</td>
<td class="ccrt2e" align="right">39.19</td>
<td class="ccrt3e" align="right">7.08</td>
<td class="ccrt3e" align="right">14.54</td>
<td class="ccrt3e" align="right">13.56</td>
<td class="ccrt3e" align="right">4.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=311170">bladerunner</a></td>
<td class="ccrt1o" align="right">2861</td>
<td class="ccrt1o" align="right">255</td>
<td class="ccrt1o" align="right">$1 216.50</td>
<td class="ccrt2o" align="right">53.18</td>
<td class="ccrt2o" align="right">5.34</td>
<td class="ccrt2o" align="right">22.12</td>
<td class="ccrt3o" align="right">7.32</td>
<td class="ccrt3o" align="right">8.70</td>
<td class="ccrt3o" align="right">5.02</td>
<td class="ccrt3o" align="right">1.08</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287496">bstanescu</a></td>
<td class="ccrt1e" align="right">2935</td>
<td class="ccrt1e" align="right">554</td>
<td class="ccrt1e" align="right">$2 520.59</td>
<td class="ccrt2e" align="right">41.40</td>
<td class="ccrt2e" align="right">11.72</td>
<td class="ccrt2e" align="right">29.12</td>
<td class="ccrt3e" align="right">9.35</td>
<td class="ccrt3e" align="right">7.40</td>
<td class="ccrt3e" align="right">6.60</td>
<td class="ccrt3e" align="right">5.78</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="ccrt1o" align="right">2782</td>
<td class="ccrt1o" align="right">302</td>
<td class="ccrt1o" align="right">$354.70</td>
<td class="ccrt2o" align="right">41.50</td>
<td class="ccrt2o" align="right">3.78</td>
<td class="ccrt2o" align="right">6.65</td>
<td class="ccrt3o" align="right">2.60</td>
<td class="ccrt3o" align="right">2.37</td>
<td class="ccrt3o" align="right">1.32</td>
<td class="ccrt3o" align="right">0.36</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="ccrt1e" align="right">2604</td>
<td class="ccrt1e" align="right">255</td>
<td class="ccrt1e" align="right">$144.69</td>
<td class="ccrt2e" align="right">27.13</td>
<td class="ccrt2e" align="right">0.61</td>
<td class="ccrt2e" align="right">4.01</td>
<td class="ccrt3e" align="right">2.22</td>
<td class="ccrt3e" align="right">1.35</td>
<td class="ccrt3e" align="right">0.40</td>
<td class="ccrt3e" align="right">0.04</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=2058672">dary</a></td>
<td class="ccrt1o" align="right">2537</td>
<td class="ccrt1o" align="right">302</td>
<td class="ccrt1o" align="right">$93.82</td>
<td class="ccrt2o" align="right">21.96</td>
<td class="ccrt2o" align="right">0.53</td>
<td class="ccrt2o" align="right">2.63</td>
<td class="ccrt3o" align="right">1.53</td>
<td class="ccrt3o" align="right">0.81</td>
<td class="ccrt3o" align="right">0.26</td>
<td class="ccrt3o" align="right">0.03</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287568">tjq</a></td>
<td class="ccrt1e" align="right">2454</td>
<td class="ccrt1e" align="right">349</td>
<td class="ccrt1e" align="right">$82.76</td>
<td class="ccrt2e" align="right">17.18</td>
<td class="ccrt2e" align="right">0.40</td>
<td class="ccrt2e" align="right">2.43</td>
<td class="ccrt3e" align="right">1.54</td>
<td class="ccrt3e" align="right">0.66</td>
<td class="ccrt3e" align="right">0.20</td>
<td class="ccrt3e" align="right">0.03</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="ccrt1o" align="right">2596</td>
<td class="ccrt1o" align="right">355</td>
<td class="ccrt1o" align="right">$324.54</td>
<td class="ccrt2o" align="right">27.38</td>
<td class="ccrt2o" align="right">1.26</td>
<td class="ccrt2o" align="right">8.06</td>
<td class="ccrt3o" align="right">4.40</td>
<td class="ccrt3o" align="right">2.49</td>
<td class="ccrt3o" align="right">0.97</td>
<td class="ccrt3o" align="right">0.20</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="ccrt1e" align="right">2573</td>
<td class="ccrt1e" align="right">381</td>
<td class="ccrt1e" align="right">$126.52</td>
<td class="ccrt2e" align="right">22.67</td>
<td class="ccrt2e" align="right">1.23</td>
<td class="ccrt2e" align="right">2.96</td>
<td class="ccrt3e" align="right">1.61</td>
<td class="ccrt3e" align="right">0.87</td>
<td class="ccrt3e" align="right">0.38</td>
<td class="ccrt3e" align="right">0.10</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287105">lars</a></td>
<td class="ccrt1o" align="right">2747</td>
<td class="ccrt1o" align="right">501</td>
<td class="ccrt1o" align="right">$880.95</td>
<td class="ccrt2o" align="right">35.36</td>
<td class="ccrt2o" align="right">5.55</td>
<td class="ccrt2o" align="right">13.67</td>
<td class="ccrt3o" align="right">5.77</td>
<td class="ccrt3o" align="right">3.77</td>
<td class="ccrt3o" align="right">2.60</td>
<td class="ccrt3o" align="right">1.52</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=275071">antimatter</a></td>
<td class="ccrt1e" align="right">2714</td>
<td class="ccrt1e" align="right">606</td>
<td class="ccrt1e" align="right">$1 770.03</td>
<td class="ccrt2e" align="right">25.78</td>
<td class="ccrt2e" align="right">4.37</td>
<td class="ccrt2e" align="right">27.46</td>
<td class="ccrt3e" align="right">12.73</td>
<td class="ccrt3e" align="right">6.74</td>
<td class="ccrt3e" align="right">4.69</td>
<td class="ccrt3e" align="right">3.29</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=261024">grotmol</a></td>
<td class="ccrt1o" align="right">2614</td>
<td class="ccrt1o" align="right">582</td>
<td class="ccrt1o" align="right">$997.92</td>
<td class="ccrt2o" align="right">26.10</td>
<td class="ccrt2o" align="right">3.34</td>
<td class="ccrt2o" align="right">17.77</td>
<td class="ccrt3o" align="right">8.99</td>
<td class="ccrt3o" align="right">4.41</td>
<td class="ccrt3o" align="right">2.82</td>
<td class="ccrt3o" align="right">1.55</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="ccrt1e" align="right">2617</td>
<td class="ccrt1e" align="right">517</td>
<td class="ccrt1e" align="right">$777.79</td>
<td class="ccrt2e" align="right">27.63</td>
<td class="ccrt2e" align="right">2.97</td>
<td class="ccrt2e" align="right">14.85</td>
<td class="ccrt3e" align="right">7.51</td>
<td class="ccrt3e" align="right">3.96</td>
<td class="ccrt3e" align="right">2.35</td>
<td class="ccrt3e" align="right">1.03</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="3">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=284007">Ryan</a></td>
<td class="ccrt1o" align="right">2482</td>
<td class="ccrt1o" align="right">310</td>
<td class="ccrt1o" align="right">$93.75</td>
<td class="ccrt2o" align="right">17.67</td>
<td class="ccrt2o" align="right">0.31</td>
<td class="ccrt2o" align="right">2.85</td>
<td class="ccrt3o" align="right">1.81</td>
<td class="ccrt3o" align="right">0.80</td>
<td class="ccrt3o" align="right">0.21</td>
<td class="ccrt3o" align="right">0.03</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=304031">Ruberik</a></td>
<td class="ccrt1e" align="right">2407</td>
<td class="ccrt1e" align="right">397</td>
<td class="ccrt1e" align="right">$40.72</td>
<td class="ccrt2e" align="right">13.12</td>
<td class="ccrt2e" align="right">0.37</td>
<td class="ccrt2e" align="right">1.16</td>
<td class="ccrt3e" align="right">0.76</td>
<td class="ccrt3e" align="right">0.29</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="ccrt1o" align="right">2274</td>
<td class="ccrt1o" align="right">282</td>
<td class="ccrt1o" align="right">$1.33</td>
<td class="ccrt2o" align="right">3.52</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt3o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308657">skanthak</a></td>
<td class="ccrt1e" align="right">2245</td>
<td class="ccrt1e" align="right">338</td>
<td class="ccrt1e" align="right">$20.26</td>
<td class="ccrt2e" align="right">6.54</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.76</td>
<td class="ccrt3e" align="right">0.59</td>
<td class="ccrt3e" align="right">0.15</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7512490">petko</a></td>
<td class="ccrt1o" align="right">2133</td>
<td class="ccrt1o" align="right">299</td>
<td class="ccrt1o" align="right">$1.85</td>
<td class="ccrt2o" align="right">2.54</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251832">dark_lord</a></td>
<td class="ccrt1e" align="right">2055</td>
<td class="ccrt1e" align="right">276</td>
<td class="ccrt1e" align="right">$0.38</td>
<td class="ccrt2e" align="right">1.09</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=346607">kalmakka</a></td>
<td class="ccrt1o" align="right">2112</td>
<td class="ccrt1o" align="right">438</td>
<td class="ccrt1o" align="right">$30.49</td>
<td class="ccrt2o" align="right">6.14</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">1.16</td>
<td class="ccrt3o" align="right">0.93</td>
<td class="ccrt3o" align="right">0.18</td>
<td class="ccrt3o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="ccrt1e" align="right">2279</td>
<td class="ccrt1e" align="right">542</td>
<td class="ccrt1e" align="right">$82.46</td>
<td class="ccrt2e" align="right">12.71</td>
<td class="ccrt2e" align="right">0.54</td>
<td class="ccrt2e" align="right">2.24</td>
<td class="ccrt3e" align="right">1.54</td>
<td class="ccrt3e" align="right">0.45</td>
<td class="ccrt3e" align="right">0.18</td>
<td class="ccrt3e" align="right">0.07</td></tr>
</table>

<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
