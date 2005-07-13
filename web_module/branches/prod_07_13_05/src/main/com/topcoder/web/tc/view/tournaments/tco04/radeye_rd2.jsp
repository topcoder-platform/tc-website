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
               <jsp:param name="selectedRound" value="round2"/>
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
               By&#160;<a class="bodyText" href="/stat?tc?module=MemberProfile&amp;cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="r1o">3526</td>
<td class="r1o">364</td>
<td class="r1o">$11,359.69</td>
<td class="r2o">100.00</td>
<td class="r2o">99.96</td>
<td class="r2o">99.44</td>
<td class="r2o">27.18</td>
<td class="r2o">14.22</td>
<td class="r2o">79.35</td>
<td class="r3o">5.49</td>
<td class="r3o">11.42</td>
<td class="r3o">19.87</td>
<td class="r3o">42.57</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=272072">SnapDragon</a></td>
<td class="r1e">3340</td>
<td class="r1e">277</td>
<td class="r1e">$6,198.26</td>
<td class="r2e">100.00</td>
<td class="r2e">99.99</td>
<td class="r2e">99.61</td>
<td class="r2e">47.50</td>
<td class="r2e">15.88</td>
<td class="r2e">56.87</td>
<td class="r3e">7.06</td>
<td class="r3e">14.88</td>
<td class="r3e">19.71</td>
<td class="r3e">15.21</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="r1o">3282</td>
<td class="r1o">379</td>
<td class="r1o">$5,210.06</td>
<td class="r2o">99.95</td>
<td class="r2o">99.50</td>
<td class="r2o">96.16</td>
<td class="r2o">38.17</td>
<td class="r2o">11.57</td>
<td class="r2o">51.28</td>
<td class="r3o">10.97</td>
<td class="r3o">13.34</td>
<td class="r3o">14.01</td>
<td class="r3o">12.97</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7445961">snewman</a></td>
<td class="r1e">3226</td>
<td class="r1e">295</td>
<td class="r1e">$3,881.06</td>
<td class="r2e">100.00</td>
<td class="r2e">99.91</td>
<td class="r2e">98.30</td>
<td class="r2e">49.83</td>
<td class="r2e">11.31</td>
<td class="r2e">41.67</td>
<td class="r3e">9.37</td>
<td class="r3e">12.99</td>
<td class="r3e">11.99</td>
<td class="r3e">7.33</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=260835">reid</a></td>
<td class="r1o">3223</td>
<td class="r1o">359</td>
<td class="r1o">$3,728.60</td>
<td class="r2o">99.96</td>
<td class="r2o">99.48</td>
<td class="r2o">95.63</td>
<td class="r2o">44.28</td>
<td class="r2o">11.31</td>
<td class="r2o">38.57</td>
<td class="r3o">9.47</td>
<td class="r3o">10.87</td>
<td class="r3o">10.33</td>
<td class="r3o">7.90</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=269554">Yarin</a></td>
<td class="r1e">3179</td>
<td class="r1e">314</td>
<td class="r1e">$2,721.94</td>
<td class="r2e">99.99</td>
<td class="r2e">99.74</td>
<td class="r2e">96.68</td>
<td class="r2e">52.20</td>
<td class="r2e">10.65</td>
<td class="r2e">28.48</td>
<td class="r3e">7.37</td>
<td class="r3e">8.79</td>
<td class="r3e">7.57</td>
<td class="r3e">4.75</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=152347">ZorbaTHut</a></td>
<td class="r1o">3104</td>
<td class="r1o">210</td>
<td class="r1o">$1,357.54</td>
<td class="r2o">100.00</td>
<td class="r2o">99.99</td>
<td class="r2o">99.11</td>
<td class="r2o">59.76</td>
<td class="r2o">5.57</td>
<td class="r2o">12.97</td>
<td class="r3o">3.83</td>
<td class="r3o">4.85</td>
<td class="r3o">3.20</td>
<td class="r3o">1.09</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="r1e">3116</td>
<td class="r1e">433</td>
<td class="r1e">$2,354.71</td>
<td class="r2e">99.42</td>
<td class="r2e">96.62</td>
<td class="r2e">85.98</td>
<td class="r2e">34.14</td>
<td class="r2e">7.13</td>
<td class="r2e">25.50</td>
<td class="r3e">8.71</td>
<td class="r3e">6.79</td>
<td class="r3e">5.53</td>
<td class="r3e">4.47</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=275071">antimatter</a></td>
<td class="r1o">2912</td>
<td class="r1o">405</td>
<td class="r1o">$944.94</td>
<td class="r2o">98.59</td>
<td class="r2o">92.46</td>
<td class="r2o">73.02</td>
<td class="r2o">24.17</td>
<td class="r2o">2.26</td>
<td class="r2o">10.25</td>
<td class="r3o">5.11</td>
<td class="r3o">2.76</td>
<td class="r3o">1.57</td>
<td class="r3o">0.81</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=287496">bstanescu</a></td>
<td class="r1e">2895</td>
<td class="r1e">438</td>
<td class="r1e">$918.51</td>
<td class="r2e">97.68</td>
<td class="r2e">89.55</td>
<td class="r2e">68.04</td>
<td class="r2e">21.08</td>
<td class="r2e">2.12</td>
<td class="r2e">10.17</td>
<td class="r3e">5.20</td>
<td class="r3e">2.60</td>
<td class="r3e">1.51</td>
<td class="r3e">0.87</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=277659">radeye</a></td>
<td class="r1o">2918</td>
<td class="r1o">327</td>
<td class="r1o">$836.86</td>
<td class="r2o">99.68</td>
<td class="r2o">96.92</td>
<td class="r2o">81.83</td>
<td class="r2o">27.75</td>
<td class="r2o">1.81</td>
<td class="r2o">7.85</td>
<td class="r3o">3.87</td>
<td class="r3o">2.37</td>
<td class="r3o">1.18</td>
<td class="r3o">0.43</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=274023">venco</a></td>
<td class="r1e">2867</td>
<td class="r1e">299</td>
<td class="r1e">$631.43</td>
<td class="r2e">99.75</td>
<td class="r2e">97.02</td>
<td class="r2e">80.05</td>
<td class="r2e">22.66</td>
<td class="r2e">0.95</td>
<td class="r2e">4.19</td>
<td class="r3e">2.23</td>
<td class="r3e">1.27</td>
<td class="r3e">0.53</td>
<td class="r3e">0.15</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=293874">nicka81</a></td>
<td class="r1o">2750</td>
<td class="r1o">372</td>
<td class="r1o">$431.58</td>
<td class="r2o">97.47</td>
<td class="r2o">86.95</td>
<td class="r2o">58.20</td>
<td class="r2o">11.72</td>
<td class="r2o">0.46</td>
<td class="r2o">2.40</td>
<td class="r3o">1.46</td>
<td class="r3o">0.60</td>
<td class="r3o">0.25</td>
<td class="r3o">0.09</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=310333">kalinov</a></td>
<td class="r1e">2726</td>
<td class="r1e">415</td>
<td class="r1e">$400.79</td>
<td class="r2e">95.50</td>
<td class="r2e">81.54</td>
<td class="r2e">51.43</td>
<td class="r2e">9.96</td>
<td class="r2e">0.47</td>
<td class="r2e">2.48</td>
<td class="r3e">1.53</td>
<td class="r3e">0.59</td>
<td class="r3e">0.26</td>
<td class="r3e">0.11</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=286907">WishingBone</a></td>
<td class="r1o">2770</td>
<td class="r1o">242</td>
<td class="r1o">$454.22</td>
<td class="r2o">99.89</td>
<td class="r2o">97.41</td>
<td class="r2o">75.31</td>
<td class="r2o">12.17</td>
<td class="r2o">0.16</td>
<td class="r2o">0.81</td>
<td class="r3o">0.50</td>
<td class="r3o">0.23</td>
<td class="r3o">0.07</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=262936">dgarthur</a></td>
<td class="r1e">2796</td>
<td class="r1e">491</td>
<td class="r1e">$576.56</td>
<td class="r2e">94.25</td>
<td class="r2e">80.05</td>
<td class="r2e">53.22</td>
<td class="r2e">12.29</td>
<td class="r2e">1.11</td>
<td class="r2e">5.48</td>
<td class="r3e">3.09</td>
<td class="r3e">1.26</td>
<td class="r3e">0.70</td>
<td class="r3e">0.44</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=287105">lars</a></td>
<td class="r1o">2718</td>
<td class="r1o">370</td>
<td class="r1o">$388.76</td>
<td class="r2o">96.98</td>
<td class="r2o">85.01</td>
<td class="r2o">54.24</td>
<td class="r2o">10.00</td>
<td class="r2o">0.33</td>
<td class="r2o">1.98</td>
<td class="r3o">1.26</td>
<td class="r3o">0.48</td>
<td class="r3o">0.18</td>
<td class="r3o">0.06</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="r1e">2635</td>
<td class="r1e">315</td>
<td class="r1e">$295.99</td>
<td class="r2e">97.38</td>
<td class="r2e">84.06</td>
<td class="r2e">47.04</td>
<td class="r2e">5.83</td>
<td class="r2e">0.07</td>
<td class="r2e">0.59</td>
<td class="r3e">0.43</td>
<td class="r3e">0.13</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=157974">bigg_nate</a></td>
<td class="r1o">2591</td>
<td class="r1o">382</td>
<td class="r1o">$245.42</td>
<td class="r2o">93.16</td>
<td class="r2o">73.14</td>
<td class="r2o">36.76</td>
<td class="r2o">4.72</td>
<td class="r2o">0.09</td>
<td class="r2o">0.77</td>
<td class="r3o">0.56</td>
<td class="r3o">0.15</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=310430">gepa</a></td>
<td class="r1e">2695</td>
<td class="r1e">383</td>
<td class="r1e">$363.59</td>
<td class="r2e">96.04</td>
<td class="r2e">82.13</td>
<td class="r2e">50.13</td>
<td class="r2e">8.96</td>
<td class="r2e">0.29</td>
<td class="r2e">1.94</td>
<td class="r3e">1.27</td>
<td class="r3e">0.45</td>
<td class="r3e">0.17</td>
<td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=287266">jms137</a></td>
<td class="r1o">2595</td>
<td class="r1o">366</td>
<td class="r1o">$250.19</td>
<td class="r2o">94.11</td>
<td class="r2o">75.10</td>
<td class="r2o">38.09</td>
<td class="r2o">4.70</td>
<td class="r2o">0.08</td>
<td class="r2o">0.69</td>
<td class="r3o">0.50</td>
<td class="r3o">0.14</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="r1e">2647</td>
<td class="r1e">291</td>
<td class="r1e">$313.72</td>
<td class="r2e">98.38</td>
<td class="r2e">87.51</td>
<td class="r2e">50.84</td>
<td class="r2e">5.95</td>
<td class="r2e">0.06</td>
<td class="r2e">0.51</td>
<td class="r3e">0.36</td>
<td class="r3e">0.11</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=262056">mathijs</a></td>
<td class="r1o">2688</td>
<td class="r1o">457</td>
<td class="r1o">$362.88</td>
<td class="r2o">92.75</td>
<td class="r2o">75.01</td>
<td class="r2o">44.00</td>
<td class="r2o">8.02</td>
<td class="r2o">0.41</td>
<td class="r2o">2.60</td>
<td class="r3o">1.67</td>
<td class="r3o">0.56</td>
<td class="r3o">0.25</td>
<td class="r3o">0.12</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=152340">jshute</a></td>
<td class="r1e">2682</td>
<td class="r1e">408</td>
<td class="r1e">$342.93</td>
<td class="r2e">94.70</td>
<td class="r2e">78.82</td>
<td class="r2e">46.60</td>
<td class="r2e">7.84</td>
<td class="r2e">0.29</td>
<td class="r2e">1.86</td>
<td class="r3e">1.22</td>
<td class="r3e">0.42</td>
<td class="r3e">0.16</td>
<td class="r3e">0.06</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=261024">grotmol</a></td>
<td class="r1o">2646</td>
<td class="r1o">500</td>
<td class="r1o">$310.88</td>
<td class="r2o">89.41</td>
<td class="r2o">68.16</td>
<td class="r2o">37.19</td>
<td class="r2o">6.22</td>
<td class="r2o">0.35</td>
<td class="r2o">2.23</td>
<td class="r3o">1.46</td>
<td class="r3o">0.45</td>
<td class="r3o">0.21</td>
<td class="r3o">0.11</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7393427">texel</a></td>
<td class="r1e">2674</td>
<td class="r1e">546</td>
<td class="r1e">$361.58</td>
<td class="r2e">88.39</td>
<td class="r2e">67.15</td>
<td class="r2e">37.74</td>
<td class="r2e">6.83</td>
<td class="r2e">0.52</td>
<td class="r2e">3.12</td>
<td class="r3e">1.96</td>
<td class="r3e">0.62</td>
<td class="r3e">0.32</td>
<td class="r3e">0.21</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7428266">Klinck</a></td>
<td class="r1o">2575</td>
<td class="r1o">293</td>
<td class="r1o">$240.95</td>
<td class="r2o">97.00</td>
<td class="r2o">80.93</td>
<td class="r2o">39.04</td>
<td class="r2o">2.89</td>
<td class="r2o">0.02</td>
<td class="r2o">0.18</td>
<td class="r3o">0.14</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=305142">ChristopherH</a></td>
<td class="r1e">2489</td>
<td class="r1e">411</td>
<td class="r1e">$160.32</td>
<td class="r2e">87.20</td>
<td class="r2e">59.83</td>
<td class="r2e">24.14</td>
<td class="r2e">2.13</td>
<td class="r2e">0.03</td>
<td class="r2e">0.32</td>
<td class="r3e">0.25</td>
<td class="r3e">0.05</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=288584">LunaticFringe</a></td>
<td class="r1o">2607</td>
<td class="r1o">411</td>
<td class="r1o">$256.08</td>
<td class="r2o">92.26</td>
<td class="r2o">71.98</td>
<td class="r2o">37.27</td>
<td class="r2o">4.92</td>
<td class="r2o">0.13</td>
<td class="r2o">0.97</td>
<td class="r3o">0.68</td>
<td class="r3o">0.20</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7479769">marian</a></td>
<td class="r1e">2550</td>
<td class="r1e">199</td>
<td class="r1e">$237.00</td>
<td class="r2e">99.56</td>
<td class="r2e">89.70</td>
<td class="r2e">38.35</td>
<td class="r2e">1.10</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="r1o">2582</td>
<td class="r1o">296</td>
<td class="r1o">$247.06</td>
<td class="r2o">97.03</td>
<td class="r2o">81.29</td>
<td class="r2o">40.00</td>
<td class="r2o">3.17</td>
<td class="r2o">0.02</td>
<td class="r2o">0.22</td>
<td class="r3o">0.17</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7502813">monsoon</a></td>
<td class="r1e">2570</td>
<td class="r1e">317</td>
<td class="r1e">$232.15</td>
<td class="r2e">95.77</td>
<td class="r2e">77.71</td>
<td class="r2e">37.08</td>
<td class="r2e">3.13</td>
<td class="r2e">0.02</td>
<td class="r2e">0.27</td>
<td class="r3e">0.20</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=263396">Abednego</a></td>
<td class="r1o">2505</td>
<td class="r1o">331</td>
<td class="r1o">$176.56</td>
<td class="r2o">92.74</td>
<td class="r2o">68.82</td>
<td class="r2o">27.56</td>
<td class="r2o">1.86</td>
<td class="r2o">0.01</td>
<td class="r2o">0.16</td>
<td class="r3o">0.12</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="r1e">2467</td>
<td class="r1e">249</td>
<td class="r1e">$152.56</td>
<td class="r2e">96.22</td>
<td class="r2e">73.19</td>
<td class="r2e">23.11</td>
<td class="r2e">0.66</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=297823">madking</a></td>
<td class="r1o">2482</td>
<td class="r1o">199</td>
<td class="r1o">$165.47</td>
<td class="r2o">98.88</td>
<td class="r2o">82.04</td>
<td class="r2o">24.87</td>
<td class="r2o">0.45</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=156592">benetin</a></td>
<td class="r1e">2471</td>
<td class="r1e">326</td>
<td class="r1e">$152.10</td>
<td class="r2e">91.54</td>
<td class="r2e">65.06</td>
<td class="r2e">23.38</td>
<td class="r2e">1.32</td>
<td class="r2e">0.01</td>
<td class="r2e">0.10</td>
<td class="r3e">0.08</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=284007">Ryan</a></td>
<td class="r1o">2470</td>
<td class="r1o">272</td>
<td class="r1o">$154.22</td>
<td class="r2o">94.95</td>
<td class="r2o">70.78</td>
<td class="r2o">23.59</td>
<td class="r2o">0.88</td>
<td class="r2o">0.00</td>
<td class="r2o">0.03</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="r1e">2488</td>
<td class="r1e">418</td>
<td class="r1e">$161.04</td>
<td class="r2e">86.75</td>
<td class="r2e">59.19</td>
<td class="r2e">23.92</td>
<td class="r2e">2.23</td>
<td class="r2e">0.03</td>
<td class="r2e">0.40</td>
<td class="r3e">0.31</td>
<td class="r3e">0.07</td>
<td class="r3e">0.02</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=308657">skanthak</a></td>
<td class="r1o">2424</td>
<td class="r1o">295</td>
<td class="r1o">$120.84</td>
<td class="r2o">91.29</td>
<td class="r2o">61.61</td>
<td class="r2o">17.87</td>
<td class="r2o">0.62</td>
<td class="r2o">0.00</td>
<td class="r2o">0.03</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=264869">ante</a></td>
<td class="r1e">2465</td>
<td class="r1e">356</td>
<td class="r1e">$146.69</td>
<td class="r2e">89.30</td>
<td class="r2e">61.49</td>
<td class="r2e">22.38</td>
<td class="r2e">1.46</td>
<td class="r2e">0.01</td>
<td class="r2e">0.15</td>
<td class="r3e">0.12</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=155275">DjinnKahn</a></td>
<td class="r1o">2352</td>
<td class="r1o">227</td>
<td class="r1o">$71.81</td>
<td class="r2o">92.56</td>
<td class="r2o">56.17</td>
<td class="r2o">8.74</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=129672">doeth</a></td>
<td class="r1e">2314</td>
<td class="r1e">340</td>
<td class="r1e">$66.33</td>
<td class="r2e">80.45</td>
<td class="r2e">42.44</td>
<td class="r2e">8.95</td>
<td class="r2e">0.24</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=347569">Savior</a></td>
<td class="r1o">2332</td>
<td class="r1o">395</td>
<td class="r1o">$77.24</td>
<td class="r2o">78.35</td>
<td class="r2o">42.45</td>
<td class="r2o">10.94</td>
<td class="r2o">0.48</td>
<td class="r2o">0.00</td>
<td class="r2o">0.05</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=153505">ambrose</a></td>
<td class="r1e">2323</td>
<td class="r1e">258</td>
<td class="r1e">$61.95</td>
<td class="r2e">87.73</td>
<td class="r2e">48.28</td>
<td class="r2e">7.55</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=287568">tjq</a></td>
<td class="r1o">2358</td>
<td class="r1o">269</td>
<td class="r1o">$80.23</td>
<td class="r2o">89.33</td>
<td class="r2o">53.54</td>
<td class="r2o">10.67</td>
<td class="r2o">0.17</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7446789">JongMan</a></td>
<td class="r1e">2489</td>
<td class="r1e">651</td>
<td class="r1e">$188.90</td>
<td class="r2e">76.35</td>
<td class="r2e">47.34</td>
<td class="r2e">20.73</td>
<td class="r2e">2.77</td>
<td class="r2e">0.18</td>
<td class="r2e">1.54</td>
<td class="r3e">1.09</td>
<td class="r3e">0.24</td>
<td class="r3e">0.12</td>
<td class="r3e">0.09</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=7475981">hamster</a></td>
<td class="r1o">2284</td>
<td class="r1o">233</td>
<td class="r1o">$43.00</td>
<td class="r2o">86.82</td>
<td class="r2o">42.49</td>
<td class="r2o">4.35</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=153902">evd</a></td>
<td class="r1e">2253</td>
<td class="r1e">335</td>
<td class="r1e">$44.78</td>
<td class="r2e">75.43</td>
<td class="r2e">34.34</td>
<td class="r2e">5.50</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=303644">Olexiy</a></td>
<td class="r1o">2326</td>
<td class="r1o">462</td>
<td class="r1o">$78.98</td>
<td class="r2o">74.47</td>
<td class="r2o">39.51</td>
<td class="r2o">11.22</td>
<td class="r2o">0.67</td>
<td class="r2o">0.01</td>
<td class="r2o">0.11</td>
<td class="r3o">0.10</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=302501">PMH</a></td>
<td class="r1e">2332</td>
<td class="r1e">479</td>
<td class="r1e">$82.32</td>
<td class="r2e">74.12</td>
<td class="r2e">39.61</td>
<td class="r2e">11.69</td>
<td class="r2e">0.76</td>
<td class="r2e">0.01</td>
<td class="r2e">0.15</td>
<td class="r3e">0.12</td>
<td class="r3e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=308453">overwise</a></td>
<td class="r1o">2309</td>
<td class="r1o">351</td>
<td class="r1o">$65.19</td>
<td class="r2o">79.30</td>
<td class="r2o">41.31</td>
<td class="r2o">8.83</td>
<td class="r2o">0.24</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7210680">cnettel</a></td>
<td class="r1e">2170</td>
<td class="r1e">308</td>
<td class="r1e">$22.67</td>
<td class="r2e">68.39</td>
<td class="r2e">23.78</td>
<td class="r2e">2.15</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=252076">Wasteland</a></td>
<td class="r1o">2240</td>
<td class="r1o">365</td>
<td class="r1o">$43.83</td>
<td class="r2o">72.46</td>
<td class="r2o">32.21</td>
<td class="r2o">5.51</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=299993">cvoinescu</a></td>
<td class="r1e">2219</td>
<td class="r1e">231</td>
<td class="r1e">$24.53</td>
<td class="r2e">80.17</td>
<td class="r2e">30.42</td>
<td class="r2e">1.86</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=154754">Ken_Vogel</a></td>
<td class="r1o">2294</td>
<td class="r1o">544</td>
<td class="r1o">$73.69</td>
<td class="r2o">69.14</td>
<td class="r2o">34.72</td>
<td class="r2o">10.17</td>
<td class="r2o">0.73</td>
<td class="r2o">0.01</td>
<td class="r2o">0.19</td>
<td class="r3o">0.15</td>
<td class="r3o">0.02</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=269058">jasonw</a></td>
<td class="r1e">2221</td>
<td class="r1e">356</td>
<td class="r1e">$38.04</td>
<td class="r2e">71.15</td>
<td class="r2e">30.04</td>
<td class="r2e">4.58</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=269788">Maris</a></td>
<td class="r1o">2203</td>
<td class="r1o">258</td>
<td class="r1o">$24.07</td>
<td class="r2o">75.75</td>
<td class="r2o">27.86</td>
<td class="r2o">2.03</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=156216">daveagp</a></td>
<td class="r1e">2197</td>
<td class="r1e">384</td>
<td class="r1e">$34.87</td>
<td class="r2e">67.53</td>
<td class="r2e">27.24</td>
<td class="r2e">4.23</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=2059354">futo</a></td>
<td class="r1o">2274</td>
<td class="r1o">323</td>
<td class="r1o">$50.19</td>
<td class="r2o">78.20</td>
<td class="r2o">37.50</td>
<td class="r2o">6.27</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=114443">jonmac</a></td>
<td class="r1e">2294</td>
<td class="r1e">544</td>
<td class="r1e">$73.50</td>
<td class="r2e">69.15</td>
<td class="r2e">34.73</td>
<td class="r2e">10.17</td>
<td class="r2e">0.72</td>
<td class="r2e">0.01</td>
<td class="r2e">0.18</td>
<td class="r3e">0.15</td>
<td class="r3e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7512490">petko</a></td>
<td class="r1o">2199</td>
<td class="r1o">258</td>
<td class="r1o">$23.26</td>
<td class="r2o">75.26</td>
<td class="r2o">27.24</td>
<td class="r2o">1.93</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=105922">qubits</a></td>
<td class="r1e">2202</td>
<td class="r1e">443</td>
<td class="r1e">$40.73</td>
<td class="r2e">65.75</td>
<td class="r2e">27.63</td>
<td class="r2e">5.29</td>
<td class="r2e">0.16</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=9906197">krijgertje</a></td>
<td class="r1o">2276</td>
<td class="r1o">523</td>
<td class="r1o">$66.13</td>
<td class="r2o">68.63</td>
<td class="r2o">33.53</td>
<td class="r2o">9.19</td>
<td class="r2o">0.57</td>
<td class="r2o">0.01</td>
<td class="r2o">0.12</td>
<td class="r3o">0.10</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8547850">tmyklebu</a></td>
<td class="r1e">2176</td>
<td class="r1e">335</td>
<td class="r1e">$26.22</td>
<td class="r2e">67.66</td>
<td class="r2e">24.76</td>
<td class="r2e">2.76</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=287269">legakis</a></td>
<td class="r1o">2171</td>
<td class="r1o">206</td>
<td class="r1o">$13.75</td>
<td class="r2o">76.32</td>
<td class="r2o">21.65</td>
<td class="r2o">0.58</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=304031">Ruberik</a></td>
<td class="r1e">2186</td>
<td class="r1e">423</td>
<td class="r1e">$35.67</td>
<td class="r2e">65.06</td>
<td class="r2e">26.15</td>
<td class="r2e">4.47</td>
<td class="r2e">0.11</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="r1o">2205</td>
<td class="r1o">427</td>
<td class="r1o">$40.15</td>
<td class="r2o">66.57</td>
<td class="r2o">27.96</td>
<td class="r2o">5.17</td>
<td class="r2o">0.14</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7213681">wleite</a></td>
<td class="r1e">2190</td>
<td class="r1e">342</td>
<td class="r1e">$29.65</td>
<td class="r2e">68.79</td>
<td class="r2e">26.42</td>
<td class="r2e">3.28</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=299709">Modulator</a></td>
<td class="r1o">2154</td>
<td class="r1o">215</td>
<td class="r1o">$12.25</td>
<td class="r2o">72.86</td>
<td class="r2o">19.32</td>
<td class="r2o">0.52</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7210729">ssancho2</a></td>
<td class="r1e">2140</td>
<td class="r1e">364</td>
<td class="r1e">$22.45</td>
<td class="r2e">62.66</td>
<td class="r2e">21.26</td>
<td class="r2e">2.36</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=261567">gilbert</a></td>
<td class="r1o">2186</td>
<td class="r1o">412</td>
<td class="r1o">$34.79</td>
<td class="r2o">65.44</td>
<td class="r2o">26.13</td>
<td class="r2o">4.31</td>
<td class="r2o">0.09</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7582361">zbogi</a></td>
<td class="r1e">2155</td>
<td class="r1e">308</td>
<td class="r1e">$20.13</td>
<td class="r2e">66.64</td>
<td class="r2e">21.99</td>
<td class="r2e">1.83</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8365685">pparys</a></td>
<td class="r1o">2104</td>
<td class="r1o">329</td>
<td class="r1o">$14.79</td>
<td class="r2o">59.77</td>
<td class="r2o">17.06</td>
<td class="r2o">1.25</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7501828">BjarkeDahlEbert</a></td>
<td class="r1e">2083</td>
<td class="r1e">353</td>
<td class="r1e">$14.09</td>
<td class="r2e">56.79</td>
<td class="r2e">15.80</td>
<td class="r2e">1.24</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8349097">hauser</a></td>
<td class="r1o">2143</td>
<td class="r1o">486</td>
<td class="r1o">$32.17</td>
<td class="r2o">59.79</td>
<td class="r2o">22.73</td>
<td class="r2o">4.08</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7264865">bogklug</a></td>
<td class="r1e">2090</td>
<td class="r1e">273</td>
<td class="r1e">$9.56</td>
<td class="r2e">59.74</td>
<td class="r2e">13.89</td>
<td class="r2e">0.52</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=251223">along</a></td>
<td class="r1o">2090</td>
<td class="r1o">440</td>
<td class="r1o">$20.90</td>
<td class="r2o">56.09</td>
<td class="r2o">18.16</td>
<td class="r2o">2.35</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7505977">maze_pallas</a></td>
<td class="r1e">2158</td>
<td class="r1e">373</td>
<td class="r1e">$26.19</td>
<td class="r2e">64.19</td>
<td class="r2e">23.15</td>
<td class="r2e">2.91</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=303185">Cosmin.ro</a></td>
<td class="r1o">2136</td>
<td class="r1o">495</td>
<td class="r1o">$31.61</td>
<td class="r2o">59.07</td>
<td class="r2o">22.25</td>
<td class="r2o">4.01</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=287979">Oblok</a></td>
<td class="r1e">2012</td>
<td class="r1e">395</td>
<td class="r1e">$10.22</td>
<td class="r2e">48.91</td>
<td class="r2e">11.75</td>
<td class="r2e">0.87</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7368306">Matei</a></td>
<td class="r1o">2103</td>
<td class="r1o">352</td>
<td class="r1o">$16.34</td>
<td class="r2o">59.03</td>
<td class="r2o">17.53</td>
<td class="r2o">1.51</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8398526">Tomy</a></td>
<td class="r1e">2050</td>
<td class="r1e">279</td>
<td class="r1e">$6.85</td>
<td class="r2e">53.89</td>
<td class="r2e">10.54</td>
<td class="r2e">0.32</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8474430">kupo</a></td>
<td class="r1o">2078</td>
<td class="r1o">335</td>
<td class="r1o">$12.39</td>
<td class="r2o">56.56</td>
<td class="r2o">14.88</td>
<td class="r2o">0.99</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=251832">dark_lord</a></td>
<td class="r1e">2018</td>
<td class="r1e">256</td>
<td class="r1e">$4.15</td>
<td class="r2e">49.26</td>
<td class="r2e">7.18</td>
<td class="r2e">0.11</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10332088">martinp534</a></td>
<td class="r1o">2142</td>
<td class="r1o">319</td>
<td class="r1o">$19.06</td>
<td class="r2o">64.59</td>
<td class="r2o">20.72</td>
<td class="r2o">1.74</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=111202">ColinMacLeod</a></td>
<td class="r1e">1997</td>
<td class="r1e">368</td>
<td class="r1e">$7.83</td>
<td class="r2e">47.21</td>
<td class="r2e">10.04</td>
<td class="r2e">0.56</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=289706">mickle</a></td>
<td class="r1o">2009</td>
<td class="r1o">270</td>
<td class="r1o">$4.28</td>
<td class="r2o">47.97</td>
<td class="r2o">7.21</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=260952">UFP2161</a></td>
<td class="r1e">2004</td>
<td class="r1e">269</td>
<td class="r1e">$4.03</td>
<td class="r2e">47.22</td>
<td class="r2e">6.86</td>
<td class="r2e">0.12</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=9964455">Crush</a></td>
<td class="r1o">2110</td>
<td class="r1o">431</td>
<td class="r1o">$23.00</td>
<td class="r2o">58.04</td>
<td class="r2o">19.57</td>
<td class="r2o">2.63</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=158333">dvickrey</a></td>
<td class="r1e">1993</td>
<td class="r1e">392</td>
<td class="r1e">$8.74</td>
<td class="r2e">46.97</td>
<td class="r2e">10.51</td>
<td class="r2e">0.70</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=2058469">robymus</a></td>
<td class="r1o">2027</td>
<td class="r1o">306</td>
<td class="r1o">$6.72</td>
<td class="r2o">50.55</td>
<td class="r2o">9.88</td>
<td class="r2o">0.36</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=269025">assembler</a></td>
<td class="r1e">1969</td>
<td class="r1e">246</td>
<td class="r1e">$2.19</td>
<td class="r2e">41.36</td>
<td class="r2e">4.07</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=269515">valeriy</a></td>
<td class="r1o">2012</td>
<td class="r1o">288</td>
<td class="r1o">$5.12</td>
<td class="r2o">48.51</td>
<td class="r2o">8.15</td>
<td class="r2o">0.21</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=138663">Sord</a></td>
<td class="r1e">2011</td>
<td class="r1e">319</td>
<td class="r1e">$6.39</td>
<td class="r2e">48.53</td>
<td class="r2e">9.27</td>
<td class="r2e">0.35</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7442498">marek.cygan</a></td>
<td class="r1o">1969</td>
<td class="r1o">322</td>
<td class="r1o">$4.49</td>
<td class="r2o">43.36</td>
<td class="r2o">6.93</td>
<td class="r2o">0.20</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=293390">Jumping John</a></td>
<td class="r1e">1980</td>
<td class="r1e">272</td>
<td class="r1e">$3.24</td>
<td class="r2e">43.75</td>
<td class="r2e">5.63</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10395795">Sumudu</a></td>
<td class="r1o">1998</td>
<td class="r1o">339</td>
<td class="r1o">$6.56</td>
<td class="r2o">47.09</td>
<td class="r2o">9.16</td>
<td class="r2o">0.40</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8394868">rem</a></td>
<td class="r1e">2051</td>
<td class="r1e">323</td>
<td class="r1e">$9.26</td>
<td class="r2e">53.49</td>
<td class="r2e">12.28</td>
<td class="r2e">0.62</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7472513">szd714</a></td>
<td class="r1o">1954</td>
<td class="r1o">380</td>
<td class="r1o">$6.01</td>
<td class="r2o">42.80</td>
<td class="r2o">8.05</td>
<td class="r2o">0.40</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7440483">moggy</a></td>
<td class="r1e">1888</td>
<td class="r1e">191</td>
<td class="r1e">$0.25</td>
<td class="r2e">24.15</td>
<td class="r2e">0.49</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=276749">jonderry</a></td>
<td class="r1o">2011</td>
<td class="r1o">352</td>
<td class="r1o">$7.95</td>
<td class="r2o">48.67</td>
<td class="r2o">10.40</td>
<td class="r2o">0.55</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=278460">TAG</a></td>
<td class="r1e">2015</td>
<td class="r1e">421</td>
<td class="r1e">$11.87</td>
<td class="r2e">49.27</td>
<td class="r2e">12.61</td>
<td class="r2e">1.11</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=263379">StefanPochmann</a></td>
<td class="r1o">2013</td>
<td class="r1o">467</td>
<td class="r1o">$14.25</td>
<td class="r2o">49.16</td>
<td class="r2o">13.55</td>
<td class="r2o">1.49</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=273112">WhiteShadow</a></td>
<td class="r1e">1896</td>
<td class="r1e">276</td>
<td class="r1e">$1.36</td>
<td class="r2e">32.30</td>
<td class="r2e">2.54</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7581406">konqueror</a></td>
<td class="r1o">1982</td>
<td class="r1o">332</td>
<td class="r1o">$5.44</td>
<td class="r2o">45.11</td>
<td class="r2o">7.98</td>
<td class="r2o">0.29</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=293387">abiczo</a></td>
<td class="r1e">1953</td>
<td class="r1e">368</td>
<td class="r1e">$5.50</td>
<td class="r2e">42.47</td>
<td class="r2e">7.64</td>
<td class="r2e">0.34</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7485898">Andrew_Lazarev</a></td>
<td class="r1o">1965</td>
<td class="r1o">595</td>
<td class="r1o">$16.89</td>
<td class="r2o">46.12</td>
<td class="r2o">13.44</td>
<td class="r2o">1.98</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=299706">cruizza</a></td>
<td class="r1e">1914</td>
<td class="r1e">274</td>
<td class="r1e">$1.63</td>
<td class="r2e">34.57</td>
<td class="r2e">3.00</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=297766">Veloso</a></td>
<td class="r1o">1915</td>
<td class="r1o">428</td>
<td class="r1o">$6.06</td>
<td class="r2o">40.04</td>
<td class="r2o">7.61</td>
<td class="r2o">0.45</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10116099">blekdrago</a></td>
<td class="r1e">1908</td>
<td class="r1e">549</td>
<td class="r1e">$10.57</td>
<td class="r2e">41.70</td>
<td class="r2e">10.11</td>
<td class="r2e">1.09</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7584235">agh</a></td>
<td class="r1o">1968</td>
<td class="r1o">293</td>
<td class="r1o">$3.48</td>
<td class="r2o">42.59</td>
<td class="r2o">5.83</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=344263">tc</a></td>
<td class="r1e">1874</td>
<td class="r1e">227</td>
<td class="r1e">$0.47</td>
<td class="r2e">25.66</td>
<td class="r2e">0.92</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7296000">connect4</a></td>
<td class="r1o">1914</td>
<td class="r1o">451</td>
<td class="r1o">$6.88</td>
<td class="r2o">40.45</td>
<td class="r2o">8.15</td>
<td class="r2o">0.56</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7459326">jdmetz</a></td>
<td class="r1e">1891</td>
<td class="r1e">340</td>
<td class="r1e">$2.57</td>
<td class="r2e">34.90</td>
<td class="r2e">4.22</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=309786">Yi_Zhang</a></td>
<td class="r1o">1880</td>
<td class="r1o">317</td>
<td class="r1o">$1.85</td>
<td class="r2o">32.60</td>
<td class="r2o">3.23</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=306542">riveria</a></td>
<td class="r1e">1957</td>
<td class="r1e">368</td>
<td class="r1e">$5.68</td>
<td class="r2e">42.89</td>
<td class="r2e">7.83</td>
<td class="r2e">0.35</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7584391">Krumble</a></td>
<td class="r1o">1900</td>
<td class="r1o">423</td>
<td class="r1o">$5.26</td>
<td class="r2o">38.56</td>
<td class="r2o">6.86</td>
<td class="r2o">0.37</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=273025">frypan</a></td>
<td class="r1e">1845</td>
<td class="r1e">333</td>
<td class="r1e">$1.55</td>
<td class="r2e">29.65</td>
<td class="r2e">2.71</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10403994">ipkn</a></td>
<td class="r1o">1944</td>
<td class="r1o">323</td>
<td class="r1o">$3.60</td>
<td class="r2o">40.36</td>
<td class="r2o">5.76</td>
<td class="r2o">0.14</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=349226">viktoras</a></td>
<td class="r1e">1874</td>
<td class="r1e">208</td>
<td class="r1e">$0.30</td>
<td class="r2e">23.81</td>
<td class="r2e">0.60</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=302053">oldbig</a></td>
<td class="r1o">1837</td>
<td class="r1o">660</td>
<td class="r1o">$11.02</td>
<td class="r2o">38.90</td>
<td class="r2o">9.55</td>
<td class="r2o">1.21</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=303882">aditsu</a></td>
<td class="r1e">1850</td>
<td class="r1e">301</td>
<td class="r1e">$1.12</td>
<td class="r2e">28.29</td>
<td class="r2e">2.07</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=282560">leadhyena_inran</a></td>
<td class="r1o">1857</td>
<td class="r1o">268</td>
<td class="r1o">$0.77</td>
<td class="r2o">26.81</td>
<td class="r2o">1.47</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8556047">dzetkulict</a></td>
<td class="r1e">1922</td>
<td class="r1e">415</td>
<td class="r1e">$5.89</td>
<td class="r2e">40.39</td>
<td class="r2e">7.56</td>
<td class="r2e">0.42</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7434314">amirshim</a></td>
<td class="r1o">1846</td>
<td class="r1o">314</td>
<td class="r1o">$1.26</td>
<td class="r2o">28.65</td>
<td class="r2o">2.29</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=159100">Googly</a></td>
<td class="r1e">1824</td>
<td class="r1e">352</td>
<td class="r1e">$1.55</td>
<td class="r2e">28.59</td>
<td class="r2e">2.67</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=294543">mortijingle</a></td>
<td class="r1o">1860</td>
<td class="r1o">336</td>
<td class="r1o">$1.85</td>
<td class="r2o">31.38</td>
<td class="r2o">3.17</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=307070">qsort</a></td>
<td class="r1e">1836</td>
<td class="r1e">277</td>
<td class="r1e">$0.68</td>
<td class="r2e">25.01</td>
<td class="r2e">1.31</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=271496">jfreyss</a></td>
<td class="r1o">1791</td>
<td class="r1o">368</td>
<td class="r1o">$1.36</td>
<td class="r2o">26.40</td>
<td class="r2o">2.33</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=268904">szymcio</a></td>
<td class="r1e">1904</td>
<td class="r1e">314</td>
<td class="r1e">$2.27</td>
<td class="r2e">35.25</td>
<td class="r2e">3.89</td>
<td class="r2e">0.06</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=2059666">frane</a></td>
<td class="r1o">1846</td>
<td class="r1o">405</td>
<td class="r1o">$3.05</td>
<td class="r2o">33.09</td>
<td class="r2o">4.52</td>
<td class="r2o">0.16</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7313385">gunnark</a></td>
<td class="r1e">1988</td>
<td class="r1e">384</td>
<td class="r1e">$8.03</td>
<td class="r2e">46.39</td>
<td class="r2e">9.99</td>
<td class="r2e">0.61</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7358786">hagman</a></td>
<td class="r1o">1927</td>
<td class="r1o">363</td>
<td class="r1o">$4.27</td>
<td class="r2o">39.58</td>
<td class="r2o">6.28</td>
<td class="r2o">0.23</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=9947660">Chicken1</a></td>
<td class="r1e">1837</td>
<td class="r1e">339</td>
<td class="r1e">$1.53</td>
<td class="r2e">29.16</td>
<td class="r2e">2.67</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10052926">shuniu</a></td>
<td class="r1o">1798</td>
<td class="r1o">242</td>
<td class="r1o">$0.20</td>
<td class="r2o">17.70</td>
<td class="r2o">0.40</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=310431">sean_henderson</a></td>
<td class="r1e">1834</td>
<td class="r1e">377</td>
<td class="r1e">$2.17</td>
<td class="r2e">30.80</td>
<td class="r2e">3.50</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7446397">rotoZOOM</a></td>
<td class="r1o">1843</td>
<td class="r1o">436</td>
<td class="r1o">$3.76</td>
<td class="r2o">33.97</td>
<td class="r2o">5.18</td>
<td class="r2o">0.23</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7390467">lovro</a></td>
<td class="r1e">1880</td>
<td class="r1e">589</td>
<td class="r1e">$10.60</td>
<td class="r2e">40.40</td>
<td class="r2e">9.79</td>
<td class="r2e">1.12</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8391762">ltank</a></td>
<td class="r1o">1785</td>
<td class="r1o">323</td>
<td class="r1o">$0.74</td>
<td class="r2o">23.06</td>
<td class="r2o">1.39</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=269078">dzadza</a></td>
<td class="r1e">1790</td>
<td class="r1e">251</td>
<td class="r1e">$0.22</td>
<td class="r2e">17.72</td>
<td class="r2e">0.44</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=301210">tgu</a></td>
<td class="r1o">1815</td>
<td class="r1o">377</td>
<td class="r1o">$1.84</td>
<td class="r2o">29.04</td>
<td class="r2o">3.03</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8348950">nerx</a></td>
<td class="r1e">1789</td>
<td class="r1e">208</td>
<td class="r1e">$0.06</td>
<td class="r2e">13.18</td>
<td class="r2e">0.12</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=152342">kyky</a></td>
<td class="r1o">1842</td>
<td class="r1o">347</td>
<td class="r1o">$1.75</td>
<td class="r2o">30.09</td>
<td class="r2o">2.98</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=289907">Terrax</a></td>
<td class="r1e">1775</td>
<td class="r1e">272</td>
<td class="r1e">$0.28</td>
<td class="r2e">18.14</td>
<td class="r2e">0.56</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=294034">centipede80</a></td>
<td class="r1o">1804</td>
<td class="r1o">434</td>
<td class="r1o">$2.75</td>
<td class="r2o">30.68</td>
<td class="r2o">4.03</td>
<td class="r2o">0.15</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7566945">jerky</a></td>
<td class="r1e">1753</td>
<td class="r1e">453</td>
<td class="r1e">$2.17</td>
<td class="r2e">27.53</td>
<td class="r2e">3.25</td>
<td class="r2e">0.11</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7503639">blackbeltcoder4</a></td>
<td class="r1o">1754</td>
<td class="r1o">318</td>
<td class="r1o">$0.49</td>
<td class="r2o">19.89</td>
<td class="r2o">0.94</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=261043">fpmc</a></td>
<td class="r1e">1743</td>
<td class="r1e">367</td>
<td class="r1e">$0.85</td>
<td class="r2e">22.26</td>
<td class="r2e">1.53</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7272306">adams</a></td>
<td class="r1o">1811</td>
<td class="r1o">518</td>
<td class="r1o">$5.05</td>
<td class="r2o">34.10</td>
<td class="r2o">6.03</td>
<td class="r2o">0.41</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=156990">lanenal</a></td>
<td class="r1e">1750</td>
<td class="r1e">316</td>
<td class="r1e">$0.46</td>
<td class="r2e">19.39</td>
<td class="r2e">0.87</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=299904">mishagam</a></td>
<td class="r1o">1707</td>
<td class="r1o">241</td>
<td class="r1o">$0.04</td>
<td class="r2o">9.58</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=345006">DAle</a></td>
<td class="r1e">1757</td>
<td class="r1e">364</td>
<td class="r1e">$0.94</td>
<td class="r2e">23.23</td>
<td class="r2e">1.68</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8349001">belzebub</a></td>
<td class="r1o">1729</td>
<td class="r1o">388</td>
<td class="r1o">$0.96</td>
<td class="r2o">22.41</td>
<td class="r2o">1.67</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10302134">LinusLee</a></td>
<td class="r1e">1705</td>
<td class="r1e">326</td>
<td class="r1e">$0.32</td>
<td class="r2e">16.47</td>
<td class="r2e">0.62</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10015783">anikov</a></td>
<td class="r1o">1686</td>
<td class="r1o">350</td>
<td class="r1o">$0.38</td>
<td class="r2o">16.78</td>
<td class="r2o">0.72</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=278167">Merlin[Kyiv]</a></td>
<td class="r1e">1681</td>
<td class="r1e">276</td>
<td class="r1e">$0.08</td>
<td class="r2e">10.81</td>
<td class="r2e">0.16</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=283374">indigo9</a></td>
<td class="r1o">1723</td>
<td class="r1o">315</td>
<td class="r1o">$0.33</td>
<td class="r2o">17.05</td>
<td class="r2o">0.63</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10398672">tosomjafakt</a></td>
<td class="r1e">1702</td>
<td class="r1e">305</td>
<td class="r1e">$0.21</td>
<td class="r2e">14.65</td>
<td class="r2e">0.41</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7584555">abi_k</a></td>
<td class="r1o">1807</td>
<td class="r1o">406</td>
<td class="r1o">$2.24</td>
<td class="r2o">29.72</td>
<td class="r2o">3.48</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=293575">nealzane</a></td>
<td class="r1e">1675</td>
<td class="r1e">379</td>
<td class="r1e">$0.52</td>
<td class="r2e">17.91</td>
<td class="r2e">0.95</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8359547">Jasko</a></td>
<td class="r1o">1694</td>
<td class="r1o">569</td>
<td class="r1o">$3.28</td>
<td class="r2o">28.13</td>
<td class="r2o">4.13</td>
<td class="r2o">0.24</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=277492">InsaneParadox</a></td>
<td class="r1e">1684</td>
<td class="r1e">440</td>
<td class="r1e">$1.12</td>
<td class="r2e">22.02</td>
<td class="r2e">1.86</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7453062">mcphee</a></td>
<td class="r1o">1728</td>
<td class="r1o">245</td>
<td class="r1o">$0.07</td>
<td class="r2o">11.51</td>
<td class="r2o">0.14</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=150905">solman</a></td>
<td class="r1e">1693</td>
<td class="r1e">404</td>
<td class="r1e">$0.83</td>
<td class="r2e">20.68</td>
<td class="r2e">1.45</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=284168">wackes</a></td>
<td class="r1o">1637</td>
<td class="r1o">274</td>
<td class="r1o">$0.04</td>
<td class="r2o">7.99</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7443050">mics</a></td>
<td class="r1e">1702</td>
<td class="r1e">462</td>
<td class="r1e">$1.59</td>
<td class="r2e">24.33</td>
<td class="r2e">2.47</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=156485">the_one_smiley</a></td>
<td class="r1o">1657</td>
<td class="r1o">318</td>
<td class="r1o">$0.15</td>
<td class="r2o">12.50</td>
<td class="r2o">0.30</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8440049">bolu</a></td>
<td class="r1e">1656</td>
<td class="r1e">404</td>
<td class="r1e">$0.60</td>
<td class="r2e">18.16</td>
<td class="r2e">1.07</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7348444">DimaGer</a></td>
<td class="r1o">1670</td>
<td class="r1o">524</td>
<td class="r1o">$2.08</td>
<td class="r2o">25.00</td>
<td class="r2o">2.95</td>
<td class="r2o">0.12</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=300003">nike</a></td>
<td class="r1e">1644</td>
<td class="r1e">396</td>
<td class="r1e">$0.48</td>
<td class="r2e">16.91</td>
<td class="r2e">0.88</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7462698">kolodrub</a></td>
<td class="r1o">1627</td>
<td class="r1o">372</td>
<td class="r1o">$0.29</td>
<td class="r2o">14.35</td>
<td class="r2o">0.55</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=301395">HardCoder</a></td>
<td class="r1e">1615</td>
<td class="r1e">302</td>
<td class="r1e">$0.06</td>
<td class="r2e">8.86</td>
<td class="r2e">0.12</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=290449">ceturc</a></td>
<td class="r1o">1612</td>
<td class="r1o">377</td>
<td class="r1o">$0.27</td>
<td class="r2o">13.77</td>
<td class="r2o">0.51</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8506476">mdavidlevy</a></td>
<td class="r1e">1612</td>
<td class="r1e">242</td>
<td class="r1e">$0.01</td>
<td class="r2e">4.55</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=296466">FatClimber</a></td>
<td class="r1o">1610</td>
<td class="r1o">252</td>
<td class="r1o">$0.01</td>
<td class="r2o">5.13</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7433858">liympanda</a></td>
<td class="r1e">1853</td>
<td class="r1e">556</td>
<td class="r1e">$7.93</td>
<td class="r2e">37.97</td>
<td class="r2e">8.17</td>
<td class="r2e">0.76</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8579713">nuttapong26</a></td>
<td class="r1o">1654</td>
<td class="r1o">334</td>
<td class="r1o">$0.20</td>
<td class="r2o">13.47</td>
<td class="r2o">0.40</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7442489">BEHiker57W</a></td>
<td class="r1e">1687</td>
<td class="r1e">450</td>
<td class="r1e">$1.27</td>
<td class="r2e">22.73</td>
<td class="r2e">2.05</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7555099">Rostislav</a></td>
<td class="r1o">1590</td>
<td class="r1o">332</td>
<td class="r1o">$0.09</td>
<td class="r2o">9.62</td>
<td class="r2o">0.18</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7390772">duner</a></td>
<td class="r1e">1578</td>
<td class="r1e">318</td>
<td class="r1e">$0.05</td>
<td class="r2e">8.11</td>
<td class="r2e">0.11</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10124761">Vash</a></td>
<td class="r1o">1578</td>
<td class="r1o">322</td>
<td class="r1o">$0.06</td>
<td class="r2o">8.37</td>
<td class="r2o">0.12</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=289309">qixin99</a></td>
<td class="r1e">1685</td>
<td class="r1e">461</td>
<td class="r1e">$1.38</td>
<td class="r2e">23.14</td>
<td class="r2e">2.19</td>
<td class="r2e">0.06</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=260984">EnckePan</a></td>
<td class="r1o">1610</td>
<td class="r1o">401</td>
<td class="r1o">$0.37</td>
<td class="r2o">15.13</td>
<td class="r2o">0.69</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10339687">naive</a></td>
<td class="r1e">1829</td>
<td class="r1e">504</td>
<td class="r1e">$5.25</td>
<td class="r2e">35.00</td>
<td class="r2e">6.29</td>
<td class="r2e">0.42</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=8392846">tripleCross</a></td>
<td class="r1o">1563</td>
<td class="r1o">298</td>
<td class="r1o">$0.02</td>
<td class="r2o">6.17</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7454301">paranoia</a></td>
<td class="r1e">1682</td>
<td class="r1e">385</td>
<td class="r1e">$0.60</td>
<td class="r2e">18.77</td>
<td class="r2e">1.08</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7546003">dmytro</a></td>
<td class="r1o">1591</td>
<td class="r1o">328</td>
<td class="r1o">$0.08</td>
<td class="r2o">9.41</td>
<td class="r2o">0.16</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=266698">vietchau</a></td>
<td class="r1e">1528</td>
<td class="r1e">304</td>
<td class="r1e">$0.02</td>
<td class="r2e">5.21</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=280198">alanm</a></td>
<td class="r1o">1561</td>
<td class="r1o">370</td>
<td class="r1o">$0.14</td>
<td class="r2o">10.59</td>
<td class="r2o">0.27</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=7400531">mafattah</a></td>
<td class="r1e">1504</td>
<td class="r1e">491</td>
<td class="r1e">$0.45</td>
<td class="r2e">14.50</td>
<td class="r2e">0.80</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=309381">esessoms</a></td>
<td class="r1o">1510</td>
<td class="r1o">363</td>
<td class="r1o">$0.07</td>
<td class="r2o">7.88</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?tc?module=MemberProfile&amp;cr=10422346">Baobab</a></td>
<td class="r1e">1560</td>
<td class="r1e">359</td>
<td class="r1e">$0.11</td>
<td class="r2e">9.86</td>
<td class="r2e">0.21</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="6">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 3</td>
<td class="rH2">Online 4</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=10066581">bugloaf</a></td>
<td class="r1o">1480</td>
<td class="r1o">368</td>
<td class="r1o">$0.05</td>
<td class="r2o">7.01</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=7548200">sindu</a></td>
<td class="r1e">1463</td>
<td class="r1e">268</td>
<td class="r1e">$0.00</td>
<td class="r2e">1.87</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=8361108">bratell</a></td>
<td class="r1o">1480</td>
<td class="r1o">347</td>
<td class="r1o">$0.03</td>
<td class="r2o">5.89</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=299221">harisuthan</a></td>
<td class="r1e">1447</td>
<td class="r1e">422</td>
<td class="r1e">$0.10</td>
<td class="r2e">8.60</td>
<td class="r2e">0.20</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=282718">Rustyoldman</a></td>
<td class="r1o">1421</td>
<td class="r1o">462</td>
<td class="r1o">$0.15</td>
<td class="r2o">9.61</td>
<td class="r2o">0.29</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=8497166">SuperRaskao</a></td>
<td class="r1e">1437</td>
<td class="r1e">374</td>
<td class="r1e">$0.03</td>
<td class="r2e">5.86</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=8524863">ZarkT</a></td>
<td class="r1o">1362</td>
<td class="r1o">303</td>
<td class="r1o">$0.00</td>
<td class="r2o">1.48</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/stat?tc?module=MemberProfile&amp;cr=7518141">ucsbtex</a></td>
<td class="r1e">1250</td>
<td class="r1e">424</td>
<td class="r1e">$0.01</td>
<td class="r2e">3.42</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>

</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
