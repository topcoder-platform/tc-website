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
               By&#160;<a class="bodyText" href="/tc?module=MemberProfile&cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="4">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=144400">tomek</a></td>
<td class="r1o">3502</td>
<td class="r1o">311</td>
<td class="r1o">$10,775.71</td>
<td class="r2o">99.87</td>
<td class="r2o">28.41</td>
<td class="r2o">13.69</td>
<td class="r2o">80.23</td>
<td class="r3o">5.92</td>
<td class="r3o">13.86</td>
<td class="r3o">23.03</td>
<td class="r3o">37.41</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=272072">SnapDragon</a></td>
<td class="r1e">3407</td>
<td class="r1e">262</td>
<td class="r1e">$7,438.50</td>
<td class="r2e">99.93</td>
<td class="r2e">46.73</td>
<td class="r2e">18.63</td>
<td class="r2e">64.82</td>
<td class="r3e">6.58</td>
<td class="r3e">15.80</td>
<td class="r3e">22.29</td>
<td class="r3e">20.15</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8355516">Eryx</a></td>
<td class="r1o">3233</td>
<td class="r1o">339</td>
<td class="r1o">$3,905.20</td>
<td class="r2o">97.74</td>
<td class="r2o">47.11</td>
<td class="r2o">11.54</td>
<td class="r2o">43.35</td>
<td class="r3o">11.90</td>
<td class="r3o">12.91</td>
<td class="r3o">10.67</td>
<td class="r3o">7.87</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7445961">snewman</a></td>
<td class="r1e">3336</td>
<td class="r1e">302</td>
<td class="r1e">$6,116.83</td>
<td class="r2e">99.49</td>
<td class="r2e">42.86</td>
<td class="r2e">13.65</td>
<td class="r2e">60.19</td>
<td class="r3e">10.33</td>
<td class="r3e">17.09</td>
<td class="r3e">17.97</td>
<td class="r3e">14.80</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=260835">reid</a></td>
<td class="r1o">3167</td>
<td class="r1o">323</td>
<td class="r1o">$2,392.75</td>
<td class="r2o">97.11</td>
<td class="r2o">51.51</td>
<td class="r2o">9.61</td>
<td class="r2o">26.71</td>
<td class="r3o">8.49</td>
<td class="r3o">8.34</td>
<td class="r3o">6.15</td>
<td class="r3o">3.73</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=269554">Yarin</a></td>
<td class="r1e">3085</td>
<td class="r1e">339</td>
<td class="r1e">$1,726.71</td>
<td class="r2e">94.22</td>
<td class="r2e">46.69</td>
<td class="r2e">6.50</td>
<td class="r2e">19.52</td>
<td class="r3e">7.52</td>
<td class="r3e">6.02</td>
<td class="r3e">3.83</td>
<td class="r3e">2.16</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=152347">ZorbaTHut</a></td>
<td class="r1o">3109</td>
<td class="r1o">221</td>
<td class="r1o">$1,367.04</td>
<td class="r2o">99.28</td>
<td class="r2o">62.08</td>
<td class="r2o">5.82</td>
<td class="r2o">14.39</td>
<td class="r3o">5.09</td>
<td class="r3o">5.27</td>
<td class="r3o">3.02</td>
<td class="r3o">1.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=270505">John Dethridge</a></td>
<td class="r1e">3260</td>
<td class="r1e">471</td>
<td class="r1e">$4,165.47</td>
<td class="r2e">93.47</td>
<td class="r2e">37.55</td>
<td class="r2e">12.02</td>
<td class="r2e">41.51</td>
<td class="r3e">11.88</td>
<td class="r3e">9.88</td>
<td class="r3e">8.86</td>
<td class="r3e">10.90</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=275071">antimatter</a></td>
<td class="r1o">2763</td>
<td class="r1o">370</td>
<td class="r1o">$552.76</td>
<td class="r2o">71.84</td>
<td class="r2o">18.24</td>
<td class="r2o">0.67</td>
<td class="r2o">3.86</td>
<td class="r3o">2.50</td>
<td class="r3o">0.92</td>
<td class="r3o">0.32</td>
<td class="r3o">0.11</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=287496">bstanescu</a></td>
<td class="r1e">2859</td>
<td class="r1e">385</td>
<td class="r1e">$784.08</td>
<td class="r2e">78.99</td>
<td class="r2e">25.09</td>
<td class="r2e">1.59</td>
<td class="r2e">7.75</td>
<td class="r3e">4.47</td>
<td class="r3e">2.01</td>
<td class="r3e">0.89</td>
<td class="r3e">0.38</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=274023">venco</a></td>
<td class="r1o">2831</td>
<td class="r1o">260</td>
<td class="r1o">$559.87</td>
<td class="r2o">85.80</td>
<td class="r2o">22.00</td>
<td class="r2o">0.48</td>
<td class="r2o">2.26</td>
<td class="r3o">1.40</td>
<td class="r3o">0.64</td>
<td class="r3o">0.18</td>
<td class="r3o">0.03</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=293874">nicka81</a></td>
<td class="r1e">2784</td>
<td class="r1e">322</td>
<td class="r1e">$523.91</td>
<td class="r2e">76.67</td>
<td class="r2e">17.37</td>
<td class="r2e">0.51</td>
<td class="r2e">2.47</td>
<td class="r3e">1.57</td>
<td class="r3e">0.64</td>
<td class="r3e">0.21</td>
<td class="r3e">0.06</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=262936">dgarthur</a></td>
<td class="r1o">2731</td>
<td class="r1o">430</td>
<td class="r1o">$526.93</td>
<td class="r2o">66.40</td>
<td class="r2o">14.21</td>
<td class="r2o">0.70</td>
<td class="r2o">3.66</td>
<td class="r3o">2.35</td>
<td class="r3o">0.83</td>
<td class="r3o">0.33</td>
<td class="r3o">0.15</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=287105">lars</a></td>
<td class="r1e">2757</td>
<td class="r1e">320</td>
<td class="r1e">$484.77</td>
<td class="r2e">74.16</td>
<td class="r2e">14.63</td>
<td class="r2e">0.36</td>
<td class="r2e">1.79</td>
<td class="r3e">1.17</td>
<td class="r3e">0.45</td>
<td class="r3e">0.14</td>
<td class="r3e">0.04</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=279471">haha</a></td>
<td class="r1o">2785</td>
<td class="r1o">454</td>
<td class="r1o">$644.22</td>
<td class="r2o">69.92</td>
<td class="r2o">16.46</td>
<td class="r2o">1.16</td>
<td class="r2o">5.56</td>
<td class="r3o">3.36</td>
<td class="r3o">1.29</td>
<td class="r3o">0.59</td>
<td class="r3o">0.32</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=157974">bigg_nate</a></td>
<td class="r1e">2597</td>
<td class="r1e">334</td>
<td class="r1e">$344.71</td>
<td class="r2e">55.58</td>
<td class="r2e">6.43</td>
<td class="r2e">0.07</td>
<td class="r2e">0.58</td>
<td class="r3e">0.44</td>
<td class="r3e">0.11</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="4">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=310430">gepa</a></td>
<td class="r1o">2581</td>
<td class="r1o">350</td>
<td class="r1o">$336.81</td>
<td class="r2o">53.49</td>
<td class="r2o">6.35</td>
<td class="r2o">0.07</td>
<td class="r2o">0.66</td>
<td class="r3o">0.51</td>
<td class="r3o">0.12</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=309453">Jan_Kuipers</a></td>
<td class="r1e">2771</td>
<td class="r1e">321</td>
<td class="r1e">$515.68</td>
<td class="r2e">75.46</td>
<td class="r2e">16.63</td>
<td class="r2e">0.44</td>
<td class="r2e">2.48</td>
<td class="r3e">1.60</td>
<td class="r3e">0.63</td>
<td class="r3e">0.19</td>
<td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=262056">mathijs</a></td>
<td class="r1o">2764</td>
<td class="r1o">406</td>
<td class="r1o">$568.53</td>
<td class="r2o">70.20</td>
<td class="r2o">15.79</td>
<td class="r2o">0.77</td>
<td class="r2o">4.26</td>
<td class="r3o">2.71</td>
<td class="r3o">0.99</td>
<td class="r3o">0.39</td>
<td class="r3o">0.16</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=261024">grotmol</a></td>
<td class="r1e">2573</td>
<td class="r1e">730</td>
<td class="r1e">$585.84</td>
<td class="r2e">51.21</td>
<td class="r2e">8.49</td>
<td class="r2e">0.87</td>
<td class="r2e">6.11</td>
<td class="r3e">4.13</td>
<td class="r3e">0.92</td>
<td class="r3e">0.52</td>
<td class="r3e">0.55</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7428266">Klinck</a></td>
<td class="r1o">2641</td>
<td class="r1o">277</td>
<td class="r1o">$375.42</td>
<td class="r2o">62.83</td>
<td class="r2o">6.91</td>
<td class="r2o">0.05</td>
<td class="r2o">0.39</td>
<td class="r3o">0.30</td>
<td class="r3o">0.08</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7479769">marian</a></td>
<td class="r1e">2523</td>
<td class="r1e">158</td>
<td class="r1e">$266.69</td>
<td class="r2e">43.33</td>
<td class="r2e">0.74</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=307060">AdrianKuegel</a></td>
<td class="r1o">2572</td>
<td class="r1o">253</td>
<td class="r1o">$319.33</td>
<td class="r2o">53.36</td>
<td class="r2o">3.26</td>
<td class="r2o">0.01</td>
<td class="r2o">0.09</td>
<td class="r3o">0.08</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7502813">monsoon</a></td>
<td class="r1e">2597</td>
<td class="r1e">389</td>
<td class="r1e">$355.69</td>
<td class="r2e">54.80</td>
<td class="r2e">6.91</td>
<td class="r2e">0.13</td>
<td class="r2e">1.00</td>
<td class="r3e">0.74</td>
<td class="r3e">0.20</td>
<td class="r3e">0.05</td>
<td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=156592">benetin</a></td>
<td class="r1o">2597</td>
<td class="r1o">341</td>
<td class="r1o">$344.48</td>
<td class="r2o">55.46</td>
<td class="r2o">5.97</td>
<td class="r2o">0.07</td>
<td class="r2o">0.57</td>
<td class="r3o">0.43</td>
<td class="r3o">0.11</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=155275">DjinnKahn</a></td>
<td class="r1e">2360</td>
<td class="r1e">191</td>
<td class="r1e">$132.81</td>
<td class="r2e">16.56</td>
<td class="r2e">0.08</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=129672">doeth</a></td>
<td class="r1o">2349</td>
<td class="r1o">334</td>
<td class="r1o">$186.82</td>
<td class="r2o">27.18</td>
<td class="r2o">0.84</td>
<td class="r2o">0.00</td>
<td class="r2o">0.04</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=153505">ambrose</a></td>
<td class="r1e">2432</td>
<td class="r1e">491</td>
<td class="r1e">$277.55</td>
<td class="r2e">40.36</td>
<td class="r2e">3.96</td>
<td class="r2e">0.08</td>
<td class="r2e">0.86</td>
<td class="r3e">0.68</td>
<td class="r3e">0.13</td>
<td class="r3e">0.04</td>
<td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=303644">Olexiy</a></td>
<td class="r1o">2579</td>
<td class="r1o">459</td>
<td class="r1o">$372.39</td>
<td class="r2o">52.48</td>
<td class="r2o">7.34</td>
<td class="r2o">0.23</td>
<td class="r2o">1.79</td>
<td class="r3o">1.31</td>
<td class="r3o">0.33</td>
<td class="r3o">0.11</td>
<td class="r3o">0.05</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=308453">overwise</a></td>
<td class="r1e">2502</td>
<td class="r1e">409</td>
<td class="r1e">$295.09</td>
<td class="r2e">45.20</td>
<td class="r2e">4.48</td>
<td class="r2e">0.06</td>
<td class="r2e">0.66</td>
<td class="r3e">0.52</td>
<td class="r3e">0.10</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7210680">cnettel</a></td>
<td class="r1o">2287</td>
<td class="r1o">321</td>
<td class="r1o">$152.81</td>
<td class="r2o">20.49</td>
<td class="r2o">0.42</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8547850">tmyklebu</a></td>
<td class="r1e">2362</td>
<td class="r1e">398</td>
<td class="r1e">$212.56</td>
<td class="r2e">31.62</td>
<td class="r2e">1.76</td>
<td class="r2e">0.01</td>
<td class="r2e">0.18</td>
<td class="r3e">0.15</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="4">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=304031">Ruberik</a></td>
<td class="r1o">2391</td>
<td class="r1o">462</td>
<td class="r1o">$246.02</td>
<td class="r2o">36.32</td>
<td class="r2o">2.99</td>
<td class="r2o">0.04</td>
<td class="r2o">0.52</td>
<td class="r3o">0.43</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=301937">RalphFurmaniak</a></td>
<td class="r1e">2279</td>
<td class="r1e">381</td>
<td class="r1e">$169.47</td>
<td class="r2e">23.64</td>
<td class="r2e">0.80</td>
<td class="r2e">0.00</td>
<td class="r2e">0.05</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=299709">Modulator</a></td>
<td class="r1o">2305</td>
<td class="r1o">313</td>
<td class="r1o">$158.15</td>
<td class="r2o">21.56</td>
<td class="r2o">0.45</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=7210729">ssancho2</a></td>
<td class="r1e">2245</td>
<td class="r1e">339</td>
<td class="r1e">$141.59</td>
<td class="r2e">18.26</td>
<td class="r2e">0.34</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8365685">pparys</a></td>
<td class="r1o">2423</td>
<td class="r1o">527</td>
<td class="r1o">$286.10</td>
<td class="r2o">40.31</td>
<td class="r2o">4.20</td>
<td class="r2o">0.11</td>
<td class="r2o">1.12</td>
<td class="r3o">0.88</td>
<td class="r3o">0.16</td>
<td class="r3o">0.05</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&cr=8349097">hauser</a></td>
<td class="r1e">2319</td>
<td class="r1e">481</td>
<td class="r1e">$215.55</td>
<td class="r2e">31.32</td>
<td class="r2e">2.04</td>
<td class="r2e">0.02</td>
<td class="r2e">0.33</td>
<td class="r3e">0.28</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7368306">Matei</a></td>
<td class="r1o">2156</td>
<td class="r1o">300</td>
<td class="r1o">$97.38</td>
<td class="r2o">9.47</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=251832">dark_lord</a></td>
<td class="r1e">2189</td>
<td class="r1e">404</td>
<td class="r1e">$142.45</td>
<td class="r2e">18.36</td>
<td class="r2e">0.43</td>
<td class="r2e">0.00</td>
<td class="r2e">0.03</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=289706">mickle</a></td>
<td class="r1o">2096</td>
<td class="r1o">260</td>
<td class="r1o">$71.18</td>
<td class="r2o">4.24</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=158333">dvickrey</a></td>
<td class="r1e">2136</td>
<td class="r1e">382</td>
<td class="r1e">$118.96</td>
<td class="r2e">13.75</td>
<td class="r2e">0.19</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=138663">Sord</a></td>
<td class="r1o">2073</td>
<td class="r1o">286</td>
<td class="r1o">$74.41</td>
<td class="r2o">4.88</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7442498">marek.cygan</a></td>
<td class="r1e">2102</td>
<td class="r1e">321</td>
<td class="r1e">$90.72</td>
<td class="r2e">8.14</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7440483">moggy</a></td>
<td class="r1o">2053</td>
<td class="r1o">318</td>
<td class="r1o">$79.69</td>
<td class="r2o">5.94</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7581406">konqueror</a></td>
<td class="r1e">2094</td>
<td class="r1e">443</td>
<td class="r1e">$125.33</td>
<td class="r2e">14.96</td>
<td class="r2e">0.29</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7485898">Andrew_Lazarev</a></td>
<td class="r1o">2118</td>
<td class="r1o">533</td>
<td class="r1o">$156.43</td>
<td class="r2o">20.65</td>
<td class="r2o">0.80</td>
<td class="r2o">0.01</td>
<td class="r2o">0.13</td>
<td class="r3o">0.11</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=307070">qsort</a></td>
<td class="r1e">1979</td>
<td class="r1e">299</td>
<td class="r1e">$64.46</td>
<td class="r2e">2.89</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr>
<td class="rH1" colspan="4"></td>
<td class="rH2" colspan="4">Probability of advancing to:</td>
<td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td>
<td class="rH1">Rating</td>
<td class="rH1">Volatility</td>
<td class="rH1">Earnings</td>
<td class="rH2">Semifinals</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard Win</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td>
<td class="rH3">3rd</td>
<td class="rH3">2nd</td>
<td class="rH3">Champ</td>
</tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=277492">InsaneParadox</a></td>
<td class="r1o">1845</td>
<td class="r1o">426</td>
<td class="r1o">$74.27</td>
<td class="r2o">4.85</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&cr=7546003">dmytro</a></td>
<td class="r1e">1669</td>
<td class="r1e">569</td>
<td class="r1e">$79.89</td>
<td class="r2e">5.96</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
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
