<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>2003 TopCoder Open sponsored by Intel&#174; sponsored by Intel&#174;</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>
<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td align="center"><A href="/index?t=tournaments&amp;c=tco03_overview" target="_top"><img src="/i/tournament/tco03/tco_home_banner.gif" alt="2003 TopCoder Open sponsord by Intel&#174;" width="540" height="125" border="0" /></A></td></tr>
</table>
<table cellpadding="4" cellspacing="2" align="center" border="0" class="bodyText" width="800">
<tr>
<td  class="bodyText">
<br/>

      <table cellpadding="0" cellspacing="3" align="center" border="0" class="bodyText" width="800">
         <tr>
            <td align="left" class="bodyText" colspan="3"><h2>radeye's Odds</h2></td>
         </tr>
         <tr>
            <td align="left" class="bodyText">
               <img src="/i/m/radeye_mug.gif" alt="" width="55" height="61" border="0" vspace="5" align="left"/>
               By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=277659"><strong>radeye</strong></a><br />
               <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
            </td>

            <td width="5"><img src="/i/clear.gif" alt="" width="5" height="1" border="0" /></td>

            <td align="left" width ="100%" class="bodyText" valign="top">
               <p>Beat the odds!  These results of over 30,000,000 Monte Carlo simulations
               predict your chances to advance in the TopCoder Open 2003 based only on
               your current TopCoder rating and volatility.  Prove that you're
               underrated as you advance through the Tournament.  Also remember that in any
               sufficiently large set of events, some will be of vanishingly small
               probability.</p>

               <p>The model used here is a normal distribution with mean of your rating and
               standard deviation of your volatility, assuming every advancing coder
               scores at least 0 points, and everyone competes in every round they are
               eligible for.  This information is provided for entertainment purposes
               only.</p>
            </td>
         </tr>
      </table>
<br/>

<table cellpadding="4" cellspacing="0" align="center" border="0" width="100%">
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=272072">SnapDragon</a></td>
<td  class="radeyeTable1Odd" align="right">3384</td>
<td  class="radeyeTable1Odd" align="right">335</td>
<td  class="radeyeTable1Odd" align="right">$28,387.75</td>
<td  class="radeyeTable1Odd" align="right">100.</td>
<td  class="radeyeTable2Odd" align="right">100.</td>
<td  class="radeyeTable2Odd" align="right">100.</td>
<td  class="radeyeTable2Odd" align="right">98.3</td>
<td  class="radeyeTable2Odd" align="right">83.3</td>
<td  class="radeyeTable3Odd" align="right">3.14</td>
<td  class="radeyeTable3Odd" align="right">9.63</td>
<td  class="radeyeTable3Odd" align="right">22.2</td>
<td  class="radeyeTable3Odd" align="right">48.3</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=144400">tomek</a></td>
<td  class="radeyeTable1Even" align="right">3148</td>
<td  class="radeyeTable1Even" align="right">381</td>
<td  class="radeyeTable1Even" align="right">$12,471.96</td>
<td  class="radeyeTable1Even" align="right">100.</td>
<td  class="radeyeTable2Even" align="right">99.9</td>
<td  class="radeyeTable2Even" align="right">99.3</td>
<td  class="radeyeTable2Even" align="right">89.3</td>
<td  class="radeyeTable2Even" align="right">58.5</td>
<td  class="radeyeTable3Even" align="right">8.95</td>
<td  class="radeyeTable3Even" align="right">14.6</td>
<td  class="radeyeTable3Even" align="right">18.5</td>
<td  class="radeyeTable3Even" align="right">16.4</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260835">reid</a></td>
<td  class="radeyeTable1Odd" align="right">3062</td>
<td  class="radeyeTable1Odd" align="right">342</td>
<td  class="radeyeTable1Odd" align="right">$8,767.72</td>
<td  class="radeyeTable1Odd" align="right">100.</td>
<td  class="radeyeTable2Odd" align="right">99.9</td>
<td  class="radeyeTable2Odd" align="right">99.4</td>
<td  class="radeyeTable2Odd" align="right">87.4</td>
<td  class="radeyeTable2Odd" align="right">49.7</td>
<td  class="radeyeTable3Odd" align="right">9.71</td>
<td  class="radeyeTable3Odd" align="right">14.9</td>
<td  class="radeyeTable3Odd" align="right">15.3</td>
<td  class="radeyeTable3Odd" align="right">9.78</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152347">ZorbaTHut</a></td>
<td  class="radeyeTable1Even" align="right">3044</td>
<td  class="radeyeTable1Even" align="right">421</td>
<td  class="radeyeTable1Even" align="right">$7,456.20</td>
<td  class="radeyeTable1Even" align="right">99.9</td>
<td  class="radeyeTable2Even" align="right">99.5</td>
<td  class="radeyeTable2Even" align="right">97.4</td>
<td  class="radeyeTable2Even" align="right">79.8</td>
<td  class="radeyeTable2Even" align="right">40.4</td>
<td  class="radeyeTable3Even" align="right">9.64</td>
<td  class="radeyeTable3Even" align="right">11.0</td>
<td  class="radeyeTable3Even" align="right">11.0</td>
<td  class="radeyeTable3Even" align="right">8.81</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=152073">NGBronson</a></td>
<td  class="radeyeTable1Odd" align="right">2945</td>
<td  class="radeyeTable1Odd" align="right">455</td>
<td  class="radeyeTable1Odd" align="right">$4,667.02</td>
<td  class="radeyeTable1Odd" align="right">99.6</td>
<td  class="radeyeTable2Odd" align="right">98.3</td>
<td  class="radeyeTable2Odd" align="right">93.6</td>
<td  class="radeyeTable2Odd" align="right">68.7</td>
<td  class="radeyeTable2Odd" align="right">27.7</td>
<td  class="radeyeTable3Odd" align="right">8.59</td>
<td  class="radeyeTable3Odd" align="right">7.60</td>
<td  class="radeyeTable3Odd" align="right">6.54</td>
<td  class="radeyeTable3Odd" align="right">4.94</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=269554">Yarin</a></td>
<td  class="radeyeTable1Even" align="right">2903</td>
<td  class="radeyeTable1Even" align="right">285</td>
<td  class="radeyeTable1Even" align="right">$3,635.89</td>
<td  class="radeyeTable1Even" align="right">100.</td>
<td  class="radeyeTable2Even" align="right">100.</td>
<td  class="radeyeTable2Even" align="right">99.3</td>
<td  class="radeyeTable2Even" align="right">79.5</td>
<td  class="radeyeTable2Even" align="right">26.2</td>
<td  class="radeyeTable3Even" align="right">7.64</td>
<td  class="radeyeTable3Even" align="right">9.43</td>
<td  class="radeyeTable3Even" align="right">6.71</td>
<td  class="radeyeTable3Even" align="right">2.44</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=262936">dgarthur</a></td>
<td  class="radeyeTable1Odd" align="right">2867</td>
<td  class="radeyeTable1Odd" align="right">456</td>
<td  class="radeyeTable1Odd" align="right">$3,148.51</td>
<td  class="radeyeTable1Odd" align="right">99.4</td>
<td  class="radeyeTable2Odd" align="right">97.4</td>
<td  class="radeyeTable2Odd" align="right">90.8</td>
<td  class="radeyeTable2Odd" align="right">61.2</td>
<td  class="radeyeTable2Odd" align="right">19.5</td>
<td  class="radeyeTable3Odd" align="right">6.82</td>
<td  class="radeyeTable3Odd" align="right">5.50</td>
<td  class="radeyeTable3Odd" align="right">4.35</td>
<td  class="radeyeTable3Odd" align="right">2.87</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=311170">bladerunner</a></td>
<td  class="radeyeTable1Even" align="right">2781</td>
<td  class="radeyeTable1Even" align="right">330</td>
<td  class="radeyeTable1Even" align="right">$1,824.27</td>
<td  class="radeyeTable1Even" align="right">99.9</td>
<td  class="radeyeTable2Even" align="right">99.4</td>
<td  class="radeyeTable2Even" align="right">95.8</td>
<td  class="radeyeTable2Even" align="right">61.3</td>
<td  class="radeyeTable2Even" align="right">11.9</td>
<td  class="radeyeTable3Even" align="right">4.49</td>
<td  class="radeyeTable3Even" align="right">4.03</td>
<td  class="radeyeTable3Even" align="right">2.49</td>
<td  class="radeyeTable3Even" align="right">.900</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=305142">ChristopherH</a></td>
<td  class="radeyeTable1Odd" align="right">2767</td>
<td  class="radeyeTable1Odd" align="right">429</td>
<td  class="radeyeTable1Odd" align="right">$1,728.70</td>
<td  class="radeyeTable1Odd" align="right">99.3</td>
<td  class="radeyeTable2Odd" align="right">96.7</td>
<td  class="radeyeTable2Odd" align="right">88.2</td>
<td  class="radeyeTable2Odd" align="right">52.5</td>
<td  class="radeyeTable2Odd" align="right">9.94</td>
<td  class="radeyeTable3Odd" align="right">3.86</td>
<td  class="radeyeTable3Odd" align="right">2.88</td>
<td  class="radeyeTable3Odd" align="right">2.05</td>
<td  class="radeyeTable3Odd" align="right">1.15</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=277659">radeye</a></td>
<td  class="radeyeTable1Even" align="right">2764</td>
<td  class="radeyeTable1Even" align="right">300</td>
<td  class="radeyeTable1Even" align="right">$1,438.95</td>
<td  class="radeyeTable1Even" align="right">100.</td>
<td  class="radeyeTable2Even" align="right">99.7</td>
<td  class="radeyeTable2Even" align="right">96.9</td>
<td  class="radeyeTable2Even" align="right">61.3</td>
<td  class="radeyeTable2Even" align="right">7.40</td>
<td  class="radeyeTable3Even" align="right">2.66</td>
<td  class="radeyeTable3Even" align="right">2.58</td>
<td  class="radeyeTable3Even" align="right">1.61</td>
<td  class="radeyeTable3Even" align="right">.557</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=114853">dmwright</a></td>
<td  class="radeyeTable1Odd" align="right">2744</td>
<td  class="radeyeTable1Odd" align="right">362</td>
<td  class="radeyeTable1Odd" align="right">$1,347.36</td>
<td  class="radeyeTable1Odd" align="right">99.8</td>
<td  class="radeyeTable2Odd" align="right">98.5</td>
<td  class="radeyeTable2Odd" align="right">92.4</td>
<td  class="radeyeTable2Odd" align="right">54.3</td>
<td  class="radeyeTable2Odd" align="right">6.64</td>
<td  class="radeyeTable3Odd" align="right">2.53</td>
<td  class="radeyeTable3Odd" align="right">2.09</td>
<td  class="radeyeTable3Odd" align="right">1.38</td>
<td  class="radeyeTable3Odd" align="right">.633</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287496">bstanescu</a></td>
<td  class="radeyeTable1Even" align="right">2729</td>
<td  class="radeyeTable1Even" align="right">331</td>
<td  class="radeyeTable1Even" align="right">$1,208.75</td>
<td  class="radeyeTable1Even" align="right">99.9</td>
<td  class="radeyeTable2Even" align="right">99.0</td>
<td  class="radeyeTable2Even" align="right">94.0</td>
<td  class="radeyeTable2Even" align="right">54.4</td>
<td  class="radeyeTable2Even" align="right">5.65</td>
<td  class="radeyeTable3Even" align="right">2.21</td>
<td  class="radeyeTable3Even" align="right">1.85</td>
<td  class="radeyeTable3Even" align="right">1.15</td>
<td  class="radeyeTable3Even" align="right">.442</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=274023">venco</a></td>
<td  class="radeyeTable1Odd" align="right">2685</td>
<td  class="radeyeTable1Odd" align="right">326</td>
<td  class="radeyeTable1Odd" align="right">$991.40</td>
<td  class="radeyeTable1Odd" align="right">99.8</td>
<td  class="radeyeTable2Odd" align="right">98.8</td>
<td  class="radeyeTable2Odd" align="right">92.4</td>
<td  class="radeyeTable2Odd" align="right">48.7</td>
<td  class="radeyeTable2Odd" align="right">4.40</td>
<td  class="radeyeTable3Odd" align="right">1.91</td>
<td  class="radeyeTable3Odd" align="right">1.43</td>
<td  class="radeyeTable3Odd" align="right">.789</td>
<td  class="radeyeTable3Odd" align="right">.269</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286907">WishingBone</a></td>
<td  class="radeyeTable1Even" align="right">2653</td>
<td  class="radeyeTable1Even" align="right">278</td>
<td  class="radeyeTable1Even" align="right">$830.17</td>
<td  class="radeyeTable1Even" align="right">100.</td>
<td  class="radeyeTable2Even" align="right">99.5</td>
<td  class="radeyeTable2Even" align="right">94.7</td>
<td  class="radeyeTable2Even" align="right">46.0</td>
<td  class="radeyeTable2Even" align="right">3.19</td>
<td  class="radeyeTable3Even" align="right">1.50</td>
<td  class="radeyeTable3Even" align="right">1.08</td>
<td  class="radeyeTable3Even" align="right">.493</td>
<td  class="radeyeTable3Even" align="right">.119</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=153505">ambrose</a></td>
<td  class="radeyeTable1Odd" align="right">2639</td>
<td  class="radeyeTable1Odd" align="right">361</td>
<td  class="radeyeTable1Odd" align="right">$852.24</td>
<td  class="radeyeTable1Odd" align="right">99.4</td>
<td  class="radeyeTable2Odd" align="right">96.9</td>
<td  class="radeyeTable2Odd" align="right">86.7</td>
<td  class="radeyeTable2Odd" align="right">41.0</td>
<td  class="radeyeTable2Odd" align="right">4.04</td>
<td  class="radeyeTable3Odd" align="right">1.96</td>
<td  class="radeyeTable3Odd" align="right">1.24</td>
<td  class="radeyeTable3Odd" align="right">.632</td>
<td  class="radeyeTable3Odd" align="right">.215</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=120816">malpt</a></td>
<td  class="radeyeTable1Even" align="right">2624</td>
<td  class="radeyeTable1Even" align="right">342</td>
<td  class="radeyeTable1Even" align="right">$787.14</td>
<td  class="radeyeTable1Even" align="right">99.6</td>
<td  class="radeyeTable2Even" align="right">97.4</td>
<td  class="radeyeTable2Even" align="right">87.5</td>
<td  class="radeyeTable2Even" align="right">39.7</td>
<td  class="radeyeTable2Even" align="right">3.62</td>
<td  class="radeyeTable3Even" align="right">1.83</td>
<td  class="radeyeTable3Even" align="right">1.12</td>
<td  class="radeyeTable3Even" align="right">.530</td>
<td  class="radeyeTable3Even" align="right">.150</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=155275">DjinnKahn</a></td>
<td  class="radeyeTable1Odd" align="right">2589</td>
<td  class="radeyeTable1Odd" align="right">365</td>
<td  class="radeyeTable1Odd" align="right">$689.79</td>
<td  class="radeyeTable1Odd" align="right">99.1</td>
<td  class="radeyeTable2Odd" align="right">95.5</td>
<td  class="radeyeTable2Odd" align="right">82.5</td>
<td  class="radeyeTable2Odd" align="right">34.5</td>
<td  class="radeyeTable2Odd" align="right">3.14</td>
<td  class="radeyeTable3Odd" align="right">1.68</td>
<td  class="radeyeTable3Odd" align="right">.914</td>
<td  class="radeyeTable3Odd" align="right">.422</td>
<td  class="radeyeTable3Odd" align="right">.123</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=157974">bigg_nate</a></td>
<td  class="radeyeTable1Even" align="right">2569</td>
<td  class="radeyeTable1Even" align="right">533</td>
<td  class="radeyeTable1Even" align="right">$716.03</td>
<td  class="radeyeTable1Even" align="right">94.4</td>
<td  class="radeyeTable2Even" align="right">83.3</td>
<td  class="radeyeTable2Even" align="right">63.6</td>
<td  class="radeyeTable2Even" align="right">27.2</td>
<td  class="radeyeTable2Even" align="right">3.96</td>
<td  class="radeyeTable3Even" align="right">2.14</td>
<td  class="radeyeTable3Even" align="right">.944</td>
<td  class="radeyeTable3Even" align="right">.561</td>
<td  class="radeyeTable3Even" align="right">.320</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7445961">snewman</a></td>
<td  class="radeyeTable1Odd" align="right">2563</td>
<td  class="radeyeTable1Odd" align="right">655</td>
<td  class="radeyeTable1Odd" align="right">$758.71</td>
<td  class="radeyeTable1Odd" align="right">90.1</td>
<td  class="radeyeTable2Odd" align="right">74.9</td>
<td  class="radeyeTable2Odd" align="right">53.7</td>
<td  class="radeyeTable2Odd" align="right">23.4</td>
<td  class="radeyeTable2Odd" align="right">4.32</td>
<td  class="radeyeTable3Odd" align="right">2.31</td>
<td  class="radeyeTable3Odd" align="right">.903</td>
<td  class="radeyeTable3Odd" align="right">.606</td>
<td  class="radeyeTable3Odd" align="right">.497</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=7311097">m00tz</a></td>
<td  class="radeyeTable1Even" align="right">2552</td>
<td  class="radeyeTable1Even" align="right">439</td>
<td  class="radeyeTable1Even" align="right">$623.19</td>
<td  class="radeyeTable1Even" align="right">97.0</td>
<td  class="radeyeTable2Even" align="right">89.3</td>
<td  class="radeyeTable2Even" align="right">71.3</td>
<td  class="radeyeTable2Even" align="right">28.4</td>
<td  class="radeyeTable2Even" align="right">3.12</td>
<td  class="radeyeTable3Even" align="right">1.74</td>
<td  class="radeyeTable3Even" align="right">.822</td>
<td  class="radeyeTable3Even" align="right">.405</td>
<td  class="radeyeTable3Even" align="right">.153</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=2058672">dary</a></td>
<td  class="radeyeTable1Odd" align="right">2537</td>
<td  class="radeyeTable1Odd" align="right">514</td>
<td  class="radeyeTable1Odd" align="right">$615.14</td>
<td  class="radeyeTable1Odd" align="right">94.3</td>
<td  class="radeyeTable2Odd" align="right">83.0</td>
<td  class="radeyeTable2Odd" align="right">62.4</td>
<td  class="radeyeTable2Odd" align="right">25.0</td>
<td  class="radeyeTable2Odd" align="right">3.31</td>
<td  class="radeyeTable3Odd" align="right">1.86</td>
<td  class="radeyeTable3Odd" align="right">.800</td>
<td  class="radeyeTable3Odd" align="right">.439</td>
<td  class="radeyeTable3Odd" align="right">.219</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287568">tjq</a></td>
<td  class="radeyeTable1Even" align="right">2532</td>
<td  class="radeyeTable1Even" align="right">293</td>
<td  class="radeyeTable1Even" align="right">$510.37</td>
<td  class="radeyeTable1Even" align="right">99.7</td>
<td  class="radeyeTable2Even" align="right">97.6</td>
<td  class="radeyeTable2Even" align="right">85.9</td>
<td  class="radeyeTable2Even" align="right">28.1</td>
<td  class="radeyeTable2Even" align="right">1.55</td>
<td  class="radeyeTable3Even" align="right">.922</td>
<td  class="radeyeTable3Even" align="right">.458</td>
<td  class="radeyeTable3Even" align="right">.149</td>
<td  class="radeyeTable3Even" align="right">.026</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=345049">aneubeck</a></td>
<td  class="radeyeTable1Odd" align="right">2513</td>
<td  class="radeyeTable1Odd" align="right">495</td>
<td  class="radeyeTable1Odd" align="right">$540.06</td>
<td  class="radeyeTable1Odd" align="right">94.5</td>
<td  class="radeyeTable2Odd" align="right">83.0</td>
<td  class="radeyeTable2Odd" align="right">61.9</td>
<td  class="radeyeTable2Odd" align="right">23.4</td>
<td  class="radeyeTable2Odd" align="right">2.76</td>
<td  class="radeyeTable3Odd" align="right">1.61</td>
<td  class="radeyeTable3Odd" align="right">.665</td>
<td  class="radeyeTable3Odd" align="right">.343</td>
<td  class="radeyeTable3Odd" align="right">.148</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=260987">dangelo</a></td>
<td  class="radeyeTable1Even" align="right">2512</td>
<td  class="radeyeTable1Even" align="right">464</td>
<td  class="radeyeTable1Even" align="right">$528.10</td>
<td  class="radeyeTable1Even" align="right">95.6</td>
<td  class="radeyeTable2Even" align="right">85.4</td>
<td  class="radeyeTable2Even" align="right">64.7</td>
<td  class="radeyeTable2Even" align="right">23.9</td>
<td  class="radeyeTable2Even" align="right">2.58</td>
<td  class="radeyeTable3Even" align="right">1.51</td>
<td  class="radeyeTable3Even" align="right">.646</td>
<td  class="radeyeTable3Even" align="right">.305</td>
<td  class="radeyeTable3Even" align="right">.120</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287266">jms137</a></td>
<td  class="radeyeTable1Odd" align="right">2503</td>
<td  class="radeyeTable1Odd" align="right">171</td>
<td  class="radeyeTable1Odd" align="right">$364.57</td>
<td  class="radeyeTable1Odd" align="right">100.</td>
<td  class="radeyeTable2Odd" align="right">99.9</td>
<td  class="radeyeTable2Odd" align="right">96.3</td>
<td  class="radeyeTable2Odd" align="right">18.0</td>
<td  class="radeyeTable2Odd" align="right">.362</td>
<td  class="radeyeTable3Odd" align="right">.229</td>
<td  class="radeyeTable3Odd" align="right">.109</td>
<td  class="radeyeTable3Odd" align="right">.022</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=129672">doeth</a></td>
<td  class="radeyeTable1Even" align="right">2482</td>
<td  class="radeyeTable1Even" align="right">491</td>
<td  class="radeyeTable1Even" align="right">$469.20</td>
<td  class="radeyeTable1Even" align="right">93.9</td>
<td  class="radeyeTable2Even" align="right">81.4</td>
<td  class="radeyeTable2Even" align="right">59.1</td>
<td  class="radeyeTable2Even" align="right">20.9</td>
<td  class="radeyeTable2Even" align="right">2.24</td>
<td  class="radeyeTable3Even" align="right">1.35</td>
<td  class="radeyeTable3Even" align="right">.526</td>
<td  class="radeyeTable3Even" align="right">.262</td>
<td  class="radeyeTable3Even" align="right">.107</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287105">lars</a></td>
<td  class="radeyeTable1Odd" align="right">2471</td>
<td  class="radeyeTable1Odd" align="right">361</td>
<td  class="radeyeTable1Odd" align="right">$410.52</td>
<td  class="radeyeTable1Odd" align="right">98.1</td>
<td  class="radeyeTable2Odd" align="right">91.3</td>
<td  class="radeyeTable2Odd" align="right">71.6</td>
<td  class="radeyeTable2Odd" align="right">21.1</td>
<td  class="radeyeTable2Odd" align="right">1.26</td>
<td  class="radeyeTable3Odd" align="right">.789</td>
<td  class="radeyeTable3Odd" align="right">.330</td>
<td  class="radeyeTable3Odd" align="right">.116</td>
<td  class="radeyeTable3Odd" align="right">.026</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=157972">obfuscator</a></td>
<td  class="radeyeTable1Even" align="right">2444</td>
<td  class="radeyeTable1Even" align="right">296</td>
<td  class="radeyeTable1Even" align="right">$348.58</td>
<td  class="radeyeTable1Even" align="right">99.3</td>
<td  class="radeyeTable2Even" align="right">95.0</td>
<td  class="radeyeTable2Even" align="right">76.6</td>
<td  class="radeyeTable2Even" align="right">17.6</td>
<td  class="radeyeTable2Even" align="right">.618</td>
<td  class="radeyeTable3Even" align="right">.409</td>
<td  class="radeyeTable3Even" align="right">.160</td>
<td  class="radeyeTable3Even" align="right">.043</td>
<td  class="radeyeTable3Even" align="right">.006</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=153902">evd</a></td>
<td  class="radeyeTable1Odd" align="right">2438</td>
<td  class="radeyeTable1Odd" align="right">430</td>
<td  class="radeyeTable1Odd" align="right">$369.53</td>
<td  class="radeyeTable1Odd" align="right">95.2</td>
<td  class="radeyeTable2Odd" align="right">83.7</td>
<td  class="radeyeTable2Odd" align="right">60.3</td>
<td  class="radeyeTable2Odd" align="right">18.0</td>
<td  class="radeyeTable2Odd" align="right">1.29</td>
<td  class="radeyeTable3Odd" align="right">.821</td>
<td  class="radeyeTable3Odd" align="right">.310</td>
<td  class="radeyeTable3Odd" align="right">.126</td>
<td  class="radeyeTable3Odd" align="right">.036</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=275071">antimatter</a></td>
<td  class="radeyeTable1Even" align="right">2392</td>
<td  class="radeyeTable1Even" align="right">318</td>
<td  class="radeyeTable1Even" align="right">$284.54</td>
<td  class="radeyeTable1Even" align="right">98.2</td>
<td  class="radeyeTable2Even" align="right">90.8</td>
<td  class="radeyeTable2Even" align="right">67.2</td>
<td  class="radeyeTable2Even" align="right">13.3</td>
<td  class="radeyeTable2Even" align="right">.405</td>
<td  class="radeyeTable3Even" align="right">.282</td>
<td  class="radeyeTable3Even" align="right">.094</td>
<td  class="radeyeTable3Even" align="right">.026</td>
<td  class="radeyeTable3Even" align="right">.004</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=264869">ante</a></td>
<td  class="radeyeTable1Odd" align="right">2386</td>
<td  class="radeyeTable1Odd" align="right">280</td>
<td  class="radeyeTable1Odd" align="right">$267.25</td>
<td  class="radeyeTable1Odd" align="right">99.1</td>
<td  class="radeyeTable2Odd" align="right">93.7</td>
<td  class="radeyeTable2Odd" align="right">71.3</td>
<td  class="radeyeTable2Odd" align="right">11.6</td>
<td  class="radeyeTable2Odd" align="right">.250</td>
<td  class="radeyeTable3Odd" align="right">.176</td>
<td  class="radeyeTable3Odd" align="right">.059</td>
<td  class="radeyeTable3Odd" align="right">.013</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=281028">loopy</a></td>
<td  class="radeyeTable1Even" align="right">2379</td>
<td  class="radeyeTable1Even" align="right">434</td>
<td  class="radeyeTable1Even" align="right">$285.20</td>
<td  class="radeyeTable1Even" align="right">93.5</td>
<td  class="radeyeTable2Even" align="right">79.1</td>
<td  class="radeyeTable2Even" align="right">53.1</td>
<td  class="radeyeTable2Even" align="right">13.5</td>
<td  class="radeyeTable2Even" align="right">.762</td>
<td  class="radeyeTable3Even" align="right">.513</td>
<td  class="radeyeTable3Even" align="right">.168</td>
<td  class="radeyeTable3Even" align="right">.064</td>
<td  class="radeyeTable3Even" align="right">.017</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=113178">po</a></td>
<td  class="radeyeTable1Odd" align="right">2357</td>
<td  class="radeyeTable1Odd" align="right">280</td>
<td  class="radeyeTable1Odd" align="right">$236.32</td>
<td  class="radeyeTable1Odd" align="right">98.8</td>
<td  class="radeyeTable2Odd" align="right">92.3</td>
<td  class="radeyeTable2Odd" align="right">67.1</td>
<td  class="radeyeTable2Odd" align="right">9.34</td>
<td  class="radeyeTable2Odd" align="right">.159</td>
<td  class="radeyeTable3Odd" align="right">.115</td>
<td  class="radeyeTable3Odd" align="right">.036</td>
<td  class="radeyeTable3Odd" align="right">.007</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=251074">bmerry</a></td>
<td  class="radeyeTable1Even" align="right">2345</td>
<td  class="radeyeTable1Even" align="right">326</td>
<td  class="radeyeTable1Even" align="right">$233.29</td>
<td  class="radeyeTable1Even" align="right">97.2</td>
<td  class="radeyeTable2Even" align="right">87.0</td>
<td  class="radeyeTable2Even" align="right">59.7</td>
<td  class="radeyeTable2Even" align="right">9.80</td>
<td  class="radeyeTable2Even" align="right">.232</td>
<td  class="radeyeTable3Even" align="right">.168</td>
<td  class="radeyeTable3Even" align="right">.051</td>
<td  class="radeyeTable3Even" align="right">.012</td>
<td  class="radeyeTable3Even" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=286911">Xu Chuan</a></td>
<td  class="radeyeTable1Odd" align="right">2344</td>
<td  class="radeyeTable1Odd" align="right">437</td>
<td  class="radeyeTable1Odd" align="right">$245.52</td>
<td  class="radeyeTable1Odd" align="right">92.3</td>
<td  class="radeyeTable2Odd" align="right">76.2</td>
<td  class="radeyeTable2Odd" align="right">48.7</td>
<td  class="radeyeTable2Odd" align="right">11.2</td>
<td  class="radeyeTable2Odd" align="right">.542</td>
<td  class="radeyeTable3Odd" align="right">.374</td>
<td  class="radeyeTable3Odd" align="right">.115</td>
<td  class="radeyeTable3Odd" align="right">.041</td>
<td  class="radeyeTable3Odd" align="right">.012</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287269">legakis</a></td>
<td  class="radeyeTable1Even" align="right">2340</td>
<td  class="radeyeTable1Even" align="right">220</td>
<td  class="radeyeTable1Even" align="right">$203.33</td>
<td  class="radeyeTable1Even" align="right">99.7</td>
<td  class="radeyeTable2Even" align="right">96.4</td>
<td  class="radeyeTable2Even" align="right">72.8</td>
<td  class="radeyeTable2Even" align="right">5.62</td>
<td  class="radeyeTable2Even" align="right">.044</td>
<td  class="radeyeTable3Even" align="right">.032</td>
<td  class="radeyeTable3Even" align="right">.010</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=307638">Wernie</a></td>
<td  class="radeyeTable1Odd" align="right">2339</td>
<td  class="radeyeTable1Odd" align="right">339</td>
<td  class="radeyeTable1Odd" align="right">$229.39</td>
<td  class="radeyeTable1Odd" align="right">96.5</td>
<td  class="radeyeTable2Odd" align="right">85.3</td>
<td  class="radeyeTable2Odd" align="right">57.4</td>
<td  class="radeyeTable2Odd" align="right">9.71</td>
<td  class="radeyeTable2Odd" align="right">.227</td>
<td  class="radeyeTable3Odd" align="right">.162</td>
<td  class="radeyeTable3Odd" align="right">.050</td>
<td  class="radeyeTable3Odd" align="right">.013</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=112939">zoidal</a></td>
<td  class="radeyeTable1Even" align="right">2337</td>
<td  class="radeyeTable1Even" align="right">355</td>
<td  class="radeyeTable1Even" align="right">$229.31</td>
<td  class="radeyeTable1Even" align="right">95.8</td>
<td  class="radeyeTable2Even" align="right">83.5</td>
<td  class="radeyeTable2Even" align="right">55.4</td>
<td  class="radeyeTable2Even" align="right">9.88</td>
<td  class="radeyeTable2Even" align="right">.263</td>
<td  class="radeyeTable3Even" align="right">.190</td>
<td  class="radeyeTable3Even" align="right">.056</td>
<td  class="radeyeTable3Even" align="right">.015</td>
<td  class="radeyeTable3Even" align="right">.003</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=288584">LunaticFringe</a></td>
<td  class="radeyeTable1Odd" align="right">2323</td>
<td  class="radeyeTable1Odd" align="right">677</td>
<td  class="radeyeTable1Odd" align="right">$262.83</td>
<td  class="radeyeTable1Odd" align="right">81.2</td>
<td  class="radeyeTable2Odd" align="right">58.3</td>
<td  class="radeyeTable2Odd" align="right">33.7</td>
<td  class="radeyeTable2Odd" align="right">10.3</td>
<td  class="radeyeTable2Odd" align="right">1.10</td>
<td  class="radeyeTable3Odd" align="right">.711</td>
<td  class="radeyeTable3Odd" align="right">.202</td>
<td  class="radeyeTable3Odd" align="right">.113</td>
<td  class="radeyeTable3Odd" align="right">.080</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=142795">Joe</a></td>
<td  class="radeyeTable1Even" align="right">2306</td>
<td  class="radeyeTable1Even" align="right">327</td>
<td  class="radeyeTable1Even" align="right">$198.68</td>
<td  class="radeyeTable1Even" align="right">96.3</td>
<td  class="radeyeTable2Even" align="right">83.9</td>
<td  class="radeyeTable2Even" align="right">53.9</td>
<td  class="radeyeTable2Even" align="right">7.46</td>
<td  class="radeyeTable2Even" align="right">.123</td>
<td  class="radeyeTable3Even" align="right">.091</td>
<td  class="radeyeTable3Even" align="right">.025</td>
<td  class="radeyeTable3Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=287979">Oblok</a></td>
<td  class="radeyeTable1Odd" align="right">2299</td>
<td  class="radeyeTable1Odd" align="right">496</td>
<td  class="radeyeTable1Odd" align="right">$207.80</td>
<td  class="radeyeTable1Odd" align="right">87.7</td>
<td  class="radeyeTable2Odd" align="right">67.5</td>
<td  class="radeyeTable2Odd" align="right">39.7</td>
<td  class="radeyeTable2Odd" align="right">9.09</td>
<td  class="radeyeTable2Odd" align="right">.461</td>
<td  class="radeyeTable3Odd" align="right">.322</td>
<td  class="radeyeTable3Odd" align="right">.089</td>
<td  class="radeyeTable3Odd" align="right">.036</td>
<td  class="radeyeTable3Odd" align="right">.013</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=156216">daveagp</a></td>
<td  class="radeyeTable1Even" align="right">2283</td>
<td  class="radeyeTable1Even" align="right">550</td>
<td  class="radeyeTable1Even" align="right">$200.23</td>
<td  class="radeyeTable1Even" align="right">84.6</td>
<td  class="radeyeTable2Even" align="right">62.4</td>
<td  class="radeyeTable2Even" align="right">35.5</td>
<td  class="radeyeTable2Even" align="right">8.59</td>
<td  class="radeyeTable2Even" align="right">.511</td>
<td  class="radeyeTable3Even" align="right">.353</td>
<td  class="radeyeTable3Even" align="right">.095</td>
<td  class="radeyeTable3Even" align="right">.043</td>
<td  class="radeyeTable3Even" align="right">.020</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=261024">grotmol</a></td>
<td  class="radeyeTable1Odd" align="right">2277</td>
<td  class="radeyeTable1Odd" align="right">410</td>
<td  class="radeyeTable1Odd" align="right">$182.35</td>
<td  class="radeyeTable1Odd" align="right">91.2</td>
<td  class="radeyeTable2Odd" align="right">72.7</td>
<td  class="radeyeTable2Odd" align="right">42.7</td>
<td  class="radeyeTable2Odd" align="right">7.32</td>
<td  class="radeyeTable2Odd" align="right">.197</td>
<td  class="radeyeTable3Odd" align="right">.144</td>
<td  class="radeyeTable3Odd" align="right">.039</td>
<td  class="radeyeTable3Odd" align="right">.012</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=273217">schveiguy</a></td>
<td  class="radeyeTable1Even" align="right">2272</td>
<td  class="radeyeTable1Even" align="right">300</td>
<td  class="radeyeTable1Even" align="right">$169.18</td>
<td  class="radeyeTable1Even" align="right">96.6</td>
<td  class="radeyeTable2Even" align="right">84.0</td>
<td  class="radeyeTable2Even" align="right">51.3</td>
<td  class="radeyeTable2Even" align="right">5.04</td>
<td  class="radeyeTable2Even" align="right">.047</td>
<td  class="radeyeTable3Even" align="right">.036</td>
<td  class="radeyeTable3Even" align="right">.009</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=158658">ntrhieu</a></td>
<td  class="radeyeTable1Odd" align="right">2266</td>
<td  class="radeyeTable1Odd" align="right">473</td>
<td  class="radeyeTable1Odd" align="right">$178.73</td>
<td  class="radeyeTable1Odd" align="right">87.4</td>
<td  class="radeyeTable2Odd" align="right">66.3</td>
<td  class="radeyeTable2Odd" align="right">37.5</td>
<td  class="radeyeTable2Odd" align="right">7.44</td>
<td  class="radeyeTable2Odd" align="right">.282</td>
<td  class="radeyeTable3Odd" align="right">.202</td>
<td  class="radeyeTable3Odd" align="right">.054</td>
<td  class="radeyeTable3Odd" align="right">.020</td>
<td  class="radeyeTable3Odd" align="right">.006</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=278342">adic</a></td>
<td  class="radeyeTable1Even" align="right">2257</td>
<td  class="radeyeTable1Even" align="right">356</td>
<td  class="radeyeTable1Even" align="right">$164.36</td>
<td  class="radeyeTable1Even" align="right">93.3</td>
<td  class="radeyeTable2Even" align="right">76.3</td>
<td  class="radeyeTable2Even" align="right">44.1</td>
<td  class="radeyeTable2Even" align="right">5.62</td>
<td  class="radeyeTable2Even" align="right">.081</td>
<td  class="radeyeTable3Even" align="right">.062</td>
<td  class="radeyeTable3Even" align="right">.015</td>
<td  class="radeyeTable3Even" align="right">.004</td>
<td  class="radeyeTable3Even" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=274498">O_O</a></td>
<td  class="radeyeTable1Odd" align="right">2246</td>
<td  class="radeyeTable1Odd" align="right">364</td>
<td  class="radeyeTable1Odd" align="right">$157.45</td>
<td  class="radeyeTable1Odd" align="right">92.4</td>
<td  class="radeyeTable2Odd" align="right">74.3</td>
<td  class="radeyeTable2Odd" align="right">41.9</td>
<td  class="radeyeTable2Odd" align="right">5.27</td>
<td  class="radeyeTable2Odd" align="right">.078</td>
<td  class="radeyeTable3Odd" align="right">.059</td>
<td  class="radeyeTable3Odd" align="right">.015</td>
<td  class="radeyeTable3Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=158837">axch</a></td>
<td  class="radeyeTable1Even" align="right">2235</td>
<td  class="radeyeTable1Even" align="right">363</td>
<td  class="radeyeTable1Even" align="right">$150.38</td>
<td  class="radeyeTable1Even" align="right">92.1</td>
<td  class="radeyeTable2Even" align="right">73.3</td>
<td  class="radeyeTable2Even" align="right">40.4</td>
<td  class="radeyeTable2Even" align="right">4.83</td>
<td  class="radeyeTable2Even" align="right">.062</td>
<td  class="radeyeTable3Even" align="right">.047</td>
<td  class="radeyeTable3Even" align="right">.011</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=269788">Maris</a></td>
<td  class="radeyeTable1Odd" align="right">2229</td>
<td  class="radeyeTable1Odd" align="right">305</td>
<td  class="radeyeTable1Odd" align="right">$142.81</td>
<td  class="radeyeTable1Odd" align="right">95.1</td>
<td  class="radeyeTable2Odd" align="right">79.2</td>
<td  class="radeyeTable2Odd" align="right">43.9</td>
<td  class="radeyeTable2Odd" align="right">3.49</td>
<td  class="radeyeTable2Odd" align="right">.023</td>
<td  class="radeyeTable3Odd" align="right">.018</td>
<td  class="radeyeTable3Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=156592">benetin</a></td>
<td  class="radeyeTable1Even" align="right">2222</td>
<td  class="radeyeTable1Even" align="right">364</td>
<td  class="radeyeTable1Even" align="right">$142.62</td>
<td  class="radeyeTable1Even" align="right">91.5</td>
<td  class="radeyeTable2Even" align="right">71.8</td>
<td  class="radeyeTable2Even" align="right">38.6</td>
<td  class="radeyeTable2Even" align="right">4.36</td>
<td  class="radeyeTable2Even" align="right">.052</td>
<td  class="radeyeTable3Even" align="right">.041</td>
<td  class="radeyeTable3Even" align="right">.009</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=107835">sjelkjd</a></td>
<td  class="radeyeTable1Odd" align="right">2221</td>
<td  class="radeyeTable1Odd" align="right">298</td>
<td  class="radeyeTable1Odd" align="right">$137.68</td>
<td  class="radeyeTable1Odd" align="right">95.2</td>
<td  class="radeyeTable2Odd" align="right">79.1</td>
<td  class="radeyeTable2Odd" align="right">43.1</td>
<td  class="radeyeTable2Odd" align="right">3.08</td>
<td  class="radeyeTable2Odd" align="right">.017</td>
<td  class="radeyeTable3Odd" align="right">.013</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextRed" href="/stat?c=member_profile&amp;cr=112902">Logan</a></td>
<td  class="radeyeTable1Even" align="right">2203</td>
<td  class="radeyeTable1Even" align="right">475</td>
<td  class="radeyeTable1Even" align="right">$137.90</td>
<td  class="radeyeTable1Even" align="right">84.4</td>
<td  class="radeyeTable2Even" align="right">60.2</td>
<td  class="radeyeTable2Even" align="right">30.8</td>
<td  class="radeyeTable2Even" align="right">5.09</td>
<td  class="radeyeTable2Even" align="right">.134</td>
<td  class="radeyeTable3Even" align="right">.099</td>
<td  class="radeyeTable3Even" align="right">.025</td>
<td  class="radeyeTable3Even" align="right">.009</td>
<td  class="radeyeTable3Even" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309453">Jan_Kuipers</a></td>
<td  class="radeyeTable1Odd" align="right">2193</td>
<td  class="radeyeTable1Odd" align="right">555</td>
<td  class="radeyeTable1Odd" align="right">$138.30</td>
<td  class="radeyeTable1Odd" align="right">80.1</td>
<td  class="radeyeTable2Odd" align="right">54.4</td>
<td  class="radeyeTable2Odd" align="right">27.4</td>
<td  class="radeyeTable2Odd" align="right">5.36</td>
<td  class="radeyeTable2Odd" align="right">.215</td>
<td  class="radeyeTable3Odd" align="right">.153</td>
<td  class="radeyeTable3Odd" align="right">.039</td>
<td  class="radeyeTable3Odd" align="right">.015</td>
<td  class="radeyeTable3Odd" align="right">.007</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299177">vorthys</a></td>
<td  class="radeyeTable1Even" align="right">2190</td>
<td  class="radeyeTable1Even" align="right">279</td>
<td  class="radeyeTable1Even" align="right">$121.25</td>
<td  class="radeyeTable1Even" align="right">95.3</td>
<td  class="radeyeTable2Even" align="right">78.1</td>
<td  class="radeyeTable2Even" align="right">39.4</td>
<td  class="radeyeTable2Even" align="right">1.89</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable3Even" align="right">.004</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=252076">Wasteland</a></td>
<td  class="radeyeTable1Odd" align="right">2189</td>
<td  class="radeyeTable1Odd" align="right">380</td>
<td  class="radeyeTable1Odd" align="right">$125.27</td>
<td  class="radeyeTable1Odd" align="right">89.0</td>
<td  class="radeyeTable2Odd" align="right">66.6</td>
<td  class="radeyeTable2Odd" align="right">33.3</td>
<td  class="radeyeTable2Odd" align="right">3.52</td>
<td  class="radeyeTable2Odd" align="right">.038</td>
<td  class="radeyeTable3Odd" align="right">.030</td>
<td  class="radeyeTable3Odd" align="right">.007</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158333">dvickrey</a></td>
<td  class="radeyeTable1Even" align="right">2182</td>
<td  class="radeyeTable1Even" align="right">185</td>
<td  class="radeyeTable1Even" align="right">$117.12</td>
<td  class="radeyeTable1Even" align="right">99.3</td>
<td  class="radeyeTable2Even" align="right">90.0</td>
<td  class="radeyeTable2Even" align="right">44.0</td>
<td  class="radeyeTable2Even" align="right">.323</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263396">Abednego</a></td>
<td  class="radeyeTable1Odd" align="right">2175</td>
<td  class="radeyeTable1Odd" align="right">396</td>
<td  class="radeyeTable1Odd" align="right">$119.19</td>
<td  class="radeyeTable1Odd" align="right">87.3</td>
<td  class="radeyeTable2Odd" align="right">63.6</td>
<td  class="radeyeTable2Odd" align="right">31.0</td>
<td  class="radeyeTable2Odd" align="right">3.35</td>
<td  class="radeyeTable2Odd" align="right">.035</td>
<td  class="radeyeTable3Odd" align="right">.027</td>
<td  class="radeyeTable3Odd" align="right">.006</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=279471">haha</a></td>
<td  class="radeyeTable1Even" align="right">2172</td>
<td  class="radeyeTable1Even" align="right">384</td>
<td  class="radeyeTable1Even" align="right">$117.69</td>
<td  class="radeyeTable1Even" align="right">87.9</td>
<td  class="radeyeTable2Even" align="right">64.3</td>
<td  class="radeyeTable2Even" align="right">31.1</td>
<td  class="radeyeTable2Even" align="right">3.16</td>
<td  class="radeyeTable2Even" align="right">.029</td>
<td  class="radeyeTable3Even" align="right">.023</td>
<td  class="radeyeTable3Even" align="right">.005</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7281980">eldering</a></td>
<td  class="radeyeTable1Odd" align="right">2171</td>
<td  class="radeyeTable1Odd" align="right">444</td>
<td  class="radeyeTable1Odd" align="right">$119.86</td>
<td  class="radeyeTable1Odd" align="right">84.4</td>
<td  class="radeyeTable2Odd" align="right">59.2</td>
<td  class="radeyeTable2Odd" align="right">28.7</td>
<td  class="radeyeTable2Odd" align="right">3.81</td>
<td  class="radeyeTable2Odd" align="right">.064</td>
<td  class="radeyeTable3Odd" align="right">.050</td>
<td  class="radeyeTable3Odd" align="right">.011</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156804">Zaen</a></td>
<td  class="radeyeTable1Even" align="right">2161</td>
<td  class="radeyeTable1Even" align="right">305</td>
<td  class="radeyeTable1Even" align="right">$109.32</td>
<td  class="radeyeTable1Even" align="right">92.4</td>
<td  class="radeyeTable2Even" align="right">71.2</td>
<td  class="radeyeTable2Even" align="right">33.2</td>
<td  class="radeyeTable2Even" align="right">1.73</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.005</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=261567">gilbert</a></td>
<td  class="radeyeTable1Odd" align="right">2161</td>
<td  class="radeyeTable1Odd" align="right">236</td>
<td  class="radeyeTable1Odd" align="right">$108.31</td>
<td  class="radeyeTable1Odd" align="right">96.8</td>
<td  class="radeyeTable2Odd" align="right">80.3</td>
<td  class="radeyeTable2Odd" align="right">36.6</td>
<td  class="radeyeTable2Odd" align="right">.732</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154089">milhouse</a></td>
<td  class="radeyeTable1Even" align="right">2158</td>
<td  class="radeyeTable1Even" align="right">518</td>
<td  class="radeyeTable1Even" align="right">$117.57</td>
<td  class="radeyeTable1Even" align="right">79.9</td>
<td  class="radeyeTable2Even" align="right">53.3</td>
<td  class="radeyeTable2Even" align="right">25.4</td>
<td  class="radeyeTable2Even" align="right">4.10</td>
<td  class="radeyeTable2Even" align="right">.105</td>
<td  class="radeyeTable3Even" align="right">.077</td>
<td  class="radeyeTable3Even" align="right">.019</td>
<td  class="radeyeTable3Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.003</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154754">Ken Vogel</a></td>
<td  class="radeyeTable1Odd" align="right">2155</td>
<td  class="radeyeTable1Odd" align="right">290</td>
<td  class="radeyeTable1Odd" align="right">$106.51</td>
<td  class="radeyeTable1Odd" align="right">93.2</td>
<td  class="radeyeTable2Odd" align="right">72.3</td>
<td  class="radeyeTable2Odd" align="right">33.0</td>
<td  class="radeyeTable2Odd" align="right">1.40</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=105922">qubits</a></td>
<td  class="radeyeTable1Even" align="right">2153</td>
<td  class="radeyeTable1Even" align="right">357</td>
<td  class="radeyeTable1Even" align="right">$107.66</td>
<td  class="radeyeTable1Even" align="right">88.5</td>
<td  class="radeyeTable2Even" align="right">64.6</td>
<td  class="radeyeTable2Even" align="right">29.8</td>
<td  class="radeyeTable2Even" align="right">2.30</td>
<td  class="radeyeTable2Even" align="right">.014</td>
<td  class="radeyeTable3Even" align="right">.011</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299709">Modulator</a></td>
<td  class="radeyeTable1Odd" align="right">2150</td>
<td  class="radeyeTable1Odd" align="right">265</td>
<td  class="radeyeTable1Odd" align="right">$104.11</td>
<td  class="radeyeTable1Odd" align="right">94.6</td>
<td  class="radeyeTable2Odd" align="right">74.8</td>
<td  class="radeyeTable2Odd" align="right">33.2</td>
<td  class="radeyeTable2Odd" align="right">.976</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308453">overwise</a></td>
<td  class="radeyeTable1Even" align="right">2144</td>
<td  class="radeyeTable1Even" align="right">479</td>
<td  class="radeyeTable1Even" align="right">$109.25</td>
<td  class="radeyeTable1Even" align="right">81.0</td>
<td  class="radeyeTable2Even" align="right">54.2</td>
<td  class="radeyeTable2Even" align="right">25.1</td>
<td  class="radeyeTable2Even" align="right">3.45</td>
<td  class="radeyeTable2Even" align="right">.061</td>
<td  class="radeyeTable3Even" align="right">.046</td>
<td  class="radeyeTable3Even" align="right">.011</td>
<td  class="radeyeTable3Even" align="right">.004</td>
<td  class="radeyeTable3Even" align="right">.001</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273112">WhiteShadow</a></td>
<td  class="radeyeTable1Odd" align="right">2136</td>
<td  class="radeyeTable1Odd" align="right">339</td>
<td  class="radeyeTable1Odd" align="right">$100.16</td>
<td  class="radeyeTable1Odd" align="right">88.8</td>
<td  class="radeyeTable2Odd" align="right">64.2</td>
<td  class="radeyeTable2Odd" align="right">28.2</td>
<td  class="radeyeTable2Odd" align="right">1.75</td>
<td  class="radeyeTable2Odd" align="right">.006</td>
<td  class="radeyeTable3Odd" align="right">.005</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262056">mathijs</a></td>
<td  class="radeyeTable1Even" align="right">2125</td>
<td  class="radeyeTable1Even" align="right">664</td>
<td  class="radeyeTable1Even" align="right">$114.28</td>
<td  class="radeyeTable1Even" align="right">72.8</td>
<td  class="radeyeTable2Even" align="right">44.6</td>
<td  class="radeyeTable2Even" align="right">20.6</td>
<td  class="radeyeTable2Even" align="right">4.24</td>
<td  class="radeyeTable2Even" align="right">.198</td>
<td  class="radeyeTable3Even" align="right">.143</td>
<td  class="radeyeTable3Even" align="right">.031</td>
<td  class="radeyeTable3Even" align="right">.015</td>
<td  class="radeyeTable3Even" align="right">.009</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=265736">Ken Alverson</a></td>
<td  class="radeyeTable1Odd" align="right">2120</td>
<td  class="radeyeTable1Odd" align="right">290</td>
<td  class="radeyeTable1Odd" align="right">$93.32</td>
<td  class="radeyeTable1Odd" align="right">91.4</td>
<td  class="radeyeTable2Odd" align="right">67.5</td>
<td  class="radeyeTable2Odd" align="right">27.5</td>
<td  class="radeyeTable2Odd" align="right">.911</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307070">qsort</a></td>
<td  class="radeyeTable1Even" align="right">2117</td>
<td  class="radeyeTable1Even" align="right">429</td>
<td  class="radeyeTable1Even" align="right">$96.21</td>
<td  class="radeyeTable1Even" align="right">82.1</td>
<td  class="radeyeTable2Even" align="right">54.6</td>
<td  class="radeyeTable2Even" align="right">23.7</td>
<td  class="radeyeTable2Even" align="right">2.40</td>
<td  class="radeyeTable2Even" align="right">.023</td>
<td  class="radeyeTable3Even" align="right">.018</td>
<td  class="radeyeTable3Even" align="right">.004</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263379">StefanPochmann</a></td>
<td  class="radeyeTable1Odd" align="right">2116</td>
<td  class="radeyeTable1Odd" align="right">598</td>
<td  class="radeyeTable1Odd" align="right">$105.18</td>
<td  class="radeyeTable1Odd" align="right">74.4</td>
<td  class="radeyeTable2Odd" align="right">46.1</td>
<td  class="radeyeTable2Odd" align="right">20.8</td>
<td  class="radeyeTable2Odd" align="right">3.70</td>
<td  class="radeyeTable2Odd" align="right">.119</td>
<td  class="radeyeTable3Odd" align="right">.088</td>
<td  class="radeyeTable3Odd" align="right">.019</td>
<td  class="radeyeTable3Odd" align="right">.008</td>
<td  class="radeyeTable3Odd" align="right">.004</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=284007">Ryan</a></td>
<td  class="radeyeTable1Even" align="right">2111</td>
<td  class="radeyeTable1Even" align="right">321</td>
<td  class="radeyeTable1Even" align="right">$90.34</td>
<td  class="radeyeTable1Even" align="right">88.6</td>
<td  class="radeyeTable2Even" align="right">62.8</td>
<td  class="radeyeTable2Even" align="right">25.5</td>
<td  class="radeyeTable2Even" align="right">1.13</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=267834">halflife</a></td>
<td  class="radeyeTable1Odd" align="right">2088</td>
<td  class="radeyeTable1Odd" align="right">326</td>
<td  class="radeyeTable1Odd" align="right">$82.81</td>
<td  class="radeyeTable1Odd" align="right">86.8</td>
<td  class="radeyeTable2Odd" align="right">59.1</td>
<td  class="radeyeTable2Odd" align="right">22.4</td>
<td  class="radeyeTable2Odd" align="right">.903</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310333">kalinov</a></td>
<td  class="radeyeTable1Even" align="right">2088</td>
<td  class="radeyeTable1Even" align="right">330</td>
<td  class="radeyeTable1Even" align="right">$82.91</td>
<td  class="radeyeTable1Even" align="right">86.5</td>
<td  class="radeyeTable2Even" align="right">58.7</td>
<td  class="radeyeTable2Even" align="right">22.3</td>
<td  class="radeyeTable2Even" align="right">.954</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152340">jshute</a></td>
<td  class="radeyeTable1Odd" align="right">2074</td>
<td  class="radeyeTable1Odd" align="right">289</td>
<td  class="radeyeTable1Odd" align="right">$78.49</td>
<td  class="radeyeTable1Odd" align="right">88.7</td>
<td  class="radeyeTable2Odd" align="right">60.7</td>
<td  class="radeyeTable2Odd" align="right">21.1</td>
<td  class="radeyeTable2Odd" align="right">.482</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307169">Fluff</a></td>
<td  class="radeyeTable1Even" align="right">2056</td>
<td  class="radeyeTable1Even" align="right">504</td>
<td  class="radeyeTable1Even" align="right">$79.31</td>
<td  class="radeyeTable1Even" align="right">74.6</td>
<td  class="radeyeTable2Even" align="right">44.4</td>
<td  class="radeyeTable2Even" align="right">17.6</td>
<td  class="radeyeTable2Even" align="right">2.00</td>
<td  class="radeyeTable2Even" align="right">.025</td>
<td  class="radeyeTable3Even" align="right">.020</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=114443">jonmac</a></td>
<td  class="radeyeTable1Odd" align="right">2053</td>
<td  class="radeyeTable1Odd" align="right">583</td>
<td  class="radeyeTable1Odd" align="right">$82.72</td>
<td  class="radeyeTable1Odd" align="right">71.5</td>
<td  class="radeyeTable2Odd" align="right">41.5</td>
<td  class="radeyeTable2Odd" align="right">16.9</td>
<td  class="radeyeTable2Odd" align="right">2.47</td>
<td  class="radeyeTable2Odd" align="right">.056</td>
<td  class="radeyeTable3Odd" align="right">.044</td>
<td  class="radeyeTable3Odd" align="right">.008</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=297823">madking</a></td>
<td  class="radeyeTable1Even" align="right">2047</td>
<td  class="radeyeTable1Even" align="right">287</td>
<td  class="radeyeTable1Even" align="right">$71.03</td>
<td  class="radeyeTable1Even" align="right">87.0</td>
<td  class="radeyeTable2Even" align="right">56.7</td>
<td  class="radeyeTable2Even" align="right">17.7</td>
<td  class="radeyeTable2Even" align="right">.317</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299993">cvoinescu</a></td>
<td  class="radeyeTable1Odd" align="right">2047</td>
<td  class="radeyeTable1Odd" align="right">344</td>
<td  class="radeyeTable1Odd" align="right">$71.15</td>
<td  class="radeyeTable1Odd" align="right">82.6</td>
<td  class="radeyeTable2Odd" align="right">51.9</td>
<td  class="radeyeTable2Odd" align="right">17.7</td>
<td  class="radeyeTable2Odd" align="right">.678</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251223">along</a></td>
<td  class="radeyeTable1Even" align="right">2046</td>
<td  class="radeyeTable1Even" align="right">380</td>
<td  class="radeyeTable1Even" align="right">$71.50</td>
<td  class="radeyeTable1Even" align="right">80.2</td>
<td  class="radeyeTable2Even" align="right">49.3</td>
<td  class="radeyeTable2Even" align="right">17.5</td>
<td  class="radeyeTable2Even" align="right">.923</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308657">skanthak</a></td>
<td  class="radeyeTable1Odd" align="right">2030</td>
<td  class="radeyeTable1Odd" align="right">257</td>
<td  class="radeyeTable1Odd" align="right">$67.23</td>
<td  class="radeyeTable1Odd" align="right">88.3</td>
<td  class="radeyeTable2Odd" align="right">56.9</td>
<td  class="radeyeTable2Odd" align="right">15.4</td>
<td  class="radeyeTable2Odd" align="right">.130</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263580">enderx</a></td>
<td  class="radeyeTable1Even" align="right">2025</td>
<td  class="radeyeTable1Even" align="right">589</td>
<td  class="radeyeTable1Even" align="right">$75.07</td>
<td  class="radeyeTable1Even" align="right">69.6</td>
<td  class="radeyeTable2Even" align="right">39.0</td>
<td  class="radeyeTable2Even" align="right">15.2</td>
<td  class="radeyeTable2Even" align="right">2.10</td>
<td  class="radeyeTable2Even" align="right">.044</td>
<td  class="radeyeTable3Even" align="right">.035</td>
<td  class="radeyeTable3Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=346064">TekGoNos</a></td>
<td  class="radeyeTable1Odd" align="right">2018</td>
<td  class="radeyeTable1Odd" align="right">316</td>
<td  class="radeyeTable1Odd" align="right">$63.47</td>
<td  class="radeyeTable1Odd" align="right">82.4</td>
<td  class="radeyeTable2Odd" align="right">49.7</td>
<td  class="radeyeTable2Odd" align="right">14.7</td>
<td  class="radeyeTable2Odd" align="right">.329</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7213681">wleite</a></td>
<td  class="radeyeTable1Even" align="right">2015</td>
<td  class="radeyeTable1Even" align="right">407</td>
<td  class="radeyeTable1Even" align="right">$64.33</td>
<td  class="radeyeTable1Even" align="right">76.3</td>
<td  class="radeyeTable2Even" align="right">44.1</td>
<td  class="radeyeTable2Even" align="right">14.8</td>
<td  class="radeyeTable2Even" align="right">.833</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=265545">insomnia</a></td>
<td  class="radeyeTable1Odd" align="right">2008</td>
<td  class="radeyeTable1Odd" align="right">458</td>
<td  class="radeyeTable1Odd" align="right">$64.42</td>
<td  class="radeyeTable1Odd" align="right">73.3</td>
<td  class="radeyeTable2Odd" align="right">41.3</td>
<td  class="radeyeTable2Odd" align="right">14.3</td>
<td  class="radeyeTable2Odd" align="right">1.09</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable3Odd" align="right">.005</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7390224">gawry</a></td>
<td  class="radeyeTable1Even" align="right">2008</td>
<td  class="radeyeTable1Even" align="right">523</td>
<td  class="radeyeTable1Even" align="right">$67.24</td>
<td  class="radeyeTable1Even" align="right">70.7</td>
<td  class="radeyeTable2Even" align="right">39.3</td>
<td  class="radeyeTable2Even" align="right">14.3</td>
<td  class="radeyeTable2Even" align="right">1.49</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable3Even" align="right">.014</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310430">gepa</a></td>
<td  class="radeyeTable1Odd" align="right">2007</td>
<td  class="radeyeTable1Odd" align="right">670</td>
<td  class="radeyeTable1Odd" align="right">$74.91</td>
<td  class="radeyeTable1Odd" align="right">66.4</td>
<td  class="radeyeTable2Odd" align="right">36.1</td>
<td  class="radeyeTable2Odd" align="right">14.2</td>
<td  class="radeyeTable2Odd" align="right">2.27</td>
<td  class="radeyeTable2Odd" align="right">.068</td>
<td  class="radeyeTable3Odd" align="right">.052</td>
<td  class="radeyeTable3Odd" align="right">.010</td>
<td  class="radeyeTable3Odd" align="right">.005</td>
<td  class="radeyeTable3Odd" align="right">.003</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=155815">space</a></td>
<td  class="radeyeTable1Even" align="right">2006</td>
<td  class="radeyeTable1Even" align="right">306</td>
<td  class="radeyeTable1Even" align="right">$60.76</td>
<td  class="radeyeTable1Even" align="right">82.2</td>
<td  class="radeyeTable2Even" align="right">48.6</td>
<td  class="radeyeTable2Even" align="right">13.5</td>
<td  class="radeyeTable2Even" align="right">.241</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7446406">hgliebe</a></td>
<td  class="radeyeTable1Odd" align="right">2005</td>
<td  class="radeyeTable1Odd" align="right">537</td>
<td  class="radeyeTable1Odd" align="right">$67.20</td>
<td  class="radeyeTable1Odd" align="right">70.1</td>
<td  class="radeyeTable2Odd" align="right">38.6</td>
<td  class="radeyeTable2Odd" align="right">14.2</td>
<td  class="radeyeTable2Odd" align="right">1.54</td>
<td  class="radeyeTable2Odd" align="right">.020</td>
<td  class="radeyeTable3Odd" align="right">.016</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299706">cruizza</a></td>
<td  class="radeyeTable1Even" align="right">1993</td>
<td  class="radeyeTable1Even" align="right">300</td>
<td  class="radeyeTable1Even" align="right">$57.86</td>
<td  class="radeyeTable1Even" align="right">81.5</td>
<td  class="radeyeTable2Even" align="right">47.0</td>
<td  class="radeyeTable2Even" align="right">12.2</td>
<td  class="radeyeTable2Even" align="right">.179</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7428266">Klinck</a></td>
<td  class="radeyeTable1Odd" align="right">1992</td>
<td  class="radeyeTable1Odd" align="right">245</td>
<td  class="radeyeTable1Odd" align="right">$58.63</td>
<td  class="radeyeTable1Odd" align="right">86.3</td>
<td  class="radeyeTable2Odd" align="right">51.1</td>
<td  class="radeyeTable2Odd" align="right">11.0</td>
<td  class="radeyeTable2Odd" align="right">.049</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269057">Slamin</a></td>
<td  class="radeyeTable1Even" align="right">1991</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$57.41</td>
<td  class="radeyeTable1Even" align="right">81.3</td>
<td  class="radeyeTable2Even" align="right">46.6</td>
<td  class="radeyeTable2Even" align="right">12.0</td>
<td  class="radeyeTable2Even" align="right">.174</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=108262">mathgodleo</a></td>
<td  class="radeyeTable1Odd" align="right">1988</td>
<td  class="radeyeTable1Odd" align="right">308</td>
<td  class="radeyeTable1Odd" align="right">$56.76</td>
<td  class="radeyeTable1Odd" align="right">80.5</td>
<td  class="radeyeTable2Odd" align="right">45.7</td>
<td  class="radeyeTable2Odd" align="right">11.9</td>
<td  class="radeyeTable2Odd" align="right">.190</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=111202">ColinMacLeod</a></td>
<td  class="radeyeTable1Even" align="right">1986</td>
<td  class="radeyeTable1Even" align="right">439</td>
<td  class="radeyeTable1Even" align="right">$58.72</td>
<td  class="radeyeTable1Even" align="right">72.6</td>
<td  class="radeyeTable2Even" align="right">39.6</td>
<td  class="radeyeTable2Even" align="right">12.8</td>
<td  class="radeyeTable2Even" align="right">.792</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289706">mickle</a></td>
<td  class="radeyeTable1Odd" align="right">1979</td>
<td  class="radeyeTable1Odd" align="right">308</td>
<td  class="radeyeTable1Odd" align="right">$54.82</td>
<td  class="radeyeTable1Odd" align="right">79.7</td>
<td  class="radeyeTable2Odd" align="right">44.3</td>
<td  class="radeyeTable2Odd" align="right">11.1</td>
<td  class="radeyeTable2Odd" align="right">.164</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309786">Yi_Zhang</a></td>
<td  class="radeyeTable1Even" align="right">1979</td>
<td  class="radeyeTable1Even" align="right">287</td>
<td  class="radeyeTable1Even" align="right">$54.92</td>
<td  class="radeyeTable1Even" align="right">81.3</td>
<td  class="radeyeTable2Even" align="right">45.6</td>
<td  class="radeyeTable2Even" align="right">10.7</td>
<td  class="radeyeTable2Even" align="right">.104</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058174">Parchandri</a></td>
<td  class="radeyeTable1Odd" align="right">1975</td>
<td  class="radeyeTable1Odd" align="right">599</td>
<td  class="radeyeTable1Odd" align="right">$63.19</td>
<td  class="radeyeTable1Odd" align="right">66.3</td>
<td  class="radeyeTable2Odd" align="right">34.9</td>
<td  class="radeyeTable2Odd" align="right">12.6</td>
<td  class="radeyeTable2Odd" align="right">1.57</td>
<td  class="radeyeTable2Odd" align="right">.025</td>
<td  class="radeyeTable3Odd" align="right">.020</td>
<td  class="radeyeTable3Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=276749">jonderry</a></td>
<td  class="radeyeTable1Even" align="right">1974</td>
<td  class="radeyeTable1Even" align="right">242</td>
<td  class="radeyeTable1Even" align="right">$54.68</td>
<td  class="radeyeTable1Even" align="right">85.0</td>
<td  class="radeyeTable2Even" align="right">47.9</td>
<td  class="radeyeTable2Even" align="right">9.20</td>
<td  class="radeyeTable2Even" align="right">.029</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2059666">frane</a></td>
<td  class="radeyeTable1Odd" align="right">1970</td>
<td  class="radeyeTable1Odd" align="right">370</td>
<td  class="radeyeTable1Odd" align="right">$53.51</td>
<td  class="radeyeTable1Odd" align="right">74.8</td>
<td  class="radeyeTable2Odd" align="right">40.2</td>
<td  class="radeyeTable2Odd" align="right">11.2</td>
<td  class="radeyeTable2Odd" align="right">.350</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154648">dana</a></td>
<td  class="radeyeTable1Even" align="right">1968</td>
<td  class="radeyeTable1Even" align="right">293</td>
<td  class="radeyeTable1Even" align="right">$52.67</td>
<td  class="radeyeTable1Even" align="right">79.8</td>
<td  class="radeyeTable2Even" align="right">43.5</td>
<td  class="radeyeTable2Even" align="right">9.94</td>
<td  class="radeyeTable2Even" align="right">.101</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7210680">cnettel</a></td>
<td  class="radeyeTable1Odd" align="right">1966</td>
<td  class="radeyeTable1Odd" align="right">340</td>
<td  class="radeyeTable1Odd" align="right">$52.29</td>
<td  class="radeyeTable1Odd" align="right">76.2</td>
<td  class="radeyeTable2Odd" align="right">40.9</td>
<td  class="radeyeTable2Odd" align="right">10.5</td>
<td  class="radeyeTable2Odd" align="right">.230</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=129196">alexcchan</a></td>
<td  class="radeyeTable1Even" align="right">1964</td>
<td  class="radeyeTable1Even" align="right">201</td>
<td  class="radeyeTable1Even" align="right">$53.57</td>
<td  class="radeyeTable1Even" align="right">88.4</td>
<td  class="radeyeTable2Even" align="right">49.2</td>
<td  class="radeyeTable2Even" align="right">6.83</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159166">redman</a></td>
<td  class="radeyeTable1Odd" align="right">1962</td>
<td  class="radeyeTable1Odd" align="right">430</td>
<td  class="radeyeTable1Odd" align="right">$53.41</td>
<td  class="radeyeTable1Odd" align="right">71.1</td>
<td  class="radeyeTable2Odd" align="right">37.3</td>
<td  class="radeyeTable2Odd" align="right">11.2</td>
<td  class="radeyeTable2Odd" align="right">.579</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=286022">NeonElephant</a></td>
<td  class="radeyeTable1Even" align="right">1957</td>
<td  class="radeyeTable1Even" align="right">259</td>
<td  class="radeyeTable1Even" align="right">$50.82</td>
<td  class="radeyeTable1Even" align="right">81.6</td>
<td  class="radeyeTable2Even" align="right">43.6</td>
<td  class="radeyeTable2Even" align="right">8.25</td>
<td  class="radeyeTable2Even" align="right">.035</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7432882">mlcastle</a></td>
<td  class="radeyeTable1Odd" align="right">1957</td>
<td  class="radeyeTable1Odd" align="right">380</td>
<td  class="radeyeTable1Odd" align="right">$51.15</td>
<td  class="radeyeTable1Odd" align="right">73.1</td>
<td  class="radeyeTable2Odd" align="right">38.2</td>
<td  class="radeyeTable2Odd" align="right">10.4</td>
<td  class="radeyeTable2Odd" align="right">.337</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=308953">MikeMirzayanov</a></td>
<td  class="radeyeTable1Even" align="right">1951</td>
<td  class="radeyeTable1Even" align="right">337</td>
<td  class="radeyeTable1Even" align="right">$49.43</td>
<td  class="radeyeTable1Even" align="right">75.0</td>
<td  class="radeyeTable2Even" align="right">38.9</td>
<td  class="radeyeTable2Even" align="right">9.43</td>
<td  class="radeyeTable2Even" align="right">.178</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=264949">moira</a></td>
<td  class="radeyeTable1Odd" align="right">1944</td>
<td  class="radeyeTable1Odd" align="right">431</td>
<td  class="radeyeTable1Odd" align="right">$50.09</td>
<td  class="radeyeTable1Odd" align="right">69.6</td>
<td  class="radeyeTable2Odd" align="right">35.4</td>
<td  class="radeyeTable2Odd" align="right">10.1</td>
<td  class="radeyeTable2Odd" align="right">.490</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=151418">ChaiBot</a></td>
<td  class="radeyeTable1Even" align="right">1942</td>
<td  class="radeyeTable1Even" align="right">611</td>
<td  class="radeyeTable1Even" align="right">$57.20</td>
<td  class="radeyeTable1Even" align="right">64.0</td>
<td  class="radeyeTable2Even" align="right">32.3</td>
<td  class="radeyeTable2Even" align="right">11.1</td>
<td  class="radeyeTable2Even" align="right">1.31</td>
<td  class="radeyeTable2Even" align="right">.021</td>
<td  class="radeyeTable3Even" align="right">.017</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273025">frypan</a></td>
<td  class="radeyeTable1Odd" align="right">1939</td>
<td  class="radeyeTable1Odd" align="right">302</td>
<td  class="radeyeTable1Odd" align="right">$47.01</td>
<td  class="radeyeTable1Odd" align="right">76.2</td>
<td  class="radeyeTable2Odd" align="right">38.5</td>
<td  class="radeyeTable2Odd" align="right">7.95</td>
<td  class="radeyeTable2Odd" align="right">.076</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152342">kyky</a></td>
<td  class="radeyeTable1Even" align="right">1934</td>
<td  class="radeyeTable1Even" align="right">290</td>
<td  class="radeyeTable1Even" align="right">$46.09</td>
<td  class="radeyeTable1Even" align="right">76.6</td>
<td  class="radeyeTable2Even" align="right">38.2</td>
<td  class="radeyeTable2Even" align="right">7.33</td>
<td  class="radeyeTable2Even" align="right">.051</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=266571">jburnim</a></td>
<td  class="radeyeTable1Odd" align="right">1932</td>
<td  class="radeyeTable1Odd" align="right">401</td>
<td  class="radeyeTable1Odd" align="right">$47.03</td>
<td  class="radeyeTable1Odd" align="right">69.8</td>
<td  class="radeyeTable2Odd" align="right">34.7</td>
<td  class="radeyeTable2Odd" align="right">9.07</td>
<td  class="radeyeTable2Odd" align="right">.315</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307060">AdrianKuegel</a></td>
<td  class="radeyeTable1Even" align="right">1929</td>
<td  class="radeyeTable1Even" align="right">716</td>
<td  class="radeyeTable1Even" align="right">$60.21</td>
<td  class="radeyeTable1Even" align="right">61.4</td>
<td  class="radeyeTable2Even" align="right">30.5</td>
<td  class="radeyeTable2Even" align="right">11.0</td>
<td  class="radeyeTable2Even" align="right">1.65</td>
<td  class="radeyeTable2Even" align="right">.047</td>
<td  class="radeyeTable3Even" align="right">.037</td>
<td  class="radeyeTable3Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.002</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158301">mmsa</a></td>
<td  class="radeyeTable1Odd" align="right">1927</td>
<td  class="radeyeTable1Odd" align="right">275</td>
<td  class="radeyeTable1Odd" align="right">$45.00</td>
<td  class="radeyeTable1Odd" align="right">77.1</td>
<td  class="radeyeTable2Odd" align="right">37.7</td>
<td  class="radeyeTable2Odd" align="right">6.58</td>
<td  class="radeyeTable2Odd" align="right">.032</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=289251">ragnabot</a></td>
<td  class="radeyeTable1Even" align="right">1925</td>
<td  class="radeyeTable1Even" align="right">280</td>
<td  class="radeyeTable1Even" align="right">$44.55</td>
<td  class="radeyeTable1Even" align="right">76.4</td>
<td  class="radeyeTable2Even" align="right">37.1</td>
<td  class="radeyeTable2Even" align="right">6.55</td>
<td  class="radeyeTable2Even" align="right">.034</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260828">Larry</a></td>
<td  class="radeyeTable1Odd" align="right">1924</td>
<td  class="radeyeTable1Odd" align="right">346</td>
<td  class="radeyeTable1Odd" align="right">$44.64</td>
<td  class="radeyeTable1Odd" align="right">71.9</td>
<td  class="radeyeTable2Odd" align="right">35.0</td>
<td  class="radeyeTable2Odd" align="right">7.81</td>
<td  class="radeyeTable2Odd" align="right">.136</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=108530">dpecora</a></td>
<td  class="radeyeTable1Even" align="right">1922</td>
<td  class="radeyeTable1Even" align="right">264</td>
<td  class="radeyeTable1Even" align="right">$44.04</td>
<td  class="radeyeTable1Even" align="right">77.4</td>
<td  class="radeyeTable2Even" align="right">37.1</td>
<td  class="radeyeTable2Even" align="right">5.93</td>
<td  class="radeyeTable2Even" align="right">.019</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159100">Googly</a></td>
<td  class="radeyeTable1Odd" align="right">1919</td>
<td  class="radeyeTable1Odd" align="right">253</td>
<td  class="radeyeTable1Odd" align="right">$43.61</td>
<td  class="radeyeTable1Odd" align="right">78.0</td>
<td  class="radeyeTable2Odd" align="right">37.1</td>
<td  class="radeyeTable2Odd" align="right">5.45</td>
<td  class="radeyeTable2Odd" align="right">.013</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296745">pzhao</a></td>
<td  class="radeyeTable1Even" align="right">1917</td>
<td  class="radeyeTable1Even" align="right">406</td>
<td  class="radeyeTable1Even" align="right">$44.70</td>
<td  class="radeyeTable1Even" align="right">68.3</td>
<td  class="radeyeTable2Even" align="right">33.0</td>
<td  class="radeyeTable2Even" align="right">8.33</td>
<td  class="radeyeTable2Even" align="right">.279</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269058">jasonw</a></td>
<td  class="radeyeTable1Odd" align="right">1915</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$43.90</td>
<td  class="radeyeTable1Odd" align="right">69.1</td>
<td  class="radeyeTable2Odd" align="right">33.1</td>
<td  class="radeyeTable2Odd" align="right">7.94</td>
<td  class="radeyeTable2Odd" align="right">.217</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=152614">turuthok</a></td>
<td  class="radeyeTable1Even" align="right">1905</td>
<td  class="radeyeTable1Even" align="right">235</td>
<td  class="radeyeTable1Even" align="right">$41.19</td>
<td  class="radeyeTable1Even" align="right">77.9</td>
<td  class="radeyeTable2Even" align="right">35.0</td>
<td  class="radeyeTable2Even" align="right">4.15</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269678">Karshikinpa</a></td>
<td  class="radeyeTable1Odd" align="right">1905</td>
<td  class="radeyeTable1Odd" align="right">387</td>
<td  class="radeyeTable1Odd" align="right">$42.36</td>
<td  class="radeyeTable1Odd" align="right">68.1</td>
<td  class="radeyeTable2Odd" align="right">32.0</td>
<td  class="radeyeTable2Odd" align="right">7.45</td>
<td  class="radeyeTable2Odd" align="right">.192</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=287864">PAKETA</a></td>
<td  class="radeyeTable1Even" align="right">1902</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$40.67</td>
<td  class="radeyeTable1Even" align="right">72.3</td>
<td  class="radeyeTable2Even" align="right">33.0</td>
<td  class="radeyeTable2Even" align="right">5.71</td>
<td  class="radeyeTable2Even" align="right">.037</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293387">abiczo</a></td>
<td  class="radeyeTable1Odd" align="right">1902</td>
<td  class="radeyeTable1Odd" align="right">478</td>
<td  class="radeyeTable1Odd" align="right">$44.47</td>
<td  class="radeyeTable1Odd" align="right">64.6</td>
<td  class="radeyeTable2Odd" align="right">30.5</td>
<td  class="radeyeTable2Odd" align="right">8.38</td>
<td  class="radeyeTable2Odd" align="right">.465</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.002</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7264865">bogklug</a></td>
<td  class="radeyeTable1Even" align="right">1899</td>
<td  class="radeyeTable1Even" align="right">518</td>
<td  class="radeyeTable1Even" align="right">$45.41</td>
<td  class="radeyeTable1Even" align="right">63.3</td>
<td  class="radeyeTable2Even" align="right">29.8</td>
<td  class="radeyeTable2Even" align="right">8.61</td>
<td  class="radeyeTable2Even" align="right">.597</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7389864">roma</a></td>
<td  class="radeyeTable1Odd" align="right">1896</td>
<td  class="radeyeTable1Odd" align="right">422</td>
<td  class="radeyeTable1Odd" align="right">$41.79</td>
<td  class="radeyeTable1Odd" align="right">65.9</td>
<td  class="radeyeTable2Odd" align="right">30.5</td>
<td  class="radeyeTable2Odd" align="right">7.46</td>
<td  class="radeyeTable2Odd" align="right">.261</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159495">DrewHudson</a></td>
<td  class="radeyeTable1Even" align="right">1892</td>
<td  class="radeyeTable1Even" align="right">315</td>
<td  class="radeyeTable1Even" align="right">$39.24</td>
<td  class="radeyeTable1Even" align="right">70.4</td>
<td  class="radeyeTable2Even" align="right">31.4</td>
<td  class="radeyeTable2Even" align="right">5.53</td>
<td  class="radeyeTable2Even" align="right">.044</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158922">Revoklaw</a></td>
<td  class="radeyeTable1Odd" align="right">1887</td>
<td  class="radeyeTable1Odd" align="right">568</td>
<td  class="radeyeTable1Odd" align="right">$45.56</td>
<td  class="radeyeTable1Odd" align="right">61.3</td>
<td  class="radeyeTable2Odd" align="right">28.6</td>
<td  class="radeyeTable2Odd" align="right">8.48</td>
<td  class="radeyeTable2Odd" align="right">.723</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable3Odd" align="right">.005</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7269319">bsdude</a></td>
<td  class="radeyeTable1Even" align="right">1885</td>
<td  class="radeyeTable1Even" align="right">290</td>
<td  class="radeyeTable1Even" align="right">$37.92</td>
<td  class="radeyeTable1Even" align="right">71.1</td>
<td  class="radeyeTable2Even" align="right">30.7</td>
<td  class="radeyeTable2Even" align="right">4.62</td>
<td  class="radeyeTable2Even" align="right">.020</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274018">Alexandre</a></td>
<td  class="radeyeTable1Odd" align="right">1877</td>
<td  class="radeyeTable1Odd" align="right">417</td>
<td  class="radeyeTable1Odd" align="right">$38.94</td>
<td  class="radeyeTable1Odd" align="right">64.4</td>
<td  class="radeyeTable2Odd" align="right">28.6</td>
<td  class="radeyeTable2Odd" align="right">6.53</td>
<td  class="radeyeTable2Odd" align="right">.201</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269515">valeriy</a></td>
<td  class="radeyeTable1Even" align="right">1876</td>
<td  class="radeyeTable1Even" align="right">270</td>
<td  class="radeyeTable1Even" align="right">$36.45</td>
<td  class="radeyeTable1Even" align="right">71.4</td>
<td  class="radeyeTable2Even" align="right">29.5</td>
<td  class="radeyeTable2Even" align="right">3.75</td>
<td  class="radeyeTable2Even" align="right">.010</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293874">nicka81</a></td>
<td  class="radeyeTable1Odd" align="right">1876</td>
<td  class="radeyeTable1Odd" align="right">409</td>
<td  class="radeyeTable1Odd" align="right">$38.58</td>
<td  class="radeyeTable1Odd" align="right">64.5</td>
<td  class="radeyeTable2Odd" align="right">28.6</td>
<td  class="radeyeTable2Odd" align="right">6.39</td>
<td  class="radeyeTable2Odd" align="right">.178</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7358573">Kavan</a></td>
<td  class="radeyeTable1Even" align="right">1875</td>
<td  class="radeyeTable1Even" align="right">253</td>
<td  class="radeyeTable1Even" align="right">$36.21</td>
<td  class="radeyeTable1Even" align="right">72.5</td>
<td  class="radeyeTable2Even" align="right">29.5</td>
<td  class="radeyeTable2Even" align="right">3.29</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7398059">Jiggly</a></td>
<td  class="radeyeTable1Odd" align="right">1872</td>
<td  class="radeyeTable1Odd" align="right">271</td>
<td  class="radeyeTable1Odd" align="right">$35.85</td>
<td  class="radeyeTable1Odd" align="right">70.8</td>
<td  class="radeyeTable2Odd" align="right">28.9</td>
<td  class="radeyeTable2Odd" align="right">3.60</td>
<td  class="radeyeTable2Odd" align="right">.008</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=297005">jemann75</a></td>
<td  class="radeyeTable1Even" align="right">1869</td>
<td  class="radeyeTable1Even" align="right">255</td>
<td  class="radeyeTable1Even" align="right">$35.31</td>
<td  class="radeyeTable1Even" align="right">71.6</td>
<td  class="radeyeTable2Even" align="right">28.5</td>
<td  class="radeyeTable2Even" align="right">3.12</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277021">PurpleBob</a></td>
<td  class="radeyeTable1Odd" align="right">1858</td>
<td  class="radeyeTable1Odd" align="right">423</td>
<td  class="radeyeTable1Odd" align="right">$36.53</td>
<td  class="radeyeTable1Odd" align="right">62.5</td>
<td  class="radeyeTable2Odd" align="right">26.7</td>
<td  class="radeyeTable2Odd" align="right">5.83</td>
<td  class="radeyeTable2Odd" align="right">.172</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=293390">Jumping John</a></td>
<td  class="radeyeTable1Even" align="right">1857</td>
<td  class="radeyeTable1Even" align="right">407</td>
<td  class="radeyeTable1Even" align="right">$35.95</td>
<td  class="radeyeTable1Even" align="right">62.9</td>
<td  class="radeyeTable2Even" align="right">26.6</td>
<td  class="radeyeTable2Even" align="right">5.55</td>
<td  class="radeyeTable2Even" align="right">.137</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263371">tph</a></td>
<td  class="radeyeTable1Odd" align="right">1855</td>
<td  class="radeyeTable1Odd" align="right">304</td>
<td  class="radeyeTable1Odd" align="right">$33.73</td>
<td  class="radeyeTable1Odd" align="right">66.7</td>
<td  class="radeyeTable2Odd" align="right">26.4</td>
<td  class="radeyeTable2Odd" align="right">3.67</td>
<td  class="radeyeTable2Odd" align="right">.018</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=298761">Greyve</a></td>
<td  class="radeyeTable1Even" align="right">1853</td>
<td  class="radeyeTable1Even" align="right">234</td>
<td  class="radeyeTable1Even" align="right">$32.75</td>
<td  class="radeyeTable1Even" align="right">71.0</td>
<td  class="radeyeTable2Even" align="right">25.8</td>
<td  class="radeyeTable2Even" align="right">2.07</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7444009">achurch</a></td>
<td  class="radeyeTable1Odd" align="right">1847</td>
<td  class="radeyeTable1Odd" align="right">432</td>
<td  class="radeyeTable1Odd" align="right">$35.32</td>
<td  class="radeyeTable1Odd" align="right">61.3</td>
<td  class="radeyeTable2Odd" align="right">25.7</td>
<td  class="radeyeTable2Odd" align="right">5.51</td>
<td  class="radeyeTable2Odd" align="right">.165</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156541">SteveStern</a></td>
<td  class="radeyeTable1Even" align="right">1846</td>
<td  class="radeyeTable1Even" align="right">607</td>
<td  class="radeyeTable1Even" align="right">$41.38</td>
<td  class="radeyeTable1Even" align="right">58.0</td>
<td  class="radeyeTable2Even" align="right">25.6</td>
<td  class="radeyeTable2Even" align="right">7.34</td>
<td  class="radeyeTable2Even" align="right">.649</td>
<td  class="radeyeTable2Even" align="right">.007</td>
<td  class="radeyeTable3Even" align="right">.006</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2059354">futo</a></td>
<td  class="radeyeTable1Odd" align="right">1844</td>
<td  class="radeyeTable1Odd" align="right">453</td>
<td  class="radeyeTable1Odd" align="right">$35.56</td>
<td  class="radeyeTable1Odd" align="right">60.5</td>
<td  class="radeyeTable2Odd" align="right">25.4</td>
<td  class="radeyeTable2Odd" align="right">5.69</td>
<td  class="radeyeTable2Odd" align="right">.204</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=294543">mortijingle</a></td>
<td  class="radeyeTable1Even" align="right">1839</td>
<td  class="radeyeTable1Even" align="right">463</td>
<td  class="radeyeTable1Even" align="right">$35.33</td>
<td  class="radeyeTable1Even" align="right">59.9</td>
<td  class="radeyeTable2Even" align="right">25.0</td>
<td  class="radeyeTable2Even" align="right">5.68</td>
<td  class="radeyeTable2Even" align="right">.215</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7462279">Jwalk</a></td>
<td  class="radeyeTable1Odd" align="right">1835</td>
<td  class="radeyeTable1Odd" align="right">583</td>
<td  class="radeyeTable1Odd" align="right">$38.98</td>
<td  class="radeyeTable1Odd" align="right">57.6</td>
<td  class="radeyeTable2Odd" align="right">24.9</td>
<td  class="radeyeTable2Odd" align="right">6.76</td>
<td  class="radeyeTable2Odd" align="right">.523</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.004</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251832">dark_lord</a></td>
<td  class="radeyeTable1Even" align="right">1828</td>
<td  class="radeyeTable1Even" align="right">222</td>
<td  class="radeyeTable1Even" align="right">$29.00</td>
<td  class="radeyeTable1Even" align="right">68.1</td>
<td  class="radeyeTable2Even" align="right">21.5</td>
<td  class="radeyeTable2Even" align="right">1.21</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7271918">thooot</a></td>
<td  class="radeyeTable1Odd" align="right">1826</td>
<td  class="radeyeTable1Odd" align="right">296</td>
<td  class="radeyeTable1Odd" align="right">$29.81</td>
<td  class="radeyeTable1Odd" align="right">63.5</td>
<td  class="radeyeTable2Odd" align="right">22.6</td>
<td  class="radeyeTable2Odd" align="right">2.55</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156491">chogyonim</a></td>
<td  class="radeyeTable1Even" align="right">1822</td>
<td  class="radeyeTable1Even" align="right">572</td>
<td  class="radeyeTable1Even" align="right">$36.95</td>
<td  class="radeyeTable1Even" align="right">56.8</td>
<td  class="radeyeTable2Even" align="right">24.0</td>
<td  class="radeyeTable2Even" align="right">6.26</td>
<td  class="radeyeTable2Even" align="right">.436</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.003</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302501">PMH</a></td>
<td  class="radeyeTable1Odd" align="right">1820</td>
<td  class="radeyeTable1Odd" align="right">508</td>
<td  class="radeyeTable1Odd" align="right">$34.40</td>
<td  class="radeyeTable1Odd" align="right">57.6</td>
<td  class="radeyeTable2Odd" align="right">23.6</td>
<td  class="radeyeTable2Odd" align="right">5.53</td>
<td  class="radeyeTable2Odd" align="right">.265</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=115147">kyotov</a></td>
<td  class="radeyeTable1Even" align="right">1818</td>
<td  class="radeyeTable1Even" align="right">371</td>
<td  class="radeyeTable1Even" align="right">$30.36</td>
<td  class="radeyeTable1Even" align="right">60.0</td>
<td  class="radeyeTable2Even" align="right">22.6</td>
<td  class="radeyeTable2Even" align="right">3.63</td>
<td  class="radeyeTable2Even" align="right">.045</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=151144">shuvovse</a></td>
<td  class="radeyeTable1Odd" align="right">1817</td>
<td  class="radeyeTable1Odd" align="right">433</td>
<td  class="radeyeTable1Odd" align="right">$31.83</td>
<td  class="radeyeTable1Odd" align="right">58.6</td>
<td  class="radeyeTable2Odd" align="right">23.0</td>
<td  class="radeyeTable2Odd" align="right">4.50</td>
<td  class="radeyeTable2Odd" align="right">.118</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7212578">ellsquared</a></td>
<td  class="radeyeTable1Even" align="right">1812</td>
<td  class="radeyeTable1Even" align="right">366</td>
<td  class="radeyeTable1Even" align="right">$29.56</td>
<td  class="radeyeTable1Even" align="right">59.5</td>
<td  class="radeyeTable2Even" align="right">21.9</td>
<td  class="radeyeTable2Even" align="right">3.36</td>
<td  class="radeyeTable2Even" align="right">.036</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=306980">joeli</a></td>
<td  class="radeyeTable1Odd" align="right">1810</td>
<td  class="radeyeTable1Odd" align="right">263</td>
<td  class="radeyeTable1Odd" align="right">$27.31</td>
<td  class="radeyeTable1Odd" align="right">62.9</td>
<td  class="radeyeTable2Odd" align="right">20.0</td>
<td  class="radeyeTable2Odd" align="right">1.57</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=119676">Pops</a></td>
<td  class="radeyeTable1Even" align="right">1808</td>
<td  class="radeyeTable1Even" align="right">312</td>
<td  class="radeyeTable1Even" align="right">$27.98</td>
<td  class="radeyeTable1Even" align="right">60.7</td>
<td  class="radeyeTable2Even" align="right">20.7</td>
<td  class="radeyeTable2Even" align="right">2.38</td>
<td  class="radeyeTable2Even" align="right">.007</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150905">solman</a></td>
<td  class="radeyeTable1Odd" align="right">1804</td>
<td  class="radeyeTable1Odd" align="right">333</td>
<td  class="radeyeTable1Odd" align="right">$27.99</td>
<td  class="radeyeTable1Odd" align="right">59.6</td>
<td  class="radeyeTable2Odd" align="right">20.7</td>
<td  class="radeyeTable2Odd" align="right">2.60</td>
<td  class="radeyeTable2Odd" align="right">.016</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058177">Revenger</a></td>
<td  class="radeyeTable1Even" align="right">1800</td>
<td  class="radeyeTable1Even" align="right">417</td>
<td  class="radeyeTable1Even" align="right">$29.52</td>
<td  class="radeyeTable1Even" align="right">57.3</td>
<td  class="radeyeTable2Even" align="right">21.4</td>
<td  class="radeyeTable2Even" align="right">3.78</td>
<td  class="radeyeTable2Even" align="right">.073</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269025">assembler</a></td>
<td  class="radeyeTable1Odd" align="right">1795</td>
<td  class="radeyeTable1Odd" align="right">246</td>
<td  class="radeyeTable1Odd" align="right">$25.15</td>
<td  class="radeyeTable1Odd" align="right">61.5</td>
<td  class="radeyeTable2Odd" align="right">17.5</td>
<td  class="radeyeTable2Odd" align="right">1.02</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268720">amorosov</a></td>
<td  class="radeyeTable1Even" align="right">1794</td>
<td  class="radeyeTable1Even" align="right">312</td>
<td  class="radeyeTable1Even" align="right">$26.41</td>
<td  class="radeyeTable1Even" align="right">59.0</td>
<td  class="radeyeTable2Even" align="right">19.2</td>
<td  class="radeyeTable2Even" align="right">2.01</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268851">gladius</a></td>
<td  class="radeyeTable1Odd" align="right">1793</td>
<td  class="radeyeTable1Odd" align="right">275</td>
<td  class="radeyeTable1Odd" align="right">$25.55</td>
<td  class="radeyeTable1Odd" align="right">60.0</td>
<td  class="radeyeTable2Odd" align="right">18.2</td>
<td  class="radeyeTable2Odd" align="right">1.43</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7269116">PacerGuy</a></td>
<td  class="radeyeTable1Even" align="right">1792</td>
<td  class="radeyeTable1Even" align="right">289</td>
<td  class="radeyeTable1Even" align="right">$25.74</td>
<td  class="radeyeTable1Even" align="right">59.4</td>
<td  class="radeyeTable2Even" align="right">18.5</td>
<td  class="radeyeTable2Even" align="right">1.63</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7358969">dokon</a></td>
<td  class="radeyeTable1Odd" align="right">1789</td>
<td  class="radeyeTable1Odd" align="right">383</td>
<td  class="radeyeTable1Odd" align="right">$27.55</td>
<td  class="radeyeTable1Odd" align="right">56.8</td>
<td  class="radeyeTable2Odd" align="right">19.9</td>
<td  class="radeyeTable2Odd" align="right">3.00</td>
<td  class="radeyeTable2Odd" align="right">.038</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=286215">acs</a></td>
<td  class="radeyeTable1Even" align="right">1783</td>
<td  class="radeyeTable1Even" align="right">369</td>
<td  class="radeyeTable1Even" align="right">$26.56</td>
<td  class="radeyeTable1Even" align="right">56.4</td>
<td  class="radeyeTable2Even" align="right">19.2</td>
<td  class="radeyeTable2Even" align="right">2.64</td>
<td  class="radeyeTable2Even" align="right">.024</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=349209">dmj</a></td>
<td  class="radeyeTable1Odd" align="right">1777</td>
<td  class="radeyeTable1Odd" align="right">336</td>
<td  class="radeyeTable1Odd" align="right">$25.21</td>
<td  class="radeyeTable1Odd" align="right">56.4</td>
<td  class="radeyeTable2Odd" align="right">18.0</td>
<td  class="radeyeTable2Odd" align="right">2.02</td>
<td  class="radeyeTable2Odd" align="right">.010</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=304031">Ruberik</a></td>
<td  class="radeyeTable1Even" align="right">1776</td>
<td  class="radeyeTable1Even" align="right">525</td>
<td  class="radeyeTable1Even" align="right">$30.24</td>
<td  class="radeyeTable1Even" align="right">54.0</td>
<td  class="radeyeTable2Even" align="right">20.5</td>
<td  class="radeyeTable2Even" align="right">4.44</td>
<td  class="radeyeTable2Even" align="right">.201</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299904">mishagam</a></td>
<td  class="radeyeTable1Odd" align="right">1769</td>
<td  class="radeyeTable1Odd" align="right">365</td>
<td  class="radeyeTable1Odd" align="right">$25.08</td>
<td  class="radeyeTable1Odd" align="right">55.0</td>
<td  class="radeyeTable2Odd" align="right">17.8</td>
<td  class="radeyeTable2Odd" align="right">2.27</td>
<td  class="radeyeTable2Odd" align="right">.017</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150796">paisa</a></td>
<td  class="radeyeTable1Even" align="right">1763</td>
<td  class="radeyeTable1Even" align="right">358</td>
<td  class="radeyeTable1Even" align="right">$24.36</td>
<td  class="radeyeTable1Even" align="right">54.4</td>
<td  class="radeyeTable2Even" align="right">17.2</td>
<td  class="radeyeTable2Even" align="right">2.04</td>
<td  class="radeyeTable2Even" align="right">.014</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273162">princeofchaos</a></td>
<td  class="radeyeTable1Odd" align="right">1754</td>
<td  class="radeyeTable1Odd" align="right">189</td>
<td  class="radeyeTable1Odd" align="right">$19.10</td>
<td  class="radeyeTable1Odd" align="right">56.4</td>
<td  class="radeyeTable2Odd" align="right">9.74</td>
<td  class="radeyeTable2Odd" align="right">.131</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274529">tenken</a></td>
<td  class="radeyeTable1Even" align="right">1752</td>
<td  class="radeyeTable1Even" align="right">386</td>
<td  class="radeyeTable1Even" align="right">$24.05</td>
<td  class="radeyeTable1Even" align="right">53.0</td>
<td  class="radeyeTable2Even" align="right">16.8</td>
<td  class="radeyeTable2Even" align="right">2.19</td>
<td  class="radeyeTable2Even" align="right">.021</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303105">ded_guy</a></td>
<td  class="radeyeTable1Odd" align="right">1748</td>
<td  class="radeyeTable1Odd" align="right">301</td>
<td  class="radeyeTable1Odd" align="right">$21.51</td>
<td  class="radeyeTable1Odd" align="right">53.3</td>
<td  class="radeyeTable2Odd" align="right">14.3</td>
<td  class="radeyeTable2Odd" align="right">1.06</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7475694">das_kleine</a></td>
<td  class="radeyeTable1Even" align="right">1747</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$23.57</td>
<td  class="radeyeTable1Even" align="right">52.5</td>
<td  class="radeyeTable2Even" align="right">16.4</td>
<td  class="radeyeTable2Even" align="right">2.09</td>
<td  class="radeyeTable2Even" align="right">.018</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=264782">sliu</a></td>
<td  class="radeyeTable1Odd" align="right">1743</td>
<td  class="radeyeTable1Odd" align="right">525</td>
<td  class="radeyeTable1Odd" align="right">$27.20</td>
<td  class="radeyeTable1Odd" align="right">51.5</td>
<td  class="radeyeTable2Odd" align="right">18.4</td>
<td  class="radeyeTable2Odd" align="right">3.66</td>
<td  class="radeyeTable2Odd" align="right">.145</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.001</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=280570">sandeepgupta</a></td>
<td  class="radeyeTable1Even" align="right">1736</td>
<td  class="radeyeTable1Even" align="right">437</td>
<td  class="radeyeTable1Even" align="right">$24.03</td>
<td  class="radeyeTable1Even" align="right">51.2</td>
<td  class="radeyeTable2Even" align="right">16.6</td>
<td  class="radeyeTable2Even" align="right">2.51</td>
<td  class="radeyeTable2Even" align="right">.043</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=271496">jfreyss</a></td>
<td  class="radeyeTable1Odd" align="right">1735</td>
<td  class="radeyeTable1Odd" align="right">310</td>
<td  class="radeyeTable1Odd" align="right">$20.56</td>
<td  class="radeyeTable1Odd" align="right">51.5</td>
<td  class="radeyeTable2Odd" align="right">13.4</td>
<td  class="radeyeTable2Odd" align="right">.986</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=157638">Porgery</a></td>
<td  class="radeyeTable1Even" align="right">1732</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$20.05</td>
<td  class="radeyeTable1Even" align="right">51.1</td>
<td  class="radeyeTable2Even" align="right">12.8</td>
<td  class="radeyeTable2Even" align="right">.866</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303882">aditsu</a></td>
<td  class="radeyeTable1Odd" align="right">1729</td>
<td  class="radeyeTable1Odd" align="right">280</td>
<td  class="radeyeTable1Odd" align="right">$19.20</td>
<td  class="radeyeTable1Odd" align="right">50.8</td>
<td  class="radeyeTable2Odd" align="right">11.7</td>
<td  class="radeyeTable2Odd" align="right">.629</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=153479">petch</a></td>
<td  class="radeyeTable1Even" align="right">1728</td>
<td  class="radeyeTable1Even" align="right">391</td>
<td  class="radeyeTable1Even" align="right">$22.13</td>
<td  class="radeyeTable1Even" align="right">50.4</td>
<td  class="radeyeTable2Even" align="right">15.0</td>
<td  class="radeyeTable2Even" align="right">1.84</td>
<td  class="radeyeTable2Even" align="right">.016</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2058916">targo</a></td>
<td  class="radeyeTable1Odd" align="right">1727</td>
<td  class="radeyeTable1Odd" align="right">234</td>
<td  class="radeyeTable1Odd" align="right">$17.69</td>
<td  class="radeyeTable1Odd" align="right">50.6</td>
<td  class="radeyeTable2Odd" align="right">9.55</td>
<td  class="radeyeTable2Odd" align="right">.261</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268996">abheek</a></td>
<td  class="radeyeTable1Even" align="right">1727</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$21.87</td>
<td  class="radeyeTable1Even" align="right">50.3</td>
<td  class="radeyeTable2Even" align="right">14.8</td>
<td  class="radeyeTable2Even" align="right">1.74</td>
<td  class="radeyeTable2Even" align="right">.014</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7360309">dmks</a></td>
<td  class="radeyeTable1Odd" align="right">1727</td>
<td  class="radeyeTable1Odd" align="right">426</td>
<td  class="radeyeTable1Odd" align="right">$23.00</td>
<td  class="radeyeTable1Odd" align="right">50.3</td>
<td  class="radeyeTable2Odd" align="right">15.7</td>
<td  class="radeyeTable2Odd" align="right">2.21</td>
<td  class="radeyeTable2Odd" align="right">.033</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309381">esessoms</a></td>
<td  class="radeyeTable1Even" align="right">1719</td>
<td  class="radeyeTable1Even" align="right">299</td>
<td  class="radeyeTable1Even" align="right">$18.87</td>
<td  class="radeyeTable1Even" align="right">49.4</td>
<td  class="radeyeTable2Even" align="right">11.6</td>
<td  class="radeyeTable2Even" align="right">.707</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309454">bugzpodder</a></td>
<td  class="radeyeTable1Odd" align="right">1718</td>
<td  class="radeyeTable1Odd" align="right">346</td>
<td  class="radeyeTable1Odd" align="right">$20.09</td>
<td  class="radeyeTable1Odd" align="right">49.4</td>
<td  class="radeyeTable2Odd" align="right">13.1</td>
<td  class="radeyeTable2Odd" align="right">1.15</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273474">router</a></td>
<td  class="radeyeTable1Even" align="right">1716</td>
<td  class="radeyeTable1Even" align="right">389</td>
<td  class="radeyeTable1Even" align="right">$21.10</td>
<td  class="radeyeTable1Even" align="right">49.2</td>
<td  class="radeyeTable2Even" align="right">14.1</td>
<td  class="radeyeTable2Even" align="right">1.60</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7441469">msasha</a></td>
<td  class="radeyeTable1Odd" align="right">1714</td>
<td  class="radeyeTable1Odd" align="right">282</td>
<td  class="radeyeTable1Odd" align="right">$17.97</td>
<td  class="radeyeTable1Odd" align="right">48.6</td>
<td  class="radeyeTable2Odd" align="right">10.6</td>
<td  class="radeyeTable2Odd" align="right">.519</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=297205">Harold</a></td>
<td  class="radeyeTable1Even" align="right">1713</td>
<td  class="radeyeTable1Even" align="right">528</td>
<td  class="radeyeTable1Even" align="right">$24.77</td>
<td  class="radeyeTable1Even" align="right">49.2</td>
<td  class="radeyeTable2Even" align="right">16.6</td>
<td  class="radeyeTable2Even" align="right">3.05</td>
<td  class="radeyeTable2Even" align="right">.110</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7272306">adams</a></td>
<td  class="radeyeTable1Odd" align="right">1708</td>
<td  class="radeyeTable1Odd" align="right">337</td>
<td  class="radeyeTable1Odd" align="right">$19.03</td>
<td  class="radeyeTable1Odd" align="right">48.2</td>
<td  class="radeyeTable2Odd" align="right">12.0</td>
<td  class="radeyeTable2Odd" align="right">.945</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156484">nikolab</a></td>
<td  class="radeyeTable1Even" align="right">1706</td>
<td  class="radeyeTable1Even" align="right">476</td>
<td  class="radeyeTable1Even" align="right">$22.66</td>
<td  class="radeyeTable1Even" align="right">48.5</td>
<td  class="radeyeTable2Even" align="right">15.3</td>
<td  class="radeyeTable2Even" align="right">2.37</td>
<td  class="radeyeTable2Even" align="right">.053</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159594">Koroibos</a></td>
<td  class="radeyeTable1Odd" align="right">1706</td>
<td  class="radeyeTable1Odd" align="right">358</td>
<td  class="radeyeTable1Odd" align="right">$19.45</td>
<td  class="radeyeTable1Odd" align="right">48.0</td>
<td  class="radeyeTable2Odd" align="right">12.5</td>
<td  class="radeyeTable2Odd" align="right">1.13</td>
<td  class="radeyeTable2Odd" align="right">.005</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=347901">mascot</a></td>
<td  class="radeyeTable1Even" align="right">1702</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$19.93</td>
<td  class="radeyeTable1Even" align="right">47.8</td>
<td  class="radeyeTable2Even" align="right">13.0</td>
<td  class="radeyeTable2Even" align="right">1.38</td>
<td  class="radeyeTable2Even" align="right">.010</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=150498">ThinMan</a></td>
<td  class="radeyeTable1Odd" align="right">1701</td>
<td  class="radeyeTable1Odd" align="right">284</td>
<td  class="radeyeTable1Odd" align="right">$16.98</td>
<td  class="radeyeTable1Odd" align="right">46.8</td>
<td  class="radeyeTable2Odd" align="right">9.65</td>
<td  class="radeyeTable2Odd" align="right">.440</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=283388">Minsk</a></td>
<td  class="radeyeTable1Even" align="right">1697</td>
<td  class="radeyeTable1Even" align="right">491</td>
<td  class="radeyeTable1Even" align="right">$22.37</td>
<td  class="radeyeTable1Even" align="right">47.8</td>
<td  class="radeyeTable2Even" align="right">14.9</td>
<td  class="radeyeTable2Even" align="right">2.37</td>
<td  class="radeyeTable2Even" align="right">.058</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7402883">Henry</a></td>
<td  class="radeyeTable1Odd" align="right">1695</td>
<td  class="radeyeTable1Odd" align="right">421</td>
<td  class="radeyeTable1Odd" align="right">$20.35</td>
<td  class="radeyeTable1Odd" align="right">47.3</td>
<td  class="radeyeTable2Odd" align="right">13.4</td>
<td  class="radeyeTable2Odd" align="right">1.62</td>
<td  class="radeyeTable2Odd" align="right">.018</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309617">dark_legend</a></td>
<td  class="radeyeTable1Even" align="right">1693</td>
<td  class="radeyeTable1Even" align="right">270</td>
<td  class="radeyeTable1Even" align="right">$15.91</td>
<td  class="radeyeTable1Even" align="right">45.5</td>
<td  class="radeyeTable2Even" align="right">8.45</td>
<td  class="radeyeTable2Even" align="right">.303</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154135">tck</a></td>
<td  class="radeyeTable1Odd" align="right">1692</td>
<td  class="radeyeTable1Odd" align="right">443</td>
<td  class="radeyeTable1Odd" align="right">$20.78</td>
<td  class="radeyeTable1Odd" align="right">47.2</td>
<td  class="radeyeTable2Odd" align="right">13.8</td>
<td  class="radeyeTable2Odd" align="right">1.83</td>
<td  class="radeyeTable2Odd" align="right">.028</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=295606">koehrsen</a></td>
<td  class="radeyeTable1Even" align="right">1689</td>
<td  class="radeyeTable1Even" align="right">256</td>
<td  class="radeyeTable1Even" align="right">$15.15</td>
<td  class="radeyeTable1Even" align="right">44.6</td>
<td  class="radeyeTable2Even" align="right">7.57</td>
<td  class="radeyeTable2Even" align="right">.209</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260911">amitc</a></td>
<td  class="radeyeTable1Odd" align="right">1685</td>
<td  class="radeyeTable1Odd" align="right">323</td>
<td  class="radeyeTable1Odd" align="right">$16.91</td>
<td  class="radeyeTable1Odd" align="right">45.2</td>
<td  class="radeyeTable2Odd" align="right">9.95</td>
<td  class="radeyeTable2Odd" align="right">.616</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=141448">claw</a></td>
<td  class="radeyeTable1Even" align="right">1681</td>
<td  class="radeyeTable1Even" align="right">434</td>
<td  class="radeyeTable1Even" align="right">$19.74</td>
<td  class="radeyeTable1Even" align="right">46.1</td>
<td  class="radeyeTable2Even" align="right">12.9</td>
<td  class="radeyeTable2Even" align="right">1.58</td>
<td  class="radeyeTable2Even" align="right">.021</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7360303">mgmgmgmg</a></td>
<td  class="radeyeTable1Odd" align="right">1680</td>
<td  class="radeyeTable1Odd" align="right">484</td>
<td  class="radeyeTable1Odd" align="right">$21.02</td>
<td  class="radeyeTable1Odd" align="right">46.4</td>
<td  class="radeyeTable2Odd" align="right">13.9</td>
<td  class="radeyeTable2Odd" align="right">2.04</td>
<td  class="radeyeTable2Odd" align="right">.043</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=129381">kikuni</a></td>
<td  class="radeyeTable1Even" align="right">1677</td>
<td  class="radeyeTable1Even" align="right">206</td>
<td  class="radeyeTable1Even" align="right">$12.54</td>
<td  class="radeyeTable1Even" align="right">41.1</td>
<td  class="radeyeTable2Even" align="right">4.45</td>
<td  class="radeyeTable2Even" align="right">.035</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=271976">Corrinado</a></td>
<td  class="radeyeTable1Odd" align="right">1676</td>
<td  class="radeyeTable1Odd" align="right">427</td>
<td  class="radeyeTable1Odd" align="right">$19.21</td>
<td  class="radeyeTable1Odd" align="right">45.6</td>
<td  class="radeyeTable2Odd" align="right">12.4</td>
<td  class="radeyeTable2Odd" align="right">1.44</td>
<td  class="radeyeTable2Odd" align="right">.016</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7459326">jdmetz</a></td>
<td  class="radeyeTable1Even" align="right">1676</td>
<td  class="radeyeTable1Even" align="right">567</td>
<td  class="radeyeTable1Even" align="right">$23.18</td>
<td  class="radeyeTable1Even" align="right">46.7</td>
<td  class="radeyeTable2Even" align="right">15.2</td>
<td  class="radeyeTable2Even" align="right">2.78</td>
<td  class="radeyeTable2Even" align="right">.114</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=299761">techie1</a></td>
<td  class="radeyeTable1Odd" align="right">1673</td>
<td  class="radeyeTable1Odd" align="right">521</td>
<td  class="radeyeTable1Odd" align="right">$21.57</td>
<td  class="radeyeTable1Odd" align="right">46.1</td>
<td  class="radeyeTable2Odd" align="right">14.2</td>
<td  class="radeyeTable2Odd" align="right">2.29</td>
<td  class="radeyeTable2Odd" align="right">.066</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156485">Smiley=)</a></td>
<td  class="radeyeTable1Even" align="right">1671</td>
<td  class="radeyeTable1Even" align="right">354</td>
<td  class="radeyeTable1Even" align="right">$16.82</td>
<td  class="radeyeTable1Even" align="right">44.1</td>
<td  class="radeyeTable2Even" align="right">10.1</td>
<td  class="radeyeTable2Even" align="right">.748</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=302018">Tomson</a></td>
<td  class="radeyeTable1Odd" align="right">1667</td>
<td  class="radeyeTable1Odd" align="right">303</td>
<td  class="radeyeTable1Odd" align="right">$15.03</td>
<td  class="radeyeTable1Odd" align="right">42.6</td>
<td  class="radeyeTable2Odd" align="right">8.05</td>
<td  class="radeyeTable2Odd" align="right">.358</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=263386">Darrell_L_77</a></td>
<td  class="radeyeTable1Even" align="right">1666</td>
<td  class="radeyeTable1Even" align="right">333</td>
<td  class="radeyeTable1Even" align="right">$15.85</td>
<td  class="radeyeTable1Even" align="right">43.1</td>
<td  class="radeyeTable2Even" align="right">9.04</td>
<td  class="radeyeTable2Even" align="right">.546</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7316478">gaokai</a></td>
<td  class="radeyeTable1Odd" align="right">1666</td>
<td  class="radeyeTable1Odd" align="right">356</td>
<td  class="radeyeTable1Odd" align="right">$16.55</td>
<td  class="radeyeTable1Odd" align="right">43.6</td>
<td  class="radeyeTable2Odd" align="right">9.81</td>
<td  class="radeyeTable2Odd" align="right">.719</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288533">polivic</a></td>
<td  class="radeyeTable1Even" align="right">1663</td>
<td  class="radeyeTable1Even" align="right">380</td>
<td  class="radeyeTable1Even" align="right">$17.01</td>
<td  class="radeyeTable1Even" align="right">43.6</td>
<td  class="radeyeTable2Even" align="right">10.4</td>
<td  class="radeyeTable2Even" align="right">.877</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303385">farsight</a></td>
<td  class="radeyeTable1Odd" align="right">1662</td>
<td  class="radeyeTable1Odd" align="right">423</td>
<td  class="radeyeTable1Odd" align="right">$18.14</td>
<td  class="radeyeTable1Odd" align="right">44.2</td>
<td  class="radeyeTable2Odd" align="right">11.5</td>
<td  class="radeyeTable2Odd" align="right">1.23</td>
<td  class="radeyeTable2Odd" align="right">.012</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=273206">b0b0b0b</a></td>
<td  class="radeyeTable1Even" align="right">1661</td>
<td  class="radeyeTable1Even" align="right">435</td>
<td  class="radeyeTable1Even" align="right">$18.42</td>
<td  class="radeyeTable1Even" align="right">44.3</td>
<td  class="radeyeTable2Even" align="right">11.7</td>
<td  class="radeyeTable2Even" align="right">1.33</td>
<td  class="radeyeTable2Even" align="right">.016</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7472513">szd714</a></td>
<td  class="radeyeTable1Odd" align="right">1655</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$16.64</td>
<td  class="radeyeTable1Odd" align="right">43.0</td>
<td  class="radeyeTable2Odd" align="right">10.0</td>
<td  class="radeyeTable2Odd" align="right">.852</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=290481">ender_wiggin</a></td>
<td  class="radeyeTable1Even" align="right">1653</td>
<td  class="radeyeTable1Even" align="right">440</td>
<td  class="radeyeTable1Even" align="right">$18.03</td>
<td  class="radeyeTable1Even" align="right">43.7</td>
<td  class="radeyeTable2Even" align="right">11.4</td>
<td  class="radeyeTable2Even" align="right">1.28</td>
<td  class="radeyeTable2Even" align="right">.014</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7448473">danlief</a></td>
<td  class="radeyeTable1Odd" align="right">1653</td>
<td  class="radeyeTable1Odd" align="right">427</td>
<td  class="radeyeTable1Odd" align="right">$17.68</td>
<td  class="radeyeTable1Odd" align="right">43.5</td>
<td  class="radeyeTable2Odd" align="right">11.1</td>
<td  class="radeyeTable2Odd" align="right">1.17</td>
<td  class="radeyeTable2Odd" align="right">.011</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158447">ValD</a></td>
<td  class="radeyeTable1Even" align="right">1648</td>
<td  class="radeyeTable1Even" align="right">387</td>
<td  class="radeyeTable1Even" align="right">$16.22</td>
<td  class="radeyeTable1Even" align="right">42.3</td>
<td  class="radeyeTable2Even" align="right">9.64</td>
<td  class="radeyeTable2Even" align="right">.793</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=278595">seaniswise</a></td>
<td  class="radeyeTable1Odd" align="right">1645</td>
<td  class="radeyeTable1Odd" align="right">289</td>
<td  class="radeyeTable1Odd" align="right">$13.14</td>
<td  class="radeyeTable1Odd" align="right">39.3</td>
<td  class="radeyeTable2Odd" align="right">6.23</td>
<td  class="radeyeTable2Odd" align="right">.202</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260952">UFP2161</a></td>
<td  class="radeyeTable1Even" align="right">1644</td>
<td  class="radeyeTable1Even" align="right">409</td>
<td  class="radeyeTable1Even" align="right">$16.60</td>
<td  class="radeyeTable1Even" align="right">42.3</td>
<td  class="radeyeTable2Even" align="right">10.1</td>
<td  class="radeyeTable2Even" align="right">.938</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7474505">Jary</a></td>
<td  class="radeyeTable1Odd" align="right">1644</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$15.92</td>
<td  class="radeyeTable1Odd" align="right">41.8</td>
<td  class="radeyeTable2Odd" align="right">9.39</td>
<td  class="radeyeTable2Odd" align="right">.742</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7210729">ssancho2</a></td>
<td  class="radeyeTable1Even" align="right">1642</td>
<td  class="radeyeTable1Even" align="right">344</td>
<td  class="radeyeTable1Even" align="right">$14.67</td>
<td  class="radeyeTable1Even" align="right">40.7</td>
<td  class="radeyeTable2Even" align="right">8.05</td>
<td  class="radeyeTable2Even" align="right">.467</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=156990">lanenal</a></td>
<td  class="radeyeTable1Odd" align="right">1641</td>
<td  class="radeyeTable1Odd" align="right">184</td>
<td  class="radeyeTable1Odd" align="right">$9.15</td>
<td  class="radeyeTable1Odd" align="right">32.8</td>
<td  class="radeyeTable2Odd" align="right">1.91</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7477401">AlexandraRU</a></td>
<td  class="radeyeTable1Even" align="right">1639</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$15.64</td>
<td  class="radeyeTable1Even" align="right">41.3</td>
<td  class="radeyeTable2Even" align="right">9.14</td>
<td  class="radeyeTable2Even" align="right">.711</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7296000">connect4</a></td>
<td  class="radeyeTable1Odd" align="right">1637</td>
<td  class="radeyeTable1Odd" align="right">531</td>
<td  class="radeyeTable1Odd" align="right">$19.51</td>
<td  class="radeyeTable1Odd" align="right">43.5</td>
<td  class="radeyeTable2Odd" align="right">12.5</td>
<td  class="radeyeTable2Odd" align="right">1.87</td>
<td  class="radeyeTable2Odd" align="right">.051</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7453062">mcphee</a></td>
<td  class="radeyeTable1Even" align="right">1637</td>
<td  class="radeyeTable1Even" align="right">339</td>
<td  class="radeyeTable1Even" align="right">$14.20</td>
<td  class="radeyeTable1Even" align="right">39.9</td>
<td  class="radeyeTable2Even" align="right">7.60</td>
<td  class="radeyeTable2Even" align="right">.409</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=296145">srowen</a></td>
<td  class="radeyeTable1Odd" align="right">1628</td>
<td  class="radeyeTable1Odd" align="right">548</td>
<td  class="radeyeTable1Odd" align="right">$19.47</td>
<td  class="radeyeTable1Odd" align="right">43.1</td>
<td  class="radeyeTable2Odd" align="right">12.4</td>
<td  class="radeyeTable2Odd" align="right">1.91</td>
<td  class="radeyeTable2Odd" align="right">.058</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159965">wcbarksdale</a></td>
<td  class="radeyeTable1Even" align="right">1627</td>
<td  class="radeyeTable1Even" align="right">394</td>
<td  class="radeyeTable1Even" align="right">$15.17</td>
<td  class="radeyeTable1Even" align="right">40.3</td>
<td  class="radeyeTable2Even" align="right">8.76</td>
<td  class="radeyeTable2Even" align="right">.684</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7436178">AmirS</a></td>
<td  class="radeyeTable1Odd" align="right">1620</td>
<td  class="radeyeTable1Odd" align="right">310</td>
<td  class="radeyeTable1Odd" align="right">$12.32</td>
<td  class="radeyeTable1Odd" align="right">37.0</td>
<td  class="radeyeTable2Odd" align="right">5.76</td>
<td  class="radeyeTable2Odd" align="right">.199</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=301210">tgu</a></td>
<td  class="radeyeTable1Even" align="right">1608</td>
<td  class="radeyeTable1Even" align="right">161</td>
<td  class="radeyeTable1Even" align="right">$6.22</td>
<td  class="radeyeTable1Even" align="right">23.7</td>
<td  class="radeyeTable2Even" align="right">.565</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=274760">Running Wild</a></td>
<td  class="radeyeTable1Odd" align="right">1603</td>
<td  class="radeyeTable1Odd" align="right">502</td>
<td  class="radeyeTable1Odd" align="right">$16.78</td>
<td  class="radeyeTable1Odd" align="right">40.5</td>
<td  class="radeyeTable2Odd" align="right">10.3</td>
<td  class="radeyeTable2Odd" align="right">1.26</td>
<td  class="radeyeTable2Odd" align="right">.023</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251989">AdamSelene</a></td>
<td  class="radeyeTable1Even" align="right">1601</td>
<td  class="radeyeTable1Even" align="right">292</td>
<td  class="radeyeTable1Even" align="right">$10.68</td>
<td  class="radeyeTable1Even" align="right">33.7</td>
<td  class="radeyeTable2Even" align="right">4.30</td>
<td  class="radeyeTable2Even" align="right">.101</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7443907">joely</a></td>
<td  class="radeyeTable1Odd" align="right">1599</td>
<td  class="radeyeTable1Odd" align="right">238</td>
<td  class="radeyeTable1Odd" align="right">$8.75</td>
<td  class="radeyeTable1Odd" align="right">30.1</td>
<td  class="radeyeTable2Odd" align="right">2.43</td>
<td  class="radeyeTable2Odd" align="right">.020</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=286112">mbarb</a></td>
<td  class="radeyeTable1Even" align="right">1597</td>
<td  class="radeyeTable1Even" align="right">312</td>
<td  class="radeyeTable1Even" align="right">$11.11</td>
<td  class="radeyeTable1Even" align="right">34.2</td>
<td  class="radeyeTable2Even" align="right">4.80</td>
<td  class="radeyeTable2Even" align="right">.148</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7464232">jehamby</a></td>
<td  class="radeyeTable1Odd" align="right">1592</td>
<td  class="radeyeTable1Odd" align="right">301</td>
<td  class="radeyeTable1Odd" align="right">$10.50</td>
<td  class="radeyeTable1Odd" align="right">33.1</td>
<td  class="radeyeTable2Odd" align="right">4.24</td>
<td  class="radeyeTable2Odd" align="right">.107</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=310233">Standlove</a></td>
<td  class="radeyeTable1Even" align="right">1591</td>
<td  class="radeyeTable1Even" align="right">249</td>
<td  class="radeyeTable1Even" align="right">$8.74</td>
<td  class="radeyeTable1Even" align="right">29.7</td>
<td  class="radeyeTable2Even" align="right">2.55</td>
<td  class="radeyeTable2Even" align="right">.024</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7268916">bsauerwine</a></td>
<td  class="radeyeTable1Odd" align="right">1586</td>
<td  class="radeyeTable1Odd" align="right">446</td>
<td  class="radeyeTable1Odd" align="right">$14.39</td>
<td  class="radeyeTable1Odd" align="right">37.9</td>
<td  class="radeyeTable2Odd" align="right">8.22</td>
<td  class="radeyeTable2Odd" align="right">.729</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=158403">epod</a></td>
<td  class="radeyeTable1Even" align="right">1584</td>
<td  class="radeyeTable1Even" align="right">315</td>
<td  class="radeyeTable1Even" align="right">$10.53</td>
<td  class="radeyeTable1Even" align="right">32.9</td>
<td  class="radeyeTable2Even" align="right">4.37</td>
<td  class="radeyeTable2Even" align="right">.126</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262467">billy</a></td>
<td  class="radeyeTable1Odd" align="right">1583</td>
<td  class="radeyeTable1Odd" align="right">257</td>
<td  class="radeyeTable1Odd" align="right">$8.60</td>
<td  class="radeyeTable1Odd" align="right">29.3</td>
<td  class="radeyeTable2Odd" align="right">2.52</td>
<td  class="radeyeTable2Odd" align="right">.028</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=309948">mmlmesic</a></td>
<td  class="radeyeTable1Even" align="right">1581</td>
<td  class="radeyeTable1Even" align="right">414</td>
<td  class="radeyeTable1Even" align="right">$13.26</td>
<td  class="radeyeTable1Even" align="right">36.5</td>
<td  class="radeyeTable2Even" align="right">7.17</td>
<td  class="radeyeTable2Even" align="right">.520</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7233906">superjoel</a></td>
<td  class="radeyeTable1Odd" align="right">1577</td>
<td  class="radeyeTable1Odd" align="right">216</td>
<td  class="radeyeTable1Odd" align="right">$6.85</td>
<td  class="radeyeTable1Odd" align="right">24.9</td>
<td  class="radeyeTable2Odd" align="right">1.26</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7401899">Wombatfreak</a></td>
<td  class="radeyeTable1Even" align="right">1573</td>
<td  class="radeyeTable1Even" align="right">232</td>
<td  class="radeyeTable1Even" align="right">$7.26</td>
<td  class="radeyeTable1Even" align="right">25.9</td>
<td  class="radeyeTable2Even" align="right">1.58</td>
<td  class="radeyeTable2Even" align="right">.007</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159544">dgoodman</a></td>
<td  class="radeyeTable1Odd" align="right">1572</td>
<td  class="radeyeTable1Odd" align="right">436</td>
<td  class="radeyeTable1Odd" align="right">$13.43</td>
<td  class="radeyeTable1Odd" align="right">36.4</td>
<td  class="radeyeTable2Odd" align="right">7.40</td>
<td  class="radeyeTable2Odd" align="right">.590</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7449686">Vladko</a></td>
<td  class="radeyeTable1Even" align="right">1571</td>
<td  class="radeyeTable1Even" align="right">288</td>
<td  class="radeyeTable1Even" align="right">$9.06</td>
<td  class="radeyeTable1Even" align="right">29.8</td>
<td  class="radeyeTable2Even" align="right">3.11</td>
<td  class="radeyeTable2Even" align="right">.054</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=300426">abductor</a></td>
<td  class="radeyeTable1Odd" align="right">1570</td>
<td  class="radeyeTable1Odd" align="right">333</td>
<td  class="radeyeTable1Odd" align="right">$10.43</td>
<td  class="radeyeTable1Odd" align="right">32.2</td>
<td  class="radeyeTable2Odd" align="right">4.44</td>
<td  class="radeyeTable2Odd" align="right">.146</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7434314">amirshim</a></td>
<td  class="radeyeTable1Even" align="right">1570</td>
<td  class="radeyeTable1Even" align="right">271</td>
<td  class="radeyeTable1Even" align="right">$8.45</td>
<td  class="radeyeTable1Even" align="right">28.5</td>
<td  class="radeyeTable2Even" align="right">2.59</td>
<td  class="radeyeTable2Even" align="right">.032</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=304979">sinaddcos</a></td>
<td  class="radeyeTable1Odd" align="right">1569</td>
<td  class="radeyeTable1Odd" align="right">289</td>
<td  class="radeyeTable1Odd" align="right">$9.01</td>
<td  class="radeyeTable1Odd" align="right">29.7</td>
<td  class="radeyeTable2Odd" align="right">3.09</td>
<td  class="radeyeTable2Odd" align="right">.052</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=311097">jerusalem</a></td>
<td  class="radeyeTable1Even" align="right">1565</td>
<td  class="radeyeTable1Even" align="right">399</td>
<td  class="radeyeTable1Even" align="right">$12.05</td>
<td  class="radeyeTable1Even" align="right">34.5</td>
<td  class="radeyeTable2Even" align="right">6.09</td>
<td  class="radeyeTable2Even" align="right">.366</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=282718">Rustyoldman</a></td>
<td  class="radeyeTable1Odd" align="right">1561</td>
<td  class="radeyeTable1Odd" align="right">297</td>
<td  class="radeyeTable1Odd" align="right">$8.91</td>
<td  class="radeyeTable1Odd" align="right">29.2</td>
<td  class="radeyeTable2Odd" align="right">3.08</td>
<td  class="radeyeTable2Odd" align="right">.059</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=153183">gmenhorn</a></td>
<td  class="radeyeTable1Even" align="right">1558</td>
<td  class="radeyeTable1Even" align="right">299</td>
<td  class="radeyeTable1Even" align="right">$8.83</td>
<td  class="radeyeTable1Even" align="right">29.0</td>
<td  class="radeyeTable2Even" align="right">3.04</td>
<td  class="radeyeTable2Even" align="right">.059</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=344645">KHDev</a></td>
<td  class="radeyeTable1Odd" align="right">1558</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$11.36</td>
<td  class="radeyeTable1Odd" align="right">33.3</td>
<td  class="radeyeTable2Odd" align="right">5.47</td>
<td  class="radeyeTable2Odd" align="right">.283</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=2059300">burnpanck</a></td>
<td  class="radeyeTable1Even" align="right">1553</td>
<td  class="radeyeTable1Even" align="right">262</td>
<td  class="radeyeTable1Even" align="right">$7.41</td>
<td  class="radeyeTable1Even" align="right">25.8</td>
<td  class="radeyeTable2Even" align="right">1.91</td>
<td  class="radeyeTable2Even" align="right">.016</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7475981">hamster</a></td>
<td  class="radeyeTable1Odd" align="right">1553</td>
<td  class="radeyeTable1Odd" align="right">308</td>
<td  class="radeyeTable1Odd" align="right">$8.88</td>
<td  class="radeyeTable1Odd" align="right">29.0</td>
<td  class="radeyeTable2Odd" align="right">3.13</td>
<td  class="radeyeTable2Odd" align="right">.068</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=159543">PongsriBunny</a></td>
<td  class="radeyeTable1Even" align="right">1552</td>
<td  class="radeyeTable1Even" align="right">248</td>
<td  class="radeyeTable1Even" align="right">$6.90</td>
<td  class="radeyeTable1Even" align="right">24.5</td>
<td  class="radeyeTable2Even" align="right">1.54</td>
<td  class="radeyeTable2Even" align="right">.009</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277907">jimbo54</a></td>
<td  class="radeyeTable1Odd" align="right">1552</td>
<td  class="radeyeTable1Odd" align="right">253</td>
<td  class="radeyeTable1Odd" align="right">$7.06</td>
<td  class="radeyeTable1Odd" align="right">24.9</td>
<td  class="radeyeTable2Odd" align="right">1.66</td>
<td  class="radeyeTable2Odd" align="right">.011</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251207">RobertNix</a></td>
<td  class="radeyeTable1Even" align="right">1548</td>
<td  class="radeyeTable1Even" align="right">377</td>
<td  class="radeyeTable1Even" align="right">$10.70</td>
<td  class="radeyeTable1Even" align="right">32.1</td>
<td  class="radeyeTable2Even" align="right">4.91</td>
<td  class="radeyeTable2Even" align="right">.225</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=262951">db</a></td>
<td  class="radeyeTable1Odd" align="right">1548</td>
<td  class="radeyeTable1Odd" align="right">463</td>
<td  class="radeyeTable1Odd" align="right">$12.98</td>
<td  class="radeyeTable1Odd" align="right">35.1</td>
<td  class="radeyeTable2Odd" align="right">7.08</td>
<td  class="radeyeTable2Odd" align="right">.602</td>
<td  class="radeyeTable2Odd" align="right">.005</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=269078">dzadza</a></td>
<td  class="radeyeTable1Even" align="right">1544</td>
<td  class="radeyeTable1Even" align="right">318</td>
<td  class="radeyeTable1Even" align="right">$8.82</td>
<td  class="radeyeTable1Even" align="right">28.6</td>
<td  class="radeyeTable2Even" align="right">3.18</td>
<td  class="radeyeTable2Even" align="right">.072</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7279691">amigne</a></td>
<td  class="radeyeTable1Odd" align="right">1544</td>
<td  class="radeyeTable1Odd" align="right">282</td>
<td  class="radeyeTable1Odd" align="right">$7.69</td>
<td  class="radeyeTable1Odd" align="right">26.3</td>
<td  class="radeyeTable2Odd" align="right">2.20</td>
<td  class="radeyeTable2Odd" align="right">.025</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288822">banizar</a></td>
<td  class="radeyeTable1Even" align="right">1543</td>
<td  class="radeyeTable1Even" align="right">275</td>
<td  class="radeyeTable1Even" align="right">$7.41</td>
<td  class="radeyeTable1Even" align="right">25.6</td>
<td  class="radeyeTable2Even" align="right">2.00</td>
<td  class="radeyeTable2Even" align="right">.020</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7360291">iforiq</a></td>
<td  class="radeyeTable1Odd" align="right">1542</td>
<td  class="radeyeTable1Odd" align="right">393</td>
<td  class="radeyeTable1Odd" align="right">$10.86</td>
<td  class="radeyeTable1Odd" align="right">32.2</td>
<td  class="radeyeTable2Odd" align="right">5.11</td>
<td  class="radeyeTable2Odd" align="right">.260</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=292451">Mr.Sketch</a></td>
<td  class="radeyeTable1Even" align="right">1541</td>
<td  class="radeyeTable1Even" align="right">327</td>
<td  class="radeyeTable1Even" align="right">$8.93</td>
<td  class="radeyeTable1Even" align="right">28.8</td>
<td  class="radeyeTable2Even" align="right">3.31</td>
<td  class="radeyeTable2Even" align="right">.083</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=266750">axchma</a></td>
<td  class="radeyeTable1Odd" align="right">1540</td>
<td  class="radeyeTable1Odd" align="right">341</td>
<td  class="radeyeTable1Odd" align="right">$9.32</td>
<td  class="radeyeTable1Odd" align="right">29.5</td>
<td  class="radeyeTable2Odd" align="right">3.66</td>
<td  class="radeyeTable2Odd" align="right">.111</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=294034">centipede80</a></td>
<td  class="radeyeTable1Even" align="right">1539</td>
<td  class="radeyeTable1Even" align="right">388</td>
<td  class="radeyeTable1Even" align="right">$10.59</td>
<td  class="radeyeTable1Even" align="right">31.7</td>
<td  class="radeyeTable2Even" align="right">4.88</td>
<td  class="radeyeTable2Even" align="right">.234</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=279380">skeeve</a></td>
<td  class="radeyeTable1Odd" align="right">1537</td>
<td  class="radeyeTable1Odd" align="right">338</td>
<td  class="radeyeTable1Odd" align="right">$9.09</td>
<td  class="radeyeTable1Odd" align="right">29.0</td>
<td  class="radeyeTable2Odd" align="right">3.48</td>
<td  class="radeyeTable2Odd" align="right">.099</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7380147">BeCool</a></td>
<td  class="radeyeTable1Even" align="right">1536</td>
<td  class="radeyeTable1Even" align="right">257</td>
<td  class="radeyeTable1Even" align="right">$6.55</td>
<td  class="radeyeTable1Even" align="right">23.3</td>
<td  class="radeyeTable2Even" align="right">1.44</td>
<td  class="radeyeTable2Even" align="right">.009</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260406">konsept</a></td>
<td  class="radeyeTable1Odd" align="right">1535</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$10.35</td>
<td  class="radeyeTable1Odd" align="right">31.2</td>
<td  class="radeyeTable2Odd" align="right">4.65</td>
<td  class="radeyeTable2Odd" align="right">.221</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=297500">Jay_Slupesky</a></td>
<td  class="radeyeTable1Even" align="right">1529</td>
<td  class="radeyeTable1Even" align="right">300</td>
<td  class="radeyeTable1Even" align="right">$7.65</td>
<td  class="radeyeTable1Even" align="right">25.9</td>
<td  class="radeyeTable2Even" align="right">2.30</td>
<td  class="radeyeTable2Even" align="right">.034</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=346860">omasoud</a></td>
<td  class="radeyeTable1Odd" align="right">1529</td>
<td  class="radeyeTable1Odd" align="right">556</td>
<td  class="radeyeTable1Odd" align="right">$14.54</td>
<td  class="radeyeTable1Odd" align="right">36.3</td>
<td  class="radeyeTable2Odd" align="right">8.45</td>
<td  class="radeyeTable2Odd" align="right">1.01</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=260761">toast</a></td>
<td  class="radeyeTable1Even" align="right">1527</td>
<td  class="radeyeTable1Even" align="right">339</td>
<td  class="radeyeTable1Even" align="right">$8.75</td>
<td  class="radeyeTable1Even" align="right">28.2</td>
<td  class="radeyeTable2Even" align="right">3.25</td>
<td  class="radeyeTable2Even" align="right">.087</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=307848">Bytekeeper</a></td>
<td  class="radeyeTable1Odd" align="right">1526</td>
<td  class="radeyeTable1Odd" align="right">412</td>
<td  class="radeyeTable1Odd" align="right">$10.72</td>
<td  class="radeyeTable1Odd" align="right">31.5</td>
<td  class="radeyeTable2Odd" align="right">5.08</td>
<td  class="radeyeTable2Odd" align="right">.285</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303083">ripper</a></td>
<td  class="radeyeTable1Even" align="right">1524</td>
<td  class="radeyeTable1Even" align="right">246</td>
<td  class="radeyeTable1Even" align="right">$5.74</td>
<td  class="radeyeTable1Even" align="right">20.9</td>
<td  class="radeyeTable2Even" align="right">1.01</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154619">hilfiger</a></td>
<td  class="radeyeTable1Odd" align="right">1522</td>
<td  class="radeyeTable1Odd" align="right">616</td>
<td  class="radeyeTable1Odd" align="right">$15.66</td>
<td  class="radeyeTable1Odd" align="right">37.1</td>
<td  class="radeyeTable2Odd" align="right">9.32</td>
<td  class="radeyeTable2Odd" align="right">1.30</td>
<td  class="radeyeTable2Odd" align="right">.042</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7364110">kats</a></td>
<td  class="radeyeTable1Even" align="right">1517</td>
<td  class="radeyeTable1Even" align="right">245</td>
<td  class="radeyeTable1Even" align="right">$5.44</td>
<td  class="radeyeTable1Even" align="right">20.0</td>
<td  class="radeyeTable2Even" align="right">.900</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=153724">Vaduz</a></td>
<td  class="radeyeTable1Odd" align="right">1516</td>
<td  class="radeyeTable1Odd" align="right">250</td>
<td  class="radeyeTable1Odd" align="right">$5.58</td>
<td  class="radeyeTable1Odd" align="right">20.3</td>
<td  class="radeyeTable2Odd" align="right">.990</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=277356">aksonov</a></td>
<td  class="radeyeTable1Even" align="right">1516</td>
<td  class="radeyeTable1Even" align="right">248</td>
<td  class="radeyeTable1Even" align="right">$5.52</td>
<td  class="radeyeTable1Even" align="right">20.2</td>
<td  class="radeyeTable2Even" align="right">.946</td>
<td  class="radeyeTable2Even" align="right">.004</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=288233">gali</a></td>
<td  class="radeyeTable1Odd" align="right">1516</td>
<td  class="radeyeTable1Odd" align="right">362</td>
<td  class="radeyeTable1Odd" align="right">$8.94</td>
<td  class="radeyeTable1Odd" align="right">28.3</td>
<td  class="radeyeTable2Odd" align="right">3.52</td>
<td  class="radeyeTable2Odd" align="right">.115</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=303185">Cosmin.ro</a></td>
<td  class="radeyeTable1Even" align="right">1515</td>
<td  class="radeyeTable1Even" align="right">280</td>
<td  class="radeyeTable1Even" align="right">$6.49</td>
<td  class="radeyeTable1Even" align="right">22.8</td>
<td  class="radeyeTable2Even" align="right">1.55</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=251591">emmpee</a></td>
<td  class="radeyeTable1Odd" align="right">1514</td>
<td  class="radeyeTable1Odd" align="right">439</td>
<td  class="radeyeTable1Odd" align="right">$10.92</td>
<td  class="radeyeTable1Odd" align="right">31.6</td>
<td  class="radeyeTable2Odd" align="right">5.32</td>
<td  class="radeyeTable2Odd" align="right">.339</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7340263">gevak</a></td>
<td  class="radeyeTable1Even" align="right">1514</td>
<td  class="radeyeTable1Even" align="right">352</td>
<td  class="radeyeTable1Even" align="right">$8.59</td>
<td  class="radeyeTable1Even" align="right">27.6</td>
<td  class="radeyeTable2Even" align="right">3.21</td>
<td  class="radeyeTable2Even" align="right">.092</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7452777">CrazyScratcher</a></td>
<td  class="radeyeTable1Odd" align="right">1512</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$9.42</td>
<td  class="radeyeTable1Odd" align="right">29.1</td>
<td  class="radeyeTable2Odd" align="right">3.96</td>
<td  class="radeyeTable2Odd" align="right">.159</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=7391222">zvone</a></td>
<td  class="radeyeTable1Even" align="right">1507</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$9.24</td>
<td  class="radeyeTable1Even" align="right">28.7</td>
<td  class="radeyeTable2Even" align="right">3.83</td>
<td  class="radeyeTable2Even" align="right">.152</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=154090">merolish</a></td>
<td  class="radeyeTable1Odd" align="right">1504</td>
<td  class="radeyeTable1Odd" align="right">294</td>
<td  class="radeyeTable1Odd" align="right">$6.53</td>
<td  class="radeyeTable1Odd" align="right">22.8</td>
<td  class="radeyeTable2Odd" align="right">1.65</td>
<td  class="radeyeTable2Odd" align="right">.018</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268212">dukeola</a></td>
<td  class="radeyeTable1Even" align="right">1502</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$6.68</td>
<td  class="radeyeTable1Even" align="right">23.1</td>
<td  class="radeyeTable2Even" align="right">1.78</td>
<td  class="radeyeTable2Even" align="right">.023</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=268951">sosonel</a></td>
<td  class="radeyeTable1Odd" align="right">1502</td>
<td  class="radeyeTable1Odd" align="right">239</td>
<td  class="radeyeTable1Odd" align="right">$4.76</td>
<td  class="radeyeTable1Odd" align="right">17.7</td>
<td  class="radeyeTable2Odd" align="right">.645</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextYellow" href="/stat?c=member_profile&amp;cr=138158">leelin</a></td>
<td  class="radeyeTable1Even" align="right">1501</td>
<td  class="radeyeTable1Even" align="right">421</td>
<td  class="radeyeTable1Even" align="right">$9.98</td>
<td  class="radeyeTable1Even" align="right">29.9</td>
<td  class="radeyeTable2Even" align="right">4.53</td>
<td  class="radeyeTable2Even" align="right">.239</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7327909">fiveEasyPieces</a></td>
<td  class="radeyeTable1Odd" align="right">1498</td>
<td  class="radeyeTable1Odd" align="right">256</td>
<td  class="radeyeTable1Odd" align="right">$5.16</td>
<td  class="radeyeTable1Odd" align="right">18.9</td>
<td  class="radeyeTable2Odd" align="right">.850</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=293239">jlittle</a></td>
<td  class="radeyeTable1Even" align="right">1493</td>
<td  class="radeyeTable1Even" align="right">403</td>
<td  class="radeyeTable1Even" align="right">$9.21</td>
<td  class="radeyeTable1Even" align="right">28.4</td>
<td  class="radeyeTable2Even" align="right">3.89</td>
<td  class="radeyeTable2Even" align="right">.173</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=108438">Cougar</a></td>
<td  class="radeyeTable1Odd" align="right">1492</td>
<td  class="radeyeTable1Odd" align="right">408</td>
<td  class="radeyeTable1Odd" align="right">$9.29</td>
<td  class="radeyeTable1Odd" align="right">28.5</td>
<td  class="radeyeTable2Odd" align="right">3.97</td>
<td  class="radeyeTable2Odd" align="right">.181</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=290448">BryanChen</a></td>
<td  class="radeyeTable1Even" align="right">1492</td>
<td  class="radeyeTable1Even" align="right">203</td>
<td  class="radeyeTable1Even" align="right">$3.30</td>
<td  class="radeyeTable1Even" align="right">12.8</td>
<td  class="radeyeTable2Even" align="right">.204</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=346607">kalmakka</a></td>
<td  class="radeyeTable1Odd" align="right">1491</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$8.62</td>
<td  class="radeyeTable1Odd" align="right">27.2</td>
<td  class="radeyeTable2Odd" align="right">3.39</td>
<td  class="radeyeTable2Odd" align="right">.121</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7440483">moggy</a></td>
<td  class="radeyeTable1Even" align="right">1491</td>
<td  class="radeyeTable1Even" align="right">781</td>
<td  class="radeyeTable1Even" align="right">$18.39</td>
<td  class="radeyeTable1Even" align="right">38.3</td>
<td  class="radeyeTable2Even" align="right">10.9</td>
<td  class="radeyeTable2Even" align="right">2.02</td>
<td  class="radeyeTable2Even" align="right">.132</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable3Even" align="right">.001</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=251130">wyatt</a></td>
<td  class="radeyeTable1Odd" align="right">1486</td>
<td  class="radeyeTable1Odd" align="right">338</td>
<td  class="radeyeTable1Odd" align="right">$7.19</td>
<td  class="radeyeTable1Odd" align="right">24.1</td>
<td  class="radeyeTable2Odd" align="right">2.25</td>
<td  class="radeyeTable2Odd" align="right">.046</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7447384">port6000</a></td>
<td  class="radeyeTable1Even" align="right">1486</td>
<td  class="radeyeTable1Even" align="right">305</td>
<td  class="radeyeTable1Even" align="right">$6.24</td>
<td  class="radeyeTable1Even" align="right">21.8</td>
<td  class="radeyeTable2Even" align="right">1.56</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=267685">bengle</a></td>
<td  class="radeyeTable1Odd" align="right">1485</td>
<td  class="radeyeTable1Odd" align="right">518</td>
<td  class="radeyeTable1Odd" align="right">$11.75</td>
<td  class="radeyeTable1Odd" align="right">32.2</td>
<td  class="radeyeTable2Odd" align="right">6.17</td>
<td  class="radeyeTable2Odd" align="right">.547</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279059">CompuSciNut</a></td>
<td  class="radeyeTable1Even" align="right">1482</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$8.32</td>
<td  class="radeyeTable1Even" align="right">26.5</td>
<td  class="radeyeTable2Even" align="right">3.18</td>
<td  class="radeyeTable2Even" align="right">.108</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=269702">coachbudka</a></td>
<td  class="radeyeTable1Odd" align="right">1481</td>
<td  class="radeyeTable1Odd" align="right">411</td>
<td  class="radeyeTable1Odd" align="right">$8.98</td>
<td  class="radeyeTable1Odd" align="right">27.7</td>
<td  class="radeyeTable2Odd" align="right">3.76</td>
<td  class="radeyeTable2Odd" align="right">.168</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=293575">nealzane</a></td>
<td  class="radeyeTable1Even" align="right">1480</td>
<td  class="radeyeTable1Even" align="right">545</td>
<td  class="radeyeTable1Even" align="right">$12.22</td>
<td  class="radeyeTable1Even" align="right">32.8</td>
<td  class="radeyeTable2Even" align="right">6.61</td>
<td  class="radeyeTable2Even" align="right">.641</td>
<td  class="radeyeTable2Even" align="right">.008</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=111057">bm999</a></td>
<td  class="radeyeTable1Odd" align="right">1478</td>
<td  class="radeyeTable1Odd" align="right">471</td>
<td  class="radeyeTable1Odd" align="right">$10.37</td>
<td  class="radeyeTable1Odd" align="right">30.1</td>
<td  class="radeyeTable2Odd" align="right">4.99</td>
<td  class="radeyeTable2Odd" align="right">.334</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=290395">pmadden</a></td>
<td  class="radeyeTable1Even" align="right">1477</td>
<td  class="radeyeTable1Even" align="right">305</td>
<td  class="radeyeTable1Even" align="right">$5.97</td>
<td  class="radeyeTable1Even" align="right">21.0</td>
<td  class="radeyeTable2Even" align="right">1.42</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=301395">HardCoder</a></td>
<td  class="radeyeTable1Odd" align="right">1477</td>
<td  class="radeyeTable1Odd" align="right">582</td>
<td  class="radeyeTable1Odd" align="right">$12.98</td>
<td  class="radeyeTable1Odd" align="right">33.6</td>
<td  class="radeyeTable2Odd" align="right">7.22</td>
<td  class="radeyeTable2Odd" align="right">.805</td>
<td  class="radeyeTable2Odd" align="right">.017</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7396531">RandySaint</a></td>
<td  class="radeyeTable1Even" align="right">1477</td>
<td  class="radeyeTable1Even" align="right">257</td>
<td  class="radeyeTable1Even" align="right">$4.56</td>
<td  class="radeyeTable1Even" align="right">16.9</td>
<td  class="radeyeTable2Even" align="right">.656</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=273434">Eeyore</a></td>
<td  class="radeyeTable1Odd" align="right">1476</td>
<td  class="radeyeTable1Odd" align="right">504</td>
<td  class="radeyeTable1Odd" align="right">$11.10</td>
<td  class="radeyeTable1Odd" align="right">31.2</td>
<td  class="radeyeTable2Odd" align="right">5.64</td>
<td  class="radeyeTable2Odd" align="right">.446</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=261393">Symme7ry</a></td>
<td  class="radeyeTable1Even" align="right">1475</td>
<td  class="radeyeTable1Even" align="right">291</td>
<td  class="radeyeTable1Even" align="right">$5.49</td>
<td  class="radeyeTable1Even" align="right">19.6</td>
<td  class="radeyeTable2Even" align="right">1.14</td>
<td  class="radeyeTable2Even" align="right">.009</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=290667">MisterZimbu</a></td>
<td  class="radeyeTable1Odd" align="right">1473</td>
<td  class="radeyeTable1Odd" align="right">188</td>
<td  class="radeyeTable1Odd" align="right">$2.34</td>
<td  class="radeyeTable1Odd" align="right">9.21</td>
<td  class="radeyeTable2Odd" align="right">.071</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=298274">cbaray</a></td>
<td  class="radeyeTable1Even" align="right">1472</td>
<td  class="radeyeTable1Even" align="right">313</td>
<td  class="radeyeTable1Even" align="right">$6.02</td>
<td  class="radeyeTable1Even" align="right">21.1</td>
<td  class="radeyeTable2Even" align="right">1.48</td>
<td  class="radeyeTable2Even" align="right">.019</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7474520">BlackH</a></td>
<td  class="radeyeTable1Odd" align="right">1469</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$7.89</td>
<td  class="radeyeTable1Odd" align="right">25.4</td>
<td  class="radeyeTable2Odd" align="right">2.88</td>
<td  class="radeyeTable2Odd" align="right">.092</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=348053">Augusto</a></td>
<td  class="radeyeTable1Even" align="right">1468</td>
<td  class="radeyeTable1Even" align="right">422</td>
<td  class="radeyeTable1Even" align="right">$8.81</td>
<td  class="radeyeTable1Even" align="right">27.2</td>
<td  class="radeyeTable2Even" align="right">3.66</td>
<td  class="radeyeTable2Even" align="right">.163</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=252277">Farlox</a></td>
<td  class="radeyeTable1Odd" align="right">1467</td>
<td  class="radeyeTable1Odd" align="right">430</td>
<td  class="radeyeTable1Odd" align="right">$8.95</td>
<td  class="radeyeTable1Odd" align="right">27.5</td>
<td  class="radeyeTable2Odd" align="right">3.79</td>
<td  class="radeyeTable2Odd" align="right">.180</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=275558">zhliu</a></td>
<td  class="radeyeTable1Even" align="right">1467</td>
<td  class="radeyeTable1Even" align="right">483</td>
<td  class="radeyeTable1Even" align="right">$10.27</td>
<td  class="radeyeTable1Even" align="right">29.7</td>
<td  class="radeyeTable2Even" align="right">4.96</td>
<td  class="radeyeTable2Even" align="right">.336</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=349303">OpenGL4Dummies</a></td>
<td  class="radeyeTable1Odd" align="right">1467</td>
<td  class="radeyeTable1Odd" align="right">310</td>
<td  class="radeyeTable1Odd" align="right">$5.80</td>
<td  class="radeyeTable1Odd" align="right">20.4</td>
<td  class="radeyeTable2Odd" align="right">1.35</td>
<td  class="radeyeTable2Odd" align="right">.015</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=129063">mktong</a></td>
<td  class="radeyeTable1Even" align="right">1465</td>
<td  class="radeyeTable1Even" align="right">391</td>
<td  class="radeyeTable1Even" align="right">$7.90</td>
<td  class="radeyeTable1Even" align="right">25.4</td>
<td  class="radeyeTable2Even" align="right">2.92</td>
<td  class="radeyeTable2Even" align="right">.096</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7442359">cristipp</a></td>
<td  class="radeyeTable1Odd" align="right">1465</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$7.76</td>
<td  class="radeyeTable1Odd" align="right">25.1</td>
<td  class="radeyeTable2Odd" align="right">2.80</td>
<td  class="radeyeTable2Odd" align="right">.088</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=278460">Ukraine</a></td>
<td  class="radeyeTable1Even" align="right">1461</td>
<td  class="radeyeTable1Even" align="right">477</td>
<td  class="radeyeTable1Even" align="right">$9.92</td>
<td  class="radeyeTable1Even" align="right">29.1</td>
<td  class="radeyeTable2Even" align="right">4.67</td>
<td  class="radeyeTable2Even" align="right">.297</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=309417">yuer</a></td>
<td  class="radeyeTable1Odd" align="right">1461</td>
<td  class="radeyeTable1Odd" align="right">399</td>
<td  class="radeyeTable1Odd" align="right">$7.99</td>
<td  class="radeyeTable1Odd" align="right">25.5</td>
<td  class="radeyeTable2Odd" align="right">3.01</td>
<td  class="radeyeTable2Odd" align="right">.104</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=160049">FogleBird</a></td>
<td  class="radeyeTable1Even" align="right">1459</td>
<td  class="radeyeTable1Even" align="right">390</td>
<td  class="radeyeTable1Even" align="right">$7.68</td>
<td  class="radeyeTable1Even" align="right">24.9</td>
<td  class="radeyeTable2Even" align="right">2.75</td>
<td  class="radeyeTable2Even" align="right">.089</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=301509">EugeneP</a></td>
<td  class="radeyeTable1Odd" align="right">1459</td>
<td  class="radeyeTable1Odd" align="right">309</td>
<td  class="radeyeTable1Odd" align="right">$5.52</td>
<td  class="radeyeTable1Odd" align="right">19.6</td>
<td  class="radeyeTable2Odd" align="right">1.23</td>
<td  class="radeyeTable2Odd" align="right">.012</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=302085">userundefined</a></td>
<td  class="radeyeTable1Even" align="right">1457</td>
<td  class="radeyeTable1Even" align="right">345</td>
<td  class="radeyeTable1Even" align="right">$6.43</td>
<td  class="radeyeTable1Even" align="right">21.9</td>
<td  class="radeyeTable2Even" align="right">1.83</td>
<td  class="radeyeTable2Even" align="right">.033</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7277868">swietlik</a></td>
<td  class="radeyeTable1Odd" align="right">1457</td>
<td  class="radeyeTable1Odd" align="right">233</td>
<td  class="radeyeTable1Odd" align="right">$3.30</td>
<td  class="radeyeTable1Odd" align="right">12.7</td>
<td  class="radeyeTable2Odd" align="right">.269</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7446397">rotoZOOM</a></td>
<td  class="radeyeTable1Even" align="right">1455</td>
<td  class="radeyeTable1Even" align="right">309</td>
<td  class="radeyeTable1Even" align="right">$5.42</td>
<td  class="radeyeTable1Even" align="right">19.3</td>
<td  class="radeyeTable2Even" align="right">1.17</td>
<td  class="radeyeTable2Even" align="right">.011</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=274323">pearl</a></td>
<td  class="radeyeTable1Odd" align="right">1450</td>
<td  class="radeyeTable1Odd" align="right">337</td>
<td  class="radeyeTable1Odd" align="right">$6.01</td>
<td  class="radeyeTable1Odd" align="right">20.8</td>
<td  class="radeyeTable2Odd" align="right">1.57</td>
<td  class="radeyeTable2Odd" align="right">.024</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=261599">Tadrow</a></td>
<td  class="radeyeTable1Even" align="right">1449</td>
<td  class="radeyeTable1Even" align="right">299</td>
<td  class="radeyeTable1Even" align="right">$4.97</td>
<td  class="radeyeTable1Even" align="right">17.9</td>
<td  class="radeyeTable2Even" align="right">.956</td>
<td  class="radeyeTable2Even" align="right">.008</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=267272">\u0043\u0042</a></td>
<td  class="radeyeTable1Odd" align="right">1444</td>
<td  class="radeyeTable1Odd" align="right">317</td>
<td  class="radeyeTable1Odd" align="right">$5.31</td>
<td  class="radeyeTable1Odd" align="right">18.9</td>
<td  class="radeyeTable2Odd" align="right">1.16</td>
<td  class="radeyeTable2Odd" align="right">.012</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=152610">puzzlehacker</a></td>
<td  class="radeyeTable1Even" align="right">1432</td>
<td  class="radeyeTable1Even" align="right">327</td>
<td  class="radeyeTable1Even" align="right">$5.25</td>
<td  class="radeyeTable1Even" align="right">18.6</td>
<td  class="radeyeTable2Even" align="right">1.17</td>
<td  class="radeyeTable2Even" align="right">.012</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7212791">Blazde</a></td>
<td  class="radeyeTable1Odd" align="right">1431</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$6.70</td>
<td  class="radeyeTable1Odd" align="right">22.3</td>
<td  class="radeyeTable2Odd" align="right">2.14</td>
<td  class="radeyeTable2Odd" align="right">.055</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=301376">Ag98</a></td>
<td  class="radeyeTable1Even" align="right">1427</td>
<td  class="radeyeTable1Even" align="right">309</td>
<td  class="radeyeTable1Even" align="right">$4.66</td>
<td  class="radeyeTable1Even" align="right">16.9</td>
<td  class="radeyeTable2Even" align="right">.859</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=153140">harv</a></td>
<td  class="radeyeTable1Odd" align="right">1425</td>
<td  class="radeyeTable1Odd" align="right">532</td>
<td  class="radeyeTable1Odd" align="right">$9.99</td>
<td  class="radeyeTable1Odd" align="right">28.7</td>
<td  class="radeyeTable2Odd" align="right">4.83</td>
<td  class="radeyeTable2Odd" align="right">.369</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7457627">desktopcats</a></td>
<td  class="radeyeTable1Even" align="right">1425</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$6.54</td>
<td  class="radeyeTable1Even" align="right">21.9</td>
<td  class="radeyeTable2Even" align="right">2.03</td>
<td  class="radeyeTable2Even" align="right">.050</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=263249">[UoM]Icenine</a></td>
<td  class="radeyeTable1Odd" align="right">1422</td>
<td  class="radeyeTable1Odd" align="right">410</td>
<td  class="radeyeTable1Odd" align="right">$7.08</td>
<td  class="radeyeTable1Odd" align="right">23.1</td>
<td  class="radeyeTable2Odd" align="right">2.44</td>
<td  class="radeyeTable2Odd" align="right">.080</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7462740">ploh</a></td>
<td  class="radeyeTable1Even" align="right">1414</td>
<td  class="radeyeTable1Even" align="right">359</td>
<td  class="radeyeTable1Even" align="right">$5.61</td>
<td  class="radeyeTable1Even" align="right">19.5</td>
<td  class="radeyeTable2Even" align="right">1.45</td>
<td  class="radeyeTable2Even" align="right">.024</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=270932">vv</a></td>
<td  class="radeyeTable1Odd" align="right">1411</td>
<td  class="radeyeTable1Odd" align="right">290</td>
<td  class="radeyeTable1Odd" align="right">$3.77</td>
<td  class="radeyeTable1Odd" align="right">14.0</td>
<td  class="radeyeTable2Odd" align="right">.514</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=280198">alanm</a></td>
<td  class="radeyeTable1Even" align="right">1411</td>
<td  class="radeyeTable1Even" align="right">487</td>
<td  class="radeyeTable1Even" align="right">$8.57</td>
<td  class="radeyeTable1Even" align="right">26.0</td>
<td  class="radeyeTable2Even" align="right">3.69</td>
<td  class="radeyeTable2Even" align="right">.208</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7465390">Dan[Popovici]</a></td>
<td  class="radeyeTable1Odd" align="right">1411</td>
<td  class="radeyeTable1Odd" align="right">314</td>
<td  class="radeyeTable1Odd" align="right">$4.39</td>
<td  class="radeyeTable1Odd" align="right">16.0</td>
<td  class="radeyeTable2Odd" align="right">.773</td>
<td  class="radeyeTable2Odd" align="right">.005</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=282560">leadhyena_inran</a></td>
<td  class="radeyeTable1Even" align="right">1407</td>
<td  class="radeyeTable1Even" align="right">525</td>
<td  class="radeyeTable1Even" align="right">$9.29</td>
<td  class="radeyeTable1Even" align="right">27.3</td>
<td  class="radeyeTable2Even" align="right">4.30</td>
<td  class="radeyeTable2Even" align="right">.299</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299494">minkov</a></td>
<td  class="radeyeTable1Odd" align="right">1407</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$6.06</td>
<td  class="radeyeTable1Odd" align="right">20.5</td>
<td  class="radeyeTable2Odd" align="right">1.76</td>
<td  class="radeyeTable2Odd" align="right">.041</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=280135">tbone343</a></td>
<td  class="radeyeTable1Even" align="right">1404</td>
<td  class="radeyeTable1Even" align="right">333</td>
<td  class="radeyeTable1Even" align="right">$4.69</td>
<td  class="radeyeTable1Even" align="right">16.9</td>
<td  class="radeyeTable2Even" align="right">.943</td>
<td  class="radeyeTable2Even" align="right">.010</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7465503">RaginAzn</a></td>
<td  class="radeyeTable1Odd" align="right">1401</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$5.90</td>
<td  class="radeyeTable1Odd" align="right">20.1</td>
<td  class="radeyeTable2Odd" align="right">1.69</td>
<td  class="radeyeTable2Odd" align="right">.038</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7479088">dario</a></td>
<td  class="radeyeTable1Even" align="right">1398</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$5.83</td>
<td  class="radeyeTable1Even" align="right">19.9</td>
<td  class="radeyeTable2Even" align="right">1.64</td>
<td  class="radeyeTable2Even" align="right">.035</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7305703">Dumitru</a></td>
<td  class="radeyeTable1Odd" align="right">1394</td>
<td  class="radeyeTable1Odd" align="right">506</td>
<td  class="radeyeTable1Odd" align="right">$8.49</td>
<td  class="radeyeTable1Odd" align="right">25.7</td>
<td  class="radeyeTable2Odd" align="right">3.66</td>
<td  class="radeyeTable2Odd" align="right">.217</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=150257">qiui</a></td>
<td  class="radeyeTable1Even" align="right">1387</td>
<td  class="radeyeTable1Even" align="right">353</td>
<td  class="radeyeTable1Even" align="right">$4.79</td>
<td  class="radeyeTable1Even" align="right">17.0</td>
<td  class="radeyeTable2Even" align="right">1.04</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=262598">ccooper</a></td>
<td  class="radeyeTable1Odd" align="right">1385</td>
<td  class="radeyeTable1Odd" align="right">274</td>
<td  class="radeyeTable1Odd" align="right">$2.84</td>
<td  class="radeyeTable1Odd" align="right">10.9</td>
<td  class="radeyeTable2Odd" align="right">.253</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279956">shechter</a></td>
<td  class="radeyeTable1Even" align="right">1385</td>
<td  class="radeyeTable1Even" align="right">305</td>
<td  class="radeyeTable1Even" align="right">$3.58</td>
<td  class="radeyeTable1Even" align="right">13.4</td>
<td  class="radeyeTable2Even" align="right">.483</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=308036">Fred[dy]</a></td>
<td  class="radeyeTable1Odd" align="right">1385</td>
<td  class="radeyeTable1Odd" align="right">261</td>
<td  class="radeyeTable1Odd" align="right">$2.52</td>
<td  class="radeyeTable1Odd" align="right">9.75</td>
<td  class="radeyeTable2Odd" align="right">.176</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159758">entity</a></td>
<td  class="radeyeTable1Even" align="right">1382</td>
<td  class="radeyeTable1Even" align="right">222</td>
<td  class="radeyeTable1Even" align="right">$1.59</td>
<td  class="radeyeTable1Even" align="right">6.26</td>
<td  class="radeyeTable2Even" align="right">.042</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=278402">nacul</a></td>
<td  class="radeyeTable1Odd" align="right">1373</td>
<td  class="radeyeTable1Odd" align="right">339</td>
<td  class="radeyeTable1Odd" align="right">$4.15</td>
<td  class="radeyeTable1Odd" align="right">15.1</td>
<td  class="radeyeTable2Odd" align="right">.737</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7444599">GamePimp</a></td>
<td  class="radeyeTable1Even" align="right">1373</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$5.21</td>
<td  class="radeyeTable1Even" align="right">18.1</td>
<td  class="radeyeTable2Even" align="right">1.31</td>
<td  class="radeyeTable2Even" align="right">.025</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159446">Olorin</a></td>
<td  class="radeyeTable1Odd" align="right">1372</td>
<td  class="radeyeTable1Odd" align="right">397</td>
<td  class="radeyeTable1Odd" align="right">$5.48</td>
<td  class="radeyeTable1Odd" align="right">18.8</td>
<td  class="radeyeTable2Odd" align="right">1.49</td>
<td  class="radeyeTable2Odd" align="right">.031</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159168">Virtual</a></td>
<td  class="radeyeTable1Even" align="right">1371</td>
<td  class="radeyeTable1Even" align="right">436</td>
<td  class="radeyeTable1Even" align="right">$6.31</td>
<td  class="radeyeTable1Even" align="right">20.9</td>
<td  class="radeyeTable2Even" align="right">2.05</td>
<td  class="radeyeTable2Even" align="right">.064</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7270519">chippydip</a></td>
<td  class="radeyeTable1Odd" align="right">1368</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$5.10</td>
<td  class="radeyeTable1Odd" align="right">17.8</td>
<td  class="radeyeTable2Odd" align="right">1.26</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=266764">cgu</a></td>
<td  class="radeyeTable1Even" align="right">1367</td>
<td  class="radeyeTable1Even" align="right">350</td>
<td  class="radeyeTable1Even" align="right">$4.27</td>
<td  class="radeyeTable1Even" align="right">15.4</td>
<td  class="radeyeTable2Even" align="right">.811</td>
<td  class="radeyeTable2Even" align="right">.007</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=306872">TheSkipper</a></td>
<td  class="radeyeTable1Odd" align="right">1367</td>
<td  class="radeyeTable1Odd" align="right">491</td>
<td  class="radeyeTable1Odd" align="right">$7.42</td>
<td  class="radeyeTable1Odd" align="right">23.3</td>
<td  class="radeyeTable2Odd" align="right">2.88</td>
<td  class="radeyeTable2Odd" align="right">.139</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=289824">MPhk</a></td>
<td  class="radeyeTable1Even" align="right">1362</td>
<td  class="radeyeTable1Even" align="right">372</td>
<td  class="radeyeTable1Even" align="right">$4.67</td>
<td  class="radeyeTable1Even" align="right">16.5</td>
<td  class="radeyeTable2Even" align="right">1.04</td>
<td  class="radeyeTable2Even" align="right">.015</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=279175">PeskyGnat</a></td>
<td  class="radeyeTable1Odd" align="right">1356</td>
<td  class="radeyeTable1Odd" align="right">263</td>
<td  class="radeyeTable1Odd" align="right">$2.09</td>
<td  class="radeyeTable1Odd" align="right">8.13</td>
<td  class="radeyeTable2Odd" align="right">.118</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=287614">argolite</a></td>
<td  class="radeyeTable1Even" align="right">1356</td>
<td  class="radeyeTable1Even" align="right">298</td>
<td  class="radeyeTable1Even" align="right">$2.87</td>
<td  class="radeyeTable1Even" align="right">10.9</td>
<td  class="radeyeTable2Even" align="right">.291</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297731">TheCois</a></td>
<td  class="radeyeTable1Odd" align="right">1354</td>
<td  class="radeyeTable1Odd" align="right">440</td>
<td  class="radeyeTable1Odd" align="right">$6.00</td>
<td  class="radeyeTable1Odd" align="right">20.1</td>
<td  class="radeyeTable2Odd" align="right">1.87</td>
<td  class="radeyeTable2Odd" align="right">.054</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7445405">sargentm</a></td>
<td  class="radeyeTable1Even" align="right">1354</td>
<td  class="radeyeTable1Even" align="right">232</td>
<td  class="radeyeTable1Even" align="right">$1.42</td>
<td  class="radeyeTable1Even" align="right">5.60</td>
<td  class="radeyeTable2Even" align="right">.036</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=278003">jxh106</a></td>
<td  class="radeyeTable1Odd" align="right">1352</td>
<td  class="radeyeTable1Odd" align="right">394</td>
<td  class="radeyeTable1Odd" align="right">$4.94</td>
<td  class="radeyeTable1Odd" align="right">17.3</td>
<td  class="radeyeTable2Odd" align="right">1.21</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159400">xzhangz</a></td>
<td  class="radeyeTable1Even" align="right">1350</td>
<td  class="radeyeTable1Even" align="right">310</td>
<td  class="radeyeTable1Even" align="right">$3.03</td>
<td  class="radeyeTable1Even" align="right">11.4</td>
<td  class="radeyeTable2Even" align="right">.346</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=345046">andreicsibi</a></td>
<td  class="radeyeTable1Odd" align="right">1346</td>
<td  class="radeyeTable1Odd" align="right">264</td>
<td  class="radeyeTable1Odd" align="right">$1.97</td>
<td  class="radeyeTable1Odd" align="right">7.66</td>
<td  class="radeyeTable2Odd" align="right">.101</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=284038">aussie</a></td>
<td  class="radeyeTable1Even" align="right">1345</td>
<td  class="radeyeTable1Even" align="right">588</td>
<td  class="radeyeTable1Even" align="right">$8.90</td>
<td  class="radeyeTable1Even" align="right">26.0</td>
<td  class="radeyeTable2Even" align="right">4.09</td>
<td  class="radeyeTable2Even" align="right">.316</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7348476">zsacul</a></td>
<td  class="radeyeTable1Odd" align="right">1345</td>
<td  class="radeyeTable1Odd" align="right">339</td>
<td  class="radeyeTable1Odd" align="right">$3.58</td>
<td  class="radeyeTable1Odd" align="right">13.2</td>
<td  class="radeyeTable2Odd" align="right">.546</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=156618">mckavity</a></td>
<td  class="radeyeTable1Even" align="right">1344</td>
<td  class="radeyeTable1Even" align="right">198</td>
<td  class="radeyeTable1Even" align="right">$0.70</td>
<td  class="radeyeTable1Even" align="right">2.81</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7351392">lxrossi</a></td>
<td  class="radeyeTable1Odd" align="right">1339</td>
<td  class="radeyeTable1Odd" align="right">271</td>
<td  class="radeyeTable1Odd" align="right">$2.01</td>
<td  class="radeyeTable1Odd" align="right">7.81</td>
<td  class="radeyeTable2Odd" align="right">.114</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7444075">Chang1</a></td>
<td  class="radeyeTable1Even" align="right">1337</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$2.62</td>
<td  class="radeyeTable1Even" align="right">9.98</td>
<td  class="radeyeTable2Even" align="right">.248</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7364113">Tinkles</a></td>
<td  class="radeyeTable1Odd" align="right">1334</td>
<td  class="radeyeTable1Odd" align="right">323</td>
<td  class="radeyeTable1Odd" align="right">$3.03</td>
<td  class="radeyeTable1Odd" align="right">11.4</td>
<td  class="radeyeTable2Odd" align="right">.370</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7475798">guru_cyprus</a></td>
<td  class="radeyeTable1Even" align="right">1333</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$4.35</td>
<td  class="radeyeTable1Even" align="right">15.5</td>
<td  class="radeyeTable2Even" align="right">.925</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7267401">TheFaxman</a></td>
<td  class="radeyeTable1Odd" align="right">1331</td>
<td  class="radeyeTable1Odd" align="right">415</td>
<td  class="radeyeTable1Odd" align="right">$4.95</td>
<td  class="radeyeTable1Odd" align="right">17.2</td>
<td  class="radeyeTable2Odd" align="right">1.26</td>
<td  class="radeyeTable2Odd" align="right">.026</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=265774">leibniz</a></td>
<td  class="radeyeTable1Even" align="right">1329</td>
<td  class="radeyeTable1Even" align="right">396</td>
<td  class="radeyeTable1Even" align="right">$4.50</td>
<td  class="radeyeTable1Even" align="right">15.9</td>
<td  class="radeyeTable2Even" align="right">1.02</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7443751">ibarrac</a></td>
<td  class="radeyeTable1Odd" align="right">1323</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$4.15</td>
<td  class="radeyeTable1Odd" align="right">14.9</td>
<td  class="radeyeTable2Odd" align="right">.835</td>
<td  class="radeyeTable2Odd" align="right">.011</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=151679">yangtianzhi</a></td>
<td  class="radeyeTable1Even" align="right">1321</td>
<td  class="radeyeTable1Even" align="right">336</td>
<td  class="radeyeTable1Even" align="right">$3.10</td>
<td  class="radeyeTable1Even" align="right">11.6</td>
<td  class="radeyeTable2Even" align="right">.408</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=153939">eug</a></td>
<td  class="radeyeTable1Odd" align="right">1318</td>
<td  class="radeyeTable1Odd" align="right">415</td>
<td  class="radeyeTable1Odd" align="right">$4.69</td>
<td  class="radeyeTable1Odd" align="right">16.4</td>
<td  class="radeyeTable2Odd" align="right">1.13</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7356052">risingdragon</a></td>
<td  class="radeyeTable1Even" align="right">1318</td>
<td  class="radeyeTable1Even" align="right">327</td>
<td  class="radeyeTable1Even" align="right">$2.85</td>
<td  class="radeyeTable1Even" align="right">10.7</td>
<td  class="radeyeTable2Even" align="right">.321</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7477775">sharprose</a></td>
<td  class="radeyeTable1Odd" align="right">1318</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$4.06</td>
<td  class="radeyeTable1Odd" align="right">14.6</td>
<td  class="radeyeTable2Odd" align="right">.803</td>
<td  class="radeyeTable2Odd" align="right">.010</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=272999">sh_maestro</a></td>
<td  class="radeyeTable1Even" align="right">1315</td>
<td  class="radeyeTable1Even" align="right">297</td>
<td  class="radeyeTable1Even" align="right">$2.19</td>
<td  class="radeyeTable1Even" align="right">8.45</td>
<td  class="radeyeTable2Even" align="right">.161</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=111365">huntergt</a></td>
<td  class="radeyeTable1Odd" align="right">1313</td>
<td  class="radeyeTable1Odd" align="right">270</td>
<td  class="radeyeTable1Odd" align="right">$1.64</td>
<td  class="radeyeTable1Odd" align="right">6.42</td>
<td  class="radeyeTable2Odd" align="right">.071</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=296547">tiki</a></td>
<td  class="radeyeTable1Even" align="right">1313</td>
<td  class="radeyeTable1Even" align="right">330</td>
<td  class="radeyeTable1Even" align="right">$2.82</td>
<td  class="radeyeTable1Even" align="right">10.6</td>
<td  class="radeyeTable2Even" align="right">.317</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=264065">JayTea</a></td>
<td  class="radeyeTable1Odd" align="right">1309</td>
<td  class="radeyeTable1Odd" align="right">205</td>
<td  class="radeyeTable1Odd" align="right">$0.55</td>
<td  class="radeyeTable1Odd" align="right">2.19</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=296999">prof</a></td>
<td  class="radeyeTable1Even" align="right">1309</td>
<td  class="radeyeTable1Even" align="right">290</td>
<td  class="radeyeTable1Even" align="right">$1.97</td>
<td  class="radeyeTable1Even" align="right">7.64</td>
<td  class="radeyeTable2Even" align="right">.126</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=349226">viktoras</a></td>
<td  class="radeyeTable1Odd" align="right">1308</td>
<td  class="radeyeTable1Odd" align="right">238</td>
<td  class="radeyeTable1Odd" align="right">$1.03</td>
<td  class="radeyeTable1Odd" align="right">4.09</td>
<td  class="radeyeTable2Odd" align="right">.019</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7479814">marcr</a></td>
<td  class="radeyeTable1Even" align="right">1308</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$3.88</td>
<td  class="radeyeTable1Even" align="right">14.0</td>
<td  class="radeyeTable2Even" align="right">.732</td>
<td  class="radeyeTable2Even" align="right">.009</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299221">harisuthan</a></td>
<td  class="radeyeTable1Odd" align="right">1306</td>
<td  class="radeyeTable1Odd" align="right">314</td>
<td  class="radeyeTable1Odd" align="right">$2.40</td>
<td  class="radeyeTable1Odd" align="right">9.19</td>
<td  class="radeyeTable2Odd" align="right">.213</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7473757">armadillo</a></td>
<td  class="radeyeTable1Even" align="right">1306</td>
<td  class="radeyeTable1Even" align="right">305</td>
<td  class="radeyeTable1Even" align="right">$2.23</td>
<td  class="radeyeTable1Even" align="right">8.57</td>
<td  class="radeyeTable2Even" align="right">.172</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7478728">Dyushka</a></td>
<td  class="radeyeTable1Odd" align="right">1304</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$3.81</td>
<td  class="radeyeTable1Odd" align="right">13.8</td>
<td  class="radeyeTable2Odd" align="right">.707</td>
<td  class="radeyeTable2Odd" align="right">.008</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=276230">dimkadimon</a></td>
<td  class="radeyeTable1Even" align="right">1303</td>
<td  class="radeyeTable1Even" align="right">339</td>
<td  class="radeyeTable1Even" align="right">$2.86</td>
<td  class="radeyeTable1Even" align="right">10.7</td>
<td  class="radeyeTable2Even" align="right">.343</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=283873">reiners</a></td>
<td  class="radeyeTable1Odd" align="right">1303</td>
<td  class="radeyeTable1Odd" align="right">317</td>
<td  class="radeyeTable1Odd" align="right">$2.42</td>
<td  class="radeyeTable1Odd" align="right">9.25</td>
<td  class="radeyeTable2Odd" align="right">.219</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=295264">ffluv</a></td>
<td  class="radeyeTable1Even" align="right">1303</td>
<td  class="radeyeTable1Even" align="right">388</td>
<td  class="radeyeTable1Even" align="right">$3.84</td>
<td  class="radeyeTable1Even" align="right">13.9</td>
<td  class="radeyeTable2Even" align="right">.724</td>
<td  class="radeyeTable2Even" align="right">.009</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159530">Spike</a></td>
<td  class="radeyeTable1Odd" align="right">1302</td>
<td  class="radeyeTable1Odd" align="right">368</td>
<td  class="radeyeTable1Odd" align="right">$3.42</td>
<td  class="radeyeTable1Odd" align="right">12.6</td>
<td  class="radeyeTable2Odd" align="right">.542</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7450841">pagat</a></td>
<td  class="radeyeTable1Even" align="right">1302</td>
<td  class="radeyeTable1Even" align="right">250</td>
<td  class="radeyeTable1Even" align="right">$1.17</td>
<td  class="radeyeTable1Even" align="right">4.62</td>
<td  class="radeyeTable2Even" align="right">.029</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=113491">hilgart</a></td>
<td  class="radeyeTable1Odd" align="right">1301</td>
<td  class="radeyeTable1Odd" align="right">299</td>
<td  class="radeyeTable1Odd" align="right">$2.04</td>
<td  class="radeyeTable1Odd" align="right">7.89</td>
<td  class="radeyeTable2Odd" align="right">.136</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7385345">mas13081</a></td>
<td  class="radeyeTable1Even" align="right">1298</td>
<td  class="radeyeTable1Even" align="right">268</td>
<td  class="radeyeTable1Even" align="right">$1.44</td>
<td  class="radeyeTable1Even" align="right">5.66</td>
<td  class="radeyeTable2Even" align="right">.053</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7311082">NSantos</a></td>
<td  class="radeyeTable1Odd" align="right">1297</td>
<td  class="radeyeTable1Odd" align="right">352</td>
<td  class="radeyeTable1Odd" align="right">$3.03</td>
<td  class="radeyeTable1Odd" align="right">11.3</td>
<td  class="radeyeTable2Odd" align="right">.400</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=261746">drsammyb</a></td>
<td  class="radeyeTable1Even" align="right">1296</td>
<td  class="radeyeTable1Even" align="right">441</td>
<td  class="radeyeTable1Even" align="right">$4.80</td>
<td  class="radeyeTable1Even" align="right">16.6</td>
<td  class="radeyeTable2Even" align="right">1.23</td>
<td  class="radeyeTable2Even" align="right">.028</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7394954">console</a></td>
<td  class="radeyeTable1Odd" align="right">1294</td>
<td  class="radeyeTable1Odd" align="right">405</td>
<td  class="radeyeTable1Odd" align="right">$4.03</td>
<td  class="radeyeTable1Odd" align="right">14.4</td>
<td  class="radeyeTable2Odd" align="right">.825</td>
<td  class="radeyeTable2Odd" align="right">.012</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7479678">brahe</a></td>
<td  class="radeyeTable1Even" align="right">1294</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$3.63</td>
<td  class="radeyeTable1Even" align="right">13.2</td>
<td  class="radeyeTable2Even" align="right">.632</td>
<td  class="radeyeTable2Even" align="right">.007</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=251654">bamse</a></td>
<td  class="radeyeTable1Odd" align="right">1293</td>
<td  class="radeyeTable1Odd" align="right">255</td>
<td  class="radeyeTable1Odd" align="right">$1.16</td>
<td  class="radeyeTable1Odd" align="right">4.58</td>
<td  class="radeyeTable2Odd" align="right">.028</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=153517">chrisk</a></td>
<td  class="radeyeTable1Even" align="right">1292</td>
<td  class="radeyeTable1Even" align="right">238</td>
<td  class="radeyeTable1Even" align="right">$0.88</td>
<td  class="radeyeTable1Even" align="right">3.51</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7474904">silversmith</a></td>
<td  class="radeyeTable1Odd" align="right">1291</td>
<td  class="radeyeTable1Odd" align="right">385</td>
<td  class="radeyeTable1Odd" align="right">$3.58</td>
<td  class="radeyeTable1Odd" align="right">13.1</td>
<td  class="radeyeTable2Odd" align="right">.617</td>
<td  class="radeyeTable2Odd" align="right">.006</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7479850">Longview</a></td>
<td  class="radeyeTable1Even" align="right">1283</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$3.45</td>
<td  class="radeyeTable1Even" align="right">12.6</td>
<td  class="radeyeTable2Even" align="right">.582</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7215917">roguexz</a></td>
<td  class="radeyeTable1Odd" align="right">1282</td>
<td  class="radeyeTable1Odd" align="right">307</td>
<td  class="radeyeTable1Odd" align="right">$1.95</td>
<td  class="radeyeTable1Odd" align="right">7.55</td>
<td  class="radeyeTable2Odd" align="right">.128</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=311502">vavadera</a></td>
<td  class="radeyeTable1Even" align="right">1275</td>
<td  class="radeyeTable1Even" align="right">386</td>
<td  class="radeyeTable1Even" align="right">$3.34</td>
<td  class="radeyeTable1Even" align="right">12.3</td>
<td  class="radeyeTable2Even" align="right">.544</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=344666">elwethingol</a></td>
<td  class="radeyeTable1Odd" align="right">1274</td>
<td  class="radeyeTable1Odd" align="right">442</td>
<td  class="radeyeTable1Odd" align="right">$4.41</td>
<td  class="radeyeTable1Odd" align="right">15.5</td>
<td  class="radeyeTable2Odd" align="right">1.05</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7328150">spoonmijit</a></td>
<td  class="radeyeTable1Even" align="right">1274</td>
<td  class="radeyeTable1Even" align="right">433</td>
<td  class="radeyeTable1Even" align="right">$4.22</td>
<td  class="radeyeTable1Even" align="right">14.9</td>
<td  class="radeyeTable2Even" align="right">.958</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=343613">phark4evr</a></td>
<td  class="radeyeTable1Odd" align="right">1273</td>
<td  class="radeyeTable1Odd" align="right">312</td>
<td  class="radeyeTable1Odd" align="right">$1.93</td>
<td  class="radeyeTable1Odd" align="right">7.46</td>
<td  class="radeyeTable2Odd" align="right">.125</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=346838">drkstr</a></td>
<td  class="radeyeTable1Even" align="right">1272</td>
<td  class="radeyeTable1Even" align="right">310</td>
<td  class="radeyeTable1Even" align="right">$1.89</td>
<td  class="radeyeTable1Even" align="right">7.30</td>
<td  class="radeyeTable2Even" align="right">.123</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=159437">derelikt</a></td>
<td  class="radeyeTable1Odd" align="right">1271</td>
<td  class="radeyeTable1Odd" align="right">338</td>
<td  class="radeyeTable1Odd" align="right">$2.37</td>
<td  class="radeyeTable1Odd" align="right">9.03</td>
<td  class="radeyeTable2Odd" align="right">.227</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7480480">WildGuruLarry</a></td>
<td  class="radeyeTable1Even" align="right">1270</td>
<td  class="radeyeTable1Even" align="right">385</td>
<td  class="radeyeTable1Even" align="right">$3.25</td>
<td  class="radeyeTable1Even" align="right">11.9</td>
<td  class="radeyeTable2Even" align="right">.512</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=301430">pxjyang</a></td>
<td  class="radeyeTable1Odd" align="right">1268</td>
<td  class="radeyeTable1Odd" align="right">234</td>
<td  class="radeyeTable1Odd" align="right">$0.65</td>
<td  class="radeyeTable1Odd" align="right">2.60</td>
<td  class="radeyeTable2Odd" align="right">.006</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=303388">noah</a></td>
<td  class="radeyeTable1Even" align="right">1268</td>
<td  class="radeyeTable1Even" align="right">416</td>
<td  class="radeyeTable1Even" align="right">$3.81</td>
<td  class="radeyeTable1Even" align="right">13.7</td>
<td  class="radeyeTable2Even" align="right">.758</td>
<td  class="radeyeTable2Even" align="right">.010</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=292985">Saradin</a></td>
<td  class="radeyeTable1Odd" align="right">1267</td>
<td  class="radeyeTable1Odd" align="right">341</td>
<td  class="radeyeTable1Odd" align="right">$2.38</td>
<td  class="radeyeTable1Odd" align="right">9.04</td>
<td  class="radeyeTable2Odd" align="right">.228</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=156822">m_chen</a></td>
<td  class="radeyeTable1Even" align="right">1265</td>
<td  class="radeyeTable1Even" align="right">277</td>
<td  class="radeyeTable1Even" align="right">$1.25</td>
<td  class="radeyeTable1Even" align="right">4.92</td>
<td  class="radeyeTable2Even" align="right">.040</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=270330">[guga]</a></td>
<td  class="radeyeTable1Odd" align="right">1264</td>
<td  class="radeyeTable1Odd" align="right">254</td>
<td  class="radeyeTable1Odd" align="right">$0.89</td>
<td  class="radeyeTable1Odd" align="right">3.55</td>
<td  class="radeyeTable2Odd" align="right">.015</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7458072">bssr</a></td>
<td  class="radeyeTable1Even" align="right">1261</td>
<td  class="radeyeTable1Even" align="right">363</td>
<td  class="radeyeTable1Even" align="right">$2.70</td>
<td  class="radeyeTable1Even" align="right">10.1</td>
<td  class="radeyeTable2Even" align="right">.327</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7442961">dweebo</a></td>
<td  class="radeyeTable1Odd" align="right">1257</td>
<td  class="radeyeTable1Odd" align="right">206</td>
<td  class="radeyeTable1Odd" align="right">$0.30</td>
<td  class="radeyeTable1Odd" align="right">1.20</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7474091">irish_john</a></td>
<td  class="radeyeTable1Even" align="right">1254</td>
<td  class="radeyeTable1Even" align="right">338</td>
<td  class="radeyeTable1Even" align="right">$2.16</td>
<td  class="radeyeTable1Even" align="right">8.26</td>
<td  class="radeyeTable2Even" align="right">.190</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=268007">Mega</a></td>
<td  class="radeyeTable1Odd" align="right">1253</td>
<td  class="radeyeTable1Odd" align="right">221</td>
<td  class="radeyeTable1Odd" align="right">$0.42</td>
<td  class="radeyeTable1Odd" align="right">1.69</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=292136">Icedawn</a></td>
<td  class="radeyeTable1Even" align="right">1252</td>
<td  class="radeyeTable1Even" align="right">345</td>
<td  class="radeyeTable1Even" align="right">$2.26</td>
<td  class="radeyeTable1Even" align="right">8.61</td>
<td  class="radeyeTable2Even" align="right">.209</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154074">dimer0</a></td>
<td  class="radeyeTable1Odd" align="right">1250</td>
<td  class="radeyeTable1Odd" align="right">421</td>
<td  class="radeyeTable1Odd" align="right">$3.61</td>
<td  class="radeyeTable1Odd" align="right">13.1</td>
<td  class="radeyeTable2Odd" align="right">.683</td>
<td  class="radeyeTable2Odd" align="right">.009</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7423174">cparedes</a></td>
<td  class="radeyeTable1Even" align="right">1250</td>
<td  class="radeyeTable1Even" align="right">446</td>
<td  class="radeyeTable1Even" align="right">$4.06</td>
<td  class="radeyeTable1Even" align="right">14.4</td>
<td  class="radeyeTable2Even" align="right">.904</td>
<td  class="radeyeTable2Even" align="right">.017</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=302053">oldbig</a></td>
<td  class="radeyeTable1Odd" align="right">1248</td>
<td  class="radeyeTable1Odd" align="right">505</td>
<td  class="radeyeTable1Odd" align="right">$5.13</td>
<td  class="radeyeTable1Odd" align="right">17.3</td>
<td  class="radeyeTable2Odd" align="right">1.50</td>
<td  class="radeyeTable2Odd" align="right">.049</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=110079">tyrithe</a></td>
<td  class="radeyeTable1Even" align="right">1241</td>
<td  class="radeyeTable1Even" align="right">376</td>
<td  class="radeyeTable1Even" align="right">$2.65</td>
<td  class="radeyeTable1Even" align="right">9.95</td>
<td  class="radeyeTable2Even" align="right">.330</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=294807">lualua</a></td>
<td  class="radeyeTable1Odd" align="right">1241</td>
<td  class="radeyeTable1Odd" align="right">378</td>
<td  class="radeyeTable1Odd" align="right">$2.69</td>
<td  class="radeyeTable1Odd" align="right">10.1</td>
<td  class="radeyeTable2Odd" align="right">.336</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=262889">AmosYang</a></td>
<td  class="radeyeTable1Even" align="right">1240</td>
<td  class="radeyeTable1Even" align="right">270</td>
<td  class="radeyeTable1Even" align="right">$0.93</td>
<td  class="radeyeTable1Even" align="right">3.68</td>
<td  class="radeyeTable2Even" align="right">.020</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=276809">Mambazo</a></td>
<td  class="radeyeTable1Odd" align="right">1240</td>
<td  class="radeyeTable1Odd" align="right">306</td>
<td  class="radeyeTable1Odd" align="right">$1.46</td>
<td  class="radeyeTable1Odd" align="right">5.72</td>
<td  class="radeyeTable2Odd" align="right">.068</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=266149">akhil_bansal</a></td>
<td  class="radeyeTable1Even" align="right">1238</td>
<td  class="radeyeTable1Even" align="right">257</td>
<td  class="radeyeTable1Even" align="right">$0.74</td>
<td  class="radeyeTable1Even" align="right">2.95</td>
<td  class="radeyeTable2Even" align="right">.011</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=299180">isv</a></td>
<td  class="radeyeTable1Odd" align="right">1236</td>
<td  class="radeyeTable1Odd" align="right">356</td>
<td  class="radeyeTable1Odd" align="right">$2.25</td>
<td  class="radeyeTable1Odd" align="right">8.55</td>
<td  class="radeyeTable2Odd" align="right">.217</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=113176">Holgrave</a></td>
<td  class="radeyeTable1Even" align="right">1235</td>
<td  class="radeyeTable1Even" align="right">344</td>
<td  class="radeyeTable1Even" align="right">$2.03</td>
<td  class="radeyeTable1Even" align="right">7.78</td>
<td  class="radeyeTable2Even" align="right">.166</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=297658">sohdjinn</a></td>
<td  class="radeyeTable1Odd" align="right">1233</td>
<td  class="radeyeTable1Odd" align="right">295</td>
<td  class="radeyeTable1Odd" align="right">$1.24</td>
<td  class="radeyeTable1Odd" align="right">4.86</td>
<td  class="radeyeTable2Odd" align="right">.043</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=282715">bangfalse</a></td>
<td  class="radeyeTable1Even" align="right">1231</td>
<td  class="radeyeTable1Even" align="right">313</td>
<td  class="radeyeTable1Even" align="right">$1.48</td>
<td  class="radeyeTable1Even" align="right">5.79</td>
<td  class="radeyeTable2Even" align="right">.073</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=311094">mbaer</a></td>
<td  class="radeyeTable1Odd" align="right">1231</td>
<td  class="radeyeTable1Odd" align="right">352</td>
<td  class="radeyeTable1Odd" align="right">$2.11</td>
<td  class="radeyeTable1Odd" align="right">8.08</td>
<td  class="radeyeTable2Odd" align="right">.190</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7388905">xianguangli</a></td>
<td  class="radeyeTable1Even" align="right">1231</td>
<td  class="radeyeTable1Even" align="right">398</td>
<td  class="radeyeTable1Even" align="right">$2.91</td>
<td  class="radeyeTable1Even" align="right">10.8</td>
<td  class="radeyeTable2Even" align="right">.418</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7396063">melchi</a></td>
<td  class="radeyeTable1Odd" align="right">1231</td>
<td  class="radeyeTable1Odd" align="right">419</td>
<td  class="radeyeTable1Odd" align="right">$3.28</td>
<td  class="radeyeTable1Odd" align="right">12.0</td>
<td  class="radeyeTable2Odd" align="right">.553</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=266485">meragrin</a></td>
<td  class="radeyeTable1Even" align="right">1227</td>
<td  class="radeyeTable1Even" align="right">247</td>
<td  class="radeyeTable1Even" align="right">$0.57</td>
<td  class="radeyeTable1Even" align="right">2.25</td>
<td  class="radeyeTable2Even" align="right">.005</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=348481">sinden</a></td>
<td  class="radeyeTable1Odd" align="right">1227</td>
<td  class="radeyeTable1Odd" align="right">243</td>
<td  class="radeyeTable1Odd" align="right">$0.52</td>
<td  class="radeyeTable1Odd" align="right">2.07</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7332784">jonas</a></td>
<td  class="radeyeTable1Even" align="right">1227</td>
<td  class="radeyeTable1Even" align="right">290</td>
<td  class="radeyeTable1Even" align="right">$1.10</td>
<td  class="radeyeTable1Even" align="right">4.33</td>
<td  class="radeyeTable2Even" align="right">.034</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=2059531">bchanged</a></td>
<td  class="radeyeTable1Odd" align="right">1226</td>
<td  class="radeyeTable1Odd" align="right">249</td>
<td  class="radeyeTable1Odd" align="right">$0.58</td>
<td  class="radeyeTable1Odd" align="right">2.32</td>
<td  class="radeyeTable2Odd" align="right">.006</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=293013">Sisur</a></td>
<td  class="radeyeTable1Even" align="right">1226</td>
<td  class="radeyeTable1Even" align="right">283</td>
<td  class="radeyeTable1Even" align="right">$1.00</td>
<td  class="radeyeTable1Even" align="right">3.96</td>
<td  class="radeyeTable2Even" align="right">.024</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=344698">peru</a></td>
<td  class="radeyeTable1Odd" align="right">1224</td>
<td  class="radeyeTable1Odd" align="right">397</td>
<td  class="radeyeTable1Odd" align="right">$2.80</td>
<td  class="radeyeTable1Odd" align="right">10.4</td>
<td  class="radeyeTable2Odd" align="right">.388</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7369089">SleepyOverlord</a></td>
<td  class="radeyeTable1Even" align="right">1224</td>
<td  class="radeyeTable1Even" align="right">285</td>
<td  class="radeyeTable1Even" align="right">$1.01</td>
<td  class="radeyeTable1Even" align="right">3.99</td>
<td  class="radeyeTable2Even" align="right">.026</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7445483">BradAustin</a></td>
<td  class="radeyeTable1Odd" align="right">1223</td>
<td  class="radeyeTable1Odd" align="right">419</td>
<td  class="radeyeTable1Odd" align="right">$3.16</td>
<td  class="radeyeTable1Odd" align="right">11.6</td>
<td  class="radeyeTable2Odd" align="right">.523</td>
<td  class="radeyeTable2Odd" align="right">.006</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7212377">guidox</a></td>
<td  class="radeyeTable1Even" align="right">1222</td>
<td  class="radeyeTable1Even" align="right">264</td>
<td  class="radeyeTable1Even" align="right">$0.73</td>
<td  class="radeyeTable1Even" align="right">2.90</td>
<td  class="radeyeTable2Even" align="right">.011</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=301859">RangerX</a></td>
<td  class="radeyeTable1Odd" align="right">1221</td>
<td  class="radeyeTable1Odd" align="right">297</td>
<td  class="radeyeTable1Odd" align="right">$1.15</td>
<td  class="radeyeTable1Odd" align="right">4.53</td>
<td  class="radeyeTable2Odd" align="right">.039</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=156551">wonder-worker</a></td>
<td  class="radeyeTable1Even" align="right">1219</td>
<td  class="radeyeTable1Even" align="right">434</td>
<td  class="radeyeTable1Even" align="right">$3.36</td>
<td  class="radeyeTable1Even" align="right">12.2</td>
<td  class="radeyeTable2Even" align="right">.600</td>
<td  class="radeyeTable2Even" align="right">.008</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=273937">cintamani</a></td>
<td  class="radeyeTable1Odd" align="right">1213</td>
<td  class="radeyeTable1Odd" align="right">178</td>
<td  class="radeyeTable1Odd" align="right">$0.06</td>
<td  class="radeyeTable1Odd" align="right">.221</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=154075">BlueTDimly</a></td>
<td  class="radeyeTable1Even" align="right">1209</td>
<td  class="radeyeTable1Even" align="right">497</td>
<td  class="radeyeTable1Even" align="right">$4.31</td>
<td  class="radeyeTable1Even" align="right">15.0</td>
<td  class="radeyeTable2Even" align="right">1.08</td>
<td  class="radeyeTable2Even" align="right">.027</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=343341">Afimrishi</a></td>
<td  class="radeyeTable1Odd" align="right">1209</td>
<td  class="radeyeTable1Odd" align="right">249</td>
<td  class="radeyeTable1Odd" align="right">$0.49</td>
<td  class="radeyeTable1Odd" align="right">1.94</td>
<td  class="radeyeTable2Odd" align="right">.004</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7387352">lolaiba</a></td>
<td  class="radeyeTable1Even" align="right">1207</td>
<td  class="radeyeTable1Even" align="right">323</td>
<td  class="radeyeTable1Even" align="right">$1.41</td>
<td  class="radeyeTable1Even" align="right">5.49</td>
<td  class="radeyeTable2Even" align="right">.068</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=251089">GotMilk</a></td>
<td  class="radeyeTable1Odd" align="right">1206</td>
<td  class="radeyeTable1Odd" align="right">135</td>
<td  class="radeyeTable1Odd" align="right">$0.00</td>
<td  class="radeyeTable1Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextBlue" href="/stat?c=member_profile&amp;cr=7392939">boets</a></td>
<td  class="radeyeTable1Even" align="right">1201</td>
<td  class="radeyeTable1Even" align="right">397</td>
<td  class="radeyeTable1Even" align="right">$2.50</td>
<td  class="radeyeTable1Even" align="right">9.39</td>
<td  class="radeyeTable2Even" align="right">.310</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=154294">MikeMRH17</a></td>
<td  class="radeyeTable1Odd" align="right">1198</td>
<td  class="radeyeTable1Odd" align="right">260</td>
<td  class="radeyeTable1Odd" align="right">$0.55</td>
<td  class="radeyeTable1Odd" align="right">2.19</td>
<td  class="radeyeTable2Odd" align="right">.005</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=306712">albin</a></td>
<td  class="radeyeTable1Even" align="right">1198</td>
<td  class="radeyeTable1Even" align="right">242</td>
<td  class="radeyeTable1Even" align="right">$0.38</td>
<td  class="radeyeTable1Even" align="right">1.52</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=300664">ahoenig</a></td>
<td  class="radeyeTable1Odd" align="right">1197</td>
<td  class="radeyeTable1Odd" align="right">476</td>
<td  class="radeyeTable1Odd" align="right">$3.77</td>
<td  class="radeyeTable1Odd" align="right">13.4</td>
<td  class="radeyeTable2Odd" align="right">.813</td>
<td  class="radeyeTable2Odd" align="right">.015</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7445243">agove</a></td>
<td  class="radeyeTable1Even" align="right">1193</td>
<td  class="radeyeTable1Even" align="right">307</td>
<td  class="radeyeTable1Even" align="right">$1.07</td>
<td  class="radeyeTable1Even" align="right">4.20</td>
<td  class="radeyeTable2Even" align="right">.036</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7296831">Nexius</a></td>
<td  class="radeyeTable1Odd" align="right">1192</td>
<td  class="radeyeTable1Odd" align="right">222</td>
<td  class="radeyeTable1Odd" align="right">$0.21</td>
<td  class="radeyeTable1Odd" align="right">.847</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=287130">NeverMore</a></td>
<td  class="radeyeTable1Even" align="right">1190</td>
<td  class="radeyeTable1Even" align="right">449</td>
<td  class="radeyeTable1Even" align="right">$3.22</td>
<td  class="radeyeTable1Even" align="right">11.7</td>
<td  class="radeyeTable2Even" align="right">.572</td>
<td  class="radeyeTable2Even" align="right">.008</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=261043">fpmc</a></td>
<td  class="radeyeTable1Odd" align="right">1184</td>
<td  class="radeyeTable1Odd" align="right">501</td>
<td  class="radeyeTable1Odd" align="right">$4.02</td>
<td  class="radeyeTable1Odd" align="right">14.1</td>
<td  class="radeyeTable2Odd" align="right">.950</td>
<td  class="radeyeTable2Odd" align="right">.021</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266319">androm</a></td>
<td  class="radeyeTable1Even" align="right">1184</td>
<td  class="radeyeTable1Even" align="right">344</td>
<td  class="radeyeTable1Even" align="right">$1.50</td>
<td  class="radeyeTable1Even" align="right">5.83</td>
<td  class="radeyeTable2Even" align="right">.087</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=267766">olegh</a></td>
<td  class="radeyeTable1Odd" align="right">1184</td>
<td  class="radeyeTable1Odd" align="right">338</td>
<td  class="radeyeTable1Odd" align="right">$1.42</td>
<td  class="radeyeTable1Odd" align="right">5.51</td>
<td  class="radeyeTable2Odd" align="right">.073</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=262271">Mosher</a></td>
<td  class="radeyeTable1Even" align="right">1183</td>
<td  class="radeyeTable1Even" align="right">301</td>
<td  class="radeyeTable1Even" align="right">$0.92</td>
<td  class="radeyeTable1Even" align="right">3.64</td>
<td  class="radeyeTable2Even" align="right">.023</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7408528">jnwood</a></td>
<td  class="radeyeTable1Odd" align="right">1181</td>
<td  class="radeyeTable1Odd" align="right">319</td>
<td  class="radeyeTable1Odd" align="right">$1.13</td>
<td  class="radeyeTable1Odd" align="right">4.44</td>
<td  class="radeyeTable2Odd" align="right">.044</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=265193">ll0377</a></td>
<td  class="radeyeTable1Even" align="right">1179</td>
<td  class="radeyeTable1Even" align="right">270</td>
<td  class="radeyeTable1Even" align="right">$0.55</td>
<td  class="radeyeTable1Even" align="right">2.20</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=307612">dregoth</a></td>
<td  class="radeyeTable1Odd" align="right">1176</td>
<td  class="radeyeTable1Odd" align="right">322</td>
<td  class="radeyeTable1Odd" align="right">$1.13</td>
<td  class="radeyeTable1Odd" align="right">4.46</td>
<td  class="radeyeTable2Odd" align="right">.041</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7390772">duner</a></td>
<td  class="radeyeTable1Even" align="right">1172</td>
<td  class="radeyeTable1Even" align="right">258</td>
<td  class="radeyeTable1Even" align="right">$0.41</td>
<td  class="radeyeTable1Even" align="right">1.64</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=269739">darkmanjs</a></td>
<td  class="radeyeTable1Odd" align="right">1171</td>
<td  class="radeyeTable1Odd" align="right">279</td>
<td  class="radeyeTable1Odd" align="right">$0.60</td>
<td  class="radeyeTable1Odd" align="right">2.40</td>
<td  class="radeyeTable2Odd" align="right">.008</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7401757">ShootMe</a></td>
<td  class="radeyeTable1Even" align="right">1168</td>
<td  class="radeyeTable1Even" align="right">256</td>
<td  class="radeyeTable1Even" align="right">$0.38</td>
<td  class="radeyeTable1Even" align="right">1.51</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7235178">datawrangler</a></td>
<td  class="radeyeTable1Odd" align="right">1164</td>
<td  class="radeyeTable1Odd" align="right">462</td>
<td  class="radeyeTable1Odd" align="right">$3.10</td>
<td  class="radeyeTable1Odd" align="right">11.3</td>
<td  class="radeyeTable2Odd" align="right">.547</td>
<td  class="radeyeTable2Odd" align="right">.007</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7433708">ochazuke</a></td>
<td  class="radeyeTable1Even" align="right">1154</td>
<td  class="radeyeTable1Even" align="right">228</td>
<td  class="radeyeTable1Even" align="right">$0.16</td>
<td  class="radeyeTable1Even" align="right">.641</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=266705">Sleeve</a></td>
<td  class="radeyeTable1Odd" align="right">1152</td>
<td  class="radeyeTable1Odd" align="right">322</td>
<td  class="radeyeTable1Odd" align="right">$0.96</td>
<td  class="radeyeTable1Odd" align="right">3.79</td>
<td  class="radeyeTable2Odd" align="right">.029</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7445261">cfry</a></td>
<td  class="radeyeTable1Even" align="right">1144</td>
<td  class="radeyeTable1Even" align="right">362</td>
<td  class="radeyeTable1Even" align="right">$1.41</td>
<td  class="radeyeTable1Even" align="right">5.49</td>
<td  class="radeyeTable2Even" align="right">.080</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=260062">Gagan</a></td>
<td  class="radeyeTable1Odd" align="right">1143</td>
<td  class="radeyeTable1Odd" align="right">262</td>
<td  class="radeyeTable1Odd" align="right">$0.34</td>
<td  class="radeyeTable1Odd" align="right">1.36</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7445856">xixem</a></td>
<td  class="radeyeTable1Even" align="right">1142</td>
<td  class="radeyeTable1Even" align="right">302</td>
<td  class="radeyeTable1Even" align="right">$0.69</td>
<td  class="radeyeTable1Even" align="right">2.73</td>
<td  class="radeyeTable2Even" align="right">.013</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7280013">Hitiek</a></td>
<td  class="radeyeTable1Odd" align="right">1136</td>
<td  class="radeyeTable1Odd" align="right">361</td>
<td  class="radeyeTable1Odd" align="right">$1.34</td>
<td  class="radeyeTable1Odd" align="right">5.20</td>
<td  class="radeyeTable2Odd" align="right">.072</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7473710">gust_neub</a></td>
<td  class="radeyeTable1Even" align="right">1122</td>
<td  class="radeyeTable1Even" align="right">443</td>
<td  class="radeyeTable1Even" align="right">$2.33</td>
<td  class="radeyeTable1Even" align="right">8.74</td>
<td  class="radeyeTable2Even" align="right">.294</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7479623">soulstone</a></td>
<td  class="radeyeTable1Odd" align="right">1122</td>
<td  class="radeyeTable1Odd" align="right">419</td>
<td  class="radeyeTable1Odd" align="right">$1.99</td>
<td  class="radeyeTable1Odd" align="right">7.54</td>
<td  class="radeyeTable2Odd" align="right">.198</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=302810">kiveol</a></td>
<td  class="radeyeTable1Even" align="right">1118</td>
<td  class="radeyeTable1Even" align="right">221</td>
<td  class="radeyeTable1Even" align="right">$0.08</td>
<td  class="radeyeTable1Even" align="right">.314</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=304976">giginim</a></td>
<td  class="radeyeTable1Odd" align="right">1111</td>
<td  class="radeyeTable1Odd" align="right">283</td>
<td  class="radeyeTable1Odd" align="right">$0.39</td>
<td  class="radeyeTable1Odd" align="right">1.54</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=278932">MasterYoda</a></td>
<td  class="radeyeTable1Even" align="right">1104</td>
<td  class="radeyeTable1Even" align="right">226</td>
<td  class="radeyeTable1Even" align="right">$0.08</td>
<td  class="radeyeTable1Even" align="right">.312</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7402446">Mikhos</a></td>
<td  class="radeyeTable1Odd" align="right">1100</td>
<td  class="radeyeTable1Odd" align="right">326</td>
<td  class="radeyeTable1Odd" align="right">$0.71</td>
<td  class="radeyeTable1Odd" align="right">2.79</td>
<td  class="radeyeTable2Odd" align="right">.016</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7422513">EuclidCT</a></td>
<td  class="radeyeTable1Even" align="right">1091</td>
<td  class="radeyeTable1Even" align="right">407</td>
<td  class="radeyeTable1Even" align="right">$1.56</td>
<td  class="radeyeTable1Even" align="right">6.00</td>
<td  class="radeyeTable2Even" align="right">.115</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=156456">gnuguru</a></td>
<td  class="radeyeTable1Odd" align="right">1087</td>
<td  class="radeyeTable1Odd" align="right">245</td>
<td  class="radeyeTable1Odd" align="right">$0.12</td>
<td  class="radeyeTable1Odd" align="right">.482</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=345517">deepcompsci</a></td>
<td  class="radeyeTable1Even" align="right">1086</td>
<td  class="radeyeTable1Even" align="right">337</td>
<td  class="radeyeTable1Even" align="right">$0.74</td>
<td  class="radeyeTable1Even" align="right">2.93</td>
<td  class="radeyeTable2Even" align="right">.019</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=306416">davitf</a></td>
<td  class="radeyeTable1Odd" align="right">1082</td>
<td  class="radeyeTable1Odd" align="right">461</td>
<td  class="radeyeTable1Odd" align="right">$2.18</td>
<td  class="radeyeTable1Odd" align="right">8.18</td>
<td  class="radeyeTable2Odd" align="right">.267</td>
<td  class="radeyeTable2Odd" align="right">.003</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7361542">ash-ray</a></td>
<td  class="radeyeTable1Even" align="right">1072</td>
<td  class="radeyeTable1Even" align="right">388</td>
<td  class="radeyeTable1Even" align="right">$1.20</td>
<td  class="radeyeTable1Even" align="right">4.66</td>
<td  class="radeyeTable2Even" align="right">.063</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=281266">Blazenite3</a></td>
<td  class="radeyeTable1Odd" align="right">1071</td>
<td  class="radeyeTable1Odd" align="right">464</td>
<td  class="radeyeTable1Odd" align="right">$2.11</td>
<td  class="radeyeTable1Odd" align="right">7.94</td>
<td  class="radeyeTable2Odd" align="right">.248</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=298097">nicksim</a></td>
<td  class="radeyeTable1Even" align="right">1071</td>
<td  class="radeyeTable1Even" align="right">259</td>
<td  class="radeyeTable1Even" align="right">$0.15</td>
<td  class="radeyeTable1Even" align="right">.601</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=155619">grn</a></td>
<td  class="radeyeTable1Odd" align="right">1067</td>
<td  class="radeyeTable1Odd" align="right">250</td>
<td  class="radeyeTable1Odd" align="right">$0.11</td>
<td  class="radeyeTable1Odd" align="right">.440</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=303128">pcmartini</a></td>
<td  class="radeyeTable1Even" align="right">1063</td>
<td  class="radeyeTable1Even" align="right">394</td>
<td  class="radeyeTable1Even" align="right">$1.20</td>
<td  class="radeyeTable1Even" align="right">4.68</td>
<td  class="radeyeTable2Even" align="right">.064</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=251184">dplass</a></td>
<td  class="radeyeTable1Odd" align="right">1062</td>
<td  class="radeyeTable1Odd" align="right">537</td>
<td  class="radeyeTable1Odd" align="right">$3.02</td>
<td  class="radeyeTable1Odd" align="right">10.9</td>
<td  class="radeyeTable2Odd" align="right">.569</td>
<td  class="radeyeTable2Odd" align="right">.010</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=263189">dan202</a></td>
<td  class="radeyeTable1Even" align="right">1060</td>
<td  class="radeyeTable1Even" align="right">251</td>
<td  class="radeyeTable1Even" align="right">$0.11</td>
<td  class="radeyeTable1Even" align="right">.423</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=265973">irulet</a></td>
<td  class="radeyeTable1Odd" align="right">1060</td>
<td  class="radeyeTable1Odd" align="right">317</td>
<td  class="radeyeTable1Odd" align="right">$0.46</td>
<td  class="radeyeTable1Odd" align="right">1.82</td>
<td  class="radeyeTable2Odd" align="right">.005</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=267495">scn</a></td>
<td  class="radeyeTable1Even" align="right">1053</td>
<td  class="radeyeTable1Even" align="right">348</td>
<td  class="radeyeTable1Even" align="right">$0.69</td>
<td  class="radeyeTable1Even" align="right">2.73</td>
<td  class="radeyeTable2Even" align="right">.015</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=294328">mariusmuja</a></td>
<td  class="radeyeTable1Odd" align="right">1035</td>
<td  class="radeyeTable1Odd" align="right">371</td>
<td  class="radeyeTable1Odd" align="right">$0.80</td>
<td  class="radeyeTable1Odd" align="right">3.16</td>
<td  class="radeyeTable2Odd" align="right">.024</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=2058097">35C4P3</a></td>
<td  class="radeyeTable1Even" align="right">1018</td>
<td  class="radeyeTable1Even" align="right">293</td>
<td  class="radeyeTable1Even" align="right">$0.20</td>
<td  class="radeyeTable1Even" align="right">.815</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7445264">Mariyka</a></td>
<td  class="radeyeTable1Odd" align="right">1018</td>
<td  class="radeyeTable1Odd" align="right">394</td>
<td  class="radeyeTable1Odd" align="right">$0.93</td>
<td  class="radeyeTable1Odd" align="right">3.67</td>
<td  class="radeyeTable2Odd" align="right">.036</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=281156">raquib</a></td>
<td  class="radeyeTable1Even" align="right">1016</td>
<td  class="radeyeTable1Even" align="right">318</td>
<td  class="radeyeTable1Even" align="right">$0.33</td>
<td  class="radeyeTable1Even" align="right">1.30</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=346098">cyGNUs</a></td>
<td  class="radeyeTable1Odd" align="right">1015</td>
<td  class="radeyeTable1Odd" align="right">272</td>
<td  class="radeyeTable1Odd" align="right">$0.12</td>
<td  class="radeyeTable1Odd" align="right">.466</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7213822">YBGourry</a></td>
<td  class="radeyeTable1Even" align="right">1015</td>
<td  class="radeyeTable1Even" align="right">352</td>
<td  class="radeyeTable1Even" align="right">$0.56</td>
<td  class="radeyeTable1Even" align="right">2.20</td>
<td  class="radeyeTable2Even" align="right">.010</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7371063">supernova</a></td>
<td  class="radeyeTable1Odd" align="right">1005</td>
<td  class="radeyeTable1Odd" align="right">399</td>
<td  class="radeyeTable1Odd" align="right">$0.92</td>
<td  class="radeyeTable1Odd" align="right">3.60</td>
<td  class="radeyeTable2Odd" align="right">.036</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7462749">lebowski03</a></td>
<td  class="radeyeTable1Even" align="right">1000</td>
<td  class="radeyeTable1Even" align="right">307</td>
<td  class="radeyeTable1Even" align="right">$0.23</td>
<td  class="radeyeTable1Even" align="right">.927</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=268594">helloall</a></td>
<td  class="radeyeTable1Odd" align="right">989</td>
<td  class="radeyeTable1Odd" align="right">322</td>
<td  class="radeyeTable1Odd" align="right">$0.28</td>
<td  class="radeyeTable1Odd" align="right">1.13</td>
<td  class="radeyeTable2Odd" align="right">.002</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7442810">casey_h</a></td>
<td  class="radeyeTable1Even" align="right">981</td>
<td  class="radeyeTable1Even" align="right">359</td>
<td  class="radeyeTable1Even" align="right">$0.48</td>
<td  class="radeyeTable1Even" align="right">1.92</td>
<td  class="radeyeTable2Even" align="right">.008</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=281262">coquelicot</a></td>
<td  class="radeyeTable1Odd" align="right">960</td>
<td  class="radeyeTable1Odd" align="right">410</td>
<td  class="radeyeTable1Odd" align="right">$0.80</td>
<td  class="radeyeTable1Odd" align="right">3.13</td>
<td  class="radeyeTable2Odd" align="right">.028</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=297186">Avet</a></td>
<td  class="radeyeTable1Even" align="right">954</td>
<td  class="radeyeTable1Even" align="right">328</td>
<td  class="radeyeTable1Even" align="right">$0.24</td>
<td  class="radeyeTable1Even" align="right">.943</td>
<td  class="radeyeTable2Even" align="right">.002</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=7448953">hw_Tim</a></td>
<td  class="radeyeTable1Odd" align="right">943</td>
<td  class="radeyeTable1Odd" align="right">449</td>
<td  class="radeyeTable1Odd" align="right">$1.06</td>
<td  class="radeyeTable1Odd" align="right">4.12</td>
<td  class="radeyeTable2Odd" align="right">.057</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left" colspan="4"></td>
   <td  class="radeye_header2" align="center" colspan="5">Probability of advancing to:</td>
   <td  class="radeye_header3" align="center" colspan="4">Probability of finishing as:</td>
</tr>
<tr>
   <td  class="radeye_header1" align="left">Handle</td>
   <td  class="radeye_header1" align="right">Rating</td>
   <td  class="radeye_header1" align="right">Volatility</td>
   <td  class="radeye_header1" align="right">Earnings</td>
   <td  class="radeye_header2" align="right">Online 2</td>
   <td  class="radeye_header2" align="right">Online 3</td>
   <td  class="radeye_header2" align="right">Online 4</td>
   <td  class="radeye_header2" align="right">Semifinals</td>
   <td  class="radeye_header2" align="right">Finals</td>
   <td  class="radeye_header3" align="right">4th</td>
   <td  class="radeye_header3" align="right">3rd</td>
   <td  class="radeye_header3" align="right">2nd</td>
   <td  class="radeye_header3" align="right">Champ</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=151634">axiom</a></td>
<td  class="radeyeTable1Even" align="right">920</td>
<td  class="radeyeTable1Even" align="right">361</td>
<td  class="radeyeTable1Even" align="right">$0.32</td>
<td  class="radeyeTable1Even" align="right">1.29</td>
<td  class="radeyeTable2Even" align="right">.003</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=267257">quasar</a></td>
<td  class="radeyeTable1Odd" align="right">920</td>
<td  class="radeyeTable1Odd" align="right">615</td>
<td  class="radeyeTable1Odd" align="right">$2.63</td>
<td  class="radeyeTable1Odd" align="right">9.55</td>
<td  class="radeyeTable2Odd" align="right">.471</td>
<td  class="radeyeTable2Odd" align="right">.009</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGreen" href="/stat?c=member_profile&amp;cr=273429">jpowell</a></td>
<td  class="radeyeTable1Even" align="right">914</td>
<td  class="radeyeTable1Even" align="right">489</td>
<td  class="radeyeTable1Even" align="right">$1.27</td>
<td  class="radeyeTable1Even" align="right">4.88</td>
<td  class="radeyeTable2Even" align="right">.092</td>
<td  class="radeyeTable2Even" align="right">.001</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Odd"><a class="coderTextGrey" href="/stat?c=member_profile&amp;cr=284823">Taranis</a></td>
<td  class="radeyeTable1Odd" align="right">838</td>
<td  class="radeyeTable1Odd" align="right">364</td>
<td  class="radeyeTable1Odd" align="right">$0.19</td>
<td  class="radeyeTable1Odd" align="right">.754</td>
<td  class="radeyeTable2Odd" align="right">.001</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable2Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
<td  class="radeyeTable3Odd" align="right">.000</td>
</tr>
<tr>
<td  class="radeyeTable1Even"><a class="coderTextGrey" href="/stat?c=member_profile&amp;cr=2058786">rcrdev</a></td>
<td  class="radeyeTable1Even" align="right">757</td>
<td  class="radeyeTable1Even" align="right">445</td>
<td  class="radeyeTable1Even" align="right">$0.37</td>
<td  class="radeyeTable1Even" align="right">1.48</td>
<td  class="radeyeTable2Even" align="right">.006</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable2Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
<td  class="radeyeTable3Even" align="right">.000</td>
</tr>
</table>

</td>
</tr>
</table>
</body>

</html>

    </xsl:template>
</xsl:stylesheet>

