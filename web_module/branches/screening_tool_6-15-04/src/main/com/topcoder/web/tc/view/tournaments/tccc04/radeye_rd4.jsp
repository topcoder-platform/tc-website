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
               <jsp:param name="selectedRound" value="round4"/>
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
<td class="ccrh2" align="center" colspan="4">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>

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
<td class="ccrt1o" align="right">3429</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$15 393.69</td>
<td class="ccrt2o" align="right">99.89</td>
<td class="ccrt2o" align="right">23.00</td>
<td class="ccrt2o" align="right">14.01</td>
<td class="ccrt2o" align="right">87.76</td>
<td class="ccrt3o" align="right">3.10</td>

<td class="ccrt3o" align="right">9.97</td>
<td class="ccrt3o" align="right">23.36</td>
<td class="ccrt3o" align="right">51.32</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td class="ccrt1e" align="right">3041</td>
<td class="ccrt1e" align="right">414</td>
<td class="ccrt1e" align="right">$3 913.39</td>
<td class="ccrt2e" align="right">94.65</td>
<td class="ccrt2e" align="right">39.71</td>

<td class="ccrt2e" align="right">11.30</td>
<td class="ccrt2e" align="right">45.26</td>
<td class="ccrt3e" align="right">11.66</td>
<td class="ccrt3e" align="right">13.45</td>
<td class="ccrt3e" align="right">11.86</td>
<td class="ccrt3e" align="right">8.30</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=270505">John Dethridge</a></td>
<td class="ccrt1o" align="right">3187</td>
<td class="ccrt1o" align="right">385</td>

<td class="ccrt1o" align="right">$7 189.88</td>
<td class="ccrt2o" align="right">98.23</td>
<td class="ccrt2o" align="right">36.69</td>
<td class="ccrt2o" align="right">14.90</td>
<td class="ccrt2o" align="right">64.36</td>
<td class="ccrt3o" align="right">9.08</td>
<td class="ccrt3o" align="right">16.21</td>
<td class="ccrt3o" align="right">21.29</td>
<td class="ccrt3o" align="right">17.77</td></tr>

<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152347">ZorbaTHut</a></td>
<td class="ccrt1e" align="right">3089</td>
<td class="ccrt1e" align="right">245</td>
<td class="ccrt1e" align="right">$4 212.12</td>
<td class="ccrt2e" align="right">99.77</td>
<td class="ccrt2e" align="right">57.57</td>
<td class="ccrt2e" align="right">17.08</td>
<td class="ccrt2e" align="right">49.49</td>
<td class="ccrt3e" align="right">7.68</td>

<td class="ccrt3e" align="right">17.09</td>
<td class="ccrt3e" align="right">17.52</td>
<td class="ccrt3e" align="right">7.19</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262056">mathijs</a></td>
<td class="ccrt1o" align="right">2906</td>
<td class="ccrt1o" align="right">415</td>
<td class="ccrt1o" align="right">$1 948.33</td>
<td class="ccrt2o" align="right">90.08</td>
<td class="ccrt2o" align="right">39.42</td>

<td class="ccrt2o" align="right">7.73</td>
<td class="ccrt2o" align="right">28.34</td>
<td class="ccrt3o" align="right">10.12</td>
<td class="ccrt3o" align="right">8.71</td>
<td class="ccrt3o" align="right">6.12</td>
<td class="ccrt3o" align="right">3.39</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=311170">bladerunner</a></td>
<td class="ccrt1e" align="right">2893</td>
<td class="ccrt1e" align="right">266</td>

<td class="ccrt1e" align="right">$944.50</td>
<td class="ccrt2e" align="right">97.25</td>
<td class="ccrt2e" align="right">56.78</td>
<td class="ccrt2e" align="right">7.13</td>
<td class="ccrt2e" align="right">15.95</td>
<td class="ccrt3e" align="right">5.17</td>
<td class="ccrt3e" align="right">6.07</td>
<td class="ccrt3e" align="right">3.62</td>
<td class="ccrt3e" align="right">1.09</td></tr>

<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262936">dgarthur</a></td>
<td class="ccrt1o" align="right">2831</td>
<td class="ccrt1o" align="right">313</td>
<td class="ccrt1o" align="right">$639.62</td>
<td class="ccrt2o" align="right">92.70</td>
<td class="ccrt2o" align="right">46.83</td>
<td class="ccrt2o" align="right">5.29</td>
<td class="ccrt2o" align="right">11.25</td>
<td class="ccrt3o" align="right">4.23</td>

<td class="ccrt3o" align="right">4.00</td>
<td class="ccrt3o" align="right">2.25</td>
<td class="ccrt3o" align="right">0.77</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287496">bstanescu</a></td>
<td class="ccrt1e" align="right">2943</td>
<td class="ccrt1e" align="right">603</td>
<td class="ccrt1e" align="right">$2 723.10</td>
<td class="ccrt2e" align="right">82.91</td>
<td class="ccrt2e" align="right">28.97</td>

<td class="ccrt2e" align="right">8.27</td>
<td class="ccrt2e" align="right">31.70</td>
<td class="ccrt3e" align="right">11.47</td>
<td class="ccrt3e" align="right">7.47</td>
<td class="ccrt3e" align="right">6.22</td>
<td class="ccrt3e" align="right">6.54</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8355516">Eryx</a></td>
<td class="ccrt1o" align="right">2726</td>
<td class="ccrt1o" align="right">326</td>

<td class="ccrt1o" align="right">$419.10</td>
<td class="ccrt2o" align="right">85.97</td>
<td class="ccrt2o" align="right">33.52</td>
<td class="ccrt2o" align="right">2.43</td>
<td class="ccrt2o" align="right">8.97</td>
<td class="ccrt3o" align="right">4.19</td>
<td class="ccrt3o" align="right">3.05</td>
<td class="ccrt3o" align="right">1.38</td>
<td class="ccrt3o" align="right">0.36</td></tr>

<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="ccrt1e" align="right">2578</td>
<td class="ccrt1e" align="right">272</td>
<td class="ccrt1e" align="right">$65.10</td>
<td class="ccrt2e" align="right">77.23</td>
<td class="ccrt2e" align="right">18.63</td>
<td class="ccrt2e" align="right">0.42</td>
<td class="ccrt2e" align="right">1.84</td>
<td class="ccrt3e" align="right">1.06</td>

<td class="ccrt3e" align="right">0.59</td>
<td class="ccrt3e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=2058672">dary</a></td>
<td class="ccrt1o" align="right">2553</td>
<td class="ccrt1o" align="right">330</td>
<td class="ccrt1o" align="right">$93.65</td>
<td class="ccrt2o" align="right">70.69</td>
<td class="ccrt2o" align="right">16.97</td>

<td class="ccrt2o" align="right">0.55</td>
<td class="ccrt2o" align="right">2.60</td>
<td class="ccrt3o" align="right">1.56</td>
<td class="ccrt3o" align="right">0.75</td>
<td class="ccrt3o" align="right">0.24</td>
<td class="ccrt3o" align="right">0.04</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287568">tjq</a></td>
<td class="ccrt1e" align="right">2519</td>
<td class="ccrt1e" align="right">436</td>

<td class="ccrt1e" align="right">$152.68</td>
<td class="ccrt2e" align="right">63.12</td>
<td class="ccrt2e" align="right">14.32</td>
<td class="ccrt2e" align="right">0.78</td>
<td class="ccrt2e" align="right">3.85</td>
<td class="ccrt3e" align="right">2.34</td>
<td class="ccrt3e" align="right">0.98</td>
<td class="ccrt3e" align="right">0.39</td>
<td class="ccrt3e" align="right">0.12</td></tr>

<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=345049">aneubeck</a></td>
<td class="ccrt1o" align="right">2513</td>
<td class="ccrt1o" align="right">335</td>
<td class="ccrt1o" align="right">$58.56</td>
<td class="ccrt2o" align="right">66.15</td>
<td class="ccrt2o" align="right">13.14</td>
<td class="ccrt2o" align="right">0.35</td>
<td class="ccrt2o" align="right">1.69</td>
<td class="ccrt3o" align="right">1.07</td>

<td class="ccrt3o" align="right">0.46</td>
<td class="ccrt3o" align="right">0.14</td>
<td class="ccrt3o" align="right">0.03</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307060">AdrianKuegel</a></td>
<td class="ccrt1e" align="right">2459</td>
<td class="ccrt1e" align="right">317</td>
<td class="ccrt1e" align="right">$25.70</td>
<td class="ccrt2e" align="right">60.60</td>
<td class="ccrt2e" align="right">9.21</td>

<td class="ccrt2e" align="right">0.16</td>
<td class="ccrt2e" align="right">0.81</td>
<td class="ccrt3e" align="right">0.55</td>
<td class="ccrt3e" align="right">0.21</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287105">lars</a></td>
<td class="ccrt1o" align="right">2655</td>
<td class="ccrt1o" align="right">491</td>

<td class="ccrt1o" align="right">$454.74</td>
<td class="ccrt2o" align="right">71.83</td>
<td class="ccrt2o" align="right">21.12</td>
<td class="ccrt2o" align="right">2.37</td>
<td class="ccrt2o" align="right">8.64</td>
<td class="ccrt3o" align="right">4.45</td>
<td class="ccrt3o" align="right">2.30</td>
<td class="ccrt3o" align="right">1.25</td>
<td class="ccrt3o" align="right">0.65</td></tr>

<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=113178">po</a></td>
<td class="ccrt1e" align="right">2384</td>
<td class="ccrt1e" align="right">209</td>
<td class="ccrt1e" align="right">$1.90</td>
<td class="ccrt2e" align="right">51.85</td>
<td class="ccrt2e" align="right">3.52</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt3e" align="right">0.05</td>

<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="4">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>

<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>

<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7311097">m00tz</a></td>
<td class="ccrt1o" align="right">2493</td>
<td class="ccrt1o" align="right">356</td>
<td class="ccrt1o" align="right">$63.82</td>
<td class="ccrt2o" align="right">63.16</td>
<td class="ccrt2o" align="right">12.54</td>
<td class="ccrt2o" align="right">0.36</td>

<td class="ccrt2o" align="right">1.83</td>
<td class="ccrt3o" align="right">1.16</td>
<td class="ccrt3o" align="right">0.49</td>
<td class="ccrt3o" align="right">0.15</td>
<td class="ccrt3o" align="right">0.03</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260987">dangelo</a></td>
<td class="ccrt1e" align="right">2485</td>
<td class="ccrt1e" align="right">320</td>
<td class="ccrt1e" align="right">$42.91</td>

<td class="ccrt2e" align="right">63.61</td>
<td class="ccrt2e" align="right">11.64</td>
<td class="ccrt2e" align="right">0.23</td>
<td class="ccrt2e" align="right">1.30</td>
<td class="ccrt3e" align="right">0.85</td>
<td class="ccrt3e" align="right">0.35</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=264869">ante</a></td>

<td class="ccrt1o" align="right">2371</td>
<td class="ccrt1o" align="right">394</td>
<td class="ccrt1o" align="right">$34.26</td>
<td class="ccrt2o" align="right">49.65</td>
<td class="ccrt2o" align="right">7.24</td>
<td class="ccrt2o" align="right">0.15</td>
<td class="ccrt2o" align="right">1.09</td>
<td class="ccrt3o" align="right">0.76</td>
<td class="ccrt3o" align="right">0.25</td>

<td class="ccrt3o" align="right">0.07</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310430">gepa</a></td>
<td class="ccrt1e" align="right">2324</td>
<td class="ccrt1e" align="right">367</td>
<td class="ccrt1e" align="right">$15.80</td>
<td class="ccrt2e" align="right">44.50</td>
<td class="ccrt2e" align="right">5.06</td>
<td class="ccrt2e" align="right">0.06</td>

<td class="ccrt2e" align="right">0.55</td>
<td class="ccrt3e" align="right">0.40</td>
<td class="ccrt3e" align="right">0.11</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td class="ccrt1o" align="right">2676</td>
<td class="ccrt1o" align="right">644</td>
<td class="ccrt1o" align="right">$907.18</td>

<td class="ccrt2o" align="right">68.21</td>
<td class="ccrt2o" align="right">17.95</td>
<td class="ccrt2o" align="right">3.08</td>
<td class="ccrt2o" align="right">14.25</td>
<td class="ccrt3o" align="right">7.11</td>
<td class="ccrt3o" align="right">3.21</td>
<td class="ccrt3o" align="right">2.16</td>
<td class="ccrt3o" align="right">1.77</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=261024">grotmol</a></td>

<td class="ccrt1e" align="right">2535</td>
<td class="ccrt1e" align="right">457</td>
<td class="ccrt1e" align="right">$191.79</td>
<td class="ccrt2e" align="right">63.86</td>
<td class="ccrt2e" align="right">14.72</td>
<td class="ccrt2e" align="right">0.96</td>
<td class="ccrt2e" align="right">4.57</td>
<td class="ccrt3e" align="right">2.70</td>
<td class="ccrt3e" align="right">1.18</td>

<td class="ccrt3e" align="right">0.50</td>
<td class="ccrt3e" align="right">0.18</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471">haha</a></td>
<td class="ccrt1o" align="right">2536</td>
<td class="ccrt1o" align="right">441</td>
<td class="ccrt1o" align="right">$170.08</td>
<td class="ccrt2o" align="right">64.45</td>
<td class="ccrt2o" align="right">14.89</td>
<td class="ccrt2o" align="right">0.90</td>

<td class="ccrt2o" align="right">4.12</td>
<td class="ccrt3o" align="right">2.44</td>
<td class="ccrt3o" align="right">1.08</td>
<td class="ccrt3o" align="right">0.44</td>
<td class="ccrt3o" align="right">0.15</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=263396">Abednego</a></td>
<td class="ccrt1e" align="right">2464</td>
<td class="ccrt1e" align="right">513</td>
<td class="ccrt1e" align="right">$157.12</td>

<td class="ccrt2e" align="right">57.03</td>
<td class="ccrt2e" align="right">11.73</td>
<td class="ccrt2e" align="right">0.77</td>
<td class="ccrt2e" align="right">3.78</td>
<td class="ccrt3e" align="right">2.37</td>
<td class="ccrt3e" align="right">0.87</td>
<td class="ccrt3e" align="right">0.38</td>
<td class="ccrt3e" align="right">0.16</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=284007">Ryan</a></td>

<td class="ccrt1o" align="right">2366</td>
<td class="ccrt1o" align="right">291</td>
<td class="ccrt1o" align="right">$6.65</td>
<td class="ccrt2o" align="right">48.88</td>
<td class="ccrt2o" align="right">4.58</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.24</td>
<td class="ccrt3o" align="right">0.18</td>
<td class="ccrt3o" align="right">0.05</td>

<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=304031">Ruberik</a></td>
<td class="ccrt1e" align="right">2246</td>
<td class="ccrt1e" align="right">368</td>
<td class="ccrt1e" align="right">$6.07</td>
<td class="ccrt2e" align="right">36.28</td>
<td class="ccrt2e" align="right">2.86</td>
<td class="ccrt2e" align="right">0.02</td>

<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt3e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308453">overwise</a></td>
<td class="ccrt1o" align="right">2363</td>
<td class="ccrt1o" align="right">469</td>
<td class="ccrt1o" align="right">$57.03</td>

<td class="ccrt2o" align="right">49.05</td>
<td class="ccrt2o" align="right">7.64</td>
<td class="ccrt2o" align="right">0.27</td>
<td class="ccrt2o" align="right">1.65</td>
<td class="ccrt3o" align="right">1.14</td>
<td class="ccrt3o" align="right">0.36</td>
<td class="ccrt3o" align="right">0.12</td>
<td class="ccrt3o" align="right">0.04</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7462740">ploh</a></td>

<td class="ccrt1e" align="right">2353</td>
<td class="ccrt1e" align="right">277</td>
<td class="ccrt1e" align="right">$4.64</td>
<td class="ccrt2e" align="right">46.95</td>
<td class="ccrt2e" align="right">3.82</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.13</td>
<td class="ccrt3e" align="right">0.04</td>

<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td class="ccrt1o" align="right">2197</td>
<td class="ccrt1o" align="right">388</td>
<td class="ccrt1o" align="right">$5.47</td>
<td class="ccrt2o" align="right">32.26</td>
<td class="ccrt2o" align="right">2.25</td>
<td class="ccrt2o" align="right">0.02</td>

<td class="ccrt2o" align="right">0.21</td>
<td class="ccrt3o" align="right">0.17</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7281980">eldering</a></td>
<td class="ccrt1e" align="right">2152</td>
<td class="ccrt1e" align="right">279</td>
<td class="ccrt1e" align="right">$0.32</td>

<td class="ccrt2e" align="right">21.34</td>
<td class="ccrt2e" align="right">0.53</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=289706">mickle</a></td>

<td class="ccrt1o" align="right">2204</td>
<td class="ccrt1o" align="right">379</td>
<td class="ccrt1o" align="right">$5.21</td>
<td class="ccrt2o" align="right">32.56</td>
<td class="ccrt2o" align="right">2.19</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.20</td>
<td class="ccrt3o" align="right">0.16</td>
<td class="ccrt3o" align="right">0.03</td>

<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7421158">Per</a></td>
<td class="ccrt1e" align="right">2347</td>
<td class="ccrt1e" align="right">445</td>
<td class="ccrt1e" align="right">$43.70</td>
<td class="ccrt2e" align="right">47.53</td>
<td class="ccrt2e" align="right">6.54</td>
<td class="ccrt2e" align="right">0.18</td>

<td class="ccrt2e" align="right">1.34</td>
<td class="ccrt3e" align="right">0.94</td>
<td class="ccrt3e" align="right">0.28</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="4">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>

<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>

<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308657">skanthak</a></td>
<td class="ccrt1o" align="right">2194</td>
<td class="ccrt1o" align="right">353</td>
<td class="ccrt1o" align="right">$3.09</td>

<td class="ccrt2o" align="right">30.36</td>
<td class="ccrt2o" align="right">1.66</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.12</td>
<td class="ccrt3o" align="right">0.10</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263379">StefanPochmann</a></td>

<td class="ccrt1e" align="right">2035</td>
<td class="ccrt1e" align="right">393</td>
<td class="ccrt1e" align="right">$1.09</td>
<td class="ccrt2e" align="right">19.28</td>
<td class="ccrt2e" align="right">0.64</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.01</td>

<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307070">qsort</a></td>
<td class="ccrt1o" align="right">2096</td>
<td class="ccrt1o" align="right">331</td>
<td class="ccrt1o" align="right">$0.57</td>
<td class="ccrt2o" align="right">19.98</td>
<td class="ccrt2o" align="right">0.55</td>
<td class="ccrt2o" align="right">0.00</td>

<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7512490">petko</a></td>
<td class="ccrt1e" align="right">2091</td>
<td class="ccrt1e" align="right">317</td>
<td class="ccrt1e" align="right">$0.38</td>

<td class="ccrt2e" align="right">18.55</td>
<td class="ccrt2e" align="right">0.43</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058469">robymus</a></td>

<td class="ccrt1o" align="right">2101</td>
<td class="ccrt1o" align="right">344</td>
<td class="ccrt1o" align="right">$0.83</td>
<td class="ccrt2o" align="right">21.26</td>
<td class="ccrt2o" align="right">0.67</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.00</td>

<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269058">jasonw</a></td>
<td class="ccrt1e" align="right">2034</td>
<td class="ccrt1e" align="right">305</td>
<td class="ccrt1e" align="right">$0.13</td>
<td class="ccrt2e" align="right">13.28</td>
<td class="ccrt2e" align="right">0.19</td>
<td class="ccrt2e" align="right">0.00</td>

<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260828">Larry</a></td>
<td class="ccrt1o" align="right">2182</td>
<td class="ccrt1o" align="right">454</td>
<td class="ccrt1o" align="right">$12.14</td>

<td class="ccrt2o" align="right">33.46</td>
<td class="ccrt2o" align="right">2.77</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.44</td>
<td class="ccrt3o" align="right">0.34</td>
<td class="ccrt3o" align="right">0.07</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307169">Fluff</a></td>

<td class="ccrt1e" align="right">1946</td>
<td class="ccrt1e" align="right">323</td>
<td class="ccrt1e" align="right">$0.05</td>
<td class="ccrt2e" align="right">9.29</td>
<td class="ccrt2e" align="right">0.09</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>

<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
<td class="ccrt1o" align="right">1979</td>
<td class="ccrt1o" align="right">251</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">6.08</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>

<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=346607">kalmakka</a></td>
<td class="ccrt1e" align="right">2095</td>
<td class="ccrt1e" align="right">473</td>
<td class="ccrt1e" align="right">$7.04</td>

<td class="ccrt2e" align="right">27.57</td>
<td class="ccrt2e" align="right">1.82</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt3e" align="right">0.22</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=266571">jburnim</a></td>

<td class="ccrt1o" align="right">1933</td>
<td class="ccrt1o" align="right">370</td>
<td class="ccrt1o" align="right">$0.19</td>
<td class="ccrt2o" align="right">11.60</td>
<td class="ccrt2o" align="right">0.18</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>

<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="ccrt1e" align="right">2147</td>
<td class="ccrt1e" align="right">525</td>
<td class="ccrt1e" align="right">$18.09</td>
<td class="ccrt2e" align="right">33.10</td>
<td class="ccrt2e" align="right">3.06</td>
<td class="ccrt2e" align="right">0.07</td>

<td class="ccrt2e" align="right">0.61</td>
<td class="ccrt3e" align="right">0.48</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7390467">lovro</a></td>
<td class="ccrt1o" align="right">1944</td>
<td class="ccrt1o" align="right">417</td>
<td class="ccrt1o" align="right">$0.54</td>

<td class="ccrt2o" align="right">14.99</td>
<td class="ccrt2o" align="right">0.37</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268904">szymcio</a></td>

<td class="ccrt1e" align="right">1910</td>
<td class="ccrt1e" align="right">367</td>
<td class="ccrt1e" align="right">$0.10</td>
<td class="ccrt2e" align="right">10.27</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>

<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302085">userundefined</a></td>
<td class="ccrt1o" align="right">1662</td>
<td class="ccrt1o" align="right">355</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">2.30</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>

<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8356199">charleston</a></td>
<td class="ccrt1e" align="right">2011</td>
<td class="ccrt1e" align="right">558</td>
<td class="ccrt1e" align="right">$7.44</td>

<td class="ccrt2e" align="right">25.56</td>
<td class="ccrt2e" align="right">1.73</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt3e" align="right">0.22</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>

<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="4">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Semifinals</td>

<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7268916">bsauerwine</a></td>

<td class="ccrt1o" align="right">1624</td>
<td class="ccrt1o" align="right">388</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">2.69</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>

<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7296000">connect4</a></td>
<td class="ccrt1e" align="right">1589</td>
<td class="ccrt1e" align="right">566</td>
<td class="ccrt1e" align="right">$0.22</td>
<td class="ccrt2e" align="right">8.15</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>

<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
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
