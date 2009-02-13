<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
               By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=277659"><strong>radeye</strong></a><br />
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="r1o">3493</td>
<td class="r1o">248</td>
<td class="r1o">$14,517.37</td>
<td class="r2o">100.00</td>
<td class="r2o">17.58</td>
<td class="r2o">11.95</td>
<td class="r2o">93.76</td>
<td class="r3o">1.25</td>
<td class="r3o">9.04</td>
<td class="r3o">29.35</td>
<td class="r3o">54.12</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="r1e">3307</td>
<td class="r1e">348</td>
<td class="r1e">$9,018.99</td>
<td class="r2e">99.36</td>
<td class="r2e">28.46</td>
<td class="r2e">14.29</td>
<td class="r2e">79.03</td>
<td class="r3e">6.33</td>
<td class="r3e">19.83</td>
<td class="r3e">29.87</td>
<td class="r3e">23.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="r1o">3177</td>
<td class="r1o">423</td>
<td class="r1o">$5,701.93</td>
<td class="r2o">96.06</td>
<td class="r2o">36.51</td>
<td class="r2o">15.25</td>
<td class="r2o">58.48</td>
<td class="r3o">10.47</td>
<td class="r3o">19.17</td>
<td class="r3o">16.37</td>
<td class="r3o">12.47</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="r1e">3014</td>
<td class="r1e">461</td>
<td class="r1e">$3,127.39</td>
<td class="r2e">89.70</td>
<td class="r2e">36.60</td>
<td class="r2e">11.25</td>
<td class="r2e">37.34</td>
<td class="r3e">11.62</td>
<td class="r3e">12.31</td>
<td class="r3e">8.14</td>
<td class="r3e">5.27</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262936">dgarthur</a></td>
<td class="r1o">2795</td>
<td class="r1o">352</td>
<td class="r1o">$1,067.20</td>
<td class="r2o">84.84</td>
<td class="r2o">37.04</td>
<td class="r2o">4.86</td>
<td class="r2o">13.40</td>
<td class="r3o">6.19</td>
<td class="r3o">4.72</td>
<td class="r3o">2.02</td>
<td class="r3o">0.47</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="r1e">2754</td>
<td class="r1e">341</td>
<td class="r1e">$763.25</td>
<td class="r2e">82.69</td>
<td class="r2e">35.90</td>
<td class="r2e">3.87</td>
<td class="r2e">7.60</td>
<td class="r3e">3.78</td>
<td class="r3e">2.60</td>
<td class="r3e">1.01</td>
<td class="r3e">0.21</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="r1o">2859</td>
<td class="r1o">403</td>
<td class="r1o">$1,323.79</td>
<td class="r2o">85.58</td>
<td class="r2o">43.13</td>
<td class="r2o">8.10</td>
<td class="r2o">15.25</td>
<td class="r3o">6.41</td>
<td class="r3o">5.07</td>
<td class="r3o">2.71</td>
<td class="r3o">1.07</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310333">kalinov</a></td>
<td class="r1e">2712</td>
<td class="r1e">439</td>
<td class="r1e">$839.28</td>
<td class="r2e">73.89</td>
<td class="r2e">27.77</td>
<td class="r2e">3.56</td>
<td class="r2e">8.95</td>
<td class="r3e">4.63</td>
<td class="r3e">2.70</td>
<td class="r3e">1.21</td>
<td class="r3e">0.41</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7479769">marian</a></td>
<td class="r1o">2769</td>
<td class="r1o">370</td>
<td class="r1o">$931.35</td>
<td class="r2o">81.87</td>
<td class="r2o">33.59</td>
<td class="r2o">4.27</td>
<td class="r2o">10.94</td>
<td class="r3o">5.25</td>
<td class="r3o">3.73</td>
<td class="r3o">1.56</td>
<td class="r3o">0.39</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310430">gepa</a></td>
<td class="r1e">2680</td>
<td class="r1e">347</td>
<td class="r1e">$650.70</td>
<td class="r2e">76.21</td>
<td class="r2e">25.18</td>
<td class="r2e">2.11</td>
<td class="r2e">6.21</td>
<td class="r3e">3.38</td>
<td class="r3e">2.06</td>
<td class="r3e">0.66</td>
<td class="r3e">0.11</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262056">mathijs</a></td>
<td class="r1o">2733</td>
<td class="r1o">505</td>
<td class="r1o">$1,136.74</td>
<td class="r2o">72.54</td>
<td class="r2o">23.67</td>
<td class="r2o">3.82</td>
<td class="r2o">13.33</td>
<td class="r3o">6.63</td>
<td class="r3o">3.91</td>
<td class="r3o">1.90</td>
<td class="r3o">0.90</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=10481120">ivan_metelsky</a></td>
<td class="r1e">2647</td>
<td class="r1e">292</td>
<td class="r1e">$611.58</td>
<td class="r2e">76.75</td>
<td class="r2e">23.29</td>
<td class="r2e">1.29</td>
<td class="r2e">3.63</td>
<td class="r3e">2.09</td>
<td class="r3e">1.20</td>
<td class="r3e">0.31</td>
<td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308453">overwise</a></td>
<td class="r1o">2713</td>
<td class="r1o">378</td>
<td class="r1o">$889.51</td>
<td class="r2o">77.16</td>
<td class="r2o">27.57</td>
<td class="r2o">2.91</td>
<td class="r2o">7.57</td>
<td class="r3o">3.93</td>
<td class="r3o">2.47</td>
<td class="r3o">0.94</td>
<td class="r3o">0.22</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=9906197">krijgertje</a></td>
<td class="r1e">2633</td>
<td class="r1e">347</td>
<td class="r1e">$566.89</td>
<td class="r2e">71.85</td>
<td class="r2e">22.13</td>
<td class="r2e">1.50</td>
<td class="r2e">3.49</td>
<td class="r3e">2.02</td>
<td class="r3e">1.08</td>
<td class="r3e">0.33</td>
<td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="r1o">2512</td>
<td class="r1o">262</td>
<td class="r1o">$359.23</td>
<td class="r2o">61.79</td>
<td class="r2o">11.33</td>
<td class="r2o">0.25</td>
<td class="r2o">0.54</td>
<td class="r3o">0.37</td>
<td class="r3o">0.14</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7452866">Im2Good</a></td>
<td class="r1e">2653</td>
<td class="r1e">563</td>
<td class="r1e">$921.12</td>
<td class="r2e">65.34</td>
<td class="r2e">19.69</td>
<td class="r2e">2.94</td>
<td class="r2e">9.30</td>
<td class="r3e">5.02</td>
<td class="r3e">2.42</td>
<td class="r3e">1.21</td>
<td class="r3e">0.65</td></tr>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309982">cyfra</a></td>
<td class="r1o">2556</td>
<td class="r1o">375</td>
<td class="r1o">$566.59</td>
<td class="r2o">62.92</td>
<td class="r2o">15.44</td>
<td class="r2o">0.88</td>
<td class="r2o">2.61</td>
<td class="r3o">1.62</td>
<td class="r3o">0.74</td>
<td class="r3o">0.21</td>
<td class="r3o">0.03</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260987">dangelo</a></td>
<td class="r1e">2349</td>
<td class="r1e">290</td>
<td class="r1e">$253.70</td>
<td class="r2e">38.53</td>
<td class="r2e">3.54</td>
<td class="r2e">0.04</td>
<td class="r2e">0.16</td>
<td class="r3e">0.12</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="r1o">2505</td>
<td class="r1o">423</td>
<td class="r1o">$545.89</td>
<td class="r2o">56.77</td>
<td class="r2o">12.27</td>
<td class="r2o">0.72</td>
<td class="r2o">2.74</td>
<td class="r3o">1.76</td>
<td class="r3o">0.72</td>
<td class="r3o">0.21</td>
<td class="r3o">0.04</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8357090">misof</a></td>
<td class="r1e">2584</td>
<td class="r1e">403</td>
<td class="r1e">$512.89</td>
<td class="r2e">64.67</td>
<td class="r2e">16.35</td>
<td class="r2e">1.19</td>
<td class="r2e">4.13</td>
<td class="r3e">2.47</td>
<td class="r3e">1.20</td>
<td class="r3e">0.38</td>
<td class="r3e">0.08</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=288584">LunaticFringe</a></td>
<td class="r1o">2485</td>
<td class="r1o">403</td>
<td class="r1o">$493.40</td>
<td class="r2o">55.17</td>
<td class="r2o">10.78</td>
<td class="r2o">0.53</td>
<td class="r2o">2.10</td>
<td class="r3o">1.38</td>
<td class="r3o">0.55</td>
<td class="r3o">0.15</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=264869">ante</a></td>
<td class="r1e">2449</td>
<td class="r1e">540</td>
<td class="r1e">$541.11</td>
<td class="r2e">51.14</td>
<td class="r2e">10.30</td>
<td class="r2e">0.82</td>
<td class="r2e">3.55</td>
<td class="r3e">2.31</td>
<td class="r3e">0.82</td>
<td class="r3e">0.30</td>
<td class="r3e">0.11</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8601171">HilbertRaum</a></td>
<td class="r1o">2561</td>
<td class="r1o">476</td>
<td class="r1o">$651.71</td>
<td class="r2o">60.68</td>
<td class="r2o">15.10</td>
<td class="r2o">1.35</td>
<td class="r2o">4.65</td>
<td class="r3o">2.79</td>
<td class="r3o">1.24</td>
<td class="r3o">0.47</td>
<td class="r3o">0.14</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7502813">monsoon</a></td>
<td class="r1e">2404</td>
<td class="r1e">276</td>
<td class="r1e">$314.03</td>
<td class="r2e">45.77</td>
<td class="r2e">4.80</td>
<td class="r2e">0.06</td>
<td class="r2e">0.20</td>
<td class="r3e">0.15</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="r1o">2393</td>
<td class="r1o">311</td>
<td class="r1o">$282.67</td>
<td class="r2o">44.83</td>
<td class="r2o">5.27</td>
<td class="r2o">0.09</td>
<td class="r2o">0.28</td>
<td class="r3o">0.21</td>
<td class="r3o">0.06</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=153902">evd</a></td>
<td class="r1e">2249</td>
<td class="r1e">264</td>
<td class="r1e">$192.78</td>
<td class="r2e">24.34</td>
<td class="r2e">1.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=113178">po</a></td>
<td class="r1o">2364</td>
<td class="r1o">325</td>
<td class="r1o">$393.16</td>
<td class="r2o">41.51</td>
<td class="r2o">4.51</td>
<td class="r2o">0.07</td>
<td class="r2o">0.24</td>
<td class="r3o">0.18</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7442498">marek.cygan</a></td>
<td class="r1e">2120</td>
<td class="r1e">597</td>
<td class="r1e">$310.87</td>
<td class="r2e">29.83</td>
<td class="r2e">3.25</td>
<td class="r2e">0.12</td>
<td class="r2e">0.70</td>
<td class="r3e">0.55</td>
<td class="r3e">0.11</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7390467">lovro</a></td>
<td class="r1o">2447</td>
<td class="r1o">428</td>
<td class="r1o">$510.29</td>
<td class="r2o">51.28</td>
<td class="r2o">9.48</td>
<td class="r2o">0.46</td>
<td class="r2o">1.61</td>
<td class="r3o">1.09</td>
<td class="r3o">0.39</td>
<td class="r3o">0.11</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307638">Wernie</a></td>
<td class="r1e">2267</td>
<td class="r1e">516</td>
<td class="r1e">$400.11</td>
<td class="r2e">37.24</td>
<td class="r2e">4.86</td>
<td class="r2e">0.19</td>
<td class="r2e">0.99</td>
<td class="r3e">0.74</td>
<td class="r3e">0.19</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8493941">asaveljevs</a></td>
<td class="r1o">2219</td>
<td class="r1o">306</td>
<td class="r1o">$244.03</td>
<td class="r2o">24.50</td>
<td class="r2o">1.12</td>
<td class="r2o">0.01</td>
<td class="r2o">0.04</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=158333">dvickrey</a></td>
<td class="r1e">2236</td>
<td class="r1e">315</td>
<td class="r1e">$278.88</td>
<td class="r2e">26.82</td>
<td class="r2e">1.42</td>
<td class="r2e">0.01</td>
<td class="r2e">0.06</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=286375">bjacoke001</a></td>
<td class="r1o">2170</td>
<td class="r1o">286</td>
<td class="r1o">$218.13</td>
<td class="r2o">18.20</td>
<td class="r2o">0.51</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=347569">Savior</a></td>
<td class="r1e">2367</td>
<td class="r1e">483</td>
<td class="r1e">$485.15</td>
<td class="r2e">44.80</td>
<td class="r2e">6.83</td>
<td class="r2e">0.33</td>
<td class="r2e">1.67</td>
<td class="r3e">1.18</td>
<td class="r3e">0.37</td>
<td class="r3e">0.10</td>
<td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=268851">gladius</a></td>
<td class="r1o">2234</td>
<td class="r1o">476</td>
<td class="r1o">$355.15</td>
<td class="r2o">33.89</td>
<td class="r2o">3.46</td>
<td class="r2o">0.10</td>
<td class="r2o">0.66</td>
<td class="r3o">0.51</td>
<td class="r3o">0.12</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7584555">abi_k</a></td>
<td class="r1e">2338</td>
<td class="r1e">639</td>
<td class="r1e">$525.55</td>
<td class="r2e">44.23</td>
<td class="r2e">7.16</td>
<td class="r2e">0.60</td>
<td class="r2e">3.39</td>
<td class="r3e">2.33</td>
<td class="r3e">0.68</td>
<td class="r3e">0.26</td>
<td class="r3e">0.12</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=283388">Minsk</a></td>
<td class="r1o">2109</td>
<td class="r1o">324</td>
<td class="r1o">$189.66</td>
<td class="r2o">16.05</td>
<td class="r2o">0.43</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=293387">abiczo</a></td>
<td class="r1e">2137</td>
<td class="r1e">403</td>
<td class="r1e">$190.93</td>
<td class="r2e">23.18</td>
<td class="r2e">1.27</td>
<td class="r2e">0.01</td>
<td class="r2e">0.12</td>
<td class="r3e">0.10</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=289309">qixin99</a></td>
<td class="r1o">2214</td>
<td class="r1o">445</td>
<td class="r1o">$356.83</td>
<td class="r2o">31.20</td>
<td class="r2o">2.76</td>
<td class="r2o">0.06</td>
<td class="r2o">0.42</td>
<td class="r3o">0.33</td>
<td class="r3o">0.07</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8474430">kupo</a></td>
<td class="r1e">2106</td>
<td class="r1e">337</td>
<td class="r1e">$192.57</td>
<td class="r2e">16.75</td>
<td class="r2e">0.50</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7448473">danlief</a></td>
<td class="r1o">2107</td>
<td class="r1o">369</td>
<td class="r1o">$289.30</td>
<td class="r2o">22.07</td>
<td class="r2o">0.85</td>
<td class="r2o">0.00</td>
<td class="r2o">0.04</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156491">chogyonim</a></td>
<td class="r1e">1952</td>
<td class="r1e">317</td>
<td class="r1e">$158.88</td>
<td class="r2e">8.46</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=287979">Oblok</a></td>
<td class="r1o">2049</td>
<td class="r1o">463</td>
<td class="r1o">$314.13</td>
<td class="r2o">22.81</td>
<td class="r2o">1.23</td>
<td class="r2o">0.01</td>
<td class="r2o">0.11</td>
<td class="r3o">0.09</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8391762">ltank</a></td>
<td class="r1e">1937</td>
<td class="r1e">315</td>
<td class="r1e">$175.66</td>
<td class="r2e">7.66</td>
<td class="r2e">0.06</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=284038">aussie</a></td>
<td class="r1o">2006</td>
<td class="r1o">446</td>
<td class="r1o">$277.99</td>
<td class="r2o">19.18</td>
<td class="r2o">0.79</td>
<td class="r2o">0.01</td>
<td class="r2o">0.05</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8349001">belzebub</a></td>
<td class="r1e">2024</td>
<td class="r1e">575</td>
<td class="r1e">$332.44</td>
<td class="r2e">25.95</td>
<td class="r2e">2.03</td>
<td class="r2e">0.05</td>
<td class="r2e">0.31</td>
<td class="r3e">0.25</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=288581">zalenski</a></td>
<td class="r1o">2150</td>
<td class="r1o">499</td>
<td class="r1o">$354.15</td>
<td class="r2o">31.48</td>
<td class="r2o">2.84</td>
<td class="r2o">0.07</td>
<td class="r2o">0.29</td>
<td class="r3o">0.23</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10197516">herbert_duarte</a></td>
<td class="r1e">1809</td>
<td class="r1e">415</td>
<td class="r1e">$281.71</td>
<td class="r2e">7.92</td>
<td class="r2e">0.10</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7540456">dexy</a></td>
<td class="r1o">1789</td>
<td class="r1o">422</td>
<td class="r1o">$230.39</td>
<td class="r2o">7.59</td>
<td class="r2o">0.09</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10540401">kindloaf</a></td>
<td class="r1e">1653</td>
<td class="r1e">504</td>
<td class="r1e">$197.96</td>
<td class="r2e">6.98</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
</table>
<br/>
<br/>
</td></tr>
</table>
</body>

</html>
