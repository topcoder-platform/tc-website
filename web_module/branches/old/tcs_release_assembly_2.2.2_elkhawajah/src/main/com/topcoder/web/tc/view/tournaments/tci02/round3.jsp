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
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152347" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1472.93</TD><TD ALIGN="right" CLASS="statText">5</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1359.65</TD><TD ALIGN="right" CLASS="statText">1</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1344.45</TD><TD ALIGN="right" CLASS="statText">4</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264869" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1318.13</TD><TD ALIGN="right" CLASS="statText">19</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114443" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1264.28</TD><TD ALIGN="right" CLASS="statText">23</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="251223" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1235.51</TD><TD ALIGN="right" CLASS="statText">43</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1228.3</TD><TD ALIGN="right" CLASS="statText">14</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="281028" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1207.36</TD><TD ALIGN="right" CLASS="statText">103</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="129672" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1205.12</TD><TD ALIGN="right" CLASS="statText">10</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="286907" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1204.09</TD><TD ALIGN="right" CLASS="statText">27</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1189.66</TD><TD ALIGN="right" CLASS="statText">18</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="261567" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1181.15</TD><TD ALIGN="right" CLASS="statText">41</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152342" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1149.51</TD><TD ALIGN="right" CLASS="statText">134</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="112939" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1146.1</TD><TD ALIGN="right" CLASS="statText">54</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287269" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1125.8</TD><TD ALIGN="right" CLASS="statText">141</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268947" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1116.45</TD><TD ALIGN="right" CLASS="statText">87</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158067" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1108.63</TD><TD ALIGN="right" CLASS="statText">42</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264949" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1106.24</TD><TD ALIGN="right" CLASS="statText">59</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287266" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1097.45</TD><TD ALIGN="right" CLASS="statText">55</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287568" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1088.12</TD><TD ALIGN="right" CLASS="statText">148</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277956" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1076.18</TD><TD ALIGN="right" CLASS="statText">25</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="279526" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1068.95</TD><TD ALIGN="right" CLASS="statText">152</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277659" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1068.37</TD><TD ALIGN="right" CLASS="statText">6</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154089" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1061.35</TD><TD ALIGN="right" CLASS="statText">21</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="252076" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1057.6</TD><TD ALIGN="right" CLASS="statText">71</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274018" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1035.47</TD><TD ALIGN="right" CLASS="statText">32</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158110" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1031.56</TD><TD ALIGN="right" CLASS="statText">194</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157974" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1016.22</TD><TD ALIGN="right" CLASS="statText">7</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287105" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">997.44</TD><TD ALIGN="right" CLASS="statText">62</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274068" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">996.35</TD><TD ALIGN="right" CLASS="statText">30</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156485" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">993.29</TD><TD ALIGN="right" CLASS="statText">283</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297746" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">989.35</TD><TD ALIGN="right" CLASS="statText">228</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">988.44</TD><TD ALIGN="right" CLASS="statText">2</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="156216" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">977.81</TD><TD ALIGN="right" CLASS="statText">40</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="298209" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">975.73</TD><TD ALIGN="right" CLASS="statText">24</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="273217" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">960.81</TD><TD ALIGN="right" CLASS="statText">101</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153733" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">959.93</TD><TD ALIGN="right" CLASS="statText">73</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="263396" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">890.22</TD><TD ALIGN="right" CLASS="statText">149</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="120816" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">873.39</TD><TD ALIGN="right" CLASS="statText">12</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157628" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">790.56</TD><TD ALIGN="right" CLASS="statText">84</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270887" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">764.2</TD><TD ALIGN="right" CLASS="statText">65</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="297823" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">711.7</TD><TD ALIGN="right" CLASS="statText">158</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158837" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">701.41</TD><TD ALIGN="right" CLASS="statText">100</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152073" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">700.6</TD><TD ALIGN="right" CLASS="statText">3</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="265736" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">682.57</TD><TD ALIGN="right" CLASS="statText">51</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="274498" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">672.4</TD><TD ALIGN="right" CLASS="statText">155</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268851" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">672.08</TD><TD ALIGN="right" CLASS="statText">224</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="113178" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">670.51</TD><TD ALIGN="right" CLASS="statText">28</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="292451" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">659.52</TD><TD ALIGN="right" CLASS="statText">276</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="293262" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">658.27</TD><TD ALIGN="right" CLASS="statText">405</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="158333" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">649.73</TD><TD ALIGN="right" CLASS="statText">29</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277021" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">644.15</TD><TD ALIGN="right" CLASS="statText">85</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="154754" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">644.06</TD><TD ALIGN="right" CLASS="statText">35</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114853" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">642.98</TD><TD ALIGN="right" CLASS="statText">8</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="271496" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">626.05</TD><TD ALIGN="right" CLASS="statText">185</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="268720" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">626.02</TD><TD ALIGN="right" CLASS="statText">322</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262936" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">614.54</TD><TD ALIGN="right" CLASS="statText">16</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="141448" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">605.12</TD><TD ALIGN="right" CLASS="statText">140</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157972" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">604.12</TD><TD ALIGN="right" CLASS="statText">17</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="151360" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">601.07</TD><TD ALIGN="right" CLASS="statText">124</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="267834" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">596.64</TD><TD ALIGN="right" CLASS="statText">56</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260987" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">595.9</TD><TD ALIGN="right" CLASS="statText">77</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="142795" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">592.24</TD><TD ALIGN="right" CLASS="statText">38</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="294543" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">588.18</TD><TD ALIGN="right" CLASS="statText">464</TD></TR>
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
