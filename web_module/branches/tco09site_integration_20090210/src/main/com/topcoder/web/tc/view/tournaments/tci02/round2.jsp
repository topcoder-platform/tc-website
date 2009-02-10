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
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1312.65</TD><TD ALIGN="right" CLASS="statText">2</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287496" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1192.32</TD><TD ALIGN="right" CLASS="statText">11</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260987" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1155.44</TD><TD ALIGN="right" CLASS="statText">77</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156216" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1150.13</TD><TD ALIGN="right" CLASS="statText">40</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="120816" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1139.68</TD><TD ALIGN="right" CLASS="statText">12</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274023" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1115.35</TD><TD ALIGN="right" CLASS="statText">9</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114853" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1113.34</TD><TD ALIGN="right" CLASS="statText">8</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252076" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1112.04</TD><TD ALIGN="right" CLASS="statText">71</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277956" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1091.61</TD><TD ALIGN="right" CLASS="statText">25</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153733" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1074.93</TD><TD ALIGN="right" CLASS="statText">73</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="298209" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1063.78</TD><TD ALIGN="right" CLASS="statText">24</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1000.63</TD><TD ALIGN="right" CLASS="statText">7</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="107835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">975.28</TD><TD ALIGN="right" CLASS="statText">64</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277659" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">971.3</TD><TD ALIGN="right" CLASS="statText">6</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">941.67</TD><TD ALIGN="right" CLASS="statText">14</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158658" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">924.34</TD><TD ALIGN="right" CLASS="statText">36</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152347" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">903.27</TD><TD ALIGN="right" CLASS="statText">5</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268947" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">858.0</TD><TD ALIGN="right" CLASS="statText">87</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112902" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">820.33</TD><TD ALIGN="right" CLASS="statText">60</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270887" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">809.59</TD><TD ALIGN="right" CLASS="statText">65</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154089" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">788.02</TD><TD ALIGN="right" CLASS="statText">21</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260828" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">784.96</TD><TD ALIGN="right" CLASS="statText">130</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274068" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">759.55</TD><TD ALIGN="right" CLASS="statText">30</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138518" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">671.24</TD><TD ALIGN="right" CLASS="statText">240</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152073" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">666.12</TD><TD ALIGN="right" CLASS="statText">3</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290395" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">649.88</TD><TD ALIGN="right" CLASS="statText">452</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112939" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">611.52</TD><TD ALIGN="right" CLASS="statText">54</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">608.26</TD><TD ALIGN="right" CLASS="statText">1</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154754" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">561.53</TD><TD ALIGN="right" CLASS="statText">35</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288584" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">551.98</TD><TD ALIGN="right" CLASS="statText">49</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267834" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">551.0</TD><TD ALIGN="right" CLASS="statText">56</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113178" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">550.56</TD><TD ALIGN="right" CLASS="statText">28</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289251" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">547.34</TD><TD ALIGN="right" CLASS="statText">98</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158137" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">525.46</TD><TD ALIGN="right" CLASS="statText">114</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="109965" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">524.62</TD><TD ALIGN="right" CLASS="statText">86</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="108530" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">523.6</TD><TD ALIGN="right" CLASS="statText">46</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111202" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">519.35</TD><TD ALIGN="right" CLASS="statText">81</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158067" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">518.21</TD><TD ALIGN="right" CLASS="statText">42</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154648" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">517.37</TD><TD ALIGN="right" CLASS="statText">156</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265736" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">515.78</TD><TD ALIGN="right" CLASS="statText">51</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269058" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">514.06</TD><TD ALIGN="right" CLASS="statText">143</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269515" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">510.38</TD><TD ALIGN="right" CLASS="statText">137</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274018" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">508.87</TD><TD ALIGN="right" CLASS="statText">32</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274885" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">507.82</TD><TD ALIGN="right" CLASS="statText">133</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152614" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">507.25</TD><TD ALIGN="right" CLASS="statText">198</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="115147" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">501.16</TD><TD ALIGN="right" CLASS="statText">68</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113573" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">499.33</TD><TD ALIGN="right" CLASS="statText">135</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287269" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">497.03</TD><TD ALIGN="right" CLASS="statText">141</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293390" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">495.58</TD><TD ALIGN="right" CLASS="statText">118</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287105" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">494.3</TD><TD ALIGN="right" CLASS="statText">62</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268580" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">493.85</TD><TD ALIGN="right" CLASS="statText">83</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159921" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">490.97</TD><TD ALIGN="right" CLASS="statText">170</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112441" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">487.56</TD><TD ALIGN="right" CLASS="statText">294</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157628" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">484.86</TD><TD ALIGN="right" CLASS="statText">84</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287266" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">475.19</TD><TD ALIGN="right" CLASS="statText">55</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296172" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">475.04</TD><TD ALIGN="right" CLASS="statText">265</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="133846" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">474.52</TD><TD ALIGN="right" CLASS="statText">44</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286112" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">471.46</TD><TD ALIGN="right" CLASS="statText">164</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152340" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">468.05</TD><TD ALIGN="right" CLASS="statText">120</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269025" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">465.37</TD><TD ALIGN="right" CLASS="statText">94</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251223" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">464.3</TD><TD ALIGN="right" CLASS="statText">43</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">464.22</TD><TD ALIGN="right" CLASS="statText">18</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="135178" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">462.31</TD><TD ALIGN="right" CLASS="statText">117</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293470" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">455.76</TD><TD ALIGN="right" CLASS="statText">521</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="281028" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">455.67</TD><TD ALIGN="right" CLASS="statText">103</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152610" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">455.36</TD><TD ALIGN="right" CLASS="statText">300</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284655" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">455.28</TD><TD ALIGN="right" CLASS="statText">262</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="110176" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">454.51</TD><TD ALIGN="right" CLASS="statText">312</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297746" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">451.44</TD><TD ALIGN="right" CLASS="statText">228</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294543" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">448.32</TD><TD ALIGN="right" CLASS="statText">464</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138663" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">447.36</TD><TD ALIGN="right" CLASS="statText">39</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296969" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">446.21</TD><TD ALIGN="right" CLASS="statText">396</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260761" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">445.43</TD><TD ALIGN="right" CLASS="statText">92</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158333" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">445.22</TD><TD ALIGN="right" CLASS="statText">29</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274537" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">445.07</TD><TD ALIGN="right" CLASS="statText">256</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159100" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">439.18</TD><TD ALIGN="right" CLASS="statText">96</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287979" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">438.71</TD><TD ALIGN="right" CLASS="statText">131</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158110" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">437.81</TD><TD ALIGN="right" CLASS="statText">194</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285012" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">434.75</TD><TD ALIGN="right" CLASS="statText">105</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154619" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">434.26</TD><TD ALIGN="right" CLASS="statText">298</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150961" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">431.72</TD><TD ALIGN="right" CLASS="statText">222</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277723" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">431.65</TD><TD ALIGN="right" CLASS="statText">410</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152476" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">429.48</TD><TD ALIGN="right" CLASS="statText">45</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273112" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">429.14</TD><TD ALIGN="right" CLASS="statText">111</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113491" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">428.9</TD><TD ALIGN="right" CLASS="statText">250</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="136367" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">425.55</TD><TD ALIGN="right" CLASS="statText">180</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263143" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">425.34</TD><TD ALIGN="right" CLASS="statText">301</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138655" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">425.24</TD><TD ALIGN="right" CLASS="statText">104</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290481" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">423.76</TD><TD ALIGN="right" CLASS="statText">458</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111359" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">421.9</TD><TD ALIGN="right" CLASS="statText">37</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251457" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">421.77</TD><TD ALIGN="right" CLASS="statText">57</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157972" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">421.44</TD><TD ALIGN="right" CLASS="statText">17</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285577" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">420.53</TD><TD ALIGN="right" CLASS="statText">293</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295620" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">413.86</TD><TD ALIGN="right" CLASS="statText">581</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280570" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">405.32</TD><TD ALIGN="right" CLASS="statText">80</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151144" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">404.16</TD><TD ALIGN="right" CLASS="statText">106</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284386" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">398.68</TD><TD ALIGN="right" CLASS="statText">195</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293262" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">394.97</TD><TD ALIGN="right" CLASS="statText">405</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153724" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">394.48</TD><TD ALIGN="right" CLASS="statText">179</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267844" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">385.85</TD><TD ALIGN="right" CLASS="statText">223</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156485" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">383.3</TD><TD ALIGN="right" CLASS="statText">283</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251989" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">296.06</TD><TD ALIGN="right" CLASS="statText">153</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114443" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">294.55</TD><TD ALIGN="right" CLASS="statText">23</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268720" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">293.9</TD><TD ALIGN="right" CLASS="statText">322</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263396" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">291.71</TD><TD ALIGN="right" CLASS="statText">149</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159166" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">290.66</TD><TD ALIGN="right" CLASS="statText">357</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160049" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">286.74</TD><TD ALIGN="right" CLASS="statText">332</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280167" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">285.81</TD><TD ALIGN="right" CLASS="statText">540</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153140" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">285.48</TD><TD ALIGN="right" CLASS="statText">439</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262271" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">280.62</TD><TD ALIGN="right" CLASS="statText">435</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260170" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">272.36</TD><TD ALIGN="right" CLASS="statText">102</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273013" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">270.75</TD><TD ALIGN="right" CLASS="statText">553</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295716" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">265.35</TD><TD ALIGN="right" CLASS="statText">175</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266075" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">259.57</TD><TD ALIGN="right" CLASS="statText">327</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251591" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">256.41</TD><TD ALIGN="right" CLASS="statText">501</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273206" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.81</TD><TD ALIGN="right" CLASS="statText">126</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156848" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.64</TD><TD ALIGN="right" CLASS="statText">69</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.36</TD><TD ALIGN="right" CLASS="statText">160</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156541" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.03</TD><TD ALIGN="right" CLASS="statText">181</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252074" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.0</TD><TD ALIGN="right" CLASS="statText">568</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277021" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.99</TD><TD ALIGN="right" CLASS="statText">85</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260292" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.84</TD><TD ALIGN="right" CLASS="statText">353</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151360" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.52</TD><TD ALIGN="right" CLASS="statText">124</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152342" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.48</TD><TD ALIGN="right" CLASS="statText">134</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155621" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.48</TD><TD ALIGN="right" CLASS="statText">76</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266571" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.21</TD><TD ALIGN="right" CLASS="statText">97</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268954" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.21</TD><TD ALIGN="right" CLASS="statText">112</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111057" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.19</TD><TD ALIGN="right" CLASS="statText">309</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269553" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.13</TD><TD ALIGN="right" CLASS="statText">512</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158837" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.02</TD><TD ALIGN="right" CLASS="statText">100</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251207" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">245.96</TD><TD ALIGN="right" CLASS="statText">448</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282560" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">245.65</TD><TD ALIGN="right" CLASS="statText">342</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271978" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">245.17</TD><TD ALIGN="right" CLASS="statText">214</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262467" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.97</TD><TD ALIGN="right" CLASS="statText">246</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138158" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.88</TD><TD ALIGN="right" CLASS="statText">398</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158149" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.79</TD><TD ALIGN="right" CLASS="statText">169</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="108262" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.53</TD><TD ALIGN="right" CLASS="statText">52</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271917" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.43</TD><TD ALIGN="right" CLASS="statText">672</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157053" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.21</TD><TD ALIGN="right" CLASS="statText">482</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266750" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.09</TD><TD ALIGN="right" CLASS="statText">236</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285889" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.02</TD><TD ALIGN="right" CLASS="statText">258</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270193" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.0</TD><TD ALIGN="right" CLASS="statText">678</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297823" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">244.0</TD><TD ALIGN="right" CLASS="statText">158</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="129672" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.61</TD><TD ALIGN="right" CLASS="statText">10</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158301" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.47</TD><TD ALIGN="right" CLASS="statText">67</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158759" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.24</TD><TD ALIGN="right" CLASS="statText">330</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273217" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.18</TD><TD ALIGN="right" CLASS="statText">101</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273474" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.14</TD><TD ALIGN="right" CLASS="statText">201</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278499" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.04</TD><TD ALIGN="right" CLASS="statText">822</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287568" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">243.01</TD><TD ALIGN="right" CLASS="statText">148</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263808" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.75</TD><TD ALIGN="right" CLASS="statText">409</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.61</TD><TD ALIGN="right" CLASS="statText">4</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156640" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.6</TD><TD ALIGN="right" CLASS="statText">254</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286944" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.58</TD><TD ALIGN="right" CLASS="statText">188</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273428" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.56</TD><TD ALIGN="right" CLASS="statText">162</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156402" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.55</TD><TD ALIGN="right" CLASS="statText">649</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268951" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.42</TD><TD ALIGN="right" CLASS="statText">248</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="291974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.1</TD><TD ALIGN="right" CLASS="statText">310</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="147102" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.0</TD><TD ALIGN="right" CLASS="statText">26</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263379" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.84</TD><TD ALIGN="right" CLASS="statText">31</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266485" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.77</TD><TD ALIGN="right" CLASS="statText">471</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154074" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.68</TD><TD ALIGN="right" CLASS="statText">561</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158258" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.5</TD><TD ALIGN="right" CLASS="statText">184</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296745" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.34</TD><TD ALIGN="right" CLASS="statText">79</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271976" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.23</TD><TD ALIGN="right" CLASS="statText">284</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264031" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.12</TD><TD ALIGN="right" CLASS="statText">272</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157638" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.03</TD><TD ALIGN="right" CLASS="statText">91</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266625" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.9</TD><TD ALIGN="right" CLASS="statText">362</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264869" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.85</TD><TD ALIGN="right" CLASS="statText">19</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279551" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.79</TD><TD ALIGN="right" CLASS="statText">525</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267221" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.7</TD><TD ALIGN="right" CLASS="statText">375</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156804" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.68</TD><TD ALIGN="right" CLASS="statText">50</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160378" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.61</TD><TD ALIGN="right" CLASS="statText">95</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297005" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.61</TD><TD ALIGN="right" CLASS="statText">232</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271214" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.6</TD><TD ALIGN="right" CLASS="statText">741</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="276749" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.58</TD><TD ALIGN="right" CLASS="statText">121</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159758" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.42</TD><TD ALIGN="right" CLASS="statText">334</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="290274" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.4</TD><TD ALIGN="right" CLASS="statText">388</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293822" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.33</TD><TD ALIGN="right" CLASS="statText">333</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159818" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.26</TD><TD ALIGN="right" CLASS="statText">125</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271496" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.25</TD><TD ALIGN="right" CLASS="statText">185</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271803" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.25</TD><TD ALIGN="right" CLASS="statText">393</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262936" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.24</TD><TD ALIGN="right" CLASS="statText">16</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159544" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.91</TD><TD ALIGN="right" CLASS="statText">157</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268851" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.87</TD><TD ALIGN="right" CLASS="statText">224</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297935" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.64</TD><TD ALIGN="right" CLASS="statText">476</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269739" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.52</TD><TD ALIGN="right" CLASS="statText">504</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="110013" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.41</TD><TD ALIGN="right" CLASS="statText">233</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260185" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.35</TD><TD ALIGN="right" CLASS="statText">578</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295267" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.35</TD><TD ALIGN="right" CLASS="statText">329</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269702" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.93</TD><TD ALIGN="right" CLASS="statText">161</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280198" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.93</TD><TD ALIGN="right" CLASS="statText">200</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280380" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.71</TD><TD ALIGN="right" CLASS="statText">274</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270932" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.62</TD><TD ALIGN="right" CLASS="statText">360</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269078" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.11</TD><TD ALIGN="right" CLASS="statText">171</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272093" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">238.04</TD><TD ALIGN="right" CLASS="statText">632</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150852" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.8</TD><TD ALIGN="right" CLASS="statText">90</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158447" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.74</TD><TD ALIGN="right" CLASS="statText">196</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274498" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.71</TD><TD ALIGN="right" CLASS="statText">155</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286907" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.44</TD><TD ALIGN="right" CLASS="statText">27</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278938" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.39</TD><TD ALIGN="right" CLASS="statText">431</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264678" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">237.14</TD><TD ALIGN="right" CLASS="statText">204</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282574" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.96</TD><TD ALIGN="right" CLASS="statText">325</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153517" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.89</TD><TD ALIGN="right" CLASS="statText">257</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292451" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.81</TD><TD ALIGN="right" CLASS="statText">276</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271773" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.75</TD><TD ALIGN="right" CLASS="statText">399</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296232" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.6</TD><TD ALIGN="right" CLASS="statText">320</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267831" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.58</TD><TD ALIGN="right" CLASS="statText">178</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154135" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.43</TD><TD ALIGN="right" CLASS="statText">89</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150796" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.16</TD><TD ALIGN="right" CLASS="statText">58</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151707" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.84</TD><TD ALIGN="right" CLASS="statText">673</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283993" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.82</TD><TD ALIGN="right" CLASS="statText">326</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287614" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.77</TD><TD ALIGN="right" CLASS="statText">610</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="105922" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.65</TD><TD ALIGN="right" CLASS="statText">22</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274022" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.59</TD><TD ALIGN="right" CLASS="statText">381</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="150498" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.32</TD><TD ALIGN="right" CLASS="statText">220</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262598" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.31</TD><TD ALIGN="right" CLASS="statText">364</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266685" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">235.05</TD><TD ALIGN="right" CLASS="statText">528</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261567" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.83</TD><TD ALIGN="right" CLASS="statText">41</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="142795" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.63</TD><TD ALIGN="right" CLASS="statText">38</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279288" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.54</TD><TD ALIGN="right" CLASS="statText">436</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271037" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.24</TD><TD ALIGN="right" CLASS="statText">255</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296145" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.14</TD><TD ALIGN="right" CLASS="statText">215</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156592" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.05</TD><TD ALIGN="right" CLASS="statText">13</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159446" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.0</TD><TD ALIGN="right" CLASS="statText">358</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294570" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.99</TD><TD ALIGN="right" CLASS="statText">567</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265504" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.98</TD><TD ALIGN="right" CLASS="statText">355</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159148" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.87</TD><TD ALIGN="right" CLASS="statText">676</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264158" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.67</TD><TD ALIGN="right" CLASS="statText">82</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152617" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.61</TD><TD ALIGN="right" CLASS="statText">374</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260172" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.52</TD><TD ALIGN="right" CLASS="statText">370</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="106771" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.39</TD><TD ALIGN="right" CLASS="statText">282</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265918" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.16</TD><TD ALIGN="right" CLASS="statText">524</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158819" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.99</TD><TD ALIGN="right" CLASS="statText">468</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268537" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.73</TD><TD ALIGN="right" CLASS="statText">466</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297082" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.62</TD><TD ALIGN="right" CLASS="statText">487</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="141448" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.43</TD><TD ALIGN="right" CLASS="statText">140</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288302" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.33</TD><TD ALIGN="right" CLASS="statText">331</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267766" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.23</TD><TD ALIGN="right" CLASS="statText">542</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274760" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.2</TD><TD ALIGN="right" CLASS="statText">571</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260952" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.11</TD><TD ALIGN="right" CLASS="statText">483</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273434" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.98</TD><TD ALIGN="right" CLASS="statText">724</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264949" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.84</TD><TD ALIGN="right" CLASS="statText">59</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="281121" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.79</TD><TD ALIGN="right" CLASS="statText">245</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264986" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.66</TD><TD ALIGN="right" CLASS="statText">242</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279526" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.52</TD><TD ALIGN="right" CLASS="statText">152</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293597" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.42</TD><TD ALIGN="right" CLASS="statText">585</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297365" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.33</TD><TD ALIGN="right" CLASS="statText">750</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260898" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">230.91</TD><TD ALIGN="right" CLASS="statText">605</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="109990" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">230.82</TD><TD ALIGN="right" CLASS="statText">299</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159838" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">230.71</TD><TD ALIGN="right" CLASS="statText">456</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286022" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">230.35</TD><TD ALIGN="right" CLASS="statText">193</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282276" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">230.13</TD><TD ALIGN="right" CLASS="statText">707</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296489" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">229.93</TD><TD ALIGN="right" CLASS="statText">500</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289706" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">229.78</TD><TD ALIGN="right" CLASS="statText">288</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153183" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">229.34</TD><TD ALIGN="right" CLASS="statText">318</TD></tr>
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
