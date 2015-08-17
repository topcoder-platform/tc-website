<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<link type="text/css" rel="stylesheet" class="bodyText_link" href="/css/google04.css"/>
<title>Google Code Jam 2004, Powered by TopCoder</title>
<jsp:include page="../script.jsp" />
</head>
<body>


<table border=0 width=100% cellpadding=0 cellspacing=0>
	<tr>
		<td width="49%">&#160;</td>
		<td align=center>
			<table border=0 width=100% cellpadding=0 cellspacing=0>
				<tr>
					<td width="49%"></td>
					<td valign=bottom align=center><img border=0 src="/i/events/google2004/codejamLogo.gif" alt="Google Code Jam logo"></td>
					<td width="49%"></td>
				</tr>
			</table>
		</td>
		<td width="49%"></td>
	</tr>
	<tr>
		<td width="49%">&#160;</td>
		<td>
			<div class=greenBigBox>

			<!-- Tab bar links-->
			<div align=center>
			<jsp:include page="links.jsp" >
			<jsp:param name="selectedTab" value="advancers"/>
			</jsp:include>
			</div>

			<br/><br/>

			<span class=bigTitle>Advancers</span>
			<span valign=top>
			<jsp:include page="right.jsp" />
			</span>

			<br/><br/>

			<table class=tableFrame cellpadding=5 cellspacing=2 border=0 width="400">
			<tr>
			<td class=advancersTitle colspan=3>Qualification Round</td>
			</tr>
			<tr>
			<td class=advancersRound width="30%">Handle</td>
			<td class=advancersRound width="40%">Problem Set</td>
			<td class=advancersRound width="30%" align="right">Score</td>
			</tr>

<tr class=sidebarText><td>rotoZOOM</td><td>Problem Sets 1 and 7</td><td align="right">1206.68</td></tr>
<tr class=sidebarText><td>LiMing</td><td>Problem Sets 1 and 7</td><td align="right">1202.41</td></tr>
<tr class=sidebarText><td>antimatter</td><td>Problem Sets 1 and 7</td><td align="right">1172.38</td></tr>
<tr class=sidebarText><td>achurch</td><td>Problem Sets 1 and 7</td><td align="right">1051.72</td></tr>
<tr class=sidebarText><td>Ryan</td><td>Problem Sets 1 and 7</td><td align="right">1043.76</td></tr>
<tr class=sidebarText><td>tjq</td><td>Problem Sets 1 and 7</td><td align="right">1041.81</td></tr>
<tr class=sidebarText><td>cnettel</td><td>Problem Sets 1 and 7</td><td align="right">1012.67</td></tr>
<tr class=sidebarText><td>Vulpecular</td><td>Problem Sets 1 and 7</td><td align="right">1007.69</td></tr>
<tr class=sidebarText><td>venco</td><td>Problem Sets 1 and 7</td><td align="right">998.90</td></tr>
<tr class=sidebarText><td>texel</td><td>Problem Sets 1 and 7</td><td align="right">967.14</td></tr>
<tr class=sidebarText><td>kedaizd</td><td>Problem Sets 1 and 7</td><td align="right">946.16</td></tr>
<tr class=sidebarText><td>petko</td><td>Problem Sets 1 and 7</td><td align="right">945.36</td></tr>
<tr class=sidebarText><td>Wernie</td><td>Problem Sets 1 and 7</td><td align="right">933.89</td></tr>
<tr class=sidebarText><td>Mike Mirzayanov</td><td>Problem Sets 1 and 7</td><td align="right">931.18</td></tr>
<tr class=sidebarText><td>Satka5</td><td>Problem Sets 1 and 7</td><td align="right">895.01</td></tr>
<tr class=sidebarText><td>mickle</td><td>Problem Sets 1 and 7</td><td align="right">888.91</td></tr>
<tr class=sidebarText><td>Minsk</td><td>Problem Sets 1 and 7</td><td align="right">869.85</td></tr>
<tr class=sidebarText><td>StefanPochmann</td><td>Problem Sets 1 and 7</td><td align="right">862.20</td></tr>
<tr class=sidebarText><td>Andrew_Lazarev</td><td>Problem Sets 1 and 7</td><td align="right">860.34</td></tr>
<tr class=sidebarText><td>tosomja</td><td>Problem Sets 1 and 7</td><td align="right">859.74</td></tr>
<tr class=sidebarText><td>nicka81</td><td>Problem Sets 1 and 7</td><td align="right">850.95</td></tr>
<tr class=sidebarText><td>HilbertRaum</td><td>Problem Sets 1 and 7</td><td align="right">850.81</td></tr>
<tr class=sidebarText><td>robymus</td><td>Problem Sets 1 and 7</td><td align="right">844.66</td></tr>
<tr class=sidebarText><td>rem</td><td>Problem Sets 1 and 7</td><td align="right">844.01</td></tr>
<tr class=sidebarText><td>ardiankp</td><td>Problem Sets 1 and 7</td><td align="right">839.74</td></tr>
<tr class=sidebarText><td>Explorer</td><td>Problem Sets 1 and 7</td><td align="right">829.18</td></tr>
<tr class=sidebarText><td>Baobab</td><td>Problem Sets 1 and 7</td><td align="right">820.21</td></tr>
<tr class=sidebarText><td>ssancho2</td><td>Problem Sets 1 and 7</td><td align="right">817.86</td></tr>
<tr class=sidebarText><td>Krzysan</td><td>Problem Sets 1 and 7</td><td align="right">808.73</td></tr>
<tr class=sidebarText><td>reid</td><td>Problem Sets 1 and 7</td><td align="right">805.27</td></tr>
<tr class=sidebarText><td>Larry</td><td>Problem Sets 1 and 7</td><td align="right">803.79</td></tr>
<tr class=sidebarText><td>bladerunner</td><td>Problem Sets 1 and 7</td><td align="right">800.39</td></tr>
<tr class=sidebarText><td>xs0</td><td>Problem Sets 1 and 7</td><td align="right">787.07</td></tr>
<tr class=sidebarText><td>lars</td><td>Problem Sets 1 and 7</td><td align="right">784.08</td></tr>
<tr class=sidebarText><td>the_one_smiley</td><td>Problem Sets 1 and 7</td><td align="right">777.04</td></tr>
<tr class=sidebarText><td>bogklug</td><td>Problem Sets 1 and 7</td><td align="right">776.85</td></tr>
<tr class=sidebarText><td>Ken_Vogel</td><td>Problem Sets 1 and 7</td><td align="right">773.72</td></tr>
<tr class=sidebarText><td>timmac</td><td>Problem Sets 1 and 7</td><td align="right">769.00</td></tr>
<tr class=sidebarText><td>kyky</td><td>Problem Sets 1 and 7</td><td align="right">768.00</td></tr>
<tr class=sidebarText><td>gladius</td><td>Problem Sets 1 and 7</td><td align="right">758.47</td></tr>
<tr class=sidebarText><td>abies</td><td>Problem Sets 1 and 7</td><td align="right">740.45</td></tr>
<tr class=sidebarText><td>itman</td><td>Problem Sets 1 and 7</td><td align="right">740.31</td></tr>
<tr class=sidebarText><td>qsort</td><td>Problem Sets 1 and 7</td><td align="right">733.94</td></tr>
<tr class=sidebarText><td>notyou</td><td>Problem Sets 1 and 7</td><td align="right">726.40</td></tr>
<tr class=sidebarText><td>szymcio</td><td>Problem Sets 1 and 7</td><td align="right">719.37</td></tr>
<tr class=sidebarText><td>vividmxx</td><td>Problem Sets 1 and 7</td><td align="right">716.36</td></tr>
<tr class=sidebarText><td>Parchandri</td><td>Problem Sets 1 and 7</td><td align="right">713.26</td></tr>
<tr class=sidebarText><td>Maris</td><td>Problem Sets 1 and 7</td><td align="right">709.67</td></tr>
<tr class=sidebarText><td>space</td><td>Problem Sets 1 and 7</td><td align="right">689.22</td></tr>
<tr class=sidebarText><td>zig2</td><td>Problem Sets 1 and 7</td><td align="right">679.45</td></tr>
<tr class=sidebarText><td>HardCoder</td><td>Problem Sets 1 and 7</td><td align="right">661.77</td></tr>
<tr class=sidebarText><td>Sputnik</td><td>Problem Sets 1 and 7</td><td align="right">595.43</td></tr>
<tr class=sidebarText><td>Yi_Zhang</td><td>Problem Sets 1 and 7</td><td align="right">593.39</td></tr>
<tr class=sidebarText><td>jasonw</td><td>Problem Sets 1 and 7</td><td align="right">590.53</td></tr>
<tr class=sidebarText><td>szd714</td><td>Problem Sets 1 and 7</td><td align="right">534.78</td></tr>
<tr class=sidebarText><td>yuvalsapir</td><td>Problem Sets 1 and 7</td><td align="right">519.86</td></tr>
<tr class=sidebarText><td>targo</td><td>Problem Sets 1 and 7</td><td align="right">469.38</td></tr>
<tr class=sidebarText><td>bramandia</td><td>Problem Sets 1 and 7</td><td align="right">425.45</td></tr>
<tr class=sidebarText><td>swelef</td><td>Problem Sets 1 and 7</td><td align="right">418.44</td></tr>
<tr class=sidebarText><td>matic</td><td>Problem Sets 1 and 7</td><td align="right">401.13</td></tr>
<tr class=sidebarText><td>chrisg</td><td>Problem Sets 1 and 7</td><td align="right">401.03</td></tr>
<tr class=sidebarText><td>mbrierst</td><td>Problem Sets 1 and 7</td><td align="right">384.47</td></tr>
<tr class=sidebarText><td>geminisoft</td><td>Problem Sets 1 and 7</td><td align="right">376.09</td></tr>
<tr class=sidebarText><td>karate.dog</td><td>Problem Sets 1 and 7</td><td align="right">370.46</td></tr>
<tr class=sidebarText><td>rajeshvm</td><td>Problem Sets 1 and 7</td><td align="right">364.12</td></tr>
<tr class=sidebarText><td>Rustyoldman</td><td>Problem Sets 1 and 7</td><td align="right">285.49</td></tr>
<tr class=sidebarText><td>asaveljevs</td><td>Problem Sets 1 and 7</td><td align="right">250.63</td></tr>
<tr class=sidebarText><td>vfortuna</td><td>Problem Sets 1 and 7</td><td align="right">248.71</td></tr>
<tr class=sidebarText><td>nick_patt</td><td>Problem Sets 1 and 7</td><td align="right">241.40</td></tr>
<tr class=sidebarText><td>indigo9</td><td>Problem Sets 1 and 7</td><td align="right">232.61</td></tr>
<tr class=sidebarText><td>dmytro</td><td>Problem Sets 1 and 7</td><td align="right">232.14</td></tr>
<tr class=sidebarText><td>InsaneParadox</td><td>Problem Sets 1 and 7</td><td align="right">226.47</td></tr>
<tr class=sidebarText><td>carp</td><td>Problem Sets 1 and 7</td><td align="right">226.39</td></tr>
<tr class=sidebarText><td>t.dobek</td><td>Problem Sets 1 and 7</td><td align="right">222.49</td></tr>
<tr class=sidebarText><td>bolu</td><td>Problem Sets 1 and 7</td><td align="right">221.81</td></tr>
<tr class=sidebarText><td>Wojtek</td><td>Problem Sets 1 and 7</td><td align="right">218.24</td></tr>
<tr class=sidebarText><td>Oleksiy</td><td>Problem Sets 1 and 7</td><td align="right">218.07</td></tr>
<tr class=sidebarText><td>cbthiess</td><td>Problem Sets 1 and 7</td><td align="right">213.07</td></tr>
<tr class=sidebarText><td>ucsbtex</td><td>Problem Sets 1 and 7</td><td align="right">204.94</td></tr>
<tr class=sidebarText><td>BryanChen</td><td>Problem Sets 1 and 7</td><td align="right">191.22</td></tr>
<tr class=sidebarText><td>gilbert</td><td>Problem Sets 1 and 7</td><td align="right">191.07</td></tr>
<tr class=sidebarText><td>Joker</td><td>Problem Sets 1 and 7</td><td align="right">190.28</td></tr>
<tr class=sidebarText><td>herchu</td><td>Problem Sets 1 and 7</td><td align="right">185.46</td></tr>
<tr class=sidebarText><td>JeremyStein</td><td>Problem Sets 1 and 7</td><td align="right">182.18</td></tr>
<tr class=sidebarText><td>lazyboy</td><td>Problem Sets 1 and 7</td><td align="right">179.97</td></tr>
<tr class=sidebarText><td>fredphil</td><td>Problem Sets 1 and 7</td><td align="right">176.89</td></tr>
<tr class=sidebarText><td>jpaquin</td><td>Problem Sets 1 and 7</td><td align="right">175.98</td></tr>
<tr class=sidebarText><td>nadsuki</td><td>Problem Sets 1 and 7</td><td align="right">174.52</td></tr>
<tr class=sidebarText><td>trieuvan</td><td>Problem Sets 1 and 7</td><td align="right">173.36</td></tr>
<tr class=sidebarText><td>mido1236</td><td>Problem Sets 1 and 7</td><td align="right">168.43</td></tr>
<tr class=sidebarText><td>hakojima</td><td>Problem Sets 1 and 7</td><td align="right">167.91</td></tr>
<tr class=sidebarText><td>leibniz</td><td>Problem Sets 1 and 7</td><td align="right">164.33</td></tr>
<tr class=sidebarText><td>dare</td><td>Problem Sets 1 and 7</td><td align="right">164.10</td></tr>
<tr class=sidebarText><td>skrowl</td><td>Problem Sets 1 and 7</td><td align="right">161.55</td></tr>
<tr class=sidebarText><td>agove</td><td>Problem Sets 1 and 7</td><td align="right">159.54</td></tr>
<tr class=sidebarText><td>Mariyka</td><td>Problem Sets 1 and 7</td><td align="right">158.73</td></tr>
<tr class=sidebarText><td>CrazyScratcher</td><td>Problem Sets 1 and 7</td><td align="right">156.01</td></tr>
<tr class=sidebarText><td>alexrandnmt</td><td>Problem Sets 1 and 7</td><td align="right">152.51</td></tr>
<tr class=sidebarText><td>sabu</td><td>Problem Sets 1 and 7</td><td align="right">148.33</td></tr>
<tr class=sidebarText><td>MrSparkle</td><td>Problem Sets 1 and 7</td><td align="right">148.29</td></tr>
<tr class=sidebarText><td>tok</td><td>Problem Sets 2 and 8</td><td align="right">1130.09</td></tr>
<tr class=sidebarText><td>krijgertje</td><td>Problem Sets 2 and 8</td><td align="right">1121.06</td></tr>
<tr class=sidebarText><td>jshute</td><td>Problem Sets 2 and 8</td><td align="right">1107.04</td></tr>
<tr class=sidebarText><td>UFP2161</td><td>Problem Sets 2 and 8</td><td align="right">1008.51</td></tr>
<tr class=sidebarText><td>monsoon</td><td>Problem Sets 2 and 8</td><td align="right">972.07</td></tr>
<tr class=sidebarText><td>bstanescu</td><td>Problem Sets 2 and 8</td><td align="right">963.87</td></tr>
<tr class=sidebarText><td>XuChuan</td><td>Problem Sets 2 and 8</td><td align="right">935.74</td></tr>
<tr class=sidebarText><td>centipede80</td><td>Problem Sets 2 and 8</td><td align="right">932.59</td></tr>
<tr class=sidebarText><td>qixin99</td><td>Problem Sets 2 and 8</td><td align="right">901.01</td></tr>
<tr class=sidebarText><td>sjelkjd</td><td>Problem Sets 2 and 8</td><td align="right">900.58</td></tr>
<tr class=sidebarText><td>Googly</td><td>Problem Sets 2 and 8</td><td align="right">899.20</td></tr>
<tr class=sidebarText><td>martinp534</td><td>Problem Sets 2 and 8</td><td align="right">898.85</td></tr>
<tr class=sidebarText><td>agh</td><td>Problem Sets 2 and 8</td><td align="right">891.42</td></tr>
<tr class=sidebarText><td>quazee</td><td>Problem Sets 2 and 8</td><td align="right">887.63</td></tr>
<tr class=sidebarText><td>tripleCross</td><td>Problem Sets 2 and 8</td><td align="right">875.63</td></tr>
<tr class=sidebarText><td>ante</td><td>Problem Sets 2 and 8</td><td align="right">872.40</td></tr>
<tr class=sidebarText><td>Fluff</td><td>Problem Sets 2 and 8</td><td align="right">857.69</td></tr>
<tr class=sidebarText><td>forest</td><td>Problem Sets 2 and 8</td><td align="right">854.13</td></tr>
<tr class=sidebarText><td>skanthak</td><td>Problem Sets 2 and 8</td><td align="right">850.26</td></tr>
<tr class=sidebarText><td>tgu</td><td>Problem Sets 2 and 8</td><td align="right">849.55</td></tr>
<tr class=sidebarText><td>polarsteam</td><td>Problem Sets 2 and 8</td><td align="right">844.61</td></tr>
<tr class=sidebarText><td>xiangyu1</td><td>Problem Sets 2 and 8</td><td align="right">842.63</td></tr>
<tr class=sidebarText><td>130358</td><td>Problem Sets 2 and 8</td><td align="right">838.08</td></tr>
<tr class=sidebarText><td>Jasko</td><td>Problem Sets 2 and 8</td><td align="right">832.05</td></tr>
<tr class=sidebarText><td>WishingBone</td><td>Problem Sets 2 and 8</td><td align="right">829.45</td></tr>
<tr class=sidebarText><td>Minilek</td><td>Problem Sets 2 and 8</td><td align="right">820.83</td></tr>
<tr class=sidebarText><td>amorosov</td><td>Problem Sets 2 and 8</td><td align="right">819.85</td></tr>
<tr class=sidebarText><td>pako</td><td>Problem Sets 2 and 8</td><td align="right">818.35</td></tr>
<tr class=sidebarText><td>konqueror</td><td>Problem Sets 2 and 8</td><td align="right">803.93</td></tr>
<tr class=sidebarText><td>FrostDemon</td><td>Problem Sets 2 and 8</td><td align="right">786.49</td></tr>
<tr class=sidebarText><td>ambrose</td><td>Problem Sets 2 and 8</td><td align="right">777.75</td></tr>
<tr class=sidebarText><td>BillyBob</td><td>Problem Sets 2 and 8</td><td align="right">774.98</td></tr>
<tr class=sidebarText><td>Im2Good</td><td>Problem Sets 2 and 8</td><td align="right">759.46</td></tr>
<tr class=sidebarText><td>Artursz</td><td>Problem Sets 2 and 8</td><td align="right">747.66</td></tr>
<tr class=sidebarText><td>BradAustin</td><td>Problem Sets 2 and 8</td><td align="right">742.62</td></tr>
<tr class=sidebarText><td>steffend</td><td>Problem Sets 2 and 8</td><td align="right">740.92</td></tr>
<tr class=sidebarText><td>prekageo</td><td>Problem Sets 2 and 8</td><td align="right">738.71</td></tr>
<tr class=sidebarText><td>Rud0lf</td><td>Problem Sets 2 and 8</td><td align="right">737.30</td></tr>
<tr class=sidebarText><td>aksonov</td><td>Problem Sets 2 and 8</td><td align="right">715.84</td></tr>
<tr class=sidebarText><td>supernova</td><td>Problem Sets 2 and 8</td><td align="right">696.79</td></tr>
<tr class=sidebarText><td>Klinck</td><td>Problem Sets 2 and 8</td><td align="right">689.80</td></tr>
<tr class=sidebarText><td>Gronkowiec</td><td>Problem Sets 2 and 8</td><td align="right">662.62</td></tr>
<tr class=sidebarText><td>gupta35895</td><td>Problem Sets 2 and 8</td><td align="right">644.52</td></tr>
<tr class=sidebarText><td>geminisoft-2</td><td>Problem Sets 2 and 8</td><td align="right">644.12</td></tr>
<tr class=sidebarText><td>nike</td><td>Problem Sets 2 and 8</td><td align="right">630.21</td></tr>
<tr class=sidebarText><td>don.pratt</td><td>Problem Sets 2 and 8</td><td align="right">627.60</td></tr>
<tr class=sidebarText><td>AleaActaEst</td><td>Problem Sets 2 and 8</td><td align="right">625.24</td></tr>
<tr class=sidebarText><td>harisuthan</td><td>Problem Sets 2 and 8</td><td align="right">624.96</td></tr>
<tr class=sidebarText><td>dmks</td><td>Problem Sets 2 and 8</td><td align="right">619.12</td></tr>
<tr class=sidebarText><td>narita</td><td>Problem Sets 2 and 8</td><td align="right">609.21</td></tr>
<tr class=sidebarText><td>yonch</td><td>Problem Sets 2 and 8</td><td align="right">601.56</td></tr>
<tr class=sidebarText><td>Symme7ry</td><td>Problem Sets 2 and 8</td><td align="right">595.05</td></tr>
<tr class=sidebarText><td>Cosmin.ro</td><td>Problem Sets 2 and 8</td><td align="right">593.26</td></tr>
<tr class=sidebarText><td>Mozg</td><td>Problem Sets 2 and 8</td><td align="right">589.82</td></tr>
<tr class=sidebarText><td>algorist</td><td>Problem Sets 2 and 8</td><td align="right">562.58</td></tr>
<tr class=sidebarText><td>bakina</td><td>Problem Sets 2 and 8</td><td align="right">558.06</td></tr>
<tr class=sidebarText><td>Dan[Popovici]</td><td>Problem Sets 2 and 8</td><td align="right">539.50</td></tr>
<tr class=sidebarText><td>Dimka</td><td>Problem Sets 2 and 8</td><td align="right">532.08</td></tr>
<tr class=sidebarText><td>sdweber</td><td>Problem Sets 2 and 8</td><td align="right">527.05</td></tr>
<tr class=sidebarText><td>Dumitru</td><td>Problem Sets 2 and 8</td><td align="right">523.66</td></tr>
<tr class=sidebarText><td>mariusmuja</td><td>Problem Sets 2 and 8</td><td align="right">489.77</td></tr>
<tr class=sidebarText><td>assembler</td><td>Problem Sets 2 and 8</td><td align="right">487.57</td></tr>
<tr class=sidebarText><td>BjarkeDahlEbert</td><td>Problem Sets 2 and 8</td><td align="right">471.35</td></tr>
<tr class=sidebarText><td>Blytzstryke</td><td>Problem Sets 2 and 8</td><td align="right">470.59</td></tr>
<tr class=sidebarText><td>rpcxdr</td><td>Problem Sets 2 and 8</td><td align="right">470.20</td></tr>
<tr class=sidebarText><td>kinnla</td><td>Problem Sets 2 and 8</td><td align="right">467.82</td></tr>
<tr class=sidebarText><td>psm321</td><td>Problem Sets 2 and 8</td><td align="right">465.41</td></tr>
<tr class=sidebarText><td>CodeCat</td><td>Problem Sets 2 and 8</td><td align="right">454.66</td></tr>
<tr class=sidebarText><td>tilps</td><td>Problem Sets 2 and 8</td><td align="right">442.38</td></tr>
<tr class=sidebarText><td>Savior</td><td>Problem Sets 2 and 8</td><td align="right">433.25</td></tr>
<tr class=sidebarText><td>kabirAhmed</td><td>Problem Sets 2 and 8</td><td align="right">423.97</td></tr>
<tr class=sidebarText><td>jasonfoo</td><td>Problem Sets 2 and 8</td><td align="right">413.05</td></tr>
<tr class=sidebarText><td>avinf</td><td>Problem Sets 2 and 8</td><td align="right">412.46</td></tr>
<tr class=sidebarText><td>RalphFurmaniak</td><td>Problem Sets 2 and 8</td><td align="right">369.14</td></tr>
<tr class=sidebarText><td>Enogipe</td><td>Problem Sets 2 and 8</td><td align="right">312.42</td></tr>
<tr class=sidebarText><td>DjinnKahn</td><td>Problem Sets 2 and 8</td><td align="right">305.68</td></tr>
<tr class=sidebarText><td>niphoton</td><td>Problem Sets 2 and 8</td><td align="right">305.19</td></tr>
<tr class=sidebarText><td>Krumble</td><td>Problem Sets 2 and 8</td><td align="right">292.38</td></tr>
<tr class=sidebarText><td>jerky</td><td>Problem Sets 2 and 8</td><td align="right">290.19</td></tr>
<tr class=sidebarText><td>ragnabot</td><td>Problem Sets 2 and 8</td><td align="right">283.06</td></tr>
<tr class=sidebarText><td>asif_coder</td><td>Problem Sets 2 and 8</td><td align="right">259.56</td></tr>
<tr class=sidebarText><td>Dan-0411</td><td>Problem Sets 2 and 8</td><td align="right">254.44</td></tr>
<tr class=sidebarText><td>cz</td><td>Problem Sets 2 and 8</td><td align="right">249.74</td></tr>
<tr class=sidebarText><td>villiros</td><td>Problem Sets 2 and 8</td><td align="right">249.74</td></tr>
<tr class=sidebarText><td>Crystal</td><td>Problem Sets 2 and 8</td><td align="right">237.22</td></tr>
<tr class=sidebarText><td>jkraju</td><td>Problem Sets 2 and 8</td><td align="right">233.33</td></tr>
<tr class=sidebarText><td>tmkarthi</td><td>Problem Sets 2 and 8</td><td align="right">233.14</td></tr>
<tr class=sidebarText><td>karavanas</td><td>Problem Sets 2 and 8</td><td align="right">225.22</td></tr>
<tr class=sidebarText><td>jdepree</td><td>Problem Sets 2 and 8</td><td align="right">224.20</td></tr>
<tr class=sidebarText><td>tph</td><td>Problem Sets 2 and 8</td><td align="right">221.82</td></tr>
<tr class=sidebarText><td>PongsriBunny</td><td>Problem Sets 2 and 8</td><td align="right">212.05</td></tr>
<tr class=sidebarText><td>ArtV</td><td>Problem Sets 2 and 8</td><td align="right">205.61</td></tr>
<tr class=sidebarText><td>Electrum</td><td>Problem Sets 2 and 8</td><td align="right">204.80</td></tr>
<tr class=sidebarText><td>Pops</td><td>Problem Sets 2 and 8</td><td align="right">195.04</td></tr>
<tr class=sidebarText><td>spotcatbug</td><td>Problem Sets 2 and 8</td><td align="right">194.05</td></tr>
<tr class=sidebarText><td>jake_mundt</td><td>Problem Sets 2 and 8</td><td align="right">192.60</td></tr>
<tr class=sidebarText><td>gfs</td><td>Problem Sets 2 and 8</td><td align="right">192.58</td></tr>
<tr class=sidebarText><td>Avet</td><td>Problem Sets 2 and 8</td><td align="right">192.29</td></tr>
<tr class=sidebarText><td>rcollins</td><td>Problem Sets 2 and 8</td><td align="right">190.77</td></tr>
<tr class=sidebarText><td>jakabsz</td><td>Problem Sets 2 and 8</td><td align="right">187.98</td></tr>
<tr class=sidebarText><td>arun_zero</td><td>Problem Sets 3 and 10</td><td align="right">1010.34</td></tr>
<tr class=sidebarText><td>Yarin</td><td>Problem Sets 3 and 10</td><td align="right">889.63</td></tr>
<tr class=sidebarText><td>mics</td><td>Problem Sets 3 and 10</td><td align="right">860.27</td></tr>
<tr class=sidebarText><td>adams</td><td>Problem Sets 3 and 10</td><td align="right">836.11</td></tr>
<tr class=sidebarText><td>ploh</td><td>Problem Sets 3 and 10</td><td align="right">796.92</td></tr>
<tr class=sidebarText><td>zwang</td><td>Problem Sets 3 and 10</td><td align="right">771.14</td></tr>
<tr class=sidebarText><td>frane</td><td>Problem Sets 3 and 10</td><td align="right">770.28</td></tr>
<tr class=sidebarText><td>dangelo</td><td>Problem Sets 3 and 10</td><td align="right">738.84</td></tr>
<tr class=sidebarText><td>FatClimber</td><td>Problem Sets 3 and 10</td><td align="right">738.21</td></tr>
<tr class=sidebarText><td>TexWiller</td><td>Problem Sets 3 and 10</td><td align="right">731.02</td></tr>
<tr class=sidebarText><td>maze_pallas</td><td>Problem Sets 3 and 10</td><td align="right">718.32</td></tr>
<tr class=sidebarText><td>ankit_dube</td><td>Problem Sets 3 and 10</td><td align="right">390.35</td></tr>
<tr class=sidebarText><td>doeth</td><td>Problem Sets 3 and 10</td><td align="right">385.41</td></tr>
<tr class=sidebarText><td>Kawigi</td><td>Problem Sets 3 and 10</td><td align="right">382.90</td></tr>
<tr class=sidebarText><td>daveagp</td><td>Problem Sets 3 and 10</td><td align="right">382.75</td></tr>
<tr class=sidebarText><td>Eryx</td><td>Problem Sets 3 and 10</td><td align="right">380.34</td></tr>
<tr class=sidebarText><td>hshenoy</td><td>Problem Sets 3 and 10</td><td align="right">379.70</td></tr>
<tr class=sidebarText><td>LunaticFringe</td><td>Problem Sets 3 and 10</td><td align="right">379.56</td></tr>
<tr class=sidebarText><td>radeye</td><td>Problem Sets 3 and 10</td><td align="right">377.92</td></tr>
<tr class=sidebarText><td>riveria</td><td>Problem Sets 3 and 10</td><td align="right">377.05</td></tr>
<tr class=sidebarText><td>Arka</td><td>Problem Sets 3 and 10</td><td align="right">375.37</td></tr>
<tr class=sidebarText><td>RobertNix</td><td>Problem Sets 3 and 10</td><td align="right">374.31</td></tr>
<tr class=sidebarText><td>merlecorey</td><td>Problem Sets 3 and 10</td><td align="right">374.18</td></tr>
<tr class=sidebarText><td>snewman</td><td>Problem Sets 3 and 10</td><td align="right">371.86</td></tr>
<tr class=sidebarText><td>maikuru</td><td>Problem Sets 3 and 10</td><td align="right">371.15</td></tr>
<tr class=sidebarText><td>OpenGL4Dummies</td><td>Problem Sets 3 and 10</td><td align="right">370.22</td></tr>
<tr class=sidebarText><td>dzadza</td><td>Problem Sets 3 and 10</td><td align="right">369.60</td></tr>
<tr class=sidebarText><td>Modulator</td><td>Problem Sets 3 and 10</td><td align="right">368.53</td></tr>
<tr class=sidebarText><td>hellstrom</td><td>Problem Sets 3 and 10</td><td align="right">368.50</td></tr>
<tr class=sidebarText><td>aditsu</td><td>Problem Sets 3 and 10</td><td align="right">365.88</td></tr>
<tr class=sidebarText><td>zoidal</td><td>Problem Sets 3 and 10</td><td align="right">364.49</td></tr>
<tr class=sidebarText><td>bratell</td><td>Problem Sets 3 and 10</td><td align="right">364.40</td></tr>
<tr class=sidebarText><td>benetin</td><td>Problem Sets 3 and 10</td><td align="right">364.07</td></tr>
<tr class=sidebarText><td>bigbug</td><td>Problem Sets 3 and 10</td><td align="right">363.20</td></tr>
<tr class=sidebarText><td>ded_guy</td><td>Problem Sets 3 and 10</td><td align="right">362.12</td></tr>
<tr class=sidebarText><td>ryanp</td><td>Problem Sets 3 and 10</td><td align="right">361.07</td></tr>
<tr class=sidebarText><td>Olexiy</td><td>Problem Sets 3 and 10</td><td align="right">360.31</td></tr>
<tr class=sidebarText><td>mbjorklu</td><td>Problem Sets 3 and 10</td><td align="right">359.36</td></tr>
<tr class=sidebarText><td>hauser</td><td>Problem Sets 3 and 10</td><td align="right">358.49</td></tr>
<tr class=sidebarText><td>dzetkulict</td><td>Problem Sets 3 and 10</td><td align="right">357.39</td></tr>
<tr class=sidebarText><td>greenpig</td><td>Problem Sets 3 and 10</td><td align="right">355.82</td></tr>
<tr class=sidebarText><td>nchaly</td><td>Problem Sets 3 and 10</td><td align="right">355.55</td></tr>
<tr class=sidebarText><td>toast</td><td>Problem Sets 3 and 10</td><td align="right">355.33</td></tr>
<tr class=sidebarText><td>CanadaDoug</td><td>Problem Sets 3 and 10</td><td align="right">355.02</td></tr>
<tr class=sidebarText><td>asinop</td><td>Problem Sets 3 and 10</td><td align="right">354.80</td></tr>
<tr class=sidebarText><td>quickly</td><td>Problem Sets 3 and 10</td><td align="right">354.07</td></tr>
<tr class=sidebarText><td>Aptor</td><td>Problem Sets 3 and 10</td><td align="right">354.04</td></tr>
<tr class=sidebarText><td>marek.cygan</td><td>Problem Sets 3 and 10</td><td align="right">353.60</td></tr>
<tr class=sidebarText><td>bsauerwine</td><td>Problem Sets 3 and 10</td><td align="right">353.13</td></tr>
<tr class=sidebarText><td>madking</td><td>Problem Sets 3 and 10</td><td align="right">352.89</td></tr>
<tr class=sidebarText><td>ntrshn</td><td>Problem Sets 3 and 10</td><td align="right">352.20</td></tr>
<tr class=sidebarText><td>DAle</td><td>Problem Sets 3 and 10</td><td align="right">352.11</td></tr>
<tr class=sidebarText><td>mm_aa</td><td>Problem Sets 3 and 10</td><td align="right">352.00</td></tr>
<tr class=sidebarText><td>aneubeck</td><td>Problem Sets 3 and 10</td><td align="right">350.39</td></tr>
<tr class=sidebarText><td>drrootfu</td><td>Problem Sets 3 and 10</td><td align="right">349.91</td></tr>
<tr class=sidebarText><td>jakubr</td><td>Problem Sets 3 and 10</td><td align="right">349.21</td></tr>
<tr class=sidebarText><td>RunningWild</td><td>Problem Sets 3 and 10</td><td align="right">349.04</td></tr>
<tr class=sidebarText><td>LuckyLibran</td><td>Problem Sets 3 and 10</td><td align="right">348.39</td></tr>
<tr class=sidebarText><td>axch</td><td>Problem Sets 3 and 10</td><td align="right">348.38</td></tr>
<tr class=sidebarText><td>Josesan</td><td>Problem Sets 3 and 10</td><td align="right">346.72</td></tr>
<tr class=sidebarText><td>pingelsn</td><td>Problem Sets 3 and 10</td><td align="right">344.59</td></tr>
<tr class=sidebarText><td>Dr.Gluk</td><td>Problem Sets 3 and 10</td><td align="right">343.94</td></tr>
<tr class=sidebarText><td>BitConductor</td><td>Problem Sets 3 and 10</td><td align="right">343.47</td></tr>
<tr class=sidebarText><td>valeriy</td><td>Problem Sets 3 and 10</td><td align="right">342.87</td></tr>
<tr class=sidebarText><td>space_monkey</td><td>Problem Sets 3 and 10</td><td align="right">342.66</td></tr>
<tr class=sidebarText><td>belzebub</td><td>Problem Sets 3 and 10</td><td align="right">342.06</td></tr>
<tr class=sidebarText><td>dickyjim</td><td>Problem Sets 3 and 10</td><td align="right">341.88</td></tr>
<tr class=sidebarText><td>Pesho</td><td>Problem Sets 3 and 10</td><td align="right">341.69</td></tr>
<tr class=sidebarText><td>she</td><td>Problem Sets 3 and 10</td><td align="right">341.27</td></tr>
<tr class=sidebarText><td>aylex</td><td>Problem Sets 3 and 10</td><td align="right">340.84</td></tr>
<tr class=sidebarText><td>dario</td><td>Problem Sets 3 and 10</td><td align="right">340.59</td></tr>
<tr class=sidebarText><td>coshx</td><td>Problem Sets 3 and 10</td><td align="right">340.37</td></tr>
<tr class=sidebarText><td>Zaknafein</td><td>Problem Sets 3 and 10</td><td align="right">340.37</td></tr>
<tr class=sidebarText><td>scott</td><td>Problem Sets 3 and 10</td><td align="right">340.17</td></tr>
<tr class=sidebarText><td>Trap</td><td>Problem Sets 3 and 10</td><td align="right">339.69</td></tr>
<tr class=sidebarText><td>mktong</td><td>Problem Sets 3 and 10</td><td align="right">339.25</td></tr>
<tr class=sidebarText><td>eleusive</td><td>Problem Sets 3 and 10</td><td align="right">339.03</td></tr>
<tr class=sidebarText><td>zbogi</td><td>Problem Sets 3 and 10</td><td align="right">338.69</td></tr>
<tr class=sidebarText><td>nerx</td><td>Problem Sets 3 and 10</td><td align="right">338.26</td></tr>
<tr class=sidebarText><td>huntergt</td><td>Problem Sets 3 and 10</td><td align="right">336.97</td></tr>
<tr class=sidebarText><td>reDragon</td><td>Problem Sets 3 and 10</td><td align="right">336.90</td></tr>
<tr class=sidebarText><td>RandySaint</td><td>Problem Sets 3 and 10</td><td align="right">336.05</td></tr>
<tr class=sidebarText><td>BEHiker57W</td><td>Problem Sets 3 and 10</td><td align="right">336.03</td></tr>
<tr class=sidebarText><td>haykel</td><td>Problem Sets 3 and 10</td><td align="right">335.35</td></tr>
<tr class=sidebarText><td>PaulJefferys</td><td>Problem Sets 3 and 10</td><td align="right">335.20</td></tr>
<tr class=sidebarText><td>Osk</td><td>Problem Sets 3 and 10</td><td align="right">335.09</td></tr>
<tr class=sidebarText><td>Vovik</td><td>Problem Sets 3 and 10</td><td align="right">335.01</td></tr>
<tr class=sidebarText><td>quol</td><td>Problem Sets 3 and 10</td><td align="right">334.45</td></tr>
<tr class=sidebarText><td>cleclerc</td><td>Problem Sets 3 and 10</td><td align="right">333.80</td></tr>
<tr class=sidebarText><td>grotmol</td><td>Problem Sets 3 and 10</td><td align="right">333.77</td></tr>
<tr class=sidebarText><td>siavach</td><td>Problem Sets 3 and 10</td><td align="right">333.29</td></tr>
<tr class=sidebarText><td>thumper</td><td>Problem Sets 3 and 10</td><td align="right">333.09</td></tr>
<tr class=sidebarText><td>Fred[dy]</td><td>Problem Sets 3 and 10</td><td align="right">332.71</td></tr>
<tr class=sidebarText><td>Jumping-John</td><td>Problem Sets 3 and 10</td><td align="right">332.27</td></tr>
<tr class=sidebarText><td>xmux</td><td>Problem Sets 3 and 10</td><td align="right">331.09</td></tr>
<tr class=sidebarText><td>lincetto</td><td>Problem Sets 3 and 10</td><td align="right">330.90</td></tr>
<tr class=sidebarText><td>cowtowncoder</td><td>Problem Sets 3 and 10</td><td align="right">330.72</td></tr>
<tr class=sidebarText><td>Vovka</td><td>Problem Sets 3 and 10</td><td align="right">330.25</td></tr>
<tr class=sidebarText><td>CodeDrJ</td><td>Problem Sets 3 and 10</td><td align="right">329.26</td></tr>
<tr class=sidebarText><td>tomek2</td><td>Problem Sets 3 and 10</td><td align="right">329.01</td></tr>
<tr class=sidebarText><td>gunnark</td><td>Problem Sets 4 and 9</td><td align="right">933.94</td></tr>
<tr class=sidebarText><td>superjoel</td><td>Problem Sets 4 and 9</td><td align="right">917.10</td></tr>
<tr class=sidebarText><td>overwise</td><td>Problem Sets 4 and 9</td><td align="right">901.01</td></tr>
<tr class=sidebarText><td>Jan_Kuipers</td><td>Problem Sets 4 and 9</td><td align="right">899.01</td></tr>
<tr class=sidebarText><td>amirshim</td><td>Problem Sets 4 and 9</td><td align="right">828.70</td></tr>
<tr class=sidebarText><td>marian</td><td>Problem Sets 4 and 9</td><td align="right">805.38</td></tr>
<tr class=sidebarText><td>WildGuruLarry</td><td>Problem Sets 4 and 9</td><td align="right">799.10</td></tr>
<tr class=sidebarText><td>b0b0b0b</td><td>Problem Sets 4 and 9</td><td align="right">798.93</td></tr>
<tr class=sidebarText><td>legakis</td><td>Problem Sets 4 and 9</td><td align="right">795.99</td></tr>
<tr class=sidebarText><td>battyone</td><td>Problem Sets 4 and 9</td><td align="right">786.56</td></tr>
<tr class=sidebarText><td>jms137</td><td>Problem Sets 4 and 9</td><td align="right">775.73</td></tr>
<tr class=sidebarText><td>athenachu71</td><td>Problem Sets 4 and 9</td><td align="right">774.97</td></tr>
<tr class=sidebarText><td>John_Dethridge</td><td>Problem Sets 4 and 9</td><td align="right">763.01</td></tr>
<tr class=sidebarText><td>mgritter</td><td>Problem Sets 4 and 9</td><td align="right">750.71</td></tr>
<tr class=sidebarText><td>mortijingle</td><td>Problem Sets 4 and 9</td><td align="right">744.05</td></tr>
<tr class=sidebarText><td>Bytekeeper</td><td>Problem Sets 4 and 9</td><td align="right">733.19</td></tr>
<tr class=sidebarText><td>theflea</td><td>Problem Sets 4 and 9</td><td align="right">728.89</td></tr>
<tr class=sidebarText><td>along</td><td>Problem Sets 4 and 9</td><td align="right">568.26</td></tr>
<tr class=sidebarText><td>jinxidoru</td><td>Problem Sets 4 and 9</td><td align="right">524.60</td></tr>
<tr class=sidebarText><td>Jwalk</td><td>Problem Sets 4 and 9</td><td align="right">391.71</td></tr>
<tr class=sidebarText><td>futo</td><td>Problem Sets 4 and 9</td><td align="right">388.48</td></tr>
<tr class=sidebarText><td>anomaly</td><td>Problem Sets 4 and 9</td><td align="right">388.25</td></tr>
<tr class=sidebarText><td>evd</td><td>Problem Sets 4 and 9</td><td align="right">385.65</td></tr>
<tr class=sidebarText><td>nealzane</td><td>Problem Sets 4 and 9</td><td align="right">384.63</td></tr>
<tr class=sidebarText><td>sean_henderson</td><td>Problem Sets 4 and 9</td><td align="right">383.37</td></tr>
<tr class=sidebarText><td>jdmetz</td><td>Problem Sets 4 and 9</td><td align="right">382.95</td></tr>
<tr class=sidebarText><td>DEathkNIghtS</td><td>Problem Sets 4 and 9</td><td align="right">382.79</td></tr>
<tr class=sidebarText><td>ilham</td><td>Problem Sets 4 and 9</td><td align="right">382.57</td></tr>
<tr class=sidebarText><td>turuthok</td><td>Problem Sets 4 and 9</td><td align="right">382.23</td></tr>
<tr class=sidebarText><td>zhliu</td><td>Problem Sets 4 and 9</td><td align="right">381.12</td></tr>
<tr class=sidebarText><td>oldbig</td><td>Problem Sets 4 and 9</td><td align="right">380.35</td></tr>
<tr class=sidebarText><td>rsasanka</td><td>Problem Sets 4 and 9</td><td align="right">379.62</td></tr>
<tr class=sidebarText><td>hilfiger</td><td>Problem Sets 4 and 9</td><td align="right">379.02</td></tr>
<tr class=sidebarText><td>Mr.Sketch</td><td>Problem Sets 4 and 9</td><td align="right">378.82</td></tr>
<tr class=sidebarText><td>m00tz</td><td>Problem Sets 4 and 9</td><td align="right">378.81</td></tr>
<tr class=sidebarText><td>Abednego</td><td>Problem Sets 4 and 9</td><td align="right">377.54</td></tr>
<tr class=sidebarText><td>Marvin</td><td>Problem Sets 4 and 9</td><td align="right">377.08</td></tr>
<tr class=sidebarText><td>O_O</td><td>Problem Sets 4 and 9</td><td align="right">376.49</td></tr>
<tr class=sidebarText><td>akeefer</td><td>Problem Sets 4 and 9</td><td align="right">376.24</td></tr>
<tr class=sidebarText><td>Wasteland</td><td>Problem Sets 4 and 9</td><td align="right">376.13</td></tr>
<tr class=sidebarText><td>dimkadimon</td><td>Problem Sets 4 and 9</td><td align="right">376.03</td></tr>
<tr class=sidebarText><td>bugloaf</td><td>Problem Sets 4 and 9</td><td align="right">374.95</td></tr>
<tr class=sidebarText><td>Vaduz</td><td>Problem Sets 4 and 9</td><td align="right">373.81</td></tr>
<tr class=sidebarText><td>anikov</td><td>Problem Sets 4 and 9</td><td align="right">373.40</td></tr>
<tr class=sidebarText><td>tyrithe</td><td>Problem Sets 4 and 9</td><td align="right">372.96</td></tr>
<tr class=sidebarText><td>ltank</td><td>Problem Sets 4 and 9</td><td align="right">372.92</td></tr>
<tr class=sidebarText><td>abi_k</td><td>Problem Sets 4 and 9</td><td align="right">371.94</td></tr>
<tr class=sidebarText><td>s.stefanek</td><td>Problem Sets 4 and 9</td><td align="right">370.45</td></tr>
<tr class=sidebarText><td>DimaGer</td><td>Problem Sets 4 and 9</td><td align="right">370.42</td></tr>
<tr class=sidebarText><td>solman</td><td>Problem Sets 4 and 9</td><td align="right">369.73</td></tr>
<tr class=sidebarText><td>cvoinescu</td><td>Problem Sets 4 and 9</td><td align="right">369.04</td></tr>
<tr class=sidebarText><td>samispa</td><td>Problem Sets 4 and 9</td><td align="right">368.01</td></tr>
<tr class=sidebarText><td>galvarr</td><td>Problem Sets 4 and 9</td><td align="right">367.99</td></tr>
<tr class=sidebarText><td>pollo_diablo</td><td>Problem Sets 4 and 9</td><td align="right">366.74</td></tr>
<tr class=sidebarText><td>emmpee</td><td>Problem Sets 4 and 9</td><td align="right">365.44</td></tr>
<tr class=sidebarText><td>Mikhos</td><td>Problem Sets 4 and 9</td><td align="right">364.96</td></tr>
<tr class=sidebarText><td>sindu</td><td>Problem Sets 4 and 9</td><td align="right">364.30</td></tr>
<tr class=sidebarText><td>dannycool</td><td>Problem Sets 4 and 9</td><td align="right">363.66</td></tr>
<tr class=sidebarText><td>mafattah</td><td>Problem Sets 4 and 9</td><td align="right">363.62</td></tr>
<tr class=sidebarText><td>mcphee</td><td>Problem Sets 4 and 9</td><td align="right">362.48</td></tr>
<tr class=sidebarText><td>netspade</td><td>Problem Sets 4 and 9</td><td align="right">362.46</td></tr>
<tr class=sidebarText><td>msdawy</td><td>Problem Sets 4 and 9</td><td align="right">362.05</td></tr>
<tr class=sidebarText><td>nullspace</td><td>Problem Sets 4 and 9</td><td align="right">361.71</td></tr>
<tr class=sidebarText><td>qoqo</td><td>Problem Sets 4 and 9</td><td align="right">361.43</td></tr>
<tr class=sidebarText><td>groovymother</td><td>Problem Sets 4 and 9</td><td align="right">361.43</td></tr>
<tr class=sidebarText><td>toschek</td><td>Problem Sets 4 and 9</td><td align="right">360.85</td></tr>
<tr class=sidebarText><td>lebedev.kirill</td><td>Problem Sets 4 and 9</td><td align="right">360.10</td></tr>
<tr class=sidebarText><td>kalmakka</td><td>Problem Sets 4 and 9</td><td align="right">359.74</td></tr>
<tr class=sidebarText><td>Katya_Lazareva</td><td>Problem Sets 4 and 9</td><td align="right">358.61</td></tr>
<tr class=sidebarText><td>nat5an</td><td>Problem Sets 4 and 9</td><td align="right">357.36</td></tr>
<tr class=sidebarText><td>Korbaxo</td><td>Problem Sets 4 and 9</td><td align="right">357.31</td></tr>
<tr class=sidebarText><td>blackbeltcoder4</td><td>Problem Sets 4 and 9</td><td align="right">357.17</td></tr>
<tr class=sidebarText><td>hendryjh</td><td>Problem Sets 4 and 9</td><td align="right">357.15</td></tr>
<tr class=sidebarText><td>SteveStern</td><td>Problem Sets 4 and 9</td><td align="right">356.99</td></tr>
<tr class=sidebarText><td>michiexile</td><td>Problem Sets 4 and 9</td><td align="right">355.98</td></tr>
<tr class=sidebarText><td>kero</td><td>Problem Sets 4 and 9</td><td align="right">355.10</td></tr>
<tr class=sidebarText><td>jburnim</td><td>Problem Sets 4 and 9</td><td align="right">354.41</td></tr>
<tr class=sidebarText><td>nwc</td><td>Problem Sets 4 and 9</td><td align="right">353.87</td></tr>
<tr class=sidebarText><td>Xero</td><td>Problem Sets 4 and 9</td><td align="right">352.85</td></tr>
<tr class=sidebarText><td>merreborn</td><td>Problem Sets 4 and 9</td><td align="right">351.90</td></tr>
<tr class=sidebarText><td>shuvovse</td><td>Problem Sets 4 and 9</td><td align="right">351.73</td></tr>
<tr class=sidebarText><td>cjoa2</td><td>Problem Sets 4 and 9</td><td align="right">351.42</td></tr>
<tr class=sidebarText><td>AndrewSmith</td><td>Problem Sets 4 and 9</td><td align="right">351.00</td></tr>
<tr class=sidebarText><td>gensui</td><td>Problem Sets 4 and 9</td><td align="right">349.68</td></tr>
<tr class=sidebarText><td>a2chang</td><td>Problem Sets 4 and 9</td><td align="right">349.51</td></tr>
<tr class=sidebarText><td>TheSkipper</td><td>Problem Sets 4 and 9</td><td align="right">349.19</td></tr>
<tr class=sidebarText><td>ovidiug</td><td>Problem Sets 4 and 9</td><td align="right">348.87</td></tr>
<tr class=sidebarText><td>lualua</td><td>Problem Sets 4 and 9</td><td align="right">348.49</td></tr>
<tr class=sidebarText><td>Chicken1</td><td>Problem Sets 4 and 9</td><td align="right">348.46</td></tr>
<tr class=sidebarText><td>jorisvr</td><td>Problem Sets 4 and 9</td><td align="right">347.56</td></tr>
<tr class=sidebarText><td>mcbevin</td><td>Problem Sets 4 and 9</td><td align="right">346.68</td></tr>
<tr class=sidebarText><td>anne</td><td>Problem Sets 4 and 9</td><td align="right">345.73</td></tr>
<tr class=sidebarText><td>mmsa</td><td>Problem Sets 4 and 9</td><td align="right">345.60</td></tr>
<tr class=sidebarText><td>tkaesmayr</td><td>Problem Sets 4 and 9</td><td align="right">345.10</td></tr>
<tr class=sidebarText><td>ariostosilva</td><td>Problem Sets 4 and 9</td><td align="right">344.58</td></tr>
<tr class=sidebarText><td>wstubbs</td><td>Problem Sets 4 and 9</td><td align="right">344.03</td></tr>
<tr class=sidebarText><td>ordinaryHuman</td><td>Problem Sets 4 and 9</td><td align="right">343.33</td></tr>
<tr class=sidebarText><td>Ulan</td><td>Problem Sets 4 and 9</td><td align="right">342.87</td></tr>
<tr class=sidebarText><td>nosnickid</td><td>Problem Sets 4 and 9</td><td align="right">342.83</td></tr>
<tr class=sidebarText><td>tomek</td><td>Problem Sets 4 and 9</td><td align="right">342.13</td></tr>
<tr class=sidebarText><td>AdrianKuegel</td><td>Problem Sets 5 and 6</td><td align="right">1056.03</td></tr>
<tr class=sidebarText><td>pparys</td><td>Problem Sets 5 and 6</td><td align="right">1015.19</td></tr>
<tr class=sidebarText><td>viktoras</td><td>Problem Sets 5 and 6</td><td align="right">873.48</td></tr>
<tr class=sidebarText><td>dvickrey</td><td>Problem Sets 5 and 6</td><td align="right">852.88</td></tr>
<tr class=sidebarText><td>Zis</td><td>Problem Sets 5 and 6</td><td align="right">848.62</td></tr>
<tr class=sidebarText><td>Oblok</td><td>Problem Sets 5 and 6</td><td align="right">845.19</td></tr>
<tr class=sidebarText><td>Veloso</td><td>Problem Sets 5 and 6</td><td align="right">844.37</td></tr>
<tr class=sidebarText><td>PMH</td><td>Problem Sets 5 and 6</td><td align="right">823.52</td></tr>
<tr class=sidebarText><td>kirkifer</td><td>Problem Sets 5 and 6</td><td align="right">819.26</td></tr>
<tr class=sidebarText><td>dark_lord</td><td>Problem Sets 5 and 6</td><td align="right">797.76</td></tr>
<tr class=sidebarText><td>jochang</td><td>Problem Sets 5 and 6</td><td align="right">792.80</td></tr>
<tr class=sidebarText><td>haha</td><td>Problem Sets 5 and 6</td><td align="right">789.23</td></tr>
<tr class=sidebarText><td>paranoia</td><td>Problem Sets 5 and 6</td><td align="right">785.13</td></tr>
<tr class=sidebarText><td>bjarker</td><td>Problem Sets 5 and 6</td><td align="right">781.32</td></tr>
<tr class=sidebarText><td>Ruberik</td><td>Problem Sets 5 and 6</td><td align="right">396.28</td></tr>
<tr class=sidebarText><td>JongMan</td><td>Problem Sets 5 and 6</td><td align="right">392.72</td></tr>
<tr class=sidebarText><td>lovro</td><td>Problem Sets 5 and 6</td><td align="right">391.28</td></tr>
<tr class=sidebarText><td>_efer_</td><td>Problem Sets 5 and 6</td><td align="right">391.07</td></tr>
<tr class=sidebarText><td>blekdrago</td><td>Problem Sets 5 and 6</td><td align="right">389.78</td></tr>
<tr class=sidebarText><td>Totster</td><td>Problem Sets 5 and 6</td><td align="right">388.72</td></tr>
<tr class=sidebarText><td>mathijs</td><td>Problem Sets 5 and 6</td><td align="right">387.86</td></tr>
<tr class=sidebarText><td>tmyklebu</td><td>Problem Sets 5 and 6</td><td align="right">386.81</td></tr>
<tr class=sidebarText><td>gepa</td><td>Problem Sets 5 and 6</td><td align="right">385.18</td></tr>
<tr class=sidebarText><td>dhyanesh</td><td>Problem Sets 5 and 6</td><td align="right">384.59</td></tr>
<tr class=sidebarText><td>bsdude</td><td>Problem Sets 5 and 6</td><td align="right">384.46</td></tr>
<tr class=sidebarText><td>rrenaud</td><td>Problem Sets 5 and 6</td><td align="right">383.06</td></tr>
<tr class=sidebarText><td>jvohome</td><td>Problem Sets 5 and 6</td><td align="right">380.97</td></tr>
<tr class=sidebarText><td>Tomy</td><td>Problem Sets 5 and 6</td><td align="right">380.45</td></tr>
<tr class=sidebarText><td>ValD</td><td>Problem Sets 5 and 6</td><td align="right">380.13</td></tr>
<tr class=sidebarText><td>pigworlds</td><td>Problem Sets 5 and 6</td><td align="right">380.07</td></tr>
<tr class=sidebarText><td>oog</td><td>Problem Sets 5 and 6</td><td align="right">379.81</td></tr>
<tr class=sidebarText><td>lordbogy</td><td>Problem Sets 5 and 6</td><td align="right">379.60</td></tr>
<tr class=sidebarText><td>NeverMore</td><td>Problem Sets 5 and 6</td><td align="right">379.36</td></tr>
<tr class=sidebarText><td>aussie</td><td>Problem Sets 5 and 6</td><td align="right">379.28</td></tr>
<tr class=sidebarText><td>liympanda</td><td>Problem Sets 5 and 6</td><td align="right">378.44</td></tr>
<tr class=sidebarText><td>ceturc</td><td>Problem Sets 5 and 6</td><td align="right">377.85</td></tr>
<tr class=sidebarText><td>userundefined</td><td>Problem Sets 5 and 6</td><td align="right">377.80</td></tr>
<tr class=sidebarText><td>Kavan</td><td>Problem Sets 5 and 6</td><td align="right">376.68</td></tr>
<tr class=sidebarText><td>tc</td><td>Problem Sets 5 and 6</td><td align="right">376.51</td></tr>
<tr class=sidebarText><td>ivankovic</td><td>Problem Sets 5 and 6</td><td align="right">375.75</td></tr>
<tr class=sidebarText><td>jpowell</td><td>Problem Sets 5 and 6</td><td align="right">375.70</td></tr>
<tr class=sidebarText><td>wleite</td><td>Problem Sets 5 and 6</td><td align="right">375.31</td></tr>
<tr class=sidebarText><td>TAG</td><td>Problem Sets 5 and 6</td><td align="right">375.19</td></tr>
<tr class=sidebarText><td>amahmud</td><td>Problem Sets 5 and 6</td><td align="right">375.08</td></tr>
<tr class=sidebarText><td>asundqui</td><td>Problem Sets 5 and 6</td><td align="right">375.06</td></tr>
<tr class=sidebarText><td>cucu</td><td>Problem Sets 5 and 6</td><td align="right">373.79</td></tr>
<tr class=sidebarText><td>fpmc</td><td>Problem Sets 5 and 6</td><td align="right">372.76</td></tr>
<tr class=sidebarText><td>mikera7</td><td>Problem Sets 5 and 6</td><td align="right">372.41</td></tr>
<tr class=sidebarText><td>fenzi</td><td>Problem Sets 5 and 6</td><td align="right">371.64</td></tr>
<tr class=sidebarText><td>boets</td><td>Problem Sets 5 and 6</td><td align="right">371.57</td></tr>
<tr class=sidebarText><td>Gandi</td><td>Problem Sets 5 and 6</td><td align="right">370.78</td></tr>
<tr class=sidebarText><td>ggoprea</td><td>Problem Sets 5 and 6</td><td align="right">369.62</td></tr>
<tr class=sidebarText><td>domino</td><td>Problem Sets 5 and 6</td><td align="right">369.51</td></tr>
<tr class=sidebarText><td>schveiguy</td><td>Problem Sets 5 and 6</td><td align="right">369.09</td></tr>
<tr class=sidebarText><td>FryGuy1013</td><td>Problem Sets 5 and 6</td><td align="right">368.77</td></tr>
<tr class=sidebarText><td>pawel992</td><td>Problem Sets 5 and 6</td><td align="right">367.79</td></tr>
<tr class=sidebarText><td>eldering</td><td>Problem Sets 5 and 6</td><td align="right">366.76</td></tr>
<tr class=sidebarText><td>wisdompoet</td><td>Problem Sets 5 and 6</td><td align="right">366.74</td></tr>
<tr class=sidebarText><td>olsner</td><td>Problem Sets 5 and 6</td><td align="right">366.67</td></tr>
<tr class=sidebarText><td>yanivinbar</td><td>Problem Sets 5 and 6</td><td align="right">365.36</td></tr>
<tr class=sidebarText><td>arnoldk</td><td>Problem Sets 5 and 6</td><td align="right">364.99</td></tr>
<tr class=sidebarText><td>varun1</td><td>Problem Sets 5 and 6</td><td align="right">364.06</td></tr>
<tr class=sidebarText><td>Bendis</td><td>Problem Sets 5 and 6</td><td align="right">363.95</td></tr>
<tr class=sidebarText><td>jfreyss</td><td>Problem Sets 5 and 6</td><td align="right">363.74</td></tr>
<tr class=sidebarText><td>peru</td><td>Problem Sets 5 and 6</td><td align="right">363.27</td></tr>
<tr class=sidebarText><td>asdfgh</td><td>Problem Sets 5 and 6</td><td align="right">363.03</td></tr>
<tr class=sidebarText><td>FRaiser</td><td>Problem Sets 5 and 6</td><td align="right">362.06</td></tr>
<tr class=sidebarText><td>Farlox</td><td>Problem Sets 5 and 6</td><td align="right">361.78</td></tr>
<tr class=sidebarText><td>alexcchan</td><td>Problem Sets 5 and 6</td><td align="right">360.82</td></tr>
<tr class=sidebarText><td>kwsk</td><td>Problem Sets 5 and 6</td><td align="right">359.53</td></tr>
<tr class=sidebarText><td>rmsousa</td><td>Problem Sets 5 and 6</td><td align="right">359.38</td></tr>
<tr class=sidebarText><td>agnaveen</td><td>Problem Sets 5 and 6</td><td align="right">359.14</td></tr>
<tr class=sidebarText><td>utkarshjain</td><td>Problem Sets 5 and 6</td><td align="right">358.96</td></tr>
<tr class=sidebarText><td>FatHendrix</td><td>Problem Sets 5 and 6</td><td align="right">358.72</td></tr>
<tr class=sidebarText><td>cintamani</td><td>Problem Sets 5 and 6</td><td align="right">358.06</td></tr>
<tr class=sidebarText><td>alena</td><td>Problem Sets 5 and 6</td><td align="right">357.90</td></tr>
<tr class=sidebarText><td>alanm</td><td>Problem Sets 5 and 6</td><td align="right">357.73</td></tr>
<tr class=sidebarText><td>lindril</td><td>Problem Sets 5 and 6</td><td align="right">357.37</td></tr>
<tr class=sidebarText><td>matmis</td><td>Problem Sets 5 and 6</td><td align="right">357.03</td></tr>
<tr class=sidebarText><td>kclancy</td><td>Problem Sets 5 and 6</td><td align="right">357.00</td></tr>
<tr class=sidebarText><td>gmenhorn</td><td>Problem Sets 5 and 6</td><td align="right">356.65</td></tr>
<tr class=sidebarText><td>Nopik</td><td>Problem Sets 5 and 6</td><td align="right">356.31</td></tr>
<tr class=sidebarText><td>weimashipig</td><td>Problem Sets 5 and 6</td><td align="right">356.25</td></tr>
<tr class=sidebarText><td>federl</td><td>Problem Sets 5 and 6</td><td align="right">355.81</td></tr>
<tr class=sidebarText><td>mozga</td><td>Problem Sets 5 and 6</td><td align="right">355.53</td></tr>
<tr class=sidebarText><td>nigulh</td><td>Problem Sets 5 and 6</td><td align="right">354.78</td></tr>
<tr class=sidebarText><td>haru</td><td>Problem Sets 5 and 6</td><td align="right">354.47</td></tr>
<tr class=sidebarText><td>mas13081</td><td>Problem Sets 5 and 6</td><td align="right">353.82</td></tr>
<tr class=sidebarText><td>lanenal</td><td>Problem Sets 5 and 6</td><td align="right">353.10</td></tr>
<tr class=sidebarText><td>mmoll</td><td>Problem Sets 5 and 6</td><td align="right">352.31</td></tr>
<tr class=sidebarText><td>Kathrrak</td><td>Problem Sets 5 and 6</td><td align="right">352.26</td></tr>
<tr class=sidebarText><td>CMonkey</td><td>Problem Sets 5 and 6</td><td align="right">352.23</td></tr>
<tr class=sidebarText><td>empraptor</td><td>Problem Sets 5 and 6</td><td align="right">351.97</td></tr>
<tr class=sidebarText><td>j0hndoe</td><td>Problem Sets 5 and 6</td><td align="right">351.86</td></tr>
<tr class=sidebarText><td>JWizard</td><td>Problem Sets 5 and 6</td><td align="right">350.06</td></tr>
<tr class=sidebarText><td>isv</td><td>Problem Sets 5 and 6</td><td align="right">349.24</td></tr>
<tr class=sidebarText><td>mthreat</td><td>Problem Sets 5 and 6</td><td align="right">349.19</td></tr>
<tr class=sidebarText><td>marco_righele</td><td>Problem Sets 5 and 6</td><td align="right">349.19</td></tr>
<tr class=sidebarText><td>Vash</td><td>Problem Sets 5 and 6</td><td align="right">347.92</td></tr>
<tr class=sidebarText><td>andro</td><td>Problem Sets 5 and 6</td><td align="right">347.29</td></tr>

			</table>


			<br/><br/>
			To find out more detailed information about the Google Code Jam 2004, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google04&d2=rules">Terms and Conditions</a>.
			</div>
		</td>
		<td width="49%">&#160;</td>
	<tr>
</table>
<jsp:include page="foot.jsp" />
</body>
</html>