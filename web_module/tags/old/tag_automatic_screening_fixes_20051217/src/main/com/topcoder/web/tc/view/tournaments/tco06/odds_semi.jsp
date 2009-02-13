<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2006 TopCoder Open - Computer Programming Tournament - Advancers</title>

<jsp:include page="../../script.jsp" />
<link type="text/css" rel="stylesheet" href="/css/TCO06style.css"/>
</head>

<body>

<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="center" class="bodyText" colspan="3"><img src="/i/tournament/tco06/header_logo.gif"/></td>
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
            Beat the odds! These results of 1,000,000 Monte Carlo simulations predict your chances to advance in the 2006 TopCoder Open based only on your current TopCoder rating and volatility.  Try your best to beat these odds as you advance through the tournament.
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

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10574855" >Petr</a></td><td class="r1o">3312</td><td class="r1o">332</td><td class="r1o">$12402.05</td><td class="r2o">17.56</td><td class="r2o">13.70</td><td class="r2o">94.08</td><td class="r3o">6.68</td><td class="r3o">12.44</td><td class="r3o">23.01</td><td class="r3o">46.06</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8355516" >Eryx</a></td><td class="r1e">3037</td><td class="r1e">291</td><td class="r1e">$5598.98</td><td class="r2e">34.01</td><td class="r2e">18.10</td><td class="r2e">76.66</td><td class="r3e">13.34</td><td class="r3e">17.74</td><td class="r3e">18.41</td><td class="r3e">11.14</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8357090" >misof</a></td><td class="r1o">3015</td><td class="r1o">393</td><td class="r1o">$5088.48</td><td class="r2o">34.08</td><td class="r2o">17.26</td><td class="r2o">67.56</td><td class="r3o">9.98</td><td class="r3o">12.10</td><td class="r3o">13.87</td><td class="r3o">12.27</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10481120" >ivan_metelsky</a></td><td class="r1e">2945</td><td class="r1e">429</td><td class="r1e">$3946.22</td><td class="r2e">34.24</td><td class="r2e">15.23</td><td class="r2e">58.78</td><td class="r3e">9.07</td><td class="r3e">9.88</td><td class="r3e">10.05</td><td class="r3e">8.81</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=270505" >John Dethridge</a></td><td class="r1o">2840</td><td class="r1o">392</td><td class="r1o">$2628.78</td><td class="r2o">36.94</td><td class="r2o">12.73</td><td class="r2o">48.15</td><td class="r3o">7.73</td><td class="r3o">7.63</td><td class="r3o">6.60</td><td class="r3o">4.37</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7462740" >ploh</a></td><td class="r1e">2738</td><td class="r1e">370</td><td class="r1e">$1469.87</td><td class="r2e">43.27</td><td class="r2e">10.76</td><td class="r2e">30.26</td><td class="r3e">4.81</td><td class="r3e">4.03</td><td class="r3e">2.89</td><td class="r3e">1.53</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7442498" >marek.cygan</a></td><td class="r1o">2697</td><td class="r1o">505</td><td class="r1o">$1732.34</td><td class="r2o">32.78</td><td class="r2o">8.97</td><td class="r2o">32.38</td><td class="r3o">3.97</td><td class="r3o">3.65</td><td class="r3o">3.23</td><td class="r3o">2.82</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=262936" >dgarthur</a></td><td class="r1e">2675</td><td class="r1e">484</td><td class="r1e">$1657.07</td><td class="r2e">30.00</td><td class="r2e">7.58</td><td class="r2e">32.80</td><td class="r3e">4.11</td><td class="r3e">3.71</td><td class="r3e">3.19</td><td class="r3e">2.40</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=293874" >nicka81</a></td><td class="r1o">2651</td><td class="r1o">345</td><td class="r1o">$998.80</td><td class="r2o">39.04</td><td class="r2o">6.76</td><td class="r2o">21.00</td><td class="r3o">3.05</td><td class="r3o">2.22</td><td class="r3o">1.35</td><td class="r3o">0.58</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=275071" >antimatter</a></td><td class="r1e">2649</td><td class="r1e">451</td><td class="r1e">$1373.36</td><td class="r2e">32.59</td><td class="r2e">7.29</td><td class="r2e">27.09</td><td class="r3e">3.44</td><td class="r3e">3.04</td><td class="r3e">2.42</td><td class="r3e">1.65</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390224" >gawry</a></td><td class="r1o">2615</td><td class="r1o">530</td><td class="r1o">$1505.88</td><td class="r2o">26.85</td><td class="r2o">6.28</td><td class="r2o">29.54</td><td class="r3o">3.33</td><td class="r3o">2.95</td><td class="r3o">2.62</td><td class="r3o">2.20</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9906197" >krijgertje</a></td><td class="r1e">2597</td><td class="r1e">415</td><td class="r1e">$975.74</td><td class="r2e">34.46</td><td class="r2e">6.02</td><td class="r2e">19.23</td><td class="r3e">2.38</td><td class="r3e">1.85</td><td class="r3e">1.28</td><td class="r3e">0.68</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8601171" >HilbertRaum</a></td><td class="r1o">2588</td><td class="r1o">416</td><td class="r1o">$951.10</td><td class="r2o">34.00</td><td class="r2o">5.82</td><td class="r2o">18.62</td><td class="r3o">2.30</td><td class="r3o">1.72</td><td class="r3o">1.19</td><td class="r3o">0.64</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=277659" >radeye</a></td><td class="r1e">2586</td><td class="r1e">270</td><td class="r1e">$683.43</td><td class="r2e">38.29</td><td class="r2e">3.47</td><td class="r2e">11.13</td><td class="r3e">1.57</td><td class="r3e">0.93</td><td class="r3e">0.39</td><td class="r3e">0.08</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=301937" >RalphFurmaniak</a></td><td class="r1o">2582</td><td class="r1o">293</td><td class="r1o">$696.40</td><td class="r2o">36.81</td><td class="r2o">3.77</td><td class="r2o">11.31</td><td class="r3o">1.61</td><td class="r3o">0.98</td><td class="r3o">0.44</td><td class="r3o">0.11</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7479769" >marian</a></td><td class="r1e">2581</td><td class="r1e">207</td><td class="r1e">$576.77</td><td class="r2e">38.68</td><td class="r2e">2.22</td><td class="r2e">5.63</td><td class="r3e">0.83</td><td class="r3e">0.38</td><td class="r3e">0.11</td><td class="r3e">0.01</td></tr>
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

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=274023" >venco</a></td><td class="r1o">2575</td><td class="r1o">312</td><td class="r1o">$740.30</td><td class="r2o">35.34</td><td class="r2o">3.73</td><td class="r2o">13.31</td><td class="r3o">1.80</td><td class="r3o">1.15</td><td class="r3o">0.56</td><td class="r3o">0.17</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=279471" >haha</a></td><td class="r1e">2570</td><td class="r1e">349</td><td class="r1e">$751.04</td><td class="r2e">35.59</td><td class="r2e">4.44</td><td class="r2e">13.00</td><td class="r3e">1.64</td><td class="r3e">1.09</td><td class="r3e">0.61</td><td class="r3e">0.23</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287105" >lars</a></td><td class="r1o">2563</td><td class="r1o">278</td><td class="r1o">$622.72</td><td class="r2o">36.89</td><td class="r2o">3.12</td><td class="r2o">8.03</td><td class="r3o">1.03</td><td class="r3o">0.57</td><td class="r3o">0.23</td><td class="r3o">0.06</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10599449" >natori</a></td><td class="r1e">2547</td><td class="r1e">288</td><td class="r1e">$648.73</td><td class="r2e">33.87</td><td class="r2e">2.73</td><td class="r2e">9.57</td><td class="r3e">1.21</td><td class="r3e">0.71</td><td class="r3e">0.30</td><td class="r3e">0.07</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=308453" >overwise</a></td><td class="r1o">2546</td><td class="r1o">438</td><td class="r1o">$933.42</td><td class="r2o">29.41</td><td class="r2o">4.59</td><td class="r2o">17.95</td><td class="r3o">2.08</td><td class="r3o">1.62</td><td class="r3o">1.16</td><td class="r3o">0.62</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7393427" >texel</a></td><td class="r1e">2538</td><td class="r1e">576</td><td class="r1e">$1279.19</td><td class="r2e">24.67</td><td class="r2e">5.19</td><td class="r2e">24.39</td><td class="r3e">2.45</td><td class="r3e">2.16</td><td class="r3e">1.94</td><td class="r3e">1.72</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=309982" >cyfra</a></td><td class="r1o">2538</td><td class="r1o">307</td><td class="r1o">$667.33</td><td class="r2o">32.52</td><td class="r2o">2.87</td><td class="r2o">10.39</td><td class="r3o">1.28</td><td class="r3o">0.77</td><td class="r3o">0.36</td><td class="r3o">0.09</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=9958600" >Zis</a></td><td class="r1e">2498</td><td class="r1e">376</td><td class="r1e">$678.68</td><td class="r2e">29.86</td><td class="r2e">3.15</td><td class="r2e">10.23</td><td class="r3e">1.08</td><td class="r3e">0.72</td><td class="r3e">0.40</td><td class="r3e">0.16</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10428762" >HiltonLange</a></td><td class="r1o">2485</td><td class="r1o">400</td><td class="r1o">$698.09</td><td class="r2o">28.76</td><td class="r2o">3.18</td><td class="r2o">10.93</td><td class="r3o">1.11</td><td class="r3o">0.78</td><td class="r3o">0.45</td><td class="r3o">0.20</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=153656" >elizarov</a></td><td class="r1e">2478</td><td class="r1e">335</td><td class="r1e">$629.87</td><td class="r2e">27.39</td><td class="r2e">2.12</td><td class="r2e">8.67</td><td class="r3e">0.91</td><td class="r3e">0.55</td><td class="r3e">0.26</td><td class="r3e">0.07</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7485898" >Andrew_Lazarev</a></td><td class="r1o">2478</td><td class="r1o">375</td><td class="r1o">$672.54</td><td class="r2o">27.12</td><td class="r2o">2.61</td><td class="r2o">10.05</td><td class="r3o">1.11</td><td class="r3o">0.72</td><td class="r3o">0.38</td><td class="r3o">0.14</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=346607" >kalmakka</a></td><td class="r1e">2462</td><td class="r1e">428</td><td class="r1e">$733.24</td><td class="r2e">25.58</td><td class="r2e">2.93</td><td class="r2e">12.20</td><td class="r3e">1.25</td><td class="r3e">0.89</td><td class="r3e">0.56</td><td class="r3e">0.26</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7459080" >ardiankp</a></td><td class="r1o">2436</td><td class="r1o">225</td><td class="r1o">$518.26</td><td class="r2o">20.53</td><td class="r2o">0.42</td><td class="r2o">1.82</td><td class="r3o">0.15</td><td class="r3o">0.06</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7452866" >Im2Good</a></td><td class="r1e">2402</td><td class="r1e">372</td><td class="r1e">$579.87</td><td class="r2e">23.23</td><td class="r2e">1.58</td><td class="r2e">5.82</td><td class="r3e">0.49</td><td class="r3e">0.30</td><td class="r3e">0.15</td><td class="r3e">0.05</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287266" >jms137</a></td><td class="r1o">2392</td><td class="r1o">243</td><td class="r1o">$510.77</td><td class="r2o">17.30</td><td class="r2o">0.34</td><td class="r2o">1.13</td><td class="r3o">0.07</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=156216" >daveagp</a></td><td class="r1e">2392</td><td class="r1e">445</td><td class="r1e">$682.01</td><td class="r2e">21.82</td><td class="r2e">2.07</td><td class="r2e">10.72</td><td class="r3e">0.93</td><td class="r3e">0.65</td><td class="r3e">0.41</td><td class="r3e">0.18</td></tr>
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

<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=284007" >Ryan</a></td><td class="r1o">2385</td><td class="r1o">240</td><td class="r1o">$511.19</td><td class="r2o">15.64</td><td class="r2o">0.27</td><td class="r2o">1.19</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7390467" >lovro</a></td><td class="r1e">2381</td><td class="r1e">360</td><td class="r1e">$568.34</td><td class="r2e">20.54</td><td class="r2e">1.17</td><td class="r2e">5.22</td><td class="r3e">0.44</td><td class="r3e">0.25</td><td class="r3e">0.12</td><td class="r3e">0.03</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=297823" >madking</a></td><td class="r1o">2379</td><td class="r1o">235</td><td class="r1o">$510.91</td><td class="r2o">15.37</td><td class="r2o">0.22</td><td class="r2o">1.17</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=10157606" >Ying</a></td><td class="r1e">2363</td><td class="r1e">536</td><td class="r1e">$738.86</td><td class="r2e">21.69</td><td class="r2e">2.63</td><td class="r2e">11.91</td><td class="r3e">0.96</td><td class="r3e">0.74</td><td class="r3e">0.54</td><td class="r3e">0.36</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=287568" >tjq</a></td><td class="r1o">2352</td><td class="r1o">235</td><td class="r1o">$505.47</td><td class="r2o">13.16</td><td class="r2o">0.16</td><td class="r2o">0.62</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=8349097" >hauser</a></td><td class="r1e">2346</td><td class="r1e">342</td><td class="r1e">$545.43</td><td class="r2e">18.05</td><td class="r2e">0.73</td><td class="r2e">3.97</td><td class="r3e">0.28</td><td class="r3e">0.15</td><td class="r3e">0.06</td><td class="r3e">0.02</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=288584" >LunaticFringe</a></td><td class="r1o">2340</td><td class="r1o">276</td><td class="r1o">$513.94</td><td class="r2o">14.18</td><td class="r2o">0.29</td><td class="r2o">1.45</td><td class="r3o">0.09</td><td class="r3o">0.04</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=155880" >NPermyakov</a></td><td class="r1e">2340</td><td class="r1e">389</td><td class="r1e">$566.51</td><td class="r2e">18.67</td><td class="r2e">1.04</td><td class="r2e">5.18</td><td class="r3e">0.40</td><td class="r3e">0.23</td><td class="r3e">0.11</td><td class="r3e">0.04</td></tr>
<tr><td class="rHandleo"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=2059354" >futo</a></td><td class="r1o">2255</td><td class="r1o">319</td><td class="r1o">$514.80</td><td class="r2o">11.53</td><td class="r2o">0.21</td><td class="r2o">1.58</td><td class="r3o">0.08</td><td class="r3o">0.03</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextRed" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=7338095" >tomal</a></td><td class="r1e">2239</td><td class="r1e">534</td><td class="r1e">$618.74</td><td class="r2e">17.19</td><td class="r2e">1.41</td><td class="r2e">7.43</td><td class="r3e">0.48</td><td class="r3e">0.33</td><td class="r3e">0.24</td><td class="r3e">0.14</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=107835" >sjelkjd</a></td><td class="r1o">2180</td><td class="r1o">342</td><td class="r1o">$507.84</td><td class="r2o">9.13</td><td class="r2o">0.14</td><td class="r2o">0.89</td><td class="r3o">0.04</td><td class="r3o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289706" >mickle</a></td><td class="r1e">2163</td><td class="r1e">427</td><td class="r1e">$531.31</td><td class="r2e">11.44</td><td class="r2e">0.36</td><td class="r2e">3.03</td><td class="r3e">0.14</td><td class="r3e">0.08</td><td class="r3e">0.04</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=269025" >assembler</a></td><td class="r1o">2048</td><td class="r1o">222</td><td class="r1o">$500.06</td><td class="r2o">0.79</td><td class="r2o">0.00</td><td class="r2o">0.01</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=11797255" >aubergineanode</a></td><td class="r1e">2033</td><td class="r1e">459</td><td class="r1e">$517.32</td><td class="r2e">7.96</td><td class="r2e">0.18</td><td class="r2e">1.79</td><td class="r3e">0.06</td><td class="r3e">0.04</td><td class="r3e">0.02</td><td class="r3e">0.01</td></tr>
<tr><td class="rHandleo"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=13261056" >DamianK</a></td><td class="r1o">1977</td><td class="r1o">440</td><td class="r1o">$510.16</td><td class="r2o">6.03</td><td class="r2o">0.08</td><td class="r2o">1.20</td><td class="r3o">0.03</td><td class="r3o">0.02</td><td class="r3o">0.01</td><td class="r3o">0.00</td></tr>
<tr><td class="rHandlee"><a class="coderTextYellow" href="http://www.topcoder.com/tc?module=MemberProfile&amp;cr=289307" >wrjxm</a></td><td class="r1e">1848</td><td class="r1e">501</td><td class="r1e">$507.77</td><td class="r2e">5.12</td><td class="r2e">0.07</td><td class="r2e">0.91</td><td class="r3e">0.02</td><td class="r3e">0.01</td><td class="r3e">0.00</td><td class="r3e">0.00</td></tr>
</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
