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
               <jsp:param name="selectedRound" value="round1"/>
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
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=144400">tomek</a></td>
<td class="rt1o" align="right">3505</td>
<td class="rt1o" align="right">226</td>
<td class="rt1o" align="right">$18 782.96</td>
<td class="rt2o" align="right">100.00</td>
<td class="rt2o" align="right">100.00</td>
<td class="rt2o" align="right">100.00</td>
<td class="rt2o" align="right">16.56</td>
<td class="rt2o" align="right">12.39</td>
<td class="rt2o" align="right">95.41</td>
<td class="rt3o" align="right">0.67</td>
<td class="rt3o" align="right">5.46</td>
<td class="rt3o" align="right">23.56</td>
<td class="rt3o" align="right">65.72</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td class="rt1e" align="right">3210</td>
<td class="rt1e" align="right">307</td>
<td class="rt1e" align="right">$7 413.06</td>
<td class="rt2e" align="right">100.00</td>
<td class="rt2e" align="right">99.99</td>
<td class="rt2e" align="right">99.69</td>
<td class="rt2e" align="right">34.80</td>
<td class="rt2e" align="right">15.45</td>
<td class="rt2e" align="right">74.03</td>
<td class="rt3e" align="right">7.55</td>
<td class="rt3e" align="right">21.33</td>
<td class="rt3e" align="right">30.49</td>
<td class="rt3e" align="right">14.66</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=270505">John Dethridge</a></td>
<td class="rt1o" align="right">3108</td>
<td class="rt1o" align="right">468</td>
<td class="rt1o" align="right">$5 060.74</td>
<td class="rt2o" align="right">99.83</td>
<td class="rt2o" align="right">98.86</td>
<td class="rt2o" align="right">93.60</td>
<td class="rt2o" align="right">31.33</td>
<td class="rt2o" align="right">12.11</td>
<td class="rt2o" align="right">55.23</td>
<td class="rt3o" align="right">12.75</td>
<td class="rt3o" align="right">16.37</td>
<td class="rt3o" align="right">14.84</td>
<td class="rt3o" align="right">11.26</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152347">ZorbaTHut</a></td>
<td class="rt1e" align="right">3040</td>
<td class="rt1e" align="right">255</td>
<td class="rt1e" align="right">$3 060.51</td>
<td class="rt2e" align="right">100.00</td>
<td class="rt2e" align="right">100.00</td>
<td class="rt2e" align="right">99.55</td>
<td class="rt2e" align="right">54.66</td>
<td class="rt2e" align="right">15.61</td>
<td class="rt2e" align="right">47.56</td>
<td class="rt3e" align="right">10.33</td>
<td class="rt3e" align="right">19.94</td>
<td class="rt3e" align="right">14.17</td>
<td class="rt3e" align="right">3.12</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262056">mathijs</a></td>
<td class="rt1o" align="right">2749</td>
<td class="rt1o" align="right">411</td>
<td class="rt1o" align="right">$693.03</td>
<td class="rt2o" align="right">99.32</td>
<td class="rt2o" align="right">95.62</td>
<td class="rt2o" align="right">79.67</td>
<td class="rt2o" align="right">32.13</td>
<td class="rt2o" align="right">4.41</td>
<td class="rt2o" align="right">14.64</td>
<td class="rt3o" align="right">7.15</td>
<td class="rt3o" align="right">4.55</td>
<td class="rt3o" align="right">2.29</td>
<td class="rt3o" align="right">0.65</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=311170">bladerunner</a></td>
<td class="rt1e" align="right">2806</td>
<td class="rt1e" align="right">312</td>
<td class="rt1e" align="right">$475.06</td>
<td class="rt2e" align="right">99.97</td>
<td class="rt2e" align="right">99.37</td>
<td class="rt2e" align="right">91.94</td>
<td class="rt2e" align="right">46.14</td>
<td class="rt2e" align="right">5.75</td>
<td class="rt2e" align="right">10.47</td>
<td class="rt3e" align="right">4.70</td>
<td class="rt3e" align="right">3.74</td>
<td class="rt3e" align="right">1.72</td>
<td class="rt3e" align="right">0.31</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262936">dgarthur</a></td>
<td class="rt1o" align="right">2880</td>
<td class="rt1o" align="right">352</td>
<td class="rt1o" align="right">$854.09</td>
<td class="rt2o" align="right">99.94</td>
<td class="rt2o" align="right">99.22</td>
<td class="rt2o" align="right">92.48</td>
<td class="rt2o" align="right">51.80</td>
<td class="rt2o" align="right">9.86</td>
<td class="rt2o" align="right">15.59</td>
<td class="rt3o" align="right">6.10</td>
<td class="rt3o" align="right">5.40</td>
<td class="rt3o" align="right">3.16</td>
<td class="rt3o" align="right">0.93</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287496">bstanescu</a></td>
<td class="rt1e" align="right">2748</td>
<td class="rt1e" align="right">571</td>
<td class="rt1e" align="right">$867.31</td>
<td class="rt2e" align="right">96.24</td>
<td class="rt2e" align="right">86.71</td>
<td class="rt2e" align="right">65.61</td>
<td class="rt2e" align="right">23.11</td>
<td class="rt2e" align="right">4.60</td>
<td class="rt2e" align="right">14.67</td>
<td class="rt3e" align="right">7.11</td>
<td class="rt3e" align="right">3.75</td>
<td class="rt3e" align="right">2.36</td>
<td class="rt3e" align="right">1.45</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
<td class="rt1o" align="right">2742</td>
<td class="rt1o" align="right">347</td>
<td class="rt1o" align="right">$473.59</td>
<td class="rt2o" align="right">99.81</td>
<td class="rt2o" align="right">97.97</td>
<td class="rt2o" align="right">85.12</td>
<td class="rt2o" align="right">35.17</td>
<td class="rt2o" align="right">3.80</td>
<td class="rt2o" align="right">10.99</td>
<td class="rt3o" align="right">5.38</td>
<td class="rt3o" align="right">3.73</td>
<td class="rt3o" align="right">1.60</td>
<td class="rt3o" align="right">0.29</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8355516">Eryx</a></td>
<td class="rt1e" align="right">2673</td>
<td class="rt1e" align="right">369</td>
<td class="rt1e" align="right">$336.82</td>
<td class="rt2e" align="right">99.45</td>
<td class="rt2e" align="right">95.70</td>
<td class="rt2e" align="right">77.28</td>
<td class="rt2e" align="right">26.26</td>
<td class="rt2e" align="right">2.34</td>
<td class="rt2e" align="right">8.38</td>
<td class="rt3e" align="right">4.46</td>
<td class="rt3e" align="right">2.70</td>
<td class="rt3e" align="right">1.04</td>
<td class="rt3e" align="right">0.18</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="rt1o" align="right">2625</td>
<td class="rt1o" align="right">303</td>
<td class="rt1o" align="right">$157.95</td>
<td class="rt2o" align="right">99.83</td>
<td class="rt2o" align="right">97.55</td>
<td class="rt2o" align="right">79.47</td>
<td class="rt2o" align="right">25.17</td>
<td class="rt2o" align="right">1.28</td>
<td class="rt2o" align="right">4.57</td>
<td class="rt3o" align="right">2.65</td>
<td class="rt3o" align="right">1.47</td>
<td class="rt3o" align="right">0.42</td>
<td class="rt3o" align="right">0.04</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=2058672">dary</a></td>
<td class="rt1e" align="right">2525</td>
<td class="rt1e" align="right">341</td>
<td class="rt1e" align="right">$75.70</td>
<td class="rt2e" align="right">98.98</td>
<td class="rt2e" align="right">92.25</td>
<td class="rt2e" align="right">63.94</td>
<td class="rt2e" align="right">15.25</td>
<td class="rt2e" align="right">0.61</td>
<td class="rt2e" align="right">2.36</td>
<td class="rt3e" align="right">1.52</td>
<td class="rt3e" align="right">0.65</td>
<td class="rt3e" align="right">0.17</td>
<td class="rt3e" align="right">0.02</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287568">tjq</a></td>
<td class="rt1o" align="right">2599</td>
<td class="rt1o" align="right">533</td>
<td class="rt1o" align="right">$316.69</td>
<td class="rt2o" align="right">94.80</td>
<td class="rt2o" align="right">81.90</td>
<td class="rt2o" align="right">55.58</td>
<td class="rt2o" align="right">15.64</td>
<td class="rt2o" align="right">1.94</td>
<td class="rt2o" align="right">6.86</td>
<td class="rt3o" align="right">3.89</td>
<td class="rt3o" align="right">1.74</td>
<td class="rt3o" align="right">0.86</td>
<td class="rt3o" align="right">0.37</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=345049">aneubeck</a></td>
<td class="rt1e" align="right">2499</td>
<td class="rt1e" align="right">413</td>
<td class="rt1e" align="right">$74.99</td>
<td class="rt2e" align="right">96.81</td>
<td class="rt2e" align="right">85.18</td>
<td class="rt2e" align="right">54.40</td>
<td class="rt2e" align="right">12.40</td>
<td class="rt2e" align="right">0.69</td>
<td class="rt2e" align="right">2.19</td>
<td class="rt3e" align="right">1.42</td>
<td class="rt3e" align="right">0.56</td>
<td class="rt3e" align="right">0.18</td>
<td class="rt3e" align="right">0.03</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307060">AdrianKuegel</a></td>
<td class="rt1o" align="right">2505</td>
<td class="rt1o" align="right">403</td>
<td class="rt1o" align="right">$70.08</td>
<td class="rt2o" align="right">97.22</td>
<td class="rt2o" align="right">86.35</td>
<td class="rt2o" align="right">55.90</td>
<td class="rt2o" align="right">12.71</td>
<td class="rt2o" align="right">0.69</td>
<td class="rt2o" align="right">2.06</td>
<td class="rt3o" align="right">1.33</td>
<td class="rt3o" align="right">0.53</td>
<td class="rt3o" align="right">0.17</td>
<td class="rt3o" align="right">0.03</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287105">lars</a></td>
<td class="rt1e" align="right">2610</td>
<td class="rt1e" align="right">444</td>
<td class="rt1e" align="right">$214.84</td>
<td class="rt2e" align="right">97.58</td>
<td class="rt2e" align="right">88.82</td>
<td class="rt2e" align="right">63.91</td>
<td class="rt2e" align="right">18.65</td>
<td class="rt2e" align="right">1.80</td>
<td class="rt2e" align="right">5.21</td>
<td class="rt3e" align="right">2.98</td>
<td class="rt3e" align="right">1.44</td>
<td class="rt3e" align="right">0.62</td>
<td class="rt3e" align="right">0.17</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286911">Xu Chuan</a></td>
<td class="rt1o" align="right">2439</td>
<td class="rt1o" align="right">320</td>
<td class="rt1o" align="right">$19.37</td>
<td class="rt2o" align="right">98.62</td>
<td class="rt2o" align="right">89.42</td>
<td class="rt2o" align="right">54.19</td>
<td class="rt2o" align="right">8.69</td>
<td class="rt2o" align="right">0.19</td>
<td class="rt2o" align="right">0.67</td>
<td class="rt3o" align="right">0.48</td>
<td class="rt3o" align="right">0.16</td>
<td class="rt3o" align="right">0.03</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7428266">Klinck</a></td>
<td class="rt1e" align="right">2451</td>
<td class="rt1e" align="right">296</td>
<td class="rt1e" align="right">$19.11</td>
<td class="rt2e" align="right">99.22</td>
<td class="rt2e" align="right">92.11</td>
<td class="rt2e" align="right">57.99</td>
<td class="rt2e" align="right">9.25</td>
<td class="rt2e" align="right">0.18</td>
<td class="rt2e" align="right">0.67</td>
<td class="rt3e" align="right">0.47</td>
<td class="rt3e" align="right">0.16</td>
<td class="rt3e" align="right">0.03</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=153902">evd</a></td>
<td class="rt1o" align="right">2487</td>
<td class="rt1o" align="right">336</td>
<td class="rt1o" align="right">$46.99</td>
<td class="rt2o" align="right">98.74</td>
<td class="rt2o" align="right">90.78</td>
<td class="rt2o" align="right">59.48</td>
<td class="rt2o" align="right">11.75</td>
<td class="rt2o" align="right">0.38</td>
<td class="rt2o" align="right">1.52</td>
<td class="rt3o" align="right">1.01</td>
<td class="rt3o" align="right">0.40</td>
<td class="rt3o" align="right">0.10</td>
<td class="rt3o" align="right">0.01</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307638">Wernie</a></td>
<td class="rt1e" align="right">2436</td>
<td class="rt1e" align="right">443</td>
<td class="rt1e" align="right">$70.10</td>
<td class="rt2e" align="right">94.38</td>
<td class="rt2e" align="right">78.28</td>
<td class="rt2e" align="right">44.91</td>
<td class="rt2e" align="right">8.73</td>
<td class="rt2e" align="right">0.44</td>
<td class="rt2e" align="right">2.11</td>
<td class="rt3e" align="right">1.42</td>
<td class="rt3e" align="right">0.51</td>
<td class="rt3e" align="right">0.16</td>
<td class="rt3e" align="right">0.03</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=113178">po</a></td>
<td class="rt1o" align="right">2463</td>
<td class="rt1o" align="right">241</td>
<td class="rt1o" align="right">$12.48</td>
<td class="rt2o" align="right">99.87</td>
<td class="rt2o" align="right">96.52</td>
<td class="rt2o" align="right">65.09</td>
<td class="rt2o" align="right">9.31</td>
<td class="rt2o" align="right">0.11</td>
<td class="rt2o" align="right">0.45</td>
<td class="rt3o" align="right">0.32</td>
<td class="rt3o" align="right">0.11</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7311097">m00tz</a></td>
<td class="rt1e" align="right">2402</td>
<td class="rt1e" align="right">410</td>
<td class="rt1e" align="right">$40.06</td>
<td class="rt2e" align="right">94.87</td>
<td class="rt2e" align="right">78.52</td>
<td class="rt2e" align="right">42.95</td>
<td class="rt2e" align="right">7.35</td>
<td class="rt2e" align="right">0.27</td>
<td class="rt2e" align="right">1.31</td>
<td class="rt3e" align="right">0.91</td>
<td class="rt3e" align="right">0.30</td>
<td class="rt3e" align="right">0.08</td>
<td class="rt3e" align="right">0.01</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260987">dangelo</a></td>
<td class="rt1o" align="right">2421</td>
<td class="rt1o" align="right">367</td>
<td class="rt1o" align="right">$31.34</td>
<td class="rt2o" align="right">96.95</td>
<td class="rt2o" align="right">83.93</td>
<td class="rt2o" align="right">48.11</td>
<td class="rt2o" align="right">8.01</td>
<td class="rt2o" align="right">0.23</td>
<td class="rt2o" align="right">1.05</td>
<td class="rt3o" align="right">0.74</td>
<td class="rt3o" align="right">0.25</td>
<td class="rt3o" align="right">0.06</td>
<td class="rt3o" align="right">0.01</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=251074">bmerry</a></td>
<td class="rt1e" align="right">2467</td>
<td class="rt1e" align="right">527</td>
<td class="rt1e" align="right">$126.12</td>
<td class="rt2e" align="right">91.85</td>
<td class="rt2e" align="right">73.95</td>
<td class="rt2e" align="right">43.25</td>
<td class="rt2e" align="right">9.38</td>
<td class="rt2e" align="right">0.77</td>
<td class="rt2e" align="right">3.27</td>
<td class="rt3e" align="right">2.09</td>
<td class="rt3e" align="right">0.77</td>
<td class="rt3e" align="right">0.31</td>
<td class="rt3e" align="right">0.10</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=264869">ante</a></td>
<td class="rt1o" align="right">2463</td>
<td class="rt1o" align="right">497</td>
<td class="rt1o" align="right">$101.10</td>
<td class="rt2o" align="right">92.93</td>
<td class="rt2o" align="right">75.91</td>
<td class="rt2o" align="right">44.57</td>
<td class="rt2o" align="right">9.53</td>
<td class="rt2o" align="right">0.69</td>
<td class="rt2o" align="right">2.75</td>
<td class="rt3o" align="right">1.78</td>
<td class="rt3o" align="right">0.65</td>
<td class="rt3o" align="right">0.25</td>
<td class="rt3o" align="right">0.07</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310430">gepa</a></td>
<td class="rt1e" align="right">2372</td>
<td class="rt1e" align="right">423</td>
<td class="rt1e" align="right">$27.02</td>
<td class="rt2e" align="right">93.45</td>
<td class="rt2e" align="right">74.86</td>
<td class="rt2e" align="right">38.70</td>
<td class="rt2e" align="right">6.10</td>
<td class="rt2e" align="right">0.21</td>
<td class="rt2e" align="right">0.89</td>
<td class="rt3e" align="right">0.64</td>
<td class="rt3e" align="right">0.20</td>
<td class="rt3e" align="right">0.05</td>
<td class="rt3e" align="right">0.01</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308953">Mike Mirzayanov</a></td>
<td class="rt1o" align="right">2384</td>
<td class="rt1o" align="right">474</td>
<td class="rt1o" align="right">$44.23</td>
<td class="rt2o" align="right">91.55</td>
<td class="rt2o" align="right">71.65</td>
<td class="rt2o" align="right">37.63</td>
<td class="rt2o" align="right">6.62</td>
<td class="rt2o" align="right">0.32</td>
<td class="rt2o" align="right">1.35</td>
<td class="rt3o" align="right">0.93</td>
<td class="rt3o" align="right">0.30</td>
<td class="rt3o" align="right">0.10</td>
<td class="rt3o" align="right">0.02</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td class="rt1e" align="right">2522</td>
<td class="rt1e" align="right">649</td>
<td class="rt1e" align="right">$267.46</td>
<td class="rt2e" align="right">88.83</td>
<td class="rt2e" align="right">69.57</td>
<td class="rt2e" align="right">41.89</td>
<td class="rt2e" align="right">9.89</td>
<td class="rt2e" align="right">1.36</td>
<td class="rt2e" align="right">5.47</td>
<td class="rt3e" align="right">3.24</td>
<td class="rt3e" align="right">1.20</td>
<td class="rt3e" align="right">0.64</td>
<td class="rt3e" align="right">0.39</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=261024">grotmol</a></td>
<td class="rt1o" align="right">2446</td>
<td class="rt1o" align="right">531</td>
<td class="rt1o" align="right">$104.01</td>
<td class="rt2o" align="right">91.04</td>
<td class="rt2o" align="right">72.11</td>
<td class="rt2o" align="right">41.01</td>
<td class="rt2o" align="right">8.61</td>
<td class="rt2o" align="right">0.68</td>
<td class="rt2o" align="right">2.73</td>
<td class="rt3o" align="right">1.77</td>
<td class="rt3o" align="right">0.62</td>
<td class="rt3o" align="right">0.25</td>
<td class="rt3o" align="right">0.08</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287979">Oblok</a></td>
<td class="rt1e" align="right">2218</td>
<td class="rt1e" align="right">330</td>
<td class="rt1e" align="right">$1.50</td>
<td class="rt2e" align="right">92.90</td>
<td class="rt2e" align="right">67.85</td>
<td class="rt2e" align="right">23.14</td>
<td class="rt2e" align="right">1.43</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.06</td>
<td class="rt3e" align="right">0.05</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471">haha</a></td>
<td class="rt1o" align="right">2342</td>
<td class="rt1o" align="right">453</td>
<td class="rt1o" align="right">$28.05</td>
<td class="rt2o" align="right">91.07</td>
<td class="rt2o" align="right">69.69</td>
<td class="rt2o" align="right">34.08</td>
<td class="rt2o" align="right">5.19</td>
<td class="rt2o" align="right">0.19</td>
<td class="rt2o" align="right">0.92</td>
<td class="rt3o" align="right">0.66</td>
<td class="rt3o" align="right">0.20</td>
<td class="rt3o" align="right">0.06</td>
<td class="rt3o" align="right">0.01</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=276749">jonderry</a></td>
<td class="rt1e" align="right">2202</td>
<td class="rt1e" align="right">296</td>
<td class="rt1e" align="right">$0.71</td>
<td class="rt2e" align="right">94.30</td>
<td class="rt2e" align="right">69.40</td>
<td class="rt2e" align="right">21.26</td>
<td class="rt2e" align="right">0.95</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt3e" align="right">0.02</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287266">jms137</a></td>
<td class="rt1o" align="right">2272</td>
<td class="rt1o" align="right">417</td>
<td class="rt1o" align="right">$10.90</td>
<td class="rt2o" align="right">90.20</td>
<td class="rt2o" align="right">65.98</td>
<td class="rt2o" align="right">27.81</td>
<td class="rt2o" align="right">3.12</td>
<td class="rt2o" align="right">0.06</td>
<td class="rt2o" align="right">0.40</td>
<td class="rt3o" align="right">0.30</td>
<td class="rt3o" align="right">0.08</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263396">Abednego</a></td>
<td class="rt1e" align="right">2192</td>
<td class="rt1e" align="right">528</td>
<td class="rt1e" align="right">$14.49</td>
<td class="rt2e" align="right">80.80</td>
<td class="rt2e" align="right">51.00</td>
<td class="rt2e" align="right">19.30</td>
<td class="rt2e" align="right">2.23</td>
<td class="rt2e" align="right">0.07</td>
<td class="rt2e" align="right">0.50</td>
<td class="rt3e" align="right">0.39</td>
<td class="rt3e" align="right">0.09</td>
<td class="rt3e" align="right">0.02</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=284007">Ryan</a></td>
<td class="rt1o" align="right">2249</td>
<td class="rt1o" align="right">295</td>
<td class="rt1o" align="right">$1.53</td>
<td class="rt2o" align="right">95.94</td>
<td class="rt2o" align="right">75.37</td>
<td class="rt2o" align="right">27.33</td>
<td class="rt2o" align="right">1.56</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.06</td>
<td class="rt3o" align="right">0.05</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=304031">Ruberik</a></td>
<td class="rt1e" align="right">2172</td>
<td class="rt1e" align="right">471</td>
<td class="rt1e" align="right">$7.58</td>
<td class="rt2e" align="right">82.47</td>
<td class="rt2e" align="right">52.00</td>
<td class="rt2e" align="right">18.12</td>
<td class="rt2e" align="right">1.70</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.28</td>
<td class="rt3e" align="right">0.22</td>
<td class="rt3e" align="right">0.05</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308453">overwise</a></td>
<td class="rt1o" align="right">2259</td>
<td class="rt1o" align="right">547</td>
<td class="rt1o" align="right">$31.78</td>
<td class="rt2o" align="right">83.23</td>
<td class="rt2o" align="right">55.95</td>
<td class="rt2o" align="right">24.06</td>
<td class="rt2o" align="right">3.32</td>
<td class="rt2o" align="right">0.15</td>
<td class="rt2o" align="right">1.01</td>
<td class="rt3o" align="right">0.74</td>
<td class="rt3o" align="right">0.19</td>
<td class="rt3o" align="right">0.06</td>
<td class="rt3o" align="right">0.02</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7462740">ploh</a></td>
<td class="rt1e" align="right">2218</td>
<td class="rt1e" align="right">308</td>
<td class="rt1e" align="right">$1.35</td>
<td class="rt2e" align="right">94.18</td>
<td class="rt2e" align="right">70.13</td>
<td class="rt2e" align="right">23.22</td>
<td class="rt2e" align="right">1.22</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.05</td>
<td class="rt3e" align="right">0.04</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td class="rt1o" align="right">2079</td>
<td class="rt1o" align="right">314</td>
<td class="rt1o" align="right">$0.17</td>
<td class="rt2o" align="right">86.44</td>
<td class="rt2o" align="right">50.16</td>
<td class="rt2o" align="right">9.71</td>
<td class="rt2o" align="right">0.24</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7502813">monsoon</a></td>
<td class="rt1e" align="right">2110</td>
<td class="rt1e" align="right">292</td>
<td class="rt1e" align="right">$0.17</td>
<td class="rt2e" align="right">90.13</td>
<td class="rt2e" align="right">56.52</td>
<td class="rt2e" align="right">11.62</td>
<td class="rt2e" align="right">0.28</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7210680">cnettel</a></td>
<td class="rt1o" align="right">2199</td>
<td class="rt1o" align="right">362</td>
<td class="rt1o" align="right">$2.72</td>
<td class="rt2o" align="right">90.10</td>
<td class="rt2o" align="right">62.55</td>
<td class="rt2o" align="right">20.94</td>
<td class="rt2o" align="right">1.38</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.11</td>
<td class="rt3o" align="right">0.09</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7281980">eldering</a></td>
<td class="rt1e" align="right">2085</td>
<td class="rt1e" align="right">314</td>
<td class="rt1e" align="right">$0.18</td>
<td class="rt2e" align="right">86.85</td>
<td class="rt2e" align="right">51.03</td>
<td class="rt2e" align="right">10.13</td>
<td class="rt2e" align="right">0.26</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289706">mickle</a></td>
<td class="rt1o" align="right">2111</td>
<td class="rt1o" align="right">310</td>
<td class="rt1o" align="right">$0.27</td>
<td class="rt2o" align="right">88.84</td>
<td class="rt2o" align="right">55.19</td>
<td class="rt2o" align="right">12.10</td>
<td class="rt2o" align="right">0.34</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287864">PAKETA</a></td>
<td class="rt1e" align="right">2004</td>
<td class="rt1e" align="right">403</td>
<td class="rt1e" align="right">$0.40</td>
<td class="rt2e" align="right">74.94</td>
<td class="rt2e" align="right">36.59</td>
<td class="rt2e" align="right">7.09</td>
<td class="rt2e" align="right">0.24</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8398526">Tomy</a></td>
<td class="rt1o" align="right">2075</td>
<td class="rt1o" align="right">240</td>
<td class="rt1o" align="right">$0.01</td>
<td class="rt2o" align="right">92.21</td>
<td class="rt2o" align="right">55.11</td>
<td class="rt2o" align="right">7.21</td>
<td class="rt2o" align="right">0.07</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7421158">Per</a></td>
<td class="rt1e" align="right">2277</td>
<td class="rt1e" align="right">566</td>
<td class="rt1e" align="right">$41.01</td>
<td class="rt2e" align="right">83.20</td>
<td class="rt2e" align="right">56.42</td>
<td class="rt2e" align="right">25.09</td>
<td class="rt2e" align="right">3.61</td>
<td class="rt2e" align="right">0.19</td>
<td class="rt2e" align="right">1.25</td>
<td class="rt3e" align="right">0.91</td>
<td class="rt3e" align="right">0.24</td>
<td class="rt3e" align="right">0.08</td>
<td class="rt3e" align="right">0.02</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308657">skanthak</a></td>
<td class="rt1o" align="right">2103</td>
<td class="rt1o" align="right">382</td>
<td class="rt1o" align="right">$1.04</td>
<td class="rt2o" align="right">83.38</td>
<td class="rt2o" align="right">49.25</td>
<td class="rt2o" align="right">12.61</td>
<td class="rt2o" align="right">0.59</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.04</td>
<td class="rt3o" align="right">0.04</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283388">Minsk</a></td>
<td class="rt1e" align="right">2121</td>
<td class="rt1e" align="right">452</td>
<td class="rt1e" align="right">$3.47</td>
<td class="rt2e" align="right">80.49</td>
<td class="rt2e" align="right">47.68</td>
<td class="rt2e" align="right">14.44</td>
<td class="rt2e" align="right">1.04</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.14</td>
<td class="rt3e" align="right">0.11</td>
<td class="rt3e" align="right">0.02</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263379">StefanPochmann</a></td>
<td class="rt1o" align="right">2003</td>
<td class="rt1o" align="right">470</td>
<td class="rt1o" align="right">$1.16</td>
<td class="rt2o" align="right">71.75</td>
<td class="rt2o" align="right">35.10</td>
<td class="rt2o" align="right">7.99</td>
<td class="rt2o" align="right">0.40</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.05</td>
<td class="rt3o" align="right">0.04</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296745">pzhao</a></td>
<td class="rt1e" align="right">2076</td>
<td class="rt1e" align="right">384</td>
<td class="rt1e" align="right">$0.71</td>
<td class="rt2e" align="right">81.45</td>
<td class="rt2e" align="right">45.84</td>
<td class="rt2e" align="right">10.79</td>
<td class="rt2e" align="right">0.45</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt3e" align="right">0.03</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307070">qsort</a></td>
<td class="rt1o" align="right">1992</td>
<td class="rt1o" align="right">418</td>
<td class="rt1o" align="right">$0.40</td>
<td class="rt2o" align="right">73.23</td>
<td class="rt2o" align="right">34.97</td>
<td class="rt2o" align="right">6.79</td>
<td class="rt2o" align="right">0.24</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7582361">zbogi</a></td>
<td class="rt1e" align="right">2061</td>
<td class="rt1e" align="right">452</td>
<td class="rt1e" align="right">$1.66</td>
<td class="rt2e" align="right">76.62</td>
<td class="rt2e" align="right">41.37</td>
<td class="rt2e" align="right">10.68</td>
<td class="rt2e" align="right">0.62</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.07</td>
<td class="rt3e" align="right">0.06</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=111202">ColinMacLeod</a></td>
<td class="rt1o" align="right">2017</td>
<td class="rt1o" align="right">484</td>
<td class="rt1o" align="right">$1.52</td>
<td class="rt2o" align="right">72.17</td>
<td class="rt2o" align="right">36.13</td>
<td class="rt2o" align="right">8.77</td>
<td class="rt2o" align="right">0.50</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.06</td>
<td class="rt3o" align="right">0.05</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
<td class="rt1e" align="right">2010</td>
<td class="rt1e" align="right">363</td>
<td class="rt1e" align="right">$0.17</td>
<td class="rt2e" align="right">77.74</td>
<td class="rt2e" align="right">38.39</td>
<td class="rt2e" align="right">6.66</td>
<td class="rt2e" align="right">0.17</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7512490">petko</a></td>
<td class="rt1o" align="right">2071</td>
<td class="rt1o" align="right">383</td>
<td class="rt1o" align="right">$0.56</td>
<td class="rt2o" align="right">81.14</td>
<td class="rt2o" align="right">45.24</td>
<td class="rt2o" align="right">10.45</td>
<td class="rt2o" align="right">0.42</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058469">robymus</a></td>
<td class="rt1e" align="right">1997</td>
<td class="rt1e" align="right">393</td>
<td class="rt1e" align="right">$0.22</td>
<td class="rt2e" align="right">74.94</td>
<td class="rt2e" align="right">36.05</td>
<td class="rt2e" align="right">6.61</td>
<td class="rt2e" align="right">0.20</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7358573">Kavan</a></td>
<td class="rt1o" align="right">2020</td>
<td class="rt1o" align="right">320</td>
<td class="rt1o" align="right">$0.05</td>
<td class="rt2o" align="right">81.50</td>
<td class="rt2o" align="right">41.17</td>
<td class="rt2o" align="right">6.25</td>
<td class="rt2o" align="right">0.11</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274018">Alexandre</a></td>
<td class="rt1e" align="right">2012</td>
<td class="rt1e" align="right">342</td>
<td class="rt1e" align="right">$0.08</td>
<td class="rt2e" align="right">79.28</td>
<td class="rt2e" align="right">39.30</td>
<td class="rt2e" align="right">6.36</td>
<td class="rt2e" align="right">0.13</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269058">jasonw</a></td>
<td class="rt1o" align="right">1935</td>
<td class="rt1o" align="right">336</td>
<td class="rt1o" align="right">$0.02</td>
<td class="rt2o" align="right">72.60</td>
<td class="rt2o" align="right">29.42</td>
<td class="rt2o" align="right">3.23</td>
<td class="rt2o" align="right">0.04</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7510875">Darkmaster</a></td>
<td class="rt1e" align="right">1868</td>
<td class="rt1e" align="right">360</td>
<td class="rt1e" align="right">$0.01</td>
<td class="rt2e" align="right">64.62</td>
<td class="rt2e" align="right">22.02</td>
<td class="rt2e" align="right">2.02</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293387">abiczo</a></td>
<td class="rt1o" align="right">1921</td>
<td class="rt1o" align="right">645</td>
<td class="rt1o" align="right">$3.06</td>
<td class="rt2o" align="right">61.44</td>
<td class="rt2o" align="right">27.11</td>
<td class="rt2o" align="right">6.77</td>
<td class="rt2o" align="right">0.50</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.11</td>
<td class="rt3o" align="right">0.10</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260828">Larry</a></td>
<td class="rt1e" align="right">1927</td>
<td class="rt1e" align="right">361</td>
<td class="rt1e" align="right">$0.03</td>
<td class="rt2e" align="right">70.44</td>
<td class="rt2e" align="right">28.36</td>
<td class="rt2e" align="right">3.44</td>
<td class="rt2e" align="right">0.05</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
<td class="rt1o" align="right">1810</td>
<td class="rt1o" align="right">381</td>
<td class="rt1o" align="right">$0.01</td>
<td class="rt2o" align="right">57.98</td>
<td class="rt2o" align="right">17.09</td>
<td class="rt2o" align="right">1.35</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309982">cyfra</a></td>
<td class="rt1e" align="right">1953</td>
<td class="rt1e" align="right">374</td>
<td class="rt1e" align="right">$0.06</td>
<td class="rt2e" align="right">72.21</td>
<td class="rt2e" align="right">31.29</td>
<td class="rt2e" align="right">4.51</td>
<td class="rt2e" align="right">0.09</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307169">Fluff</a></td>
<td class="rt1o" align="right">1856</td>
<td class="rt1o" align="right">373</td>
<td class="rt1o" align="right">$0.01</td>
<td class="rt2o" align="right">62.91</td>
<td class="rt2o" align="right">21.00</td>
<td class="rt2o" align="right">1.97</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=261567">gilbert</a></td>
<td class="rt1e" align="right">1891</td>
<td class="rt1e" align="right">386</td>
<td class="rt1e" align="right">$0.03</td>
<td class="rt2e" align="right">65.89</td>
<td class="rt2e" align="right">24.58</td>
<td class="rt2e" align="right">2.90</td>
<td class="rt2e" align="right">0.04</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=294034">centipede80</a></td>
<td class="rt1o" align="right">1865</td>
<td class="rt1o" align="right">268</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">68.83</td>
<td class="rt2o" align="right">19.87</td>
<td class="rt2o" align="right">0.78</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273112">WhiteShadow</a></td>
<td class="rt1e" align="right">1778</td>
<td class="rt1e" align="right">397</td>
<td class="rt1e" align="right">$0.01</td>
<td class="rt2e" align="right">54.47</td>
<td class="rt2e" align="right">14.96</td>
<td class="rt2e" align="right">1.14</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
<td class="rt1o" align="right">1878</td>
<td class="rt1o" align="right">259</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">71.16</td>
<td class="rt2o" align="right">21.27</td>
<td class="rt2o" align="right">0.82</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156541">SteveStern</a></td>
<td class="rt1e" align="right">1818</td>
<td class="rt1e" align="right">473</td>
<td class="rt1e" align="right">$0.07</td>
<td class="rt2e" align="right">57.12</td>
<td class="rt2e" align="right">19.26</td>
<td class="rt2e" align="right">2.49</td>
<td class="rt2e" align="right">0.06</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274760">Running Wild</a></td>
<td class="rt1o" align="right">1915</td>
<td class="rt1o" align="right">329</td>
<td class="rt1o" align="right">$0.01</td>
<td class="rt2o" align="right">70.98</td>
<td class="rt2o" align="right">26.96</td>
<td class="rt2o" align="right">2.55</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=346607">kalmakka</a></td>
<td class="rt1e" align="right">2004</td>
<td class="rt1e" align="right">543</td>
<td class="rt1e" align="right">$1.97</td>
<td class="rt2e" align="right">69.14</td>
<td class="rt2e" align="right">33.94</td>
<td class="rt2e" align="right">8.78</td>
<td class="rt2e" align="right">0.60</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.08</td>
<td class="rt3e" align="right">0.06</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=266571">jburnim</a></td>
<td class="rt1o" align="right">1814</td>
<td class="rt1o" align="right">414</td>
<td class="rt1o" align="right">$0.02</td>
<td class="rt2o" align="right">57.75</td>
<td class="rt2o" align="right">18.06</td>
<td class="rt2o" align="right">1.77</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8396270">lews</a></td>
<td class="rt1e" align="right">1732</td>
<td class="rt1e" align="right">458</td>
<td class="rt1e" align="right">$0.01</td>
<td class="rt2e" align="right">49.89</td>
<td class="rt2e" align="right">13.35</td>
<td class="rt2e" align="right">1.19</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8445017">fiasco</a></td>
<td class="rt1o" align="right">1726</td>
<td class="rt1o" align="right">267</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">48.91</td>
<td class="rt2o" align="right">6.94</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8352094">UltraMilo</a></td>
<td class="rt1e" align="right">1819</td>
<td class="rt1e" align="right">421</td>
<td class="rt1e" align="right">$0.02</td>
<td class="rt2e" align="right">58.08</td>
<td class="rt2e" align="right">18.59</td>
<td class="rt2e" align="right">1.93</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="rt1o" align="right">1954</td>
<td class="rt1o" align="right">555</td>
<td class="rt1o" align="right">$1.28</td>
<td class="rt2o" align="right">65.51</td>
<td class="rt2o" align="right">29.86</td>
<td class="rt2o" align="right">7.00</td>
<td class="rt2o" align="right">0.42</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.05</td>
<td class="rt3o" align="right">0.04</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7443050">mics</a></td>
<td class="rt1e" align="right">1762</td>
<td class="rt1e" align="right">147</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">57.61</td>
<td class="rt2e" align="right">3.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8360116">freestyler</a></td>
<td class="rt1o" align="right">1779</td>
<td class="rt1o" align="right">302</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">56.04</td>
<td class="rt2o" align="right">12.22</td>
<td class="rt2o" align="right">0.39</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7584235">agh</a></td>
<td class="rt1e" align="right">1838</td>
<td class="rt1e" align="right">313</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">63.13</td>
<td class="rt2e" align="right">18.05</td>
<td class="rt2e" align="right">0.97</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8365685">pparys</a></td>
<td class="rt1o" align="right">1923</td>
<td class="rt1o" align="right">620</td>
<td class="rt1o" align="right">$1.88</td>
<td class="rt2o" align="right">62.00</td>
<td class="rt2o" align="right">27.29</td>
<td class="rt2o" align="right">6.63</td>
<td class="rt2o" align="right">0.46</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.07</td>
<td class="rt3o" align="right">0.06</td>
<td class="rt3o" align="right">0.01</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7468628">xds</a></td>
<td class="rt1e" align="right">1754</td>
<td class="rt1e" align="right">302</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">52.74</td>
<td class="rt2e" align="right">10.27</td>
<td class="rt2e" align="right">0.27</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288233">gali</a></td>
<td class="rt1o" align="right">1846</td>
<td class="rt1o" align="right">473</td>
<td class="rt1o" align="right">$0.07</td>
<td class="rt2o" align="right">59.45</td>
<td class="rt2o" align="right">21.37</td>
<td class="rt2o" align="right">3.04</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150796">paisa</a></td>
<td class="rt1e" align="right">1825</td>
<td class="rt1e" align="right">340</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">60.66</td>
<td class="rt2e" align="right">17.44</td>
<td class="rt2e" align="right">1.10</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7402883">Henry</a></td>
<td class="rt1o" align="right">1719</td>
<td class="rt1o" align="right">295</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">48.08</td>
<td class="rt2o" align="right">7.65</td>
<td class="rt2o" align="right">0.14</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8474430">kupo</a></td>
<td class="rt1e" align="right">1804</td>
<td class="rt1e" align="right">321</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">58.74</td>
<td class="rt2e" align="right">15.01</td>
<td class="rt2e" align="right">0.71</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=290448">BryanChen</a></td>
<td class="rt1o" align="right">1678</td>
<td class="rt1o" align="right">288</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">42.40</td>
<td class="rt2o" align="right">5.22</td>
<td class="rt2o" align="right">0.06</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7360309">dmks</a></td>
<td class="rt1e" align="right">1820</td>
<td class="rt1e" align="right">375</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">59.14</td>
<td class="rt2e" align="right">17.79</td>
<td class="rt2e" align="right">1.42</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8349097">hauser</a></td>
<td class="rt1o" align="right">1770</td>
<td class="rt1o" align="right">359</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">54.09</td>
<td class="rt2o" align="right">13.37</td>
<td class="rt2o" align="right">0.74</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=349226">viktoras</a></td>
<td class="rt1e" align="right">1706</td>
<td class="rt1e" align="right">446</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">47.53</td>
<td class="rt2e" align="right">11.57</td>
<td class="rt2e" align="right">0.87</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=298761">Greyve</a></td>
<td class="rt1o" align="right">1658</td>
<td class="rt1o" align="right">340</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">41.22</td>
<td class="rt2o" align="right">6.09</td>
<td class="rt2o" align="right">0.14</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283374">indigo9</a></td>
<td class="rt1e" align="right">1636</td>
<td class="rt1e" align="right">393</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">40.19</td>
<td class="rt2e" align="right">6.73</td>
<td class="rt2e" align="right">0.24</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058177">Revenger</a></td>
<td class="rt1o" align="right">1642</td>
<td class="rt1o" align="right">440</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">41.76</td>
<td class="rt2o" align="right">8.27</td>
<td class="rt2o" align="right">0.46</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7448904">DEathkNIghtS</a></td>
<td class="rt1e" align="right">1627</td>
<td class="rt1e" align="right">293</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">35.84</td>
<td class="rt2e" align="right">3.39</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268851">gladius</a></td>
<td class="rt1o" align="right">1797</td>
<td class="rt1o" align="right">613</td>
<td class="rt1o" align="right">$0.44</td>
<td class="rt2o" align="right">54.14</td>
<td class="rt2o" align="right">19.47</td>
<td class="rt2o" align="right">3.54</td>
<td class="rt2o" align="right">0.17</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt3o" align="right">0.02</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=138158">leelin</a></td>
<td class="rt1e" align="right">1613</td>
<td class="rt1e" align="right">329</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">35.69</td>
<td class="rt2e" align="right">4.00</td>
<td class="rt2e" align="right">0.06</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158447">ValD</a></td>
<td class="rt1o" align="right">1595</td>
<td class="rt1o" align="right">298</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">32.11</td>
<td class="rt2o" align="right">2.62</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303385">farsight</a></td>
<td class="rt1e" align="right">1598</td>
<td class="rt1e" align="right">318</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">33.48</td>
<td class="rt2e" align="right">3.23</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8378346">FRaiser</a></td>
<td class="rt1o" align="right">1580</td>
<td class="rt1o" align="right">310</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">31.04</td>
<td class="rt2o" align="right">2.55</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7390467">lovro</a></td>
<td class="rt1e" align="right">1777</td>
<td class="rt1e" align="right">427</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">54.09</td>
<td class="rt2e" align="right">15.55</td>
<td class="rt2e" align="right">1.40</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479678">brahe</a></td>
<td class="rt1o" align="right">1636</td>
<td class="rt1o" align="right">324</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">38.19</td>
<td class="rt2o" align="right">4.68</td>
<td class="rt2o" align="right">0.07</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310431">sean_henderson</a></td>
<td class="rt1e" align="right">1572</td>
<td class="rt1e" align="right">344</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">31.96</td>
<td class="rt2e" align="right">3.19</td>
<td class="rt2e" align="right">0.04</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=290481">ender_wiggin</a></td>
<td class="rt1o" align="right">1631</td>
<td class="rt1o" align="right">372</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">39.12</td>
<td class="rt2o" align="right">5.92</td>
<td class="rt2o" align="right">0.17</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156859">ivern</a></td>
<td class="rt1e" align="right">1586</td>
<td class="rt1e" align="right">264</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">28.85</td>
<td class="rt2e" align="right">1.59</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7503639">blackbeltcoder4</a></td>
<td class="rt1o" align="right">1623</td>
<td class="rt1o" align="right">304</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">35.81</td>
<td class="rt2o" align="right">3.60</td>
<td class="rt2o" align="right">0.04</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479769">marian</a></td>
<td class="rt1e" align="right">1859</td>
<td class="rt1e" align="right">542</td>
<td class="rt1e" align="right">$0.28</td>
<td class="rt2e" align="right">59.22</td>
<td class="rt2e" align="right">22.85</td>
<td class="rt2e" align="right">4.13</td>
<td class="rt2e" align="right">0.17</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt3e" align="right">0.01</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289907">Terrax</a></td>
<td class="rt1o" align="right">1575</td>
<td class="rt1o" align="right">288</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">29.13</td>
<td class="rt2o" align="right">1.90</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7271918">thooot</a></td>
<td class="rt1e" align="right">1642</td>
<td class="rt1e" align="right">320</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">38.73</td>
<td class="rt2e" align="right">4.76</td>
<td class="rt2e" align="right">0.07</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=252277">Farlox</a></td>
<td class="rt1o" align="right">1648</td>
<td class="rt1o" align="right">413</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">41.80</td>
<td class="rt2o" align="right">7.82</td>
<td class="rt2o" align="right">0.36</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7489541">saraedum2</a></td>
<td class="rt1e" align="right">1787</td>
<td class="rt1e" align="right">380</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">55.65</td>
<td class="rt2e" align="right">15.23</td>
<td class="rt2e" align="right">1.07</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156848">TPCoder</a></td>
<td class="rt1o" align="right">1634</td>
<td class="rt1o" align="right">300</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">37.02</td>
<td class="rt2o" align="right">3.84</td>
<td class="rt2o" align="right">0.04</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268904">szymcio</a></td>
<td class="rt1e" align="right">1696</td>
<td class="rt1e" align="right">490</td>
<td class="rt1e" align="right">$0.01</td>
<td class="rt2e" align="right">46.96</td>
<td class="rt2e" align="right">12.07</td>
<td class="rt2e" align="right">1.10</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7371063">supernova</a></td>
<td class="rt1o" align="right">1690</td>
<td class="rt1o" align="right">457</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">46.22</td>
<td class="rt2o" align="right">10.99</td>
<td class="rt2o" align="right">0.82</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479796">acki2003</a></td>
<td class="rt1e" align="right">1553</td>
<td class="rt1e" align="right">382</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">31.82</td>
<td class="rt2e" align="right">3.63</td>
<td class="rt2e" align="right">0.07</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302085">userundefined</a></td>
<td class="rt1o" align="right">1564</td>
<td class="rt1o" align="right">380</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">32.77</td>
<td class="rt2o" align="right">3.87</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2059300">burnpanck</a></td>
<td class="rt1e" align="right">1619</td>
<td class="rt1e" align="right">347</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">37.05</td>
<td class="rt2e" align="right">4.72</td>
<td class="rt2e" align="right">0.09</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154090">merolish</a></td>
<td class="rt1o" align="right">1667</td>
<td class="rt1o" align="right">304</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">41.34</td>
<td class="rt2o" align="right">5.29</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7583050">juryu</a></td>
<td class="rt1e" align="right">1634</td>
<td class="rt1e" align="right">256</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">34.91</td>
<td class="rt2e" align="right">2.49</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7389864">roma</a></td>
<td class="rt1o" align="right">1685</td>
<td class="rt1o" align="right">490</td>
<td class="rt1o" align="right">$0.01</td>
<td class="rt2o" align="right">46.07</td>
<td class="rt2o" align="right">11.49</td>
<td class="rt2o" align="right">1.00</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7340263">gevak</a></td>
<td class="rt1e" align="right">1596</td>
<td class="rt1e" align="right">242</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">28.53</td>
<td class="rt2e" align="right">1.28</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159437">derelikt</a></td>
<td class="rt1o" align="right">1540</td>
<td class="rt1o" align="right">324</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">27.52</td>
<td class="rt2o" align="right">2.01</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7305703">Dumitru</a></td>
<td class="rt1e" align="right">1684</td>
<td class="rt1e" align="right">380</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">44.83</td>
<td class="rt2e" align="right">8.58</td>
<td class="rt2e" align="right">0.36</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=286112">mbarb</a></td>
<td class="rt1o" align="right">1532</td>
<td class="rt1o" align="right">248</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">20.87</td>
<td class="rt2o" align="right">0.59</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8391762">ltank</a></td>
<td class="rt1e" align="right">1672</td>
<td class="rt1e" align="right">503</td>
<td class="rt1e" align="right">$0.01</td>
<td class="rt2e" align="right">45.11</td>
<td class="rt2e" align="right">11.13</td>
<td class="rt2e" align="right">0.99</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8439426">obokaman</a></td>
<td class="rt1o" align="right">1722</td>
<td class="rt1o" align="right">438</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">48.98</td>
<td class="rt2o" align="right">12.30</td>
<td class="rt2o" align="right">0.94</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7584391">Krumble</a></td>
<td class="rt1e" align="right">1623</td>
<td class="rt1e" align="right">359</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">37.90</td>
<td class="rt2e" align="right">5.24</td>
<td class="rt2e" align="right">0.12</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302053">oldbig</a></td>
<td class="rt1o" align="right">1636</td>
<td class="rt1o" align="right">475</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">41.88</td>
<td class="rt2o" align="right">8.87</td>
<td class="rt2o" align="right">0.59</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251289">EtherMage</a></td>
<td class="rt1e" align="right">1602</td>
<td class="rt1e" align="right">484</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">39.30</td>
<td class="rt2e" align="right">7.71</td>
<td class="rt2e" align="right">0.47</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7233906">superjoel</a></td>
<td class="rt1o" align="right">1579</td>
<td class="rt1o" align="right">265</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">28.02</td>
<td class="rt2o" align="right">1.47</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7581406">konqueror</a></td>
<td class="rt1e" align="right">1557</td>
<td class="rt1e" align="right">264</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">25.24</td>
<td class="rt2e" align="right">1.11</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268951">sosonel</a></td>
<td class="rt1o" align="right">1596</td>
<td class="rt1o" align="right">256</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">29.61</td>
<td class="rt2o" align="right">1.59</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262951">db</a></td>
<td class="rt1e" align="right">1632</td>
<td class="rt1e" align="right">426</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">40.57</td>
<td class="rt2e" align="right">7.46</td>
<td class="rt2e" align="right">0.35</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8359547">Jasko</a></td>
<td class="rt1o" align="right">1584</td>
<td class="rt1o" align="right">233</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">26.16</td>
<td class="rt2o" align="right">0.92</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=271008">ilya</a></td>
<td class="rt1e" align="right">1519</td>
<td class="rt1e" align="right">311</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">24.52</td>
<td class="rt2e" align="right">1.40</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262467">billy</a></td>
<td class="rt1o" align="right">1506</td>
<td class="rt1o" align="right">198</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">12.71</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8360324">GustavoBR</a></td>
<td class="rt1e" align="right">1615</td>
<td class="rt1e" align="right">394</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">38.20</td>
<td class="rt2e" align="right">5.93</td>
<td class="rt2e" align="right">0.19</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8349001">belzebub</a></td>
<td class="rt1o" align="right">1598</td>
<td class="rt1o" align="right">278</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">31.31</td>
<td class="rt2o" align="right">2.17</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7459080">ardiankp</a></td>
<td class="rt1e" align="right">1542</td>
<td class="rt1e" align="right">385</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">30.95</td>
<td class="rt2e" align="right">3.42</td>
<td class="rt2e" align="right">0.07</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7584555">abi_k</a></td>
<td class="rt1o" align="right">1459</td>
<td class="rt1o" align="right">186</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">7.19</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7479088">dario</a></td>
<td class="rt1e" align="right">1522</td>
<td class="rt1e" align="right">248</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">19.76</td>
<td class="rt2e" align="right">0.51</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8356199">charleston</a></td>
<td class="rt1o" align="right">1505</td>
<td class="rt1o" align="right">208</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">13.75</td>
<td class="rt2o" align="right">0.12</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8436401">Katya_Lazareva</a></td>
<td class="rt1e" align="right">1520</td>
<td class="rt1e" align="right">312</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">24.69</td>
<td class="rt2e" align="right">1.44</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=309641">Dr. Gluk</a></td>
<td class="rt1o" align="right">1478</td>
<td class="rt1o" align="right">389</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">25.53</td>
<td class="rt2o" align="right">2.16</td>
<td class="rt2o" align="right">0.03</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7364110">kats</a></td>
<td class="rt1e" align="right">1521</td>
<td class="rt1e" align="right">421</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">30.67</td>
<td class="rt2e" align="right">3.70</td>
<td class="rt2e" align="right">0.09</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8357063">thegreensniper</a></td>
<td class="rt1o" align="right">1458</td>
<td class="rt1o" align="right">421</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">25.63</td>
<td class="rt2o" align="right">2.40</td>
<td class="rt2o" align="right">0.04</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7545675">cucu</a></td>
<td class="rt1e" align="right">1480</td>
<td class="rt1e" align="right">302</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">20.06</td>
<td class="rt2e" align="right">0.80</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8348950">nerx</a></td>
<td class="rt1o" align="right">1506</td>
<td class="rt1o" align="right">317</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">23.65</td>
<td class="rt2o" align="right">1.33</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7583175">Windrider</a></td>
<td class="rt1e" align="right">1523</td>
<td class="rt1e" align="right">370</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">28.48</td>
<td class="rt2e" align="right">2.64</td>
<td class="rt2e" align="right">0.04</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=152610">puzzlehacker</a></td>
<td class="rt1o" align="right">1434</td>
<td class="rt1o" align="right">251</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">11.70</td>
<td class="rt2o" align="right">0.14</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7584238">bl</a></td>
<td class="rt1e" align="right">1553</td>
<td class="rt1e" align="right">452</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">34.44</td>
<td class="rt2e" align="right">5.29</td>
<td class="rt2e" align="right">0.21</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154619">hilfiger</a></td>
<td class="rt1o" align="right">1416</td>
<td class="rt1o" align="right">489</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">25.77</td>
<td class="rt2o" align="right">2.85</td>
<td class="rt2o" align="right">0.08</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=278167">Merlin[Kyiv]</a></td>
<td class="rt1e" align="right">1460</td>
<td class="rt1e" align="right">293</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">17.56</td>
<td class="rt2e" align="right">0.54</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=349303">OpenGL4Dummies</a></td>
<td class="rt1o" align="right">1465</td>
<td class="rt1o" align="right">302</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">18.71</td>
<td class="rt2o" align="right">0.68</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=108438">Cougar</a></td>
<td class="rt1e" align="right">1436</td>
<td class="rt1e" align="right">312</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">17.03</td>
<td class="rt2e" align="right">0.57</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159758">entity</a></td>
<td class="rt1o" align="right">1392</td>
<td class="rt1o" align="right">291</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">12.06</td>
<td class="rt2o" align="right">0.21</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=276230">dimkadimon</a></td>
<td class="rt1e" align="right">1415</td>
<td class="rt1e" align="right">285</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">13.20</td>
<td class="rt2e" align="right">0.25</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7499769">stranger</a></td>
<td class="rt1o" align="right">1436</td>
<td class="rt1o" align="right">369</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">20.97</td>
<td class="rt2o" align="right">1.25</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7268916">bsauerwine</a></td>
<td class="rt1e" align="right">1450</td>
<td class="rt1e" align="right">354</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">21.15</td>
<td class="rt2e" align="right">1.19</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8475204">distill</a></td>
<td class="rt1o" align="right">1482</td>
<td class="rt1o" align="right">335</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">22.60</td>
<td class="rt2o" align="right">1.29</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=275558">zhliu</a></td>
<td class="rt1e" align="right">1380</td>
<td class="rt1e" align="right">564</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">26.50</td>
<td class="rt2e" align="right">3.44</td>
<td class="rt2e" align="right">0.14</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=288788">Wronkyn</a></td>
<td class="rt1o" align="right">1415</td>
<td class="rt1o" align="right">424</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">22.60</td>
<td class="rt2o" align="right">1.80</td>
<td class="rt2o" align="right">0.03</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8459981">adrastea</a></td>
<td class="rt1e" align="right">1413</td>
<td class="rt1e" align="right">310</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.06</td>
<td class="rt2e" align="right">0.41</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8475177">JGoldstein</a></td>
<td class="rt1o" align="right">1474</td>
<td class="rt1o" align="right">339</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">22.17</td>
<td class="rt2o" align="right">1.26</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=261043">fpmc</a></td>
<td class="rt1e" align="right">1374</td>
<td class="rt1e" align="right">350</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.22</td>
<td class="rt2e" align="right">0.52</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=300003">nike</a></td>
<td class="rt1o" align="right">1379</td>
<td class="rt1o" align="right">281</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">10.40</td>
<td class="rt2o" align="right">0.14</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297782">HappyMutant</a></td>
<td class="rt1e" align="right">1391</td>
<td class="rt1e" align="right">331</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.04</td>
<td class="rt2e" align="right">0.46</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8451367">Kovenko</a></td>
<td class="rt1o" align="right">1504</td>
<td class="rt1o" align="right">369</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">26.69</td>
<td class="rt2o" align="right">2.24</td>
<td class="rt2o" align="right">0.03</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8460252">tomek2</a></td>
<td class="rt1e" align="right">1430</td>
<td class="rt1e" align="right">327</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">17.66</td>
<td class="rt2e" align="right">0.67</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=284243">itsouk</a></td>
<td class="rt1o" align="right">1439</td>
<td class="rt1o" align="right">450</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">25.63</td>
<td class="rt2o" align="right">2.58</td>
<td class="rt2o" align="right">0.06</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7296831">Nexius</a></td>
<td class="rt1e" align="right">1377</td>
<td class="rt1e" align="right">282</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">10.34</td>
<td class="rt2e" align="right">0.13</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=295264">ffluv</a></td>
<td class="rt1o" align="right">1369</td>
<td class="rt1o" align="right">409</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">18.63</td>
<td class="rt2o" align="right">1.08</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=275118">PolariStar</a></td>
<td class="rt1e" align="right">1338</td>
<td class="rt1e" align="right">265</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">6.84</td>
<td class="rt2e" align="right">0.04</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7400531">mafattah</a></td>
<td class="rt1o" align="right">1434</td>
<td class="rt1o" align="right">493</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">27.16</td>
<td class="rt2o" align="right">3.24</td>
<td class="rt2o" align="right">0.11</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7452866">Im2Good</a></td>
<td class="rt1e" align="right">1450</td>
<td class="rt1e" align="right">344</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">20.49</td>
<td class="rt2e" align="right">1.06</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7568791">bramandia</a></td>
<td class="rt1o" align="right">1426</td>
<td class="rt1o" align="right">331</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">17.65</td>
<td class="rt2o" align="right">0.69</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299221">harisuthan</a></td>
<td class="rt1e" align="right">1373</td>
<td class="rt1e" align="right">238</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">6.59</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7240885">psangeljg</a></td>
<td class="rt1o" align="right">1397</td>
<td class="rt1o" align="right">323</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">14.90</td>
<td class="rt2o" align="right">0.44</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287130">NeverMore</a></td>
<td class="rt1e" align="right">1342</td>
<td class="rt1e" align="right">282</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">8.29</td>
<td class="rt2e" align="right">0.08</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=281156">raquib</a></td>
<td class="rt1o" align="right">1312</td>
<td class="rt1o" align="right">435</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">16.61</td>
<td class="rt2o" align="right">0.89</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=293574">wrob</a></td>
<td class="rt1e" align="right">1364</td>
<td class="rt1e" align="right">345</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">14.21</td>
<td class="rt2e" align="right">0.44</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7575689">rr</a></td>
<td class="rt1o" align="right">1380</td>
<td class="rt1o" align="right">332</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">14.36</td>
<td class="rt2o" align="right">0.42</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8395447">Ragnarok</a></td>
<td class="rt1e" align="right">1356</td>
<td class="rt1e" align="right">388</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">16.52</td>
<td class="rt2e" align="right">0.75</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=273416">xxfobxx</a></td>
<td class="rt1o" align="right">1304</td>
<td class="rt1o" align="right">231</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">3.23</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=273461">JWizard</a></td>
<td class="rt1e" align="right">1347</td>
<td class="rt1e" align="right">386</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.81</td>
<td class="rt2e" align="right">0.67</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8360460">Gronkowiec</a></td>
<td class="rt1o" align="right">1384</td>
<td class="rt1o" align="right">358</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">16.42</td>
<td class="rt2o" align="right">0.65</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159530">Spike</a></td>
<td class="rt1e" align="right">1326</td>
<td class="rt1e" align="right">504</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">20.90</td>
<td class="rt2e" align="right">1.80</td>
<td class="rt2e" align="right">0.04</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7557537">president</a></td>
<td class="rt1o" align="right">1386</td>
<td class="rt1o" align="right">384</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">18.26</td>
<td class="rt2o" align="right">0.94</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8356186">robert1900</a></td>
<td class="rt1e" align="right">1386</td>
<td class="rt1e" align="right">487</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">23.74</td>
<td class="rt2e" align="right">2.34</td>
<td class="rt2e" align="right">0.06</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=306712">albin</a></td>
<td class="rt1o" align="right">1258</td>
<td class="rt1o" align="right">228</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">1.92</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7296000">connect4</a></td>
<td class="rt1e" align="right">1264</td>
<td class="rt1e" align="right">454</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.05</td>
<td class="rt2e" align="right">0.74</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=348892">payam</a></td>
<td class="rt1o" align="right">1457</td>
<td class="rt1o" align="right">451</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">26.94</td>
<td class="rt2o" align="right">2.92</td>
<td class="rt2o" align="right">0.07</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=344711">[UoM]Supaphly</a></td>
<td class="rt1e" align="right">1323</td>
<td class="rt1e" align="right">318</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">9.85</td>
<td class="rt2e" align="right">0.16</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr>
<td class="rh1" align="left" colspan="4"></td>
<td class="rh2" align="center" colspan="6">Probability of advancing to:</td>
<td class="rh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rh1" align="left">Handle</td>
<td class="rh1" align="right">Rating</td>
<td class="rh1" align="right">Volatility</td>
<td class="rh1" align="right">Earnings</td>
<td class="rh2" align="right">Online 3</td>
<td class="rh2" align="right">Online 4</td>
<td class="rh2" align="right">Semifinals</td>
<td class="rh2" align="right">Wildcard</td>
<td class="rh2" align="right">Wildcard Win</td>
<td class="rh2" align="right">Finals</td>
<td class="rh3" align="right">4th</td>
<td class="rh3" align="right">3rd</td>
<td class="rh3" align="right">2nd</td>
<td class="rh3" align="right">Champ</td>
</tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7453403">Tantalus</a></td>
<td class="rt1o" align="right">1266</td>
<td class="rt1o" align="right">446</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">14.72</td>
<td class="rt2o" align="right">0.69</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8363524">Marto</a></td>
<td class="rt1e" align="right">1289</td>
<td class="rt1e" align="right">441</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">15.66</td>
<td class="rt2e" align="right">0.79</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297186">Avet</a></td>
<td class="rt1o" align="right">1221</td>
<td class="rt1o" align="right">348</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">7.06</td>
<td class="rt2o" align="right">0.09</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=152617">flip_da_bits</a></td>
<td class="rt1e" align="right">1201</td>
<td class="rt1e" align="right">297</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">3.69</td>
<td class="rt2e" align="right">0.01</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8377094">sun_agr</a></td>
<td class="rt1o" align="right">1359</td>
<td class="rt1o" align="right">449</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">20.19</td>
<td class="rt2o" align="right">1.46</td>
<td class="rt2o" align="right">0.02</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7558401">mcpeepants</a></td>
<td class="rt1e" align="right">1158</td>
<td class="rt1e" align="right">344</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">4.73</td>
<td class="rt2e" align="right">0.03</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>
<tr><td class="rt1o"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=8419140">Bilroy</a></td>
<td class="rt1o" align="right">1228</td>
<td class="rt1o" align="right">482</td>
<td class="rt1o" align="right">$0.00</td>
<td class="rt2o" align="right">14.68</td>
<td class="rt2o" align="right">0.76</td>
<td class="rt2o" align="right">0.01</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt2o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td>
<td class="rt3o" align="right">0.00</td></tr>
<tr><td class="rt1e"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=159841">JeyK</a></td>
<td class="rt1e" align="right">1044</td>
<td class="rt1e" align="right">381</td>
<td class="rt1e" align="right">$0.00</td>
<td class="rt2e" align="right">3.53</td>
<td class="rt2e" align="right">0.02</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt2e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td>
<td class="rt3e" align="right">0.00</td></tr>


</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
