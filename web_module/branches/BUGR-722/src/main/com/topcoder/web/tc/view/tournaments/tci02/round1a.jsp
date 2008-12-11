<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />

  <br><br>
<TABLE ALIGN="center" CELLSPACING="1" CELLPADDING="1" BORDER="0" WIDTH="100%"><TR><TD BGCOLOR="#666666" HEIGHT="18" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Handle</TD><TD BGCOLOR="#666666" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Points</TD><TD BGCOLOR="#666666" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Tourney Seed</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267834" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1136.5</TD><TD ALIGN="right" CLASS="statText">56</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1135.45</TD><TD ALIGN="right" CLASS="statText">2</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1120.1</TD><TD ALIGN="right" CLASS="statText">4</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1115.16</TD><TD ALIGN="right" CLASS="statText">14</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114853" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1109.01</TD><TD ALIGN="right" CLASS="statText">8</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1105.8</TD><TD ALIGN="right" CLASS="statText">18</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112902" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1099.53</TD><TD ALIGN="right" CLASS="statText">60</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156804" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1085.47</TD><TD ALIGN="right" CLASS="statText">50</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="120816" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1082.37</TD><TD ALIGN="right" CLASS="statText">12</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158837" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1063.26</TD><TD ALIGN="right" CLASS="statText">100</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153479" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1054.92</TD><TD ALIGN="right" CLASS="statText">154</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262936" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1043.59</TD><TD ALIGN="right" CLASS="statText">16</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158658" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1025.77</TD><TD ALIGN="right" CLASS="statText">36</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112441" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">784.4</TD><TD ALIGN="right" CLASS="statText">294</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112939" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">779.03</TD><TD ALIGN="right" CLASS="statText">54</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="105922" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">754.84</TD><TD ALIGN="right" CLASS="statText">22</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="147102" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">750.69</TD><TD ALIGN="right" CLASS="statText">26</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="109965" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">750.0</TD><TD ALIGN="right" CLASS="statText">86</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="108262" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">742.89</TD><TD ALIGN="right" CLASS="statText">52</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158067" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">733.67</TD><TD ALIGN="right" CLASS="statText">42</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277659" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">732.58</TD><TD ALIGN="right" CLASS="statText">6</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="298209" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">728.21</TD><TD ALIGN="right" CLASS="statText">24</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273206" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">720.0</TD><TD ALIGN="right" CLASS="statText">126</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="107835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">711.85</TD><TD ALIGN="right" CLASS="statText">64</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156216" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">710.76</TD><TD ALIGN="right" CLASS="statText">40</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="129672" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">710.05</TD><TD ALIGN="right" CLASS="statText">10</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155621" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">709.11</TD><TD ALIGN="right" CLASS="statText">76</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152340" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">704.3</TD><TD ALIGN="right" CLASS="statText">120</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297823" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">704.17</TD><TD ALIGN="right" CLASS="statText">158</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286113" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">702.28</TD><TD ALIGN="right" CLASS="statText">138</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283374" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">702.08</TD><TD ALIGN="right" CLASS="statText">116</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151144" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">701.8</TD><TD ALIGN="right" CLASS="statText">106</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274537" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">701.07</TD><TD ALIGN="right" CLASS="statText">256</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262467" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">698.93</TD><TD ALIGN="right" CLASS="statText">246</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150852" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">697.69</TD><TD ALIGN="right" CLASS="statText">90</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159100" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">697.18</TD><TD ALIGN="right" CLASS="statText">96</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138158" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">695.25</TD><TD ALIGN="right" CLASS="statText">398</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="142795" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">692.95</TD><TD ALIGN="right" CLASS="statText">38</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="133846" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">691.05</TD><TD ALIGN="right" CLASS="statText">44</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150961" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">690.89</TD><TD ALIGN="right" CLASS="statText">222</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159495" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">686.99</TD><TD ALIGN="right" CLASS="statText">144</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="291974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">684.21</TD><TD ALIGN="right" CLASS="statText">310</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138518" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">683.33</TD><TD ALIGN="right" CLASS="statText">240</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268212" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">680.81</TD><TD ALIGN="right" CLASS="statText">304</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274068" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">676.69</TD><TD ALIGN="right" CLASS="statText">30</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287568" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">676.46</TD><TD ALIGN="right" CLASS="statText">148</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="115147" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">673.34</TD><TD ALIGN="right" CLASS="statText">68</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157628" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">671.8</TD><TD ALIGN="right" CLASS="statText">84</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268546" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">670.75</TD><TD ALIGN="right" CLASS="statText">486</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150796" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">667.3</TD><TD ALIGN="right" CLASS="statText">58</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295606" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">666.43</TD><TD ALIGN="right" CLASS="statText">270</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267831" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">666.0</TD><TD ALIGN="right" CLASS="statText">178</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138655" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">665.24</TD><TD ALIGN="right" CLASS="statText">104</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286112" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">664.57</TD><TD ALIGN="right" CLASS="statText">164</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297746" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">664.28</TD><TD ALIGN="right" CLASS="statText">228</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274018" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">663.25</TD><TD ALIGN="right" CLASS="statText">32</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292451" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">661.32</TD><TD ALIGN="right" CLASS="statText">276</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153183" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">661.26</TD><TD ALIGN="right" CLASS="statText">318</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289251" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">660.36</TD><TD ALIGN="right" CLASS="statText">98</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287023" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">659.29</TD><TD ALIGN="right" CLASS="statText">408</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269025" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">657.49</TD><TD ALIGN="right" CLASS="statText">94</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="126234" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">656.5</TD><TD ALIGN="right" CLASS="statText">168</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294543" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">655.27</TD><TD ALIGN="right" CLASS="statText">464</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="101417" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">653.05</TD><TD ALIGN="right" CLASS="statText">122</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280570" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">652.57</TD><TD ALIGN="right" CLASS="statText">80</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273428" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">652.4</TD><TD ALIGN="right" CLASS="statText">162</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152614" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">652.29</TD><TD ALIGN="right" CLASS="statText">198</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153434" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">651.45</TD><TD ALIGN="right" CLASS="statText">292</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284655" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">649.72</TD><TD ALIGN="right" CLASS="statText">262</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290395" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">645.55</TD><TD ALIGN="right" CLASS="statText">452</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154619" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">645.25</TD><TD ALIGN="right" CLASS="statText">298</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271978" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">642.03</TD><TD ALIGN="right" CLASS="statText">214</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260828" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">638.4</TD><TD ALIGN="right" CLASS="statText">130</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159921" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">638.34</TD><TD ALIGN="right" CLASS="statText">170</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152342" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">637.97</TD><TD ALIGN="right" CLASS="statText">134</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264678" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">637.43</TD><TD ALIGN="right" CLASS="statText">204</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282560" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">637.19</TD><TD ALIGN="right" CLASS="statText">342</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154648" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">636.77</TD><TD ALIGN="right" CLASS="statText">156</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264782" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">636.03</TD><TD ALIGN="right" CLASS="statText">186</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268851" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">634.44</TD><TD ALIGN="right" CLASS="statText">224</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279526" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">633.84</TD><TD ALIGN="right" CLASS="statText">152</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158306" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">629.78</TD><TD ALIGN="right" CLASS="statText">238</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288170" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">627.79</TD><TD ALIGN="right" CLASS="statText">70</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156640" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">626.1</TD><TD ALIGN="right" CLASS="statText">254</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="104810" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">625.16</TD><TD ALIGN="right" CLASS="statText">142</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297005" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">623.63</TD><TD ALIGN="right" CLASS="statText">232</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151360" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">622.27</TD><TD ALIGN="right" CLASS="statText">124</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268954" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">622.17</TD><TD ALIGN="right" CLASS="statText">112</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279288" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">621.16</TD><TD ALIGN="right" CLASS="statText">436</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287105" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">618.94</TD><TD ALIGN="right" CLASS="statText">62</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="136367" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">616.6</TD><TD ALIGN="right" CLASS="statText">180</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280380" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">616.58</TD><TD ALIGN="right" CLASS="statText">274</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113491" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">614.89</TD><TD ALIGN="right" CLASS="statText">250</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152610" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">614.18</TD><TD ALIGN="right" CLASS="statText">300</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272490" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">613.16</TD><TD ALIGN="right" CLASS="statText">234</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268951" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">607.04</TD><TD ALIGN="right" CLASS="statText">248</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280198" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">605.06</TD><TD ALIGN="right" CLASS="statText">200</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285889" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">598.72</TD><TD ALIGN="right" CLASS="statText">258</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160136" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">596.45</TD><TD ALIGN="right" CLASS="statText">426</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271917" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">596.18</TD><TD ALIGN="right" CLASS="statText">672</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290481" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">591.92</TD><TD ALIGN="right" CLASS="statText">458</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="275243" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">591.19</TD><TD ALIGN="right" CLASS="statText">402</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="108530" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">590.73</TD><TD ALIGN="right" CLASS="statText">46</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="106771" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">585.24</TD><TD ALIGN="right" CLASS="statText">282</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294666" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">584.22</TD><TD ALIGN="right" CLASS="statText">920</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286944" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">576.54</TD><TD ALIGN="right" CLASS="statText">188</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297935" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">575.47</TD><TD ALIGN="right" CLASS="statText">476</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261393" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">574.49</TD><TD ALIGN="right" CLASS="statText">302</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268537" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">573.47</TD><TD ALIGN="right" CLASS="statText">466</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295420" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">571.27</TD><TD ALIGN="right" CLASS="statText">346</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296969" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">570.99</TD><TD ALIGN="right" CLASS="statText">396</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159922" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">570.9</TD><TD ALIGN="right" CLASS="statText">430</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158137" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">567.74</TD><TD ALIGN="right" CLASS="statText">114</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266625" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">566.01</TD><TD ALIGN="right" CLASS="statText">362</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260761" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">564.5</TD><TD ALIGN="right" CLASS="statText">92</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152874" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">563.18</TD><TD ALIGN="right" CLASS="statText">88</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159789" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">561.79</TD><TD ALIGN="right" CLASS="statText">314</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158258" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">558.81</TD><TD ALIGN="right" CLASS="statText">184</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264158" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">558.38</TD><TD ALIGN="right" CLASS="statText">82</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283512" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">553.29</TD><TD ALIGN="right" CLASS="statText">534</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="275413" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">549.24</TD><TD ALIGN="right" CLASS="statText">496</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265918" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">548.75</TD><TD ALIGN="right" CLASS="statText">524</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265973" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">545.66</TD><TD ALIGN="right" CLASS="statText">564</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="119676" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">545.15</TD><TD ALIGN="right" CLASS="statText">280</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260961" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">544.5</TD><TD ALIGN="right" CLASS="statText">536</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296661" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">540.2</TD><TD ALIGN="right" CLASS="statText">682</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295821" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">539.94</TD><TD ALIGN="right" CLASS="statText">592</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268720" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">539.85</TD><TD ALIGN="right" CLASS="statText">322</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252074" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">539.78</TD><TD ALIGN="right" CLASS="statText">568</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158110" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">539.4</TD><TD ALIGN="right" CLASS="statText">194</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270932" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">538.11</TD><TD ALIGN="right" CLASS="statText">360</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158447" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">536.06</TD><TD ALIGN="right" CLASS="statText">196</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273937" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">532.9</TD><TD ALIGN="right" CLASS="statText">600</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260185" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">531.34</TD><TD ALIGN="right" CLASS="statText">578</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158823" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">528.33</TD><TD ALIGN="right" CLASS="statText">506</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111365" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">527.26</TD><TD ALIGN="right" CLASS="statText">434</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266685" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">527.25</TD><TD ALIGN="right" CLASS="statText">528</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290274" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">527.04</TD><TD ALIGN="right" CLASS="statText">388</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295264" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">526.79</TD><TD ALIGN="right" CLASS="statText">660</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292225" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">523.35</TD><TD ALIGN="right" CLASS="statText">704</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">515.59</TD><TD ALIGN="right" CLASS="statText">160</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="110176" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">515.02</TD><TD ALIGN="right" CLASS="statText">312</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267248" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">512.69</TD><TD ALIGN="right" CLASS="statText">636</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268591" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">512.03</TD><TD ALIGN="right" CLASS="statText">368</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266750" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">501.36</TD><TD ALIGN="right" CLASS="statText">236</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264986" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">501.12</TD><TD ALIGN="right" CLASS="statText">242</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277723" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">500.29</TD><TD ALIGN="right" CLASS="statText">410</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="143330" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">499.65</TD><TD ALIGN="right" CLASS="statText">400</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274858" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">499.38</TD><TD ALIGN="right" CLASS="statText">244</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157578" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">495.63</TD><TD ALIGN="right" CLASS="statText">386</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113178" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">490.02</TD><TD ALIGN="right" CLASS="statText">28</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289706" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">489.01</TD><TD ALIGN="right" CLASS="statText">288</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157390" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">488.97</TD><TD ALIGN="right" CLASS="statText">394</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278309" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">485.44</TD><TD ALIGN="right" CLASS="statText">726</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252022" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">479.79</TD><TD ALIGN="right" CLASS="statText">590</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271976" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">478.82</TD><TD ALIGN="right" CLASS="statText">284</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262598" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">475.18</TD><TD ALIGN="right" CLASS="statText">364</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260172" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">473.93</TD><TD ALIGN="right" CLASS="statText">370</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261390" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">470.54</TD><TD ALIGN="right" CLASS="statText">556</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264146" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">469.31</TD><TD ALIGN="right" CLASS="statText">494</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260170" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">467.87</TD><TD ALIGN="right" CLASS="statText">102</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158759" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">466.82</TD><TD ALIGN="right" CLASS="statText">330</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296232" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">453.94</TD><TD ALIGN="right" CLASS="statText">320</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152617" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">451.75</TD><TD ALIGN="right" CLASS="statText">374</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159148" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">451.4</TD><TD ALIGN="right" CLASS="statText">676</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="142986" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">451.15</TD><TD ALIGN="right" CLASS="statText">350</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292985" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">448.39</TD><TD ALIGN="right" CLASS="statText">442</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155733" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">448.34</TD><TD ALIGN="right" CLASS="statText">868</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269739" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">443.8</TD><TD ALIGN="right" CLASS="statText">504</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251943" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">439.99</TD><TD ALIGN="right" CLASS="statText">286</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151518" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">436.93</TD><TD ALIGN="right" CLASS="statText">776</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251207" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">427.61</TD><TD ALIGN="right" CLASS="statText">448</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296489" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">421.93</TD><TD ALIGN="right" CLASS="statText">500</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287614" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">416.96</TD><TD ALIGN="right" CLASS="statText">610</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154650" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">416.41</TD><TD ALIGN="right" CLASS="statText">166</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287488" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">416.3</TD><TD ALIGN="right" CLASS="statText">798</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158819" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">415.92</TD><TD ALIGN="right" CLASS="statText">468</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283993" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">414.68</TD><TD ALIGN="right" CLASS="statText">326</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272259" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">413.46</TD><TD ALIGN="right" CLASS="statText">550</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150498" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">411.8</TD><TD ALIGN="right" CLASS="statText">220</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295617" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">411.17</TD><TD ALIGN="right" CLASS="statText">460</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269947" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">398.7</TD><TD ALIGN="right" CLASS="statText">804</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266087" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">394.75</TD><TD ALIGN="right" CLASS="statText">748</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270193" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">393.54</TD><TD ALIGN="right" CLASS="statText">678</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270515" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">391.81</TD><TD ALIGN="right" CLASS="statText">552</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266162" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">379.88</TD><TD ALIGN="right" CLASS="statText">78</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288428" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">371.21</TD><TD ALIGN="right" CLASS="statText">192</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267766" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">355.57</TD><TD ALIGN="right" CLASS="statText">542</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264031" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">354.53</TD><TD ALIGN="right" CLASS="statText">272</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269091" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">348.53</TD><TD ALIGN="right" CLASS="statText">780</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270357" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">339.1</TD><TD ALIGN="right" CLASS="statText">708</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160049" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">329.14</TD><TD ALIGN="right" CLASS="statText">332</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293390" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">324.86</TD><TD ALIGN="right" CLASS="statText">118</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289600" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">315.77</TD><TD ALIGN="right" CLASS="statText">620</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157448" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">309.96</TD><TD ALIGN="right" CLASS="statText">622</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280167" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">299.27</TD><TD ALIGN="right" CLASS="statText">540</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283868" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">289.13</TD><TD ALIGN="right" CLASS="statText">596</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272999" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">286.91</TD><TD ALIGN="right" CLASS="statText">538</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278630" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">281.12</TD><TD ALIGN="right" CLASS="statText">422</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251658" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">272.32</TD><TD ALIGN="right" CLASS="statText">340</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155786" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">272.08</TD><TD ALIGN="right" CLASS="statText">480</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278499" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">258.27</TD><TD ALIGN="right" CLASS="statText">822</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157053" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">257.85</TD><TD ALIGN="right" CLASS="statText">482</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264602" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">251.77</TD><TD ALIGN="right" CLASS="statText">746</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159446" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">251.13</TD><TD ALIGN="right" CLASS="statText">358</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="141448" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">250.61</TD><TD ALIGN="right" CLASS="statText">140</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265216" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">248.29</TD><TD ALIGN="right" CLASS="statText">742</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296547" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.95</TD><TD ALIGN="right" CLASS="statText">558</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="133700" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">245.95</TD><TD ALIGN="right" CLASS="statText">654</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273434" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.87</TD><TD ALIGN="right" CLASS="statText">724</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269553" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.17</TD><TD ALIGN="right" CLASS="statText">512</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265718" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.68</TD><TD ALIGN="right" CLASS="statText">716</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266379" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.55</TD><TD ALIGN="right" CLASS="statText">438</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297294" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.23</TD><TD ALIGN="right" CLASS="statText">574</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279876" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.33</TD><TD ALIGN="right" CLASS="statText">418</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266705" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.94</TD><TD ALIGN="right" CLASS="statText">586</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297365" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.52</TD><TD ALIGN="right" CLASS="statText">750</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260578" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.37</TD><TD ALIGN="right" CLASS="statText">338</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159758" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.34</TD><TD ALIGN="right" CLASS="statText">334</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264728" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">228.75</TD><TD ALIGN="right" CLASS="statText">576</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="132671" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">225.25</TD><TD ALIGN="right" CLASS="statText">684</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251068" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">222.12</TD><TD ALIGN="right" CLASS="statText">352</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292113" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">216.09</TD><TD ALIGN="right" CLASS="statText">838</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271218" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">212.18</TD><TD ALIGN="right" CLASS="statText">762</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284269" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">209.62</TD><TD ALIGN="right" CLASS="statText">548</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284790" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">208.38</TD><TD ALIGN="right" CLASS="statText">594</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296670" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">207.95</TD><TD ALIGN="right" CLASS="statText">416</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286590" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">206.37</TD><TD ALIGN="right" CLASS="statText">794</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265533" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">203.47</TD><TD ALIGN="right" CLASS="statText">382</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152377" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">203.37</TD><TD ALIGN="right" CLASS="statText">846</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280502" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">202.05</TD><TD ALIGN="right" CLASS="statText">526</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260502" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">197.28</TD><TD ALIGN="right" CLASS="statText">690</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="133319" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">194.97</TD><TD ALIGN="right" CLASS="statText">658</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273419" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">193.54</TD><TD ALIGN="right" CLASS="statText">692</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282145" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">191.32</TD><TD ALIGN="right" CLASS="statText">706</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294314" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">191.06</TD><TD ALIGN="right" CLASS="statText">770</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277162" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">189.5</TD><TD ALIGN="right" CLASS="statText">840</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290724" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">186.8</TD><TD ALIGN="right" CLASS="statText">844</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279987" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">183.61</TD><TD ALIGN="right" CLASS="statText">602</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266680" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">183.61</TD><TD ALIGN="right" CLASS="statText">864</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277834" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">183.21</TD><TD ALIGN="right" CLASS="statText">842</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297080" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">182.96</TD><TD ALIGN="right" CLASS="statText">618</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">182.57</TD><TD ALIGN="right" CLASS="statText">814</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296080" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">179.11</TD><TD ALIGN="right" CLASS="statText">892</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295308" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">178.72</TD><TD ALIGN="right" CLASS="statText">756</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292685" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">178.35</TD><TD ALIGN="right" CLASS="statText">488</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274323" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">178.13</TD><TD ALIGN="right" CLASS="statText">354</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113176" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">172.85</TD><TD ALIGN="right" CLASS="statText">502</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156420" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">171.05</TD><TD ALIGN="right" CLASS="statText">616</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284169" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">169.04</TD><TD ALIGN="right" CLASS="statText">644</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">168.52</TD><TD ALIGN="right" CLASS="statText">830</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159530" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">168.09</TD><TD ALIGN="right" CLASS="statText">520</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152391" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">167.9</TD><TD ALIGN="right" CLASS="statText">566</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296455" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">166.79</TD><TD ALIGN="right" CLASS="statText">886</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159838" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">165.51</TD><TD ALIGN="right" CLASS="statText">456</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272093" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">158.58</TD><TD ALIGN="right" CLASS="statText">632</TD></TR>
</TABLE><BR>
<TABLE CELLSPACING="1" CELLPADDING="0" BORDER="0" WIDTH="100%"><TR><TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" HEIGHT="18" VALIGN="middle">&nbsp;&nbsp;<A CLASS="statText" HREF="#top">Back to top</A>
</TD></tr>
</TABLE>


      </TD>
   </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
