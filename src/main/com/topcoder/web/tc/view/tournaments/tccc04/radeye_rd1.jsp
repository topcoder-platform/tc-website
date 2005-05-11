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
               By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>
         </tr>
      </table>
<br/>


<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right" nowrap="0">Online 2</td>
<td class="ccrh2" align="right" nowrap="0">Online 3</td>
<td class="ccrh2" align="right" nowrap="0">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right" nowrap="0">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=144400">tomek</a></td>
<td class="ccrt1o" align="right">3459</td>
<td class="ccrt1o" align="right">219</td>
<td class="ccrt1o" align="right" nowrap="0">$17 787.48</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">100.00</td>
<td class="ccrt2o" align="right">17.74</td>
<td class="ccrt2o" align="right">12.58</td>
<td class="ccrt2o" align="right">94.34</td>
<td class="ccrt3o" align="right">0.76</td>
<td class="ccrt3o" align="right">6.47</td>
<td class="ccrt3o" align="right">26.64</td>
<td class="ccrt3o" align="right">60.46</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260835">reid</a></td>
<td class="ccrt1e" align="right">3200</td>
<td class="ccrt1e" align="right">334</td>
<td class="ccrt1e" align="right">$7 559.55</td>
<td class="ccrt2e" align="right">100.00</td>
<td class="ccrt2e" align="right">100.00</td>
<td class="ccrt2e" align="right">99.98</td>
<td class="ccrt2e" align="right">99.42</td>
<td class="ccrt2e" align="right">35.90</td>
<td class="ccrt2e" align="right">16.21</td>
<td class="ccrt2e" align="right">71.49</td>
<td class="ccrt3e" align="right">7.41</td>
<td class="ccrt3e" align="right">19.91</td>
<td class="ccrt3e" align="right">27.66</td>
<td class="ccrt3e" align="right">16.50</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=270505">John Dethridge</a></td>
<td class="ccrt1o" align="right">3118</td>
<td class="ccrt1o" align="right">509</td>
<td class="ccrt1o" align="right">$5 549.22</td>
<td class="ccrt2o" align="right">99.92</td>
<td class="ccrt2o" align="right">99.61</td>
<td class="ccrt2o" align="right">98.17</td>
<td class="ccrt2o" align="right">92.03</td>
<td class="ccrt2o" align="right">28.14</td>
<td class="ccrt2o" align="right">11.32</td>
<td class="ccrt2o" align="right">55.32</td>
<td class="ccrt3o" align="right">12.07</td>
<td class="ccrt3o" align="right">15.38</td>
<td class="ccrt3o" align="right">14.21</td>
<td class="ccrt3o" align="right">13.65</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=152347">ZorbaTHut</a></td>
<td class="ccrt1e" align="right">3006</td>
<td class="ccrt1e" align="right">263</td>
<td class="ccrt1e" align="right">$2 760.95</td>
<td class="ccrt2e" align="right">100.00</td>
<td class="ccrt2e" align="right">100.00</td>
<td class="ccrt2e" align="right">99.99</td>
<td class="ccrt2e" align="right">99.30</td>
<td class="ccrt2e" align="right">55.06</td>
<td class="ccrt2e" align="right">14.54</td>
<td class="ccrt2e" align="right">42.75</td>
<td class="ccrt3e" align="right">9.62</td>
<td class="ccrt3e" align="right">17.78</td>
<td class="ccrt3e" align="right">12.38</td>
<td class="ccrt3e" align="right">2.97</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262056">mathijs</a></td>
<td class="ccrt1o" align="right">2816</td>
<td class="ccrt1o" align="right">421</td>
<td class="ccrt1o" align="right">$1 167.44</td>
<td class="ccrt2o" align="right">99.91</td>
<td class="ccrt2o" align="right">99.43</td>
<td class="ccrt2o" align="right">96.69</td>
<td class="ccrt2o" align="right">84.27</td>
<td class="ccrt2o" align="right">35.36</td>
<td class="ccrt2o" align="right">6.50</td>
<td class="ccrt2o" align="right">20.77</td>
<td class="ccrt3o" align="right">8.55</td>
<td class="ccrt3o" align="right">6.76</td>
<td class="ccrt3o" align="right">3.98</td>
<td class="ccrt3o" align="right">1.47</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=311170">bladerunner</a></td>
<td class="ccrt1e" align="right">2814</td>
<td class="ccrt1e" align="right">340</td>
<td class="ccrt1e" align="right">$664.54</td>
<td class="ccrt2e" align="right">99.99</td>
<td class="ccrt2e" align="right">99.93</td>
<td class="ccrt2e" align="right">99.00</td>
<td class="ccrt2e" align="right">90.86</td>
<td class="ccrt2e" align="right">45.30</td>
<td class="ccrt2e" align="right">6.76</td>
<td class="ccrt2e" align="right">12.99</td>
<td class="ccrt3e" align="right">5.29</td>
<td class="ccrt3e" align="right">4.64</td>
<td class="ccrt3e" align="right">2.44</td>
<td class="ccrt3e" align="right">0.61</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=262936">dgarthur</a></td>
<td class="ccrt1o" align="right">2810</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$565.58</td>
<td class="ccrt2o" align="right">99.99</td>
<td class="ccrt2o" align="right">99.92</td>
<td class="ccrt2o" align="right">98.98</td>
<td class="ccrt2o" align="right">90.64</td>
<td class="ccrt2o" align="right">46.08</td>
<td class="ccrt2o" align="right">6.80</td>
<td class="ccrt2o" align="right">11.12</td>
<td class="ccrt3o" align="right">4.63</td>
<td class="ccrt3o" align="right">3.91</td>
<td class="ccrt3o" align="right">2.05</td>
<td class="ccrt3o" align="right">0.53</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287496">bstanescu</a></td>
<td class="ccrt1e" align="right">2726</td>
<td class="ccrt1e" align="right">619</td>
<td class="ccrt1e" align="right">$879.33</td>
<td class="ccrt2e" align="right">97.59</td>
<td class="ccrt2e" align="right">92.46</td>
<td class="ccrt2e" align="right">81.14</td>
<td class="ccrt2e" align="right">59.61</td>
<td class="ccrt2e" align="right">19.26</td>
<td class="ccrt2e" align="right">4.05</td>
<td class="ccrt2e" align="right">13.80</td>
<td class="ccrt3e" align="right">6.50</td>
<td class="ccrt3e" align="right">3.44</td>
<td class="ccrt3e" align="right">2.21</td>
<td class="ccrt3e" align="right">1.65</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=286907">WishingBone</a></td>
<td class="ccrt1o" align="right">2704</td>
<td class="ccrt1o" align="right">365</td>
<td class="ccrt1o" align="right">$424.42</td>
<td class="ccrt2o" align="right">99.95</td>
<td class="ccrt2o" align="right">99.58</td>
<td class="ccrt2o" align="right">96.76</td>
<td class="ccrt2o" align="right">81.41</td>
<td class="ccrt2o" align="right">31.09</td>
<td class="ccrt2o" align="right">3.26</td>
<td class="ccrt2o" align="right">9.62</td>
<td class="ccrt3o" align="right">4.67</td>
<td class="ccrt3o" align="right">3.23</td>
<td class="ccrt3o" align="right">1.43</td>
<td class="ccrt3o" align="right">0.29</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=8355516">Eryx</a></td>
<td class="ccrt1e" align="right">2664</td>
<td class="ccrt1e" align="right">406</td>
<td class="ccrt1e" align="right">$409.44</td>
<td class="ccrt2e" align="right">99.79</td>
<td class="ccrt2e" align="right">98.76</td>
<td class="ccrt2e" align="right">93.49</td>
<td class="ccrt2e" align="right">73.74</td>
<td class="ccrt2e" align="right">24.30</td>
<td class="ccrt2e" align="right">2.56</td>
<td class="ccrt2e" align="right">9.23</td>
<td class="ccrt3e" align="right">4.67</td>
<td class="ccrt3e" align="right">2.95</td>
<td class="ccrt3e" align="right">1.29</td>
<td class="ccrt3e" align="right">0.33</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=309453">Jan_Kuipers</a></td>
<td class="ccrt1o" align="right">2660</td>
<td class="ccrt1o" align="right">320</td>
<td class="ccrt1o" align="right">$265.05</td>
<td class="ccrt2o" align="right">99.98</td>
<td class="ccrt2o" align="right">99.81</td>
<td class="ccrt2o" align="right">97.69</td>
<td class="ccrt2o" align="right">82.17</td>
<td class="ccrt2o" align="right">28.11</td>
<td class="ccrt2o" align="right">2.02</td>
<td class="ccrt2o" align="right">6.81</td>
<td class="ccrt3o" align="right">3.54</td>
<td class="ccrt3o" align="right">2.34</td>
<td class="ccrt3o" align="right">0.82</td>
<td class="ccrt3o" align="right">0.11</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=2058672">dary</a></td>
<td class="ccrt1e" align="right">2588</td>
<td class="ccrt1e" align="right">345</td>
<td class="ccrt1e" align="right">$156.40</td>
<td class="ccrt2e" align="right">99.91</td>
<td class="ccrt2e" align="right">99.29</td>
<td class="ccrt2e" align="right">94.67</td>
<td class="ccrt2e" align="right">72.38</td>
<td class="ccrt2e" align="right">20.61</td>
<td class="ccrt2e" align="right">1.21</td>
<td class="ccrt2e" align="right">4.29</td>
<td class="ccrt3e" align="right">2.45</td>
<td class="ccrt3e" align="right">1.33</td>
<td class="ccrt3e" align="right">0.44</td>
<td class="ccrt3e" align="right">0.06</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287568">tjq</a></td>
<td class="ccrt1o" align="right">2575</td>
<td class="ccrt1o" align="right">576</td>
<td class="ccrt1o" align="right">$336.07</td>
<td class="ccrt2o" align="right">96.83</td>
<td class="ccrt2o" align="right">90.14</td>
<td class="ccrt2o" align="right">75.57</td>
<td class="ccrt2o" align="right">49.78</td>
<td class="ccrt2o" align="right">13.30</td>
<td class="ccrt2o" align="right">1.79</td>
<td class="ccrt2o" align="right">6.77</td>
<td class="ccrt3o" align="right">3.74</td>
<td class="ccrt3o" align="right">1.70</td>
<td class="ccrt3o" align="right">0.88</td>
<td class="ccrt3o" align="right">0.46</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=345049">aneubeck</a></td>
<td class="ccrt1e" align="right">2563</td>
<td class="ccrt1e" align="right">428</td>
<td class="ccrt1e" align="right">$161.88</td>
<td class="ccrt2e" align="right">99.32</td>
<td class="ccrt2e" align="right">96.85</td>
<td class="ccrt2e" align="right">87.44</td>
<td class="ccrt2e" align="right">61.22</td>
<td class="ccrt2e" align="right">16.63</td>
<td class="ccrt2e" align="right">1.33</td>
<td class="ccrt2e" align="right">4.07</td>
<td class="ccrt3e" align="right">2.35</td>
<td class="ccrt3e" align="right">1.15</td>
<td class="ccrt3e" align="right">0.45</td>
<td class="ccrt3e" align="right">0.11</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307060">AdrianKuegel</a></td>
<td class="ccrt1o" align="right">2562</td>
<td class="ccrt1o" align="right">415</td>
<td class="ccrt1o" align="right">$142.31</td>
<td class="ccrt2o" align="right">99.46</td>
<td class="ccrt2o" align="right">97.29</td>
<td class="ccrt2o" align="right">88.52</td>
<td class="ccrt2o" align="right">62.35</td>
<td class="ccrt2o" align="right">16.82</td>
<td class="ccrt2o" align="right">1.27</td>
<td class="ccrt2o" align="right">3.63</td>
<td class="ccrt3o" align="right">2.10</td>
<td class="ccrt3o" align="right">1.04</td>
<td class="ccrt3o" align="right">0.40</td>
<td class="ccrt3o" align="right">0.09</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287105">lars</a></td>
<td class="ccrt1e" align="right">2558</td>
<td class="ccrt1e" align="right">464</td>
<td class="ccrt1e" align="right">$183.74</td>
<td class="ccrt2e" align="right">98.84</td>
<td class="ccrt2e" align="right">95.30</td>
<td class="ccrt2e" align="right">84.17</td>
<td class="ccrt2e" align="right">57.36</td>
<td class="ccrt2e" align="right">15.37</td>
<td class="ccrt2e" align="right">1.40</td>
<td class="ccrt2e" align="right">4.37</td>
<td class="ccrt3e" align="right">2.51</td>
<td class="ccrt3e" align="right">1.19</td>
<td class="ccrt3e" align="right">0.52</td>
<td class="ccrt3e" align="right">0.16</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=286911">Xu Chuan</a></td>
<td class="ccrt1o" align="right">2498</td>
<td class="ccrt1o" align="right">323</td>
<td class="ccrt1o" align="right">$44.18</td>
<td class="ccrt2o" align="right">99.89</td>
<td class="ccrt2o" align="right">99.05</td>
<td class="ccrt2o" align="right">92.63</td>
<td class="ccrt2o" align="right">63.79</td>
<td class="ccrt2o" align="right">13.17</td>
<td class="ccrt2o" align="right">0.44</td>
<td class="ccrt2o" align="right">1.38</td>
<td class="ccrt3o" align="right">0.89</td>
<td class="ccrt3o" align="right">0.38</td>
<td class="ccrt3o" align="right">0.10</td>
<td class="ccrt3o" align="right">0.01</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7428266">Klinck</a></td>
<td class="ccrt1e" align="right">2483</td>
<td class="ccrt1e" align="right">319</td>
<td class="ccrt1e" align="right">$40.70</td>
<td class="ccrt2e" align="right">99.89</td>
<td class="ccrt2e" align="right">99.01</td>
<td class="ccrt2e" align="right">92.20</td>
<td class="ccrt2e" align="right">62.09</td>
<td class="ccrt2e" align="right">12.06</td>
<td class="ccrt2e" align="right">0.36</td>
<td class="ccrt2e" align="right">1.29</td>
<td class="ccrt3e" align="right">0.84</td>
<td class="ccrt3e" align="right">0.36</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=153902">evd</a></td>
<td class="ccrt1o" align="right">2482</td>
<td class="ccrt1o" align="right">369</td>
<td class="ccrt1o" align="right">$67.31</td>
<td class="ccrt2o" align="right">99.59</td>
<td class="ccrt2o" align="right">97.60</td>
<td class="ccrt2o" align="right">87.88</td>
<td class="ccrt2o" align="right">57.14</td>
<td class="ccrt2o" align="right">11.74</td>
<td class="ccrt2o" align="right">0.50</td>
<td class="ccrt2o" align="right">2.03</td>
<td class="ccrt3o" align="right">1.29</td>
<td class="ccrt3o" align="right">0.55</td>
<td class="ccrt3o" align="right">0.16</td>
<td class="ccrt3o" align="right">0.02</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=307638">Wernie</a></td>
<td class="ccrt1e" align="right">2459</td>
<td class="ccrt1e" align="right">486</td>
<td class="ccrt1e" align="right">$116.01</td>
<td class="ccrt2e" align="right">97.53</td>
<td class="ccrt2e" align="right">91.21</td>
<td class="ccrt2e" align="right">75.13</td>
<td class="ccrt2e" align="right">44.83</td>
<td class="ccrt2e" align="right">9.44</td>
<td class="ccrt2e" align="right">0.67</td>
<td class="ccrt2e" align="right">3.09</td>
<td class="ccrt3e" align="right">1.93</td>
<td class="ccrt3e" align="right">0.78</td>
<td class="ccrt3e" align="right">0.29</td>
<td class="ccrt3e" align="right">0.08</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=113178">po</a></td>
<td class="ccrt1o" align="right">2451</td>
<td class="ccrt1o" align="right">263</td>
<td class="ccrt1o" align="right">$17.41</td>
<td class="ccrt2o" align="right">99.98</td>
<td class="ccrt2o" align="right">99.68</td>
<td class="ccrt2o" align="right">94.95</td>
<td class="ccrt2o" align="right">62.91</td>
<td class="ccrt2o" align="right">9.26</td>
<td class="ccrt2o" align="right">0.14</td>
<td class="ccrt2o" align="right">0.60</td>
<td class="ccrt3o" align="right">0.41</td>
<td class="ccrt3o" align="right">0.16</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=288584">LunaticFringe</a></td>
<td class="ccrt1e" align="right">2438</td>
<td class="ccrt1e" align="right">392</td>
<td class="ccrt1e" align="right">$53.55</td>
<td class="ccrt2e" align="right">99.12</td>
<td class="ccrt2e" align="right">95.72</td>
<td class="ccrt2e" align="right">82.75</td>
<td class="ccrt2e" align="right">49.52</td>
<td class="ccrt2e" align="right">9.16</td>
<td class="ccrt2e" align="right">0.37</td>
<td class="ccrt2e" align="right">1.64</td>
<td class="ccrt3e" align="right">1.08</td>
<td class="ccrt3e" align="right">0.43</td>
<td class="ccrt3e" align="right">0.12</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=7311097">m00tz</a></td>
<td class="ccrt1o" align="right">2434</td>
<td class="ccrt1o" align="right">451</td>
<td class="ccrt1o" align="right">$72.51</td>
<td class="ccrt2o" align="right">98.04</td>
<td class="ccrt2o" align="right">92.41</td>
<td class="ccrt2o" align="right">76.55</td>
<td class="ccrt2o" align="right">44.56</td>
<td class="ccrt2o" align="right">8.70</td>
<td class="ccrt2o" align="right">0.48</td>
<td class="ccrt2o" align="right">2.07</td>
<td class="ccrt3o" align="right">1.35</td>
<td class="ccrt3o" align="right">0.52</td>
<td class="ccrt3o" align="right">0.17</td>
<td class="ccrt3o" align="right">0.04</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=260987">dangelo</a></td>
<td class="ccrt1e" align="right">2427</td>
<td class="ccrt1e" align="right">403</td>
<td class="ccrt1e" align="right">$45.92</td>
<td class="ccrt2e" align="right">98.88</td>
<td class="ccrt2e" align="right">94.86</td>
<td class="ccrt2e" align="right">80.76</td>
<td class="ccrt2e" align="right">47.25</td>
<td class="ccrt2e" align="right">8.54</td>
<td class="ccrt2e" align="right">0.35</td>
<td class="ccrt2e" align="right">1.41</td>
<td class="ccrt3e" align="right">0.94</td>
<td class="ccrt3e" align="right">0.35</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=251074">bmerry</a></td>
<td class="ccrt1o" align="right">2418</td>
<td class="ccrt1o" align="right">571</td>
<td class="ccrt1o" align="right">$109.90</td>
<td class="ccrt2o" align="right">94.51</td>
<td class="ccrt2o" align="right">83.96</td>
<td class="ccrt2o" align="right">64.21</td>
<td class="ccrt2o" align="right">35.56</td>
<td class="ccrt2o" align="right">7.21</td>
<td class="ccrt2o" align="right">0.63</td>
<td class="ccrt2o" align="right">2.72</td>
<td class="ccrt3o" align="right">1.73</td>
<td class="ccrt3o" align="right">0.62</td>
<td class="ccrt3o" align="right">0.27</td>
<td class="ccrt3o" align="right">0.10</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=264869">ante</a></td>
<td class="ccrt1e" align="right">2417</td>
<td class="ccrt1e" align="right">535</td>
<td class="ccrt1e" align="right">$89.93</td>
<td class="ccrt2e" align="right">95.58</td>
<td class="ccrt2e" align="right">86.28</td>
<td class="ccrt2e" align="right">67.18</td>
<td class="ccrt2e" align="right">37.36</td>
<td class="ccrt2e" align="right">7.49</td>
<td class="ccrt2e" align="right">0.57</td>
<td class="ccrt2e" align="right">2.34</td>
<td class="ccrt3e" align="right">1.50</td>
<td class="ccrt3e" align="right">0.55</td>
<td class="ccrt3e" align="right">0.22</td>
<td class="ccrt3e" align="right">0.07</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=129672">doeth</a></td>
<td class="ccrt1o" align="right">2385</td>
<td class="ccrt1o" align="right">374</td>
<td class="ccrt1o" align="right">$21.57</td>
<td class="ccrt2o" align="right">99.07</td>
<td class="ccrt2o" align="right">95.24</td>
<td class="ccrt2o" align="right">80.38</td>
<td class="ccrt2o" align="right">44.02</td>
<td class="ccrt2o" align="right">6.61</td>
<td class="ccrt2o" align="right">0.18</td>
<td class="ccrt2o" align="right">0.71</td>
<td class="ccrt3o" align="right">0.49</td>
<td class="ccrt3o" align="right">0.17</td>
<td class="ccrt3o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=310430">gepa</a></td>
<td class="ccrt1e" align="right">2372</td>
<td class="ccrt1e" align="right">466</td>
<td class="ccrt1e" align="right">$41.48</td>
<td class="ccrt2e" align="right">96.87</td>
<td class="ccrt2e" align="right">88.95</td>
<td class="ccrt2e" align="right">69.71</td>
<td class="ccrt2e" align="right">36.72</td>
<td class="ccrt2e" align="right">6.27</td>
<td class="ccrt2e" align="right">0.30</td>
<td class="ccrt2e" align="right">1.24</td>
<td class="ccrt3e" align="right">0.84</td>
<td class="ccrt3e" align="right">0.29</td>
<td class="ccrt3e" align="right">0.09</td>
<td class="ccrt3e" align="right">0.02</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=308953">Mike Mirzayanov</a></td>
<td class="ccrt1o" align="right">2363</td>
<td class="ccrt1o" align="right">520</td>
<td class="ccrt1o" align="right">$55.06</td>
<td class="ccrt2o" align="right">95.07</td>
<td class="ccrt2o" align="right">84.67</td>
<td class="ccrt2o" align="right">63.78</td>
<td class="ccrt2o" align="right">32.93</td>
<td class="ccrt2o" align="right">5.79</td>
<td class="ccrt2o" align="right">0.35</td>
<td class="ccrt2o" align="right">1.55</td>
<td class="ccrt3o" align="right">1.04</td>
<td class="ccrt3o" align="right">0.35</td>
<td class="ccrt3o" align="right">0.13</td>
<td class="ccrt3o" align="right">0.04</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=275071">antimatter</a></td>
<td class="ccrt1e" align="right">2355</td>
<td class="ccrt1e" align="right">586</td>
<td class="ccrt1e" align="right">$74.16</td>
<td class="ccrt2e" align="right">92.66</td>
<td class="ccrt2e" align="right">79.66</td>
<td class="ccrt2e" align="right">57.65</td>
<td class="ccrt2e" align="right">29.38</td>
<td class="ccrt2e" align="right">5.34</td>
<td class="ccrt2e" align="right">0.41</td>
<td class="ccrt2e" align="right">1.93</td>
<td class="ccrt3e" align="right">1.28</td>
<td class="ccrt3e" align="right">0.41</td>
<td class="ccrt3e" align="right">0.17</td>
<td class="ccrt3e" align="right">0.07</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=261024">grotmol</a></td>
<td class="ccrt1o" align="right">2318</td>
<td class="ccrt1o" align="right">510</td>
<td class="ccrt1o" align="right">$36.34</td>
<td class="ccrt2o" align="right">94.44</td>
<td class="ccrt2o" align="right">82.96</td>
<td class="ccrt2o" align="right">60.44</td>
<td class="ccrt2o" align="right">29.10</td>
<td class="ccrt2o" align="right">4.53</td>
<td class="ccrt2o" align="right">0.22</td>
<td class="ccrt2o" align="right">1.10</td>
<td class="ccrt3o" align="right">0.77</td>
<td class="ccrt3o" align="right">0.24</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.02</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287979">Oblok</a></td>
<td class="ccrt1e" align="right">2285</td>
<td class="ccrt1e" align="right">324</td>
<td class="ccrt1e" align="right">$4.22</td>
<td class="ccrt2e" align="right">99.19</td>
<td class="ccrt2e" align="right">95.05</td>
<td class="ccrt2e" align="right">76.43</td>
<td class="ccrt2e" align="right">33.05</td>
<td class="ccrt2e" align="right">2.74</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.16</td>
<td class="ccrt3e" align="right">0.12</td>
<td class="ccrt3e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=279471">haha</a></td>
<td class="ccrt1o" align="right">2243</td>
<td class="ccrt1o" align="right">439</td>
<td class="ccrt1o" align="right">$11.06</td>
<td class="ccrt2o" align="right">95.37</td>
<td class="ccrt2o" align="right">84.07</td>
<td class="ccrt2o" align="right">59.22</td>
<td class="ccrt2o" align="right">24.33</td>
<td class="ccrt2o" align="right">2.66</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.39</td>
<td class="ccrt3o" align="right">0.30</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=276749">jonderry</a></td>
<td class="ccrt1e" align="right">2237</td>
<td class="ccrt1e" align="right">314</td>
<td class="ccrt1e" align="right">$2.08</td>
<td class="ccrt2e" align="right">99.00</td>
<td class="ccrt2e" align="right">93.90</td>
<td class="ccrt2e" align="right">72.05</td>
<td class="ccrt2e" align="right">26.74</td>
<td class="ccrt2e" align="right">1.65</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.08</td>
<td class="ccrt3e" align="right">0.06</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=287266">jms137</a></td>
<td class="ccrt1o" align="right">2237</td>
<td class="ccrt1o" align="right">449</td>
<td class="ccrt1o" align="right">$12.10</td>
<td class="ccrt2o" align="right">94.85</td>
<td class="ccrt2o" align="right">82.86</td>
<td class="ccrt2o" align="right">57.66</td>
<td class="ccrt2o" align="right">23.50</td>
<td class="ccrt2o" align="right">2.56</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.42</td>
<td class="ccrt3o" align="right">0.32</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextRed" href="/tc?module=MemberProfile&amp;cr=263396">Abednego</a></td>
<td class="ccrt1e" align="right">2209</td>
<td class="ccrt1e" align="right">578</td>
<td class="ccrt1e" align="right">$24.98</td>
<td class="ccrt2e" align="right">88.85</td>
<td class="ccrt2e" align="right">71.05</td>
<td class="ccrt2e" align="right">45.20</td>
<td class="ccrt2e" align="right">18.47</td>
<td class="ccrt2e" align="right">2.37</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.77</td>
<td class="ccrt3e" align="right">0.56</td>
<td class="ccrt3e" align="right">0.15</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.01</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=284007">Ryan</a></td>
<td class="ccrt1o" align="right">2184</td>
<td class="ccrt1o" align="right">283</td>
<td class="ccrt1o" align="right">$0.54</td>
<td class="ccrt2o" align="right">99.17</td>
<td class="ccrt2o" align="right">93.97</td>
<td class="ccrt2o" align="right">68.89</td>
<td class="ccrt2o" align="right">20.18</td>
<td class="ccrt2o" align="right">0.72</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=304031">Ruberik</a></td>
<td class="ccrt1e" align="right">2157</td>
<td class="ccrt1e" align="right">519</td>
<td class="ccrt1e" align="right">$10.52</td>
<td class="ccrt2e" align="right">89.57</td>
<td class="ccrt2e" align="right">71.53</td>
<td class="ccrt2e" align="right">43.84</td>
<td class="ccrt2e" align="right">15.76</td>
<td class="ccrt2e" align="right">1.58</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.37</td>
<td class="ccrt3e" align="right">0.28</td>
<td class="ccrt3e" align="right">0.06</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=308453">overwise</a></td>
<td class="ccrt1o" align="right">2141</td>
<td class="ccrt1o" align="right">545</td>
<td class="ccrt1o" align="right">$10.86</td>
<td class="ccrt2o" align="right">87.87</td>
<td class="ccrt2o" align="right">68.38</td>
<td class="ccrt2o" align="right">40.72</td>
<td class="ccrt2o" align="right">14.46</td>
<td class="ccrt2o" align="right">1.48</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.38</td>
<td class="ccrt3o" align="right">0.29</td>
<td class="ccrt3o" align="right">0.07</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7462740">ploh</a></td>
<td class="ccrt1e" align="right">2134</td>
<td class="ccrt1e" align="right">281</td>
<td class="ccrt1e" align="right">$0.22</td>
<td class="ccrt2e" align="right">98.73</td>
<td class="ccrt2e" align="right">91.54</td>
<td class="ccrt2e" align="right">61.69</td>
<td class="ccrt2e" align="right">14.51</td>
<td class="ccrt2e" align="right">0.36</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=158333">dvickrey</a></td>
<td class="ccrt1o" align="right">2128</td>
<td class="ccrt1o" align="right">227</td>
<td class="ccrt1o" align="right">$0.03</td>
<td class="ccrt2o" align="right">99.69</td>
<td class="ccrt2o" align="right">95.85</td>
<td class="ccrt2o" align="right">67.17</td>
<td class="ccrt2o" align="right">12.36</td>
<td class="ccrt2o" align="right">0.16</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=310333">kalinov</a></td>
<td class="ccrt1e" align="right">2123</td>
<td class="ccrt1e" align="right">332</td>
<td class="ccrt1e" align="right">$0.62</td>
<td class="ccrt2e" align="right">96.87</td>
<td class="ccrt2e" align="right">85.78</td>
<td class="ccrt2e" align="right">54.51</td>
<td class="ccrt2e" align="right">14.06</td>
<td class="ccrt2e" align="right">0.52</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7502813">monsoon</a></td>
<td class="ccrt1o" align="right">2105</td>
<td class="ccrt1o" align="right">326</td>
<td class="ccrt1o" align="right">$0.45</td>
<td class="ccrt2o" align="right">96.69</td>
<td class="ccrt2o" align="right">85.01</td>
<td class="ccrt2o" align="right">52.47</td>
<td class="ccrt2o" align="right">12.46</td>
<td class="ccrt2o" align="right">0.40</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7210680">cnettel</a></td>
<td class="ccrt1e" align="right">2097</td>
<td class="ccrt1e" align="right">317</td>
<td class="ccrt1e" align="right">$0.27</td>
<td class="ccrt2e" align="right">96.90</td>
<td class="ccrt2e" align="right">85.30</td>
<td class="ccrt2e" align="right">52.09</td>
<td class="ccrt2e" align="right">11.62</td>
<td class="ccrt2e" align="right">0.33</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7281980">eldering</a></td>
<td class="ccrt1o" align="right">2092</td>
<td class="ccrt1o" align="right">347</td>
<td class="ccrt1o" align="right">$0.54</td>
<td class="ccrt2o" align="right">95.46</td>
<td class="ccrt2o" align="right">81.68</td>
<td class="ccrt2o" align="right">48.71</td>
<td class="ccrt2o" align="right">11.62</td>
<td class="ccrt2o" align="right">0.41</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289706">mickle</a></td>
<td class="ccrt1e" align="right">2087</td>
<td class="ccrt1e" align="right">335</td>
<td class="ccrt1e" align="right">$0.41</td>
<td class="ccrt2e" align="right">95.87</td>
<td class="ccrt2e" align="right">82.51</td>
<td class="ccrt2e" align="right">48.98</td>
<td class="ccrt2e" align="right">11.11</td>
<td class="ccrt2e" align="right">0.34</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8467323">hsaniva</a></td>
<td class="ccrt1o" align="right">2080</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.86</td>
<td class="ccrt2o" align="right">93.21</td>
<td class="ccrt2o" align="right">76.66</td>
<td class="ccrt2o" align="right">44.03</td>
<td class="ccrt2o" align="right">11.00</td>
<td class="ccrt2o" align="right">0.47</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=287864">PAKETA</a></td>
<td class="ccrt1e" align="right">2069</td>
<td class="ccrt1e" align="right">415</td>
<td class="ccrt1e" align="right">$1.18</td>
<td class="ccrt2e" align="right">91.29</td>
<td class="ccrt2e" align="right">72.82</td>
<td class="ccrt2e" align="right">40.63</td>
<td class="ccrt2e" align="right">10.41</td>
<td class="ccrt2e" align="right">0.52</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.04</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8398526">Tomy</a></td>
<td class="ccrt1o" align="right">2059</td>
<td class="ccrt1o" align="right">274</td>
<td class="ccrt1o" align="right">$0.05</td>
<td class="ccrt2o" align="right">97.81</td>
<td class="ccrt2o" align="right">86.94</td>
<td class="ccrt2o" align="right">49.91</td>
<td class="ccrt2o" align="right">7.89</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7421158">Per</a></td>
<td class="ccrt1e" align="right">2059</td>
<td class="ccrt1e" align="right">506</td>
<td class="ccrt1e" align="right">$3.39</td>
<td class="ccrt2e" align="right">86.32</td>
<td class="ccrt2e" align="right">64.44</td>
<td class="ccrt2e" align="right">34.81</td>
<td class="ccrt2e" align="right">10.04</td>
<td class="ccrt2e" align="right">0.72</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=308657">skanthak</a></td>
<td class="ccrt1o" align="right">2050</td>
<td class="ccrt1o" align="right">402</td>
<td class="ccrt1o" align="right">$0.76</td>
<td class="ccrt2o" align="right">91.23</td>
<td class="ccrt2o" align="right">72.25</td>
<td class="ccrt2o" align="right">39.14</td>
<td class="ccrt2o" align="right">9.20</td>
<td class="ccrt2o" align="right">0.38</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=283388">Minsk</a></td>
<td class="ccrt1e" align="right">2040</td>
<td class="ccrt1e" align="right">464</td>
<td class="ccrt1e" align="right">$1.50</td>
<td class="ccrt2e" align="right">87.55</td>
<td class="ccrt2e" align="right">65.89</td>
<td class="ccrt2e" align="right">34.72</td>
<td class="ccrt2e" align="right">8.99</td>
<td class="ccrt2e" align="right">0.51</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=263379">StefanPochmann</a></td>
<td class="ccrt1o" align="right">2034</td>
<td class="ccrt1o" align="right">511</td>
<td class="ccrt1o" align="right">$2.50</td>
<td class="ccrt2o" align="right">84.99</td>
<td class="ccrt2o" align="right">61.87</td>
<td class="ccrt2o" align="right">32.14</td>
<td class="ccrt2o" align="right">8.80</td>
<td class="ccrt2o" align="right">0.59</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt3o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=296745">pzhao</a></td>
<td class="ccrt1e" align="right">2021</td>
<td class="ccrt1e" align="right">406</td>
<td class="ccrt1e" align="right">$0.52</td>
<td class="ccrt2e" align="right">89.79</td>
<td class="ccrt2e" align="right">68.97</td>
<td class="ccrt2e" align="right">35.32</td>
<td class="ccrt2e" align="right">7.65</td>
<td class="ccrt2e" align="right">0.28</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=307070">qsort</a></td>
<td class="ccrt1o" align="right">2009</td>
<td class="ccrt1o" align="right">460</td>
<td class="ccrt1o" align="right">$0.96</td>
<td class="ccrt2o" align="right">86.33</td>
<td class="ccrt2o" align="right">63.25</td>
<td class="ccrt2o" align="right">31.66</td>
<td class="ccrt2o" align="right">7.46</td>
<td class="ccrt2o" align="right">0.37</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt3o" align="right">0.03</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7582361">zbogi</a></td>
<td class="ccrt1e" align="right">2005</td>
<td class="ccrt1e" align="right">502</td>
<td class="ccrt1e" align="right">$1.51</td>
<td class="ccrt2e" align="right">84.06</td>
<td class="ccrt2e" align="right">59.90</td>
<td class="ccrt2e" align="right">29.80</td>
<td class="ccrt2e" align="right">7.48</td>
<td class="ccrt2e" align="right">0.44</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt3e" align="right">0.05</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=111202">ColinMacLeod</a></td>
<td class="ccrt1o" align="right">2001</td>
<td class="ccrt1o" align="right">529</td>
<td class="ccrt1o" align="right">$1.93</td>
<td class="ccrt2o" align="right">82.60</td>
<td class="ccrt2o" align="right">57.88</td>
<td class="ccrt2o" align="right">28.62</td>
<td class="ccrt2o" align="right">7.45</td>
<td class="ccrt2o" align="right">0.48</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt3o" align="right">0.06</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=309786">Yi_Zhang</a></td>
<td class="ccrt1e" align="right">1997</td>
<td class="ccrt1e" align="right">402</td>
<td class="ccrt1e" align="right">$0.25</td>
<td class="ccrt2e" align="right">88.93</td>
<td class="ccrt2e" align="right">66.86</td>
<td class="ccrt2e" align="right">32.74</td>
<td class="ccrt2e" align="right">6.45</td>
<td class="ccrt2e" align="right">0.21</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251263">chultquist</a></td>
<td class="ccrt1o" align="right">1993</td>
<td class="ccrt1o" align="right">276</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">96.12</td>
<td class="ccrt2o" align="right">80.27</td>
<td class="ccrt2o" align="right">38.47</td>
<td class="ccrt2o" align="right">4.25</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7512490">petko</a></td>
<td class="ccrt1e" align="right">1991</td>
<td class="ccrt1e" align="right">394</td>
<td class="ccrt1e" align="right">$0.21</td>
<td class="ccrt2e" align="right">89.13</td>
<td class="ccrt2e" align="right">66.97</td>
<td class="ccrt2e" align="right">32.27</td>
<td class="ccrt2e" align="right">6.09</td>
<td class="ccrt2e" align="right">0.18</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2058469">robymus</a></td>
<td class="ccrt1o" align="right">1968</td>
<td class="ccrt1o" align="right">445</td>
<td class="ccrt1o" align="right">$0.36</td>
<td class="ccrt2o" align="right">85.12</td>
<td class="ccrt2o" align="right">60.36</td>
<td class="ccrt2o" align="right">28.02</td>
<td class="ccrt2o" align="right">5.66</td>
<td class="ccrt2o" align="right">0.22</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7358573">Kavan</a></td>
<td class="ccrt1e" align="right">1964</td>
<td class="ccrt1e" align="right">333</td>
<td class="ccrt1e" align="right">$0.03</td>
<td class="ccrt2e" align="right">91.58</td>
<td class="ccrt2e" align="right">70.04</td>
<td class="ccrt2e" align="right">31.34</td>
<td class="ccrt2e" align="right">4.16</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=274018">Alexandre</a></td>
<td class="ccrt1o" align="right">1961</td>
<td class="ccrt1o" align="right">362</td>
<td class="ccrt1o" align="right">$0.06</td>
<td class="ccrt2o" align="right">89.61</td>
<td class="ccrt2o" align="right">66.65</td>
<td class="ccrt2o" align="right">29.87</td>
<td class="ccrt2o" align="right">4.48</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=269058">jasonw</a></td>
<td class="ccrt1e" align="right">1939</td>
<td class="ccrt1e" align="right">373</td>
<td class="ccrt1e" align="right">$0.06</td>
<td class="ccrt2e" align="right">87.75</td>
<td class="ccrt2e" align="right">63.04</td>
<td class="ccrt2e" align="right">26.87</td>
<td class="ccrt2e" align="right">3.84</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=309454">bugzpodder</a></td>
<td class="ccrt1o" align="right">1932</td>
<td class="ccrt1o" align="right">376</td>
<td class="ccrt1o" align="right">$0.04</td>
<td class="ccrt2o" align="right">87.19</td>
<td class="ccrt2o" align="right">61.90</td>
<td class="ccrt2o" align="right">26.00</td>
<td class="ccrt2o" align="right">3.66</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=267272">(Lx.xx)(Lx.xx)</a></td>
<td class="ccrt1e" align="right">1921</td>
<td class="ccrt1e" align="right">215</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">97.30</td>
<td class="ccrt2e" align="right">79.72</td>
<td class="ccrt2e" align="right">27.59</td>
<td class="ccrt2e" align="right">0.92</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7510875">Darkmaster</a></td>
<td class="ccrt1o" align="right">1909</td>
<td class="ccrt1o" align="right">396</td>
<td class="ccrt1o" align="right">$0.04</td>
<td class="ccrt2o" align="right">84.59</td>
<td class="ccrt2o" align="right">57.53</td>
<td class="ccrt2o" align="right">23.03</td>
<td class="ccrt2o" align="right">3.22</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=293387">abiczo</a></td>
<td class="ccrt1e" align="right">1902</td>
<td class="ccrt1e" align="right">718</td>
<td class="ccrt1e" align="right">$3.73</td>
<td class="ccrt2e" align="right">71.01</td>
<td class="ccrt2e" align="right">42.45</td>
<td class="ccrt2e" align="right">18.68</td>
<td class="ccrt2e" align="right">5.02</td>
<td class="ccrt2e" align="right">0.43</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt3e" align="right">0.10</td>
<td class="ccrt3e" align="right">0.02</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=260828">Larry</a></td>
<td class="ccrt1o" align="right">1869</td>
<td class="ccrt1o" align="right">376</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">83.29</td>
<td class="ccrt2o" align="right">54.18</td>
<td class="ccrt2o" align="right">19.26</td>
<td class="ccrt2o" align="right">2.08</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289251">ragnabot</a></td>
<td class="ccrt1e" align="right">1867</td>
<td class="ccrt1e" align="right">402</td>
<td class="ccrt1e" align="right">$0.02</td>
<td class="ccrt2e" align="right">81.61</td>
<td class="ccrt2e" align="right">52.17</td>
<td class="ccrt2e" align="right">18.94</td>
<td class="ccrt2e" align="right">2.31</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=309982">cyfra</a></td>
<td class="ccrt1o" align="right">1855</td>
<td class="ccrt1o" align="right">402</td>
<td class="ccrt1o" align="right">$0.02</td>
<td class="ccrt2o" align="right">80.84</td>
<td class="ccrt2o" align="right">50.74</td>
<td class="ccrt2o" align="right">17.83</td>
<td class="ccrt2o" align="right">2.06</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=307169">Fluff</a></td>
<td class="ccrt1e" align="right">1855</td>
<td class="ccrt1e" align="right">416</td>
<td class="ccrt1e" align="right">$0.04</td>
<td class="ccrt2e" align="right">79.99</td>
<td class="ccrt2e" align="right">49.92</td>
<td class="ccrt2e" align="right">17.78</td>
<td class="ccrt2e" align="right">2.20</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=261567">gilbert</a></td>
<td class="ccrt1o" align="right">1855</td>
<td class="ccrt1o" align="right">419</td>
<td class="ccrt1o" align="right">$0.03</td>
<td class="ccrt2o" align="right">79.80</td>
<td class="ccrt2o" align="right">49.70</td>
<td class="ccrt2o" align="right">17.72</td>
<td class="ccrt2o" align="right">2.21</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=294034">centipede80</a></td>
<td class="ccrt1e" align="right">1849</td>
<td class="ccrt1e" align="right">295</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">87.78</td>
<td class="ccrt2e" align="right">58.33</td>
<td class="ccrt2e" align="right">17.32</td>
<td class="ccrt2e" align="right">0.92</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7398480">FryGuy1013</a></td>
<td class="ccrt1o" align="right">1849</td>
<td class="ccrt1o" align="right">374</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">82.09</td>
<td class="ccrt2o" align="right">51.79</td>
<td class="ccrt2o" align="right">17.35</td>
<td class="ccrt2o" align="right">1.68</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7462279">Jwalk</a></td>
<td class="ccrt1e" align="right">1844</td>
<td class="ccrt1e" align="right">411</td>
<td class="ccrt1e" align="right">$0.02</td>
<td class="ccrt2e" align="right">79.59</td>
<td class="ccrt2e" align="right">48.94</td>
<td class="ccrt2e" align="right">16.88</td>
<td class="ccrt2e" align="right">1.95</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=273112">WhiteShadow</a></td>
<td class="ccrt1o" align="right">1840</td>
<td class="ccrt1o" align="right">416</td>
<td class="ccrt1o" align="right">$0.02</td>
<td class="ccrt2o" align="right">78.95</td>
<td class="ccrt2o" align="right">48.19</td>
<td class="ccrt2o" align="right">16.52</td>
<td class="ccrt2o" align="right">1.94</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7481323">Fleur</a></td>
<td class="ccrt1e" align="right">1833</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.01</td>
<td class="ccrt2e" align="right">80.25</td>
<td class="ccrt2e" align="right">49.09</td>
<td class="ccrt2e" align="right">15.93</td>
<td class="ccrt2e" align="right">1.53</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156491">chogyonim</a></td>
<td class="ccrt1o" align="right">1830</td>
<td class="ccrt1o" align="right">408</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">78.70</td>
<td class="ccrt2o" align="right">47.43</td>
<td class="ccrt2o" align="right">15.72</td>
<td class="ccrt2o" align="right">1.70</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251832">dark_lord</a></td>
<td class="ccrt1e" align="right">1824</td>
<td class="ccrt1e" align="right">259</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">89.08</td>
<td class="ccrt2e" align="right">57.88</td>
<td class="ccrt2e" align="right">14.00</td>
<td class="ccrt2e" align="right">0.39</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156541">SteveStern</a></td>
<td class="ccrt1o" align="right">1817</td>
<td class="ccrt1o" align="right">526</td>
<td class="ccrt1o" align="right">$0.14</td>
<td class="ccrt2o" align="right">72.39</td>
<td class="ccrt2o" align="right">41.27</td>
<td class="ccrt2o" align="right">14.72</td>
<td class="ccrt2o" align="right">2.36</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=274760">Running Wild</a></td>
<td class="ccrt1e" align="right">1814</td>
<td class="ccrt1e" align="right">280</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">86.46</td>
<td class="ccrt2e" align="right">54.20</td>
<td class="ccrt2e" align="right">13.35</td>
<td class="ccrt2e" align="right">0.47</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=346607">kalmakka</a></td>
<td class="ccrt1o" align="right">1794</td>
<td class="ccrt1o" align="right">419</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">75.46</td>
<td class="ccrt2o" align="right">42.72</td>
<td class="ccrt2o" align="right">13.02</td>
<td class="ccrt2o" align="right">1.28</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=266571">jburnim</a></td>
<td class="ccrt1e" align="right">1794</td>
<td class="ccrt1e" align="right">460</td>
<td class="ccrt1e" align="right">$0.03</td>
<td class="ccrt2e" align="right">73.50</td>
<td class="ccrt2e" align="right">41.19</td>
<td class="ccrt2e" align="right">13.21</td>
<td class="ccrt2e" align="right">1.57</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8396270">lews</a></td>
<td class="ccrt1o" align="right">1793</td>
<td class="ccrt1o" align="right">545</td>
<td class="ccrt1o" align="right">$0.16</td>
<td class="ccrt2o" align="right">70.15</td>
<td class="ccrt2o" align="right">38.61</td>
<td class="ccrt2o" align="right">13.37</td>
<td class="ccrt2o" align="right">2.11</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8461841">asjyu</a></td>
<td class="ccrt1e" align="right">1788</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">76.88</td>
<td class="ccrt2e" align="right">43.58</td>
<td class="ccrt2e" align="right">12.39</td>
<td class="ccrt2e" align="right">0.97</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7401899">Wombatfreak</a></td>
<td class="ccrt1o" align="right">1786</td>
<td class="ccrt1o" align="right">286</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">83.70</td>
<td class="ccrt2o" align="right">49.03</td>
<td class="ccrt2o" align="right">10.85</td>
<td class="ccrt2o" align="right">0.32</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8445017">fiasco</a></td>
<td class="ccrt1e" align="right">1785</td>
<td class="ccrt1e" align="right">295</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">82.81</td>
<td class="ccrt2e" align="right">48.25</td>
<td class="ccrt2e" align="right">10.95</td>
<td class="ccrt2e" align="right">0.37</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8352094">UltraMilo</a></td>
<td class="ccrt1o" align="right">1783</td>
<td class="ccrt1o" align="right">481</td>
<td class="ccrt1o" align="right">$0.03</td>
<td class="ccrt2o" align="right">71.82</td>
<td class="ccrt2o" align="right">39.43</td>
<td class="ccrt2o" align="right">12.58</td>
<td class="ccrt2o" align="right">1.56</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7368306">Matei</a></td>
<td class="ccrt1e" align="right">1771</td>
<td class="ccrt1e" align="right">423</td>
<td class="ccrt1e" align="right">$0.01</td>
<td class="ccrt2e" align="right">73.51</td>
<td class="ccrt2e" align="right">40.03</td>
<td class="ccrt2e" align="right">11.52</td>
<td class="ccrt2e" align="right">1.04</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=301937">RalphFurmaniak</a></td>
<td class="ccrt1o" align="right">1770</td>
<td class="ccrt1o" align="right">494</td>
<td class="ccrt1o" align="right">$0.04</td>
<td class="ccrt2o" align="right">70.40</td>
<td class="ccrt2o" align="right">37.79</td>
<td class="ccrt2o" align="right">11.91</td>
<td class="ccrt2o" align="right">1.49</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7269319">bsdude</a></td>
<td class="ccrt1e" align="right">1762</td>
<td class="ccrt1e" align="right">325</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">78.49</td>
<td class="ccrt2e" align="right">42.90</td>
<td class="ccrt2e" align="right">9.72</td>
<td class="ccrt2e" align="right">0.40</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7485898">Andrew_Lazarev</a></td>
<td class="ccrt1o" align="right">1762</td>
<td class="ccrt1o" align="right">671</td>
<td class="ccrt1o" align="right">$0.53</td>
<td class="ccrt2o" align="right">64.93</td>
<td class="ccrt2o" align="right">33.96</td>
<td class="ccrt2o" align="right">12.08</td>
<td class="ccrt2o" align="right">2.35</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.02</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7443050">mics</a></td>
<td class="ccrt1e" align="right">1761</td>
<td class="ccrt1e" align="right">169</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">93.35</td>
<td class="ccrt2e" align="right">54.75</td>
<td class="ccrt2e" align="right">4.45</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=284168">wackes</a></td>
<td class="ccrt1o" align="right">1759</td>
<td class="ccrt1o" align="right">254</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">84.07</td>
<td class="ccrt2o" align="right">46.69</td>
<td class="ccrt2o" align="right">7.79</td>
<td class="ccrt2o" align="right">0.11</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8360116">freestyler</a></td>
<td class="ccrt1e" align="right">1758</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">74.47</td>
<td class="ccrt2e" align="right">39.82</td>
<td class="ccrt2e" align="right">10.28</td>
<td class="ccrt2e" align="right">0.70</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7584235">agh</a></td>
<td class="ccrt1o" align="right">1750</td>
<td class="ccrt1o" align="right">332</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">76.94</td>
<td class="ccrt2o" align="right">40.89</td>
<td class="ccrt2o" align="right">9.00</td>
<td class="ccrt2o" align="right">0.37</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7467120">pigworlds</a></td>
<td class="ccrt1e" align="right">1744</td>
<td class="ccrt1e" align="right">301</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">78.59</td>
<td class="ccrt2e" align="right">41.38</td>
<td class="ccrt2e" align="right">7.95</td>
<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8365685">pparys</a></td>
<td class="ccrt1o" align="right">1744</td>
<td class="ccrt1o" align="right">633</td>
<td class="ccrt1o" align="right">$0.28</td>
<td class="ccrt2o" align="right">64.68</td>
<td class="ccrt2o" align="right">33.14</td>
<td class="ccrt2o" align="right">11.18</td>
<td class="ccrt2o" align="right">1.93</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.01</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7248795">ASab</a></td>
<td class="ccrt1e" align="right">1737</td>
<td class="ccrt1e" align="right">455</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">69.44</td>
<td class="ccrt2e" align="right">35.51</td>
<td class="ccrt2e" align="right">9.79</td>
<td class="ccrt2e" align="right">0.92</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=273025">frypan</a></td>
<td class="ccrt1o" align="right">1734</td>
<td class="ccrt1o" align="right">355</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">74.04</td>
<td class="ccrt2o" align="right">37.88</td>
<td class="ccrt2o" align="right">8.38</td>
<td class="ccrt2o" align="right">0.40</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7468628">xds</a></td>
<td class="ccrt1e" align="right">1734</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">72.34</td>
<td class="ccrt2e" align="right">36.97</td>
<td class="ccrt2e" align="right">8.83</td>
<td class="ccrt2e" align="right">0.53</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=288233">gali</a></td>
<td class="ccrt1o" align="right">1732</td>
<td class="ccrt1o" align="right">461</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">68.86</td>
<td class="ccrt2o" align="right">34.89</td>
<td class="ccrt2o" align="right">9.58</td>
<td class="ccrt2o" align="right">0.92</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=150796">paisa</a></td>
<td class="ccrt1e" align="right">1730</td>
<td class="ccrt1e" align="right">305</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">76.93</td>
<td class="ccrt2e" align="right">39.09</td>
<td class="ccrt2e" align="right">7.15</td>
<td class="ccrt2e" align="right">0.19</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7402883">Henry</a></td>
<td class="ccrt1o" align="right">1715</td>
<td class="ccrt1o" align="right">333</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">73.54</td>
<td class="ccrt2o" align="right">36.03</td>
<td class="ccrt2o" align="right">6.90</td>
<td class="ccrt2o" align="right">0.23</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8474430">kupo</a></td>
<td class="ccrt1e" align="right">1713</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">70.50</td>
<td class="ccrt2e" align="right">34.43</td>
<td class="ccrt2e" align="right">7.64</td>
<td class="ccrt2e" align="right">0.41</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=290448">BryanChen</a></td>
<td class="ccrt1o" align="right">1709</td>
<td class="ccrt1o" align="right">312</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">74.31</td>
<td class="ccrt2o" align="right">35.74</td>
<td class="ccrt2o" align="right">6.10</td>
<td class="ccrt2o" align="right">0.15</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8370707">utkarshjain</a></td>
<td class="ccrt1e" align="right">1706</td>
<td class="ccrt1e" align="right">336</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">72.49</td>
<td class="ccrt2e" align="right">34.73</td>
<td class="ccrt2e" align="right">6.47</td>
<td class="ccrt2e" align="right">0.21</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=260952">UFP2161</a></td>
<td class="ccrt1o" align="right">1704</td>
<td class="ccrt1o" align="right">388</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">69.55</td>
<td class="ccrt2o" align="right">33.34</td>
<td class="ccrt2o" align="right">7.23</td>
<td class="ccrt2o" align="right">0.38</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7360309">dmks</a></td>
<td class="ccrt1e" align="right">1702</td>
<td class="ccrt1e" align="right">329</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">72.50</td>
<td class="ccrt2e" align="right">34.34</td>
<td class="ccrt2e" align="right">6.08</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8349097">hauser</a></td>
<td class="ccrt1o" align="right">1696</td>
<td class="ccrt1o" align="right">373</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">69.57</td>
<td class="ccrt2o" align="right">32.67</td>
<td class="ccrt2o" align="right">6.60</td>
<td class="ccrt2o" align="right">0.29</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=349226">viktoras</a></td>
<td class="ccrt1e" align="right">1695</td>
<td class="ccrt1e" align="right">499</td>
<td class="ccrt1e" align="right">$0.01</td>
<td class="ccrt2e" align="right">64.76</td>
<td class="ccrt2e" align="right">30.86</td>
<td class="ccrt2e" align="right">8.19</td>
<td class="ccrt2e" align="right">0.81</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8465525">amit333a</a></td>
<td class="ccrt1o" align="right">1692</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">68.59</td>
<td class="ccrt2o" align="right">32.02</td>
<td class="ccrt2o" align="right">6.64</td>
<td class="ccrt2o" align="right">0.32</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251591">emmpee</a></td>
<td class="ccrt1e" align="right">1677</td>
<td class="ccrt1e" align="right">368</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">68.00</td>
<td class="ccrt2e" align="right">30.55</td>
<td class="ccrt2e" align="right">5.69</td>
<td class="ccrt2e" align="right">0.21</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=298761">Greyve</a></td>
<td class="ccrt1o" align="right">1674</td>
<td class="ccrt1o" align="right">377</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">67.23</td>
<td class="ccrt2o" align="right">30.07</td>
<td class="ccrt2o" align="right">5.68</td>
<td class="ccrt2o" align="right">0.24</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289435">nullspace</a></td>
<td class="ccrt1e" align="right">1674</td>
<td class="ccrt1e" align="right">653</td>
<td class="ccrt1e" align="right">$0.16</td>
<td class="ccrt2e" align="right">60.18</td>
<td class="ccrt2e" align="right">28.25</td>
<td class="ccrt2e" align="right">8.60</td>
<td class="ccrt2e" align="right">1.32</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.01</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=292056">genetic</a></td>
<td class="ccrt1o" align="right">1668</td>
<td class="ccrt1o" align="right">426</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">64.93</td>
<td class="ccrt2o" align="right">29.07</td>
<td class="ccrt2o" align="right">6.16</td>
<td class="ccrt2o" align="right">0.36</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7272306">adams</a></td>
<td class="ccrt1e" align="right">1666</td>
<td class="ccrt1e" align="right">606</td>
<td class="ccrt1e" align="right">$0.06</td>
<td class="ccrt2e" align="right">60.47</td>
<td class="ccrt2e" align="right">27.94</td>
<td class="ccrt2e" align="right">7.99</td>
<td class="ccrt2e" align="right">1.07</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=283374">indigo9</a></td>
<td class="ccrt1o" align="right">1660</td>
<td class="ccrt1o" align="right">438</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">63.81</td>
<td class="ccrt2o" align="right">28.18</td>
<td class="ccrt2o" align="right">6.03</td>
<td class="ccrt2o" align="right">0.37</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2058177">Revenger</a></td>
<td class="ccrt1e" align="right">1658</td>
<td class="ccrt1e" align="right">491</td>
<td class="ccrt1e" align="right">$0.01</td>
<td class="ccrt2e" align="right">62.23</td>
<td class="ccrt2e" align="right">27.78</td>
<td class="ccrt2e" align="right">6.59</td>
<td class="ccrt2e" align="right">0.56</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7448904">DEathkNIghtS</a></td>
<td class="ccrt1o" align="right">1655</td>
<td class="ccrt1o" align="right">322</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">67.88</td>
<td class="ccrt2o" align="right">28.17</td>
<td class="ccrt2o" align="right">3.91</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=153479">petch</a></td>
<td class="ccrt1e" align="right">1655</td>
<td class="ccrt1e" align="right">345</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">66.84</td>
<td class="ccrt2e" align="right">28.15</td>
<td class="ccrt2e" align="right">4.37</td>
<td class="ccrt2e" align="right">0.12</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7460016">X-DaDo</a></td>
<td class="ccrt1o" align="right">1653</td>
<td class="ccrt1o" align="right">326</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">67.46</td>
<td class="ccrt2o" align="right">27.92</td>
<td class="ccrt2o" align="right">3.91</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=268851">gladius</a></td>
<td class="ccrt1e" align="right">1651</td>
<td class="ccrt1e" align="right">590</td>
<td class="ccrt1e" align="right">$0.05</td>
<td class="ccrt2e" align="right">59.77</td>
<td class="ccrt2e" align="right">26.96</td>
<td class="ccrt2e" align="right">7.34</td>
<td class="ccrt2e" align="right">0.89</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8452357">cbnyc2003</a></td>
<td class="ccrt1o" align="right">1650</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">64.66</td>
<td class="ccrt2o" align="right">27.44</td>
<td class="ccrt2o" align="right">4.87</td>
<td class="ccrt2o" align="right">0.19</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=158137">olted</a></td>
<td class="ccrt1e" align="right">1642</td>
<td class="ccrt1e" align="right">319</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">66.65</td>
<td class="ccrt2e" align="right">26.54</td>
<td class="ccrt2e" align="right">3.38</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=277356">aksonov</a></td>
<td class="ccrt1o" align="right">1640</td>
<td class="ccrt1o" align="right">318</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">66.40</td>
<td class="ccrt2o" align="right">26.33</td>
<td class="ccrt2o" align="right">3.31</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=138158">leelin</a></td>
<td class="ccrt1e" align="right">1640</td>
<td class="ccrt1e" align="right">359</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">64.60</td>
<td class="ccrt2e" align="right">26.33</td>
<td class="ccrt2e" align="right">4.06</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7484086">k_m</a></td>
<td class="ccrt1o" align="right">1632</td>
<td class="ccrt1o" align="right">430</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">61.54</td>
<td class="ccrt2o" align="right">25.61</td>
<td class="ccrt2o" align="right">4.91</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=278938">binaryni</a></td>
<td class="ccrt1e" align="right">1628</td>
<td class="ccrt1e" align="right">405</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">61.92</td>
<td class="ccrt2e" align="right">25.18</td>
<td class="ccrt2e" align="right">4.40</td>
<td class="ccrt2e" align="right">0.18</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=158447">ValD</a></td>
<td class="ccrt1o" align="right">1623</td>
<td class="ccrt1o" align="right">323</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">64.23</td>
<td class="ccrt2o" align="right">24.23</td>
<td class="ccrt2o" align="right">2.90</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=159594">Koroibos</a></td>
<td class="ccrt1e" align="right">1623</td>
<td class="ccrt1e" align="right">335</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">63.73</td>
<td class="ccrt2e" align="right">24.35</td>
<td class="ccrt2e" align="right">3.12</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=303385">farsight</a></td>
<td class="ccrt1o" align="right">1623</td>
<td class="ccrt1o" align="right">348</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">63.25</td>
<td class="ccrt2o" align="right">24.43</td>
<td class="ccrt2o" align="right">3.31</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8378346">FRaiser</a></td>
<td class="ccrt1e" align="right">1618</td>
<td class="ccrt1e" align="right">359</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">62.30</td>
<td class="ccrt2e" align="right">23.96</td>
<td class="ccrt2e" align="right">3.36</td>
<td class="ccrt2e" align="right">0.08</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=303185">Cosmin.ro</a></td>
<td class="ccrt1o" align="right">1616</td>
<td class="ccrt1o" align="right">339</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">62.79</td>
<td class="ccrt2o" align="right">23.54</td>
<td class="ccrt2o" align="right">2.96</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7390467">lovro</a></td>
<td class="ccrt1e" align="right">1611</td>
<td class="ccrt1e" align="right">345</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">62.05</td>
<td class="ccrt2e" align="right">23.04</td>
<td class="ccrt2e" align="right">2.92</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7545995">majia</a></td>
<td class="ccrt1o" align="right">1609</td>
<td class="ccrt1o" align="right">398</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">60.30</td>
<td class="ccrt2o" align="right">23.30</td>
<td class="ccrt2o" align="right">3.69</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7479678">brahe</a></td>
<td class="ccrt1e" align="right">1606</td>
<td class="ccrt1e" align="right">373</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">60.61</td>
<td class="ccrt2e" align="right">22.80</td>
<td class="ccrt2e" align="right">3.23</td>
<td class="ccrt2e" align="right">0.09</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8379758">rajsekar_manok</a></td>
<td class="ccrt1o" align="right">1605</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">60.22</td>
<td class="ccrt2o" align="right">22.77</td>
<td class="ccrt2o" align="right">3.40</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=310431">sean_henderson</a></td>
<td class="ccrt1e" align="right">1603</td>
<td class="ccrt1e" align="right">388</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">59.94</td>
<td class="ccrt2e" align="right">22.60</td>
<td class="ccrt2e" align="right">3.38</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8427198">Busonerd</a></td>
<td class="ccrt1o" align="right">1602</td>
<td class="ccrt1o" align="right">352</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">60.79</td>
<td class="ccrt2o" align="right">22.15</td>
<td class="ccrt2o" align="right">2.79</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=290481">ender_wiggin</a></td>
<td class="ccrt1e" align="right">1602</td>
<td class="ccrt1e" align="right">411</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">59.29</td>
<td class="ccrt2e" align="right">22.73</td>
<td class="ccrt2e" align="right">3.70</td>
<td class="ccrt2e" align="right">0.14</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156859">ivern</a></td>
<td class="ccrt1o" align="right">1600</td>
<td class="ccrt1o" align="right">292</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">62.74</td>
<td class="ccrt2o" align="right">21.09</td>
<td class="ccrt2o" align="right">1.78</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7503639">blackbeltcoder4</a></td>
<td class="ccrt1e" align="right">1599</td>
<td class="ccrt1e" align="right">341</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">60.84</td>
<td class="ccrt2e" align="right">21.74</td>
<td class="ccrt2e" align="right">2.56</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7479769">marian</a></td>
<td class="ccrt1o" align="right">1598</td>
<td class="ccrt1o" align="right">416</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">58.84</td>
<td class="ccrt2o" align="right">22.42</td>
<td class="ccrt2o" align="right">3.64</td>
<td class="ccrt2o" align="right">0.14</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7565670">noiro</a></td>
<td class="ccrt1e" align="right">1597</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">59.41</td>
<td class="ccrt2e" align="right">22.00</td>
<td class="ccrt2e" align="right">3.18</td>
<td class="ccrt2e" align="right">0.09</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156485">Smiley=)</a></td>
<td class="ccrt1o" align="right">1596</td>
<td class="ccrt1o" align="right">303</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">61.77</td>
<td class="ccrt2o" align="right">20.85</td>
<td class="ccrt2o" align="right">1.88</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2058775">shadowless</a></td>
<td class="ccrt1e" align="right">1595</td>
<td class="ccrt1e" align="right">317</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">61.12</td>
<td class="ccrt2e" align="right">20.92</td>
<td class="ccrt2e" align="right">2.07</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=289907">Terrax</a></td>
<td class="ccrt1o" align="right">1595</td>
<td class="ccrt1o" align="right">322</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">60.95</td>
<td class="ccrt2o" align="right">21.00</td>
<td class="ccrt2o" align="right">2.15</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7271918">thooot</a></td>
<td class="ccrt1e" align="right">1593</td>
<td class="ccrt1e" align="right">339</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">60.23</td>
<td class="ccrt2e" align="right">21.05</td>
<td class="ccrt2e" align="right">2.37</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=252277">Farlox</a></td>
<td class="ccrt1o" align="right">1591</td>
<td class="ccrt1o" align="right">439</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">57.73</td>
<td class="ccrt2o" align="right">21.98</td>
<td class="ccrt2o" align="right">3.78</td>
<td class="ccrt2o" align="right">0.17</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251207">RobertNix</a></td>
<td class="ccrt1e" align="right">1588</td>
<td class="ccrt1e" align="right">398</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">58.24</td>
<td class="ccrt2e" align="right">21.34</td>
<td class="ccrt2e" align="right">3.14</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7489541">saraedum2</a></td>
<td class="ccrt1o" align="right">1587</td>
<td class="ccrt1o" align="right">250</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">62.80</td>
<td class="ccrt2o" align="right">18.38</td>
<td class="ccrt2o" align="right">0.92</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=156848">TPCoder</a></td>
<td class="ccrt1e" align="right">1581</td>
<td class="ccrt1e" align="right">309</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">59.65</td>
<td class="ccrt2e" align="right">19.24</td>
<td class="ccrt2e" align="right">1.66</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=268904">szymcio</a></td>
<td class="ccrt1o" align="right">1581</td>
<td class="ccrt1o" align="right">538</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">55.62</td>
<td class="ccrt2o" align="right">21.98</td>
<td class="ccrt2o" align="right">4.70</td>
<td class="ccrt2o" align="right">0.38</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7371063">supernova</a></td>
<td class="ccrt1e" align="right">1580</td>
<td class="ccrt1e" align="right">448</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">56.62</td>
<td class="ccrt2e" align="right">21.16</td>
<td class="ccrt2e" align="right">3.59</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7479796">acki2003</a></td>
<td class="ccrt1o" align="right">1576</td>
<td class="ccrt1o" align="right">425</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">56.61</td>
<td class="ccrt2o" align="right">20.61</td>
<td class="ccrt2o" align="right">3.21</td>
<td class="ccrt2o" align="right">0.12</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8437025">jwbober</a></td>
<td class="ccrt1e" align="right">1574</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">57.11</td>
<td class="ccrt2e" align="right">19.92</td>
<td class="ccrt2e" align="right">2.62</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=302085">userundefined</a></td>
<td class="ccrt1o" align="right">1570</td>
<td class="ccrt1o" align="right">422</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">56.03</td>
<td class="ccrt2o" align="right">20.05</td>
<td class="ccrt2o" align="right">3.03</td>
<td class="ccrt2o" align="right">0.11</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=2059300">burnpanck</a></td>
<td class="ccrt1e" align="right">1569</td>
<td class="ccrt1e" align="right">384</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">56.59</td>
<td class="ccrt2e" align="right">19.44</td>
<td class="ccrt2e" align="right">2.50</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=154090">merolish</a></td>
<td class="ccrt1o" align="right">1567</td>
<td class="ccrt1o" align="right">250</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">59.68</td>
<td class="ccrt2o" align="right">15.90</td>
<td class="ccrt2o" align="right">0.68</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7583050">juryu</a></td>
<td class="ccrt1e" align="right">1563</td>
<td class="ccrt1e" align="right">250</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">59.07</td>
<td class="ccrt2e" align="right">15.42</td>
<td class="ccrt2e" align="right">0.64</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7389864">roma</a></td>
<td class="ccrt1o" align="right">1563</td>
<td class="ccrt1o" align="right">492</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">54.63</td>
<td class="ccrt2o" align="right">20.30</td>
<td class="ccrt2o" align="right">3.72</td>
<td class="ccrt2o" align="right">0.22</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7340263">gevak</a></td>
<td class="ccrt1e" align="right">1558</td>
<td class="ccrt1e" align="right">267</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">57.79</td>
<td class="ccrt2e" align="right">15.48</td>
<td class="ccrt2e" align="right">0.77</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=269754">j_johnso</a></td>
<td class="ccrt1o" align="right">1558</td>
<td class="ccrt1o" align="right">339</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">56.18</td>
<td class="ccrt2o" align="right">17.52</td>
<td class="ccrt2o" align="right">1.65</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=159437">derelikt</a></td>
<td class="ccrt1e" align="right">1556</td>
<td class="ccrt1e" align="right">357</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">55.65</td>
<td class="ccrt2e" align="right">17.78</td>
<td class="ccrt2e" align="right">1.87</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7305703">Dumitru</a></td>
<td class="ccrt1o" align="right">1555</td>
<td class="ccrt1o" align="right">309</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">56.37</td>
<td class="ccrt2o" align="right">16.49</td>
<td class="ccrt2o" align="right">1.22</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7271765">jdowdell</a></td>
<td class="ccrt1e" align="right">1554</td>
<td class="ccrt1e" align="right">312</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">56.19</td>
<td class="ccrt2e" align="right">16.48</td>
<td class="ccrt2e" align="right">1.24</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=286112">mbarb</a></td>
<td class="ccrt1o" align="right">1553</td>
<td class="ccrt1o" align="right">273</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">56.94</td>
<td class="ccrt2o" align="right">15.16</td>
<td class="ccrt2o" align="right">0.78</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8373120">jsi</a></td>
<td class="ccrt1e" align="right">1551</td>
<td class="ccrt1e" align="right">469</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">53.85</td>
<td class="ccrt2e" align="right">19.17</td>
<td class="ccrt2e" align="right">3.18</td>
<td class="ccrt2e" align="right">0.15</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8391762">ltank</a></td>
<td class="ccrt1o" align="right">1549</td>
<td class="ccrt1o" align="right">526</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">53.32</td>
<td class="ccrt2o" align="right">19.70</td>
<td class="ccrt2o" align="right">3.80</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8439426">obokaman</a></td>
<td class="ccrt1e" align="right">1540</td>
<td class="ccrt1e" align="right">390</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">53.53</td>
<td class="ccrt2e" align="right">17.02</td>
<td class="ccrt2e" align="right">1.98</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8392826">ppp</a></td>
<td class="ccrt1o" align="right">1540</td>
<td class="ccrt1o" align="right">494</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">52.86</td>
<td class="ccrt2o" align="right">18.77</td>
<td class="ccrt2o" align="right">3.21</td>
<td class="ccrt2o" align="right">0.17</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8436330">wjaskowski</a></td>
<td class="ccrt1e" align="right">1536</td>
<td class="ccrt1e" align="right">286</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">54.26</td>
<td class="ccrt2e" align="right">13.94</td>
<td class="ccrt2e" align="right">0.73</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7401757">ShootMe</a></td>
<td class="ccrt1o" align="right">1534</td>
<td class="ccrt1o" align="right">397</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">52.86</td>
<td class="ccrt2o" align="right">16.72</td>
<td class="ccrt2o" align="right">1.96</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7584391">Krumble</a></td>
<td class="ccrt1e" align="right">1533</td>
<td class="ccrt1e" align="right">362</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">53.05</td>
<td class="ccrt2e" align="right">15.91</td>
<td class="ccrt2e" align="right">1.54</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7452777">CrazyScratcher</a></td>
<td class="ccrt1o" align="right">1526</td>
<td class="ccrt1o" align="right">447</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">51.84</td>
<td class="ccrt2o" align="right">17.08</td>
<td class="ccrt2o" align="right">2.41</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7584274">kirkifer</a></td>
<td class="ccrt1e" align="right">1525</td>
<td class="ccrt1e" align="right">415</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">51.90</td>
<td class="ccrt2e" align="right">16.40</td>
<td class="ccrt2e" align="right">2.02</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8392846">tripleCross</a></td>
<td class="ccrt1o" align="right">1523</td>
<td class="ccrt1o" align="right">352</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">51.99</td>
<td class="ccrt2o" align="right">14.76</td>
<td class="ccrt2o" align="right">1.26</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=302053">oldbig</a></td>
<td class="ccrt1e" align="right">1516</td>
<td class="ccrt1e" align="right">472</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">50.88</td>
<td class="ccrt2e" align="right">16.77</td>
<td class="ccrt2e" align="right">2.51</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=251289">EtherMage</a></td>
<td class="ccrt1o" align="right">1515</td>
<td class="ccrt1o" align="right">503</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">50.80</td>
<td class="ccrt2o" align="right">17.18</td>
<td class="ccrt2o" align="right">2.82</td>
<td class="ccrt2o" align="right">0.15</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7233906">superjoel</a></td>
<td class="ccrt1e" align="right">1513</td>
<td class="ccrt1e" align="right">257</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">51.20</td>
<td class="ccrt2e" align="right">10.61</td>
<td class="ccrt2e" align="right">0.31</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=273434">Eeyore</a></td>
<td class="ccrt1o" align="right">1511</td>
<td class="ccrt1o" align="right">419</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">50.51</td>
<td class="ccrt2o" align="right">15.42</td>
<td class="ccrt2o" align="right">1.83</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=7581406">konqueror</a></td>
<td class="ccrt1e" align="right">1508</td>
<td class="ccrt1e" align="right">286</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">50.32</td>
<td class="ccrt2e" align="right">11.39</td>
<td class="ccrt2e" align="right">0.49</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=279059">CompuSciNut</a></td>
<td class="ccrt1o" align="right">1507</td>
<td class="ccrt1o" align="right">309</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">50.21</td>
<td class="ccrt2o" align="right">12.17</td>
<td class="ccrt2o" align="right">0.67</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=8425505">snowing</a></td>
<td class="ccrt1e" align="right">1506</td>
<td class="ccrt1e" align="right">447</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">50.02</td>
<td class="ccrt2e" align="right">15.64</td>
<td class="ccrt2e" align="right">2.04</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=268951">sosonel</a></td>
<td class="ccrt1o" align="right">1505</td>
<td class="ccrt1o" align="right">194</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">49.89</td>
<td class="ccrt2o" align="right">6.62</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextYellow" href="/tc?module=MemberProfile&amp;cr=262951">db</a></td>
<td class="ccrt1e" align="right">1502</td>
<td class="ccrt1e" align="right">370</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">49.60</td>
<td class="ccrt2e" align="right">13.63</td>
<td class="ccrt2e" align="right">1.19</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=274022">jimmy</a></td>
<td class="ccrt1o" align="right">1499</td>
<td class="ccrt1o" align="right">303</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">49.15</td>
<td class="ccrt2o" align="right">11.28</td>
<td class="ccrt2o" align="right">0.55</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=263249">[UoM]Icenine</a></td>
<td class="ccrt1e" align="right">1497</td>
<td class="ccrt1e" align="right">353</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">49.03</td>
<td class="ccrt2e" align="right">12.80</td>
<td class="ccrt2e" align="right">0.97</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8359547">Jasko</a></td>
<td class="ccrt1o" align="right">1496</td>
<td class="ccrt1o" align="right">191</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">48.04</td>
<td class="ccrt2o" align="right">5.78</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=271008">ilya</a></td>
<td class="ccrt1e" align="right">1494</td>
<td class="ccrt1e" align="right">344</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">48.70</td>
<td class="ccrt2e" align="right">12.27</td>
<td class="ccrt2e" align="right">0.85</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8354170">HelioS</a></td>
<td class="ccrt1o" align="right">1489</td>
<td class="ccrt1o" align="right">352</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">48.12</td>
<td class="ccrt2o" align="right">12.15</td>
<td class="ccrt2o" align="right">0.87</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=262467">billy</a></td>
<td class="ccrt1e" align="right">1488</td>
<td class="ccrt1e" align="right">215</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">46.81</td>
<td class="ccrt2e" align="right">6.49</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8360324">GustavoBR</a></td>
<td class="ccrt1o" align="right">1481</td>
<td class="ccrt1o" align="right">378</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">47.37</td>
<td class="ccrt2o" align="right">12.33</td>
<td class="ccrt2o" align="right">1.02</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8349001">belzebub</a></td>
<td class="ccrt1e" align="right">1478</td>
<td class="ccrt1e" align="right">190</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">44.34</td>
<td class="ccrt2e" align="right">4.50</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8347440">gagik</a></td>
<td class="ccrt1o" align="right">1477</td>
<td class="ccrt1o" align="right">681</td>
<td class="ccrt1o" align="right">$0.01</td>
<td class="ccrt2o" align="right">48.37</td>
<td class="ccrt2o" align="right">17.32</td>
<td class="ccrt2o" align="right">3.77</td>
<td class="ccrt2o" align="right">0.38</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7459080">ardiankp</a></td>
<td class="ccrt1e" align="right">1476</td>
<td class="ccrt1e" align="right">412</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">47.12</td>
<td class="ccrt2e" align="right">12.89</td>
<td class="ccrt2e" align="right">1.27</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7584555">abi_k</a></td>
<td class="ccrt1o" align="right">1474</td>
<td class="ccrt1o" align="right">209</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">44.05</td>
<td class="ccrt2o" align="right">5.23</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7360291">iforiq</a></td>
<td class="ccrt1e" align="right">1473</td>
<td class="ccrt1e" align="right">319</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">45.93</td>
<td class="ccrt2e" align="right">9.92</td>
<td class="ccrt2e" align="right">0.49</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=260911">amitc</a></td>
<td class="ccrt1o" align="right">1471</td>
<td class="ccrt1o" align="right">349</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">46.00</td>
<td class="ccrt2o" align="right">10.79</td>
<td class="ccrt2o" align="right">0.70</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8418378">moveyourbody</a></td>
<td class="ccrt1e" align="right">1471</td>
<td class="ccrt1e" align="right">510</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">47.32</td>
<td class="ccrt2e" align="right">14.69</td>
<td class="ccrt2e" align="right">2.16</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7504169">youzai</a></td>
<td class="ccrt1o" align="right">1466</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">45.93</td>
<td class="ccrt2o" align="right">11.53</td>
<td class="ccrt2o" align="right">0.94</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=345006">DAle</a></td>
<td class="ccrt1e" align="right">1461</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">45.41</td>
<td class="ccrt2e" align="right">11.25</td>
<td class="ccrt2e" align="right">0.89</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7479088">dario</a></td>
<td class="ccrt1o" align="right">1459</td>
<td class="ccrt1o" align="right">269</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">43.20</td>
<td class="ccrt2o" align="right">7.08</td>
<td class="ccrt2o" align="right">0.16</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8356199">charleston</a></td>
<td class="ccrt1e" align="right">1458</td>
<td class="ccrt1e" align="right">219</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">41.43</td>
<td class="ccrt2e" align="right">4.76</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=343613">phark4evr</a></td>
<td class="ccrt1o" align="right">1454</td>
<td class="ccrt1o" align="right">397</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">44.81</td>
<td class="ccrt2o" align="right">11.15</td>
<td class="ccrt2o" align="right">0.92</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8436401">Katya_Lazareva</a></td>
<td class="ccrt1e" align="right">1452</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">44.51</td>
<td class="ccrt2e" align="right">10.68</td>
<td class="ccrt2e" align="right">0.81</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7360300">collin</a></td>
<td class="ccrt1o" align="right">1451</td>
<td class="ccrt1o" align="right">405</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">44.67</td>
<td class="ccrt2o" align="right">11.15</td>
<td class="ccrt2o" align="right">0.95</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=309641">Dr. Gluk</a></td>
<td class="ccrt1e" align="right">1451</td>
<td class="ccrt1e" align="right">439</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">45.07</td>
<td class="ccrt2e" align="right">12.06</td>
<td class="ccrt2e" align="right">1.23</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8465929">caancel</a></td>
<td class="ccrt1o" align="right">1447</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">43.94</td>
<td class="ccrt2o" align="right">10.38</td>
<td class="ccrt2o" align="right">0.77</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=150257">qiui</a></td>
<td class="ccrt1e" align="right">1445</td>
<td class="ccrt1e" align="right">294</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">41.83</td>
<td class="ccrt2e" align="right">7.23</td>
<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7364110">kats</a></td>
<td class="ccrt1o" align="right">1444</td>
<td class="ccrt1o" align="right">443</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">44.47</td>
<td class="ccrt2o" align="right">11.72</td>
<td class="ccrt2o" align="right">1.20</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=159400">xzhangz</a></td>
<td class="ccrt1e" align="right">1436</td>
<td class="ccrt1e" align="right">312</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">41.19</td>
<td class="ccrt2e" align="right">7.37</td>
<td class="ccrt2e" align="right">0.26</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7447384">port6000</a></td>
<td class="ccrt1o" align="right">1435</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">42.70</td>
<td class="ccrt2o" align="right">9.71</td>
<td class="ccrt2o" align="right">0.67</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8357063">thegreensniper</a></td>
<td class="ccrt1e" align="right">1432</td>
<td class="ccrt1e" align="right">473</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">43.81</td>
<td class="ccrt2e" align="right">11.76</td>
<td class="ccrt2e" align="right">1.32</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7505033">Mossop</a></td>
<td class="ccrt1o" align="right">1431</td>
<td class="ccrt1o" align="right">275</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">39.33</td>
<td class="ccrt2o" align="right">5.71</td>
<td class="ccrt2o" align="right">0.12</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7545675">cucu</a></td>
<td class="ccrt1e" align="right">1428</td>
<td class="ccrt1e" align="right">333</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">40.82</td>
<td class="ccrt2e" align="right">7.67</td>
<td class="ccrt2e" align="right">0.33</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=260406">konsept</a></td>
<td class="ccrt1o" align="right">1427</td>
<td class="ccrt1o" align="right">440</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">42.91</td>
<td class="ccrt2o" align="right">10.73</td>
<td class="ccrt2o" align="right">1.01</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8348950">nerx</a></td>
<td class="ccrt1e" align="right">1425</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">41.70</td>
<td class="ccrt2e" align="right">9.12</td>
<td class="ccrt2e" align="right">0.60</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8438496">vfortuna</a></td>
<td class="ccrt1o" align="right">1424</td>
<td class="ccrt1o" align="right">331</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">40.27</td>
<td class="ccrt2o" align="right">7.38</td>
<td class="ccrt2o" align="right">0.31</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7583175">Windrider</a></td>
<td class="ccrt1e" align="right">1424</td>
<td class="ccrt1e" align="right">362</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">41.07</td>
<td class="ccrt2e" align="right">8.38</td>
<td class="ccrt2e" align="right">0.46</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7369089">SleepyOverlord</a></td>
<td class="ccrt1o" align="right">1421</td>
<td class="ccrt1o" align="right">445</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">42.50</td>
<td class="ccrt2o" align="right">10.54</td>
<td class="ccrt2o" align="right">1.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=309432">jogler</a></td>
<td class="ccrt1e" align="right">1420</td>
<td class="ccrt1e" align="right">302</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">38.83</td>
<td class="ccrt2e" align="right">6.14</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7473757">armadillo</a></td>
<td class="ccrt1o" align="right">1419</td>
<td class="ccrt1o" align="right">313</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">39.13</td>
<td class="ccrt2o" align="right">6.50</td>
<td class="ccrt2o" align="right">0.21</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=347098">wisdompoet</a></td>
<td class="ccrt1e" align="right">1415</td>
<td class="ccrt1e" align="right">331</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">39.24</td>
<td class="ccrt2e" align="right">6.90</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=265410">Phantom</a></td>
<td class="ccrt1o" align="right">1414</td>
<td class="ccrt1o" align="right">236</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.90</td>
<td class="ccrt2o" align="right">3.36</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7402446">Mikhos</a></td>
<td class="ccrt1e" align="right">1413</td>
<td class="ccrt1e" align="right">378</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">40.32</td>
<td class="ccrt2e" align="right">8.30</td>
<td class="ccrt2e" align="right">0.49</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=152610">puzzlehacker</a></td>
<td class="ccrt1o" align="right">1412</td>
<td class="ccrt1o" align="right">274</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">36.65</td>
<td class="ccrt2o" align="right">4.73</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7445264">Mariyka</a></td>
<td class="ccrt1e" align="right">1412</td>
<td class="ccrt1e" align="right">295</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">37.56</td>
<td class="ccrt2e" align="right">5.51</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7584238">bl</a></td>
<td class="ccrt1o" align="right">1411</td>
<td class="ccrt1o" align="right">424</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">41.18</td>
<td class="ccrt2o" align="right">9.51</td>
<td class="ccrt2o" align="right">0.76</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=302840">fbird</a></td>
<td class="ccrt1e" align="right">1408</td>
<td class="ccrt1e" align="right">241</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">34.27</td>
<td class="ccrt2e" align="right">3.32</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=154619">hilfiger</a></td>
<td class="ccrt1o" align="right">1408</td>
<td class="ccrt1o" align="right">541</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">42.89</td>
<td class="ccrt2o" align="right">12.01</td>
<td class="ccrt2o" align="right">1.60</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=278167">Merlin[Kyiv]</a></td>
<td class="ccrt1e" align="right">1404</td>
<td class="ccrt1e" align="right">314</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">37.32</td>
<td class="ccrt2e" align="right">5.80</td>
<td class="ccrt2e" align="right">0.16</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7448120">torbich</a></td>
<td class="ccrt1o" align="right">1402</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">39.40</td>
<td class="ccrt2o" align="right">7.96</td>
<td class="ccrt2o" align="right">0.47</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=349303">OpenGL4Dummies</a></td>
<td class="ccrt1e" align="right">1396</td>
<td class="ccrt1e" align="right">300</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">35.74</td>
<td class="ccrt2e" align="right">4.96</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=301210">tgu</a></td>
<td class="ccrt1o" align="right">1395</td>
<td class="ccrt1o" align="right">256</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">33.32</td>
<td class="ccrt2o" align="right">3.37</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7442498">marek.cygan</a></td>
<td class="ccrt1e" align="right">1394</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">38.64</td>
<td class="ccrt2e" align="right">7.58</td>
<td class="ccrt2e" align="right">0.43</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8403269">eeee</a></td>
<td class="ccrt1o" align="right">1391</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">38.32</td>
<td class="ccrt2o" align="right">7.43</td>
<td class="ccrt2o" align="right">0.42</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=108438">Cougar</a></td>
<td class="ccrt1e" align="right">1389</td>
<td class="ccrt1e" align="right">329</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">36.20</td>
<td class="ccrt2e" align="right">5.62</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=159758">entity</a></td>
<td class="ccrt1o" align="right">1384</td>
<td class="ccrt1o" align="right">322</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">35.30</td>
<td class="ccrt2o" align="right">5.17</td>
<td class="ccrt2o" align="right">0.14</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=267284">Calrathan</a></td>
<td class="ccrt1e" align="right">1384</td>
<td class="ccrt1e" align="right">386</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">37.63</td>
<td class="ccrt2e" align="right">7.13</td>
<td class="ccrt2e" align="right">0.39</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=278402">nacul</a></td>
<td class="ccrt1o" align="right">1383</td>
<td class="ccrt1o" align="right">301</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.26</td>
<td class="ccrt2o" align="right">4.46</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=157174">preetham</a></td>
<td class="ccrt1e" align="right">1382</td>
<td class="ccrt1e" align="right">287</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">33.38</td>
<td class="ccrt2e" align="right">3.95</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=276230">dimkadimon</a></td>
<td class="ccrt1o" align="right">1380</td>
<td class="ccrt1o" align="right">306</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.07</td>
<td class="ccrt2o" align="right">4.46</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7499769">stranger</a></td>
<td class="ccrt1e" align="right">1379</td>
<td class="ccrt1e" align="right">396</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">37.47</td>
<td class="ccrt2e" align="right">7.21</td>
<td class="ccrt2e" align="right">0.42</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=309087">sanjay31</a></td>
<td class="ccrt1o" align="right">1376</td>
<td class="ccrt1o" align="right">454</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">38.82</td>
<td class="ccrt2o" align="right">8.61</td>
<td class="ccrt2o" align="right">0.72</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7291694">MadProgrammer</a></td>
<td class="ccrt1e" align="right">1375</td>
<td class="ccrt1e" align="right">361</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">35.85</td>
<td class="ccrt2e" align="right">6.00</td>
<td class="ccrt2e" align="right">0.25</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7401112">frode</a></td>
<td class="ccrt1o" align="right">1369</td>
<td class="ccrt1o" align="right">320</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">33.45</td>
<td class="ccrt2o" align="right">4.51</td>
<td class="ccrt2o" align="right">0.11</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7268916">bsauerwine</a></td>
<td class="ccrt1e" align="right">1369</td>
<td class="ccrt1e" align="right">347</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">34.69</td>
<td class="ccrt2e" align="right">5.36</td>
<td class="ccrt2e" align="right">0.18</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7356427">titid_gede</a></td>
<td class="ccrt1o" align="right">1366</td>
<td class="ccrt1o" align="right">394</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">36.18</td>
<td class="ccrt2o" align="right">6.61</td>
<td class="ccrt2o" align="right">0.35</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8475204">distill</a></td>
<td class="ccrt1e" align="right">1364</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">35.67</td>
<td class="ccrt2e" align="right">6.24</td>
<td class="ccrt2e" align="right">0.30</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7360318">Xuchen</a></td>
<td class="ccrt1o" align="right">1361</td>
<td class="ccrt1o" align="right">317</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">32.40</td>
<td class="ccrt2o" align="right">4.12</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=296466">FatClimber</a></td>
<td class="ccrt1e" align="right">1361</td>
<td class="ccrt1e" align="right">576</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">40.09</td>
<td class="ccrt2e" align="right">10.62</td>
<td class="ccrt2e" align="right">1.39</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=275558">zhliu</a></td>
<td class="ccrt1o" align="right">1359</td>
<td class="ccrt1o" align="right">627</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">40.73</td>
<td class="ccrt2o" align="right">11.41</td>
<td class="ccrt2o" align="right">1.72</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8358583">dispanser</a></td>
<td class="ccrt1e" align="right">1358</td>
<td class="ccrt1e" align="right">256</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">28.23</td>
<td class="ccrt2e" align="right">2.20</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=288788">Wronkyn</a></td>
<td class="ccrt1o" align="right">1354</td>
<td class="ccrt1o" align="right">458</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">37.06</td>
<td class="ccrt2o" align="right">7.78</td>
<td class="ccrt2o" align="right">0.61</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8459981">adrastea</a></td>
<td class="ccrt1e" align="right">1353</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">34.60</td>
<td class="ccrt2e" align="right">5.81</td>
<td class="ccrt2e" align="right">0.27</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8465444">radamjee</a></td>
<td class="ccrt1o" align="right">1353</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.58</td>
<td class="ccrt2o" align="right">5.81</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=292136">Icedawn</a></td>
<td class="ccrt1e" align="right">1350</td>
<td class="ccrt1e" align="right">374</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">33.88</td>
<td class="ccrt2e" align="right">5.39</td>
<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8475177">JGoldstein</a></td>
<td class="ccrt1o" align="right">1349</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.20</td>
<td class="ccrt2o" align="right">5.67</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=261043">fpmc</a></td>
<td class="ccrt1e" align="right">1347</td>
<td class="ccrt1e" align="right">387</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">34.06</td>
<td class="ccrt2e" align="right">5.64</td>
<td class="ccrt2e" align="right">0.26</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7408528">jnwood</a></td>
<td class="ccrt1o" align="right">1347</td>
<td class="ccrt1o" align="right">399</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.55</td>
<td class="ccrt2o" align="right">5.97</td>
<td class="ccrt2o" align="right">0.31</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8384042">tracert</a></td>
<td class="ccrt1e" align="right">1342</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">33.57</td>
<td class="ccrt2e" align="right">5.42</td>
<td class="ccrt2e" align="right">0.24</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=300003">nike</a></td>
<td class="ccrt1o" align="right">1341</td>
<td class="ccrt1o" align="right">300</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">29.14</td>
<td class="ccrt2o" align="right">2.97</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=297782">HappyMutant</a></td>
<td class="ccrt1e" align="right">1341</td>
<td class="ccrt1e" align="right">351</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">32.00</td>
<td class="ccrt2e" align="right">4.45</td>
<td class="ccrt2e" align="right">0.14</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=262957">matrix0040</a></td>
<td class="ccrt1o" align="right">1340</td>
<td class="ccrt1o" align="right">264</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">26.51</td>
<td class="ccrt2o" align="right">1.98</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=266319">androm</a></td>
<td class="ccrt1e" align="right">1337</td>
<td class="ccrt1e" align="right">386</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">33.13</td>
<td class="ccrt2e" align="right">5.25</td>
<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8451367">Kovenko</a></td>
<td class="ccrt1o" align="right">1333</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">32.69</td>
<td class="ccrt2o" align="right">5.08</td>
<td class="ccrt2o" align="right">0.21</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7427564">tdietzel</a></td>
<td class="ccrt1e" align="right">1331</td>
<td class="ccrt1e" align="right">266</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">25.62</td>
<td class="ccrt2e" align="right">1.83</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8347746">eissimuf</a></td>
<td class="ccrt1o" align="right">1331</td>
<td class="ccrt1o" align="right">280</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">26.68</td>
<td class="ccrt2o" align="right">2.18</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7380147">BeCool</a></td>
<td class="ccrt1e" align="right">1329</td>
<td class="ccrt1e" align="right">324</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">29.32</td>
<td class="ccrt2e" align="right">3.31</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8461724">42</a></td>
<td class="ccrt1o" align="right">1329</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">32.34</td>
<td class="ccrt2o" align="right">4.97</td>
<td class="ccrt2o" align="right">0.20</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8460252">tomek2</a></td>
<td class="ccrt1e" align="right">1328</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">32.20</td>
<td class="ccrt2e" align="right">4.90</td>
<td class="ccrt2e" align="right">0.20</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=284243">itsouk</a></td>
<td class="ccrt1o" align="right">1328</td>
<td class="ccrt1o" align="right">459</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">34.95</td>
<td class="ccrt2o" align="right">6.81</td>
<td class="ccrt2o" align="right">0.48</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7311082">NSantos</a></td>
<td class="ccrt1e" align="right">1326</td>
<td class="ccrt1e" align="right">321</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">28.78</td>
<td class="ccrt2e" align="right">3.12</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8373059">toyvo</a></td>
<td class="ccrt1o" align="right">1324</td>
<td class="ccrt1o" align="right">254</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">23.77</td>
<td class="ccrt2o" align="right">1.41</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7296831">Nexius</a></td>
<td class="ccrt1e" align="right">1323</td>
<td class="ccrt1e" align="right">289</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">26.38</td>
<td class="ccrt2e" align="right">2.22</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=295264">ffluv</a></td>
<td class="ccrt1o" align="right">1320</td>
<td class="ccrt1o" align="right">442</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">33.69</td>
<td class="ccrt2o" align="right">6.06</td>
<td class="ccrt2o" align="right">0.37</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=275118">PolariStar</a></td>
<td class="ccrt1e" align="right">1319</td>
<td class="ccrt1e" align="right">292</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">26.12</td>
<td class="ccrt2e" align="right">2.20</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=280135">tbone343</a></td>
<td class="ccrt1o" align="right">1318</td>
<td class="ccrt1o" align="right">369</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">30.56</td>
<td class="ccrt2o" align="right">4.15</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7400531">mafattah</a></td>
<td class="ccrt1e" align="right">1318</td>
<td class="ccrt1e" align="right">494</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">35.20</td>
<td class="ccrt2e" align="right">7.26</td>
<td class="ccrt2e" align="right">0.59</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=251654">bamse</a></td>
<td class="ccrt1o" align="right">1316</td>
<td class="ccrt1o" align="right">341</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">28.91</td>
<td class="ccrt2o" align="right">3.37</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7452866">Im2Good</a></td>
<td class="ccrt1e" align="right">1316</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">31.10</td>
<td class="ccrt2e" align="right">4.51</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7568791">bramandia</a></td>
<td class="ccrt1o" align="right">1315</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">31.01</td>
<td class="ccrt2o" align="right">4.48</td>
<td class="ccrt2o" align="right">0.17</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=299221">harisuthan</a></td>
<td class="ccrt1e" align="right">1313</td>
<td class="ccrt1e" align="right">227</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">19.83</td>
<td class="ccrt2e" align="right">0.74</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8398450">tsycho</a></td>
<td class="ccrt1o" align="right">1308</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">30.38</td>
<td class="ccrt2o" align="right">4.25</td>
<td class="ccrt2o" align="right">0.15</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7240885">psangeljg</a></td>
<td class="ccrt1e" align="right">1302</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">29.85</td>
<td class="ccrt2e" align="right">4.10</td>
<td class="ccrt2e" align="right">0.14</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8434210">hirai</a></td>
<td class="ccrt1o" align="right">1301</td>
<td class="ccrt1o" align="right">390</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">29.97</td>
<td class="ccrt2o" align="right">4.20</td>
<td class="ccrt2o" align="right">0.15</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7483910">merlin422</a></td>
<td class="ccrt1e" align="right">1299</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">29.57</td>
<td class="ccrt2e" align="right">4.00</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=287130">NeverMore</a></td>
<td class="ccrt1o" align="right">1293</td>
<td class="ccrt1o" align="right">296</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">23.64</td>
<td class="ccrt2o" align="right">1.74</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=281156">raquib</a></td>
<td class="ccrt1e" align="right">1293</td>
<td class="ccrt1e" align="right">482</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">32.93</td>
<td class="ccrt2e" align="right">6.11</td>
<td class="ccrt2e" align="right">0.43</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8359768">galvarr</a></td>
<td class="ccrt1o" align="right">1291</td>
<td class="ccrt1o" align="right">574</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">35.41</td>
<td class="ccrt2o" align="right">7.98</td>
<td class="ccrt2o" align="right">0.86</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=261233">CaseWorker</a></td>
<td class="ccrt1e" align="right">1288</td>
<td class="ccrt1e" align="right">213</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.40</td>
<td class="ccrt2e" align="right">0.34</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=293574">wrob</a></td>
<td class="ccrt1o" align="right">1287</td>
<td class="ccrt1o" align="right">349</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">26.55</td>
<td class="ccrt2o" align="right">2.80</td>
<td class="ccrt2o" align="right">0.06</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8459166">gentryx</a></td>
<td class="ccrt1e" align="right">1284</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">28.25</td>
<td class="ccrt2e" align="right">3.61</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=265193">ll0377</a></td>
<td class="ccrt1o" align="right">1283</td>
<td class="ccrt1o" align="right">243</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">18.06</td>
<td class="ccrt2o" align="right">0.66</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7575689">rr</a></td>
<td class="ccrt1e" align="right">1280</td>
<td class="ccrt1e" align="right">327</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">24.54</td>
<td class="ccrt2e" align="right">2.16</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8456014">mwojcik</a></td>
<td class="ccrt1o" align="right">1280</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">27.90</td>
<td class="ccrt2o" align="right">3.48</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8440049">bolu</a></td>
<td class="ccrt1e" align="right">1280</td>
<td class="ccrt1e" align="right">423</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">29.72</td>
<td class="ccrt2e" align="right">4.40</td>
<td class="ccrt2e" align="right">0.19</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8395447">Ragnarok</a></td>
<td class="ccrt1o" align="right">1280</td>
<td class="ccrt1o" align="right">451</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">30.84</td>
<td class="ccrt2o" align="right">5.02</td>
<td class="ccrt2o" align="right">0.27</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=155786">jdepree</a></td>
<td class="ccrt1e" align="right">1279</td>
<td class="ccrt1e" align="right">210</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">14.11</td>
<td class="ccrt2e" align="right">0.26</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=271028">emtrane</a></td>
<td class="ccrt1o" align="right">1277</td>
<td class="ccrt1o" align="right">283</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">21.00</td>
<td class="ccrt2o" align="right">1.23</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=273416">xxfobxx</a></td>
<td class="ccrt1e" align="right">1276</td>
<td class="ccrt1e" align="right">248</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">17.72</td>
<td class="ccrt2e" align="right">0.65</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=268529">Ozymandias</a></td>
<td class="ccrt1o" align="right">1274</td>
<td class="ccrt1o" align="right">349</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">25.28</td>
<td class="ccrt2o" align="right">2.51</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=289824">MPhk</a></td>
<td class="ccrt1e" align="right">1266</td>
<td class="ccrt1e" align="right">300</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">21.25</td>
<td class="ccrt2e" align="right">1.38</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=344698">peru</a></td>
<td class="ccrt1o" align="right">1265</td>
<td class="ccrt1o" align="right">316</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">22.32</td>
<td class="ccrt2o" align="right">1.66</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7401738">sbh4duke</a></td>
<td class="ccrt1e" align="right">1264</td>
<td class="ccrt1e" align="right">199</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">11.32</td>
<td class="ccrt2e" align="right">0.13</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=273461">JWizard</a></td>
<td class="ccrt1o" align="right">1262</td>
<td class="ccrt1o" align="right">379</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">25.99</td>
<td class="ccrt2o" align="right">2.91</td>
<td class="ccrt2o" align="right">0.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7421858">T.Friedrich</a></td>
<td class="ccrt1e" align="right">1262</td>
<td class="ccrt1e" align="right">400</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">27.13</td>
<td class="ccrt2e" align="right">3.36</td>
<td class="ccrt2e" align="right">0.11</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7498947">SailorFrag</a></td>
<td class="ccrt1o" align="right">1261</td>
<td class="ccrt1o" align="right">193</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.37</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8360460">Gronkowiec</a></td>
<td class="ccrt1e" align="right">1259</td>
<td class="ccrt1e" align="right">304</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">20.91</td>
<td class="ccrt2e" align="right">1.34</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7465390">Dan[Popovici]</a></td>
<td class="ccrt1o" align="right">1255</td>
<td class="ccrt1o" align="right">328</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">22.26</td>
<td class="ccrt2o" align="right">1.72</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=294675">asif_coder</a></td>
<td class="ccrt1e" align="right">1255</td>
<td class="ccrt1e" align="right">373</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">25.08</td>
<td class="ccrt2e" align="right">2.64</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=345773">hast</a></td>
<td class="ccrt1o" align="right">1248</td>
<td class="ccrt1o" align="right">226</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">12.78</td>
<td class="ccrt2o" align="right">0.24</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=297658">sohdjinn</a></td>
<td class="ccrt1e" align="right">1246</td>
<td class="ccrt1e" align="right">256</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.55</td>
<td class="ccrt2e" align="right">0.50</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=2057853">moh_taha_eg</a></td>
<td class="ccrt1o" align="right">1244</td>
<td class="ccrt1o" align="right">350</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">22.71</td>
<td class="ccrt2o" align="right">1.96</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=159530">Spike</a></td>
<td class="ccrt1e" align="right">1241</td>
<td class="ccrt1e" align="right">523</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">30.67</td>
<td class="ccrt2e" align="right">5.46</td>
<td class="ccrt2e" align="right">0.40</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=251089">GotMilk</a></td>
<td class="ccrt1o" align="right">1238</td>
<td class="ccrt1o" align="right">200</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">9.12</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7557537">president</a></td>
<td class="ccrt1e" align="right">1230</td>
<td class="ccrt1e" align="right">315</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">19.08</td>
<td class="ccrt2e" align="right">1.13</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8416352">quadmaniac</a></td>
<td class="ccrt1o" align="right">1229</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">23.63</td>
<td class="ccrt2o" align="right">2.36</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8356186">robert1900</a></td>
<td class="ccrt1e" align="right">1225</td>
<td class="ccrt1e" align="right">451</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">26.70</td>
<td class="ccrt2e" align="right">3.60</td>
<td class="ccrt2e" align="right">0.15</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7477775">sharprose</a></td>
<td class="ccrt1o" align="right">1216</td>
<td class="ccrt1o" align="right">280</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">15.09</td>
<td class="ccrt2o" align="right">0.55</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=156822">m_chen</a></td>
<td class="ccrt1e" align="right">1215</td>
<td class="ccrt1e" align="right">280</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">14.95</td>
<td class="ccrt2e" align="right">0.54</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=306712">albin</a></td>
<td class="ccrt1o" align="right">1213</td>
<td class="ccrt1o" align="right">236</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.82</td>
<td class="ccrt2o" align="right">0.17</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=277914">david</a></td>
<td class="ccrt1e" align="right">1210</td>
<td class="ccrt1e" align="right">437</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">24.91</td>
<td class="ccrt2e" align="right">2.99</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=299798">SilverPhantom</a></td>
<td class="ccrt1o" align="right">1208</td>
<td class="ccrt1o" align="right">238</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.60</td>
<td class="ccrt2o" align="right">0.17</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=8436759">mrstone</a></td>
<td class="ccrt1e" align="right">1208</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">21.99</td>
<td class="ccrt2e" align="right">1.99</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=260913">jaivasanth</a></td>
<td class="ccrt1o" align="right">1206</td>
<td class="ccrt1o" align="right">348</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">19.49</td>
<td class="ccrt2o" align="right">1.34</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextBlue" href="/tc?module=MemberProfile&amp;cr=7562873">Krona</a></td>
<td class="ccrt1e" align="right">1201</td>
<td class="ccrt1e" align="right">193</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">5.82</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=263636">dandarc</a></td>
<td class="ccrt1o" align="right">1197</td>
<td class="ccrt1o" align="right">364</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">19.81</td>
<td class="ccrt2o" align="right">1.47</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7296000">connect4</a></td>
<td class="ccrt1e" align="right">1195</td>
<td class="ccrt1e" align="right">484</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">26.05</td>
<td class="ccrt2e" align="right">3.57</td>
<td class="ccrt2e" align="right">0.17</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8354434">Artur</a></td>
<td class="ccrt1o" align="right">1194</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">20.95</td>
<td class="ccrt2o" align="right">1.79</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=348892">payam</a></td>
<td class="ccrt1e" align="right">1189</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">20.52</td>
<td class="ccrt2e" align="right">1.70</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=344711">[UoM]Supaphly</a></td>
<td class="ccrt1o" align="right">1188</td>
<td class="ccrt1o" align="right">206</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">6.24</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7453403">Tantalus</a></td>
<td class="ccrt1e" align="right">1188</td>
<td class="ccrt1e" align="right">473</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">25.07</td>
<td class="ccrt2e" align="right">3.23</td>
<td class="ccrt2e" align="right">0.14</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8465926">dkbrad</a></td>
<td class="ccrt1o" align="right">1180</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">19.89</td>
<td class="ccrt2o" align="right">1.58</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=262271">Mosher</a></td>
<td class="ccrt1e" align="right">1179</td>
<td class="ccrt1e" align="right">306</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">14.26</td>
<td class="ccrt2e" align="right">0.54</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7545813">cozy</a></td>
<td class="ccrt1o" align="right">1177</td>
<td class="ccrt1o" align="right">258</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.17</td>
<td class="ccrt2o" align="right">0.18</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8368280">mido1236</a></td>
<td class="ccrt1e" align="right">1174</td>
<td class="ccrt1e" align="right">246</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">8.94</td>
<td class="ccrt2e" align="right">0.12</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=266685">flozell</a></td>
<td class="ccrt1o" align="right">1174</td>
<td class="ccrt1o" align="right">274</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">11.38</td>
<td class="ccrt2o" align="right">0.26</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8473055">tsvayer</a></td>
<td class="ccrt1e" align="right">1171</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">19.23</td>
<td class="ccrt2e" align="right">1.47</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7356052">risingdragon</a></td>
<td class="ccrt1o" align="right">1166</td>
<td class="ccrt1o" align="right">241</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">7.97</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8363524">Marto</a></td>
<td class="ccrt1e" align="right">1166</td>
<td class="ccrt1e" align="right">426</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">21.29</td>
<td class="ccrt2e" align="right">2.03</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=346098">cyGNUs</a></td>
<td class="ccrt1o" align="right">1165</td>
<td class="ccrt1o" align="right">244</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">8.19</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=158290">saagar734</a></td>
<td class="ccrt1e" align="right">1165</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">18.79</td>
<td class="ccrt2e" align="right">1.38</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=260056">generator</a></td>
<td class="ccrt1o" align="right">1162</td>
<td class="ccrt1o" align="right">274</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.50</td>
<td class="ccrt2o" align="right">0.23</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7361542">ash-ray</a></td>
<td class="ccrt1e" align="right">1162</td>
<td class="ccrt1e" align="right">333</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.11</td>
<td class="ccrt2e" align="right">0.71</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7566158">nikal</a></td>
<td class="ccrt1o" align="right">1161</td>
<td class="ccrt1o" align="right">492</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">24.20</td>
<td class="ccrt2o" align="right">3.07</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8409692">howler</a></td>
<td class="ccrt1e" align="right">1159</td>
<td class="ccrt1e" align="right">342</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.53</td>
<td class="ccrt2e" align="right">0.77</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=263759">mkolker</a></td>
<td class="ccrt1o" align="right">1158</td>
<td class="ccrt1o" align="right">214</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">5.26</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8352902">microkong</a></td>
<td class="ccrt1e" align="right">1157</td>
<td class="ccrt1e" align="right">553</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">26.36</td>
<td class="ccrt2e" align="right">4.01</td>
<td class="ccrt2e" align="right">0.25</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=261407">LordHamlet</a></td>
<td class="ccrt1o" align="right">1156</td>
<td class="ccrt1o" align="right">416</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">20.02</td>
<td class="ccrt2o" align="right">1.74</td>
<td class="ccrt2o" align="right">0.04</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8436036">JaRail</a></td>
<td class="ccrt1e" align="right">1155</td>
<td class="ccrt1e" align="right">316</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">13.39</td>
<td class="ccrt2e" align="right">0.49</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=128928">Sulu</a></td>
<td class="ccrt1o" align="right">1152</td>
<td class="ccrt1o" align="right">253</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">8.16</td>
<td class="ccrt2o" align="right">0.10</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8471824">AsmoDeus</a></td>
<td class="ccrt1e" align="right">1152</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">17.93</td>
<td class="ccrt2e" align="right">1.23</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7502215">radog</a></td>
<td class="ccrt1o" align="right">1150</td>
<td class="ccrt1o" align="right">439</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">20.89</td>
<td class="ccrt2o" align="right">2.00</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=344559">portnoy</a></td>
<td class="ccrt1e" align="right">1149</td>
<td class="ccrt1e" align="right">449</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">21.34</td>
<td class="ccrt2e" align="right">2.14</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=262946">iamignorant</a></td>
<td class="ccrt1o" align="right">1145</td>
<td class="ccrt1o" align="right">300</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">11.50</td>
<td class="ccrt2o" align="right">0.32</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8459984">captgilmore</a></td>
<td class="ccrt1e" align="right">1144</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">17.37</td>
<td class="ccrt2e" align="right">1.15</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7211203">mwaisdn</a></td>
<td class="ccrt1o" align="right">1141</td>
<td class="ccrt1o" align="right">354</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">15.17</td>
<td class="ccrt2o" align="right">0.77</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7463987">ShindouHikaru</a></td>
<td class="ccrt1e" align="right">1140</td>
<td class="ccrt1e" align="right">373</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">16.33</td>
<td class="ccrt2e" align="right">0.97</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=297186">Avet</a></td>
<td class="ccrt1o" align="right">1138</td>
<td class="ccrt1o" align="right">338</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">13.82</td>
<td class="ccrt2o" align="right">0.59</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7269339">igorsk</a></td>
<td class="ccrt1e" align="right">1137</td>
<td class="ccrt1e" align="right">302</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">11.10</td>
<td class="ccrt2e" align="right">0.30</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=265773">arung1</a></td>
<td class="ccrt1o" align="right">1133</td>
<td class="ccrt1o" align="right">354</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">14.64</td>
<td class="ccrt2o" align="right">0.70</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8476048">rik12</a></td>
<td class="ccrt1e" align="right">1133</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">16.65</td>
<td class="ccrt2e" align="right">1.04</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8467528">ujjwal</a></td>
<td class="ccrt1o" align="right">1130</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">16.43</td>
<td class="ccrt2o" align="right">1.03</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=302810">kiveol</a></td>
<td class="ccrt1e" align="right">1124</td>
<td class="ccrt1e" align="right">179</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">1.72</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7506429">Gigz</a></td>
<td class="ccrt1o" align="right">1117</td>
<td class="ccrt1o" align="right">524</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">22.89</td>
<td class="ccrt2o" align="right">2.81</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=265817">ChickenHelper</a></td>
<td class="ccrt1e" align="right">1115</td>
<td class="ccrt1e" align="right">295</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">9.32</td>
<td class="ccrt2e" align="right">0.19</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=275661">yuranlu</a></td>
<td class="ccrt1o" align="right">1115</td>
<td class="ccrt1o" align="right">435</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">18.42</td>
<td class="ccrt2o" align="right">1.48</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8361018">SiriusX</a></td>
<td class="ccrt1e" align="right">1112</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.37</td>
<td class="ccrt2e" align="right">0.87</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=274880">PadawanLearner</a></td>
<td class="ccrt1o" align="right">1112</td>
<td class="ccrt1o" align="right">412</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">16.91</td>
<td class="ccrt2o" align="right">1.17</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7216511">Crystal</a></td>
<td class="ccrt1e" align="right">1111</td>
<td class="ccrt1e" align="right">362</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">13.76</td>
<td class="ccrt2e" align="right">0.63</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=269734">king</a></td>
<td class="ccrt1o" align="right">1109</td>
<td class="ccrt1o" align="right">268</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">6.98</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=282700">Mystagogue</a></td>
<td class="ccrt1e" align="right">1109</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.13</td>
<td class="ccrt2e" align="right">0.84</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8474714">gdparekh</a></td>
<td class="ccrt1o" align="right">1109</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">15.11</td>
<td class="ccrt2o" align="right">0.85</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=282715">bangfalse</a></td>
<td class="ccrt1e" align="right">1108</td>
<td class="ccrt1e" align="right">374</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">14.37</td>
<td class="ccrt2e" align="right">0.73</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8361901">niphoton</a></td>
<td class="ccrt1o" align="right">1105</td>
<td class="ccrt1o" align="right">232</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">4.27</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7567486">alfredo57</a></td>
<td class="ccrt1e" align="right">1104</td>
<td class="ccrt1e" align="right">264</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.45</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=152617">flip_da_bits</a></td>
<td class="ccrt1o" align="right">1102</td>
<td class="ccrt1o" align="right">237</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">4.47</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7450841">pagat</a></td>
<td class="ccrt1e" align="right">1101</td>
<td class="ccrt1e" align="right">396</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">15.32</td>
<td class="ccrt2e" align="right">0.90</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=349300">AndrewSmith</a></td>
<td class="ccrt1o" align="right">1099</td>
<td class="ccrt1o" align="right">111</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8418455">jnhuynh</a></td>
<td class="ccrt1e" align="right">1095</td>
<td class="ccrt1e" align="right">273</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.66</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8377094">sun_agr</a></td>
<td class="ccrt1o" align="right">1092</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">14.17</td>
<td class="ccrt2o" align="right">0.72</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=311272">Kentaro</a></td>
<td class="ccrt1e" align="right">1091</td>
<td class="ccrt1e" align="right">233</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">3.80</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7211060">tavbert</a></td>
<td class="ccrt1o" align="right">1088</td>
<td class="ccrt1o" align="right">283</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">7.04</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=274499">mjp</a></td>
<td class="ccrt1e" align="right">1081</td>
<td class="ccrt1e" align="right">333</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">10.11</td>
<td class="ccrt2e" align="right">0.28</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=306750">blackhole</a></td>
<td class="ccrt1o" align="right">1079</td>
<td class="ccrt1o" align="right">199</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">1.65</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8447776">sray</a></td>
<td class="ccrt1e" align="right">1079</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">13.38</td>
<td class="ccrt2e" align="right">0.64</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=311598">the_enigma_83</a></td>
<td class="ccrt1o" align="right">1074</td>
<td class="ccrt1o" align="right">258</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">4.75</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7558401">mcpeepants</a></td>
<td class="ccrt1e" align="right">1073</td>
<td class="ccrt1e" align="right">344</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">10.39</td>
<td class="ccrt2e" align="right">0.31</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7542904">jsneden</a></td>
<td class="ccrt1o" align="right">1069</td>
<td class="ccrt1o" align="right">146</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.16</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=156634">DamnEcuadorian</a></td>
<td class="ccrt1e" align="right">1065</td>
<td class="ccrt1e" align="right">332</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">9.27</td>
<td class="ccrt2e" align="right">0.22</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7536126">Dan-0411</a></td>
<td class="ccrt1o" align="right">1065</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">12.62</td>
<td class="ccrt2o" align="right">0.55</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=310936">CaptDeaf</a></td>
<td class="ccrt1e" align="right">1064</td>
<td class="ccrt1e" align="right">278</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">5.62</td>
<td class="ccrt2e" align="right">0.05</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8419140">Bilroy</a></td>
<td class="ccrt1o" align="right">1063</td>
<td class="ccrt1o" align="right">462</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">16.90</td>
<td class="ccrt2o" align="right">1.31</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8450035">pawel992</a></td>
<td class="ccrt1e" align="right">1061</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">12.43</td>
<td class="ccrt2e" align="right">0.54</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8402448">Cartertu2</a></td>
<td class="ccrt1o" align="right">1057</td>
<td class="ccrt1o" align="right">297</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">6.57</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7317899">rajorshi</a></td>
<td class="ccrt1e" align="right">1053</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">11.97</td>
<td class="ccrt2e" align="right">0.50</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7546306">anupambuet</a></td>
<td class="ccrt1o" align="right">1045</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">11.56</td>
<td class="ccrt2o" align="right">0.46</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8383272">toschek</a></td>
<td class="ccrt1e" align="right">1041</td>
<td class="ccrt1e" align="right">274</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">4.53</td>
<td class="ccrt2e" align="right">0.03</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7459942">toms1234</a></td>
<td class="ccrt1o" align="right">1037</td>
<td class="ccrt1o" align="right">309</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">6.50</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8435644">smart_alex</a></td>
<td class="ccrt1e" align="right">1037</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">11.19</td>
<td class="ccrt2e" align="right">0.42</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7499514">vkanade</a></td>
<td class="ccrt1o" align="right">1025</td>
<td class="ccrt1o" align="right">391</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.95</td>
<td class="ccrt2o" align="right">0.41</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7556252">chicapi</a></td>
<td class="ccrt1e" align="right">1019</td>
<td class="ccrt1e" align="right">198</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.73</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=283796">Gizmodux</a></td>
<td class="ccrt1o" align="right">1014</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">10.06</td>
<td class="ccrt2o" align="right">0.33</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8437807">bow13r84</a></td>
<td class="ccrt1e" align="right">1007</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">9.76</td>
<td class="ccrt2e" align="right">0.31</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=278932">MasterYoda</a></td>
<td class="ccrt1o" align="right">1006</td>
<td class="ccrt1o" align="right">249</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">2.27</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8427959">dr[A]gon</a></td>
<td class="ccrt1e" align="right">1004</td>
<td class="ccrt1e" align="right">275</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">3.41</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8462138">djordille</a></td>
<td class="ccrt1o" align="right">999</td>
<td class="ccrt1o" align="right">385</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">9.39</td>
<td class="ccrt2o" align="right">0.29</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8454828">arak1973</a></td>
<td class="ccrt1e" align="right">984</td>
<td class="ccrt1e" align="right">341</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.33</td>
<td class="ccrt2e" align="right">0.10</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8359071">bombel</a></td>
<td class="ccrt1o" align="right">982</td>
<td class="ccrt1o" align="right">216</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.79</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=347097">MetallicaVN</a></td>
<td class="ccrt1e" align="right">979</td>
<td class="ccrt1e" align="right">330</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">5.53</td>
<td class="ccrt2e" align="right">0.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=268547">CapnPron</a></td>
<td class="ccrt1o" align="right">978</td>
<td class="ccrt1o" align="right">227</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">1.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7578265">Benjii519</a></td>
<td class="ccrt1e" align="right">974</td>
<td class="ccrt1e" align="right">294</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">3.56</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=8352734">corpus_delicti</a></td>
<td class="ccrt1o" align="right">957</td>
<td class="ccrt1o" align="right">238</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">1.07</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=310401">toshke</a></td>
<td class="ccrt1e" align="right">955</td>
<td class="ccrt1e" align="right">336</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">5.09</td>
<td class="ccrt2e" align="right">0.06</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7505258">fizban4113</a></td>
<td class="ccrt1o" align="right">944</td>
<td class="ccrt1o" align="right">324</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">4.15</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7542532">pranav</a></td>
<td class="ccrt1e" align="right">938</td>
<td class="ccrt1e" align="right">330</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">4.28</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=343066">mookiefdr</a></td>
<td class="ccrt1o" align="right">931</td>
<td class="ccrt1o" align="right">362</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">5.64</td>
<td class="ccrt2o" align="right">0.08</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7322813">_Ace_</a></td>
<td class="ccrt1e" align="right">928</td>
<td class="ccrt1e" align="right">238</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.78</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=7494086">JSeligstein</a></td>
<td class="ccrt1o" align="right">920</td>
<td class="ccrt1o" align="right">300</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">2.57</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=309346">BoardWalker</a></td>
<td class="ccrt1e" align="right">919</td>
<td class="ccrt1e" align="right">192</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.12</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGreen" href="/tc?module=MemberProfile&amp;cr=159841">JeyK</a></td>
<td class="ccrt1o" align="right">901</td>
<td class="ccrt1o" align="right">335</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">3.55</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7316058">ahmadmzakir</a></td>
<td class="ccrt1e" align="right">894</td>
<td class="ccrt1e" align="right">286</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">1.63</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=309937">Mr.Furious</a></td>
<td class="ccrt1o" align="right">886</td>
<td class="ccrt1o" align="right">128</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8435996">sigkill0</a></td>
<td class="ccrt1e" align="right">878</td>
<td class="ccrt1e" align="right">288</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">1.48</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=296461">spm</a></td>
<td class="ccrt1o" align="right">871</td>
<td class="ccrt1o" align="right">219</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.20</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7393530">czaty</a></td>
<td class="ccrt1e" align="right">854</td>
<td class="ccrt1e" align="right">327</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">2.32</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=152756">mvw</a></td>
<td class="ccrt1o" align="right">850</td>
<td class="ccrt1o" align="right">351</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">3.11</td>
<td class="ccrt2o" align="right">0.02</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8409805">sdmehta</a></td>
<td class="ccrt1e" align="right">847</td>
<td class="ccrt1e" align="right">353</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">3.11</td>
<td class="ccrt2e" align="right">0.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=2058558">miracle</a></td>
<td class="ccrt1o" align="right">838</td>
<td class="ccrt1o" align="right">393</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">4.48</td>
<td class="ccrt2o" align="right">0.05</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7480516">yongshin</a></td>
<td class="ccrt1e" align="right">833</td>
<td class="ccrt1e" align="right">385</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">4.03</td>
<td class="ccrt2e" align="right">0.04</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=282628">sushah23</a></td>
<td class="ccrt1o" align="right">826</td>
<td class="ccrt1o" align="right">276</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.70</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7454429">sowedance</a></td>
<td class="ccrt1e" align="right">826</td>
<td class="ccrt1e" align="right">452</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">6.61</td>
<td class="ccrt2e" align="right">0.15</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8423472">Ben0</a></td>
<td class="ccrt1o" align="right">799</td>
<td class="ccrt1o" align="right">295</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.83</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=300617">andrija</a></td>
<td class="ccrt1e" align="right">789</td>
<td class="ccrt1e" align="right">184</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=309403">eam</a></td>
<td class="ccrt1o" align="right">778</td>
<td class="ccrt1o" align="right">264</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.30</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8446844">SwishSween</a></td>
<td class="ccrt1e" align="right">768</td>
<td class="ccrt1e" align="right">320</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">1.07</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=8364005">mohit_aggarwal</a></td>
<td class="ccrt1o" align="right">764</td>
<td class="ccrt1o" align="right">237</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.09</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=348026">ooooops</a></td>
<td class="ccrt1e" align="right">758</td>
<td class="ccrt1e" align="right">199</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.01</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7468896">murgi33</a></td>
<td class="ccrt1o" align="right">747</td>
<td class="ccrt1o" align="right">522</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">7.31</td>
<td class="ccrt2o" align="right">0.22</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7481040">MPA3</a></td>
<td class="ccrt1e" align="right">719</td>
<td class="ccrt1e" align="right">189</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=347093">haoboutnow</a></td>
<td class="ccrt1o" align="right">712</td>
<td class="ccrt1o" align="right">264</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.13</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=344595">aceofsteel</a></td>
<td class="ccrt1e" align="right">692</td>
<td class="ccrt1e" align="right">287</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.24</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7350758">Blitz</a></td>
<td class="ccrt1o" align="right">640</td>
<td class="ccrt1o" align="right">200</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=284146">snowbro</a></td>
<td class="ccrt1e" align="right">623</td>
<td class="ccrt1e" align="right">349</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.57</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr>
<td class="ccrh1" align="left" colspan="4"></td>
<td class="ccrh2" align="center" colspan="7">Probability of advancing to:</td>
<td class="ccrh3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
<td class="ccrh1" align="left">Handle</td>
<td class="ccrh1" align="right">Rating</td>
<td class="ccrh1" align="right">Volatility</td>
<td class="ccrh1" align="right">Earnings</td>
<td class="ccrh2" align="right">Online 2</td>
<td class="ccrh2" align="right">Online 3</td>
<td class="ccrh2" align="right">Online 4</td>
<td class="ccrh2" align="right">Semifinals</td>
<td class="ccrh2" align="right">Wildcard</td>
<td class="ccrh2" align="right">WC Win</td>
<td class="ccrh2" align="right">Finals</td>
<td class="ccrh3" align="right">4th</td>
<td class="ccrh3" align="right">3rd</td>
<td class="ccrh3" align="right">2nd</td>
<td class="ccrh3" align="right">Champ</td>
</tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7445525">patches</a></td>
<td class="ccrt1o" align="right">616</td>
<td class="ccrt1o" align="right">238</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.01</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=300150">Mikhail_T</a></td>
<td class="ccrt1e" align="right">599</td>
<td class="ccrt1e" align="right">391</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">1.02</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=7500169">Ammon</a></td>
<td class="ccrt1o" align="right">598</td>
<td class="ccrt1o" align="right">340</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.39</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>
<tr><td class="ccrt1e"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=251196">rumbosoft</a></td>
<td class="ccrt1e" align="right">581</td>
<td class="ccrt1e" align="right">341</td>
<td class="ccrt1e" align="right">$0.00</td>
<td class="ccrt2e" align="right">0.34</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt2e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td>
<td class="ccrt3e" align="right">0.00</td></tr>
<tr><td class="ccrt1o"><a class="coderTextGray" href="/tc?module=MemberProfile&amp;cr=297264">TTRipley</a></td>
<td class="ccrt1o" align="right">543</td>
<td class="ccrt1o" align="right">280</td>
<td class="ccrt1o" align="right">$0.00</td>
<td class="ccrt2o" align="right">0.03</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt2o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td>
<td class="ccrt3o" align="right">0.00</td></tr>

</table>
<br/>
<br/>
</td>
</tr>
</table>
</body>

</html>
