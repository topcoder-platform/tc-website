<%@ page contentType="text/html; charset=ISO-8859-1" %>
<%@ page import="com.topcoder.web.privatelabel.Constants,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<jsp:usebean id="regInfo" class="com.topcoder.web.privatelabel.model.SimpleRegInfo" scope="session" />
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
<img width="276" height="110" src="http://www.google.com/codejam/codejam_logo.gif" alt="Google Code Jam logo">

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
                        
                  
                      <table class=googleFrame bgcolor="#ffffff" cellpadding=5 cellspacing=2 border=0 width="350">
                        <tr>
                           <td class="advancersTitle" align="left" colspan="4">Qualification Round</td>
                        </tr>
<tr><td class="google_round_id" align="left" width="40%">SnapDragon</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">1187.65</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Jary</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">1178.61</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tomek</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">1116.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">along</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">1047.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cruizza</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">1017.66</td></tr>
<tr><td class="google_round_id" align="left" width="40%">frane</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">965.04</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bstanescu</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">956.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">aneubeck</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">873.29</td></tr>
<tr><td class="google_round_id" align="left" width="40%">moggy</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">864.04</td></tr>
<tr><td class="google_round_id" align="left" width="40%">chogyonim</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">862.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">zorg</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">850.56</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Henry</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">848.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">toast</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">838.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">solman</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">804.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ellsquared</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">775.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">code420</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">767.25</td></tr>
<tr><td class="google_round_id" align="left" width="40%">alanm</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">754.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Darrell_L_77</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">711.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Tomson</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">701.05</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Greyve</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">694.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">polivic</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">657.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">esessoms</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">648.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">fiveEasyPieces</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">236.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">PurpleBob</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">233.38</td></tr>
<tr><td class="google_round_id" align="left" width="40%">stanojevic</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">229.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Doc_NH</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">226.15</td></tr>
<tr><td class="google_round_id" align="left" width="40%">spoonmijit</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">224.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mas13081</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">224.63</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Logan</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">223.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jburnim</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">222.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">msasha</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">222.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ragnabot</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">219.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">BenTheus</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">218.29</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Frazer</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">216.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">digitaLogic8</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">215.00</td></tr>
<tr><td class="google_round_id" align="left" width="40%">onnellinen</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">212.72</td></tr>
<tr><td class="google_round_id" align="left" width="40%">john_doe</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">212.55</td></tr>
<tr><td class="google_round_id" align="left" width="40%">harshatcse</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">212.47</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AbusiveWombat</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">209.61</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ves</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">208.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">peru</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">208.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">yaarivan</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">207.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dugFor</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">206.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">firedragon</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">205.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Illor</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">204.57</td></tr>
<tr><td class="google_round_id" align="left" width="40%">stur0053</td><td class="google_round_id" align="left" width="20%">Qualification Set 1</td><td class="google_round_id" align="left" width="20%">203.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ChristopherH</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">1126.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Wernie</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">1107.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">schveiguy</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">1062.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">snewman</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">1029.08</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Ruberik</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">1019.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">hvdijk</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">991.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">abductor</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">974.78</td></tr>
<tr><td class="google_round_id" align="left" width="40%">adic</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">963.79</td></tr>
<tr><td class="google_round_id" align="left" width="40%">hilfiger</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">937.29</td></tr>
<tr><td class="google_round_id" align="left" width="40%">davitf</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">908.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lars</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">897.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">skanthak</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">857.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">WhiteShadow</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">791.89</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Tree</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">725.93</td></tr>
<tr><td class="google_round_id" align="left" width="40%">axchma</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">699.47</td></tr>
<tr><td class="google_round_id" align="left" width="40%">www</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">639.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cjoa</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">594.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wonder-worker</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">543.43</td></tr>
<tr><td class="google_round_id" align="left" width="40%">johnsickbock</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">535.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">NGBronson</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">241.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">DJ-Katy</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">237.44</td></tr>
<tr><td class="google_round_id" align="left" width="40%">pearl</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">237.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">userundefined</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">236.20</td></tr>
<tr><td class="google_round_id" align="left" width="40%">alienbra</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">231.21</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rbadaro</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">228.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">saagar734</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">228.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">futo</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">228.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">duner</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">224.39</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sinaddcos</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">222.18</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wanchan</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">221.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">reiners</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">220.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dmks</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">220.49</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AleaActaEst</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">220.36</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Liguo</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">219.92</td></tr>
<tr><td class="google_round_id" align="left" width="40%">TeLa</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">219.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sohdjinn</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">219.49</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kiveol</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">217.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Tautology</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">216.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">prof</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">215.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">SmileyGirl256</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">214.95</td></tr>
<tr><td class="google_round_id" align="left" width="40%">p1nbaLL</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">213.45</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kstroke</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">213.31</td></tr>
<tr><td class="google_round_id" align="left" width="40%">nacul</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">212.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">neweinstein</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">211.95</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rcrdev</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">210.86</td></tr>
<tr><td class="google_round_id" align="left" width="40%">xb95</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">206.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">pagat</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">206.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jleejleejlee</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">203.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kliu_cali</td><td class="google_round_id" align="left" width="20%">Qualification Set 2</td><td class="google_round_id" align="left" width="20%">201.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vorthys</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">1103.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">amorosov</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">1004.40</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dgarthur</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">984.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Yarin</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">954.96</td></tr>
<tr><td class="google_round_id" align="left" width="40%">popatlal</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">937.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mlcastle</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">935.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ante</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">912.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">DEathkNIghtS</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">833.78</td></tr>
<tr><td class="google_round_id" align="left" width="40%">madking</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">814.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">UFP2161</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">781.43</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Alexandre</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">777.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">PMH</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">721.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mathijs</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">696.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gepa</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">658.51</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jcolosi</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">656.86</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mckavity</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">631.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">130358</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">630.80</td></tr>
<tr><td class="google_round_id" align="left" width="40%">danlief</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">630.56</td></tr>
<tr><td class="google_round_id" align="left" width="40%">nike</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">630.00</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jaivasanth</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">629.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">abiczo</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">626.55</td></tr>
<tr><td class="google_round_id" align="left" width="40%">raquib</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">600.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">harendra</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">593.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ChaiBot</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">591.44</td></tr>
<tr><td class="google_round_id" align="left" width="40%">magnum</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">587.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">visnup</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">480.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ktong</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">470.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">PacerGuy</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">441.08</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jvohome</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">427.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lanenal</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">419.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ussr</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">410.56</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lakata</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">408.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mathgodleo</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">222.91</td></tr>
<tr><td class="google_round_id" align="left" width="40%">quadcap</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">219.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sh_maestro</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">215.18</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Fluff</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">210.62</td></tr>
<tr><td class="google_round_id" align="left" width="40%">elron</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">206.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">DestyNova</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">206.16</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jpowell</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">204.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">webpaul</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">204.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mthreat</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">203.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">boose</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">198.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">stoend</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">196.29</td></tr>
<tr><td class="google_round_id" align="left" width="40%">leadhyena_inran</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">195.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mmsa</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">192.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kip104</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">190.93</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sredniv</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">185.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cgu</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">185.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cnkelly</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">178.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">quasar</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">178.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cflichel</td><td class="google_round_id" align="left" width="20%">Qualification Set 3</td><td class="google_round_id" align="left" width="20%">175.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sjelkjd</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">980.95</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jonmac</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">963.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bogklug</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">912.24</td></tr>
<tr><td class="google_round_id" align="left" width="40%">princeofchaos</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">875.82</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bsdude</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">840.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">szd713</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">829.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">superjoel</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">800.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">radeye</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">737.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Pan</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">713.65</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Klinck</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">678.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Jiggly</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">665.64</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lovro</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">664.44</td></tr>
<tr><td class="google_round_id" align="left" width="40%">zy</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">616.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">turuthok</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">598.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dzadza</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">581.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ValD</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">424.08</td></tr>
<tr><td class="google_round_id" align="left" width="40%">pcmartini</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">238.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mortijingle</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">234.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tc</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">231.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">IODonnell</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">221.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">InsaneParadox</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">219.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">BjarkeEbert</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">218.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sburoff</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">213.92</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bigfella</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">210.45</td></tr>
<tr><td class="google_round_id" align="left" width="40%">betelgeuse</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">202.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">merolish</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">201.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">weberchen</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">201.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jrz</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">199.01</td></tr>
<tr><td class="google_round_id" align="left" width="40%">azstuff</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">196.64</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Lizard</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">194.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">space</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">187.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">yacko</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">186.38</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sukumar05</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">182.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">quangkhaiv</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">182.18</td></tr>
<tr><td class="google_round_id" align="left" width="40%">telamus</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">182.00</td></tr>
<tr><td class="google_round_id" align="left" width="40%">NSantos</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">181.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tomi</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">180.92</td></tr>
<tr><td class="google_round_id" align="left" width="40%">shechter</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">177.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">feahmed</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">176.40</td></tr>
<tr><td class="google_round_id" align="left" width="40%">uwneal</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">174.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">swietlik</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">174.40</td></tr>
<tr><td class="google_round_id" align="left" width="40%">neeeeeep</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">173.21</td></tr>
<tr><td class="google_round_id" align="left" width="40%">donm</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">172.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">giginim</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">172.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">casual_cracker</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">170.23</td></tr>
<tr><td class="google_round_id" align="left" width="40%">roggeboy</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">167.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Mike_MS</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">165.34</td></tr>
<tr><td class="google_round_id" align="left" width="40%">oog</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">163.70</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Cho</td><td class="google_round_id" align="left" width="20%">Qualification Set 4</td><td class="google_round_id" align="left" width="20%">162.97</td></tr>
<tr><td class="google_round_id" align="left" width="40%">DrewHudson</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">1018.38</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Parchandri</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">918.43</td></tr>
<tr><td class="google_round_id" align="left" width="40%">reid</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">916.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dangelo</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">858.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kyotov</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">857.65</td></tr>
<tr><td class="google_round_id" align="left" width="40%">nicka81</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">848.57</td></tr>
<tr><td class="google_round_id" align="left" width="40%">legakis</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">803.96</td></tr>
<tr><td class="google_round_id" align="left" width="40%">aksonov</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">787.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kyky</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">774.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">milhouse</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">730.09</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mikera7</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">711.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">DjinnKahn</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">686.43</td></tr>
<tr><td class="google_round_id" align="left" width="40%">qubits</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">678.25</td></tr>
<tr><td class="google_round_id" align="left" width="40%">pzhao</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">662.23</td></tr>
<tr><td class="google_round_id" align="left" width="40%">zhliu</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">653.68</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jinxidoru</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">645.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">BryanChen</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">636.63</td></tr>
<tr><td class="google_round_id" align="left" width="40%">connect4</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">622.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rotoZOOM</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">613.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">shuvovse</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">608.51</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sinden</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">584.86</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tiki</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">545.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Joe</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">528.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Mr_Brook</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">510.00</td></tr>
<tr><td class="google_round_id" align="left" width="40%">amigne</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">451.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jasonjackson</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">441.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jbaiocchi</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">412.52</td></tr>
<tr><td class="google_round_id" align="left" width="40%">fritz</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">373.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">derelikt</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">220.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">TheFaxman</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">207.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">derek</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">193.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">haha</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">190.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">NickolausP</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">189.43</td></tr>
<tr><td class="google_round_id" align="left" width="40%">snok</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">182.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jdmetz</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">181.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">markjam</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">178.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rsteinberger</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">174.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dweebo</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">169.34</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Fred[dy]</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">167.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">helloall</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">163.45</td></tr>
<tr><td class="google_round_id" align="left" width="40%">arun</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">161.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Humbug</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">161.45</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jawnty</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">160.91</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Kukulza</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">159.23</td></tr>
<tr><td class="google_round_id" align="left" width="40%">iamignorant</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">154.80</td></tr>
<tr><td class="google_round_id" align="left" width="40%">boldters</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">150.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">unclejed</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">150.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">byteCoder</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">149.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AndrewSmith</td><td class="google_round_id" align="left" width="20%">Qualification Set 5</td><td class="google_round_id" align="left" width="20%">149.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AlexandraRU</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">1107.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bladerunner</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">1064.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jcd1</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">1037.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Slamin</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">1032.64</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mascot</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">961.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Rustyoldman</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">951.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ntrhieu</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">944.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dvickrey</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">844.84</td></tr>
<tr><td class="google_round_id" align="left" width="40%">topodisc</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">841.45</td></tr>
<tr><td class="google_round_id" align="left" width="40%">smloh</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">841.34</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kikuni</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">810.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Maris</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">788.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">amitc</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">787.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mics</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">786.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Wasyuu</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">771.78</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gladius</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">761.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wisdompoet</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">744.85</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Yi_Zhang</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">733.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">inrm2</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">691.58</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vivek_vedagiri</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">683.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lkesteloot</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">680.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Andrew_Lazarev</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">674.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">yaniv</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">670.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gevak</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">621.62</td></tr>
<tr><td class="google_round_id" align="left" width="40%">csernak</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">596.09</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Vladko</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">559.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ckirmse</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">417.53</td></tr>
<tr><td class="google_round_id" align="left" width="40%">MPhk</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">239.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">igorsk</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">234.96</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Koroibos</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">234.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">WingedCat</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">233.63</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gustn</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">233.07</td></tr>
<tr><td class="google_round_id" align="left" width="40%">HardCoder</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">232.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">btspider</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">232.25</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Karshikinpa</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">230.97</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rodif</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">225.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rasactive</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">224.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">achurch</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">224.25</td></tr>
<tr><td class="google_round_id" align="left" width="40%">donniet</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">223.64</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Gandi</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">223.59</td></tr>
<tr><td class="google_round_id" align="left" width="40%">slake</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">221.63</td></tr>
<tr><td class="google_round_id" align="left" width="40%">MadMoose</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">219.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lemming</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">217.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">roshweb</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">217.57</td></tr>
<tr><td class="google_round_id" align="left" width="40%">BlackCloud</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">215.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">GabeJones</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">215.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Assurnasir</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">214.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Wecksell</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">212.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">CaptainJester</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">212.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mlch</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">211.05</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ded_guy</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">209.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dlord111</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">209.03</td></tr>
<tr><td class="google_round_id" align="left" width="40%">axlrosen</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">205.08</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Corrinado</td><td class="google_round_id" align="left" width="20%">Qualification Set 6</td><td class="google_round_id" align="left" width="20%">205.04</td></tr>
<tr><td class="google_round_id" align="left" width="40%">asundqui</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">1048.92</td></tr>
<tr><td class="google_round_id" align="left" width="40%">KenVogel</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">1043.53</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jms137</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">998.00</td></tr>
<tr><td class="google_round_id" align="left" width="40%">WishingBone</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">957.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Mike Mirzayanov</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">936.46</td></tr>
<tr><td class="google_round_id" align="left" width="40%">evd</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">931.62</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Ukraine</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">892.24</td></tr>
<tr><td class="google_round_id" align="left" width="40%">targo</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">794.03</td></tr>
<tr><td class="google_round_id" align="left" width="40%">saat</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">738.51</td></tr>
<tr><td class="google_round_id" align="left" width="40%">eug</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">733.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">eldering</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">724.01</td></tr>
<tr><td class="google_round_id" align="left" width="40%">oldbig</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">695.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">emovla</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">674.34</td></tr>
<tr><td class="google_round_id" align="left" width="40%">db</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">627.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Mosher</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">607.25</td></tr>
<tr><td class="google_round_id" align="left" width="40%">johnmoe</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">605.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ColinMacLeod</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">244.73</td></tr>
<tr><td class="google_round_id" align="left" width="40%">batty</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">240.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jfreyss</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">236.20</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Olorin</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">234.49</td></tr>
<tr><td class="google_round_id" align="left" width="40%">amirshim</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">234.29</td></tr>
<tr><td class="google_round_id" align="left" width="40%">port6000</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">231.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">JayTea</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">230.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">coderlemming</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">228.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">nick_19</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">228.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sliu</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">228.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">chungfat</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">227.61</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Walbert</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">227.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sargentm</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">226.96</td></tr>
<tr><td class="google_round_id" align="left" width="40%">groovymother</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">225.97</td></tr>
<tr><td class="google_round_id" align="left" width="40%">phark4evr</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">225.95</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dimer0</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">224.18</td></tr>
<tr><td class="google_round_id" align="left" width="40%">frenetic</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">222.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dpecora</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">222.05</td></tr>
<tr><td class="google_round_id" align="left" width="40%">hgliebe</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">217.20</td></tr>
<tr><td class="google_round_id" align="left" width="40%">skeeve</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">216.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">zsacul</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">215.12</td></tr>
<tr><td class="google_round_id" align="left" width="40%">joely</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">214.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">abheek</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">213.80</td></tr>
<tr><td class="google_round_id" align="left" width="40%">netspade</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">213.16</td></tr>
<tr><td class="google_round_id" align="left" width="40%">davemssavage</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">211.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cyanide</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">210.21</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Scorpion1976</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">209.35</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Holgrave</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">206.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bquinlan</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">206.66</td></tr>
<tr><td class="google_round_id" align="left" width="40%">nicksim</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">206.57</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gizzywump</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">206.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vitaly.kiruta</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">206.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vlado</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">205.56</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mcbevin</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">204.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">cbthiess</td><td class="google_round_id" align="left" width="20%">Qualification Set 7</td><td class="google_round_id" align="left" width="20%">201.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bmerry</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">1014.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">po</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">971.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">doeth</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">949.65</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gunnark</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">880.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">centipede80</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">806.75</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Modulator</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">798.72</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ealf</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">791.70</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kaiser84</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">790.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jshute</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">774.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mvkazit</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">771.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">redman</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">719.50</td></tr>
<tr><td class="google_round_id" align="left" width="40%">abanik</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">685.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">indigo9</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">666.96</td></tr>
<tr><td class="google_round_id" align="left" width="40%">O_O</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">644.80</td></tr>
<tr><td class="google_round_id" align="left" width="40%">TheOneSmiley</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">642.07</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mugwumpj</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">637.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">PeskyGnat</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">625.47</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Qythyx</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">618.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">agl</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">613.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">alena</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">602.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ahoenig</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">594.90</td></tr>
<tr><td class="google_round_id" align="left" width="40%">GamePimp</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">584.24</td></tr>
<tr><td class="google_round_id" align="left" width="40%">guru_cyp</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">495.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">assembler</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">477.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rvcoder</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">447.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">pohl12</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">410.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">minkov</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">401.97</td></tr>
<tr><td class="google_round_id" align="left" width="40%">willamowius</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">386.48</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jacklai</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">222.47</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kats</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">222.39</td></tr>
<tr><td class="google_round_id" align="left" width="40%">srowen</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">220.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mindloss</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">212.93</td></tr>
<tr><td class="google_round_id" align="left" width="40%">acki2003</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">212.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Eeyore</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">205.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AmosYang</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">202.24</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Dumitru</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">199.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Revenger</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">198.60</td></tr>
<tr><td class="google_round_id" align="left" width="40%">thesack</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">197.53</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Composure1</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">196.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">colder</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">194.78</td></tr>
<tr><td class="google_round_id" align="left" width="40%">k_m</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">194.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">s_senthil_kumar</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">194.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">chandraka</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">193.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jackh</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">184.62</td></tr>
<tr><td class="google_round_id" align="left" width="40%">john7331</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">184.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ironcamel</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">181.09</td></tr>
<tr><td class="google_round_id" align="left" width="40%">RandySaint</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">179.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dr_burrito</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">178.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vv</td><td class="google_round_id" align="left" width="20%">Qualification Set 8</td><td class="google_round_id" align="left" width="20%">177.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">TekGoNos</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">1163.16</td></tr>
<tr><td class="google_round_id" align="left" width="40%">LunaticFringe</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">1112.20</td></tr>
<tr><td class="google_round_id" align="left" width="40%">RunningWild</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">1035.87</td></tr>
<tr><td class="google_round_id" align="left" width="40%">thooot</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">976.99</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ardiankp</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">970.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">firefox</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">914.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ploh</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">912.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">venco</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">911.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">benetin</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">863.81</td></tr>
<tr><td class="google_round_id" align="left" width="40%">IElt</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">859.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dark_lord</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">857.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dmj</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">846.33</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sabu</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">831.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mickle</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">809.70</td></tr>
<tr><td class="google_round_id" align="left" width="40%">alexcchan</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">787.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Jumping-John</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">783.71</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wleite</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">770.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jochang</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">746.95</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Spike</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">688.76</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dukeola</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">664.40</td></tr>
<tr><td class="google_round_id" align="left" width="40%">PaulJefferys</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">644.66</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sandeepgupta</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">485.18</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dmap</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">483.83</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tungwaiyip</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">465.91</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rgrig</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">405.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">incandenza</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">235.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">aussie</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">234.72</td></tr>
<tr><td class="google_round_id" align="left" width="40%">BradAustin</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">225.84</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Abednego</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">219.56</td></tr>
<tr><td class="google_round_id" align="left" width="40%">arosca</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">219.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">[UoM]Icenine</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">214.66</td></tr>
<tr><td class="google_round_id" align="left" width="40%">mossop</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">210.39</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gaborka2</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">208.59</td></tr>
<tr><td class="google_round_id" align="left" width="40%">bokbok</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">208.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">FrodoB</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">205.97</td></tr>
<tr><td class="google_round_id" align="left" width="40%">adams</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">204.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">D0SBoots</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">201.51</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jeff_wegher</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">201.26</td></tr>
<tr><td class="google_round_id" align="left" width="40%">maa_t</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">198.70</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tyrithe</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">195.01</td></tr>
<tr><td class="google_round_id" align="left" width="40%">alosix</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">190.15</td></tr>
<tr><td class="google_round_id" align="left" width="40%">FD</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">189.02</td></tr>
<tr><td class="google_round_id" align="left" width="40%">kresho</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">188.49</td></tr>
<tr><td class="google_round_id" align="left" width="40%">apokrif</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">186.28</td></tr>
<tr><td class="google_round_id" align="left" width="40%">harryliu</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">185.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Blytzstryke</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">182.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Sparrow-</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">179.08</td></tr>
<tr><td class="google_round_id" align="left" width="40%">biaconho</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">176.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wcai</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">168.60</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dotosu</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">167.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">sasulzer</td><td class="google_round_id" align="left" width="20%">Qualification Set 9</td><td class="google_round_id" align="left" width="20%">164.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">antimatter</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">1133.51</td></tr>
<tr><td class="google_round_id" align="left" width="40%">tjq</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">1110.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Jan Kuipers</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">1032.36</td></tr>
<tr><td class="google_round_id" align="left" width="40%">AdrianKuegel</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">917.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ZorbaTHut</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">866.93</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Larry</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">841.74</td></tr>
<tr><td class="google_round_id" align="left" width="40%">seaniswise</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">841.64</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Wasteland</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">839.31</td></tr>
<tr><td class="google_round_id" align="left" width="40%">puzzlehacker</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">767.16</td></tr>
<tr><td class="google_round_id" align="left" width="40%">drsammyb</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">732.27</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ccooper</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">713.32</td></tr>
<tr><td class="google_round_id" align="left" width="40%">coshx</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">701.67</td></tr>
<tr><td class="google_round_id" align="left" width="40%">neal_googl</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">698.23</td></tr>
<tr><td class="google_round_id" align="left" width="40%">RobertNix</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">689.59</td></tr>
<tr><td class="google_round_id" align="left" width="40%">leibniz</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">672.63</td></tr>
<tr><td class="google_round_id" align="left" width="40%">jimmy</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">669.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">axiom</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">661.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">aaaaaaa14</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">660.01</td></tr>
<tr><td class="google_round_id" align="left" width="40%">guidox</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">649.05</td></tr>
<tr><td class="google_round_id" align="left" width="40%">_u0043_u0042</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">648.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">(OO)</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">623.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ceturc</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">623.19</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Razafishaha</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">622.14</td></tr>
<tr><td class="google_round_id" align="left" width="40%">hw_Tim</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">618.98</td></tr>
<tr><td class="google_round_id" align="left" width="40%">harisuthan</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">618.77</td></tr>
<tr><td class="google_round_id" align="left" width="40%">flozell</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">616.42</td></tr>
<tr><td class="google_round_id" align="left" width="40%">dirk28</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">611.72</td></tr>
<tr><td class="google_round_id" align="left" width="40%">paltherr</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">601.10</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ssancho2</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">594.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">omasoud</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">593.50</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Chang1</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">520.22</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Nexius</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">478.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">joeli</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">455.54</td></tr>
<tr><td class="google_round_id" align="left" width="40%">ragerules</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">382.34</td></tr>
<tr><td class="google_round_id" align="left" width="40%">FuzzyOmar</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">363.93</td></tr>
<tr><td class="google_round_id" align="left" width="40%">xianguangli</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">211.70</td></tr>
<tr><td class="google_round_id" align="left" width="40%">b0b0b0b</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">204.37</td></tr>
<tr><td class="google_round_id" align="left" width="40%">wuzika</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">202.62</td></tr>
<tr><td class="google_round_id" align="left" width="40%">gupta35895</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">183.13</td></tr>
<tr><td class="google_round_id" align="left" width="40%">rashok</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">178.82</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Symme7ry</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">177.36</td></tr>
<tr><td class="google_round_id" align="left" width="40%">petch</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">176.30</td></tr>
<tr><td class="google_round_id" align="left" width="40%">Rud0lf</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">170.41</td></tr>
<tr><td class="google_round_id" align="left" width="40%">akibare</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">169.79</td></tr>
<tr><td class="google_round_id" align="left" width="40%">project</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">166.06</td></tr>
<tr><td class="google_round_id" align="left" width="40%">vrajeshkannan</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">164.17</td></tr>
<tr><td class="google_round_id" align="left" width="40%">patsup</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">160.94</td></tr>
<tr><td class="google_round_id" align="left" width="40%">HappyMutant</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">159.88</td></tr>
<tr><td class="google_round_id" align="left" width="40%">lindril</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">154.11</td></tr>
<tr><td class="google_round_id" align="left" width="40%">otseng</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">153.69</td></tr>
<tr><td class="google_round_id" align="left" width="40%">scorbett</td><td class="google_round_id" align="left" width="20%">Qualification Set 10</td><td class="google_round_id" align="left" width="20%">153.39</td></tr>


                     </table>

                        </font></p>

                        </td>
                     </tr>
                     <tr>
                        <td><p><br /></p>
                              <p><a href="/"><img align="right" src="/i/events/google2003/google_pbtc.gif" width="100" height="33" border="0" hspace="5"></a>
                              <font size="-1">To find out more detailed information about the Google Code Jam 2003, including a list of the prizes, please read the <a href="/pl/?&module=Static&d1=google&d2=google_rules_overview">Terms and Conditions</a>.
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
<a href="/?t=about_tc&c=index">About TopCoder</a> -
<a href="http://www.google.com/jobs/">We're Hiring</a> 
</small>
</p>
</div>
</body>
</html>