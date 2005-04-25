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
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=144400">tomek</a></td>
<td class="r1o">3512</td>
<td class="r1o">236</td>
<td class="r1o">$14,815.69</td>
<td class="r2o">100.00</td>
<td class="r2o">100.00</td>
<td class="r2o">17.26</td>
<td class="r2o">11.08</td>
<td class="r2o">93.26</td>
<td class="r3o">1.25</td>
<td class="r3o">8.00</td>
<td class="r3o">26.83</td>
<td class="r3o">57.18</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td class="r1e">3184</td>
<td class="r1e">338</td>
<td class="r1e">$5,335.89</td>
<td class="r2e">99.82</td>
<td class="r2e">98.14</td>
<td class="r2e">41.96</td>
<td class="r2e">14.42</td>
<td class="r2e">57.57</td>
<td class="r3e">9.85</td>
<td class="r3e">19.36</td>
<td class="r3e">18.39</td>
<td class="r3e">9.98</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=270505">John Dethridge</a></td>
<td class="r1o">3267</td>
<td class="r1o">364</td>
<td class="r1o">$6,983.34</td>
<td class="r2o">99.83</td>
<td class="r2o">98.46</td>
<td class="r2o">39.24</td>
<td class="r2o">17.18</td>
<td class="r2o">65.46</td>
<td class="r3o">8.32</td>
<td class="r3o">17.95</td>
<td class="r3o">22.54</td>
<td class="r3o">16.64</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8355516">Eryx</a></td>
<td class="r1e">3092</td>
<td class="r1e">406</td>
<td class="r1e">$3,541.60</td>
<td class="r2e">98.64</td>
<td class="r2e">92.77</td>
<td class="r2e">43.05</td>
<td class="r2e">13.15</td>
<td class="r2e">40.03</td>
<td class="r3e">10.61</td>
<td class="r3e">12.81</td>
<td class="r3e">10.44</td>
<td class="r3e">6.16</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=279471">haha</a></td>
<td class="r1o">3009</td>
<td class="r1o">501</td>
<td class="r1o">$2,722.38</td>
<td class="r2o">94.85</td>
<td class="r2o">82.02</td>
<td class="r2o">30.79</td>
<td class="r2o">8.18</td>
<td class="r2o">31.55</td>
<td class="r3o">10.96</td>
<td class="r3o">9.15</td>
<td class="r3o">6.61</td>
<td class="r3o">4.83</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262936">dgarthur</a></td>
<td class="r1e">2823</td>
<td class="r1e">376</td>
<td class="r1e">$929.73</td>
<td class="r2e">95.27</td>
<td class="r2e">79.42</td>
<td class="r2e">35.57</td>
<td class="r2e">4.14</td>
<td class="r2e">10.20</td>
<td class="r3e">4.65</td>
<td class="r3e">3.37</td>
<td class="r3e">1.67</td>
<td class="r3e">0.51</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7462740">ploh</a></td>
<td class="r1o">2878</td>
<td class="r1o">324</td>
<td class="r1o">$998.54</td>
<td class="r2o">98.21</td>
<td class="r2o">88.49</td>
<td class="r2o">47.06</td>
<td class="r2o">5.75</td>
<td class="r2o">10.48</td>
<td class="r3o">4.34</td>
<td class="r3o">3.74</td>
<td class="r3o">1.90</td>
<td class="r3o">0.50</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="r1e">2897</td>
<td class="r1e">422</td>
<td class="r1e">$1,448.33</td>
<td class="r2e">95.22</td>
<td class="r2e">81.02</td>
<td class="r2e">36.11</td>
<td class="r2e">6.32</td>
<td class="r2e">16.75</td>
<td class="r3e">6.82</td>
<td class="r3e">5.35</td>
<td class="r3e">3.17</td>
<td class="r3e">1.41</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td class="r1o">2769</td>
<td class="r1o">493</td>
<td class="r1o">$952.59</td>
<td class="r2o">87.88</td>
<td class="r2o">64.64</td>
<td class="r2o">21.93</td>
<td class="r2o">3.08</td>
<td class="r2o">10.92</td>
<td class="r3o">5.40</td>
<td class="r3o">3.07</td>
<td class="r3o">1.66</td>
<td class="r3o">0.79</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7479769">marian</a></td>
<td class="r1e">2682</td>
<td class="r1e">359</td>
<td class="r1e">$541.49</td>
<td class="r2e">91.31</td>
<td class="r2e">66.89</td>
<td class="r2e">20.14</td>
<td class="r2e">1.28</td>
<td class="r2e">4.50</td>
<td class="r3e">2.51</td>
<td class="r3e">1.39</td>
<td class="r3e">0.51</td>
<td class="r3e">0.09</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td class="r1o">2783</td>
<td class="r1o">371</td>
<td class="r1o">$903.19</td>
<td class="r2o">94.36</td>
<td class="r2o">76.33</td>
<td class="r2o">27.73</td>
<td class="r2o">2.80</td>
<td class="r2o">9.04</td>
<td class="r3o">4.36</td>
<td class="r3o">2.99</td>
<td class="r3o">1.35</td>
<td class="r3o">0.33</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=310430">gepa</a></td>
<td class="r1e">2619</td>
<td class="r1e">371</td>
<td class="r1e">$450.53</td>
<td class="r2e">87.44</td>
<td class="r2e">58.24</td>
<td class="r2e">14.83</td>
<td class="r2e">0.77</td>
<td class="r2e">2.97</td>
<td class="r3e">1.78</td>
<td class="r3e">0.85</td>
<td class="r3e">0.28</td>
<td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8365685">pparys</a></td>
<td class="r1o">2661</td>
<td class="r1o">430</td>
<td class="r1o">$551.24</td>
<td class="r2o">86.18</td>
<td class="r2o">58.69</td>
<td class="r2o">16.89</td>
<td class="r2o">1.36</td>
<td class="r2o">4.88</td>
<td class="r3o">2.76</td>
<td class="r3o">1.39</td>
<td class="r3o">0.57</td>
<td class="r3o">0.16</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262056">mathijs</a></td>
<td class="r1e">2629</td>
<td class="r1e">541</td>
<td class="r1e">$551.42</td>
<td class="r2e">79.03</td>
<td class="r2e">49.24</td>
<td class="r2e">13.17</td>
<td class="r2e">1.41</td>
<td class="r2e">5.44</td>
<td class="r3e">3.11</td>
<td class="r3e">1.36</td>
<td class="r3e">0.66</td>
<td class="r3e">0.32</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7311097">m00tz</a></td>
<td class="r1o">2710</td>
<td class="r1o">296</td>
<td class="r1o">$631.92</td>
<td class="r2o">95.85</td>
<td class="r2o">76.74</td>
<td class="r2o">25.09</td>
<td class="r2o">1.27</td>
<td class="r2o">3.25</td>
<td class="r3o">1.80</td>
<td class="r3o">1.07</td>
<td class="r3o">0.34</td>
<td class="r3o">0.04</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=10481120">ivan_metelsky</a></td>
<td class="r1e">2559</td>
<td class="r1e">311</td>
<td class="r1e">$348.57</td>
<td class="r2e">87.95</td>
<td class="r2e">54.95</td>
<td class="r2e">11.22</td>
<td class="r2e">0.29</td>
<td class="r2e">0.91</td>
<td class="r3e">0.60</td>
<td class="r3e">0.24</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td></tr>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308453">overwise</a></td>
<td class="r1o">2612</td>
<td class="r1o">327</td>
<td class="r1o">$491.94</td>
<td class="r2o">89.91</td>
<td class="r2o">61.05</td>
<td class="r2o">15.08</td>
<td class="r2o">0.58</td>
<td class="r2o">1.75</td>
<td class="r3o">1.09</td>
<td class="r3o">0.50</td>
<td class="r3o">0.14</td>
<td class="r3o">0.02</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=9906197">krijgertje</a></td>
<td class="r1e">2634</td>
<td class="r1e">402</td>
<td class="r1e">$523.21</td>
<td class="r2e">86.39</td>
<td class="r2e">57.73</td>
<td class="r2e">15.45</td>
<td class="r2e">1.00</td>
<td class="r2e">3.40</td>
<td class="r3e">1.99</td>
<td class="r3e">0.97</td>
<td class="r3e">0.36</td>
<td class="r3e">0.08</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=261024">grotmol</a></td>
<td class="r1o">2598</td>
<td class="r1o">505</td>
<td class="r1o">$523.29</td>
<td class="r2o">78.91</td>
<td class="r2o">47.97</td>
<td class="r2o">11.88</td>
<td class="r2o">1.04</td>
<td class="r2o">4.24</td>
<td class="r3o">2.51</td>
<td class="r3o">1.08</td>
<td class="r3o">0.47</td>
<td class="r3o">0.18</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=345049">aneubeck</a></td>
<td class="r1e">2512</td>
<td class="r1e">286</td>
<td class="r1e">$307.38</td>
<td class="r2e">86.64</td>
<td class="r2e">49.56</td>
<td class="r2e">7.53</td>
<td class="r2e">0.12</td>
<td class="r2e">0.52</td>
<td class="r3e">0.36</td>
<td class="r3e">0.13</td>
<td class="r3e">0.03</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=156592">benetin</a></td>
<td class="r1o">2547</td>
<td class="r1o">532</td>
<td class="r1o">$469.80</td>
<td class="r2o">74.73</td>
<td class="r2o">42.20</td>
<td class="r2o">9.35</td>
<td class="r2o">0.77</td>
<td class="r2o">3.56</td>
<td class="r3o">2.20</td>
<td class="r3o">0.85</td>
<td class="r3o">0.36</td>
<td class="r3o">0.15</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7452866">Im2Good</a></td>
<td class="r1e">2466</td>
<td class="r1e">357</td>
<td class="r1e">$305.10</td>
<td class="r2e">77.76</td>
<td class="r2e">39.37</td>
<td class="r2e">5.86</td>
<td class="r2e">0.13</td>
<td class="r2e">0.68</td>
<td class="r3e">0.48</td>
<td class="r3e">0.16</td>
<td class="r3e">0.04</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7421158">Per</a></td>
<td class="r1o">2682</td>
<td class="r1o">510</td>
<td class="r1o">$698.42</td>
<td class="r2o">83.15</td>
<td class="r2o">55.65</td>
<td class="r2o">15.23</td>
<td class="r2o">1.77</td>
<td class="r2o">6.87</td>
<td class="r3o">3.73</td>
<td class="r3o">1.83</td>
<td class="r3o">0.91</td>
<td class="r3o">0.40</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=309982">cyfra</a></td>
<td class="r1e">2497</td>
<td class="r1e">393</td>
<td class="r1e">$356.97</td>
<td class="r2e">78.03</td>
<td class="r2e">41.92</td>
<td class="r2e">7.36</td>
<td class="r2e">0.26</td>
<td class="r2e">1.16</td>
<td class="r3e">0.78</td>
<td class="r3e">0.28</td>
<td class="r3e">0.08</td>
<td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8349097">hauser</a></td>
<td class="r1o">2397</td>
<td class="r1o">328</td>
<td class="r1o">$216.06</td>
<td class="r2o">73.23</td>
<td class="r2o">31.01</td>
<td class="r2o">3.23</td>
<td class="r2o">0.04</td>
<td class="r2o">0.22</td>
<td class="r3o">0.16</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260987">dangelo</a></td>
<td class="r1e">2322</td>
<td class="r1e">312</td>
<td class="r1e">$162.37</td>
<td class="r2e">65.94</td>
<td class="r2e">21.76</td>
<td class="r2e">1.49</td>
<td class="r2e">0.01</td>
<td class="r2e">0.06</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307060">AdrianKuegel</a></td>
<td class="r1o">2354</td>
<td class="r1o">410</td>
<td class="r1o">$243.03</td>
<td class="r2o">65.24</td>
<td class="r2o">25.92</td>
<td class="r2o">3.05</td>
<td class="r2o">0.06</td>
<td class="r2o">0.35</td>
<td class="r3o">0.26</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8357090">misof</a></td>
<td class="r1e">2422</td>
<td class="r1e">377</td>
<td class="r1e">$237.08</td>
<td class="r2e">72.78</td>
<td class="r2e">33.41</td>
<td class="r2e">4.50</td>
<td class="r2e">0.10</td>
<td class="r2e">0.47</td>
<td class="r3e">0.34</td>
<td class="r3e">0.10</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=288584">LunaticFringe</a></td>
<td class="r1o">2411</td>
<td class="r1o">404</td>
<td class="r1o">$261.08</td>
<td class="r2o">70.51</td>
<td class="r2o">31.81</td>
<td class="r2o">4.42</td>
<td class="r2o">0.11</td>
<td class="r2o">0.53</td>
<td class="r3o">0.39</td>
<td class="r3o">0.11</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=264869">ante</a></td>
<td class="r1e">2391</td>
<td class="r1e">576</td>
<td class="r1e">$284.51</td>
<td class="r2e">63.44</td>
<td class="r2e">28.63</td>
<td class="r2e">4.86</td>
<td class="r2e">0.30</td>
<td class="r2e">1.50</td>
<td class="r3e">1.04</td>
<td class="r3e">0.30</td>
<td class="r3e">0.12</td>
<td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8601171">HilbertRaum</a></td>
<td class="r1o">2461</td>
<td class="r1o">492</td>
<td class="r1o">$349.30</td>
<td class="r2o">70.72</td>
<td class="r2o">35.37</td>
<td class="r2o">6.47</td>
<td class="r2o">0.34</td>
<td class="r2o">1.52</td>
<td class="r3o">1.02</td>
<td class="r3o">0.34</td>
<td class="r3o">0.12</td>
<td class="r3o">0.04</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7502813">monsoon</a></td>
<td class="r1e">2345</td>
<td class="r1e">316</td>
<td class="r1e">$218.19</td>
<td class="r2e">68.34</td>
<td class="r2e">24.48</td>
<td class="r2e">1.87</td>
<td class="r2e">0.02</td>
<td class="r2e">0.08</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td>
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
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="r1o">2338</td>
<td class="r1o">304</td>
<td class="r1o">$182.61</td>
<td class="r2o">68.21</td>
<td class="r2o">23.53</td>
<td class="r2o">1.62</td>
<td class="r2o">0.01</td>
<td class="r2o">0.06</td>
<td class="r3o">0.05</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=289435">nullspace</a></td>
<td class="r1e">2315</td>
<td class="r1e">332</td>
<td class="r1e">$169.66</td>
<td class="r2e">64.23</td>
<td class="r2e">21.32</td>
<td class="r2e">1.53</td>
<td class="r2e">0.01</td>
<td class="r2e">0.08</td>
<td class="r3e">0.06</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=153902">evd</a></td>
<td class="r1o">2227</td>
<td class="r1o">285</td>
<td class="r1o">$110.62</td>
<td class="r2o">54.57</td>
<td class="r2o">11.49</td>
<td class="r2o">0.36</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=9958600">Zis</a></td>
<td class="r1e">2270</td>
<td class="r1e">335</td>
<td class="r1e">$142.87</td>
<td class="r2e">58.95</td>
<td class="r2e">16.91</td>
<td class="r2e">0.99</td>
<td class="r2e">0.01</td>
<td class="r2e">0.04</td>
<td class="r3e">0.03</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7394165">PaulJefferys</a></td>
<td class="r1o">2292</td>
<td class="r1o">197</td>
<td class="r1o">$134.85</td>
<td class="r2o">68.79</td>
<td class="r2o">14.32</td>
<td class="r2o">0.29</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=303644">Olexiy</a></td>
<td class="r1e">2355</td>
<td class="r1e">375</td>
<td class="r1e">$280.19</td>
<td class="r2e">66.63</td>
<td class="r2e">26.00</td>
<td class="r2e">2.64</td>
<td class="r2e">0.04</td>
<td class="r2e">0.24</td>
<td class="r3e">0.18</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=308657">skanthak</a></td>
<td class="r1o">2406</td>
<td class="r1o">367</td>
<td class="r1o">$316.66</td>
<td class="r2o">71.86</td>
<td class="r2o">31.78</td>
<td class="r2o">3.76</td>
<td class="r2o">0.07</td>
<td class="r2o">0.38</td>
<td class="r3o">0.28</td>
<td class="r3o">0.08</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=346607">kalmakka</a></td>
<td class="r1e">2350</td>
<td class="r1e">359</td>
<td class="r1e">$245.88</td>
<td class="r2e">66.82</td>
<td class="r2e">25.45</td>
<td class="r2e">2.33</td>
<td class="r2e">0.03</td>
<td class="r2e">0.19</td>
<td class="r3e">0.15</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8398526">Tomy</a></td>
<td class="r1o">2265</td>
<td class="r1o">314</td>
<td class="r1o">$141.48</td>
<td class="r2o">58.92</td>
<td class="r2o">15.94</td>
<td class="r2o">0.76</td>
<td class="r2o">0.00</td>
<td class="r2o">0.03</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7360309">dmks</a></td>
<td class="r1e">2246</td>
<td class="r1e">349</td>
<td class="r1e">$136.21</td>
<td class="r2e">55.91</td>
<td class="r2e">15.23</td>
<td class="r2e">0.83</td>
<td class="r2e">0.01</td>
<td class="r2e">0.05</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=113178">po</a></td>
<td class="r1o">2329</td>
<td class="r1o">386</td>
<td class="r1o">$239.49</td>
<td class="r2o">63.70</td>
<td class="r2o">23.46</td>
<td class="r2o">2.17</td>
<td class="r2o">0.03</td>
<td class="r2o">0.23</td>
<td class="r3o">0.18</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7442498">marek.cygan</a></td>
<td class="r1e">2276</td>
<td class="r1e">213</td>
<td class="r1e">$131.69</td>
<td class="r2e">64.83</td>
<td class="r2e">13.27</td>
<td class="r2e">0.27</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7485898">Andrew_Lazarev</a></td>
<td class="r1o">2319</td>
<td class="r1o">462</td>
<td class="r1o">$243.83</td>
<td class="r2o">60.70</td>
<td class="r2o">23.10</td>
<td class="r2o">2.58</td>
<td class="r2o">0.07</td>
<td class="r2o">0.48</td>
<td class="r3o">0.36</td>
<td class="r3o">0.09</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7390467">lovro</a></td>
<td class="r1e">2438</td>
<td class="r1e">498</td>
<td class="r1e">$371.26</td>
<td class="r2e">68.85</td>
<td class="r2e">33.30</td>
<td class="r2e">5.39</td>
<td class="r2e">0.27</td>
<td class="r2e">1.55</td>
<td class="r3e">1.06</td>
<td class="r3e">0.34</td>
<td class="r3e">0.12</td>
<td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=8394868">rem</a></td>
<td class="r1o">2286</td>
<td class="r1o">263</td>
<td class="r1o">$177.54</td>
<td class="r2o">63.61</td>
<td class="r2o">16.55</td>
<td class="r2o">0.59</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307638">Wernie</a></td>
<td class="r1e">2274</td>
<td class="r1e">567</td>
<td class="r1e">$239.16</td>
<td class="r2e">55.63</td>
<td class="r2e">20.71</td>
<td class="r2e">2.51</td>
<td class="r2e">0.10</td>
<td class="r2e">0.77</td>
<td class="r3e">0.58</td>
<td class="r3e">0.14</td>
<td class="r3e">0.05</td>
<td class="r3e">0.01</td></tr>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8493941">asaveljevs</a></td>
<td class="r1o">2129</td>
<td class="r1o">302</td>
<td class="r1o">$124.28</td>
<td class="r2o">41.42</td>
<td class="r2o">5.96</td>
<td class="r2o">0.11</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158333">dvickrey</a></td>
<td class="r1e">2156</td>
<td class="r1e">287</td>
<td class="r1e">$81.92</td>
<td class="r2e">44.71</td>
<td class="r2e">6.88</td>
<td class="r2e">0.13</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=268904">szymcio</a></td>
<td class="r1o">2258</td>
<td class="r1o">497</td>
<td class="r1o">$224.15</td>
<td class="r2o">55.13</td>
<td class="r2o">19.17</td>
<td class="r2o">1.96</td>
<td class="r2o">0.05</td>
<td class="r2o">0.41</td>
<td class="r3o">0.31</td>
<td class="r3o">0.07</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
<td class="r1e">2017</td>
<td class="r1e">284</td>
<td class="r1e">$43.17</td>
<td class="r2e">26.62</td>
<td class="r2e">1.87</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=286375">bjacoke001</a></td>
<td class="r1o">2162</td>
<td class="r1o">316</td>
<td class="r1o">$150.27</td>
<td class="r2o">45.96</td>
<td class="r2o">8.63</td>
<td class="r2o">0.23</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=347569">Savior</a></td>
<td class="r1e">2280</td>
<td class="r1e">493</td>
<td class="r1e">$267.26</td>
<td class="r2e">56.97</td>
<td class="r2e">21.16</td>
<td class="r2e">2.30</td>
<td class="r2e">0.06</td>
<td class="r2e">0.47</td>
<td class="r3e">0.35</td>
<td class="r3e">0.08</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7433858">liympanda</a></td>
<td class="r1o">2250</td>
<td class="r1o">443</td>
<td class="r1o">$214.69</td>
<td class="r2o">55.09</td>
<td class="r2o">18.64</td>
<td class="r2o">1.61</td>
<td class="r2o">0.03</td>
<td class="r2o">0.21</td>
<td class="r3o">0.17</td>
<td class="r3o">0.04</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7546003">dmytro</a></td>
<td class="r1e">2046</td>
<td class="r1e">310</td>
<td class="r1e">$57.91</td>
<td class="r2e">31.59</td>
<td class="r2e">3.63</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268851">gladius</a></td>
<td class="r1o">2113</td>
<td class="r1o">420</td>
<td class="r1o">$132.03</td>
<td class="r2o">42.32</td>
<td class="r2o">9.74</td>
<td class="r2o">0.44</td>
<td class="r2o">0.00</td>
<td class="r2o">0.03</td>
<td class="r3o">0.03</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10526732">zjq</a></td>
<td class="r1e">2086</td>
<td class="r1e">426</td>
<td class="r1e">$93.90</td>
<td class="r2e">39.93</td>
<td class="r2e">8.70</td>
<td class="r2e">0.37</td>
<td class="r2e">0.00</td>
<td class="r2e">0.03</td>
<td class="r3e">0.02</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7584555">abi_k</a></td>
<td class="r1o">2150</td>
<td class="r1o">533</td>
<td class="r1o">$184.94</td>
<td class="r2o">46.67</td>
<td class="r2o">14.40</td>
<td class="r2o">1.23</td>
<td class="r2o">0.03</td>
<td class="r2o">0.21</td>
<td class="r3o">0.17</td>
<td class="r3o">0.03</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283388">Minsk</a></td>
<td class="r1e">2023</td>
<td class="r1e">294</td>
<td class="r1e">$79.39</td>
<td class="r2e">28.00</td>
<td class="r2e">2.89</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309454">bugzpodder</a></td>
<td class="r1o">2024</td>
<td class="r1o">354</td>
<td class="r1o">$121.46</td>
<td class="r2o">31.70</td>
<td class="r2o">4.56</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307070">qsort</a></td>
<td class="r1e">2078</td>
<td class="r1e">642</td>
<td class="r1e">$183.79</td>
<td class="r2e">42.91</td>
<td class="r2e">13.02</td>
<td class="r2e">1.21</td>
<td class="r2e">0.04</td>
<td class="r2e">0.30</td>
<td class="r3e">0.24</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293387">abiczo</a></td>
<td class="r1o">2046</td>
<td class="r1o">448</td>
<td class="r1o">$94.58</td>
<td class="r2o">37.16</td>
<td class="r2o">7.89</td>
<td class="r2o">0.32</td>
<td class="r2o">0.00</td>
<td class="r2o">0.02</td>
<td class="r3o">0.02</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289309">qixin99</a></td>
<td class="r1e">2040</td>
<td class="r1e">361</td>
<td class="r1e">$128.27</td>
<td class="r2e">33.64</td>
<td class="r2e">5.44</td>
<td class="r2e">0.11</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302053">oldbig</a></td>
<td class="r1o">1855</td>
<td class="r1o">469</td>
<td class="r1o">$100.84</td>
<td class="r2o">23.50</td>
<td class="r2o">2.90</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7459080">ardiankp</a></td>
<td class="r1e">1980</td>
<td class="r1e">436</td>
<td class="r1e">$123.59</td>
<td class="r2e">31.25</td>
<td class="r2e">5.27</td>
<td class="r2e">0.15</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8474430">kupo</a></td>
<td class="r1o">2027</td>
<td class="r1o">378</td>
<td class="r1o">$107.38</td>
<td class="r2o">33.07</td>
<td class="r2o">5.46</td>
<td class="r2o">0.12</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7448473">danlief</a></td>
<td class="r1e">1950</td>
<td class="r1e">244</td>
<td class="r1e">$60.98</td>
<td class="r2e">16.18</td>
<td class="r2e">0.76</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289706">mickle</a></td>
<td class="r1o">1926</td>
<td class="r1o">333</td>
<td class="r1o">$92.69</td>
<td class="r2o">21.16</td>
<td class="r2o">1.80</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10185645">Toivoa</a></td>
<td class="r1e">2054</td>
<td class="r1e">419</td>
<td class="r1e">$172.79</td>
<td class="r2e">37.00</td>
<td class="r2e">7.59</td>
<td class="r2e">0.27</td>
<td class="r2e">0.00</td>
<td class="r2e">0.01</td>
<td class="r3e">0.01</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156491">chogyonim</a></td>
<td class="r1o">1883</td>
<td class="r1o">314</td>
<td class="r1o">$74.07</td>
<td class="r2o">17.73</td>
<td class="r2o">1.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287979">Oblok</a></td>
<td class="r1e">1840</td>
<td class="r1e">303</td>
<td class="r1e">$84.20</td>
<td class="r2e">13.57</td>
<td class="r2e">0.54</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8391762">ltank</a></td>
<td class="r1o">1839</td>
<td class="r1o">280</td>
<td class="r1o">$80.50</td>
<td class="r2o">11.69</td>
<td class="r2o">0.36</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293685">bigbug</a></td>
<td class="r1e">1938</td>
<td class="r1e">337</td>
<td class="r1e">$110.58</td>
<td class="r2e">24.26</td>
<td class="r2e">2.21</td>
<td class="r2e">0.02</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=284038">aussie</a></td>
<td class="r1o">1858</td>
<td class="r1o">311</td>
<td class="r1o">$68.67</td>
<td class="r2o">15.51</td>
<td class="r2o">0.75</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8349001">belzebub</a></td>
<td class="r1e">1884</td>
<td class="r1e">415</td>
<td class="r1e">$109.98</td>
<td class="r2e">24.19</td>
<td class="r2e">2.64</td>
<td class="r2e">0.04</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=11912240">denpoz</a></td>
<td class="r1o">1898</td>
<td class="r1o">305</td>
<td class="r1o">$125.79</td>
<td class="r2o">18.34</td>
<td class="r2o">1.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=9962009">Tron3k</a></td>
<td class="r1e">1711</td>
<td class="r1e">228</td>
<td class="r1e">$8.80</td>
<td class="r2e">2.35</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10676764">algostorm</a></td>
<td class="r1o">1887</td>
<td class="r1o">326</td>
<td class="r1o">$126.87</td>
<td class="r2o">18.96</td>
<td class="r2o">1.22</td>
<td class="r2o">0.01</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288581">zalenski</a></td>
<td class="r1e">1972</td>
<td class="r1e">567</td>
<td class="r1e">$151.96</td>
<td class="r2e">36.20</td>
<td class="r2e">8.05</td>
<td class="r2e">0.46</td>
<td class="r2e">0.01</td>
<td class="r2e">0.05</td>
<td class="r3e">0.04</td>
<td class="r3e">0.01</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8584653">cheetah</a></td>
<td class="r1o">1909</td>
<td class="r1o">414</td>
<td class="r1o">$154.27</td>
<td class="r2o">27.87</td>
<td class="r2o">3.32</td>
<td class="r2o">0.05</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=11776655">koda</a></td>
<td class="r1e">1785</td>
<td class="r1e">412</td>
<td class="r1e">$78.20</td>
<td class="r2e">18.45</td>
<td class="r2e">1.29</td>
<td class="r2e">0.01</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278167">Merlin[Kyiv]</a></td>
<td class="r1o">1701</td>
<td class="r1o">293</td>
<td class="r1o">$21.46</td>
<td class="r2o">6.35</td>
<td class="r2o">0.08</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=9924770">Frodo_Baggins</a></td>
<td class="r1e">1807</td>
<td class="r1e">507</td>
<td class="r1e">$144.16</td>
<td class="r2e">24.61</td>
<td class="r2e">2.96</td>
<td class="r2e">0.07</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7443050">mics</a></td>
<td class="r1o">1779</td>
<td class="r1o">594</td>
<td class="r1o">$119.36</td>
<td class="r2o">26.34</td>
<td class="r2o">3.84</td>
<td class="r2o">0.13</td>
<td class="r2o">0.00</td>
<td class="r2o">0.01</td>
<td class="r3o">0.01</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10197516">herbert_duarte</a></td>
<td class="r1e">1689</td>
<td class="r1e">399</td>
<td class="r1e">$112.28</td>
<td class="r2e">12.11</td>
<td class="r2e">0.49</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10611351">sephiroth79</a></td>
<td class="r1o">1657</td>
<td class="r1o">382</td>
<td class="r1o">$106.59</td>
<td class="r2o">9.64</td>
<td class="r2o">0.28</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=311664">Vytenis</a></td>
<td class="r1e">1661</td>
<td class="r1e">417</td>
<td class="r1e">$110.93</td>
<td class="r2e">11.73</td>
<td class="r2e">0.48</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7540456">dexy</a></td>
<td class="r1o">1710</td>
<td class="r1o">331</td>
<td class="r1o">$56.92</td>
<td class="r2o">9.07</td>
<td class="r2o">0.21</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10646954">ben.hwang</a></td>
<td class="r1e">1750</td>
<td class="r1e">374</td>
<td class="r1e">$117.70</td>
<td class="r2e">13.97</td>
<td class="r2e">0.63</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7400531">mafattah</a></td>
<td class="r1o">1612</td>
<td class="r1o">313</td>
<td class="r1o">$106.76</td>
<td class="r2o">6.87</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10540401">kindloaf</a></td>
<td class="r1e">1604</td>
<td class="r1e">402</td>
<td class="r1e">$34.55</td>
<td class="r2e">11.34</td>
<td class="r2e">0.29</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=9971969">rrenaud</a></td>
<td class="r1o">1611</td>
<td class="r1o">390</td>
<td class="r1o">$64.24</td>
<td class="r2o">11.02</td>
<td class="r2o">0.26</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8593420">_efer_</a></td>
<td class="r1e">1644</td>
<td class="r1e">427</td>
<td class="r1e">$122.30</td>
<td class="r2e">14.74</td>
<td class="r2e">0.59</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=304979">sinaddcos</a></td>
<td class="r1o">1621</td>
<td class="r1o">420</td>
<td class="r1o">$118.48</td>
<td class="r2o">13.15</td>
<td class="r2o">0.44</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8511003">Swetko</a></td>
<td class="r1e">1720</td>
<td class="r1e">499</td>
<td class="r1e">$141.65</td>
<td class="r2e">22.91</td>
<td class="r2e">1.95</td>
<td class="r2e">0.03</td>
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
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=10584013">Sika</a></td>
<td class="r1o">1523</td>
<td class="r1o">365</td>
<td class="r1o">$52.31</td>
<td class="r2o">6.23</td>
<td class="r2o">0.06</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=11789293">nhzp339</a></td>
<td class="r1e">1555</td>
<td class="r1e">414</td>
<td class="r1e">$110.06</td>
<td class="r2e">9.79</td>
<td class="r2e">0.22</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r2e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td>
<td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=8472826">jakubr</a></td>
<td class="r1o">1628</td>
<td class="r1o">585</td>
<td class="r1o">$136.23</td>
<td class="r2o">21.30</td>
<td class="r2o">1.95</td>
<td class="r2o">0.04</td>
<td class="r2o">0.00</td>
<td class="r2o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td>
<td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7557537">president</a></td>
<td class="r1e">1293</td>
<td class="r1e">573</td>
<td class="r1e">$101.69</td>
<td class="r2e">7.95</td>
<td class="r2e">0.22</td>
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
