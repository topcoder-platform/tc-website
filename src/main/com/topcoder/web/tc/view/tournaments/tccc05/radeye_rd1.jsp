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
               By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="7">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Online 2</td>
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
<tr><td class="rHandleo"><tc-webtag:handle coderId="144400" context="algorithm"/></td>
<td class="r1o">3451</td>
<td class="r1o">349</td>
<td class="r1o">$10 298.78</td>
<td class="r2o">100.00</td>
<td class="r2o">100.00</td>
<td class="r2o">99.95</td>
<td class="r2o">99.22</td>
<td class="r2o">28.35</td>
<td class="r2o">13.63</td>
<td class="r2o">75.21</td>
<td class="r3o">5.75</td>
<td class="r3o">12.23</td>
<td class="r3o">20.72</td>
<td class="r3o">36.51</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">SnapDragon</a></td>
<td class="r1e">3346</td>
<td class="r1e">301</td>
<td class="r1e">$7 450.87</td>
<td class="r2e">100.00</td>
<td class="r2e">100.00</td>
<td class="r2e">99.97</td>
<td class="r2e">99.30</td>
<td class="r2e">39.58</td>
<td class="r2e">15.10</td>
<td class="r2e">63.41</td>
<td class="r3e">6.74</td>
<td class="r3e">14.49</td>
<td class="r3e">21.09</td>
<td class="r3e">21.10</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8355516">Eryx</a></td>
<td class="r1o">3250</td>
<td class="r1o">405</td>
<td class="r1o">$4 904.69</td>
<td class="r2o">99.99</td>
<td class="r2o">99.90</td>
<td class="r2o">99.03</td>
<td class="r2o">93.90</td>
<td class="r2o">37.17</td>
<td class="r2o">11.87</td>
<td class="r2o">46.83</td>
<td class="r3o">10.22</td>
<td class="r3o">11.66</td>
<td class="r3o">12.10</td>
<td class="r3o">12.86</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7445961">snewman</a></td>
<td class="r1e">3202</td>
<td class="r1e">319</td>
<td class="r1e">$3 855.90</td>
<td class="r2e">100.00</td>
<td class="r2e">99.99</td>
<td class="r2e">99.78</td>
<td class="r2e">96.90</td>
<td class="r2e">47.45</td>
<td class="r2e">11.91</td>
<td class="r2e">39.49</td>
<td class="r3e">8.69</td>
<td class="r3e">11.66</td>
<td class="r3e">11.10</td>
<td class="r3e">8.04</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td class="r1o">3177</td>
<td class="r1o">374</td>
<td class="r1o">$3 552.38</td>
<td class="r2o">99.99</td>
<td class="r2o">99.92</td>
<td class="r2o">99.05</td>
<td class="r2o">93.24</td>
<td class="r2o">39.46</td>
<td class="r2o">10.03</td>
<td class="r2o">36.44</td>
<td class="r3o">9.25</td>
<td class="r3o">10.10</td>
<td class="r3o">9.34</td>
<td class="r3o">7.74</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=269554">Yarin</a></td>
<td class="r1e">3122</td>
<td class="r1e">309</td>
<td class="r1e">$2 360.90</td>
<td class="r2e">100.00</td>
<td class="r2e">99.99</td>
<td class="r2e">99.63</td>
<td class="r2e">95.23</td>
<td class="r2e">47.07</td>
<td class="r2e">8.66</td>
<td class="r2e">24.66</td>
<td class="r3e">6.70</td>
<td class="r3e">7.77</td>
<td class="r3e">6.36</td>
<td class="r3e">3.83</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152347">ZorbaTHut</a></td>
<td class="r1o">3097</td>
<td class="r1o">227</td>
<td class="r1o">$1 687.09</td>
<td class="r2o">100.00</td>
<td class="r2o">100.00</td>
<td class="r2o">99.98</td>
<td class="r2o">98.45</td>
<td class="r2o">54.95</td>
<td class="r2o">6.71</td>
<td class="r2o">16.95</td>
<td class="r3o">4.57</td>
<td class="r3o">6.09</td>
<td class="r3o">4.47</td>
<td class="r3o">1.82</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=311170">bladerunner</a></td>
<td class="r1e">3040</td>
<td class="r1e">191</td>
<td class="r1e">$1 133.81</td>
<td class="r2e">100.00</td>
<td class="r2e">100.00</td>
<td class="r2e">99.99</td>
<td class="r2e">98.73</td>
<td class="r2e">52.19</td>
<td class="r2e">3.66</td>
<td class="r2e">10.16</td>
<td class="r3e">3.25</td>
<td class="r3e">3.95</td>
<td class="r3e">2.32</td>
<td class="r3e">0.65</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=270505">John Dethridge</a></td>
<td class="r1o">3025</td>
<td class="r1o">409</td>
<td class="r1o">$1 731.05</td>
<td class="r2o">99.91</td>
<td class="r2o">99.36</td>
<td class="r2o">95.86</td>
<td class="r2o">82.08</td>
<td class="r2o">31.14</td>
<td class="r2o">5.17</td>
<td class="r2o">19.06</td>
<td class="r3o">7.26</td>
<td class="r3o">5.28</td>
<td class="r3o">3.81</td>
<td class="r3o">2.71</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td class="r1e">2923</td>
<td class="r1e">439</td>
<td class="r1e">$1 109.43</td>
<td class="r2e">99.63</td>
<td class="r2e">98.01</td>
<td class="r2e">90.86</td>
<td class="r2e">70.49</td>
<td class="r2e">22.52</td>
<td class="r2e">2.90</td>
<td class="r2e">12.13</td>
<td class="r3e">5.57</td>
<td class="r3e">3.17</td>
<td class="r3e">2.03</td>
<td class="r3e">1.36</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287496">bstanescu</a></td>
<td class="r1o">2871</td>
<td class="r1o">472</td>
<td class="r1o">$901.71</td>
<td class="r2o">99.13</td>
<td class="r2o">96.14</td>
<td class="r2o">85.88</td>
<td class="r2o">62.17</td>
<td class="r2o">17.30</td>
<td class="r2o">2.09</td>
<td class="r2o">9.72</td>
<td class="r3o">4.79</td>
<td class="r3o">2.40</td>
<td class="r3o">1.49</td>
<td class="r3o">1.04</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=277659">radeye</a></td>
<td class="r1e">2866</td>
<td class="r1e">329</td>
<td class="r1e">$716.33</td>
<td class="r2e">99.96</td>
<td class="r2e">99.59</td>
<td class="r2e">95.69</td>
<td class="r2e">76.38</td>
<td class="r2e">21.99</td>
<td class="r2e">1.37</td>
<td class="r2e">5.90</td>
<td class="r3e">2.91</td>
<td class="r3e">1.78</td>
<td class="r3e">0.88</td>
<td class="r3e">0.33</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=274023">venco</a></td>
<td class="r1o">2863</td>
<td class="r1o">325</td>
<td class="r1o">$685.83</td>
<td class="r2o">99.97</td>
<td class="r2o">99.62</td>
<td class="r2o">95.83</td>
<td class="r2o">76.52</td>
<td class="r2o">20.92</td>
<td class="r2o">1.26</td>
<td class="r2o">5.24</td>
<td class="r3o">2.57</td>
<td class="r3o">1.59</td>
<td class="r3o">0.79</td>
<td class="r3o">0.30</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=293874">nicka81</a></td>
<td class="r1e">2804</td>
<td class="r1e">381</td>
<td class="r1e">$571.64</td>
<td class="r2e">99.72</td>
<td class="r2e">98.14</td>
<td class="r2e">89.66</td>
<td class="r2e">63.84</td>
<td class="r2e">14.74</td>
<td class="r2e">0.94</td>
<td class="r2e">4.39</td>
<td class="r3e">2.34</td>
<td class="r3e">1.20</td>
<td class="r3e">0.59</td>
<td class="r3e">0.26</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td class="r1o">2796</td>
<td class="r1o">417</td>
<td class="r1o">$578.59</td>
<td class="r2o">99.40</td>
<td class="r2o">96.84</td>
<td class="r2o">86.23</td>
<td class="r2o">59.35</td>
<td class="r2o">13.55</td>
<td class="r2o">1.02</td>
<td class="r2o">4.89</td>
<td class="r3o">2.62</td>
<td class="r3o">1.27</td>
<td class="r3o">0.66</td>
<td class="r3o">0.34</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
<td class="r1e">2776</td>
<td class="r1e">262</td>
<td class="r1e">$474.51</td>
<td class="r2e">100.00</td>
<td class="r2e">99.86</td>
<td class="r2e">96.71</td>
<td class="r2e">73.32</td>
<td class="r2e">13.53</td>
<td class="r2e">0.30</td>
<td class="r2e">1.53</td>
<td class="r3e">0.88</td>
<td class="r3e">0.46</td>
<td class="r3e">0.16</td>
<td class="r3e">0.03</td></tr>

</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
