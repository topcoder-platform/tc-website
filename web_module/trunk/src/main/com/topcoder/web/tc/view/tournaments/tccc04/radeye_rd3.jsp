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
               <jsp:param name="selectedRound" value="round3"/>
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
               By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=144400">tomek</a></td>
<td class="ccrt1o" align="right">3547</td>
<td class="ccrt1o" align="right">228</td>
<td class="ccrt1o" align="right">$19,732.72</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">11.54</td>
<td class="ccrt2o" align="right">8.83</td>
<td class="ccrt2o" align="right">97.08</td>
<td class="ccrt3o" align="right">0.63</td>
<td class="ccrt3o" align="right">4.78</td>
<td class="ccrt3o" align="right">21.17</td>
<td class="ccrt3o" align="right">70.49</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td class="ccrt1e" align="right">3179</td>
<td class="ccrt1e" align="right">290</td>
<td class="ccrt1e" align="right">$5,908.54</td>
<td class="ccrt2e" align="right">99.99</td>
<td class="ccrt2e" align="right">99.75</td>
<td class="ccrt2e" align="right">39.72</td>
<td class="ccrt2e" align="right">15.95</td>
<td class="ccrt2e" align="right">69.12</td>
<td class="ccrt3e" align="right">9.63</td>
<td class="ccrt3e" align="right">23.04</td>
<td class="ccrt3e" align="right">26.98</td>
<td class="ccrt3e" align="right">9.46</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=270505">John Dethridge</a></td>
<td class="ccrt1o" align="right">3156</td>
<td class="ccrt1o" align="right">411</td>
<td class="ccrt1o" align="right">$5,620.26</td>
<td class="ccrt2o" align="right">99.61</td>
<td class="ccrt2o" align="right">97.16</td>
<td class="ccrt2o" align="right">36.33</td>
<td class="ccrt2o" align="right">15.10</td>
<td class="ccrt2o" align="right">61.90</td>
<td class="ccrt3o" align="right">12.72</td>
<td class="ccrt3o" align="right">18.28</td>
<td class="ccrt3o" align="right">19.31</td>
<td class="ccrt3o" align="right">11.59</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152347">ZorbaTHut</a></td>
<td class="ccrt1e" align="right">3080</td>
<td class="ccrt1e" align="right">265</td>
<td class="ccrt1e" align="right">$3,428.01</td>
<td class="ccrt2e" align="right">99.99</td>
<td class="ccrt2e" align="right">99.65</td>
<td class="ccrt2e" align="right">55.31</td>
<td class="ccrt2e" align="right">17.85</td>
<td class="ccrt2e" align="right">51.60</td>
<td class="ccrt3e" align="right">11.31</td>
<td class="ccrt3e" align="right">20.27</td>
<td class="ccrt3e" align="right">16.35</td>
<td class="ccrt3e" align="right">3.68</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262056">mathijs</a></td>
<td class="ccrt1o" align="right">2843</td>
<td class="ccrt1o" align="right">429</td>
<td class="ccrt1o" align="right">$1,187.53</td>
<td class="ccrt2o" align="right">96.64</td>
<td class="ccrt2o" align="right">84.78</td>
<td class="ccrt2o" align="right">36.36</td>
<td class="ccrt2o" align="right">6.71</td>
<td class="ccrt2o" align="right">22.55</td>
<td class="ccrt3o" align="right">10.39</td>
<td class="ccrt3o" align="right">6.75</td>
<td class="ccrt3o" align="right">4.02</td>
<td class="ccrt3o" align="right">1.39</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=311170">bladerunner</a></td>
<td class="ccrt1e" align="right">2871</td>
<td class="ccrt1e" align="right">284</td>
<td class="ccrt1e" align="right">$578.61</td>
<td class="ccrt2e" align="right">99.77</td>
<td class="ccrt2e" align="right">96.36</td>
<td class="ccrt2e" align="right">58.68</td>
<td class="ccrt2e" align="right">7.87</td>
<td class="ccrt2e" align="right">12.70</td>
<td class="ccrt3e" align="right">5.50</td>
<td class="ccrt3e" align="right">4.64</td>
<td class="ccrt3e" align="right">2.23</td>
<td class="ccrt3e" align="right">0.33</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262936">dgarthur</a></td>
<td class="ccrt1o" align="right">2835</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$492.16</td>
<td class="ccrt2o" align="right">98.85</td>
<td class="ccrt2o" align="right">91.34</td>
<td class="ccrt2o" align="right">50.73</td>
<td class="ccrt2o" align="right">7.05</td>
<td class="ccrt2o" align="right">10.44</td>
<td class="ccrt3o" align="right">4.78</td>
<td class="ccrt3o" align="right">3.50</td>
<td class="ccrt3o" align="right">1.78</td>
<td class="ccrt3o" align="right">0.39</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287496">bstanescu</a></td>
<td class="ccrt1e" align="right">2793</td>
<td class="ccrt1e" align="right">535</td>
<td class="ccrt1e" align="right">$1,008.20</td>
<td class="ccrt2e" align="right">91.57</td>
<td class="ccrt2e" align="right">73.21</td>
<td class="ccrt2e" align="right">27.84</td>
<td class="ccrt2e" align="right">5.55</td>
<td class="ccrt2e" align="right">17.72</td>
<td class="ccrt3e" align="right">8.69</td>
<td class="ccrt3e" align="right">4.55</td>
<td class="ccrt3e" align="right">2.93</td>
<td class="ccrt3e" align="right">1.56</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8355516">Eryx</a></td>
<td class="ccrt1o" align="right">2768</td>
<td class="ccrt1o" align="right">344</td>
<td class="ccrt1o" align="right">$517.36</td>
<td class="ccrt2o" align="right">98.01</td>
<td class="ccrt2o" align="right">87.17</td>
<td class="ccrt2o" align="right">38.14</td>
<td class="ccrt2o" align="right">4.10</td>
<td class="ccrt2o" align="right">12.32</td>
<td class="ccrt3o" align="right">6.21</td>
<td class="ccrt3o" align="right">4.05</td>
<td class="ccrt3o" align="right">1.76</td>
<td class="ccrt3o" align="right">0.29</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="ccrt1e" align="right">2577</td>
<td class="ccrt1e" align="right">297</td>
<td class="ccrt1e" align="right">$79.29</td>
<td class="ccrt2e" align="right">95.90</td>
<td class="ccrt2e" align="right">74.89</td>
<td class="ccrt2e" align="right">20.02</td>
<td class="ccrt2e" align="right">0.65</td>
<td class="ccrt2e" align="right">2.54</td>
<td class="ccrt3e" align="right">1.64</td>
<td class="ccrt3e" align="right">0.71</td>
<td class="ccrt3e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=2058672">dary</a></td>
<td class="ccrt1o" align="right">2598</td>
<td class="ccrt1o" align="right">347</td>
<td class="ccrt1o" align="right">$139.83</td>
<td class="ccrt2o" align="right">93.98</td>
<td class="ccrt2o" align="right">72.01</td>
<td class="ccrt2o" align="right">21.28</td>
<td class="ccrt2o" align="right">1.09</td>
<td class="ccrt2o" align="right">4.19</td>
<td class="ccrt3o" align="right">2.64</td>
<td class="ccrt3o" align="right">1.16</td>
<td class="ccrt3o" align="right">0.35</td>
<td class="ccrt3o" align="right">0.04</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287568">tjq</a></td>
<td class="ccrt1e" align="right">2574</td>
<td class="ccrt1e" align="right">453</td>
<td class="ccrt1e" align="right">$191.55</td>
<td class="ccrt2e" align="right">87.32</td>
<td class="ccrt2e" align="right">60.52</td>
<td class="ccrt2e" align="right">16.54</td>
<td class="ccrt2e" align="right">1.34</td>
<td class="ccrt2e" align="right">5.11</td>
<td class="ccrt3e" align="right">3.20</td>
<td class="ccrt3e" align="right">1.27</td>
<td class="ccrt3e" align="right">0.51</td>
<td class="ccrt3e" align="right">0.12</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=345049">aneubeck</a></td>
<td class="ccrt1o" align="right">2499</td>
<td class="ccrt1o" align="right">371</td>
<td class="ccrt1o" align="right">$51.53</td>
<td class="ccrt2o" align="right">88.28</td>
<td class="ccrt2o" align="right">58.26</td>
<td class="ccrt2o" align="right">12.80</td>
<td class="ccrt2o" align="right">0.48</td>
<td class="ccrt2o" align="right">1.69</td>
<td class="ccrt3o" align="right">1.17</td>
<td class="ccrt3o" align="right">0.40</td>
<td class="ccrt3o" align="right">0.11</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307060">AdrianKuegel</a></td>
<td class="ccrt1e" align="right">2447</td>
<td class="ccrt1e" align="right">348</td>
<td class="ccrt1e" align="right">$21.71</td>
<td class="ccrt2e" align="right">86.81</td>
<td class="ccrt2e" align="right">53.29</td>
<td class="ccrt2e" align="right">9.43</td>
<td class="ccrt2e" align="right">0.23</td>
<td class="ccrt2e" align="right">0.76</td>
<td class="ccrt3e" align="right">0.56</td>
<td class="ccrt3e" align="right">0.16</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287105">lars</a></td>
<td class="ccrt1o" align="right">2538</td>
<td class="ccrt1o" align="right">442</td>
<td class="ccrt1o" align="right">$105.56</td>
<td class="ccrt2o" align="right">86.17</td>
<td class="ccrt2o" align="right">57.60</td>
<td class="ccrt2o" align="right">14.65</td>
<td class="ccrt2o" align="right">0.99</td>
<td class="ccrt2o" align="right">2.98</td>
<td class="ccrt3o" align="right">1.94</td>
<td class="ccrt3o" align="right">0.72</td>
<td class="ccrt3o" align="right">0.27</td>
<td class="ccrt3o" align="right">0.06</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7428266">Klinck</a></td>
<td class="ccrt1e" align="right">2505</td>
<td class="ccrt1e" align="right">365</td>
<td class="ccrt1e" align="right">$46.56</td>
<td class="ccrt2e" align="right">88.97</td>
<td class="ccrt2e" align="right">59.46</td>
<td class="ccrt2e" align="right">12.92</td>
<td class="ccrt2e" align="right">0.48</td>
<td class="ccrt2e" align="right">1.51</td>
<td class="ccrt3e" align="right">1.05</td>
<td class="ccrt3e" align="right">0.36</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=153902">evd</a></td>
<td class="ccrt1o" align="right">2455</td>
<td class="ccrt1o" align="right">314</td>
<td class="ccrt1o" align="right">$18.70</td>
<td class="ccrt2o" align="right">89.63</td>
<td class="ccrt2o" align="right">56.91</td>
<td class="ccrt2o" align="right">9.64</td>
<td class="ccrt2o" align="right">0.18</td>
<td class="ccrt2o" align="right">0.67</td>
<td class="ccrt3o" align="right">0.50</td>
<td class="ccrt3o" align="right">0.15</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=113178">po</a></td>
<td class="ccrt1e" align="right">2422</td>
<td class="ccrt1e" align="right">210</td>
<td class="ccrt1e" align="right">$2.65</td>
<td class="ccrt2e" align="right">95.59</td>
<td class="ccrt2e" align="right">61.03</td>
<td class="ccrt2e" align="right">6.02</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.08</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7311097">m00tz</a></td>
<td class="ccrt1o" align="right">2441</td>
<td class="ccrt1o" align="right">377</td>
<td class="ccrt1o" align="right">$37.96</td>
<td class="ccrt2o" align="right">84.55</td>
<td class="ccrt2o" align="right">50.65</td>
<td class="ccrt2o" align="right">9.27</td>
<td class="ccrt2o" align="right">0.27</td>
<td class="ccrt2o" align="right">1.29</td>
<td class="ccrt3o" align="right">0.93</td>
<td class="ccrt3o" align="right">0.29</td>
<td class="ccrt3o" align="right">0.07</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260987">dangelo</a></td>
<td class="ccrt1e" align="right">2445</td>
<td class="ccrt1e" align="right">338</td>
<td class="ccrt1e" align="right">$27.77</td>
<td class="ccrt2e" align="right">87.38</td>
<td class="ccrt2e" align="right">53.72</td>
<td class="ccrt2e" align="right">9.20</td>
<td class="ccrt2e" align="right">0.20</td>
<td class="ccrt2e" align="right">0.98</td>
<td class="ccrt3e" align="right">0.71</td>
<td class="ccrt3e" align="right">0.22</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=264869">ante</a></td>
<td class="ccrt1o" align="right">2372</td>
<td class="ccrt1o" align="right">433</td>
<td class="ccrt1o" align="right">$34.48</td>
<td class="ccrt2o" align="right">76.63</td>
<td class="ccrt2o" align="right">40.07</td>
<td class="ccrt2o" align="right">6.51</td>
<td class="ccrt2o" align="right">0.21</td>
<td class="ccrt2o" align="right">1.17</td>
<td class="ccrt3o" align="right">0.86</td>
<td class="ccrt3o" align="right">0.24</td>
<td class="ccrt3o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310430">gepa</a></td>
<td class="ccrt1e" align="right">2315</td>
<td class="ccrt1e" align="right">404</td>
<td class="ccrt1e" align="right">$14.92</td>
<td class="ccrt2e" align="right">73.81</td>
<td class="ccrt2e" align="right">34.52</td>
<td class="ccrt2e" align="right">4.44</td>
<td class="ccrt2e" align="right">0.09</td>
<td class="ccrt2e" align="right">0.55</td>
<td class="ccrt3e" align="right">0.43</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308953">Mike Mirzayanov</a></td>
<td class="ccrt1o" align="right">2398</td>
<td class="ccrt1o" align="right">431</td>
<td class="ccrt1o" align="right">$39.98</td>
<td class="ccrt2o" align="right">78.55</td>
<td class="ccrt2o" align="right">43.00</td>
<td class="ccrt2o" align="right">7.42</td>
<td class="ccrt2o" align="right">0.27</td>
<td class="ccrt2o" align="right">1.34</td>
<td class="ccrt3o" align="right">0.97</td>
<td class="ccrt3o" align="right">0.28</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td class="ccrt1e" align="right">2533</td>
<td class="ccrt1e" align="right">597</td>
<td class="ccrt1e" align="right">$257.85</td>
<td class="ccrt2e" align="right">78.76</td>
<td class="ccrt2e" align="right">49.07</td>
<td class="ccrt2e" align="right">11.84</td>
<td class="ccrt2e" align="right">1.39</td>
<td class="ccrt2e" align="right">5.88</td>
<td class="ccrt3e" align="right">3.66</td>
<td class="ccrt3e" align="right">1.27</td>
<td class="ccrt3e" align="right">0.65</td>
<td class="ccrt3e" align="right">0.30</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=261024">grotmol</a></td>
<td class="ccrt1o" align="right">2511</td>
<td class="ccrt1o" align="right">498</td>
<td class="ccrt1o" align="right">$137.93</td>
<td class="ccrt2o" align="right">81.93</td>
<td class="ccrt2o" align="right">51.61</td>
<td class="ccrt2o" align="right">12.21</td>
<td class="ccrt2o" align="right">0.97</td>
<td class="ccrt2o" align="right">3.72</td>
<td class="ccrt3o" align="right">2.42</td>
<td class="ccrt3o" align="right">0.85</td>
<td class="ccrt3o" align="right">0.35</td>
<td class="ccrt3o" align="right">0.10</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287979">Oblok</a></td>
<td class="ccrt1e" align="right">2169</td>
<td class="ccrt1e" align="right">284</td>
<td class="ccrt1e" align="right">$0.22</td>
<td class="ccrt2e" align="right">65.17</td>
<td class="ccrt2e" align="right">17.44</td>
<td class="ccrt2e" align="right">0.59</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471">haha</a></td>
<td class="ccrt1o" align="right">2504</td>
<td class="ccrt1o" align="right">474</td>
<td class="ccrt1o" align="right">$109.30</td>
<td class="ccrt2o" align="right">82.73</td>
<td class="ccrt2o" align="right">52.14</td>
<td class="ccrt2o" align="right">12.25</td>
<td class="ccrt2o" align="right">0.85</td>
<td class="ccrt2o" align="right">3.06</td>
<td class="ccrt3o" align="right">2.02</td>
<td class="ccrt3o" align="right">0.71</td>
<td class="ccrt3o" align="right">0.27</td>
<td class="ccrt3o" align="right">0.07</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=276749">jonderry</a></td>
<td class="ccrt1e" align="right">2175</td>
<td class="ccrt1e" align="right">250</td>
<td class="ccrt1e" align="right">$0.07</td>
<td class="ccrt2e" align="right">67.90</td>
<td class="ccrt2e" align="right">16.95</td>
<td class="ccrt2e" align="right">0.42</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287266">jms137</a></td>
<td class="ccrt1o" align="right">2376</td>
<td class="ccrt1o" align="right">383</td>
<td class="ccrt1o" align="right">$16.67</td>
<td class="ccrt2o" align="right">79.73</td>
<td class="ccrt2o" align="right">42.26</td>
<td class="ccrt2o" align="right">6.22</td>
<td class="ccrt2o" align="right">0.14</td>
<td class="ccrt2o" align="right">0.60</td>
<td class="ccrt3o" align="right">0.46</td>
<td class="ccrt3o" align="right">0.12</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=263396">Abednego</a></td>
<td class="ccrt1e" align="right">2368</td>
<td class="ccrt1e" align="right">512</td>
<td class="ccrt1e" align="right">$49.54</td>
<td class="ccrt2e" align="right">72.83</td>
<td class="ccrt2e" align="right">37.57</td>
<td class="ccrt2e" align="right">6.75</td>
<td class="ccrt2e" align="right">0.35</td>
<td class="ccrt2e" align="right">1.54</td>
<td class="ccrt3e" align="right">1.11</td>
<td class="ccrt3e" align="right">0.30</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=284007">Ryan</a></td>
<td class="ccrt1o" align="right">2288</td>
<td class="ccrt1o" align="right">259</td>
<td class="ccrt1o" align="right">$0.82</td>
<td class="ccrt2o" align="right">81.15</td>
<td class="ccrt2o" align="right">33.38</td>
<td class="ccrt2o" align="right">1.87</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=304031">Ruberik</a></td>
<td class="ccrt1e" align="right">2217</td>
<td class="ccrt1e" align="right">400</td>
<td class="ccrt1e" align="right">$4.18</td>
<td class="ccrt2e" align="right">65.44</td>
<td class="ccrt2e" align="right">24.33</td>
<td class="ccrt2e" align="right">2.13</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.14</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308453">overwise</a></td>
<td class="ccrt1o" align="right">2333</td>
<td class="ccrt1o" align="right">516</td>
<td class="ccrt1o" align="right">$41.84</td>
<td class="ccrt2o" align="right">70.35</td>
<td class="ccrt2o" align="right">34.35</td>
<td class="ccrt2o" align="right">5.62</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">1.34</td>
<td class="ccrt3o" align="right">0.99</td>
<td class="ccrt3o" align="right">0.25</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.02</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7462740">ploh</a></td>
<td class="ccrt1e" align="right">2302</td>
<td class="ccrt1e" align="right">282</td>
<td class="ccrt1e" align="right">$1.87</td>
<td class="ccrt2e" align="right">80.58</td>
<td class="ccrt2e" align="right">35.24</td>
<td class="ccrt2e" align="right">2.46</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.08</td>
<td class="ccrt3e" align="right">0.06</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td class="ccrt1o" align="right">2059</td>
<td class="ccrt1o" align="right">282</td>
<td class="ccrt1o" align="right">$0.04</td>
<td class="ccrt2o" align="right">50.07</td>
<td class="ccrt2o" align="right">7.89</td>
<td class="ccrt2o" align="right">0.12</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7502813">monsoon</a></td>
<td class="ccrt1e" align="right">2286</td>
<td class="ccrt1e" align="right">377</td>
<td class="ccrt1e" align="right">$7.65</td>
<td class="ccrt2e" align="right">72.76</td>
<td class="ccrt2e" align="right">31.66</td>
<td class="ccrt2e" align="right">3.22</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.30</td>
<td class="ccrt3e" align="right">0.24</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7210680">cnettel</a></td>
<td class="ccrt1o" align="right">2163</td>
<td class="ccrt1o" align="right">346</td>
<td class="ccrt1o" align="right">$1.07</td>
<td class="ccrt2o" align="right">61.89</td>
<td class="ccrt2o" align="right">18.44</td>
<td class="ccrt2o" align="right">0.93</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt3o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7281980">eldering</a></td>
<td class="ccrt1e" align="right">2103</td>
<td class="ccrt1e" align="right">286</td>
<td class="ccrt1e" align="right">$0.09</td>
<td class="ccrt2e" align="right">56.16</td>
<td class="ccrt2e" align="right">11.20</td>
<td class="ccrt2e" align="right">0.24</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289706">mickle</a></td>
<td class="ccrt1o" align="right">2091</td>
<td class="ccrt1o" align="right">313</td>
<td class="ccrt1o" align="right">$0.17</td>
<td class="ccrt2o" align="right">54.14</td>
<td class="ccrt2o" align="right">11.31</td>
<td class="ccrt2o" align="right">0.29</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8398526">Tomy</a></td>
<td class="ccrt1e" align="right">1990</td>
<td class="ccrt1e" align="right">261</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">39.64</td>
<td class="ccrt2e" align="right">3.62</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7421158">Per</a></td>
<td class="ccrt1o" align="right">2347</td>
<td class="ccrt1o" align="right">507</td>
<td class="ccrt1o" align="right">$49.40</td>
<td class="ccrt2o" align="right">71.62</td>
<td class="ccrt2o" align="right">35.80</td>
<td class="ccrt2o" align="right">5.69</td>
<td class="ccrt2o" align="right">0.27</td>
<td class="ccrt2o" align="right">1.58</td>
<td class="ccrt3o" align="right">1.16</td>
<td class="ccrt3o" align="right">0.30</td>
<td class="ccrt3o" align="right">0.10</td>
<td class="ccrt3o" align="right">0.02</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308657">skanthak</a></td>
<td class="ccrt1e" align="right">2170</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$2.45</td>
<td class="ccrt2e" align="right">61.45</td>
<td class="ccrt2e" align="right">19.80</td>
<td class="ccrt2e" align="right">1.27</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283388">Minsk</a></td>
<td class="ccrt1o" align="right">2090</td>
<td class="ccrt1o" align="right">413</td>
<td class="ccrt1o" align="right">$1.50</td>
<td class="ccrt2o" align="right">53.04</td>
<td class="ccrt2o" align="right">14.14</td>
<td class="ccrt2o" align="right">0.75</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263379">StefanPochmann</a></td>
<td class="ccrt1e" align="right">2031</td>
<td class="ccrt1e" align="right">432</td>
<td class="ccrt1e" align="right">$1.03</td>
<td class="ccrt2e" align="right">47.45</td>
<td class="ccrt2e" align="right">11.00</td>
<td class="ccrt2e" align="right">0.51</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296745">pzhao</a></td>
<td class="ccrt1o" align="right">2024</td>
<td class="ccrt1o" align="right">364</td>
<td class="ccrt1o" align="right">$0.24</td>
<td class="ccrt2o" align="right">46.21</td>
<td class="ccrt2o" align="right">8.71</td>
<td class="ccrt2o" align="right">0.24</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307070">qsort</a></td>
<td class="ccrt1e" align="right">2087</td>
<td class="ccrt1e" align="right">365</td>
<td class="ccrt1e" align="right">$0.58</td>
<td class="ccrt2e" align="right">53.13</td>
<td class="ccrt2e" align="right">12.67</td>
<td class="ccrt2e" align="right">0.48</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=111202">ColinMacLeod</a></td>
<td class="ccrt1o" align="right">2124</td>
<td class="ccrt1o" align="right">443</td>
<td class="ccrt1o" align="right">$3.38</td>
<td class="ccrt2o" align="right">55.89</td>
<td class="ccrt2o" align="right">17.13</td>
<td class="ccrt2o" align="right">1.19</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.14</td>
<td class="ccrt3o" align="right">0.12</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
<td class="ccrt1e" align="right">1959</td>
<td class="ccrt1e" align="right">364</td>
<td class="ccrt1e" align="right">$0.09</td>
<td class="ccrt2e" align="right">39.21</td>
<td class="ccrt2e" align="right">5.68</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7512490">petko</a></td>
<td class="ccrt1o" align="right">2060</td>
<td class="ccrt1o" align="right">345</td>
<td class="ccrt1o" align="right">$0.24</td>
<td class="ccrt2o" align="right">50.17</td>
<td class="ccrt2o" align="right">10.24</td>
<td class="ccrt2o" align="right">0.29</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058469">robymus</a></td>
<td class="ccrt1e" align="right">2029</td>
<td class="ccrt1e" align="right">351</td>
<td class="ccrt1e" align="right">$0.18</td>
<td class="ccrt2e" align="right">46.67</td>
<td class="ccrt2e" align="right">8.58</td>
<td class="ccrt2e" align="right">0.21</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7358573">Kavan</a></td>
<td class="ccrt1o" align="right">2147</td>
<td class="ccrt1o" align="right">333</td>
<td class="ccrt1o" align="right">$0.62</td>
<td class="ccrt2o" align="right">60.50</td>
<td class="ccrt2o" align="right">16.61</td>
<td class="ccrt2o" align="right">0.69</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274018">Alexandre</a></td>
<td class="ccrt1e" align="right">2050</td>
<td class="ccrt1e" align="right">322</td>
<td class="ccrt1e" align="right">$0.11</td>
<td class="ccrt2e" align="right">48.91</td>
<td class="ccrt2e" align="right">8.82</td>
<td class="ccrt2e" align="right">0.19</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269058">jasonw</a></td>
<td class="ccrt1o" align="right">1995</td>
<td class="ccrt1o" align="right">327</td>
<td class="ccrt1o" align="right">$0.05</td>
<td class="ccrt2o" align="right">42.29</td>
<td class="ccrt2o" align="right">6.07</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260828">Larry</a></td>
<td class="ccrt1e" align="right">2030</td>
<td class="ccrt1e" align="right">332</td>
<td class="ccrt1e" align="right">$0.10</td>
<td class="ccrt2e" align="right">46.58</td>
<td class="ccrt2e" align="right">8.01</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
<td class="ccrt1o" align="right">1911</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">33.20</td>
<td class="ccrt2o" align="right">3.41</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307169">Fluff</a></td>
<td class="ccrt1e" align="right">1901</td>
<td class="ccrt1e" align="right">346</td>
<td class="ccrt1e" align="right">$0.02</td>
<td class="ccrt2e" align="right">32.39</td>
<td class="ccrt2e" align="right">3.28</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273112">WhiteShadow</a></td>
<td class="ccrt1o" align="right">1775</td>
<td class="ccrt1o" align="right">358</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">21.37</td>
<td class="ccrt2o" align="right">1.22</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
<td class="ccrt1e" align="right">1921</td>
<td class="ccrt1e" align="right">244</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">28.72</td>
<td class="ccrt2e" align="right">1.32</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156541">SteveStern</a></td>
<td class="ccrt1o" align="right">1826</td>
<td class="ccrt1o" align="right">426</td>
<td class="ccrt1o" align="right">$0.06</td>
<td class="ccrt2o" align="right">29.17</td>
<td class="ccrt2o" align="right">3.27</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274760">Running Wild</a></td>
<td class="ccrt1e" align="right">1810</td>
<td class="ccrt1e" align="right">332</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">22.66</td>
<td class="ccrt2e" align="right">1.26</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=346607">kalmakka</a></td>
<td class="ccrt1o" align="right">1996</td>
<td class="ccrt1o" align="right">487</td>
<td class="ccrt1o" align="right">$1.41</td>
<td class="ccrt2o" align="right">44.86</td>
<td class="ccrt2o" align="right">10.54</td>
<td class="ccrt2o" align="right">0.56</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.05</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=266571">jburnim</a></td>
<td class="ccrt1e" align="right">1876</td>
<td class="ccrt1e" align="right">392</td>
<td class="ccrt1e" align="right">$0.05</td>
<td class="ccrt2e" align="right">32.01</td>
<td class="ccrt2e" align="right">3.73</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8445017">fiasco</a></td>
<td class="ccrt1o" align="right">1759</td>
<td class="ccrt1o" align="right">236</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.40</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8352094">UltraMilo</a></td>
<td class="ccrt1e" align="right">2056</td>
<td class="ccrt1e" align="right">432</td>
<td class="ccrt1e" align="right">$1.07</td>
<td class="ccrt2e" align="right">49.79</td>
<td class="ccrt2e" align="right">12.42</td>
<td class="ccrt2e" align="right">0.63</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="ccrt1o" align="right">2013</td>
<td class="ccrt1o" align="right">503</td>
<td class="ccrt1o" align="right">$1.90</td>
<td class="ccrt2o" align="right">46.40</td>
<td class="ccrt2o" align="right">11.71</td>
<td class="ccrt2o" align="right">0.71</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.07</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8360116">freestyler</a></td>
<td class="ccrt1e" align="right">1967</td>
<td class="ccrt1e" align="right">370</td>
<td class="ccrt1e" align="right">$0.08</td>
<td class="ccrt2e" align="right">40.19</td>
<td class="ccrt2e" align="right">6.18</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7584235">agh</a></td>
<td class="ccrt1o" align="right">1959</td>
<td class="ccrt1o" align="right">336</td>
<td class="ccrt1o" align="right">$0.03</td>
<td class="ccrt2o" align="right">38.34</td>
<td class="ccrt2o" align="right">4.85</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8365685">pparys</a></td>
<td class="ccrt1e" align="right">2126</td>
<td class="ccrt1e" align="right">642</td>
<td class="ccrt1e" align="right">$18.68</td>
<td class="ccrt2e" align="right">54.18</td>
<td class="ccrt2e" align="right">19.73</td>
<td class="ccrt2e" align="right">2.40</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.61</td>
<td class="ccrt3e" align="right">0.48</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7402883">Henry</a></td>
<td class="ccrt1o" align="right">1794</td>
<td class="ccrt1o" align="right">262</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">15.72</td>
<td class="ccrt2o" align="right">0.32</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7360309">dmks</a></td>
<td class="ccrt1e" align="right">1843</td>
<td class="ccrt1e" align="right">322</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">25.09</td>
<td class="ccrt2e" align="right">1.56</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8349097">hauser</a></td>
<td class="ccrt1o" align="right">1996</td>
<td class="ccrt1o" align="right">424</td>
<td class="ccrt1o" align="right">$0.29</td>
<td class="ccrt2o" align="right">44.11</td>
<td class="ccrt2o" align="right">8.99</td>
<td class="ccrt2o" align="right">0.33</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=349226">viktoras</a></td>
<td class="ccrt1e" align="right">1721</td>
<td class="ccrt1e" align="right">399</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">19.81</td>
<td class="ccrt2e" align="right">1.19</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283374">indigo9</a></td>
<td class="ccrt1o" align="right">1695</td>
<td class="ccrt1o" align="right">369</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">16.19</td>
<td class="ccrt2o" align="right">0.66</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058177">Revenger</a></td>
<td class="ccrt1e" align="right">1627</td>
<td class="ccrt1e" align="right">358</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">11.39</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158447">ValD</a></td>
<td class="ccrt1o" align="right">1707</td>
<td class="ccrt1o" align="right">291</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">11.40</td>
<td class="ccrt2o" align="right">0.19</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8378346">FRaiser</a></td>
<td class="ccrt1e" align="right">1626</td>
<td class="ccrt1e" align="right">277</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.01</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7390467">lovro</a></td>
<td class="ccrt1o" align="right">1812</td>
<td class="ccrt1o" align="right">381</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">25.81</td>
<td class="ccrt2o" align="right">2.12</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7503639">blackbeltcoder4</a></td>
<td class="ccrt1e" align="right">1651</td>
<td class="ccrt1e" align="right">322</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">10.31</td>
<td class="ccrt2e" align="right">0.18</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479769">marian</a></td>
<td class="ccrt1o" align="right">2062</td>
<td class="ccrt1o" align="right">462</td>
<td class="ccrt1o" align="right">$1.04</td>
<td class="ccrt2o" align="right">50.29</td>
<td class="ccrt2o" align="right">13.46</td>
<td class="ccrt2o" align="right">0.80</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289907">Terrax</a></td>
<td class="ccrt1e" align="right">1782</td>
<td class="ccrt1e" align="right">389</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">23.79</td>
<td class="ccrt2e" align="right">1.79</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7489541">saraedum2</a></td>
<td class="ccrt1o" align="right">1837</td>
<td class="ccrt1o" align="right">336</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">25.46</td>
<td class="ccrt2o" align="right">1.71</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268904">szymcio</a></td>
<td class="ccrt1e" align="right">1864</td>
<td class="ccrt1e" align="right">410</td>
<td class="ccrt1e" align="right">$0.02</td>
<td class="ccrt2e" align="right">31.69</td>
<td class="ccrt2e" align="right">3.82</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479796">acki2003</a></td>
<td class="ccrt1o" align="right">1625</td>
<td class="ccrt1o" align="right">320</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">8.82</td>
<td class="ccrt2o" align="right">0.12</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302085">userundefined</a></td>
<td class="ccrt1e" align="right">1577</td>
<td class="ccrt1e" align="right">342</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">7.96</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7340263">gevak</a></td>
<td class="ccrt1o" align="right">1627</td>
<td class="ccrt1o" align="right">219</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">2.62</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7305703">Dumitru</a></td>
<td class="ccrt1e" align="right">1722</td>
<td class="ccrt1e" align="right">349</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">16.70</td>
<td class="ccrt2e" align="right">0.65</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251289">EtherMage</a></td>
<td class="ccrt1o" align="right">1753</td>
<td class="ccrt1o" align="right">530</td>
<td class="ccrt1o" align="right">$0.10</td>
<td class="ccrt2o" align="right">28.14</td>
<td class="ccrt2o" align="right">3.70</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262951">db</a></td>
<td class="ccrt1e" align="right">1697</td>
<td class="ccrt1e" align="right">406</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">18.57</td>
<td class="ccrt2e" align="right">1.04</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8359547">Jasko</a></td>
<td class="ccrt1o" align="right">1628</td>
<td class="ccrt1o" align="right">190</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">1.35</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8349001">belzebub</a></td>
<td class="ccrt1e" align="right">1686</td>
<td class="ccrt1e" align="right">243</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.43</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8356199">charleston</a></td>
<td class="ccrt1o" align="right">1804</td>
<td class="ccrt1o" align="right">455</td>
<td class="ccrt1o" align="right">$0.02</td>
<td class="ccrt2o" align="right">28.69</td>
<td class="ccrt2o" align="right">3.36</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159758">entity</a></td>
<td class="ccrt1e" align="right">1536</td>
<td class="ccrt1e" align="right">322</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">5.27</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7268916">bsauerwine</a></td>
<td class="ccrt1o" align="right">1508</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">5.30</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=275558">zhliu</a></td>
<td class="ccrt1e" align="right">1619</td>
<td class="ccrt1e" align="right">584</td>
<td class="ccrt1e" align="right">$0.06</td>
<td class="ccrt2e" align="right">22.48</td>
<td class="ccrt2e" align="right">2.39</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288788">Wronkyn</a></td>
<td class="ccrt1o" align="right">1621</td>
<td class="ccrt1o" align="right">430</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">15.37</td>
<td class="ccrt2o" align="right">0.72</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=297782">HappyMutant</a></td>
<td class="ccrt1e" align="right">1505</td>
<td class="ccrt1e" align="right">377</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">7.09</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="5">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7400531">mafattah</a></td>
<td class="ccrt1o" align="right">1532</td>
<td class="ccrt1o" align="right">413</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.07</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7240885">psangeljg</a></td>
<td class="ccrt1e" align="right">1586</td>
<td class="ccrt1e" align="right">384</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">10.89</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159530">Spike</a></td>
<td class="ccrt1o" align="right">1407</td>
<td class="ccrt1o" align="right">479</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">8.65</td>
<td class="ccrt2o" align="right">0.22</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7296000">connect4</a></td>
<td class="ccrt1e" align="right">1441</td>
<td class="ccrt1e" align="right">539</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">12.52</td>
<td class="ccrt2e" align="right">0.59</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
</table>

<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
