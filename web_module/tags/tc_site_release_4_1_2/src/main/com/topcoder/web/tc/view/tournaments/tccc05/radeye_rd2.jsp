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

               <p>NOTE: The "Earnings" column does not include the possible $30 a member wins for being among the top three scorers in each room</p>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="r1o">3492</td>
<td class="r1o">251</td>
<td class="r1o">$14,007.27</td>
<td class="r2o">100.00</td>
<td class="r2o">100.00</td>
<td class="r2o">100.00</td>
<td class="r2o">17.34</td>
<td class="r2o">10.95</td>
<td class="r2o">92.89</td>
<td class="r3o">1.72</td>
<td class="r3o">10.26</td>
<td class="r3o">29.57</td>
<td class="r3o">51.34</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260835">reid</a></td>
<td class="r1e">3217</td>
<td class="r1e">358</td>
<td class="r1e">$6,367.28</td>
<td class="r2e">99.98</td>
<td class="r2e">99.71</td>
<td class="r2e">97.87</td>
<td class="r2e">34.25</td>
<td class="r2e">13.30</td>
<td class="r2e">66.11</td>
<td class="r3e">10.42</td>
<td class="r3e">21.88</td>
<td class="r3e">20.29</td>
<td class="r3e">13.52</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="r1o">3322</td>
<td class="r1o">370</td>
<td class="r1o">$8,255.02</td>
<td class="r2o">99.99</td>
<td class="r2o">99.84</td>
<td class="r2o">98.77</td>
<td class="r2o">37.29</td>
<td class="r2o">19.34</td>
<td class="r2o">72.29</td>
<td class="r3o">7.39</td>
<td class="r3o">18.26</td>
<td class="r3o">24.46</td>
<td class="r3o">22.19</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="r1e">3099</td>
<td class="r1e">442</td>
<td class="r1e">$3,576.37</td>
<td class="r2e">99.61</td>
<td class="r2e">97.32</td>
<td class="r2e">89.98</td>
<td class="r2e">41.48</td>
<td class="r2e">14.42</td>
<td class="r2e">40.07</td>
<td class="r3e">11.26</td>
<td class="r3e">12.30</td>
<td class="r3e">9.59</td>
<td class="r3e">6.92</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="r1o">2864</td>
<td class="r1o">402</td>
<td class="r1o">$1,387.23</td>
<td class="r2o">99.06</td>
<td class="r2o">93.77</td>
<td class="r2o">78.74</td>
<td class="r2o">32.62</td>
<td class="r2o">5.28</td>
<td class="r2o">18.44</td>
<td class="r3o">8.27</td>
<td class="r3o">6.04</td>
<td class="r3o">2.98</td>
<td class="r3o">1.16</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262936">dgarthur</a></td>
<td class="r1e">2809</td>
<td class="r1e">407</td>
<td class="r1e">$939.47</td>
<td class="r2e">98.56</td>
<td class="r2e">91.44</td>
<td class="r2e">73.26</td>
<td class="r2e">31.95</td>
<td class="r2e">4.36</td>
<td class="r2e">10.93</td>
<td class="r3e">5.28</td>
<td class="r3e">3.41</td>
<td class="r3e">1.63</td>
<td class="r3e">0.61</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287496">bstanescu</a></td>
<td class="r1o">2736</td>
<td class="r1o">360</td>
<td class="r1o">$610.32</td>
<td class="r2o">98.82</td>
<td class="r2o">91.50</td>
<td class="r2o">70.82</td>
<td class="r2o">28.77</td>
<td class="r2o">2.56</td>
<td class="r2o">5.36</td>
<td class="r3o">2.89</td>
<td class="r3o">1.66</td>
<td class="r3o">0.64</td>
<td class="r3o">0.16</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="r1e">2817</td>
<td class="r1e">317</td>
<td class="r1e">$861.66</td>
<td class="r2e">99.76</td>
<td class="r2e">96.82</td>
<td class="r2e">83.81</td>
<td class="r2e">39.87</td>
<td class="r2e">4.23</td>
<td class="r2e">9.38</td>
<td class="r3e">4.57</td>
<td class="r3e">3.24</td>
<td class="r3e">1.29</td>
<td class="r3e">0.28</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="r1o">2811</td>
<td class="r1o">404</td>
<td class="r1o">$973.69</td>
<td class="r2o">98.63</td>
<td class="r2o">91.71</td>
<td class="r2o">73.79</td>
<td class="r2o">29.87</td>
<td class="r2o">4.15</td>
<td class="r2o">11.66</td>
<td class="r3o">5.63</td>
<td class="r3o">3.69</td>
<td class="r3o">1.73</td>
<td class="r3o">0.62</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310333">kalinov</a></td>
<td class="r1e">2863</td>
<td class="r1e">482</td>
<td class="r1e">$1,308.93</td>
<td class="r2e">97.50</td>
<td class="r2e">88.81</td>
<td class="r2e">70.69</td>
<td class="r2e">27.19</td>
<td class="r2e">5.31</td>
<td class="r2e">15.98</td>
<td class="r3e">7.07</td>
<td class="r3e">4.72</td>
<td class="r3e">2.69</td>
<td class="r3e">1.50</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7479769">marian</a></td>
<td class="r1o">2733</td>
<td class="r1o">369</td>
<td class="r1o">$705.40</td>
<td class="r2o">98.62</td>
<td class="r2o">90.69</td>
<td class="r2o">69.49</td>
<td class="r2o">24.21</td>
<td class="r2o">2.29</td>
<td class="r2o">6.80</td>
<td class="r3o">3.64</td>
<td class="r3o">2.14</td>
<td class="r3o">0.82</td>
<td class="r3o">0.20</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=275071">antimatter</a></td>
<td class="r1e">2677</td>
<td class="r1e">298</td>
<td class="r1e">$540.72</td>
<td class="r2e">99.44</td>
<td class="r2e">93.32</td>
<td class="r2e">70.95</td>
<td class="r2e">22.16</td>
<td class="r2e">1.17</td>
<td class="r2e">3.46</td>
<td class="r3e">2.03</td>
<td class="r3e">1.09</td>
<td class="r3e">0.30</td>
<td class="r3e">0.04</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310430">gepa</a></td>
<td class="r1o">2704</td>
<td class="r1o">341</td>
<td class="r1o">$608.43</td>
<td class="r2o">98.92</td>
<td class="r2o">91.37</td>
<td class="r2o">69.25</td>
<td class="r2o">23.62</td>
<td class="r2o">1.73</td>
<td class="r2o">4.96</td>
<td class="r3o">2.78</td>
<td class="r3o">1.55</td>
<td class="r3o">0.52</td>
<td class="r3o">0.10</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8365685">pparys</a></td>
<td class="r1e">2630</td>
<td class="r1e">464</td>
<td class="r1e">$489.49</td>
<td class="r2e">93.74</td>
<td class="r2e">76.39</td>
<td class="r2e">48.76</td>
<td class="r2e">14.13</td>
<td class="r2e">1.29</td>
<td class="r2e">4.32</td>
<td class="r3e">2.56</td>
<td class="r3e">1.14</td>
<td class="r3e">0.46</td>
<td class="r3e">0.16</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262056">mathijs</a></td>
<td class="r1o">2674</td>
<td class="r1o">580</td>
<td class="r1o">$642.07</td>
<td class="r2o">90.38</td>
<td class="r2o">71.05</td>
<td class="r2o">45.51</td>
<td class="r2o">13.41</td>
<td class="r2o">1.94</td>
<td class="r2o">6.89</td>
<td class="r3o">3.81</td>
<td class="r3o">1.67</td>
<td class="r3o">0.86</td>
<td class="r3o">0.54</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7311097">m00tz</a></td>
<td class="r1e">2682</td>
<td class="r1e">316</td>
<td class="r1e">$532.38</td>
<td class="r2e">99.19</td>
<td class="r2e">92.20</td>
<td class="r2e">69.43</td>
<td class="r2e">22.47</td>
<td class="r2e">1.32</td>
<td class="r2e">3.33</td>
<td class="r3e">1.96</td>
<td class="r3e">1.03</td>
<td class="r3e">0.30</td>
<td class="r3e">0.05</td></tr>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=10481120">ivan_metelsky</a></td>
<td class="r1o">2539</td>
<td class="r1o">339</td>
<td class="r1o">$324.36</td>
<td class="r2o">96.62</td>
<td class="r2o">80.20</td>
<td class="r2o">46.92</td>
<td class="r2o">9.94</td>
<td class="r2o">0.34</td>
<td class="r2o">1.08</td>
<td class="r3o">0.74</td>
<td class="r3o">0.27</td>
<td class="r3o">0.06</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308453">overwise</a></td>
<td class="r1e">2581</td>
<td class="r1e">348</td>
<td class="r1e">$377.09</td>
<td class="r2e">97.12</td>
<td class="r2e">82.86</td>
<td class="r2e">52.16</td>
<td class="r2e">12.49</td>
<td class="r2e">0.56</td>
<td class="r2e">1.71</td>
<td class="r3e">1.11</td>
<td class="r3e">0.46</td>
<td class="r3e">0.12</td>
<td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=9906197">krijgertje</a></td>
<td class="r1o">2523</td>
<td class="r1o">340</td>
<td class="r1o">$307.46</td>
<td class="r2o">96.20</td>
<td class="r2o">78.63</td>
<td class="r2o">44.54</td>
<td class="r2o">8.60</td>
<td class="r2o">0.28</td>
<td class="r2o">0.96</td>
<td class="r3o">0.66</td>
<td class="r3o">0.24</td>
<td class="r3o">0.06</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=261024">grotmol</a></td>
<td class="r1e">2498</td>
<td class="r1e">503</td>
<td class="r1e">$296.52</td>
<td class="r2e">87.55</td>
<td class="r2e">62.45</td>
<td class="r2e">32.76</td>
<td class="r2e">6.91</td>
<td class="r2e">0.48</td>
<td class="r2e">2.02</td>
<td class="r3e">1.33</td>
<td class="r3e">0.47</td>
<td class="r3e">0.17</td>
<td class="r3e">0.06</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="r1o">2522</td>
<td class="r1o">312</td>
<td class="r1o">$325.40</td>
<td class="r2o">97.30</td>
<td class="r2o">81.40</td>
<td class="r2o">46.49</td>
<td class="r2o">8.19</td>
<td class="r2o">0.22</td>
<td class="r2o">0.78</td>
<td class="r3o">0.54</td>
<td class="r3o">0.19</td>
<td class="r3o">0.04</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=263396">Abednego</a></td>
<td class="r1e">2557</td>
<td class="r1e">282</td>
<td class="r1e">$376.25</td>
<td class="r2e">98.79</td>
<td class="r2e">87.55</td>
<td class="r2e">54.81</td>
<td class="r2e">10.24</td>
<td class="r2e">0.27</td>
<td class="r2e">0.87</td>
<td class="r3e">0.58</td>
<td class="r3e">0.23</td>
<td class="r3e">0.04</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=156592">benetin</a></td>
<td class="r1o">2425</td>
<td class="r1o">501</td>
<td class="r1o">$236.27</td>
<td class="r2o">84.44</td>
<td class="r2o">55.93</td>
<td class="r2o">26.10</td>
<td class="r2o">4.60</td>
<td class="r2o">0.25</td>
<td class="r2o">1.20</td>
<td class="r3o">0.83</td>
<td class="r3o">0.26</td>
<td class="r3o">0.08</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=286911">XuChuan</a></td>
<td class="r1e">2436</td>
<td class="r1e">392</td>
<td class="r1e">$237.79</td>
<td class="r2e">90.67</td>
<td class="r2e">64.68</td>
<td class="r2e">30.31</td>
<td class="r2e">4.67</td>
<td class="r2e">0.14</td>
<td class="r2e">0.65</td>
<td class="r3e">0.47</td>
<td class="r3e">0.14</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=10332088">martinp534</a></td>
<td class="r1o">2401</td>
<td class="r1o">298</td>
<td class="r1o">$210.73</td>
<td class="r2o">94.68</td>
<td class="r2o">69.40</td>
<td class="r2o">28.74</td>
<td class="r2o">2.87</td>
<td class="r2o">0.04</td>
<td class="r2o">0.16</td>
<td class="r3o">0.12</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7452866">Im2Good</a></td>
<td class="r1e">2498</td>
<td class="r1e">385</td>
<td class="r1e">$299.31</td>
<td class="r2e">93.37</td>
<td class="r2e">71.78</td>
<td class="r2e">38.23</td>
<td class="r2e">7.04</td>
<td class="r2e">0.28</td>
<td class="r2e">1.09</td>
<td class="r3e">0.75</td>
<td class="r3e">0.26</td>
<td class="r3e">0.07</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7421158">Per</a></td>
<td class="r1o">2601</td>
<td class="r1o">531</td>
<td class="r1o">$472.55</td>
<td class="r2o">90.11</td>
<td class="r2o">69.13</td>
<td class="r2o">41.51</td>
<td class="r2o">10.43</td>
<td class="r2o">1.10</td>
<td class="r2o">4.24</td>
<td class="r3o">2.53</td>
<td class="r3o">1.04</td>
<td class="r3o">0.46</td>
<td class="r3o">0.21</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309982">cyfra</a></td>
<td class="r1e">2441</td>
<td class="r1e">417</td>
<td class="r1e">$241.87</td>
<td class="r2e">89.50</td>
<td class="r2e">63.19</td>
<td class="r2e">30.04</td>
<td class="r2e">5.00</td>
<td class="r2e">0.19</td>
<td class="r2e">0.79</td>
<td class="r3e">0.56</td>
<td class="r3e">0.17</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=9927526">Vedensky</a></td>
<td class="r1o">2361</td>
<td class="r1o">291</td>
<td class="r1o">$176.82</td>
<td class="r2o">93.52</td>
<td class="r2o">64.62</td>
<td class="r2o">23.27</td>
<td class="r2o">1.88</td>
<td class="r2o">0.02</td>
<td class="r2o">0.08</td>
<td class="r3o">0.06</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8349097">hauser</a></td>
<td class="r1e">2379</td>
<td class="r1e">358</td>
<td class="r1e">$189.74</td>
<td class="r2e">90.08</td>
<td class="r2e">60.92</td>
<td class="r2e">24.58</td>
<td class="r2e">2.91</td>
<td class="r2e">0.05</td>
<td class="r2e">0.24</td>
<td class="r3e">0.18</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260987">dangelo</a></td>
<td class="r1o">2359</td>
<td class="r1o">331</td>
<td class="r1o">$180.25</td>
<td class="r2o">90.81</td>
<td class="r2o">60.64</td>
<td class="r2o">22.63</td>
<td class="r2o">2.22</td>
<td class="r2o">0.03</td>
<td class="r2o">0.13</td>
<td class="r3o">0.10</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="r1e">2316</td>
<td class="r1e">440</td>
<td class="r1e">$155.17</td>
<td class="r2e">81.70</td>
<td class="r2e">48.23</td>
<td class="r2e">17.64</td>
<td class="r2e">2.15</td>
<td class="r2e">0.05</td>
<td class="r2e">0.28</td>
<td class="r3e">0.21</td>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8357090">misof</a></td>
<td class="r1o">2397</td>
<td class="r1o">420</td>
<td class="r1o">$211.99</td>
<td class="r2o">87.27</td>
<td class="r2o">58.26</td>
<td class="r2o">25.29</td>
<td class="r2o">3.76</td>
<td class="r2o">0.12</td>
<td class="r2o">0.51</td>
<td class="r3o">0.38</td>
<td class="r3o">0.11</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=288584">LunaticFringe</a></td>
<td class="r1e">2452</td>
<td class="r1e">432</td>
<td class="r1e">$260.41</td>
<td class="r2e">89.17</td>
<td class="r2e">63.17</td>
<td class="r2e">30.70</td>
<td class="r2e">5.45</td>
<td class="r2e">0.23</td>
<td class="r2e">0.93</td>
<td class="r3e">0.65</td>
<td class="r3e">0.21</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=264869">ante</a></td>
<td class="r1o">2453</td>
<td class="r1o">615</td>
<td class="r1o">$288.46</td>
<td class="r2o">80.79</td>
<td class="r2o">52.56</td>
<td class="r2o">25.79</td>
<td class="r2o">5.23</td>
<td class="r2o">0.47</td>
<td class="r2o">2.15</td>
<td class="r3o">1.42</td>
<td class="r3o">0.44</td>
<td class="r3o">0.19</td>
<td class="r3o">0.10</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8601171">HilbertRaum</a></td>
<td class="r1e">2291</td>
<td class="r1e">423</td>
<td class="r1e">$140.60</td>
<td class="r2e">81.10</td>
<td class="r2e">46.28</td>
<td class="r2e">15.68</td>
<td class="r2e">1.65</td>
<td class="r2e">0.03</td>
<td class="r2e">0.18</td>
<td class="r3e">0.14</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7502813">monsoon</a></td>
<td class="r1o">2391</td>
<td class="r1o">328</td>
<td class="r1o">$210.62</td>
<td class="r2o">92.49</td>
<td class="r2o">65.10</td>
<td class="r2o">26.68</td>
<td class="r2o">2.91</td>
<td class="r2o">0.04</td>
<td class="r2o">0.19</td>
<td class="r3o">0.14</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="r1e">2362</td>
<td class="r1e">331</td>
<td class="r1e">$186.86</td>
<td class="r2e">90.94</td>
<td class="r2e">61.03</td>
<td class="r2e">23.03</td>
<td class="r2e">2.23</td>
<td class="r2e">0.03</td>
<td class="r2e">0.14</td>
<td class="r3e">0.11</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=289435">nullspace</a></td>
<td class="r1o">2358</td>
<td class="r1o">351</td>
<td class="r1o">$183.52</td>
<td class="r2o">89.45</td>
<td class="r2o">58.84</td>
<td class="r2o">22.34</td>
<td class="r2o">2.29</td>
<td class="r2o">0.04</td>
<td class="r2o">0.17</td>
<td class="r3o">0.13</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=153902">evd</a></td>
<td class="r1e">2278</td>
<td class="r1e">288</td>
<td class="r1e">$125.14</td>
<td class="r2e">89.34</td>
<td class="r2e">52.32</td>
<td class="r2e">13.66</td>
<td class="r2e">0.67</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=302501">PMH</a></td>
<td class="r1o">2276</td>
<td class="r1o">752</td>
<td class="r1o">$177.58</td>
<td class="r2o">68.30</td>
<td class="r2o">36.32</td>
<td class="r2o">14.51</td>
<td class="r2o">2.27</td>
<td class="r2o">0.20</td>
<td class="r2o">1.20</td>
<td class="r3o">0.85</td>
<td class="r3o">0.20</td>
<td class="r3o">0.09</td>
<td class="r3o">0.06</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=9958600">Zis</a></td>
<td class="r1e">2340</td>
<td class="r1e">332</td>
<td class="r1e">$175.04</td>
<td class="r2e">89.75</td>
<td class="r2e">57.99</td>
<td class="r2e">20.54</td>
<td class="r2e">1.76</td>
<td class="r2e">0.02</td>
<td class="r2e">0.11</td>
<td class="r3e">0.09</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7394165">PaulJefferys</a></td>
<td class="r1o">2318</td>
<td class="r1o">209</td>
<td class="r1o">$155.68</td>
<td class="r2o">97.08</td>
<td class="r2o">66.63</td>
<td class="r2o">16.64</td>
<td class="r2o">0.51</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=303644">Olexiy</a></td>
<td class="r1e">2354</td>
<td class="r1e">412</td>
<td class="r1e">$188.16</td>
<td class="r2e">85.48</td>
<td class="r2e">54.00</td>
<td class="r2e">21.27</td>
<td class="r2e">2.53</td>
<td class="r2e">0.06</td>
<td class="r2e">0.34</td>
<td class="r3e">0.25</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308657">skanthak</a></td>
<td class="r1o">2355</td>
<td class="r1o">384</td>
<td class="r1o">$189.80</td>
<td class="r2o">87.23</td>
<td class="r2o">56.00</td>
<td class="r2o">21.72</td>
<td class="r2o">2.36</td>
<td class="r2o">0.05</td>
<td class="r2o">0.25</td>
<td class="r3o">0.19</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=346607">kalmakka</a></td>
<td class="r1e">2295</td>
<td class="r1e">373</td>
<td class="r1e">$149.04</td>
<td class="r2e">84.35</td>
<td class="r2e">49.29</td>
<td class="r2e">16.05</td>
<td class="r2e">1.32</td>
<td class="r2e">0.02</td>
<td class="r2e">0.11</td>
<td class="r3e">0.09</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=304031">Ruberik</a></td>
<td class="r1o">2410</td>
<td class="r1o">508</td>
<td class="r1o">$239.00</td>
<td class="r2o">83.37</td>
<td class="r2o">54.11</td>
<td class="r2o">24.71</td>
<td class="r2o">4.01</td>
<td class="r2o">0.22</td>
<td class="r2o">1.11</td>
<td class="r3o">0.78</td>
<td class="r3o">0.23</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8398526">Tomy</a></td>
<td class="r1e">2296</td>
<td class="r1e">339</td>
<td class="r1e">$149.18</td>
<td class="r2e">86.70</td>
<td class="r2e">51.49</td>
<td class="r2e">16.02</td>
<td class="r2e">1.10</td>
<td class="r2e">0.01</td>
<td class="r2e">0.07</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7360309">dmks</a></td>
<td class="r1o">2195</td>
<td class="r1o">363</td>
<td class="r1o">$93.76</td>
<td class="r2o">77.69</td>
<td class="r2o">37.07</td>
<td class="r2o">8.56</td>
<td class="r2o">0.42</td>
<td class="r2o">0.00</td>
<td class="r2o">0.03</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=113178">po</a></td>
<td class="r1e">2196</td>
<td class="r1e">275</td>
<td class="r1e">$83.36</td>
<td class="r2e">84.31</td>
<td class="r2e">39.77</td>
<td class="r2e">6.77</td>
<td class="r2e">0.16</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7210680">cnettel</a></td>
<td class="r1o">2315</td>
<td class="r1o">390</td>
<td class="r1o">$167.33</td>
<td class="r2o">84.53</td>
<td class="r2o">50.79</td>
<td class="r2o">17.85</td>
<td class="r2o">1.67</td>
<td class="r2o">0.03</td>
<td class="r2o">0.19</td>
<td class="r3o">0.15</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7442498">marek.cygan</a></td>
<td class="r1e">2225</td>
<td class="r1e">201</td>
<td class="r1e">$91.70</td>
<td class="r2e">93.44</td>
<td class="r2e">48.50</td>
<td class="r2e">6.31</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7485898">Andrew_Lazarev</a></td>
<td class="r1o">2193</td>
<td class="r1o">415</td>
<td class="r1o">$101.92</td>
<td class="r2o">74.60</td>
<td class="r2o">35.65</td>
<td class="r2o">9.20</td>
<td class="r2o">0.59</td>
<td class="r2o">0.01</td>
<td class="r2o">0.06</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7390467">lovro</a></td>
<td class="r1e">2321</td>
<td class="r1e">473</td>
<td class="r1e">$176.05</td>
<td class="r2e">80.29</td>
<td class="r2e">47.23</td>
<td class="r2e">18.03</td>
<td class="r2e">2.19</td>
<td class="r2e">0.07</td>
<td class="r2e">0.44</td>
<td class="r3e">0.33</td>
<td class="r3e">0.08</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8394868">rem</a></td>
<td class="r1o">2269</td>
<td class="r1o">291</td>
<td class="r1o">$137.66</td>
<td class="r2o">88.53</td>
<td class="r2o">50.68</td>
<td class="r2o">13.07</td>
<td class="r2o">0.57</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=284007">Ryan</a></td>
<td class="r1e">2235</td>
<td class="r1e">380</td>
<td class="r1e">$123.67</td>
<td class="r2e">79.77</td>
<td class="r2e">41.49</td>
<td class="r2e">11.54</td>
<td class="r2e">0.75</td>
<td class="r2e">0.01</td>
<td class="r2e">0.06</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307638">Wernie</a></td>
<td class="r1o">2228</td>
<td class="r1o">614</td>
<td class="r1o">$140.41</td>
<td class="r2o">69.29</td>
<td class="r2o">35.16</td>
<td class="r2o">12.41</td>
<td class="r2o">1.53</td>
<td class="r2o">0.07</td>
<td class="r2o">0.53</td>
<td class="r3o">0.40</td>
<td class="r3o">0.09</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8493941">asaveljevs</a></td>
<td class="r1e">2136</td>
<td class="r1e">332</td>
<td class="r1e">$73.65</td>
<td class="r2e">74.36</td>
<td class="r2e">30.13</td>
<td class="r2e">5.17</td>
<td class="r2e">0.15</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=158333">dvickrey</a></td>
<td class="r1o">2180</td>
<td class="r1o">309</td>
<td class="r1o">$91.75</td>
<td class="r2o">80.09</td>
<td class="r2o">36.39</td>
<td class="r2o">7.01</td>
<td class="r2o">0.21</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7264865">bogklug</a></td>
<td class="r1e">2212</td>
<td class="r1e">342</td>
<td class="r1e">$112.47</td>
<td class="r2e">80.46</td>
<td class="r2e">39.89</td>
<td class="r2e">9.76</td>
<td class="r2e">0.46</td>
<td class="r2e">0.00</td>
<td class="r2e">0.03</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=268904">szymcio</a></td>
<td class="r1o">2184</td>
<td class="r1o">521</td>
<td class="r1o">$118.18</td>
<td class="r2o">69.47</td>
<td class="r2o">33.02</td>
<td class="r2o">10.10</td>
<td class="r2o">0.95</td>
<td class="r2o">0.03</td>
<td class="r2o">0.19</td>
<td class="r3o">0.15</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2058469">robymus</a></td>
<td class="r1e">2109</td>
<td class="r1e">222</td>
<td class="r1e">$54.07</td>
<td class="r2e">80.28</td>
<td class="r2e">25.50</td>
<td class="r2e">1.97</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=263379">StefanPochmann</a></td>
<td class="r1o">2191</td>
<td class="r1o">446</td>
<td class="r1o">$116.55</td>
<td class="r2o">72.94</td>
<td class="r2o">34.86</td>
<td class="r2o">9.96</td>
<td class="r2o">0.75</td>
<td class="r2o">0.01</td>
<td class="r2o">0.09</td>
<td class="r3o">0.08</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=309786">Yi_Zhang</a></td>
<td class="r1e">2032</td>
<td class="r1e">310</td>
<td class="r1e">$42.91</td>
<td class="r2e">64.24</td>
<td class="r2e">17.85</td>
<td class="r2e">1.80</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=345006">DAle</a></td>
<td class="r1o">2032</td>
<td class="r1o">314</td>
<td class="r1o">$43.65</td>
<td class="r2o">64.05</td>
<td class="r2o">17.93</td>
<td class="r2o">1.86</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=261567">gilbert</a></td>
<td class="r1e">2016</td>
<td class="r1e">324</td>
<td class="r1e">$41.06</td>
<td class="r2e">61.79</td>
<td class="r2e">16.65</td>
<td class="r2e">1.71</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7512490">petko</a></td>
<td class="r1o">2158</td>
<td class="r1o">415</td>
<td class="r1o">$101.04</td>
<td class="r2o">71.80</td>
<td class="r2o">31.91</td>
<td class="r2o">8.04</td>
<td class="r2o">0.47</td>
<td class="r2o">0.00</td>
<td class="r2o">0.04</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=286375">bjacoke001</a></td>
<td class="r1e">2080</td>
<td class="r1e">293</td>
<td class="r1e">$56.87</td>
<td class="r2e">70.86</td>
<td class="r2e">22.86</td>
<td class="r2e">2.78</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=347569">Savior</a></td>
<td class="r1o">2255</td>
<td class="r1o">542</td>
<td class="r1o">$156.30</td>
<td class="r2o">73.27</td>
<td class="r2o">38.76</td>
<td class="r2o">14.37</td>
<td class="r2o">1.75</td>
<td class="r2o">0.06</td>
<td class="r2o">0.41</td>
<td class="r3o">0.31</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td>
<td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7582361">zbogi</a></td>
<td class="r1e">2020</td>
<td class="r1e">317</td>
<td class="r1e">$42.46</td>
<td class="r2e">62.51</td>
<td class="r2e">16.87</td>
<td class="r2e">1.78</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7433858">liympanda</a></td>
<td class="r1o">2162</td>
<td class="r1o">444</td>
<td class="r1o">$106.26</td>
<td class="r2o">70.84</td>
<td class="r2o">32.01</td>
<td class="r2o">8.78</td>
<td class="r2o">0.61</td>
<td class="r2o">0.01</td>
<td class="r2o">0.06</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8584656">Ulan</a></td>
<td class="r1e">2131</td>
<td class="r1e">462</td>
<td class="r1e">$95.31</td>
<td class="r2e">67.73</td>
<td class="r2e">28.95</td>
<td class="r2e">7.54</td>
<td class="r2e">0.50</td>
<td class="r2e">0.01</td>
<td class="r2e">0.05</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=303185">Cosmin.ro</a></td>
<td class="r1o">2171</td>
<td class="r1o">497</td>
<td class="r1o">$114.26</td>
<td class="r2o">69.45</td>
<td class="r2o">32.26</td>
<td class="r2o">9.79</td>
<td class="r2o">0.86</td>
<td class="r2o">0.02</td>
<td class="r2o">0.12</td>
<td class="r3o">0.10</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=276749">jonderry</a></td>
<td class="r1e">2080</td>
<td class="r1e">301</td>
<td class="r1e">$60.08</td>
<td class="r2e">70.38</td>
<td class="r2e">23.07</td>
<td class="r2e">3.11</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7546003">dmytro</a></td>
<td class="r1o">2059</td>
<td class="r1o">341</td>
<td class="r1o">$58.22</td>
<td class="r2o">65.95</td>
<td class="r2o">21.37</td>
<td class="r2o">3.17</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=111202">ColinMacLeod</a></td>
<td class="r1e">2034</td>
<td class="r1e">246</td>
<td class="r1e">$37.00</td>
<td class="r2e">67.97</td>
<td class="r2e">15.87</td>
<td class="r2e">1.13</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7584235">agh</a></td>
<td class="r1o">2137</td>
<td class="r1o">368</td>
<td class="r1o">$91.44</td>
<td class="r2o">72.38</td>
<td class="r2o">30.14</td>
<td class="r2o">6.68</td>
<td class="r2o">0.27</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=268851">gladius</a></td>
<td class="r1e">2076</td>
<td class="r1e">452</td>
<td class="r1e">$76.09</td>
<td class="r2e">63.59</td>
<td class="r2e">24.11</td>
<td class="r2e">5.36</td>
<td class="r2e">0.28</td>
<td class="r2e">0.00</td>
<td class="r2e">0.02</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10526732">zjq</a></td>
<td class="r1o">2048</td>
<td class="r1o">470</td>
<td class="r1o">$69.31</td>
<td class="r2o">60.86</td>
<td class="r2o">21.97</td>
<td class="r2o">4.69</td>
<td class="r2o">0.25</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7584555">abi_k</a></td>
<td class="r1e">2025</td>
<td class="r1e">505</td>
<td class="r1e">$66.50</td>
<td class="r2e">58.35</td>
<td class="r2e">20.61</td>
<td class="r2e">4.46</td>
<td class="r2e">0.25</td>
<td class="r2e">0.00</td>
<td class="r2e">0.03</td>
<td class="r3e">0.02</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=283388">Minsk</a></td>
<td class="r1o">2031</td>
<td class="r1o">324</td>
<td class="r1o">$52.76</td>
<td class="r2o">63.48</td>
<td class="r2o">18.21</td>
<td class="r2o">2.22</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=309454">bugzpodder</a></td>
<td class="r1e">1958</td>
<td class="r1e">361</td>
<td class="r1e">$38.95</td>
<td class="r2e">54.31</td>
<td class="r2e">13.05</td>
<td class="r2e">1.38</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7338095">tomal</a></td>
<td class="r1o">1976</td>
<td class="r1o">401</td>
<td class="r1o">$47.99</td>
<td class="r2o">55.69</td>
<td class="r2o">15.46</td>
<td class="r2o">2.12</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=307070">qsort</a></td>
<td class="r1e">2011</td>
<td class="r1e">688</td>
<td class="r1e">$82.63</td>
<td class="r2e">55.33</td>
<td class="r2e">21.26</td>
<td class="r2e">5.82</td>
<td class="r2e">0.56</td>
<td class="r2e">0.02</td>
<td class="r2e">0.15</td>
<td class="r3e">0.12</td>
<td class="r3e">0.02</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9964455">Crush</a></td>
<td class="r1o">2015</td>
<td class="r1o">475</td>
<td class="r1o">$66.27</td>
<td class="r2o">58.03</td>
<td class="r2o">19.71</td>
<td class="r2o">3.88</td>
<td class="r2o">0.19</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=293387">abiczo</a></td>
<td class="r1e">1985</td>
<td class="r1e">477</td>
<td class="r1e">$59.27</td>
<td class="r2e">55.53</td>
<td class="r2e">17.67</td>
<td class="r2e">3.20</td>
<td class="r2e">0.14</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11888018">Snail</a></td>
<td class="r1o">1954</td>
<td class="r1o">282</td>
<td class="r1o">$31.31</td>
<td class="r2o">54.95</td>
<td class="r2o">10.16</td>
<td class="r2o">0.60</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7454301">paranoia</a></td>
<td class="r1e">2169</td>
<td class="r1e">809</td>
<td class="r1e">$150.25</td>
<td class="r2e">62.15</td>
<td class="r2e">29.86</td>
<td class="r2e">11.22</td>
<td class="r2e">1.63</td>
<td class="r2e">0.13</td>
<td class="r2e">0.78</td>
<td class="r3e">0.57</td>
<td class="r3e">0.11</td>
<td class="r3e">0.05</td>
<td class="r3e">0.04</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7389864">roma</a></td>
<td class="r1o">1967</td>
<td class="r1o">465</td>
<td class="r1o">$55.16</td>
<td class="r2o">54.13</td>
<td class="r2o">16.36</td>
<td class="r2o">2.71</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289309">qixin99</a></td>
<td class="r1e">1951</td>
<td class="r1e">356</td>
<td class="r1e">$40.78</td>
<td class="r2e">53.58</td>
<td class="r2e">12.71</td>
<td class="r2e">1.27</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9947660">Chicken1</a></td>
<td class="r1o">1832</td>
<td class="r1o">232</td>
<td class="r1o">$14.61</td>
<td class="r2o">35.41</td>
<td class="r2o">2.08</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7281980">eldering</a></td>
<td class="r1e">1917</td>
<td class="r1e">439</td>
<td class="r1e">$49.04</td>
<td class="r2e">49.81</td>
<td class="r2e">12.71</td>
<td class="r2e">1.63</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=275558">zhliu</a></td>
<td class="r1o">1953</td>
<td class="r1o">448</td>
<td class="r1o">$58.06</td>
<td class="r2o">53.05</td>
<td class="r2o">15.24</td>
<td class="r2o">2.28</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=302053">oldbig</a></td>
<td class="r1e">1852</td>
<td class="r1e">525</td>
<td class="r1e">$44.56</td>
<td class="r2e">44.93</td>
<td class="r2e">11.26</td>
<td class="r2e">1.58</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7503639">blackbeltcoder4</a></td>
<td class="r1o">1858</td>
<td class="r1o">261</td>
<td class="r1o">$21.36</td>
<td class="r2o">40.78</td>
<td class="r2o">3.95</td>
<td class="r2o">0.09</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10005564">adamg</a></td>
<td class="r1e">1830</td>
<td class="r1e">313</td>
<td class="r1e">$22.56</td>
<td class="r2e">38.78</td>
<td class="r2e">4.61</td>
<td class="r2e">0.17</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7305703">Dumitru</a></td>
<td class="r1o">1904</td>
<td class="r1o">434</td>
<td class="r1o">$46.81</td>
<td class="r2o">48.62</td>
<td class="r2o">11.97</td>
<td class="r2o">1.44</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=349303">OpenGL4Dummies</a></td>
<td class="r1e">1845</td>
<td class="r1e">226</td>
<td class="r1e">$16.38</td>
<td class="r2e">37.19</td>
<td class="r2e">2.37</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7459080">ardiankp</a></td>
<td class="r1o">1833</td>
<td class="r1o">350</td>
<td class="r1o">$26.95</td>
<td class="r2o">40.30</td>
<td class="r2o">5.98</td>
<td class="r2o">0.31</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8474430">kupo</a></td>
<td class="r1e">1981</td>
<td class="r1e">410</td>
<td class="r1e">$63.36</td>
<td class="r2e">56.04</td>
<td class="r2e">16.69</td>
<td class="r2e">2.39</td>
<td class="r2e">0.06</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156541">SteveStern</a></td>
<td class="r1o">1921</td>
<td class="r1o">357</td>
<td class="r1o">$45.88</td>
<td class="r2o">50.25</td>
<td class="r2o">11.14</td>
<td class="r2o">0.96</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9998788">athenachu71</a></td>
<td class="r1e">1848</td>
<td class="r1e">519</td>
<td class="r1e">$45.97</td>
<td class="r2e">44.58</td>
<td class="r2e">11.24</td>
<td class="r2e">1.52</td>
<td class="r2e">0.05</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7448473">danlief</a></td>
<td class="r1o">1901</td>
<td class="r1o">255</td>
<td class="r1o">$32.32</td>
<td class="r2o">47.20</td>
<td class="r2o">6.30</td>
<td class="r2o">0.19</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289706">mickle</a></td>
<td class="r1e">1837</td>
<td class="r1e">304</td>
<td class="r1e">$26.08</td>
<td class="r2e">39.37</td>
<td class="r2e">5.03</td>
<td class="r2e">0.17</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10116099">blekdrago</a></td>
<td class="r1o">1829</td>
<td class="r1o">307</td>
<td class="r1o">$25.46</td>
<td class="r2o">38.45</td>
<td class="r2o">4.87</td>
<td class="r2o">0.16</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10185645">Toivoa</a></td>
<td class="r1e">1887</td>
<td class="r1e">384</td>
<td class="r1e">$43.58</td>
<td class="r2e">46.70</td>
<td class="r2e">10.38</td>
<td class="r2e">0.89</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7296000">connect4</a></td>
<td class="r1o">1810</td>
<td class="r1o">323</td>
<td class="r1o">$24.90</td>
<td class="r2o">36.79</td>
<td class="r2o">4.79</td>
<td class="r2o">0.17</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=310431">sean_henderson</a></td>
<td class="r1e">1898</td>
<td class="r1e">282</td>
<td class="r1e">$37.22</td>
<td class="r2e">47.03</td>
<td class="r2e">7.86</td>
<td class="r2e">0.31</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156491">chogyonim</a></td>
<td class="r1o">1851</td>
<td class="r1o">341</td>
<td class="r1o">$33.99</td>
<td class="r2o">42.10</td>
<td class="r2o">7.38</td>
<td class="r2o">0.39</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=287979">Oblok</a></td>
<td class="r1e">1785</td>
<td class="r1e">311</td>
<td class="r1e">$21.21</td>
<td class="r2e">33.32</td>
<td class="r2e">3.76</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8391762">ltank</a></td>
<td class="r1o">1749</td>
<td class="r1o">246</td>
<td class="r1o">$15.65</td>
<td class="r2o">24.66</td>
<td class="r2o">1.30</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10513872">ryanprichard</a></td>
<td class="r1e">1800</td>
<td class="r1e">235</td>
<td class="r1e">$21.41</td>
<td class="r2e">30.85</td>
<td class="r2e">2.15</td>
<td class="r2e">0.02</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=293685">bigbug</a></td>
<td class="r1o">1785</td>
<td class="r1o">240</td>
<td class="r1o">$19.80</td>
<td class="r2o">29.04</td>
<td class="r2o">1.92</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7269319">bsdude</a></td>
<td class="r1e">1742</td>
<td class="r1e">228</td>
<td class="r1e">$13.64</td>
<td class="r2e">22.10</td>
<td class="r2e">0.92</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7348444">DimaGer</a></td>
<td class="r1o">1877</td>
<td class="r1o">452</td>
<td class="r1o">$53.78</td>
<td class="r2o">46.42</td>
<td class="r2o">12.24</td>
<td class="r2o">1.40</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=154619">hilfiger</a></td>
<td class="r1e">1792</td>
<td class="r1e">414</td>
<td class="r1e">$35.85</td>
<td class="r2e">38.03</td>
<td class="r2e">7.10</td>
<td class="r2e">0.47</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7401899">Wombatfreak</a></td>
<td class="r1o">1784</td>
<td class="r1o">240</td>
<td class="r1o">$20.02</td>
<td class="r2o">28.87</td>
<td class="r2o">1.97</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8396270">lews</a></td>
<td class="r1e">1814</td>
<td class="r1e">520</td>
<td class="r1e">$47.35</td>
<td class="r2e">42.09</td>
<td class="r2e">10.61</td>
<td class="r2e">1.28</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=158301">mmsa</a></td>
<td class="r1o">1788</td>
<td class="r1o">321</td>
<td class="r1o">$27.91</td>
<td class="r2o">34.28</td>
<td class="r2o">4.39</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8436401">Katya_Lazareva</a></td>
<td class="r1e">1733</td>
<td class="r1e">407</td>
<td class="r1e">$27.42</td>
<td class="r2e">32.43</td>
<td class="r2e">4.84</td>
<td class="r2e">0.23</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7451795">jeroen</a></td>
<td class="r1o">1764</td>
<td class="r1o">295</td>
<td class="r1o">$23.87</td>
<td class="r2o">30.21</td>
<td class="r2o">2.95</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=284038">aussie</a></td>
<td class="r1e">1830</td>
<td class="r1e">340</td>
<td class="r1e">$38.16</td>
<td class="r2e">39.93</td>
<td class="r2e">6.84</td>
<td class="r2e">0.31</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7233906">superjoel</a></td>
<td class="r1o">1798</td>
<td class="r1o">304</td>
<td class="r1o">$29.78</td>
<td class="r2o">34.77</td>
<td class="r2o">4.34</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=307169">Fluff</a></td>
<td class="r1e">1693</td>
<td class="r1e">303</td>
<td class="r1e">$16.43</td>
<td class="r2e">22.95</td>
<td class="r2e">1.61</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8349001">belzebub</a></td>
<td class="r1o">1736</td>
<td class="r1o">308</td>
<td class="r1o">$21.57</td>
<td class="r2o">27.82</td>
<td class="r2o">2.60</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11912240">denpoz</a></td>
<td class="r1e">1856</td>
<td class="r1e">362</td>
<td class="r1e">$45.40</td>
<td class="r2e">43.34</td>
<td class="r2e">9.04</td>
<td class="r2e">0.57</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7555099">Rostislav</a></td>
<td class="r1o">1730</td>
<td class="r1o">394</td>
<td class="r1o">$27.84</td>
<td class="r2o">31.74</td>
<td class="r2o">4.63</td>
<td class="r2o">0.20</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10255172">icedragon</a></td>
<td class="r1e">1783</td>
<td class="r1e">325</td>
<td class="r1e">$29.97</td>
<td class="r2e">34.02</td>
<td class="r2e">4.65</td>
<td class="r2e">0.13</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9923663">Mozg</a></td>
<td class="r1o">1695</td>
<td class="r1o">361</td>
<td class="r1o">$21.60</td>
<td class="r2o">26.88</td>
<td class="r2o">3.00</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9962009">Tron3k</a></td>
<td class="r1e">1651</td>
<td class="r1e">230</td>
<td class="r1e">$8.25</td>
<td class="r2e">12.46</td>
<td class="r2e">0.35</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10052926">shuniu</a></td>
<td class="r1o">1695</td>
<td class="r1o">262</td>
<td class="r1o">$18.48</td>
<td class="r2o">20.40</td>
<td class="r2o">1.18</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10495238">dxtrous</a></td>
<td class="r1e">1790</td>
<td class="r1e">343</td>
<td class="r1e">$38.03</td>
<td class="r2e">36.17</td>
<td class="r2e">5.90</td>
<td class="r2e">0.21</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10676764">algostorm</a></td>
<td class="r1o">1773</td>
<td class="r1o">340</td>
<td class="r1o">$35.53</td>
<td class="r2o">34.20</td>
<td class="r2o">5.27</td>
<td class="r2o">0.17</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=288581">zalenski</a></td>
<td class="r1e">1640</td>
<td class="r1e">250</td>
<td class="r1e">$12.76</td>
<td class="r2e">13.86</td>
<td class="r2e">0.57</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8584653">cheetah</a></td>
<td class="r1o">1725</td>
<td class="r1o">323</td>
<td class="r1o">$27.73</td>
<td class="r2o">28.15</td>
<td class="r2o">3.36</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7328150">spoonmijit</a></td>
<td class="r1e">1633</td>
<td class="r1e">315</td>
<td class="r1e">$16.91</td>
<td class="r2e">18.75</td>
<td class="r2e">1.37</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=280722">Mikael.Ernholm</a></td>
<td class="r1o">1649</td>
<td class="r1o">288</td>
<td class="r1o">$16.65</td>
<td class="r2o">18.03</td>
<td class="r2o">1.22</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8392846">tripleCross</a></td>
<td class="r1e">1693</td>
<td class="r1e">352</td>
<td class="r1e">$26.40</td>
<td class="r2e">26.68</td>
<td class="r2e">3.38</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11784909">nweber</a></td>
<td class="r1o">1648</td>
<td class="r1o">263</td>
<td class="r1o">$15.05</td>
<td class="r2o">15.79</td>
<td class="r2o">0.93</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11776655">koda</a></td>
<td class="r1e">1648</td>
<td class="r1e">381</td>
<td class="r1e">$23.66</td>
<td class="r2e">24.37</td>
<td class="r2e">3.03</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=278167">Merlin[Kyiv]</a></td>
<td class="r1o">1582</td>
<td class="r1o">198</td>
<td class="r1o">$8.29</td>
<td class="r2o">5.29</td>
<td class="r2o">0.12</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8460252">tomek2</a></td>
<td class="r1e">1594</td>
<td class="r1e">378</td>
<td class="r1e">$20.42</td>
<td class="r2e">20.30</td>
<td class="r2e">2.06</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=284168">wackes</a></td>
<td class="r1o">1600</td>
<td class="r1o">325</td>
<td class="r1o">$17.70</td>
<td class="r2o">17.18</td>
<td class="r2o">1.35</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7360291">iforiq</a></td>
<td class="r1e">1642</td>
<td class="r1e">359</td>
<td class="r1e">$24.30</td>
<td class="r2e">22.98</td>
<td class="r2e">2.69</td>
<td class="r2e">0.05</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9924770">Frodo_Baggins</a></td>
<td class="r1o">1662</td>
<td class="r1o">489</td>
<td class="r1o">$35.10</td>
<td class="r2o">30.79</td>
<td class="r2o">6.04</td>
<td class="r2o">0.36</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=308454">Mathman19</a></td>
<td class="r1e">1632</td>
<td class="r1e">267</td>
<td class="r1e">$17.23</td>
<td class="r2e">15.16</td>
<td class="r2e">1.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7574434">warmingup</a></td>
<td class="r1o">1594</td>
<td class="r1o">327</td>
<td class="r1o">$17.73</td>
<td class="r2o">16.87</td>
<td class="r2o">1.42</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8496794">accek</a></td>
<td class="r1e">1691</td>
<td class="r1e">355</td>
<td class="r1e">$30.77</td>
<td class="r2e">27.15</td>
<td class="r2e">4.05</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8518361">Vovka</a></td>
<td class="r1o">1692</td>
<td class="r1o">549</td>
<td class="r1o">$43.27</td>
<td class="r2o">34.75</td>
<td class="r2o">8.49</td>
<td class="r2o">0.77</td>
<td class="r2o">0.02</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7443050">mics</a></td>
<td class="r1e">1590</td>
<td class="r1e">506</td>
<td class="r1e">$28.84</td>
<td class="r2e">26.46</td>
<td class="r2e">4.59</td>
<td class="r2e">0.23</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8497166">SuperRaskao</a></td>
<td class="r1o">1639</td>
<td class="r1o">471</td>
<td class="r1o">$35.64</td>
<td class="r2o">29.50</td>
<td class="r2o">5.41</td>
<td class="r2o">0.26</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11899489">Jacek</a></td>
<td class="r1e">1566</td>
<td class="r1e">304</td>
<td class="r1e">$18.08</td>
<td class="r2e">14.10</td>
<td class="r2e">0.95</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8465929">caancel</a></td>
<td class="r1o">1558</td>
<td class="r1o">224</td>
<td class="r1o">$12.55</td>
<td class="r2o">7.06</td>
<td class="r2o">0.23</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10197516">herbert_duarte</a></td>
<td class="r1e">1604</td>
<td class="r1e">420</td>
<td class="r1e">$28.82</td>
<td class="r2e">24.52</td>
<td class="r2e">3.48</td>
<td class="r2e">0.10</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10611351">sephiroth79</a></td>
<td class="r1o">1592</td>
<td class="r1o">414</td>
<td class="r1o">$27.21</td>
<td class="r2o">23.30</td>
<td class="r2o">3.11</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2058097">35C4P3</a></td>
<td class="r1e">1504</td>
<td class="r1e">330</td>
<td class="r1e">$14.59</td>
<td class="r2e">11.87</td>
<td class="r2e">0.70</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=311664">Vytenis</a></td>
<td class="r1o">1511</td>
<td class="r1o">343</td>
<td class="r1o">$15.85</td>
<td class="r2o">13.19</td>
<td class="r2o">0.88</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7364110">kats</a></td>
<td class="r1e">1581</td>
<td class="r1e">595</td>
<td class="r1e">$36.14</td>
<td class="r2e">29.99</td>
<td class="r2e">6.24</td>
<td class="r2e">0.48</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8392826">ppp</a></td>
<td class="r1o">1531</td>
<td class="r1o">310</td>
<td class="r1o">$15.49</td>
<td class="r2o">12.13</td>
<td class="r2o">0.72</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=10254716">aboyner</a></td>
<td class="r1e">1492</td>
<td class="r1e">323</td>
<td class="r1e">$13.39</td>
<td class="r2e">10.68</td>
<td class="r2e">0.57</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9946038">forest</a></td>
<td class="r1o">1600</td>
<td class="r1o">388</td>
<td class="r1o">$27.32</td>
<td class="r2o">22.80</td>
<td class="r2o">2.84</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7540456">dexy</a></td>
<td class="r1e">1643</td>
<td class="r1e">383</td>
<td class="r1e">$32.08</td>
<td class="r2e">26.08</td>
<td class="r2e">3.77</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10687988">robertwb</a></td>
<td class="r1o">1521</td>
<td class="r1o">314</td>
<td class="r1o">$15.60</td>
<td class="r2o">12.05</td>
<td class="r2o">0.69</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10646954">ben.hwang</a></td>
<td class="r1e">1584</td>
<td class="r1e">345</td>
<td class="r1e">$23.12</td>
<td class="r2e">18.81</td>
<td class="r2e">1.80</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7400531">mafattah</a></td>
<td class="r1o">1494</td>
<td class="r1o">217</td>
<td class="r1o">$8.40</td>
<td class="r2o">3.79</td>
<td class="r2o">0.07</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10540401">kindloaf</a></td>
<td class="r1e">1505</td>
<td class="r1e">420</td>
<td class="r1e">$20.28</td>
<td class="r2e">17.91</td>
<td class="r2e">1.78</td>
<td class="r2e">0.03</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9971969">rrenaud</a></td>
<td class="r1o">1542</td>
<td class="r1o">404</td>
<td class="r1o">$22.50</td>
<td class="r2o">19.44</td>
<td class="r2o">2.07</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8593420">_efer_</a></td>
<td class="r1e">1497</td>
<td class="r1e">363</td>
<td class="r1e">$16.53</td>
<td class="r2e">13.90</td>
<td class="r2e">0.98</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=11904845">sullivan</a></td>
<td class="r1o">1599</td>
<td class="r1o">377</td>
<td class="r1o">$26.60</td>
<td class="r2o">22.09</td>
<td class="r2o">2.62</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=304979">sinaddcos</a></td>
<td class="r1e">1480</td>
<td class="r1e">344</td>
<td class="r1e">$14.29</td>
<td class="r2e">11.65</td>
<td class="r2e">0.67</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7576932">Sputnik</a></td>
<td class="r1o">1461</td>
<td class="r1o">330</td>
<td class="r1o">$16.81</td>
<td class="r2o">11.55</td>
<td class="r2o">0.53</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=9928945">Vigothebest</a></td>
<td class="r1e">1497</td>
<td class="r1e">491</td>
<td class="r1e">$27.42</td>
<td class="r2e">23.06</td>
<td class="r2e">2.92</td>
<td class="r2e">0.09</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8511003">Swetko</a></td>
<td class="r1o">1487</td>
<td class="r1o">319</td>
<td class="r1o">$18.27</td>
<td class="r2o">12.37</td>
<td class="r2o">0.60</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7583175">Windrider</a></td>
<td class="r1e">1432</td>
<td class="r1e">223</td>
<td class="r1e">$9.75</td>
<td class="r2e">3.48</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=9958883">Minilek</a></td>
<td class="r1o">1559</td>
<td class="r1o">586</td>
<td class="r1o">$37.85</td>
<td class="r2o">30.64</td>
<td class="r2o">5.92</td>
<td class="r2o">0.41</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=10603164">sheiech</a></td>
<td class="r1e">1434</td>
<td class="r1e">342</td>
<td class="r1e">$15.49</td>
<td class="r2e">10.81</td>
<td class="r2e">0.47</td>
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
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=10584013">Sika</a></td>
<td class="r1o">1435</td>
<td class="r1o">365</td>
<td class="r1o">$16.63</td>
<td class="r2o">12.31</td>
<td class="r2o">0.64</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8382018">slex</a></td>
<td class="r1e">1424</td>
<td class="r1e">264</td>
<td class="r1e">$11.16</td>
<td class="r2e">5.42</td>
<td class="r2e">0.10</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=11789293">nhzp339</a></td>
<td class="r1o">1401</td>
<td class="r1o">348</td>
<td class="r1o">$13.66</td>
<td class="r2o">9.47</td>
<td class="r2o">0.36</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=10157606">Ying</a></td>
<td class="r1e">1519</td>
<td class="r1e">386</td>
<td class="r1e">$24.27</td>
<td class="r2e">18.99</td>
<td class="r2e">1.66</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=10380704">bluequark</a></td>
<td class="r1o">1383</td>
<td class="r1o">385</td>
<td class="r1o">$18.43</td>
<td class="r2o">12.71</td>
<td class="r2o">0.59</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8362133">dhyanesh</a></td>
<td class="r1e">1375</td>
<td class="r1e">377</td>
<td class="r1e">$17.59</td>
<td class="r2e">11.84</td>
<td class="r2e">0.49</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8472826">jakubr</a></td>
<td class="r1o">1474</td>
<td class="r1o">559</td>
<td class="r1o">$32.51</td>
<td class="r2o">26.74</td>
<td class="r2o">3.87</td>
<td class="r2o">0.17</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=11919691">Soultaker</a></td>
<td class="r1e">1443</td>
<td class="r1e">561</td>
<td class="r1e">$29.96</td>
<td class="r2e">24.91</td>
<td class="r2e">3.34</td>
<td class="r2e">0.13</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=11771960">Macsy</a></td>
<td class="r1o">1443</td>
<td class="r1o">374</td>
<td class="r1o">$22.32</td>
<td class="r2o">15.62</td>
<td class="r2o">0.89</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7325628">therealmoose</a></td>
<td class="r1e">1307</td>
<td class="r1e">381</td>
<td class="r1e">$13.80</td>
<td class="r2e">8.86</td>
<td class="r2e">0.27</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7568791">bramandia</a></td>
<td class="r1o">1324</td>
<td class="r1o">313</td>
<td class="r1o">$12.06</td>
<td class="r2o">5.96</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=10647213">chrbanx</a></td>
<td class="r1e">1318</td>
<td class="r1e">363</td>
<td class="r1e">$13.70</td>
<td class="r2e">8.36</td>
<td class="r2e">0.23</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=265771">csd98412</a></td>
<td class="r1o">1237</td>
<td class="r1o">254</td>
<td class="r1o">$5.93</td>
<td class="r2o">1.61</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=2057853">moh_taha_eg</a></td>
<td class="r1e">1336</td>
<td class="r1e">356</td>
<td class="r1e">$14.43</td>
<td class="r2e">8.76</td>
<td class="r2e">0.25</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8438496">vfortuna</a></td>
<td class="r1o">1306</td>
<td class="r1o">493</td>
<td class="r1o">$23.79</td>
<td class="r2o">18.10</td>
<td class="r2o">1.17</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=9923678">weimashipig</a></td>
<td class="r1e">1336</td>
<td class="r1e">433</td>
<td class="r1e">$23.92</td>
<td class="r2e">16.89</td>
<td class="r2e">0.86</td>
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
<tr><td class="rHandleo"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=309647">e</a></td>
<td class="r1o">1288</td>
<td class="r1o">313</td>
<td class="r1o">$17.33</td>
<td class="r2o">7.90</td>
<td class="r2o">0.10</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8354170">HelioS</a></td>
<td class="r1e">1222</td>
<td class="r1e">404</td>
<td class="r1e">$16.22</td>
<td class="r2e">9.64</td>
<td class="r2e">0.22</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=287073">kclancy</a></td>
<td class="r1o">1185</td>
<td class="r1o">325</td>
<td class="r1o">$11.90</td>
<td class="r2o">4.83</td>
<td class="r2o">0.03</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8513659">satej</a></td>
<td class="r1e">1335</td>
<td class="r1e">686</td>
<td class="r1e">$32.25</td>
<td class="r2e">27.17</td>
<td class="r2e">3.83</td>
<td class="r2e">0.21</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8563312">grigorg</a></td>
<td class="r1o">1170</td>
<td class="r1o">289</td>
<td class="r1o">$10.01</td>
<td class="r2o">3.19</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7557537">president</a></td>
<td class="r1e">1155</td>
<td class="r1e">570</td>
<td class="r1e">$18.02</td>
<td class="r2e">14.36</td>
<td class="r2e">0.82</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=309403">eam</a></td>
<td class="r1o">1116</td>
<td class="r1o">502</td>
<td class="r1o">$14.28</td>
<td class="r2o">10.03</td>
<td class="r2o">0.32</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8399054">_garfield_</a></td>
<td class="r1e">777</td>
<td class="r1e">461</td>
<td class="r1e">$3.97</td>
<td class="r2e">1.84</td>
<td class="r2e">0.01</td>
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
</td></tr>
</table>
</body>

</html>
