<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/modules/tournament_invit02_links.xsl"/>  
  <xsl:import href="../includes/modules/invit02_rule_links.xsl"/> 
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Tournaments</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#CCCCCC" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <a name="top_page"></a>
        <xsl:variable name="contestId">
          <xsl:value-of select="/TC/SCHEDULE/ContestId"/>
        </xsl:variable>
        <xsl:call-template name="Top"/>
        <!-- Body Begins -->
        <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
          <TR>
            <!-- Left Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
              <!-- Left Column Include Begins -->  
              <!-- Global Seconday Nav Begins -->  
              <xsl:call-template name="global_left"/>
              <!-- Global Seconday Nav Ends -->      
              <!-- Left Column Include Ends -->          
            </TD>
            <!-- Left Column Ends -->
            <!-- Gutter Begins -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Body Area -->
            <!-- Center Column Begins -->  
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">steelblue</xsl:with-param>
  <xsl:with-param name="image">tournaments_blue</xsl:with-param>
  <xsl:with-param name="title">&#160;</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
	<TR>
		<TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
		<TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
    <!-- Coder of the Week Pulldown Begins -->	
<xsl:call-template name="tournament_invit02_links"/>
    <BR/>			
        <xsl:call-template name="invit02_rule_links"/>
	<!-- Coder of the Week Pulldown Ends -->
	<BR/><BR/>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                    <TR>
                      <TD COLSPAN="4" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Online Round #1, Part 1 Advancers</TD>
                      <TD COLSPAN="2" ALIGN="right" VALIGN="middle" HEIGHT="18" CLASS="statTextBig"><A HREF="/index?t=schedule&amp;c=invit02_pt2" CLASS="statTextBig">View Part 2 Seeding</A></TD>
                    </TR>
						<TR>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_pt1" CLASS="statTextBig">Round #1</A></TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_r2" CLASS="statTextBig"></A>Round #2</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_r3" CLASS="statTextBig"></A>Round #3</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_r4" CLASS="statTextBig"></A>Round #4</TD>
							<TD WIDTH="15%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_semi" CLASS="statTextBig"></A>Semi</TD>	
							<TD WIDTH="25%" ALIGN="center" VALIGN="middle" HEIGHT="16" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/index?t=schedule&amp;c=invit02_champ" CLASS="statTextBig"></A>Champ</TD>												
						</TR>
                    </TABLE><BR/>
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="1" CELLSPACING="1" ALIGN="center">
						<TR>
							<TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" HEIGHT="18" BGCOLOR="#666666">Handle</TD>
							<TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#666666">Points</TD>							
							<TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BGCOLOR="#666666">Tourney Seed</TD>							
						</TR>
 <TR>
  <td CLASS="statText">halflife</td>
  <td CLASS="statText" ALIGN="right">1136.50</td>
  <td CLASS="statText" ALIGN="right">56</td>
  </TR>
 <TR>
  <td CLASS="statText">reid</td>
  <td CLASS="statText" ALIGN="right">1135.45</td>
  <td CLASS="statText" ALIGN="right">2</td>
  </TR>
 <TR>
  <td CLASS="statText">John Dethridge</td>
  <td CLASS="statText" ALIGN="right">1120.10</td>
  <td CLASS="statText" ALIGN="right">4</td>
  </TR>
 <TR>
  <td CLASS="statText">ambrose</td>
  <td CLASS="statText" ALIGN="right">1115.16</td>
  <td CLASS="statText" ALIGN="right">14</td>
  </TR>
 <TR>
  <td CLASS="statText">dmwright</td>
  <td CLASS="statText" ALIGN="right">1109.01</td>
  <td CLASS="statText" ALIGN="right">8</td>
  </TR>
 <TR>
  <td CLASS="statText">DjinnKahn</td>
  <td CLASS="statText" ALIGN="right">1105.80</td>
  <td CLASS="statText" ALIGN="right">18</td>
  </TR>
 <TR>
  <td CLASS="statText">Logan</td>
  <td CLASS="statText" ALIGN="right">1099.53</td>
  <td CLASS="statText" ALIGN="right">60</td>
  </TR>
 <TR>
  <td CLASS="statText">Zaen</td>
  <td CLASS="statText" ALIGN="right">1085.47</td>
  <td CLASS="statText" ALIGN="right">50</td>
  </TR>
 <TR>
  <td CLASS="statText">malpt</td>
  <td CLASS="statText" ALIGN="right">1082.37</td>
  <td CLASS="statText" ALIGN="right">12</td>
  </TR>
 <TR>
  <td CLASS="statText">axch</td>
  <td CLASS="statText" ALIGN="right">1063.26</td>
  <td CLASS="statText" ALIGN="right">100</td>
  </TR>
 <TR>
  <td CLASS="statText">petch</td>
  <td CLASS="statText" ALIGN="right">1054.92</td>
  <td CLASS="statText" ALIGN="right">154</td>
  </TR>
 <TR>
  <td CLASS="statText">dgarthur</td>
  <td CLASS="statText" ALIGN="right">1043.59</td>
  <td CLASS="statText" ALIGN="right">16</td>
  </TR>
 <TR>
  <td CLASS="statText">ntrhieu</td>
  <td CLASS="statText" ALIGN="right">1025.77</td>
  <td CLASS="statText" ALIGN="right">36</td>
  </TR>
 <TR>
  <td CLASS="statText">seacow</td>
  <td CLASS="statText" ALIGN="right">784.40</td>
  <td CLASS="statText" ALIGN="right">294</td>
  </TR>
 <TR>
  <td CLASS="statText">zoidal</td>
  <td CLASS="statText" ALIGN="right">779.03</td>
  <td CLASS="statText" ALIGN="right">54</td>
  </TR>
 <TR>
  <td CLASS="statText">qubits</td>
  <td CLASS="statText" ALIGN="right">754.84</td>
  <td CLASS="statText" ALIGN="right">22</td>
  </TR>
 <TR>
  <td CLASS="statText">pl31415</td>
  <td CLASS="statText" ALIGN="right">750.69</td>
  <td CLASS="statText" ALIGN="right">26</td>
  </TR>
 <TR>
  <td CLASS="statText">vulture</td>
  <td CLASS="statText" ALIGN="right">750.00</td>
  <td CLASS="statText" ALIGN="right">86</td>
  </TR>
 <TR>
  <td CLASS="statText">mathgodleo</td>
  <td CLASS="statText" ALIGN="right">742.89</td>
  <td CLASS="statText" ALIGN="right">52</td>
  </TR>
 <TR>
  <td CLASS="statText">KurtSteinkraus</td>
  <td CLASS="statText" ALIGN="right">733.67</td>
  <td CLASS="statText" ALIGN="right">42</td>
  </TR>
 <TR>
  <td CLASS="statText">radeye</td>
  <td CLASS="statText" ALIGN="right">732.58</td>
  <td CLASS="statText" ALIGN="right">6</td>
  </TR>
 <TR>
  <td CLASS="statText">uglyfool</td>
  <td CLASS="statText" ALIGN="right">728.21</td>
  <td CLASS="statText" ALIGN="right">24</td>
  </TR>
 <TR>
  <td CLASS="statText">b0b0b0b</td>
  <td CLASS="statText" ALIGN="right">720.00</td>
  <td CLASS="statText" ALIGN="right">126</td>
  </TR>
 <TR>
  <td CLASS="statText">sjelkjd</td>
  <td CLASS="statText" ALIGN="right">711.85</td>
  <td CLASS="statText" ALIGN="right">64</td>
  </TR>
 <TR>
  <td CLASS="statText">daveagp</td>
  <td CLASS="statText" ALIGN="right">710.76</td>
  <td CLASS="statText" ALIGN="right">40</td>
  </TR>
 <TR>
  <td CLASS="statText">doeth</td>
  <td CLASS="statText" ALIGN="right">710.05</td>
  <td CLASS="statText" ALIGN="right">10</td>
  </TR>
 <TR>
  <td CLASS="statText">Garzahd</td>
  <td CLASS="statText" ALIGN="right">709.11</td>
  <td CLASS="statText" ALIGN="right">76</td>
  </TR>
 <TR>
  <td CLASS="statText">jshute</td>
  <td CLASS="statText" ALIGN="right">704.30</td>
  <td CLASS="statText" ALIGN="right">120</td>
  </TR>
 <TR>
  <td CLASS="statText">madking</td>
  <td CLASS="statText" ALIGN="right">704.17</td>
  <td CLASS="statText" ALIGN="right">158</td>
  </TR>
 <TR>
  <td CLASS="statText">mlev</td>
  <td CLASS="statText" ALIGN="right">702.28</td>
  <td CLASS="statText" ALIGN="right">138</td>
  </TR>
 <TR>
  <td CLASS="statText">indigo9</td>
  <td CLASS="statText" ALIGN="right">702.08</td>
  <td CLASS="statText" ALIGN="right">116</td>
  </TR>
 <TR>
  <td CLASS="statText">shuvovse</td>
  <td CLASS="statText" ALIGN="right">701.80</td>
  <td CLASS="statText" ALIGN="right">106</td>
  </TR>
 <TR>
  <td CLASS="statText">mpb</td>
  <td CLASS="statText" ALIGN="right">701.07</td>
  <td CLASS="statText" ALIGN="right">256</td>
  </TR>
 <TR>
  <td CLASS="statText">billy</td>
  <td CLASS="statText" ALIGN="right">698.93</td>
  <td CLASS="statText" ALIGN="right">246</td>
  </TR>
 <TR>
  <td CLASS="statText">sundberg</td>
  <td CLASS="statText" ALIGN="right">697.69</td>
  <td CLASS="statText" ALIGN="right">90</td>
  </TR>
 <TR>
  <td CLASS="statText">Googly</td>
  <td CLASS="statText" ALIGN="right">697.18</td>
  <td CLASS="statText" ALIGN="right">96</td>
  </TR>
 <TR>
  <td CLASS="statText">leelin</td>
  <td CLASS="statText" ALIGN="right">695.25</td>
  <td CLASS="statText" ALIGN="right">398</td>
  </TR>
 <TR>
  <td CLASS="statText">Joe</td>
  <td CLASS="statText" ALIGN="right">692.95</td>
  <td CLASS="statText" ALIGN="right">38</td>
  </TR>
 <TR>
  <td CLASS="statText">stanf</td>
  <td CLASS="statText" ALIGN="right">691.05</td>
  <td CLASS="statText" ALIGN="right">44</td>
  </TR>
 <TR>
  <td CLASS="statText">Bender</td>
  <td CLASS="statText" ALIGN="right">690.89</td>
  <td CLASS="statText" ALIGN="right">222</td>
  </TR>
 <TR>
  <td CLASS="statText">DrewHudson</td>
  <td CLASS="statText" ALIGN="right">686.99</td>
  <td CLASS="statText" ALIGN="right">144</td>
  </TR>
 <TR>
  <td CLASS="statText">Yi Zhang</td>
  <td CLASS="statText" ALIGN="right">684.21</td>
  <td CLASS="statText" ALIGN="right">310</td>
  </TR>
 <TR>
  <td CLASS="statText">memetic</td>
  <td CLASS="statText" ALIGN="right">683.33</td>
  <td CLASS="statText" ALIGN="right">240</td>
  </TR>
 <TR>
  <td CLASS="statText">dukeola</td>
  <td CLASS="statText" ALIGN="right">680.81</td>
  <td CLASS="statText" ALIGN="right">304</td>
  </TR>
 <TR>
  <td CLASS="statText">Brian</td>
  <td CLASS="statText" ALIGN="right">676.69</td>
  <td CLASS="statText" ALIGN="right">30</td>
  </TR>
 <TR>
  <td CLASS="statText">tjq</td>
  <td CLASS="statText" ALIGN="right">676.46</td>
  <td CLASS="statText" ALIGN="right">148</td>
  </TR>
 <TR>
  <td CLASS="statText">kyotov</td>
  <td CLASS="statText" ALIGN="right">673.34</td>
  <td CLASS="statText" ALIGN="right">68</td>
  </TR>
 <TR>
  <td CLASS="statText">ShakeSpace</td>
  <td CLASS="statText" ALIGN="right">671.80</td>
  <td CLASS="statText" ALIGN="right">84</td>
  </TR>
 <TR>
  <td CLASS="statText">tangentz</td>
  <td CLASS="statText" ALIGN="right">670.75</td>
  <td CLASS="statText" ALIGN="right">486</td>
  </TR>
 <TR>
  <td CLASS="statText">paisa</td>
  <td CLASS="statText" ALIGN="right">667.30</td>
  <td CLASS="statText" ALIGN="right">58</td>
  </TR>
 <TR>
  <td CLASS="statText">koehrsen</td>
  <td CLASS="statText" ALIGN="right">666.43</td>
  <td CLASS="statText" ALIGN="right">270</td>
  </TR>
 <TR>
  <td CLASS="statText">nrogers</td>
  <td CLASS="statText" ALIGN="right">666.00</td>
  <td CLASS="statText" ALIGN="right">178</td>
  </TR>
 <TR>
  <td CLASS="statText">jap4524</td>
  <td CLASS="statText" ALIGN="right">665.24</td>
  <td CLASS="statText" ALIGN="right">104</td>
  </TR>
 <TR>
  <td CLASS="statText">mbarb</td>
  <td CLASS="statText" ALIGN="right">664.57</td>
  <td CLASS="statText" ALIGN="right">164</td>
  </TR>
 <TR>
  <td CLASS="statText">FunOrPain</td>
  <td CLASS="statText" ALIGN="right">664.28</td>
  <td CLASS="statText" ALIGN="right">228</td>
  </TR>
 <TR>
  <td CLASS="statText">Alexandre</td>
  <td CLASS="statText" ALIGN="right">663.25</td>
  <td CLASS="statText" ALIGN="right">32</td>
  </TR>
 <TR>
  <td CLASS="statText">Mr. Sketch</td>
  <td CLASS="statText" ALIGN="right">661.32</td>
  <td CLASS="statText" ALIGN="right">276</td>
  </TR>
 <TR>
  <td CLASS="statText">gmenhorn</td>
  <td CLASS="statText" ALIGN="right">661.26</td>
  <td CLASS="statText" ALIGN="right">318</td>
  </TR>
 <TR>
  <td CLASS="statText">ragnabot</td>
  <td CLASS="statText" ALIGN="right">660.36</td>
  <td CLASS="statText" ALIGN="right">98</td>
  </TR>
 <TR>
  <td CLASS="statText">JHui</td>
  <td CLASS="statText" ALIGN="right">659.29</td>
  <td CLASS="statText" ALIGN="right">408</td>
  </TR>
 <TR>
  <td CLASS="statText">assembler</td>
  <td CLASS="statText" ALIGN="right">657.49</td>
  <td CLASS="statText" ALIGN="right">94</td>
  </TR>
 <TR>
  <td CLASS="statText">xentar</td>
  <td CLASS="statText" ALIGN="right">656.50</td>
  <td CLASS="statText" ALIGN="right">168</td>
  </TR>
 <TR>
  <td CLASS="statText">mortijingle</td>
  <td CLASS="statText" ALIGN="right">655.27</td>
  <td CLASS="statText" ALIGN="right">464</td>
  </TR>
 <TR>
  <td CLASS="statText">mitalub</td>
  <td CLASS="statText" ALIGN="right">653.05</td>
  <td CLASS="statText" ALIGN="right">122</td>
  </TR>
 <TR>
  <td CLASS="statText">sandeepgupta</td>
  <td CLASS="statText" ALIGN="right">652.57</td>
  <td CLASS="statText" ALIGN="right">80</td>
  </TR>
 <TR>
  <td CLASS="statText">rbnn</td>
  <td CLASS="statText" ALIGN="right">652.40</td>
  <td CLASS="statText" ALIGN="right">162</td>
  </TR>
 <TR>
  <td CLASS="statText">turuthok</td>
  <td CLASS="statText" ALIGN="right">652.29</td>
  <td CLASS="statText" ALIGN="right">198</td>
  </TR>
 <TR>
  <td CLASS="statText">bokbok</td>
  <td CLASS="statText" ALIGN="right">651.45</td>
  <td CLASS="statText" ALIGN="right">292</td>
  </TR>
 <TR>
  <td CLASS="statText">jmarron</td>
  <td CLASS="statText" ALIGN="right">649.72</td>
  <td CLASS="statText" ALIGN="right">262</td>
  </TR>
 <TR>
  <td CLASS="statText">pmadden</td>
  <td CLASS="statText" ALIGN="right">645.55</td>
  <td CLASS="statText" ALIGN="right">452</td>
  </TR>
 <TR>
  <td CLASS="statText">hilfiger</td>
  <td CLASS="statText" ALIGN="right">645.25</td>
  <td CLASS="statText" ALIGN="right">298</td>
  </TR>
 <TR>
  <td CLASS="statText">rusi</td>
  <td CLASS="statText" ALIGN="right">642.03</td>
  <td CLASS="statText" ALIGN="right">214</td>
  </TR>
 <TR>
  <td CLASS="statText">Larry</td>
  <td CLASS="statText" ALIGN="right">638.40</td>
  <td CLASS="statText" ALIGN="right">130</td>
  </TR>
 <TR>
  <td CLASS="statText">Da Twink Daddy</td>
  <td CLASS="statText" ALIGN="right">638.34</td>
  <td CLASS="statText" ALIGN="right">170</td>
  </TR>
 <TR>
  <td CLASS="statText">kyky</td>
  <td CLASS="statText" ALIGN="right">637.97</td>
  <td CLASS="statText" ALIGN="right">134</td>
  </TR>
 <TR>
  <td CLASS="statText">emcee</td>
  <td CLASS="statText" ALIGN="right">637.43</td>
  <td CLASS="statText" ALIGN="right">204</td>
  </TR>
 <TR>
  <td CLASS="statText">leadhyena_inran</td>
  <td CLASS="statText" ALIGN="right">637.19</td>
  <td CLASS="statText" ALIGN="right">342</td>
  </TR>
 <TR>
  <td CLASS="statText">dana</td>
  <td CLASS="statText" ALIGN="right">636.77</td>
  <td CLASS="statText" ALIGN="right">156</td>
  </TR>
 <TR>
  <td CLASS="statText">sliu</td>
  <td CLASS="statText" ALIGN="right">636.03</td>
  <td CLASS="statText" ALIGN="right">186</td>
  </TR>
 <TR>
  <td CLASS="statText">gladius</td>
  <td CLASS="statText" ALIGN="right">634.44</td>
  <td CLASS="statText" ALIGN="right">224</td>
  </TR>
 <TR>
  <td CLASS="statText">cbthiess</td>
  <td CLASS="statText" ALIGN="right">633.84</td>
  <td CLASS="statText" ALIGN="right">152</td>
  </TR>
 <TR>
  <td CLASS="statText">BDouglass</td>
  <td CLASS="statText" ALIGN="right">629.78</td>
  <td CLASS="statText" ALIGN="right">238</td>
  </TR>
 <TR>
  <td CLASS="statText">qwj</td>
  <td CLASS="statText" ALIGN="right">627.79</td>
  <td CLASS="statText" ALIGN="right">70</td>
  </TR>
 <TR>
  <td CLASS="statText">Arremoon</td>
  <td CLASS="statText" ALIGN="right">626.10</td>
  <td CLASS="statText" ALIGN="right">254</td>
  </TR>
 <TR>
  <td CLASS="statText">marmaros</td>
  <td CLASS="statText" ALIGN="right">625.16</td>
  <td CLASS="statText" ALIGN="right">142</td>
  </TR>
 <TR>
  <td CLASS="statText">jemann75</td>
  <td CLASS="statText" ALIGN="right">623.63</td>
  <td CLASS="statText" ALIGN="right">232</td>
  </TR>
 <TR>
  <td CLASS="statText">BigDaddy</td>
  <td CLASS="statText" ALIGN="right">622.27</td>
  <td CLASS="statText" ALIGN="right">124</td>
  </TR>
 <TR>
  <td CLASS="statText">ZOOT</td>
  <td CLASS="statText" ALIGN="right">622.17</td>
  <td CLASS="statText" ALIGN="right">112</td>
  </TR>
 <TR>
  <td CLASS="statText">w280sax</td>
  <td CLASS="statText" ALIGN="right">621.16</td>
  <td CLASS="statText" ALIGN="right">436</td>
  </TR>
 <TR>
  <td CLASS="statText">lars</td>
  <td CLASS="statText" ALIGN="right">618.94</td>
  <td CLASS="statText" ALIGN="right">62</td>
  </TR>
 <TR>
  <td CLASS="statText">timurz</td>
  <td CLASS="statText" ALIGN="right">616.60</td>
  <td CLASS="statText" ALIGN="right">180</td>
  </TR>
 <TR>
  <td CLASS="statText">dislyxec</td>
  <td CLASS="statText" ALIGN="right">616.58</td>
  <td CLASS="statText" ALIGN="right">274</td>
  </TR>
 <TR>
  <td CLASS="statText">hilgart</td>
  <td CLASS="statText" ALIGN="right">614.89</td>
  <td CLASS="statText" ALIGN="right">250</td>
  </TR>
 <TR>
  <td CLASS="statText">puzzlehacker</td>
  <td CLASS="statText" ALIGN="right">614.18</td>
  <td CLASS="statText" ALIGN="right">300</td>
  </TR>
 <TR>
  <td CLASS="statText">kolanovic</td>
  <td CLASS="statText" ALIGN="right">613.16</td>
  <td CLASS="statText" ALIGN="right">234</td>
  </TR>
 <TR>
  <td CLASS="statText">sosonel</td>
  <td CLASS="statText" ALIGN="right">607.04</td>
  <td CLASS="statText" ALIGN="right">248</td>
  </TR>
 <TR>
  <td CLASS="statText">alanm</td>
  <td CLASS="statText" ALIGN="right">605.06</td>
  <td CLASS="statText" ALIGN="right">200</td>
  </TR>
 <TR>
  <td CLASS="statText">BanjoBill</td>
  <td CLASS="statText" ALIGN="right">598.72</td>
  <td CLASS="statText" ALIGN="right">258</td>
  </TR>
 <TR>
  <td CLASS="statText">Annie29</td>
  <td CLASS="statText" ALIGN="right">596.45</td>
  <td CLASS="statText" ALIGN="right">426</td>
  </TR>
 <TR>
  <td CLASS="statText">slowjoe</td>
  <td CLASS="statText" ALIGN="right">596.18</td>
  <td CLASS="statText" ALIGN="right">672</td>
  </TR>
 <TR>
  <td CLASS="statText">ender_wiggin</td>
  <td CLASS="statText" ALIGN="right">591.92</td>
  <td CLASS="statText" ALIGN="right">458</td>
  </TR>
 <TR>
  <td CLASS="statText">jerschneid</td>
  <td CLASS="statText" ALIGN="right">591.19</td>
  <td CLASS="statText" ALIGN="right">402</td>
  </TR>
 <TR>
  <td CLASS="statText">dpecora</td>
  <td CLASS="statText" ALIGN="right">590.73</td>
  <td CLASS="statText" ALIGN="right">46</td>
  </TR>
 <TR>
  <td CLASS="statText">eattrig</td>
  <td CLASS="statText" ALIGN="right">585.24</td>
  <td CLASS="statText" ALIGN="right">282</td>
  </TR>
 <TR>
  <td CLASS="statText">keesoo</td>
  <td CLASS="statText" ALIGN="right">584.22</td>
  <td CLASS="statText" ALIGN="right">920</td>
  </TR>
 <TR>
  <td CLASS="statText">Lawrence444</td>
  <td CLASS="statText" ALIGN="right">576.54</td>
  <td CLASS="statText" ALIGN="right">188</td>
  </TR>
 <TR>
  <td CLASS="statText">SilverBoy33</td>
  <td CLASS="statText" ALIGN="right">575.47</td>
  <td CLASS="statText" ALIGN="right">476</td>
  </TR>
 <TR>
  <td CLASS="statText">Symme7ry</td>
  <td CLASS="statText" ALIGN="right">574.49</td>
  <td CLASS="statText" ALIGN="right">302</td>
  </TR>
 <TR>
  <td CLASS="statText">Gold Rider</td>
  <td CLASS="statText" ALIGN="right">573.47</td>
  <td CLASS="statText" ALIGN="right">466</td>
  </TR>
 <TR>
  <td CLASS="statText">Antilochus</td>
  <td CLASS="statText" ALIGN="right">571.27</td>
  <td CLASS="statText" ALIGN="right">346</td>
  </TR>
 <TR>
  <td CLASS="statText">maumoondoggie</td>
  <td CLASS="statText" ALIGN="right">570.99</td>
  <td CLASS="statText" ALIGN="right">396</td>
  </TR>
 <TR>
  <td CLASS="statText">mike0625</td>
  <td CLASS="statText" ALIGN="right">570.90</td>
  <td CLASS="statText" ALIGN="right">430</td>
  </TR>
 <TR>
  <td CLASS="statText">olted</td>
  <td CLASS="statText" ALIGN="right">567.74</td>
  <td CLASS="statText" ALIGN="right">114</td>
  </TR>
 <TR>
  <td CLASS="statText">anan</td>
  <td CLASS="statText" ALIGN="right">566.01</td>
  <td CLASS="statText" ALIGN="right">362</td>
  </TR>
 <TR>
  <td CLASS="statText">toast</td>
  <td CLASS="statText" ALIGN="right">564.50</td>
  <td CLASS="statText" ALIGN="right">92</td>
  </TR>
 <TR>
  <td CLASS="statText">greyhound</td>
  <td CLASS="statText" ALIGN="right">563.18</td>
  <td CLASS="statText" ALIGN="right">88</td>
  </TR>
 <TR>
  <td CLASS="statText">tavib</td>
  <td CLASS="statText" ALIGN="right">561.79</td>
  <td CLASS="statText" ALIGN="right">314</td>
  </TR>
 <TR>
  <td CLASS="statText">jerm</td>
  <td CLASS="statText" ALIGN="right">558.81</td>
  <td CLASS="statText" ALIGN="right">184</td>
  </TR>
 <TR>
  <td CLASS="statText">palenica</td>
  <td CLASS="statText" ALIGN="right">558.38</td>
  <td CLASS="statText" ALIGN="right">82</td>
  </TR>
 <TR>
  <td CLASS="statText">outing</td>
  <td CLASS="statText" ALIGN="right">553.29</td>
  <td CLASS="statText" ALIGN="right">534</td>
  </TR>
 <TR>
  <td CLASS="statText">ps31</td>
  <td CLASS="statText" ALIGN="right">549.24</td>
  <td CLASS="statText" ALIGN="right">496</td>
  </TR>
 <TR>
  <td CLASS="statText">jonboy</td>
  <td CLASS="statText" ALIGN="right">548.75</td>
  <td CLASS="statText" ALIGN="right">524</td>
  </TR>
 <TR>
  <td CLASS="statText">irulet</td>
  <td CLASS="statText" ALIGN="right">545.66</td>
  <td CLASS="statText" ALIGN="right">564</td>
  </TR>
 <TR>
  <td CLASS="statText">Pops</td>
  <td CLASS="statText" ALIGN="right">545.15</td>
  <td CLASS="statText" ALIGN="right">280</td>
  </TR>
 <TR>
  <td CLASS="statText">CodeWizard</td>
  <td CLASS="statText" ALIGN="right">544.50</td>
  <td CLASS="statText" ALIGN="right">536</td>
  </TR>
 <TR>
  <td CLASS="statText">JustinJM</td>
  <td CLASS="statText" ALIGN="right">540.20</td>
  <td CLASS="statText" ALIGN="right">682</td>
  </TR>
 <TR>
  <td CLASS="statText">Wombat80</td>
  <td CLASS="statText" ALIGN="right">539.94</td>
  <td CLASS="statText" ALIGN="right">592</td>
  </TR>
 <TR>
  <td CLASS="statText">amorosov</td>
  <td CLASS="statText" ALIGN="right">539.85</td>
  <td CLASS="statText" ALIGN="right">322</td>
  </TR>
 <TR>
  <td CLASS="statText">cperkins</td>
  <td CLASS="statText" ALIGN="right">539.78</td>
  <td CLASS="statText" ALIGN="right">568</td>
  </TR>
 <TR>
  <td CLASS="statText">maxx</td>
  <td CLASS="statText" ALIGN="right">539.40</td>
  <td CLASS="statText" ALIGN="right">194</td>
  </TR>
 <TR>
  <td CLASS="statText">vv</td>
  <td CLASS="statText" ALIGN="right">538.11</td>
  <td CLASS="statText" ALIGN="right">360</td>
  </TR>
 <TR>
  <td CLASS="statText">ValD</td>
  <td CLASS="statText" ALIGN="right">536.06</td>
  <td CLASS="statText" ALIGN="right">196</td>
  </TR>
 <TR>
  <td CLASS="statText">cintamani</td>
  <td CLASS="statText" ALIGN="right">532.90</td>
  <td CLASS="statText" ALIGN="right">600</td>
  </TR>
 <TR>
  <td CLASS="statText">NeoTuri</td>
  <td CLASS="statText" ALIGN="right">531.34</td>
  <td CLASS="statText" ALIGN="right">578</td>
  </TR>
 <TR>
  <td CLASS="statText">Banzif</td>
  <td CLASS="statText" ALIGN="right">528.33</td>
  <td CLASS="statText" ALIGN="right">506</td>
  </TR>
 <TR>
  <td CLASS="statText">huntergt</td>
  <td CLASS="statText" ALIGN="right">527.26</td>
  <td CLASS="statText" ALIGN="right">434</td>
  </TR>
 <TR>
  <td CLASS="statText">flozell</td>
  <td CLASS="statText" ALIGN="right">527.25</td>
  <td CLASS="statText" ALIGN="right">528</td>
  </TR>
 <TR>
  <td CLASS="statText">Min,lu</td>
  <td CLASS="statText" ALIGN="right">527.04</td>
  <td CLASS="statText" ALIGN="right">388</td>
  </TR>
 <TR>
  <td CLASS="statText">bkus</td>
  <td CLASS="statText" ALIGN="right">526.79</td>
  <td CLASS="statText" ALIGN="right">660</td>
  </TR>
 <TR>
  <td CLASS="statText">imfurry</td>
  <td CLASS="statText" ALIGN="right">523.35</td>
  <td CLASS="statText" ALIGN="right">704</td>
  </TR>
 <TR>
  <td CLASS="statText">magead7</td>
  <td CLASS="statText" ALIGN="right">515.59</td>
  <td CLASS="statText" ALIGN="right">160</td>
  </TR>
 <TR>
  <td CLASS="statText">Orbus</td>
  <td CLASS="statText" ALIGN="right">515.02</td>
  <td CLASS="statText" ALIGN="right">312</td>
  </TR>
 <TR>
  <td CLASS="statText">Baldrick</td>
  <td CLASS="statText" ALIGN="right">512.69</td>
  <td CLASS="statText" ALIGN="right">636</td>
  </TR>
 <TR>
  <td CLASS="statText">theoddone33</td>
  <td CLASS="statText" ALIGN="right">512.03</td>
  <td CLASS="statText" ALIGN="right">368</td>
  </TR>
 <TR>
  <td CLASS="statText">axchma</td>
  <td CLASS="statText" ALIGN="right">501.36</td>
  <td CLASS="statText" ALIGN="right">236</td>
  </TR>
 <TR>
  <td CLASS="statText">pozdol</td>
  <td CLASS="statText" ALIGN="right">501.12</td>
  <td CLASS="statText" ALIGN="right">242</td>
  </TR>
 <TR>
  <td CLASS="statText">Marvin</td>
  <td CLASS="statText" ALIGN="right">500.29</td>
  <td CLASS="statText" ALIGN="right">410</td>
  </TR>
 <TR>
  <td CLASS="statText">BitConductor</td>
  <td CLASS="statText" ALIGN="right">499.65</td>
  <td CLASS="statText" ALIGN="right">400</td>
  </TR>
 <TR>
  <td CLASS="statText">z-man</td>
  <td CLASS="statText" ALIGN="right">499.38</td>
  <td CLASS="statText" ALIGN="right">244</td>
  </TR>
 <TR>
  <td CLASS="statText">Radgast</td>
  <td CLASS="statText" ALIGN="right">495.63</td>
  <td CLASS="statText" ALIGN="right">386</td>
  </TR>
 <TR>
  <td CLASS="statText">po</td>
  <td CLASS="statText" ALIGN="right">490.02</td>
  <td CLASS="statText" ALIGN="right">28</td>
  </TR>
 <TR>
  <td CLASS="statText">mickle</td>
  <td CLASS="statText" ALIGN="right">489.01</td>
  <td CLASS="statText" ALIGN="right">288</td>
  </TR>
 <TR>
  <td CLASS="statText">FrodoB</td>
  <td CLASS="statText" ALIGN="right">488.97</td>
  <td CLASS="statText" ALIGN="right">394</td>
  </TR>
 <TR>
  <td CLASS="statText">ajuckel</td>
  <td CLASS="statText" ALIGN="right">485.44</td>
  <td CLASS="statText" ALIGN="right">726</td>
  </TR>
 <TR>
  <td CLASS="statText">AleaActaEst</td>
  <td CLASS="statText" ALIGN="right">479.79</td>
  <td CLASS="statText" ALIGN="right">590</td>
  </TR>
 <TR>
  <td CLASS="statText">Corrinado</td>
  <td CLASS="statText" ALIGN="right">478.82</td>
  <td CLASS="statText" ALIGN="right">284</td>
  </TR>
 <TR>
  <td CLASS="statText">ccooper</td>
  <td CLASS="statText" ALIGN="right">475.18</td>
  <td CLASS="statText" ALIGN="right">364</td>
  </TR>
 <TR>
  <td CLASS="statText">ddwsdl</td>
  <td CLASS="statText" ALIGN="right">473.93</td>
  <td CLASS="statText" ALIGN="right">370</td>
  </TR>
 <TR>
  <td CLASS="statText">Sharakan</td>
  <td CLASS="statText" ALIGN="right">470.54</td>
  <td CLASS="statText" ALIGN="right">556</td>
  </TR>
 <TR>
  <td CLASS="statText">rschutt</td>
  <td CLASS="statText" ALIGN="right">469.31</td>
  <td CLASS="statText" ALIGN="right">494</td>
  </TR>
 <TR>
  <td CLASS="statText">Alonzo1980</td>
  <td CLASS="statText" ALIGN="right">467.87</td>
  <td CLASS="statText" ALIGN="right">102</td>
  </TR>
 <TR>
  <td CLASS="statText">Belzedar</td>
  <td CLASS="statText" ALIGN="right">466.82</td>
  <td CLASS="statText" ALIGN="right">330</td>
  </TR>
 <TR>
  <td CLASS="statText">y</td>
  <td CLASS="statText" ALIGN="right">453.94</td>
  <td CLASS="statText" ALIGN="right">320</td>
  </TR>
 <TR>
  <td CLASS="statText">flip_da_bits</td>
  <td CLASS="statText" ALIGN="right">451.75</td>
  <td CLASS="statText" ALIGN="right">374</td>
  </TR>
 <TR>
  <td CLASS="statText">honda89dude</td>
  <td CLASS="statText" ALIGN="right">451.40</td>
  <td CLASS="statText" ALIGN="right">676</td>
  </TR>
 <TR>
  <td CLASS="statText">dcros</td>
  <td CLASS="statText" ALIGN="right">451.15</td>
  <td CLASS="statText" ALIGN="right">350</td>
  </TR>
 <TR>
  <td CLASS="statText">Saradin</td>
  <td CLASS="statText" ALIGN="right">448.39</td>
  <td CLASS="statText" ALIGN="right">442</td>
  </TR>
 <TR>
  <td CLASS="statText">whorn</td>
  <td CLASS="statText" ALIGN="right">448.34</td>
  <td CLASS="statText" ALIGN="right">868</td>
  </TR>
 <TR>
  <td CLASS="statText">darkmanjs</td>
  <td CLASS="statText" ALIGN="right">443.80</td>
  <td CLASS="statText" ALIGN="right">504</td>
  </TR>
 <TR>
  <td CLASS="statText">objects</td>
  <td CLASS="statText" ALIGN="right">439.99</td>
  <td CLASS="statText" ALIGN="right">286</td>
  </TR>
 <TR>
  <td CLASS="statText">StrIkeR_MaN</td>
  <td CLASS="statText" ALIGN="right">436.93</td>
  <td CLASS="statText" ALIGN="right">776</td>
  </TR>
 <TR>
  <td CLASS="statText">RobertNix</td>
  <td CLASS="statText" ALIGN="right">427.61</td>
  <td CLASS="statText" ALIGN="right">448</td>
  </TR>
 <TR>
  <td CLASS="statText">jwaugh</td>
  <td CLASS="statText" ALIGN="right">421.93</td>
  <td CLASS="statText" ALIGN="right">500</td>
  </TR>
 <TR>
  <td CLASS="statText">argolite</td>
  <td CLASS="statText" ALIGN="right">416.96</td>
  <td CLASS="statText" ALIGN="right">610</td>
  </TR>
 <TR>
  <td CLASS="statText">hevilt</td>
  <td CLASS="statText" ALIGN="right">416.41</td>
  <td CLASS="statText" ALIGN="right">166</td>
  </TR>
 <TR>
  <td CLASS="statText">chip33550336</td>
  <td CLASS="statText" ALIGN="right">416.30</td>
  <td CLASS="statText" ALIGN="right">798</td>
  </TR>
 <TR>
  <td CLASS="statText">tdavis34</td>
  <td CLASS="statText" ALIGN="right">415.92</td>
  <td CLASS="statText" ALIGN="right">468</td>
  </TR>
 <TR>
  <td CLASS="statText">NeutralParity</td>
  <td CLASS="statText" ALIGN="right">414.68</td>
  <td CLASS="statText" ALIGN="right">326</td>
  </TR>
 <TR>
  <td CLASS="statText">fenrir28</td>
  <td CLASS="statText" ALIGN="right">413.46</td>
  <td CLASS="statText" ALIGN="right">550</td>
  </TR>
 <TR>
  <td CLASS="statText">ThinMan</td>
  <td CLASS="statText" ALIGN="right">411.80</td>
  <td CLASS="statText" ALIGN="right">220</td>
  </TR>
 <TR>
  <td CLASS="statText">Austinite</td>
  <td CLASS="statText" ALIGN="right">411.17</td>
  <td CLASS="statText" ALIGN="right">460</td>
  </TR>
 <TR>
  <td CLASS="statText">queuey</td>
  <td CLASS="statText" ALIGN="right">398.70</td>
  <td CLASS="statText" ALIGN="right">804</td>
  </TR>
 <TR>
  <td CLASS="statText">mc^2</td>
  <td CLASS="statText" ALIGN="right">394.75</td>
  <td CLASS="statText" ALIGN="right">748</td>
  </TR>
 <TR>
  <td CLASS="statText">helloworldX</td>
  <td CLASS="statText" ALIGN="right">393.54</td>
  <td CLASS="statText" ALIGN="right">678</td>
  </TR>
 <TR>
  <td CLASS="statText">fkim</td>
  <td CLASS="statText" ALIGN="right">391.81</td>
  <td CLASS="statText" ALIGN="right">552</td>
  </TR>
 <TR>
  <td CLASS="statText">rashok</td>
  <td CLASS="statText" ALIGN="right">379.88</td>
  <td CLASS="statText" ALIGN="right">78</td>
  </TR>
 <TR>
  <td CLASS="statText">boydp</td>
  <td CLASS="statText" ALIGN="right">371.21</td>
  <td CLASS="statText" ALIGN="right">192</td>
  </TR>
 <TR>
  <td CLASS="statText">olegh</td>
  <td CLASS="statText" ALIGN="right">355.57</td>
  <td CLASS="statText" ALIGN="right">542</td>
  </TR>
 <TR>
  <td CLASS="statText">huazai</td>
  <td CLASS="statText" ALIGN="right">354.53</td>
  <td CLASS="statText" ALIGN="right">272</td>
  </TR>
 <TR>
  <td CLASS="statText">vesko8</td>
  <td CLASS="statText" ALIGN="right">348.53</td>
  <td CLASS="statText" ALIGN="right">780</td>
  </TR>
 <TR>
  <td CLASS="statText">kdale013</td>
  <td CLASS="statText" ALIGN="right">339.10</td>
  <td CLASS="statText" ALIGN="right">708</td>
  </TR>
 <TR>
  <td CLASS="statText">FogleBird</td>
  <td CLASS="statText" ALIGN="right">329.14</td>
  <td CLASS="statText" ALIGN="right">332</td>
  </TR>
 <TR>
  <td CLASS="statText">Jumping John</td>
  <td CLASS="statText" ALIGN="right">324.86</td>
  <td CLASS="statText" ALIGN="right">118</td>
  </TR>
 <TR>
  <td CLASS="statText">CrazyPenguin</td>
  <td CLASS="statText" ALIGN="right">315.77</td>
  <td CLASS="statText" ALIGN="right">620</td>
  </TR>
 <TR>
  <td CLASS="statText">georgewsu</td>
  <td CLASS="statText" ALIGN="right">309.96</td>
  <td CLASS="statText" ALIGN="right">622</td>
  </TR>
 <TR>
  <td CLASS="statText">ttsuchi</td>
  <td CLASS="statText" ALIGN="right">299.27</td>
  <td CLASS="statText" ALIGN="right">540</td>
  </TR>
 <TR>
  <td CLASS="statText">VelvetNight</td>
  <td CLASS="statText" ALIGN="right">289.13</td>
  <td CLASS="statText" ALIGN="right">596</td>
  </TR>
 <TR>
  <td CLASS="statText">sh_maestro</td>
  <td CLASS="statText" ALIGN="right">286.91</td>
  <td CLASS="statText" ALIGN="right">538</td>
  </TR>
 <TR>
  <td CLASS="statText">anniehuang</td>
  <td CLASS="statText" ALIGN="right">281.12</td>
  <td CLASS="statText" ALIGN="right">422</td>
  </TR>
 <TR>
  <td CLASS="statText">maxjenius</td>
  <td CLASS="statText" ALIGN="right">272.32</td>
  <td CLASS="statText" ALIGN="right">340</td>
  </TR>
 <TR>
  <td CLASS="statText">jdepree</td>
  <td CLASS="statText" ALIGN="right">272.08</td>
  <td CLASS="statText" ALIGN="right">480</td>
  </TR>
 <TR>
  <td CLASS="statText">Fingers</td>
  <td CLASS="statText" ALIGN="right">258.27</td>
  <td CLASS="statText" ALIGN="right">822</td>
  </TR>
 <TR>
  <td CLASS="statText">tralfamadore_w</td>
  <td CLASS="statText" ALIGN="right">257.85</td>
  <td CLASS="statText" ALIGN="right">482</td>
  </TR>
 <TR>
  <td CLASS="statText">Mysid</td>
  <td CLASS="statText" ALIGN="right">251.77</td>
  <td CLASS="statText" ALIGN="right">746</td>
  </TR>
 <TR>
  <td CLASS="statText">Olorin</td>
  <td CLASS="statText" ALIGN="right">251.13</td>
  <td CLASS="statText" ALIGN="right">358</td>
  </TR>
 <TR>
  <td CLASS="statText">claw</td>
  <td CLASS="statText" ALIGN="right">250.61</td>
  <td CLASS="statText" ALIGN="right">140</td>
  </TR>
 <TR>
  <td CLASS="statText">darkphantom</td>
  <td CLASS="statText" ALIGN="right">248.29</td>
  <td CLASS="statText" ALIGN="right">742</td>
  </TR>
 <TR>
  <td CLASS="statText">tiki</td>
  <td CLASS="statText" ALIGN="right">247.95</td>
  <td CLASS="statText" ALIGN="right">558</td>
  </TR>
 <TR>
  <td CLASS="statText">TimStevens</td>
  <td CLASS="statText" ALIGN="right">245.95</td>
  <td CLASS="statText" ALIGN="right">654</td>
  </TR>
 <TR>
  <td CLASS="statText">stupefaction</td>
  <td CLASS="statText" ALIGN="right">244.87</td>
  <td CLASS="statText" ALIGN="right">724</td>
  </TR>
 <TR>
  <td CLASS="statText">koder</td>
  <td CLASS="statText" ALIGN="right">242.17</td>
  <td CLASS="statText" ALIGN="right">512</td>
  </TR>
 <TR>
  <td CLASS="statText">myiope</td>
  <td CLASS="statText" ALIGN="right">241.68</td>
  <td CLASS="statText" ALIGN="right">716</td>
  </TR>
 <TR>
  <td CLASS="statText">mpa</td>
  <td CLASS="statText" ALIGN="right">241.55</td>
  <td CLASS="statText" ALIGN="right">438</td>
  </TR>
 <TR>
  <td CLASS="statText">ChuBerto</td>
  <td CLASS="statText" ALIGN="right">239.23</td>
  <td CLASS="statText" ALIGN="right">574</td>
  </TR>
 <TR>
  <td CLASS="statText">adxm</td>
  <td CLASS="statText" ALIGN="right">237.33</td>
  <td CLASS="statText" ALIGN="right">418</td>
  </TR>
 <TR>
  <td CLASS="statText">Sleeve</td>
  <td CLASS="statText" ALIGN="right">235.94</td>
  <td CLASS="statText" ALIGN="right">586</td>
  </TR>
 <TR>
  <td CLASS="statText">tuc77</td>
  <td CLASS="statText" ALIGN="right">234.52</td>
  <td CLASS="statText" ALIGN="right">750</td>
  </TR>
 <TR>
  <td CLASS="statText">danno</td>
  <td CLASS="statText" ALIGN="right">234.37</td>
  <td CLASS="statText" ALIGN="right">338</td>
  </TR>
 <TR>
  <td CLASS="statText">[ucf]entity</td>
  <td CLASS="statText" ALIGN="right">233.34</td>
  <td CLASS="statText" ALIGN="right">334</td>
  </TR>
 <TR>
  <td CLASS="statText">Liguo</td>
  <td CLASS="statText" ALIGN="right">228.75</td>
  <td CLASS="statText" ALIGN="right">576</td>
  </TR>
 <TR>
  <td CLASS="statText">jcg3</td>
  <td CLASS="statText" ALIGN="right">225.25</td>
  <td CLASS="statText" ALIGN="right">684</td>
  </TR>
 <TR>
  <td CLASS="statText">benny</td>
  <td CLASS="statText" ALIGN="right">222.12</td>
  <td CLASS="statText" ALIGN="right">352</td>
  </TR>
 <TR>
  <td CLASS="statText">gray_nick</td>
  <td CLASS="statText" ALIGN="right">216.09</td>
  <td CLASS="statText" ALIGN="right">838</td>
  </TR>
 <TR>
  <td CLASS="statText">pushplay</td>
  <td CLASS="statText" ALIGN="right">212.18</td>
  <td CLASS="statText" ALIGN="right">762</td>
  </TR>
 <TR>
  <td CLASS="statText">nadler</td>
  <td CLASS="statText" ALIGN="right">209.62</td>
  <td CLASS="statText" ALIGN="right">548</td>
  </TR>
 <TR>
  <td CLASS="statText">reymano</td>
  <td CLASS="statText" ALIGN="right">208.38</td>
  <td CLASS="statText" ALIGN="right">594</td>
  </TR>
 <TR>
  <td CLASS="statText">niceCode</td>
  <td CLASS="statText" ALIGN="right">207.95</td>
  <td CLASS="statText" ALIGN="right">416</td>
  </TR>
 <TR>
  <td CLASS="statText">crackpot</td>
  <td CLASS="statText" ALIGN="right">206.37</td>
  <td CLASS="statText" ALIGN="right">794</td>
  </TR>
 <TR>
  <td CLASS="statText">amatus</td>
  <td CLASS="statText" ALIGN="right">203.47</td>
  <td CLASS="statText" ALIGN="right">382</td>
  </TR>
 <TR>
  <td CLASS="statText">Knite</td>
  <td CLASS="statText" ALIGN="right">203.37</td>
  <td CLASS="statText" ALIGN="right">846</td>
  </TR>
 <TR>
  <td CLASS="statText">kasper</td>
  <td CLASS="statText" ALIGN="right">202.05</td>
  <td CLASS="statText" ALIGN="right">526</td>
  </TR>
 <TR>
  <td CLASS="statText">vigenere</td>
  <td CLASS="statText" ALIGN="right">197.28</td>
  <td CLASS="statText" ALIGN="right">690</td>
  </TR>
 <TR>
  <td CLASS="statText">nikita</td>
  <td CLASS="statText" ALIGN="right">194.97</td>
  <td CLASS="statText" ALIGN="right">658</td>
  </TR>
 <TR>
  <td CLASS="statText">FatAlbert</td>
  <td CLASS="statText" ALIGN="right">193.54</td>
  <td CLASS="statText" ALIGN="right">692</td>
  </TR>
 <TR>
  <td CLASS="statText">Catalepsy</td>
  <td CLASS="statText" ALIGN="right">191.32</td>
  <td CLASS="statText" ALIGN="right">706</td>
  </TR>
 <TR>
  <td CLASS="statText">Hevelius</td>
  <td CLASS="statText" ALIGN="right">191.06</td>
  <td CLASS="statText" ALIGN="right">770</td>
  </TR>
 <TR>
  <td CLASS="statText">simplesure</td>
  <td CLASS="statText" ALIGN="right">189.50</td>
  <td CLASS="statText" ALIGN="right">840</td>
  </TR>
 <TR>
  <td CLASS="statText">gmoney7</td>
  <td CLASS="statText" ALIGN="right">186.80</td>
  <td CLASS="statText" ALIGN="right">844</td>
  </TR>
 <TR>
  <td CLASS="statText">raksu</td>
  <td CLASS="statText" ALIGN="right">183.61</td>
  <td CLASS="statText" ALIGN="right">864</td>
  </TR>
 <TR>
  <td CLASS="statText">bcurren</td>
  <td CLASS="statText" ALIGN="right">183.61</td>
  <td CLASS="statText" ALIGN="right">602</td>
  </TR>
 <TR>
  <td CLASS="statText">gettext</td>
  <td CLASS="statText" ALIGN="right">183.21</td>
  <td CLASS="statText" ALIGN="right">842</td>
  </TR>
 <TR>
  <td CLASS="statText">Callamon</td>
  <td CLASS="statText" ALIGN="right">182.96</td>
  <td CLASS="statText" ALIGN="right">618</td>
  </TR>
 <TR>
  <td CLASS="statText">snapper</td>
  <td CLASS="statText" ALIGN="right">182.57</td>
  <td CLASS="statText" ALIGN="right">814</td>
  </TR>
 <TR>
  <td CLASS="statText">LeppyR64</td>
  <td CLASS="statText" ALIGN="right">179.11</td>
  <td CLASS="statText" ALIGN="right">892</td>
  </TR>
 <TR>
  <td CLASS="statText">sony</td>
  <td CLASS="statText" ALIGN="right">178.72</td>
  <td CLASS="statText" ALIGN="right">756</td>
  </TR>
 <TR>
  <td CLASS="statText">taxi</td>
  <td CLASS="statText" ALIGN="right">178.35</td>
  <td CLASS="statText" ALIGN="right">488</td>
  </TR>
 <TR>
  <td CLASS="statText">pearl</td>
  <td CLASS="statText" ALIGN="right">178.13</td>
  <td CLASS="statText" ALIGN="right">354</td>
  </TR>
 <TR>
  <td CLASS="statText">Holgrave</td>
  <td CLASS="statText" ALIGN="right">172.85</td>
  <td CLASS="statText" ALIGN="right">502</td>
  </TR>
 <TR>
  <td CLASS="statText">edragon</td>
  <td CLASS="statText" ALIGN="right">171.05</td>
  <td CLASS="statText" ALIGN="right">616</td>
  </TR>
 <TR>
  <td CLASS="statText">telars</td>
  <td CLASS="statText" ALIGN="right">169.04</td>
  <td CLASS="statText" ALIGN="right">644</td>
  </TR>
 <TR>
  <td CLASS="statText">lx</td>
  <td CLASS="statText" ALIGN="right">168.52</td>
  <td CLASS="statText" ALIGN="right">830</td>
  </TR>
 <TR>
  <td CLASS="statText">Spike</td>
  <td CLASS="statText" ALIGN="right">168.09</td>
  <td CLASS="statText" ALIGN="right">520</td>
  </TR>
 <TR>
  <td CLASS="statText">mrdad2u</td>
  <td CLASS="statText" ALIGN="right">167.90</td>
  <td CLASS="statText" ALIGN="right">566</td>
  </TR>
 <TR>
  <td CLASS="statText">rsrinivasan77</td>
  <td CLASS="statText" ALIGN="right">166.79</td>
  <td CLASS="statText" ALIGN="right">886</td>
  </TR>
 <TR>
  <td CLASS="statText">gaul</td>
  <td CLASS="statText" ALIGN="right">165.51</td>
  <td CLASS="statText" ALIGN="right">456</td>
  </TR>
 <TR>
  <td CLASS="statText">blowfish</td>
  <td CLASS="statText" ALIGN="right">158.58</td>
  <td CLASS="statText" ALIGN="right">632</td>
  </TR>						
					</TABLE><BR/>
				    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="1">
                        <TR><TD VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif">&#160;&#160;<A HREF="#top" CLASS="statText">Back to top</A></TD></TR>
                    </TABLE>
                    
          <P><BR/></P>
    </TD>
    <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
  </TR>
  <TR>
    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
  </TR>     
  <TR>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="14"><IMG SRC="/i/table_mid_left2x.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" BGCOLOR="#000033" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>  
  <TR>
    <TD VALIGN="top" BACKGROUND="" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
    <TD VALIGN="top" BACKGROUND="" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
  </TR>
      </TABLE>
    </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->
            <!-- Gutter -->
            <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
            <!-- Right Column Begins -->
            <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
              <!-- Right Column Include Begins --> 
              <xsl:call-template name="public_right_col"/>       
              <!-- Right Column Include Ends -->        
            </TD>
            <!-- Right Column Ends -->
            <!-- Gutter -->
            <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
            <!-- Gutter Ends -->
          </TR>
        </TABLE>
        <!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

