<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO04style.css"/>
<%@ taglib uri="tc.tld" prefix="tc" %>
</head>

<body>
<%--
<jsp:include page="tco04Head.jsp" />
--%>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

	<% String sLink = "/stat?c=member_profile&cr=";%>
      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco04/header_logo.gif"/></td>
		</tr>
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>radeye's odds</h2></td>
            <td class="bodyText" align=right>
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
               By&#160;<tc:ratingImage link='<%=sLink + 277659%>' bg='W' cid='277659' /></td><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 144400%>' bg='B' cid='144400' /></td>
<td class="r1o">3524</td>
<td class="r1o">334</td>
<td class="r1o">$11,569.74</td>
<td class="r2o">99.99</td>
<td class="r2o">99.69</td>
<td class="r2o">26.30</td>
<td class="r2o">13.63</td>
<td class="r2o">81.68</td>
<td class="r3o">5.24</td>
<td class="r3o">12.20</td>
<td class="r3o">21.60</td>
<td class="r3o">42.64</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 272072%>' bg='B' cid='272072' /></td>
<td class="r1e">3390</td>
<td class="r1e">281</td>
<td class="r1e">$7,319.04</td>
<td class="r2e">100.00</td>
<td class="r2e">99.72</td>
<td class="r2e">43.50</td>
<td class="r2e">17.15</td>
<td class="r2e">63.75</td>
<td class="r3e">6.65</td>
<td class="r3e">15.26</td>
<td class="r3e">22.09</td>
<td class="r3e">19.76</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 8355516%>' bg='B' cid='8355516' /></td>
<td class="r1o">3283</td>
<td class="r1o">348</td>
<td class="r1o">$4,971.63</td>
<td class="r2o">99.79</td>
<td class="r2o">97.34</td>
<td class="r2o">41.45</td>
<td class="r2o">12.44</td>
<td class="r2o">50.36</td>
<td class="r3o">10.70</td>
<td class="r3o">14.14</td>
<td class="r3o">13.92</td>
<td class="r3o">11.60</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7445961%>' bg='B' cid='7445961' /></td>
<td class="r1e">3265</td>
<td class="r1e">283</td>
<td class="r1e">$4,403.82</td>
<td class="r2e">99.97</td>
<td class="r2e">98.98</td>
<td class="r2e">49.63</td>
<td class="r2e">13.01</td>
<td class="r2e">46.61</td>
<td class="r3e">9.38</td>
<td class="r3e">14.68</td>
<td class="r3e">13.86</td>
<td class="r3e">8.68</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 260835%>' bg='B' cid='260835' /></td>
<td class="r1o">3216</td>
<td class="r1o">330</td>
<td class="r1o">$3,279.80</td>
<td class="r2o">99.76</td>
<td class="r2o">96.69</td>
<td class="r2o">47.85</td>
<td class="r2o">11.68</td>
<td class="r2o">35.00</td>
<td class="r3o">8.99</td>
<td class="r3o">10.56</td>
<td class="r3o">9.23</td>
<td class="r3o">6.23</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 269554%>' bg='B' cid='269554' /></td>
<td class="r1e">3072</td>
<td class="r1e">367</td>
<td class="r1e">$1,714.47</td>
<td class="r2e">98.44</td>
<td class="r2e">88.91</td>
<td class="r2e">41.02</td>
<td class="r2e">6.36</td>
<td class="r2e">18.92</td>
<td class="r3e">7.11</td>
<td class="r3e">5.61</td>
<td class="r3e">3.84</td>
<td class="r3e">2.37</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 152347%>' bg='B' cid='152347' /></td>
<td class="r1o">3066</td>
<td class="r1o">213</td>
<td class="r1o">$1,114.02</td>
<td class="r2o">99.98</td>
<td class="r2o">98.35</td>
<td class="r2o">57.03</td>
<td class="r2o">4.33</td>
<td class="r2o">10.43</td>
<td class="r3o">3.81</td>
<td class="r3o">3.89</td>
<td class="r3o">2.11</td>
<td class="r3o">0.62</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 270505%>' bg='B' cid='270505' /></td>
<td class="r1e">3135</td>
<td class="r1e">401</td>
<td class="r1e">$2,347.07</td>
<td class="r2e">98.34</td>
<td class="r2e">89.63</td>
<td class="r2e">37.64</td>
<td class="r2e">7.98</td>
<td class="r2e">25.56</td>
<td class="r3e">8.55</td>
<td class="r3e">7.18</td>
<td class="r3e">5.60</td>
<td class="r3e">4.22</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 275071%>' bg='B' cid='275071' /></td>
<td class="r1o">2789</td>
<td class="r1o">396</td>
<td class="r1o">$543.37</td>
<td class="r2o">90.11</td>
<td class="r2o">62.00</td>
<td class="r2o">15.73</td>
<td class="r2o">0.86</td>
<td class="r2o">4.52</td>
<td class="r3o">2.71</td>
<td class="r3o">1.13</td>
<td class="r3o">0.48</td>
<td class="r3o">0.19</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 287496%>' bg='B' cid='287496' /></td>
<td class="r1e">2847</td>
<td class="r1e">418</td>
<td class="r1e">$710.61</td>
<td class="r2e">91.32</td>
<td class="r2e">66.42</td>
<td class="r2e">18.57</td>
<td class="r2e">1.46</td>
<td class="r2e">7.17</td>
<td class="r3e">3.99</td>
<td class="r3e">1.84</td>
<td class="r3e">0.90</td>
<td class="r3e">0.44</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 277659%>' bg='B' cid='277659' /></td>
<td class="r1o">3002</td>
<td class="r1o">361</td>
<td class="r1o">$1,234.15</td>
<td class="r2o">97.71</td>
<td class="r2o">85.06</td>
<td class="r2o">31.26</td>
<td class="r2o">3.58</td>
<td class="r2o">13.64</td>
<td class="r3o">5.97</td>
<td class="r3o">4.11</td>
<td class="r3o">2.39</td>
<td class="r3o">1.18</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 274023%>' bg='B' cid='274023' /></td>
<td class="r1e">2848</td>
<td class="r1e">279</td>
<td class="r1e">$563.46</td>
<td class="r2e">97.86</td>
<td class="r2e">79.90</td>
<td class="r2e">20.54</td>
<td class="r2e">0.67</td>
<td class="r2e">2.89</td>
<td class="r3e">1.65</td>
<td class="r3e">0.87</td>
<td class="r3e">0.31</td>
<td class="r3e">0.07</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 293874%>' bg='B' cid='293874' /></td>
<td class="r1o">2754</td>
<td class="r1o">342</td>
<td class="r1o">$435.05</td>
<td class="r2o">91.73</td>
<td class="r2o">62.29</td>
<td class="r2o">12.82</td>
<td class="r2o">0.41</td>
<td class="r2o">2.06</td>
<td class="r3o">1.29</td>
<td class="r3o">0.53</td>
<td class="r3o">0.19</td>
<td class="r3o">0.05</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 286907%>' bg='B' cid='286907' /></td>
<td class="r1e">2798</td>
<td class="r1e">212</td>
<td class="r1e">$483.97</td>
<td class="r2e">99.19</td>
<td class="r2e">81.90</td>
<td class="r2e">14.86</td>
<td class="r2e">0.17</td>
<td class="r2e">0.72</td>
<td class="r3e">0.45</td>
<td class="r3e">0.21</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 262936%>' bg='B' cid='262936' /></td>
<td class="r1o">2773</td>
<td class="r1o">455</td>
<td class="r1o">$517.33</td>
<td class="r2o">86.17</td>
<td class="r2o">56.20</td>
<td class="r2o">12.73</td>
<td class="r2o">0.92</td>
<td class="r2o">4.31</td>
<td class="r3o">2.56</td>
<td class="r3o">1.01</td>
<td class="r3o">0.49</td>
<td class="r3o">0.26</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 287105%>' bg='B' cid='287105' /></td>
<td class="r1e">2743</td>
<td class="r1e">346</td>
<td class="r1e">$419.31</td>
<td class="r2e">90.99</td>
<td class="r2e">60.54</td>
<td class="r2e">11.65</td>
<td class="r2e">0.37</td>
<td class="r2e">1.91</td>
<td class="r3e">1.22</td>
<td class="r3e">0.48</td>
<td class="r3e">0.17</td>
<td class="r3e">0.05</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 279471%>' bg='B' cid='279471' /></td>
<td class="r1o">2806</td>
<td class="r1o">491</td>
<td class="r1o">$635.18</td>
<td class="r2o">85.90</td>
<td class="r2o">57.25</td>
<td class="r2o">13.63</td>
<td class="r2o">1.28</td>
<td class="r2o">6.32</td>
<td class="r3o">3.60</td>
<td class="r3o">1.46</td>
<td class="r3o">0.77</td>
<td class="r3o">0.49</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 157974%>' bg='B' cid='157974' /></td>
<td class="r1e">2620</td>
<td class="r1e">358</td>
<td class="r1e">$284.99</td>
<td class="r2e">82.98</td>
<td class="r2e">43.68</td>
<td class="r2e">5.69</td>
<td class="r2e">0.10</td>
<td class="r2e">0.79</td>
<td class="r3e">0.57</td>
<td class="r3e">0.16</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 310430%>' bg='B' cid='310430' /></td>
<td class="r1o">2571</td>
<td class="r1o">380</td>
<td class="r1o">$242.86</td>
<td class="r2o">77.90</td>
<td class="r2o">36.85</td>
<td class="r2o">4.28</td>
<td class="r2o">0.07</td>
<td class="r2o">0.63</td>
<td class="r3o">0.47</td>
<td class="r3o">0.12</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 287266%>' bg='B' cid='287266' /></td>
<td class="r1e">2638</td>
<td class="r1e">323</td>
<td class="r1e">$302.81</td>
<td class="r2e">86.65</td>
<td class="r2e">47.82</td>
<td class="r2e">5.98</td>
<td class="r2e">0.08</td>
<td class="r2e">0.65</td>
<td class="r3e">0.47</td>
<td class="r3e">0.14</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 309453%>' bg='B' cid='309453' /></td>
<td class="r1o">2710</td>
<td class="r1o">313</td>
<td class="r1o">$379.74</td>
<td class="r2o">91.52</td>
<td class="r2o">58.82</td>
<td class="r2o">9.36</td>
<td class="r2o">0.18</td>
<td class="r2o">1.17</td>
<td class="r3o">0.78</td>
<td class="r3o">0.29</td>
<td class="r3o">0.08</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 262056%>' bg='B' cid='262056' /></td>
<td class="r1e">2705</td>
<td class="r1e">419</td>
<td class="r1e">$393.04</td>
<td class="r2e">84.57</td>
<td class="r2e">51.00</td>
<td class="r2e">9.32</td>
<td class="r2e">0.42</td>
<td class="r2e">2.48</td>
<td class="r3e">1.61</td>
<td class="r3e">0.57</td>
<td class="r3e">0.22</td>
<td class="r3e">0.09</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 152340%>' bg='B' cid='152340' /></td>
<td class="r1o">2779</td>
<td class="r1o">447</td>
<td class="r1o">$531.17</td>
<td class="r2o">86.86</td>
<td class="r2o">57.31</td>
<td class="r2o">12.65</td>
<td class="r2o">0.89</td>
<td class="r2o">4.54</td>
<td class="r3o">2.69</td>
<td class="r3o">1.08</td>
<td class="r3o">0.51</td>
<td class="r3o">0.26</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 261024%>' bg='B' cid='261024' /></td>
<td class="r1e">2565</td>
<td class="r1e">797</td>
<td class="r1e">$394.96</td>
<td class="r2e">64.03</td>
<td class="r2e">30.95</td>
<td class="r2e">4.88</td>
<td class="r2e">0.60</td>
<td class="r2e">4.19</td>
<td class="r3e">2.73</td>
<td class="r3e">0.62</td>
<td class="r3e">0.38</td>
<td class="r3e">0.46</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7393427%>' bg='B' cid='7393427' /></td>
<td class="r1o">2691</td>
<td class="r1o">491</td>
<td class="r1o">$399.76</td>
<td class="r2o">79.99</td>
<td class="r2o">46.13</td>
<td class="r2o">8.64</td>
<td class="r2o">0.55</td>
<td class="r2o">3.09</td>
<td class="r3o">1.98</td>
<td class="r3o">0.65</td>
<td class="r3o">0.30</td>
<td class="r3o">0.16</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7428266%>' bg='B' cid='7428266' /></td>
<td class="r1e">2587</td>
<td class="r1e">270</td>
<td class="r1e">$259.68</td>
<td class="r2e">87.18</td>
<td class="r2e">42.45</td>
<td class="r2e">3.01</td>
<td class="r2e">0.01</td>
<td class="r2e">0.14</td>
<td class="r3e">0.10</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 305142%>' bg='B' cid='305142' /></td>
<td class="r1o">2471</td>
<td class="r1o">374</td>
<td class="r1o">$168.09</td>
<td class="r2o">69.62</td>
<td class="r2o">25.62</td>
<td class="r2o">1.85</td>
<td class="r2o">0.02</td>
<td class="r2o">0.19</td>
<td class="r3o">0.15</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 288584%>' bg='B' cid='288584' /></td>
<td class="r1e">2710</td>
<td class="r1e">395</td>
<td class="r1e">$386.58</td>
<td class="r2e">86.26</td>
<td class="r2e">52.96</td>
<td class="r2e">9.54</td>
<td class="r2e">0.37</td>
<td class="r2e">2.07</td>
<td class="r3e">1.33</td>
<td class="r3e">0.49</td>
<td class="r3e">0.18</td>
<td class="r3e">0.07</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7479769%>' bg='B' cid='7479769' /></td>
<td class="r1o">2526</td>
<td class="r1o">172</td>
<td class="r1o">$206.61</td>
<td class="r2o">91.93</td>
<td class="r2o">32.11</td>
<td class="r2o">0.54</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 307060%>' bg='B' cid='307060' /></td>
<td class="r1e">2606</td>
<td class="r1e">261</td>
<td class="r1e">$279.42</td>
<td class="r2e">89.35</td>
<td class="r2e">46.06</td>
<td class="r2e">3.46</td>
<td class="r2e">0.02</td>
<td class="r2e">0.16</td>
<td class="r3e">0.12</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7502813%>' bg='B' cid='7502813' /></td>
<td class="r1o">2490</td>
<td class="r1o">341</td>
<td class="r1o">$178.68</td>
<td class="r2o">73.20</td>
<td class="r2o">27.61</td>
<td class="r2o">1.83</td>
<td class="r2o">0.01</td>
<td class="r2o">0.15</td>
<td class="r3o">0.12</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7462740%>' bg='B' cid='7462740' /></td>
<td class="r1e">2495</td>
<td class="r1e">249</td>
<td class="r1e">$179.36</td>
<td class="r2e">80.55</td>
<td class="r2e">27.70</td>
<td class="r2e">0.94</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 156592%>' bg='B' cid='156592' /></td>
<td class="r1o">2500</td>
<td class="r1o">275</td>
<td class="r1o">$184.14</td>
<td class="r2o">78.82</td>
<td class="r2o">28.69</td>
<td class="r2o">1.26</td>
<td class="r2o">0.00</td>
<td class="r2o">0.05</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 284007%>' bg='B' cid='284007' /></td>
<td class="r1e">2574</td>
<td class="r1e">339</td>
<td class="r1e">$243.22</td>
<td class="r2e">80.78</td>
<td class="r2e">38.27</td>
<td class="r2e">3.60</td>
<td class="r2e">0.04</td>
<td class="r2e">0.39</td>
<td class="r3e">0.29</td>
<td class="r3e">0.08</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 345049%>' bg='B' cid='345049' /></td>
<td class="r1o">2534</td>
<td class="r1o">390</td>
<td class="r1o">$213.58</td>
<td class="r2o">74.34</td>
<td class="r2o">32.40</td>
<td class="r2o">3.13</td>
<td class="r2o">0.05</td>
<td class="r2o">0.48</td>
<td class="r3o">0.37</td>
<td class="r3o">0.09</td>
<td class="r3o">0.02</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 155275%>' bg='B' cid='155275' /></td>
<td class="r1e">2347</td>
<td class="r1e">207</td>
<td class="r1e">$69.70</td>
<td class="r2e">62.65</td>
<td class="r2e">7.67</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 129672%>' bg='B' cid='129672' /></td>
<td class="r1o">2276</td>
<td class="r1o">321</td>
<td class="r1o">$64.72</td>
<td class="r2o">49.52</td>
<td class="r2o">7.97</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 153505%>' bg='B' cid='153505' /></td>
<td class="r1e">2270</td>
<td class="r1e">263</td>
<td class="r1e">$51.27</td>
<td class="r2e">48.49</td>
<td class="r2e">5.40</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7446789%>' bg='B' cid='7446789' /></td>
<td class="r1o">2399</td>
<td class="r1o">578</td>
<td class="r1o">$161.35</td>
<td class="r2o">58.21</td>
<td class="r2o">21.22</td>
<td class="r2o">2.15</td>
<td class="r2o">0.08</td>
<td class="r2o">0.80</td>
<td class="r3o">0.61</td>
<td class="r3o">0.12</td>
<td class="r3o">0.04</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 153902%>' bg='B' cid='153902' /></td>
<td class="r1e">2306</td>
<td class="r1e">327</td>
<td class="r1e">$76.94</td>
<td class="r2e">53.20</td>
<td class="r2e">10.02</td>
<td class="r2e">0.21</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 303644%>' bg='B' cid='303644' /></td>
<td class="r1o">2539</td>
<td class="r1o">490</td>
<td class="r1o">$233.98</td>
<td class="r2o">70.26</td>
<td class="r2o">31.79</td>
<td class="r2o">3.92</td>
<td class="r2o">0.14</td>
<td class="r2o">1.17</td>
<td class="r3o">0.85</td>
<td class="r3o">0.21</td>
<td class="r3o">0.08</td>
<td class="r3o">0.03</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 302501%>' bg='B' cid='302501' /></td>
<td class="r1e">2355</td>
<td class="r1e">398</td>
<td class="r1e">$108.84</td>
<td class="r2e">57.54</td>
<td class="r2e">15.60</td>
<td class="r2e">0.73</td>
<td class="r2e">0.00</td>
<td class="r2e">0.08</td>
<td class="r3e">0.07</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 308453%>' bg='B' cid='308453' /></td>
<td class="r1o">2453</td>
<td class="r1o">437</td>
<td class="r1o">$164.42</td>
<td class="r2o">65.47</td>
<td class="r2o">24.24</td>
<td class="r2o">2.01</td>
<td class="r2o">0.03</td>
<td class="r2o">0.36</td>
<td class="r3o">0.28</td>
<td class="r3o">0.06</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7210680%>' bg='B' cid='7210680' /></td>
<td class="r1e">2264</td>
<td class="r1e">348</td>
<td class="r1e">$65.41</td>
<td class="r2e">48.18</td>
<td class="r2e">8.22</td>
<td class="r2e">0.16</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 252076%>' bg='B' cid='252076' /></td>
<td class="r1o">2259</td>
<td class="r1o">334</td>
<td class="r1o">$61.30</td>
<td class="r2o">47.50</td>
<td class="r2o">7.49</td>
<td class="r2o">0.12</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 299993%>' bg='B' cid='299993' /></td>
<td class="r1e">2180</td>
<td class="r1e">197</td>
<td class="r1e">$18.85</td>
<td class="r2e">30.78</td>
<td class="r2e">0.69</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 154754%>' bg='B' cid='154754' /></td>
<td class="r1o">2265</td>
<td class="r1o">500</td>
<td class="r1o">$89.43</td>
<td class="r2o">48.81</td>
<td class="r2o">12.32</td>
<td class="r2o">0.68</td>
<td class="r2o">0.01</td>
<td class="r2o">0.13</td>
<td class="r3o">0.11</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 269788%>' bg='B' cid='269788' /></td>
<td class="r1e">2341</td>
<td class="r1e">295</td>
<td class="r1e">$86.03</td>
<td class="r2e">58.24</td>
<td class="r2e">11.36</td>
<td class="r2e">0.20</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 156216%>' bg='B' cid='156216' /></td>
<td class="r1o">2193</td>
<td class="r1o">349</td>
<td class="r1o">$45.27</td>
<td class="r2o">40.14</td>
<td class="r2o">5.03</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 9906197%>' bg='B' cid='9906197' /></td>
<td class="r1e">2308</td>
<td class="r1e">465</td>
<td class="r1e">$99.21</td>
<td class="r2e">52.44</td>
<td class="r2e">13.96</td>
<td class="r2e">0.77</td>
<td class="r2e">0.01</td>
<td class="r2e">0.12</td>
<td class="r3e">0.10</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 8547850%>' bg='B' cid='8547850' /></td>
<td class="r1o">2237</td>
<td class="r1o">329</td>
<td class="r1o">$53.60</td>
<td class="r2o">44.82</td>
<td class="r2o">6.22</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 287269%>' bg='B' cid='287269' /></td>
<td class="r1e">2205</td>
<td class="r1e">202</td>
<td class="r1e">$23.61</td>
<td class="r2e">35.64</td>
<td class="r2e">1.16</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 304031%>' bg='B' cid='304031' /></td>
<td class="r1o">2293</td>
<td class="r1o">450</td>
<td class="r1o">$91.50</td>
<td class="r2o">51.20</td>
<td class="r2o">12.76</td>
<td class="r2o">0.62</td>
<td class="r2o">0.00</td>
<td class="r2o">0.08</td>
<td class="r3o">0.07</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 301937%>' bg='B' cid='301937' /></td>
<td class="r1e">2203</td>
<td class="r1e">385</td>
<td class="r1e">$53.59</td>
<td class="r2e">42.06</td>
<td class="r2e">6.47</td>
<td class="r2e">0.13</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 299709%>' bg='B' cid='299709' /></td>
<td class="r1o">2251</td>
<td class="r1o">318</td>
<td class="r1o">$55.88</td>
<td class="r2o">46.40</td>
<td class="r2o">6.53</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7210729%>' bg='B' cid='7210729' /></td>
<td class="r1e">2181</td>
<td class="r1e">341</td>
<td class="r1e">$41.15</td>
<td class="r2e">38.55</td>
<td class="r2e">4.37</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 8365685%>' bg='B' cid='8365685' /></td>
<td class="r1o">2240</td>
<td class="r1o">408</td>
<td class="r1o">$67.56</td>
<td class="r2o">46.10</td>
<td class="r2o">8.80</td>
<td class="r2o">0.26</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 8349097%>' bg='B' cid='8349097' /></td>
<td class="r1e">2212</td>
<td class="r1e">465</td>
<td class="r1e">$68.09</td>
<td class="r2e">44.18</td>
<td class="r2e">8.99</td>
<td class="r2e">0.34</td>
<td class="r2e">0.00</td>
<td class="r2e">0.04</td>
<td class="r3e">0.04</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7264865%>' bg='B' cid='7264865' /></td>
<td class="r1o">2201</td>
<td class="r1o">299</td>
<td class="r1o">$38.80</td>
<td class="r2o">39.58</td>
<td class="r2o">3.80</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7368306%>' bg='B' cid='7368306' /></td>
<td class="r1e">2108</td>
<td class="r1e">316</td>
<td class="r1e">$23.96</td>
<td class="r2e">29.26</td>
<td class="r2e">1.87</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 251832%>' bg='B' cid='251832' /></td>
<td class="r1o">2035</td>
<td class="r1o">236</td>
<td class="r1o">$8.39</td>
<td class="r2o">15.10</td>
<td class="r2o">0.17</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 10332088%>' bg='B' cid='10332088' /></td>
<td class="r1e">2313</td>
<td class="r1e">419</td>
<td class="r1e">$94.20</td>
<td class="r2e">53.17</td>
<td class="r2e">13.22</td>
<td class="r2e">0.58</td>
<td class="r2e">0.00</td>
<td class="r2e">0.06</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 111202%>' bg='B' cid='111202' /></td>
<td class="r1o">2003</td>
<td class="r1o">333</td>
<td class="r1o">$14.11</td>
<td class="r2o">20.22</td>
<td class="r2o">0.80</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 289706%>' bg='B' cid='289706' /></td>
<td class="r1e">2051</td>
<td class="r1e">263</td>
<td class="r1e">$11.74</td>
<td class="r2e">19.25</td>
<td class="r2e">0.42</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 158333%>' bg='B' cid='158333' /></td>
<td class="r1o">2075</td>
<td class="r1o">393</td>
<td class="r1o">$29.07</td>
<td class="r2o">30.04</td>
<td class="r2o">2.80</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 2058469%>' bg='B' cid='2058469' /></td>
<td class="r1e">2062</td>
<td class="r1e">285</td>
<td class="r1e">$14.82</td>
<td class="r2e">22.22</td>
<td class="r2e">0.74</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 269515%>' bg='B' cid='269515' /></td>
<td class="r1o">2038</td>
<td class="r1o">268</td>
<td class="r1o">$11.15</td>
<td class="r2o">18.37</td>
<td class="r2o">0.39</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 138663%>' bg='B' cid='138663' /></td>
<td class="r1e">2027</td>
<td class="r1e">293</td>
<td class="r1e">$12.46</td>
<td class="r2e">19.39</td>
<td class="r2e">0.55</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7442498%>' bg='B' cid='7442498' /></td>
<td class="r1o">2030</td>
<td class="r1o">313</td>
<td class="r1o">$14.59</td>
<td class="r2o">21.21</td>
<td class="r2o">0.80</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 293390%>' bg='B' cid='293390' /></td>
<td class="r1e">2020</td>
<td class="r1e">244</td>
<td class="r1e">$8.05</td>
<td class="r2e">14.44</td>
<td class="r2e">0.17</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 8394868%>' bg='B' cid='8394868' /></td>
<td class="r1o">2083</td>
<td class="r1o">257</td>
<td class="r1o">$14.02</td>
<td class="r2o">22.21</td>
<td class="r2o">0.58</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7440483%>' bg='B' cid='7440483' /></td>
<td class="r1e">1920</td>
<td class="r1e">184</td>
<td class="r1e">$1.40</td>
<td class="r2e">2.79</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 273112%>' bg='B' cid='273112' /></td>
<td class="r1o">1977</td>
<td class="r1o">301</td>
<td class="r1o">$9.59</td>
<td class="r2o">15.71</td>
<td class="r2o">0.35</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7581406%>' bg='B' cid='7581406' /></td>
<td class="r1e">1975</td>
<td class="r1e">413</td>
<td class="r1e">$19.20</td>
<td class="r2e">22.92</td>
<td class="r2e">1.54</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7485898%>' bg='B' cid='7485898' /></td>
<td class="r1o">2008</td>
<td class="r1o">536</td>
<td class="r1o">$36.37</td>
<td class="r2o">30.52</td>
<td class="r2o">4.15</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 299706%>' bg='B' cid='299706' /></td>
<td class="r1e">1967</td>
<td class="r1e">269</td>
<td class="r1e">$6.86</td>
<td class="r2e">12.30</td>
<td class="r2e">0.14</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 297766%>' bg='B' cid='297766' /></td>
<td class="r1o">2003</td>
<td class="r1o">420</td>
<td class="r1o">$22.85</td>
<td class="r2o">25.40</td>
<td class="r2o">2.03</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7584235%>' bg='B' cid='7584235' /></td>
<td class="r1e">2029</td>
<td class="r1e">284</td>
<td class="r1e">$11.84</td>
<td class="r2e">18.86</td>
<td class="r2e">0.48</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 306542%>' bg='B' cid='306542' /></td>
<td class="r1o">2088</td>
<td class="r1o">375</td>
<td class="r1o">$28.73</td>
<td class="r2o">30.37</td>
<td class="r2o">2.70</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7434314%>' bg='B' cid='7434314' /></td>
<td class="r1e">1952</td>
<td class="r1e">404</td>
<td class="r1e">$16.28</td>
<td class="r2e">20.77</td>
<td class="r2e">1.18</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 307070%>' bg='B' cid='307070' /></td>
<td class="r1o">1909</td>
<td class="r1o">291</td>
<td class="r1o">$5.63</td>
<td class="r2o">10.17</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7313385%>' bg='B' cid='7313385' /></td>
<td class="r1e">2094</td>
<td class="r1e">327</td>
<td class="r1e">$23.43</td>
<td class="r2e">28.45</td>
<td class="r2e">1.84</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 10052926%>' bg='B' cid='10052926' /></td>
<td class="r1o">1885</td>
<td class="r1o">266</td>
<td class="r1o">$3.66</td>
<td class="r2o">6.98</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7446397%>' bg='B' cid='7446397' /></td>
<td class="r1e">2017</td>
<td class="r1e">533</td>
<td class="r1e">$37.26</td>
<td class="r2e">31.01</td>
<td class="r2e">4.28</td>
<td class="r2e">0.12</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 301210%>' bg='B' cid='301210' /></td>
<td class="r1o">1895</td>
<td class="r1o">380</td>
<td class="r1o">$10.37</td>
<td class="r2o">15.50</td>
<td class="r2o">0.52</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 152342%>' bg='B' cid='152342' /></td>
<td class="r1e">1935</td>
<td class="r1e">316</td>
<td class="r1e">$8.24</td>
<td class="r2e">13.73</td>
<td class="r2e">0.28</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 294034%>' bg='B' cid='294034' /></td>
<td class="r1o">1803</td>
<td class="r1o">403</td>
<td class="r1o">$7.41</td>
<td class="r2o">11.79</td>
<td class="r2o">0.30</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 156990%>' bg='B' cid='156990' /></td>
<td class="r1e">1798</td>
<td class="r1e">301</td>
<td class="r1e">$2.89</td>
<td class="r2e">5.52</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 10015783%>' bg='B' cid='10015783' /></td>
<td class="r1o">1695</td>
<td class="r1o">333</td>
<td class="r1o">$2.07</td>
<td class="r2o">3.98</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 283374%>' bg='B' cid='283374' /></td>
<td class="r1e">1797</td>
<td class="r1e">299</td>
<td class="r1e">$2.81</td>
<td class="r2e">5.37</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 293575%>' bg='B' cid='293575' /></td>
<td class="r1o">1889</td>
<td class="r1o">420</td>
<td class="r1o">$12.88</td>
<td class="r2o">17.51</td>
<td class="r2o">0.82</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 8359547%>' bg='B' cid='8359547' /></td>
<td class="r1e">1823</td>
<td class="r1e">572</td>
<td class="r1e">$19.97</td>
<td class="r2e">21.12</td>
<td class="r2e">1.86</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 277492%>' bg='B' cid='277492' /></td>
<td class="r1o">1747</td>
<td class="r1o">417</td>
<td class="r1o">$6.10</td>
<td class="r2o">10.01</td>
<td class="r2o">0.22</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 150905%>' bg='B' cid='150905' /></td>
<td class="r1e">1669</td>
<td class="r1e">518</td>
<td class="r1e">$8.12</td>
<td class="r2e">11.83</td>
<td class="r2e">0.44</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7348444%>' bg='B' cid='7348444' /></td>
<td class="r1o">1706</td>
<td class="r1o">575</td>
<td class="r1o">$12.76</td>
<td class="r2o">15.82</td>
<td class="r2o">0.97</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 7462698%>' bg='B' cid='7462698' /></td>
<td class="r1e">1641</td>
<td class="r1e">348</td>
<td class="r1e">$1.73</td>
<td class="r2e">3.34</td>
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
<td class="rH2" colspan="5">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
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
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7433858%>' bg='B' cid='7433858' /></td>
<td class="r1o">2049</td>
<td class="r1o">454</td>
<td class="r1o">$32.77</td>
<td class="r2o">30.48</td>
<td class="r2o">3.49</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 260984%>' bg='B' cid='260984' /></td>
<td class="r1e">1687</td>
<td class="r1e">388</td>
<td class="r1e">$3.48</td>
<td class="r2e">6.30</td>
<td class="r2e">0.06</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><tc:ratingImage link='<%=sLink + 7546003%>' bg='B' cid='7546003' /></td>
<td class="r1o">1510</td>
<td class="r1o">531</td>
<td class="r1o">$4.41</td>
<td class="r2o">7.31</td>
<td class="r2o">0.15</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><tc:ratingImage link='<%=sLink + 282718%>' bg='B' cid='282718' /></td>
<td class="r1e">1527</td>
<td class="r1e">473</td>
<td class="r1e">$3.12</td>
<td class="r2e">5.54</td>
<td class="r2e">0.07</td>
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
