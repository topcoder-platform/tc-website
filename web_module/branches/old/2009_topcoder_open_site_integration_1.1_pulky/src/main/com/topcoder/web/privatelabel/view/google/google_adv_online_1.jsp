<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:useBean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>

<link rel=stylesheet href="http://www.google.com/google.css">

<title>Google Code Jam 2003</title>

<style><!--
body,td,font,p,a
{
    font-family:arial,sans-serif
	}
.sidebarBox
{
	border: 1px solid #95D597;
	}
.sidebarText
{
	color: #333;
	line-height: 14px;
	background-color: #EEEEEE;
	}
.sidebarTitle
{
	color: #333;
	background-color: #CCCCCC;
	}
.googleFrame { border: 1px solid #006633; }

.advancersTitle
{
	color: #EEE;
	background-color: #319463;
}

.google_round_id
{
	font-size: 12px;
	color: #FFF;
	font-weight: normal;
	background-color: #666;
	white-space: nowrap;
}
//-->
</style>

<jsp:include page="../script.jsp" />

</head>

    <body class=corporate bgcolor="#ffffff" text="#000000" link="#0000CC" vlink="#800080" alink="#ff0000" topmargin=2>

	<div align="center">
<%-- Google Header--%>
<img src="/i/events/google2003/codejam_logo.gif" alt="Google Code Jam logo">

<table border=0 cellspacing=5 width="740">
   <tr>
      <td style="background-color: #006633">
         <table class=sidebar bgcolor="#ffffff" cellpadding=15 cellspacing=0 border=0 width="100%">
            <tr>
               <td valign="top">
                  <div class=content>
                  <div align="center">

                  <!-- Tab bar links-->
                  <jsp:include page="googlelinks.jsp" >
                     <jsp:param name="selectedTab" value="advancers"/>
                  </jsp:include>

                  </div><br><br>

                  <table border=0 cellspacing=0 width="100%">
                     <tr>
                        <td valign="top">
                        <b><font size="+1">Advancers</font></b>
                        <img hspace="10" vspace="5" src="/i/events/google2003/codejam_info.gif" width="150" height="390" border="0" align="right" valign="top">

                        <p><font size="-1">


                      <table class=googleFrame bgcolor="#ffffff" cellpadding=5 cellspacing=2 border=0 width="400">
                        <tr>
                           <td class="advancersTitle" align="left" colspan="2">Online Round 1</td>
                        </tr>
                        <tr>
                           <td class="google_round_id" width="30%">Handle</td>
                           <td class="google_round_id" width="30%" align="right">Score</td>
                        </tr>

<tr><td class="sidebarText" align="left" >ZorbaTHut</td><td class="sidebarText" align="right">1687.48</td></tr>
<tr><td class="sidebarText" align="left" >SnapDragon</td><td class="sidebarText" align="right">1622.74</td></tr>
<tr><td class="sidebarText" align="left" >NGBronson</td><td class="sidebarText" align="right">1611.29</td></tr>
<tr><td class="sidebarText" align="left" >ealf</td><td class="sidebarText" align="right">1569.10</td></tr>
<tr><td class="sidebarText" align="left" >Vladko</td><td class="sidebarText" align="right">1567.34</td></tr>
<tr><td class="sidebarText" align="left" >mathijs</td><td class="sidebarText" align="right">1527.45</td></tr>
<tr><td class="sidebarText" align="left" >jcd1</td><td class="sidebarText" align="right">1517.66</td></tr>
<tr><td class="sidebarText" align="left" >mikera7</td><td class="sidebarText" align="right">1501.17</td></tr>
<tr><td class="sidebarText" align="left" >dgarthur</td><td class="sidebarText" align="right">1500.14</td></tr>
<tr><td class="sidebarText" align="left" >jburnim</td><td class="sidebarText" align="right">1489.54</td></tr>
<tr><td class="sidebarText" align="left" >bstanescu</td><td class="sidebarText" align="right">1476.41</td></tr>
<tr><td class="sidebarText" align="left" >haha</td><td class="sidebarText" align="right">1457.72</td></tr>
<tr><td class="sidebarText" align="left" >dangelo</td><td class="sidebarText" align="right">1446.42</td></tr>
<tr><td class="sidebarText" align="left" >TekGoNos</td><td class="sidebarText" align="right">1434.60</td></tr>
<tr><td class="sidebarText" align="left" >KenVogel</td><td class="sidebarText" align="right">1432.16</td></tr>
<tr><td class="sidebarText" align="left" >RunningWild</td><td class="sidebarText" align="right">1422.40</td></tr>
<tr><td class="sidebarText" align="left" >lovro</td><td class="sidebarText" align="right">1421.80</td></tr>
<tr><td class="sidebarText" align="left" >schveiguy</td><td class="sidebarText" align="right">1410.36</td></tr>
<tr><td class="sidebarText" align="left" >venco</td><td class="sidebarText" align="right">1397.09</td></tr>
<tr><td class="sidebarText" align="left" >adic</td><td class="sidebarText" align="right">1392.32</td></tr>
<tr><td class="sidebarText" align="left" >szd713</td><td class="sidebarText" align="right">1380.56</td></tr>
<tr><td class="sidebarText" align="left" >jonmac</td><td class="sidebarText" align="right">1378.88</td></tr>
<tr><td class="sidebarText" align="left" >snewman</td><td class="sidebarText" align="right">1375.41</td></tr>
<tr><td class="sidebarText" align="left" >AlexandraRU</td><td class="sidebarText" align="right">1362.23</td></tr>
<tr><td class="sidebarText" align="left" >Jumping-John</td><td class="sidebarText" align="right">1361.64</td></tr>
<tr><td class="sidebarText" align="left" >Klinck</td><td class="sidebarText" align="right">1360.56</td></tr>
<tr><td class="sidebarText" align="left" >DrewHudson</td><td class="sidebarText" align="right">1352.38</td></tr>
<tr><td class="sidebarText" align="left" >Tree</td><td class="sidebarText" align="right">1340.04</td></tr>
<tr><td class="sidebarText" align="left" >futo</td><td class="sidebarText" align="right">1329.63</td></tr>
<tr><td class="sidebarText" align="left" >AdrianKuegel</td><td class="sidebarText" align="right">1318.70</td></tr>
<tr><td class="sidebarText" align="left" >Alexandre</td><td class="sidebarText" align="right">1310.62</td></tr>
<tr><td class="sidebarText" align="left" >Ukraine</td><td class="sidebarText" align="right">1298.08</td></tr>
<tr><td class="sidebarText" align="left" >LunaticFringe</td><td class="sidebarText" align="right">1293.49</td></tr>
<tr><td class="sidebarText" align="left" >aneubeck</td><td class="sidebarText" align="right">1291.63</td></tr>
<tr><td class="sidebarText" align="left" >InsaneParadox</td><td class="sidebarText" align="right">1289.35</td></tr>
<tr><td class="sidebarText" align="left" >Mike Mirzayanov</td><td class="sidebarText" align="right">1267.68</td></tr>
<tr><td class="sidebarText" align="left" >po</td><td class="sidebarText" align="right">1260.50</td></tr>
<tr><td class="sidebarText" align="left" >davitf</td><td class="sidebarText" align="right">1251.16</td></tr>
<tr><td class="sidebarText" align="left" >Wasteland</td><td class="sidebarText" align="right">1250.84</td></tr>
<tr><td class="sidebarText" align="left" >dvickrey</td><td class="sidebarText" align="right">1250.27</td></tr>
<tr><td class="sidebarText" align="left" >benetin</td><td class="sidebarText" align="right">1249.33</td></tr>
<tr><td class="sidebarText" align="left" >danlief</td><td class="sidebarText" align="right">1242.23</td></tr>
<tr><td class="sidebarText" align="left" >hgliebe</td><td class="sidebarText" align="right">1240.14</td></tr>
<tr><td class="sidebarText" align="left" >legakis</td><td class="sidebarText" align="right">1229.48</td></tr>
<tr><td class="sidebarText" align="left" >Modulator</td><td class="sidebarText" align="right">1228.13</td></tr>
<tr><td class="sidebarText" align="left" >gepa</td><td class="sidebarText" align="right">1225.04</td></tr>
<tr><td class="sidebarText" align="left" >ante</td><td class="sidebarText" align="right">1217.79</td></tr>
<tr><td class="sidebarText" align="left" >nicka81</td><td class="sidebarText" align="right">1210.68</td></tr>
<tr><td class="sidebarText" align="left" >Maris</td><td class="sidebarText" align="right">1210.58</td></tr>
<tr><td class="sidebarText" align="left" >assembler</td><td class="sidebarText" align="right">1191.28</td></tr>
<tr><td class="sidebarText" align="left" >PacerGuy</td><td class="sidebarText" align="right">1190.54</td></tr>
<tr><td class="sidebarText" align="left" >skanthak</td><td class="sidebarText" align="right">1190.01</td></tr>
<tr><td class="sidebarText" align="left" >vorthys</td><td class="sidebarText" align="right">1185.57</td></tr>
<tr><td class="sidebarText" align="left" >evd</td><td class="sidebarText" align="right">1183.85</td></tr>
<tr><td class="sidebarText" align="left" >D0SBoots</td><td class="sidebarText" align="right">1183.52</td></tr>
<tr><td class="sidebarText" align="left" >gladius</td><td class="sidebarText" align="right">1180.54</td></tr>
<tr><td class="sidebarText" align="left" >tomek</td><td class="sidebarText" align="right">1174.73</td></tr>
<tr><td class="sidebarText" align="left" >BjarkeEbert</td><td class="sidebarText" align="right">1172.61</td></tr>
<tr><td class="sidebarText" align="left" >aussie</td><td class="sidebarText" align="right">1172.12</td></tr>
<tr><td class="sidebarText" align="left" >PMH</td><td class="sidebarText" align="right">1168.45</td></tr>
<tr><td class="sidebarText" align="left" >bsdude</td><td class="sidebarText" align="right">1167.87</td></tr>
<tr><td class="sidebarText" align="left" >achurch</td><td class="sidebarText" align="right">1166.86</td></tr>
<tr><td class="sidebarText" align="left" >dpecora</td><td class="sidebarText" align="right">1165.85</td></tr>
<tr><td class="sidebarText" align="left" >_u0043_u0042</td><td class="sidebarText" align="right">1161.51</td></tr>
<tr><td class="sidebarText" align="left" >Ruberik</td><td class="sidebarText" align="right">1160.56</td></tr>
<tr><td class="sidebarText" align="left" >sandeepgupta</td><td class="sidebarText" align="right">1152.69</td></tr>
<tr><td class="sidebarText" align="left" >kyotov</td><td class="sidebarText" align="right">1146.00</td></tr>
<tr><td class="sidebarText" align="left" >jochang</td><td class="sidebarText" align="right">1145.72</td></tr>
<tr><td class="sidebarText" align="left" >Joe</td><td class="sidebarText" align="right">1133.37</td></tr>
<tr><td class="sidebarText" align="left" >superjoel</td><td class="sidebarText" align="right">1124.70</td></tr>
<tr><td class="sidebarText" align="left" >jms137</td><td class="sidebarText" align="right">1124.08</td></tr>
<tr><td class="sidebarText" align="left" >ssancho2</td><td class="sidebarText" align="right">1112.01</td></tr>
<tr><td class="sidebarText" align="left" >Slamin</td><td class="sidebarText" align="right">1103.67</td></tr>
<tr><td class="sidebarText" align="left" >Henry</td><td class="sidebarText" align="right">1102.58</td></tr>
<tr><td class="sidebarText" align="left" >adams</td><td class="sidebarText" align="right">1095.10</td></tr>
<tr><td class="sidebarText" align="left" >lanenal</td><td class="sidebarText" align="right">1090.85</td></tr>
<tr><td class="sidebarText" align="left" >sjelkjd</td><td class="sidebarText" align="right">1079.96</td></tr>
<tr><td class="sidebarText" align="left" >mics</td><td class="sidebarText" align="right">1073.28</td></tr>
<tr><td class="sidebarText" align="left" >Parchandri</td><td class="sidebarText" align="right">1048.13</td></tr>
<tr><td class="sidebarText" align="left" >Yarin</td><td class="sidebarText" align="right">1032.30</td></tr>
<tr><td class="sidebarText" align="left" >lars</td><td class="sidebarText" align="right">1027.26</td></tr>
<tr><td class="sidebarText" align="left" >pzhao</td><td class="sidebarText" align="right">995.62</td></tr>
<tr><td class="sidebarText" align="left" >Logan</td><td class="sidebarText" align="right">933.22</td></tr>
<tr><td class="sidebarText" align="left" >Cho</td><td class="sidebarText" align="right">915.21</td></tr>
<tr><td class="sidebarText" align="left" >polivic</td><td class="sidebarText" align="right">759.13</td></tr>
<tr><td class="sidebarText" align="left" >madking</td><td class="sidebarText" align="right">743.97</td></tr>
<tr><td class="sidebarText" align="left" >O_O</td><td class="sidebarText" align="right">740.45</td></tr>
<tr><td class="sidebarText" align="left" >indigo9</td><td class="sidebarText" align="right">739.16</td></tr>
<tr><td class="sidebarText" align="left" >qubits</td><td class="sidebarText" align="right">727.73</td></tr>
<tr><td class="sidebarText" align="left" >ChristopherH</td><td class="sidebarText" align="right">725.64</td></tr>
<tr><td class="sidebarText" align="left" >tjq</td><td class="sidebarText" align="right">721.47</td></tr>
<tr><td class="sidebarText" align="left" >antimatter</td><td class="sidebarText" align="right">719.10</td></tr>
<tr><td class="sidebarText" align="left" >jdmetz</td><td class="sidebarText" align="right">718.97</td></tr>
<tr><td class="sidebarText" align="left" >ragnabot</td><td class="sidebarText" align="right">713.33</td></tr>
<tr><td class="sidebarText" align="left" >moggy</td><td class="sidebarText" align="right">712.89</td></tr>
<tr><td class="sidebarText" align="left" >DjinnKahn</td><td class="sidebarText" align="right">712.53</td></tr>
<tr><td class="sidebarText" align="left" >jshute</td><td class="sidebarText" align="right">709.49</td></tr>
<tr><td class="sidebarText" align="left" >jvohome</td><td class="sidebarText" align="right">706.92</td></tr>
<tr><td class="sidebarText" align="left" >port6000</td><td class="sidebarText" align="right">702.14</td></tr>
<tr><td class="sidebarText" align="left" >PurpleBob</td><td class="sidebarText" align="right">700.58</td></tr>
<tr><td class="sidebarText" align="left" >solman</td><td class="sidebarText" align="right">700.04</td></tr>
<tr><td class="sidebarText" align="left" >toast</td><td class="sidebarText" align="right">698.61</td></tr>
<tr><td class="sidebarText" align="left" >Jiggly</td><td class="sidebarText" align="right">697.67</td></tr>
<tr><td class="sidebarText" align="left" >bokbok</td><td class="sidebarText" align="right">694.54</td></tr>
<tr><td class="sidebarText" align="left" >WhiteShadow</td><td class="sidebarText" align="right">694.53</td></tr>
<tr><td class="sidebarText" align="left" >doeth</td><td class="sidebarText" align="right">694.52</td></tr>
<tr><td class="sidebarText" align="left" >mlcastle</td><td class="sidebarText" align="right">694.50</td></tr>
<tr><td class="sidebarText" align="left" >TheOneSmiley</td><td class="sidebarText" align="right">694.41</td></tr>
<tr><td class="sidebarText" align="left" >b0b0b0b</td><td class="sidebarText" align="right">692.37</td></tr>
<tr><td class="sidebarText" align="left" >coshx</td><td class="sidebarText" align="right">692.24</td></tr>
<tr><td class="sidebarText" align="left" >RandySaint</td><td class="sidebarText" align="right">691.41</td></tr>
<tr><td class="sidebarText" align="left" >srowen</td><td class="sidebarText" align="right">690.92</td></tr>
<tr><td class="sidebarText" align="left" >prof</td><td class="sidebarText" align="right">688.66</td></tr>
<tr><td class="sidebarText" align="left" >Fluff</td><td class="sidebarText" align="right">687.68</td></tr>
<tr><td class="sidebarText" align="left" >Larry</td><td class="sidebarText" align="right">686.98</td></tr>
<tr><td class="sidebarText" align="left" >asundqui</td><td class="sidebarText" align="right">686.10</td></tr>
<tr><td class="sidebarText" align="left" >Abednego</td><td class="sidebarText" align="right">684.24</td></tr>
<tr><td class="sidebarText" align="left" >radeye</td><td class="sidebarText" align="right">682.54</td></tr>
<tr><td class="sidebarText" align="left" >ceturc</td><td class="sidebarText" align="right">678.49</td></tr>
<tr><td class="sidebarText" align="left" >seaniswise</td><td class="sidebarText" align="right">676.75</td></tr>
<tr><td class="sidebarText" align="left" >omasoud</td><td class="sidebarText" align="right">675.44</td></tr>
<tr><td class="sidebarText" align="left" >targo</td><td class="sidebarText" align="right">675.41</td></tr>
<tr><td class="sidebarText" align="left" >dmap</td><td class="sidebarText" align="right">674.52</td></tr>
<tr><td class="sidebarText" align="left" >msasha</td><td class="sidebarText" align="right">673.91</td></tr>
<tr><td class="sidebarText" align="left" >PaulJefferys</td><td class="sidebarText" align="right">673.57</td></tr>
<tr><td class="sidebarText" align="left" >tiki</td><td class="sidebarText" align="right">673.50</td></tr>
<tr><td class="sidebarText" align="left" >(OO)</td><td class="sidebarText" align="right">671.03</td></tr>
<tr><td class="sidebarText" align="left" >frane</td><td class="sidebarText" align="right">670.01</td></tr>
<tr><td class="sidebarText" align="left" >quadcap</td><td class="sidebarText" align="right">669.88</td></tr>
<tr><td class="sidebarText" align="left" >ded_guy</td><td class="sidebarText" align="right">667.10</td></tr>
<tr><td class="sidebarText" align="left" >abanik</td><td class="sidebarText" align="right">666.73</td></tr>
<tr><td class="sidebarText" align="left" >ColinMacLeod</td><td class="sidebarText" align="right">665.82</td></tr>
<tr><td class="sidebarText" align="left" >Wasyuu</td><td class="sidebarText" align="right">665.68</td></tr>
<tr><td class="sidebarText" align="left" >dirk28</td><td class="sidebarText" align="right">665.59</td></tr>
<tr><td class="sidebarText" align="left" >joeli</td><td class="sidebarText" align="right">663.54</td></tr>
<tr><td class="sidebarText" align="left" >jinxidoru</td><td class="sidebarText" align="right">662.71</td></tr>
<tr><td class="sidebarText" align="left" >spoonmijit</td><td class="sidebarText" align="right">662.66</td></tr>
<tr><td class="sidebarText" align="left" >merolish</td><td class="sidebarText" align="right">661.92</td></tr>
<tr><td class="sidebarText" align="left" >groovymother</td><td class="sidebarText" align="right">661.79</td></tr>
<tr><td class="sidebarText" align="left" >acki2003</td><td class="sidebarText" align="right">661.36</td></tr>
<tr><td class="sidebarText" align="left" >amigne</td><td class="sidebarText" align="right">661.35</td></tr>
<tr><td class="sidebarText" align="left" >turuthok</td><td class="sidebarText" align="right">660.40</td></tr>
<tr><td class="sidebarText" align="left" >UFP2161</td><td class="sidebarText" align="right">660.38</td></tr>
<tr><td class="sidebarText" align="left" >lkesteloot</td><td class="sidebarText" align="right">657.64</td></tr>
<tr><td class="sidebarText" align="left" >chogyonim</td><td class="sidebarText" align="right">657.18</td></tr>
<tr><td class="sidebarText" align="left" >johnmoe</td><td class="sidebarText" align="right">657.08</td></tr>
<tr><td class="sidebarText" align="left" >ploh</td><td class="sidebarText" align="right">656.49</td></tr>
<tr><td class="sidebarText" align="left" >connect4</td><td class="sidebarText" align="right">655.47</td></tr>
<tr><td class="sidebarText" align="left" >alexcchan</td><td class="sidebarText" align="right">655.44</td></tr>
<tr><td class="sidebarText" align="left" >dmj</td><td class="sidebarText" align="right">654.86</td></tr>
<tr><td class="sidebarText" align="left" >cruizza</td><td class="sidebarText" align="right">653.91</td></tr>
<tr><td class="sidebarText" align="left" >space</td><td class="sidebarText" align="right">652.58</td></tr>
<tr><td class="sidebarText" align="left" >redman</td><td class="sidebarText" align="right">651.64</td></tr>
<tr><td class="sidebarText" align="left" >centipede80</td><td class="sidebarText" align="right">650.20</td></tr>
<tr><td class="sidebarText" align="left" >BradAustin</td><td class="sidebarText" align="right">646.98</td></tr>
<tr><td class="sidebarText" align="left" >Nexius</td><td class="sidebarText" align="right">645.51</td></tr>
<tr><td class="sidebarText" align="left" >BryanChen</td><td class="sidebarText" align="right">645.31</td></tr>
<tr><td class="sidebarText" align="left" >abductor</td><td class="sidebarText" align="right">643.52</td></tr>
<tr><td class="sidebarText" align="left" >esessoms</td><td class="sidebarText" align="right">643.21</td></tr>
<tr><td class="sidebarText" align="left" >bladerunner</td><td class="sidebarText" align="right">642.09</td></tr>
<tr><td class="sidebarText" align="left" >sburoff</td><td class="sidebarText" align="right">639.11</td></tr>
<tr><td class="sidebarText" align="left" >Yi_Zhang</td><td class="sidebarText" align="right">638.50</td></tr>
<tr><td class="sidebarText" align="left" >Koroibos</td><td class="sidebarText" align="right">638.10</td></tr>
<tr><td class="sidebarText" align="left" >IElt</td><td class="sidebarText" align="right">636.02</td></tr>
<tr><td class="sidebarText" align="left" >vivek_vedagiri</td><td class="sidebarText" align="right">634.33</td></tr>
<tr><td class="sidebarText" align="left" >yaniv</td><td class="sidebarText" align="right">633.59</td></tr>
<tr><td class="sidebarText" align="left" >quangkhaiv</td><td class="sidebarText" align="right">632.34</td></tr>
<tr><td class="sidebarText" align="left" >mmsa</td><td class="sidebarText" align="right">632.20</td></tr>
<tr><td class="sidebarText" align="left" >axlrosen</td><td class="sidebarText" align="right">632.06</td></tr>
<tr><td class="sidebarText" align="left" >p1nbaLL</td><td class="sidebarText" align="right">631.06</td></tr>
<tr><td class="sidebarText" align="left" >Fred[dy]</td><td class="sidebarText" align="right">630.64</td></tr>
<tr><td class="sidebarText" align="left" >saagar734</td><td class="sidebarText" align="right">627.04</td></tr>
<tr><td class="sidebarText" align="left" >cgu</td><td class="sidebarText" align="right">626.21</td></tr>
<tr><td class="sidebarText" align="left" >xb95</td><td class="sidebarText" align="right">625.72</td></tr>
<tr><td class="sidebarText" align="left" >zorg</td><td class="sidebarText" align="right">625.27</td></tr>
<tr><td class="sidebarText" align="left" >gizzywump</td><td class="sidebarText" align="right">624.91</td></tr>
<tr><td class="sidebarText" align="left" >dzadza</td><td class="sidebarText" align="right">620.96</td></tr>
<tr><td class="sidebarText" align="left" >sliu</td><td class="sidebarText" align="right">620.81</td></tr>
<tr><td class="sidebarText" align="left" >HardCoder</td><td class="sidebarText" align="right">620.60</td></tr>
<tr><td class="sidebarText" align="left" >netspade</td><td class="sidebarText" align="right">619.14</td></tr>
<tr><td class="sidebarText" align="left" >Mosher</td><td class="sidebarText" align="right">617.68</td></tr>
<tr><td class="sidebarText" align="left" >harisuthan</td><td class="sidebarText" align="right">617.14</td></tr>
<tr><td class="sidebarText" align="left" >alienbra</td><td class="sidebarText" align="right">616.52</td></tr>
<tr><td class="sidebarText" align="left" >Tautology</td><td class="sidebarText" align="right">616.25</td></tr>
<tr><td class="sidebarText" align="left" >ardiankp</td><td class="sidebarText" align="right">615.55</td></tr>
<tr><td class="sidebarText" align="left" >kyky</td><td class="sidebarText" align="right">613.77</td></tr>
<tr><td class="sidebarText" align="left" >ckirmse</td><td class="sidebarText" align="right">611.39</td></tr>
<tr><td class="sidebarText" align="left" >Rustyoldman</td><td class="sidebarText" align="right">610.61</td></tr>
<tr><td class="sidebarText" align="left" >stur0053</td><td class="sidebarText" align="right">608.22</td></tr>
<tr><td class="sidebarText" align="left" >kikuni</td><td class="sidebarText" align="right">608.15</td></tr>
<tr><td class="sidebarText" align="left" >db</td><td class="sidebarText" align="right">606.19</td></tr>
<tr><td class="sidebarText" align="left" >batty</td><td class="sidebarText" align="right">606.07</td></tr>
<tr><td class="sidebarText" align="left" >bquinlan</td><td class="sidebarText" align="right">603.74</td></tr>
<tr><td class="sidebarText" align="left" >rashok</td><td class="sidebarText" align="right">601.53</td></tr>
<tr><td class="sidebarText" align="left" >paltherr</td><td class="sidebarText" align="right">601.08</td></tr>
<tr><td class="sidebarText" align="left" >wleite</td><td class="sidebarText" align="right">600.10</td></tr>
<tr><td class="sidebarText" align="left" >dukeola</td><td class="sidebarText" align="right">597.89</td></tr>
<tr><td class="sidebarText" align="left" >Andrew_Lazarev</td><td class="sidebarText" align="right">597.71</td></tr>
<tr><td class="sidebarText" align="left" >coderlemming</td><td class="sidebarText" align="right">597.50</td></tr>
<tr><td class="sidebarText" align="left" >Humbug</td><td class="sidebarText" align="right">597.41</td></tr>
<tr><td class="sidebarText" align="left" >ktong</td><td class="sidebarText" align="right">597.01</td></tr>
<tr><td class="sidebarText" align="left" >csernak</td><td class="sidebarText" align="right">593.94</td></tr>
<tr><td class="sidebarText" align="left" >rotoZOOM</td><td class="sidebarText" align="right">593.77</td></tr>
<tr><td class="sidebarText" align="left" >onnellinen</td><td class="sidebarText" align="right">592.59</td></tr>
<tr><td class="sidebarText" align="left" >ChaiBot</td><td class="sidebarText" align="right">592.38</td></tr>
<tr><td class="sidebarText" align="left" >mickle</td><td class="sidebarText" align="right">591.50</td></tr>
<tr><td class="sidebarText" align="left" >code420</td><td class="sidebarText" align="right">591.17</td></tr>
<tr><td class="sidebarText" align="left" >arun</td><td class="sidebarText" align="right">590.46</td></tr>
<tr><td class="sidebarText" align="left" >ValD</td><td class="sidebarText" align="right">585.10</td></tr>
<tr><td class="sidebarText" align="left" >Greyve</td><td class="sidebarText" align="right">582.94</td></tr>
<tr><td class="sidebarText" align="left" >cbthiess</td><td class="sidebarText" align="right">581.75</td></tr>
<tr><td class="sidebarText" align="left" >snok</td><td class="sidebarText" align="right">580.99</td></tr>
<tr><td class="sidebarText" align="left" >gustn</td><td class="sidebarText" align="right">580.66</td></tr>
<tr><td class="sidebarText" align="left" >GamePimp</td><td class="sidebarText" align="right">578.94</td></tr>
<tr><td class="sidebarText" align="left" >guidox</td><td class="sidebarText" align="right">578.21</td></tr>
<tr><td class="sidebarText" align="left" >sargentm</td><td class="sidebarText" align="right">574.42</td></tr>
<tr><td class="sidebarText" align="left" >Corrinado</td><td class="sidebarText" align="right">574.32</td></tr>
<tr><td class="sidebarText" align="left" >leadhyena_inran</td><td class="sidebarText" align="right">572.95</td></tr>
<tr><td class="sidebarText" align="left" >ves</td><td class="sidebarText" align="right">565.63</td></tr>
<tr><td class="sidebarText" align="left" >wisdompoet</td><td class="sidebarText" align="right">565.16</td></tr>
<tr><td class="sidebarText" align="left" >MPhk</td><td class="sidebarText" align="right">564.23</td></tr>
<tr><td class="sidebarText" align="left" >DestyNova</td><td class="sidebarText" align="right">563.14</td></tr>
<tr><td class="sidebarText" align="left" >Chang1</td><td class="sidebarText" align="right">563.13</td></tr>
<tr><td class="sidebarText" align="left" >nick_19</td><td class="sidebarText" align="right">559.21</td></tr>
<tr><td class="sidebarText" align="left" >sredniv</td><td class="sidebarText" align="right">559.09</td></tr>
<tr><td class="sidebarText" align="left" >jackh</td><td class="sidebarText" align="right">558.99</td></tr>
<tr><td class="sidebarText" align="left" >kaiser84</td><td class="sidebarText" align="right">556.48</td></tr>
<tr><td class="sidebarText" align="left" >jcolosi</td><td class="sidebarText" align="right">552.30</td></tr>
<tr><td class="sidebarText" align="left" >userundefined</td><td class="sidebarText" align="right">552.07</td></tr>
<tr><td class="sidebarText" align="left" >vv</td><td class="sidebarText" align="right">549.91</td></tr>
<tr><td class="sidebarText" align="left" >DEathkNIghtS</td><td class="sidebarText" align="right">545.58</td></tr>
<tr><td class="sidebarText" align="left" >alanm</td><td class="sidebarText" align="right">544.78</td></tr>
<tr><td class="sidebarText" align="left" >Sparrow-</td><td class="sidebarText" align="right">544.42</td></tr>
<tr><td class="sidebarText" align="left" >skeeve</td><td class="sidebarText" align="right">542.90</td></tr>
<tr><td class="sidebarText" align="left" >mas13081</td><td class="sidebarText" align="right">542.23</td></tr>
<tr><td class="sidebarText" align="left" >wuzika</td><td class="sidebarText" align="right">539.22</td></tr>
<tr><td class="sidebarText" align="left" >axiom</td><td class="sidebarText" align="right">534.95</td></tr>
<tr><td class="sidebarText" align="left" >AleaActaEst</td><td class="sidebarText" align="right">534.35</td></tr>
<tr><td class="sidebarText" align="left" >aksonov</td><td class="sidebarText" align="right">532.81</td></tr>
<tr><td class="sidebarText" align="left" >Tomson</td><td class="sidebarText" align="right">529.49</td></tr>
<tr><td class="sidebarText" align="left" >boldters</td><td class="sidebarText" align="right">529.11</td></tr>
<tr><td class="sidebarText" align="left" >zhliu</td><td class="sidebarText" align="right">528.99</td></tr>
<tr><td class="sidebarText" align="left" >wcai</td><td class="sidebarText" align="right">528.86</td></tr>
<tr><td class="sidebarText" align="left" >mcbevin</td><td class="sidebarText" align="right">528.76</td></tr>
<tr><td class="sidebarText" align="left" >sabu</td><td class="sidebarText" align="right">528.50</td></tr>
<tr><td class="sidebarText" align="left" >tc</td><td class="sidebarText" align="right">527.53</td></tr>
<tr><td class="sidebarText" align="left" >Rud0lf</td><td class="sidebarText" align="right">519.10</td></tr>
<tr><td class="sidebarText" align="left" >amorosov</td><td class="sidebarText" align="right">517.41</td></tr>
<tr><td class="sidebarText" align="left" >flozell</td><td class="sidebarText" align="right">513.62</td></tr>
<tr><td class="sidebarText" align="left" >peru</td><td class="sidebarText" align="right">513.07</td></tr>



                     </table>

                        </font></p>

                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
                              </font></p>
                        </td>
                     </tr>
                  </table>
                  </div>
               </td>
            </tr>
         </table>
      </td>
   </tr>
</table>
</div>
<p><div class=footer>
<small> &copy;2003 Google -
<a href="http://www.google.com/">Home</a> -
<a href="http://www.google.com/about.html">All About Google</a> -
<a href="/tc?module=Static&d1=about&d2=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a>
</small>
</p>
</div>
</body>
</html>