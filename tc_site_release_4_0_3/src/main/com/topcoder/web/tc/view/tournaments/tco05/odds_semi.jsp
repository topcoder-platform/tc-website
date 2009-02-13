<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO05style.css"/>
</head>

<body>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco05/header_logo.gif"/></td>
      </tr>
         <tr>
            <td align="left" class="bodyText" colspan="2" nowrap><h2>jdmetz's odds</h2></td>
            <td class="bodyText" align=right>
            <!-- round links-->
            <jsp:include page="odds_links.jsp" >
               <jsp:param name="selectedRound" value="semi"/>
            </jsp:include>
            </td>
         </tr>

         <tr>
            <td align="left" class="bodyText" valign="top">
               <img src="/i/m/jdmetz_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left" class="myStatsPhoto"/>
               By&#160;<tc-webtag:handle coderId="7459326" context="algorithm"/><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top" rowspan="2">
            Beat the odds! These results of 1,000,000 Monte Carlo simulations predict your chances to advance in the 2005 TopCoder Open based only on your current TopCoder rating and volatility.  Try your best to beat these odds as you advance through the tournament.
            <br><br>
            The model used here is a normal distribution with the mean of your rating and standard deviation of your volatility, assuming every advancing coder competes in every round they are eligible for and scores more than 0 points.  There are obvious flaws with these assumptions, and this information is provided for entertainment purposes only.
            <br><br>
            The "Earnings" column includes prizes for the top three finishers in each room for the online rounds, excluding already completed rounds.
            </td>
         </tr>
      </table>
<br/>

<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="3">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>

<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10574855" >Petr</a></td><td class="r1o">3312</td><td class="r1o">332</td><td class="r1o">$11811.61</td><td class="r2o">19.05</td><td class="r2o">14.32</td><td class="r2o">92.91</td><td class="r3o">7.31</td><td class="r3o">12.99</td><td class="r3o">22.88</td><td class="r3o">42.87</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8355516" >Eryx</a></td><td class="r1e">3037</td><td class="r1e">291</td><td class="r1e">$4879.30</td><td class="r2e">41.43</td><td class="r2e">20.75</td><td class="r2e">70.23</td><td class="r3e">12.70</td><td class="r3e">15.77</td><td class="r3e">15.44</td><td class="r3e">9.38</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8357090" >misof</a></td><td class="r1o">3015</td><td class="r1o">393</td><td class="r1o">$4832.27</td><td class="r2o">32.43</td><td class="r2o">15.35</td><td class="r2o">67.06</td><td class="r3o">9.97</td><td class="r3o">11.73</td><td class="r3o">13.08</td><td class="r3o">11.36</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7445961" >snewman</a></td><td class="r1e">2985</td><td class="r1e">415</td><td class="r1e">$4301.87</td><td class="r2e">32.44</td><td class="r2e">14.51</td><td class="r2e">63.17</td><td class="r3e">9.87</td><td class="r3e">10.74</td><td class="r3e">10.95</td><td class="r3e">9.89</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10481120" >ivan_metelsky</a></td><td class="r1o">2945</td><td class="r1o">429</td><td class="r1o">$3643.62</td><td class="r2o">35.91</td><td class="r2o">14.99</td><td class="r2o">55.50</td><td class="r3o">8.21</td><td class="r3o">8.81</td><td class="r3o">8.93</td><td class="r3o">8.12</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=270505" >John Dethridge</a></td><td class="r1e">2840</td><td class="r1e">392</td><td class="r1e">$2198.29</td><td class="r2e">42.25</td><td class="r2e">13.42</td><td class="r2e">40.90</td><td class="r3e">6.51</td><td class="r3e">6.10</td><td class="r3e">5.08</td><td class="r3e">3.45</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7462740" >ploh</a></td><td class="r1o">2738</td><td class="r1o">370</td><td class="r1o">$1339.06</td><td class="r2o">42.43</td><td class="r2o">9.57</td><td class="r2o">27.55</td><td class="r3o">4.22</td><td class="r3o">3.41</td><td class="r3o">2.44</td><td class="r3o">1.32</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7442498" >marek.cygan</a></td><td class="r1e">2697</td><td class="r1e">505</td><td class="r1e">$1649.68</td><td class="r2e">30.95</td><td class="r2e">7.89</td><td class="r2e">31.35</td><td class="r3e">3.71</td><td class="r3e">3.44</td><td class="r3e">3.02</td><td class="r3e">2.58</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=262936" >dgarthur</a></td><td class="r1o">2675</td><td class="r1o">484</td><td class="r1o">$1519.50</td><td class="r2o">30.51</td><td class="r2o">7.04</td><td class="r2o">30.69</td><td class="r3o">3.56</td><td class="r3o">3.12</td><td class="r3o">2.66</td><td class="r3o">2.16</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293874" >nicka81</a></td><td class="r1e">2651</td><td class="r1e">345</td><td class="r1e">$984.30</td><td class="r2e">38.14</td><td class="r2e">5.74</td><td class="r2e">20.48</td><td class="r3e">2.89</td><td class="r3e">2.15</td><td class="r3e">1.33</td><td class="r3e">0.56</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275071" >antimatter</a></td><td class="r1o">2649</td><td class="r1o">451</td><td class="r1o">$1235.60</td><td class="r2o">32.67</td><td class="r2o">6.58</td><td class="r2o">24.58</td><td class="r3o">3.02</td><td class="r3o">2.57</td><td class="r3o">2.00</td><td class="r3o">1.33</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390224" >gawry</a></td><td class="r1e">2615</td><td class="r1e">530</td><td class="r1e">$1294.82</td><td class="r2e">29.26</td><td class="r2e">6.33</td><td class="r2e">24.83</td><td class="r3e">2.64</td><td class="r3e">2.33</td><td class="r3e">2.00</td><td class="r3e">1.72</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9906197" >krijgertje</a></td><td class="r1o">2597</td><td class="r1o">415</td><td class="r1o">$908.43</td><td class="r2o">33.35</td><td class="r2o">5.25</td><td class="r2o">17.40</td><td class="r3o">2.06</td><td class="r3o">1.52</td><td class="r3o">1.05</td><td class="r3o">0.58</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8601171" >HilbertRaum</a></td><td class="r1e">2588</td><td class="r1e">416</td><td class="r1e">$918.76</td><td class="r2e">31.60</td><td class="r2e">4.79</td><td class="r2e">17.74</td><td class="r3e">2.10</td><td class="r3e">1.60</td><td class="r3e">1.12</td><td class="r3e">0.57</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=277659" >radeye</a></td><td class="r1o">2586</td><td class="r1o">270</td><td class="r1o">$647.88</td><td class="r2o">37.09</td><td class="r2o">2.82</td><td class="r2o">9.60</td><td class="r3o">1.27</td><td class="r3o">0.69</td><td class="r3o">0.29</td><td class="r3o">0.07</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301937" >RalphFurmaniak</a></td><td class="r1e">2582</td><td class="r1e">293</td><td class="r1e">$679.52</td><td class="r2e">36.04</td><td class="r2e">3.09</td><td class="r2e">10.93</td><td class="r3e">1.45</td><td class="r3e">0.86</td><td class="r3e">0.37</td><td class="r3e">0.10</td></tr>
<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="3">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>

<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>
<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>

</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7479769" >marian</a></td><td class="r1o">2581</td><td class="r1o">207</td><td class="r1o">$553.29</td><td class="r2o">36.14</td><td class="r2o">1.61</td><td class="r2o">4.23</td><td class="r3o">0.53</td><td class="r3o">0.24</td><td class="r3o">0.07</td><td class="r3o">0.01</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274023" >venco</a></td><td class="r1e">2575</td><td class="r1e">312</td><td class="r1e">$655.76</td><td class="r2e">35.17</td><td class="r2e">3.29</td><td class="r2e">9.41</td><td class="r3e">1.14</td><td class="r3e">0.67</td><td class="r3e">0.34</td><td class="r3e">0.11</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=279471" >haha</a></td><td class="r1o">2570</td><td class="r1o">349</td><td class="r1o">$710.33</td><td class="r2o">33.96</td><td class="r2o">3.74</td><td class="r2o">11.39</td><td class="r3o">1.33</td><td class="r3o">0.87</td><td class="r3o">0.50</td><td class="r3o">0.19</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287105" >lars</a></td><td class="r1e">2563</td><td class="r1e">278</td><td class="r1e">$607.82</td><td class="r2e">33.70</td><td class="r2e">2.38</td><td class="r2e">7.31</td><td class="r3e">0.88</td><td class="r3e">0.49</td><td class="r3e">0.21</td><td class="r3e">0.05</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10599449" >natori</a></td><td class="r1o">2547</td><td class="r1o">288</td><td class="r1o">$621.85</td><td class="r2o">32.78</td><td class="r2o">2.27</td><td class="r2o">8.39</td><td class="r3o">1.01</td><td class="r3o">0.54</td><td class="r3o">0.22</td><td class="r3o">0.05</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=308453" >overwise</a></td><td class="r1e">2546</td><td class="r1e">438</td><td class="r1e">$904.00</td><td class="r2e">28.62</td><td class="r2e">4.04</td><td class="r2e">17.83</td><td class="r3e">1.98</td><td class="r3e">1.53</td><td class="r3e">1.02</td><td class="r3e">0.56</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7393427" >texel</a></td><td class="r1o">2538</td><td class="r1o">576</td><td class="r1o">$1188.14</td><td class="r2o">24.69</td><td class="r2o">4.83</td><td class="r2o">22.71</td><td class="r3o">2.15</td><td class="r3o">1.89</td><td class="r3o">1.66</td><td class="r3o">1.51</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=309982" >cyfra</a></td><td class="r1e">2538</td><td class="r1e">307</td><td class="r1e">$604.77</td><td class="r2e">31.78</td><td class="r2e">2.40</td><td class="r2e">7.08</td><td class="r3e">0.78</td><td class="r3e">0.44</td><td class="r3e">0.20</td><td class="r3e">0.06</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958600" >Zis</a></td><td class="r1o">2498</td><td class="r1o">376</td><td class="r1o">$648.96</td><td class="r2o">28.26</td><td class="r2o">2.62</td><td class="r2o">8.99</td><td class="r3o">0.89</td><td class="r3o">0.58</td><td class="r3o">0.33</td><td class="r3o">0.12</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10428762" >HiltonLange</a></td><td class="r1e">2485</td><td class="r1e">400</td><td class="r1e">$683.74</td><td class="r2e">26.41</td><td class="r2e">2.65</td><td class="r2e">10.48</td><td class="r3e">1.04</td><td class="r3e">0.71</td><td class="r3e">0.41</td><td class="r3e">0.18</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153656" >elizarov</a></td><td class="r1o">2478</td><td class="r1o">335</td><td class="r1o">$607.73</td><td class="r2o">26.52</td><td class="r2o">1.74</td><td class="r2o">7.67</td><td class="r3o">0.78</td><td class="r3o">0.43</td><td class="r3o">0.19</td><td class="r3o">0.06</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7485898" >Andrew_Lazarev</a></td><td class="r1e">2478</td><td class="r1e">375</td><td class="r1e">$658.49</td><td class="r2e">26.39</td><td class="r2e">2.20</td><td class="r2e">9.97</td><td class="r3e">1.01</td><td class="r3e">0.63</td><td class="r3e">0.33</td><td class="r3e">0.12</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=346607" >kalmakka</a></td><td class="r1o">2462</td><td class="r1o">428</td><td class="r1o">$693.60</td><td class="r2o">24.90</td><td class="r2o">2.50</td><td class="r2o">10.73</td><td class="r3o">1.01</td><td class="r3o">0.71</td><td class="r3o">0.44</td><td class="r3o">0.21</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7459080" >ardiankp</a></td><td class="r1e">2436</td><td class="r1e">225</td><td class="r1e">$509.72</td><td class="r2e">18.06</td><td class="r2e">0.32</td><td class="r2e">1.02</td><td class="r3e">0.07</td><td class="r3e">0.03</td><td class="r3e">0.01</td><td class="r3e">0.00</td></tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7452866" >Im2Good</a></td><td class="r1o">2402</td><td class="r1o">372</td><td class="r1o">$566.67</td><td class="r2o">21.67</td><td class="r2o">1.26</td><td class="r2o">5.02</td><td class="r3o">0.39</td><td class="r3o">0.22</td><td class="r3o">0.11</td><td class="r3o">0.04</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156216" >daveagp</a></td><td class="r1e">2392</td><td class="r1e">445</td><td class="r1e">$637.69</td><td class="r2e">21.37</td><td class="r2e">1.80</td><td class="r2e">8.56</td><td class="r3e">0.70</td><td class="r3e">0.48</td><td class="r3e">0.29</td><td class="r3e">0.13</td></tr>

<tr>
<td class="rH1" colspan="4"></td><td class="rH2" colspan="3">Probability of advancing to:</td><td class="rH3" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="rHHandle">Handle</td><td class="rH1">Rating</td><td class="rH1">Volatility</td><td class="rH1">Earnings</td>
<td class="rH2">Wildcard</td>
<td class="rH2">Wildcard<br>Top Two</td>
<td class="rH2">Finals</td>

<td class="rH3">4th</td><td class="rH3">3rd</td><td class="rH3">2nd</td><td class="rH3">Champ</td>
</tr>

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=284007" >Ryan</a></td><td class="r1o">2385</td><td class="r1o">240</td><td class="r1o">$510.36</td><td class="r2o">15.11</td><td class="r2o">0.21</td><td class="r2o">1.16</td><td class="r3o">0.07</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390467" >lovro</a></td><td class="r1e">2381</td><td class="r1e">360</td><td class="r1e">$563.62</td><td class="r2e">20.04</td><td class="r2e">0.95</td><td class="r2e">5.16</td><td class="r3e">0.41</td><td class="r3e">0.21</td><td class="r3e">0.10</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=297823" >madking</a></td><td class="r1o">2379</td><td class="r1o">235</td><td class="r1o">$506.50</td><td class="r2o">13.32</td><td class="r2o">0.15</td><td class="r2o">0.73</td><td class="r3o">0.04</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10157606" >Ying</a></td><td class="r1e">2363</td><td class="r1e">536</td><td class="r1e">$713.94</td><td class="r2e">20.92</td><td class="r2e">2.28</td><td class="r2e">10.92</td><td class="r3e">0.84</td><td class="r3e">0.64</td><td class="r3e">0.48</td><td class="r3e">0.32</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287568" >tjq</a></td><td class="r1o">2352</td><td class="r1o">235</td><td class="r1o">$504.14</td><td class="r2o">11.30</td><td class="r2o">0.11</td><td class="r2o">0.48</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8349097" >hauser</a></td><td class="r1e">2346</td><td class="r1e">342</td><td class="r1e">$531.23</td><td class="r2e">16.65</td><td class="r2e">0.59</td><td class="r2e">2.90</td><td class="r3e">0.18</td><td class="r3e">0.10</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=288584" >LunaticFringe</a></td><td class="r1o">2340</td><td class="r1o">276</td><td class="r1o">$512.72</td><td class="r2o">13.81</td><td class="r2o">0.22</td><td class="r2o">1.39</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155880" >NPermyakov</a></td><td class="r1e">2340</td><td class="r1e">389</td><td class="r1e">$562.83</td><td class="r2e">18.27</td><td class="r2e">0.88</td><td class="r2e">5.16</td><td class="r3e">0.37</td><td class="r3e">0.19</td><td class="r3e">0.10</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301395" >HardCoder</a></td><td class="r1o">2293</td><td class="r1o">371</td><td class="r1o">$529.93</td><td class="r2o">14.67</td><td class="r2o">0.49</td><td class="r2o">2.79</td><td class="r3o">0.16</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2059354" >futo</a></td><td class="r1e">2255</td><td class="r1e">319</td><td class="r1e">$508.30</td><td class="r2e">10.53</td><td class="r2e">0.16</td><td class="r2e">0.92</td><td class="r3e">0.04</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7338095" >tomal</a></td><td class="r1o">2239</td><td class="r1o">534</td><td class="r1o">$604.09</td><td class="r2o">16.39</td><td class="r2o">1.21</td><td class="r2o">6.78</td><td class="r3o">0.41</td><td class="r3o">0.28</td><td class="r3o">0.20</td><td class="r3o">0.12</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=107835" >sjelkjd</a></td><td class="r1e">2180</td><td class="r1e">342</td><td class="r1e">$507.23</td><td class="r2e">8.02</td><td class="r2e">0.10</td><td class="r2e">0.85</td><td class="r3e">0.03</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289706" >mickle</a></td><td class="r1o">2163</td><td class="r1o">427</td><td class="r1o">$527.44</td><td class="r2o">11.07</td><td class="r2o">0.31</td><td class="r2o">2.70</td><td class="r3o">0.12</td><td class="r3o">0.06</td><td class="r3o">0.03</td><td class="r3o">0.01</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269025" >assembler</a></td><td class="r1e">2048</td><td class="r1e">222</td><td class="r1e">$500.08</td><td class="r2e">0.73</td><td class="r2e">0.00</td><td class="r2e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11797255" >aubergineanode</a></td><td class="r1o">2033</td><td class="r1o">459</td><td class="r1o">$514.17</td><td class="r2o">7.56</td><td class="r2o">0.15</td><td class="r2o">1.53</td><td class="r3o">0.05</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>

<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13261056" >DamianK</a></td><td class="r1e">1977</td><td class="r1e">440</td><td class="r1e">$506.32</td><td class="r2e">5.63</td><td class="r2e">0.06</td><td class="r2e">0.76</td><td class="r3e">0.01</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
