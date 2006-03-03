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
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152073" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1635.36</TD><TD ALIGN="right" CLASS="statText">3</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274023" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1612.27</TD><TD ALIGN="right" CLASS="statText">9</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152347" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1584.36</TD><TD ALIGN="right" CLASS="statText">5</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1538.97</TD><TD ALIGN="right" CLASS="statText">7</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1484.23</TD><TD ALIGN="right" CLASS="statText">1</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286907" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1452.9</TD><TD ALIGN="right" CLASS="statText">27</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287496" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1439.55</TD><TD ALIGN="right" CLASS="statText">11</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263396" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1425.14</TD><TD ALIGN="right" CLASS="statText">149</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268947" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1394.42</TD><TD ALIGN="right" CLASS="statText">87</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265736" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1366.96</TD><TD ALIGN="right" CLASS="statText">51</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260987" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1304.99</TD><TD ALIGN="right" CLASS="statText">77</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114443" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1258.07</TD><TD ALIGN="right" CLASS="statText">23</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156592" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1232.76</TD><TD ALIGN="right" CLASS="statText">13</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266571" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1232.25</TD><TD ALIGN="right" CLASS="statText">97</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261567" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1178.15</TD><TD ALIGN="right" CLASS="statText">41</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="281028" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1163.68</TD><TD ALIGN="right" CLASS="statText">103</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154089" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1131.42</TD><TD ALIGN="right" CLASS="statText">21</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294242" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1114.41</TD><TD ALIGN="right" CLASS="statText">151</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251223" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1067.97</TD><TD ALIGN="right" CLASS="statText">43</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272761" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1042.54</TD><TD ALIGN="right" CLASS="statText">241</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286911" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1032.81</TD><TD ALIGN="right" CLASS="statText">63</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153733" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">995.65</TD><TD ALIGN="right" CLASS="statText">73</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273217" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">981.78</TD><TD ALIGN="right" CLASS="statText">101</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287266" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">954.69</TD><TD ALIGN="right" CLASS="statText">55</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157972" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">930.45</TD><TD ALIGN="right" CLASS="statText">17</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="281121" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">885.97</TD><TD ALIGN="right" CLASS="statText">245</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260911" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">846.75</TD><TD ALIGN="right" CLASS="statText">267</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270887" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">784.94</TD><TD ALIGN="right" CLASS="statText">65</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285577" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">737.53</TD><TD ALIGN="right" CLASS="statText">293</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160378" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">728.64</TD><TD ALIGN="right" CLASS="statText">95</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159166" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">720.1</TD><TD ALIGN="right" CLASS="statText">357</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262048" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">719.73</TD><TD ALIGN="right" CLASS="statText">99</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284386" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">717.18</TD><TD ALIGN="right" CLASS="statText">195</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="110013" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">695.63</TD><TD ALIGN="right" CLASS="statText">233</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265545" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">690.81</TD><TD ALIGN="right" CLASS="statText">53</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264869" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">680.71</TD><TD ALIGN="right" CLASS="statText">19</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="138663" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">680.57</TD><TD ALIGN="right" CLASS="statText">39</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252076" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">659.82</TD><TD ALIGN="right" CLASS="statText">71</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288584" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">646.79</TD><TD ALIGN="right" CLASS="statText">49</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154754" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">639.55</TD><TD ALIGN="right" CLASS="statText">35</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287979" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">638.06</TD><TD ALIGN="right" CLASS="statText">131</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153902" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">635.03</TD><TD ALIGN="right" CLASS="statText">15</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="135178" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">633.25</TD><TD ALIGN="right" CLASS="statText">117</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157638" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">622.72</TD><TD ALIGN="right" CLASS="statText">91</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274022" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">607.31</TD><TD ALIGN="right" CLASS="statText">381</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274529" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">606.87</TD><TD ALIGN="right" CLASS="statText">163</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="285012" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">596.52</TD><TD ALIGN="right" CLASS="statText">105</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269515" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">588.43</TD><TD ALIGN="right" CLASS="statText">137</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111057" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">587.86</TD><TD ALIGN="right" CLASS="statText">309</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260292" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">584.03</TD><TD ALIGN="right" CLASS="statText">353</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251457" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">583.9</TD><TD ALIGN="right" CLASS="statText">57</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296145" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">577.11</TD><TD ALIGN="right" CLASS="statText">215</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278938" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">571.81</TD><TD ALIGN="right" CLASS="statText">431</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266075" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">566.9</TD><TD ALIGN="right" CLASS="statText">327</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263808" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">559.86</TD><TD ALIGN="right" CLASS="statText">409</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282574" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">558.3</TD><TD ALIGN="right" CLASS="statText">325</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260272" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">554.18</TD><TD ALIGN="right" CLASS="statText">237</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296172" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">549.97</TD><TD ALIGN="right" CLASS="statText">265</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280303" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">544.53</TD><TD ALIGN="right" CLASS="statText">443</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269702" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">542.52</TD><TD ALIGN="right" CLASS="statText">161</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277956" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">541.02</TD><TD ALIGN="right" CLASS="statText">25</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286022" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">540.11</TD><TD ALIGN="right" CLASS="statText">193</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153106" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">534.17</TD><TD ALIGN="right" CLASS="statText">629</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268580" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">530.97</TD><TD ALIGN="right" CLASS="statText">83</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153140" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">520.31</TD><TD ALIGN="right" CLASS="statText">439</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158333" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">519.94</TD><TD ALIGN="right" CLASS="statText">29</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277021" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">516.31</TD><TD ALIGN="right" CLASS="statText">85</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295267" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">515.98</TD><TD ALIGN="right" CLASS="statText">329</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156541" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">513.73</TD><TD ALIGN="right" CLASS="statText">181</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154074" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">507.84</TD><TD ALIGN="right" CLASS="statText">561</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158149" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">502.44</TD><TD ALIGN="right" CLASS="statText">169</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160352" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">502.27</TD><TD ALIGN="right" CLASS="statText">613</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293470" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">492.54</TD><TD ALIGN="right" CLASS="statText">521</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271773" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">492.3</TD><TD ALIGN="right" CLASS="statText">399</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="276749" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">481.76</TD><TD ALIGN="right" CLASS="statText">121</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287269" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">479.66</TD><TD ALIGN="right" CLASS="statText">141</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266690" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">470.24</TD><TD ALIGN="right" CLASS="statText">187</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269539" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">462.84</TD><TD ALIGN="right" CLASS="statText">395</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279551" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">459.23</TD><TD ALIGN="right" CLASS="statText">525</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273100" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">457.88</TD><TD ALIGN="right" CLASS="statText">403</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263379" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">453.33</TD><TD ALIGN="right" CLASS="statText">31</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260967" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">448.96</TD><TD ALIGN="right" CLASS="statText">127</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271803" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">447.99</TD><TD ALIGN="right" CLASS="statText">393</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159544" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">446.25</TD><TD ALIGN="right" CLASS="statText">157</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266764" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">445.06</TD><TD ALIGN="right" CLASS="statText">379</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273112" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">435.08</TD><TD ALIGN="right" CLASS="statText">111</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261979" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">432.28</TD><TD ALIGN="right" CLASS="statText">497</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="275435" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">431.36</TD><TD ALIGN="right" CLASS="statText">285</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280986" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">423.9</TD><TD ALIGN="right" CLASS="statText">243</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153939" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">409.03</TD><TD ALIGN="right" CLASS="statText">177</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152476" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">389.64</TD><TD ALIGN="right" CLASS="statText">45</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260406" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">383.1</TD><TD ALIGN="right" CLASS="statText">173</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282125" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">348.5</TD><TD ALIGN="right" CLASS="statText">295</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="109990" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">340.27</TD><TD ALIGN="right" CLASS="statText">299</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265522" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">335.81</TD><TD ALIGN="right" CLASS="statText">197</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111359" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">329.4</TD><TD ALIGN="right" CLASS="statText">37</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156848" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">328.75</TD><TD ALIGN="right" CLASS="statText">69</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153724" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">328.41</TD><TD ALIGN="right" CLASS="statText">179</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159965" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">318.45</TD><TD ALIGN="right" CLASS="statText">219</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268010" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">318.22</TD><TD ALIGN="right" CLASS="statText">519</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297082" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">303.71</TD><TD ALIGN="right" CLASS="statText">487</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="111202" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">301.28</TD><TD ALIGN="right" CLASS="statText">81</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263371" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">294.36</TD><TD ALIGN="right" CLASS="statText">113</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251989" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">290.76</TD><TD ALIGN="right" CLASS="statText">153</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293597" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">279.89</TD><TD ALIGN="right" CLASS="statText">585</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260952" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">277.44</TD><TD ALIGN="right" CLASS="statText">483</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282276" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">274.32</TD><TD ALIGN="right" CLASS="statText">707</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266049" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">272.34</TD><TD ALIGN="right" CLASS="statText">323</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271250" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">269.87</TD><TD ALIGN="right" CLASS="statText">477</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296745" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">266.18</TD><TD ALIGN="right" CLASS="statText">79</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151707" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">264.83</TD><TD ALIGN="right" CLASS="statText">673</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263691" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">264.72</TD><TD ALIGN="right" CLASS="statText">281</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265774" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">262.31</TD><TD ALIGN="right" CLASS="statText">513</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158301" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">260.17</TD><TD ALIGN="right" CLASS="statText">67</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294034" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">260.06</TD><TD ALIGN="right" CLASS="statText">429</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157900" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">256.86</TD><TD ALIGN="right" CLASS="statText">465</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269078" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">256.21</TD><TD ALIGN="right" CLASS="statText">171</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269886" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">254.18</TD><TD ALIGN="right" CLASS="statText">437</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251661" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">251.95</TD><TD ALIGN="right" CLASS="statText">451</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158311" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">247.05</TD><TD ALIGN="right" CLASS="statText">555</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251162" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">246.48</TD><TD ALIGN="right" CLASS="statText">591</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="160082" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.46</TD><TD ALIGN="right" CLASS="statText">373</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156906" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">242.4</TD><TD ALIGN="right" CLASS="statText">621</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="288302" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">241.61</TD><TD ALIGN="right" CLASS="statText">331</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265425" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.78</TD><TD ALIGN="right" CLASS="statText">551</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260898" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.11</TD><TD ALIGN="right" CLASS="statText">605</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268804" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">240.0</TD><TD ALIGN="right" CLASS="statText">365</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271496" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">239.18</TD><TD ALIGN="right" CLASS="statText">185</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154135" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.97</TD><TD ALIGN="right" CLASS="statText">89</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267221" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">236.58</TD><TD ALIGN="right" CLASS="statText">375</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274788" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">234.53</TD><TD ALIGN="right" CLASS="statText">615</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251591" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">233.53</TD><TD ALIGN="right" CLASS="statText">501</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266485" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">232.76</TD><TD ALIGN="right" CLASS="statText">471</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278240" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">231.33</TD><TD ALIGN="right" CLASS="statText">719</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152980" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">229.56</TD><TD ALIGN="right" CLASS="statText">315</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273474" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">228.77</TD><TD ALIGN="right" CLASS="statText">201</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271037" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">225.69</TD><TD ALIGN="right" CLASS="statText">255</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153517" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">225.33</TD><TD ALIGN="right" CLASS="statText">257</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251089" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">225.06</TD><TD ALIGN="right" CLASS="statText">607</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273414" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">223.29</TD><TD ALIGN="right" CLASS="statText">217</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159146" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">222.4</TD><TD ALIGN="right" CLASS="statText">611</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271214" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">221.94</TD><TD ALIGN="right" CLASS="statText">741</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296999" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">221.25</TD><TD ALIGN="right" CLASS="statText">385</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295716" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">220.55</TD><TD ALIGN="right" CLASS="statText">175</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274885" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">220.26</TD><TD ALIGN="right" CLASS="statText">133</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264949" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">219.8</TD><TD ALIGN="right" CLASS="statText">59</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156402" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">217.84</TD><TD ALIGN="right" CLASS="statText">649</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154041" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">217.83</TD><TD ALIGN="right" CLASS="statText">547</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293262" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">213.93</TD><TD ALIGN="right" CLASS="statText">405</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151059" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">213.78</TD><TD ALIGN="right" CLASS="statText">637</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277907" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">208.35</TD><TD ALIGN="right" CLASS="statText">337</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282728" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">206.29</TD><TD ALIGN="right" CLASS="statText">441</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="109933" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">204.01</TD><TD ALIGN="right" CLASS="statText">199</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263143" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">199.38</TD><TD ALIGN="right" CLASS="statText">301</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269678" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">199.29</TD><TD ALIGN="right" CLASS="statText">341</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267844" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">198.19</TD><TD ALIGN="right" CLASS="statText">223</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278932" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">195.24</TD><TD ALIGN="right" CLASS="statText">775</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="296234" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">193.77</TD><TD ALIGN="right" CLASS="statText">799</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293822" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">192.92</TD><TD ALIGN="right" CLASS="statText">333</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="289288" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">191.57</TD><TD ALIGN="right" CLASS="statText">383</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274498" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">189.79</TD><TD ALIGN="right" CLASS="statText">155</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156372" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">184.89</TD><TD ALIGN="right" CLASS="statText">461</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="269058" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">183.2</TD><TD ALIGN="right" CLASS="statText">143</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="284049" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">178.25</TD><TD ALIGN="right" CLASS="statText">759</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294570" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">177.03</TD><TD ALIGN="right" CLASS="statText">567</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156485" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">174.11</TD><TD ALIGN="right" CLASS="statText">283</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="280622" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">170.9</TD><TD ALIGN="right" CLASS="statText">593</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271144" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">163.45</TD><TD ALIGN="right" CLASS="statText">703</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292845" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">162.52</TD><TD ALIGN="right" CLASS="statText">515</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264761" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">162.41</TD><TD ALIGN="right" CLASS="statText">401</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">159.14</TD><TD ALIGN="right" CLASS="statText">767</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265410" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">157.32</TD><TD ALIGN="right" CLASS="statText">705</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295620" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">156.97</TD><TD ALIGN="right" CLASS="statText">581</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262271" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">152.39</TD><TD ALIGN="right" CLASS="statText">435</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251046" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">152.25</TD><TD ALIGN="right" CLASS="statText">645</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158653" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">148.75</TD><TD ALIGN="right" CLASS="statText">723</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="283873" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">145.16</TD><TD ALIGN="right" CLASS="statText">539</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263860" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">143.92</TD><TD ALIGN="right" CLASS="statText">639</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266173" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">136.06</TD><TD ALIGN="right" CLASS="statText">603</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270914" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">134.33</TD><TD ALIGN="right" CLASS="statText">921</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286929" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">129.54</TD><TD ALIGN="right" CLASS="statText">667</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="101459" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">125.51</TD><TD ALIGN="right" CLASS="statText">825</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268007" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">122.51</TD><TD ALIGN="right" CLASS="statText">533</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265504" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">100.0</TD><TD ALIGN="right" CLASS="statText">355</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="282718" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">100.0</TD><TD ALIGN="right" CLASS="statText">421</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="159818" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">100.0</TD><TD ALIGN="right" CLASS="statText">125</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287864" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">90.0</TD><TD ALIGN="right" CLASS="statText">651</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261051" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">76.4</TD><TD ALIGN="right" CLASS="statText">697</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267495" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">695</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273013" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">553</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="278964" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">367</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264176" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">491</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158782" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">433</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="266149" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">455</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="295768" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">577</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274760" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">571</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286361" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">683</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113573" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">135</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158896" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">50.0</TD><TD ALIGN="right" CLASS="statText">781</TD></TR>
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
