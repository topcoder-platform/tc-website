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
                        
                  
                      <table class=googleFrame bgcolor="#ffffff" cellpadding=5 cellspacing=2 border=0 width="400">
                        <tr>
                           <td class="advancersTitle" align="left" colspan="3">Qualification Round</td>
                        </tr>
                        <tr>
                           <td class="google_round_id" width="30%">Handle</td>
                           <td class="google_round_id" width="40%">Problem Set</td>
                           <td class="google_round_id" width="30%" align="right">Score</td>
                        </tr>
                        
<tr><td class="sidebarText" align="left" >SnapDragon</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">1187.65</td></tr>
<tr><td class="sidebarText" align="left" >Jary</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">1178.61</td></tr>
<tr><td class="sidebarText" align="left" >tomek</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">1116.02</td></tr>
<tr><td class="sidebarText" align="left" >along</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">1047.02</td></tr>
<tr><td class="sidebarText" align="left" >cruizza</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">1017.66</td></tr>
<tr><td class="sidebarText" align="left" >frane</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">965.04</td></tr>
<tr><td class="sidebarText" align="left" >bstanescu</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">956.14</td></tr>
<tr><td class="sidebarText" align="left" >aneubeck</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">873.29</td></tr>
<tr><td class="sidebarText" align="left" >moggy</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">864.04</td></tr>
<tr><td class="sidebarText" align="left" >chogyonim</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">862.67</td></tr>
<tr><td class="sidebarText" align="left" >zorg</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">850.56</td></tr>
<tr><td class="sidebarText" align="left" >Henry</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">848.10</td></tr>
<tr><td class="sidebarText" align="left" >toast</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">838.74</td></tr>
<tr><td class="sidebarText" align="left" >solman</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">804.99</td></tr>
<tr><td class="sidebarText" align="left" >ellsquared</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">775.12</td></tr>
<tr><td class="sidebarText" align="left" >code420</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">767.25</td></tr>
<tr><td class="sidebarText" align="left" >alanm</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">754.85</td></tr>
<tr><td class="sidebarText" align="left" >Darrell_L_77</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">711.46</td></tr>
<tr><td class="sidebarText" align="left" >Tomson</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">701.05</td></tr>
<tr><td class="sidebarText" align="left" >Greyve</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">694.27</td></tr>
<tr><td class="sidebarText" align="left" >polivic</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">657.75</td></tr>
<tr><td class="sidebarText" align="left" >esessoms</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">648.52</td></tr>
<tr><td class="sidebarText" align="left" >fiveEasyPieces</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">236.54</td></tr>
<tr><td class="sidebarText" align="left" >PurpleBob</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">233.38</td></tr>
<tr><td class="sidebarText" align="left" >stanojevic</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">229.58</td></tr>
<tr><td class="sidebarText" align="left" >Doc_NH</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">226.15</td></tr>
<tr><td class="sidebarText" align="left" >spoonmijit</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">224.71</td></tr>
<tr><td class="sidebarText" align="left" >mas13081</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">224.63</td></tr>
<tr><td class="sidebarText" align="left" >Logan</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">223.85</td></tr>
<tr><td class="sidebarText" align="left" >jburnim</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">222.46</td></tr>
<tr><td class="sidebarText" align="left" >msasha</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">222.11</td></tr>
<tr><td class="sidebarText" align="left" >ragnabot</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">219.27</td></tr>
<tr><td class="sidebarText" align="left" >BenTheus</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">218.29</td></tr>
<tr><td class="sidebarText" align="left" >Frazer</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">216.46</td></tr>
<tr><td class="sidebarText" align="left" >digitaLogic8</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">215.00</td></tr>
<tr><td class="sidebarText" align="left" >onnellinen</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">212.72</td></tr>
<tr><td class="sidebarText" align="left" >john_doe</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">212.55</td></tr>
<tr><td class="sidebarText" align="left" >harshatcse</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">212.47</td></tr>
<tr><td class="sidebarText" align="left" >AbusiveWombat</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">209.61</td></tr>
<tr><td class="sidebarText" align="left" >ves</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">208.58</td></tr>
<tr><td class="sidebarText" align="left" >peru</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">208.28</td></tr>
<tr><td class="sidebarText" align="left" >yaarivan</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">207.13</td></tr>
<tr><td class="sidebarText" align="left" >dugFor</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">206.17</td></tr>
<tr><td class="sidebarText" align="left" >firedragon</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">205.48</td></tr>
<tr><td class="sidebarText" align="left" >Illor</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">204.57</td></tr>
<tr><td class="sidebarText" align="left" >stur0053</td><td class="sidebarText" align="left" >Qualification Set 1</td><td class="sidebarText" align="right">203.33</td></tr>
<tr><td class="sidebarText" align="left" >ChristopherH</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">1126.11</td></tr>
<tr><td class="sidebarText" align="left" >Wernie</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">1107.48</td></tr>
<tr><td class="sidebarText" align="left" >schveiguy</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">1062.28</td></tr>
<tr><td class="sidebarText" align="left" >snewman</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">1029.08</td></tr>
<tr><td class="sidebarText" align="left" >Ruberik</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">1019.69</td></tr>
<tr><td class="sidebarText" align="left" >hvdijk</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">991.12</td></tr>
<tr><td class="sidebarText" align="left" >abductor</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">974.78</td></tr>
<tr><td class="sidebarText" align="left" >adic</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">963.79</td></tr>
<tr><td class="sidebarText" align="left" >hilfiger</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">937.29</td></tr>
<tr><td class="sidebarText" align="left" >davitf</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">908.83</td></tr>
<tr><td class="sidebarText" align="left" >lars</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">897.32</td></tr>
<tr><td class="sidebarText" align="left" >skanthak</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">857.85</td></tr>
<tr><td class="sidebarText" align="left" >WhiteShadow</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">791.89</td></tr>
<tr><td class="sidebarText" align="left" >Tree</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">725.93</td></tr>
<tr><td class="sidebarText" align="left" >axchma</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">699.47</td></tr>
<tr><td class="sidebarText" align="left" >www</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">639.88</td></tr>
<tr><td class="sidebarText" align="left" >cjoa</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">594.14</td></tr>
<tr><td class="sidebarText" align="left" >wonder-worker</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">543.43</td></tr>
<tr><td class="sidebarText" align="left" >johnsickbock</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">535.73</td></tr>
<tr><td class="sidebarText" align="left" >NGBronson</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">241.77</td></tr>
<tr><td class="sidebarText" align="left" >DJ-Katy</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">237.44</td></tr>
<tr><td class="sidebarText" align="left" >pearl</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">237.35</td></tr>
<tr><td class="sidebarText" align="left" >userundefined</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">236.20</td></tr>
<tr><td class="sidebarText" align="left" >alienbra</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">231.21</td></tr>
<tr><td class="sidebarText" align="left" >rbadaro</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">228.48</td></tr>
<tr><td class="sidebarText" align="left" >saagar734</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">228.41</td></tr>
<tr><td class="sidebarText" align="left" >futo</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">228.33</td></tr>
<tr><td class="sidebarText" align="left" >duner</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">224.39</td></tr>
<tr><td class="sidebarText" align="left" >sinaddcos</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">222.18</td></tr>
<tr><td class="sidebarText" align="left" >wanchan</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">221.12</td></tr>
<tr><td class="sidebarText" align="left" >reiners</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">220.98</td></tr>
<tr><td class="sidebarText" align="left" >dmks</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">220.49</td></tr>
<tr><td class="sidebarText" align="left" >AleaActaEst</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">220.36</td></tr>
<tr><td class="sidebarText" align="left" >Liguo</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">219.92</td></tr>
<tr><td class="sidebarText" align="left" >TeLa</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">219.52</td></tr>
<tr><td class="sidebarText" align="left" >sohdjinn</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">219.49</td></tr>
<tr><td class="sidebarText" align="left" >kiveol</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">217.10</td></tr>
<tr><td class="sidebarText" align="left" >Tautology</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">216.76</td></tr>
<tr><td class="sidebarText" align="left" >prof</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">215.75</td></tr>
<tr><td class="sidebarText" align="left" >SmileyGirl256</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">214.95</td></tr>
<tr><td class="sidebarText" align="left" >p1nbaLL</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">213.45</td></tr>
<tr><td class="sidebarText" align="left" >kstroke</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">213.31</td></tr>
<tr><td class="sidebarText" align="left" >nacul</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">212.52</td></tr>
<tr><td class="sidebarText" align="left" >neweinstein</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">211.95</td></tr>
<tr><td class="sidebarText" align="left" >rcrdev</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">210.86</td></tr>
<tr><td class="sidebarText" align="left" >xb95</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">206.98</td></tr>
<tr><td class="sidebarText" align="left" >pagat</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">206.52</td></tr>
<tr><td class="sidebarText" align="left" >jleejleejlee</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">203.67</td></tr>
<tr><td class="sidebarText" align="left" >kliu_cali</td><td class="sidebarText" align="left" >Qualification Set 2</td><td class="sidebarText" align="right">201.98</td></tr>
<tr><td class="sidebarText" align="left" >vorthys</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">1103.26</td></tr>
<tr><td class="sidebarText" align="left" >amorosov</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">1004.40</td></tr>
<tr><td class="sidebarText" align="left" >dgarthur</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">984.32</td></tr>
<tr><td class="sidebarText" align="left" >Yarin</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">954.96</td></tr>
<tr><td class="sidebarText" align="left" >popatlal</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">937.58</td></tr>
<tr><td class="sidebarText" align="left" >mlcastle</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">935.26</td></tr>
<tr><td class="sidebarText" align="left" >ante</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">912.94</td></tr>
<tr><td class="sidebarText" align="left" >DEathkNIghtS</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">833.78</td></tr>
<tr><td class="sidebarText" align="left" >madking</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">814.02</td></tr>
<tr><td class="sidebarText" align="left" >UFP2161</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">781.43</td></tr>
<tr><td class="sidebarText" align="left" >Alexandre</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">777.87</td></tr>
<tr><td class="sidebarText" align="left" >PMH</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">721.81</td></tr>
<tr><td class="sidebarText" align="left" >mathijs</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">696.87</td></tr>
<tr><td class="sidebarText" align="left" >gepa</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">658.51</td></tr>
<tr><td class="sidebarText" align="left" >jcolosi</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">656.86</td></tr>
<tr><td class="sidebarText" align="left" >mckavity</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">631.41</td></tr>
<tr><td class="sidebarText" align="left" >130358</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">630.80</td></tr>
<tr><td class="sidebarText" align="left" >danlief</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">630.56</td></tr>
<tr><td class="sidebarText" align="left" >nike</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">630.00</td></tr>
<tr><td class="sidebarText" align="left" >jaivasanth</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">629.67</td></tr>
<tr><td class="sidebarText" align="left" >abiczo</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">626.55</td></tr>
<tr><td class="sidebarText" align="left" >raquib</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">600.12</td></tr>
<tr><td class="sidebarText" align="left" >harendra</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">593.46</td></tr>
<tr><td class="sidebarText" align="left" >ChaiBot</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">591.44</td></tr>
<tr><td class="sidebarText" align="left" >magnum</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">587.32</td></tr>
<tr><td class="sidebarText" align="left" >visnup</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">480.17</td></tr>
<tr><td class="sidebarText" align="left" >ktong</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">470.88</td></tr>
<tr><td class="sidebarText" align="left" >PacerGuy</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">441.08</td></tr>
<tr><td class="sidebarText" align="left" >jvohome</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">427.85</td></tr>
<tr><td class="sidebarText" align="left" >lanenal</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">419.73</td></tr>
<tr><td class="sidebarText" align="left" >ussr</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">410.56</td></tr>
<tr><td class="sidebarText" align="left" >lakata</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">408.30</td></tr>
<tr><td class="sidebarText" align="left" >mathgodleo</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">222.91</td></tr>
<tr><td class="sidebarText" align="left" >quadcap</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">219.33</td></tr>
<tr><td class="sidebarText" align="left" >sh_maestro</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">215.18</td></tr>
<tr><td class="sidebarText" align="left" >Fluff</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">210.62</td></tr>
<tr><td class="sidebarText" align="left" >elron</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">206.90</td></tr>
<tr><td class="sidebarText" align="left" >DestyNova</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">206.16</td></tr>
<tr><td class="sidebarText" align="left" >jpowell</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">204.74</td></tr>
<tr><td class="sidebarText" align="left" >webpaul</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">204.14</td></tr>
<tr><td class="sidebarText" align="left" >mthreat</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">203.99</td></tr>
<tr><td class="sidebarText" align="left" >boose</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">198.33</td></tr>
<tr><td class="sidebarText" align="left" >stoend</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">196.29</td></tr>
<tr><td class="sidebarText" align="left" >leadhyena_inran</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">195.35</td></tr>
<tr><td class="sidebarText" align="left" >mmsa</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">192.32</td></tr>
<tr><td class="sidebarText" align="left" >kip104</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">190.93</td></tr>
<tr><td class="sidebarText" align="left" >sredniv</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">185.35</td></tr>
<tr><td class="sidebarText" align="left" >cgu</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">185.11</td></tr>
<tr><td class="sidebarText" align="left" >cnkelly</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">178.71</td></tr>
<tr><td class="sidebarText" align="left" >quasar</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">178.13</td></tr>
<tr><td class="sidebarText" align="left" >cflichel</td><td class="sidebarText" align="left" >Qualification Set 3</td><td class="sidebarText" align="right">175.58</td></tr>
<tr><td class="sidebarText" align="left" >sjelkjd</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">980.95</td></tr>
<tr><td class="sidebarText" align="left" >jonmac</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">963.73</td></tr>
<tr><td class="sidebarText" align="left" >bogklug</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">912.24</td></tr>
<tr><td class="sidebarText" align="left" >princeofchaos</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">875.82</td></tr>
<tr><td class="sidebarText" align="left" >bsdude</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">840.22</td></tr>
<tr><td class="sidebarText" align="left" >szd713</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">829.81</td></tr>
<tr><td class="sidebarText" align="left" >superjoel</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">800.10</td></tr>
<tr><td class="sidebarText" align="left" >radeye</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">737.81</td></tr>
<tr><td class="sidebarText" align="left" >Pan</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">713.65</td></tr>
<tr><td class="sidebarText" align="left" >Klinck</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">678.37</td></tr>
<tr><td class="sidebarText" align="left" >Jiggly</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">665.64</td></tr>
<tr><td class="sidebarText" align="left" >lovro</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">664.44</td></tr>
<tr><td class="sidebarText" align="left" >zy</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">616.58</td></tr>
<tr><td class="sidebarText" align="left" >turuthok</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">598.42</td></tr>
<tr><td class="sidebarText" align="left" >dzadza</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">581.37</td></tr>
<tr><td class="sidebarText" align="left" >ValD</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">424.08</td></tr>
<tr><td class="sidebarText" align="left" >pcmartini</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">238.41</td></tr>
<tr><td class="sidebarText" align="left" >mortijingle</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">234.81</td></tr>
<tr><td class="sidebarText" align="left" >tc</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">231.71</td></tr>
<tr><td class="sidebarText" align="left" >IODonnell</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">221.67</td></tr>
<tr><td class="sidebarText" align="left" >InsaneParadox</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">219.77</td></tr>
<tr><td class="sidebarText" align="left" >BjarkeEbert</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">218.88</td></tr>
<tr><td class="sidebarText" align="left" >sburoff</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">213.92</td></tr>
<tr><td class="sidebarText" align="left" >bigfella</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">210.45</td></tr>
<tr><td class="sidebarText" align="left" >betelgeuse</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">202.13</td></tr>
<tr><td class="sidebarText" align="left" >merolish</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">201.87</td></tr>
<tr><td class="sidebarText" align="left" >weberchen</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">201.10</td></tr>
<tr><td class="sidebarText" align="left" >jrz</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">199.01</td></tr>
<tr><td class="sidebarText" align="left" >azstuff</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">196.64</td></tr>
<tr><td class="sidebarText" align="left" >Lizard</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">194.13</td></tr>
<tr><td class="sidebarText" align="left" >space</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">187.27</td></tr>
<tr><td class="sidebarText" align="left" >yacko</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">186.38</td></tr>
<tr><td class="sidebarText" align="left" >sukumar05</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">182.52</td></tr>
<tr><td class="sidebarText" align="left" >quangkhaiv</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">182.18</td></tr>
<tr><td class="sidebarText" align="left" >telamus</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">182.00</td></tr>
<tr><td class="sidebarText" align="left" >NSantos</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">181.87</td></tr>
<tr><td class="sidebarText" align="left" >tomi</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">180.92</td></tr>
<tr><td class="sidebarText" align="left" >shechter</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">177.69</td></tr>
<tr><td class="sidebarText" align="left" >feahmed</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">176.40</td></tr>
<tr><td class="sidebarText" align="left" >uwneal</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">174.58</td></tr>
<tr><td class="sidebarText" align="left" >swietlik</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">174.40</td></tr>
<tr><td class="sidebarText" align="left" >neeeeeep</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">173.21</td></tr>
<tr><td class="sidebarText" align="left" >donm</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">172.32</td></tr>
<tr><td class="sidebarText" align="left" >giginim</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">172.11</td></tr>
<tr><td class="sidebarText" align="left" >casual_cracker</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">170.23</td></tr>
<tr><td class="sidebarText" align="left" >roggeboy</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">167.88</td></tr>
<tr><td class="sidebarText" align="left" >Mike_MS</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">165.34</td></tr>
<tr><td class="sidebarText" align="left" >oog</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">163.70</td></tr>
<tr><td class="sidebarText" align="left" >Cho</td><td class="sidebarText" align="left" >Qualification Set 4</td><td class="sidebarText" align="right">162.97</td></tr>
<tr><td class="sidebarText" align="left" >DrewHudson</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">1018.38</td></tr>
<tr><td class="sidebarText" align="left" >Parchandri</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">918.43</td></tr>
<tr><td class="sidebarText" align="left" >reid</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">916.88</td></tr>
<tr><td class="sidebarText" align="left" >dangelo</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">858.37</td></tr>
<tr><td class="sidebarText" align="left" >kyotov</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">857.65</td></tr>
<tr><td class="sidebarText" align="left" >nicka81</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">848.57</td></tr>
<tr><td class="sidebarText" align="left" >legakis</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">803.96</td></tr>
<tr><td class="sidebarText" align="left" >aksonov</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">787.35</td></tr>
<tr><td class="sidebarText" align="left" >kyky</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">774.67</td></tr>
<tr><td class="sidebarText" align="left" >milhouse</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">730.09</td></tr>
<tr><td class="sidebarText" align="left" >mikera7</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">711.90</td></tr>
<tr><td class="sidebarText" align="left" >DjinnKahn</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">686.43</td></tr>
<tr><td class="sidebarText" align="left" >qubits</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">678.25</td></tr>
<tr><td class="sidebarText" align="left" >pzhao</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">662.23</td></tr>
<tr><td class="sidebarText" align="left" >zhliu</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">653.68</td></tr>
<tr><td class="sidebarText" align="left" >jinxidoru</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">645.71</td></tr>
<tr><td class="sidebarText" align="left" >BryanChen</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">636.63</td></tr>
<tr><td class="sidebarText" align="left" >connect4</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">622.46</td></tr>
<tr><td class="sidebarText" align="left" >rotoZOOM</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">613.73</td></tr>
<tr><td class="sidebarText" align="left" >shuvovse</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">608.51</td></tr>
<tr><td class="sidebarText" align="left" >sinden</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">584.86</td></tr>
<tr><td class="sidebarText" align="left" >tiki</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">545.69</td></tr>
<tr><td class="sidebarText" align="left" >Joe</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">528.02</td></tr>
<tr><td class="sidebarText" align="left" >Mr_Brook</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">510.00</td></tr>
<tr><td class="sidebarText" align="left" >amigne</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">451.17</td></tr>
<tr><td class="sidebarText" align="left" >jasonjackson</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">441.73</td></tr>
<tr><td class="sidebarText" align="left" >jbaiocchi</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">412.52</td></tr>
<tr><td class="sidebarText" align="left" >fritz</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">373.30</td></tr>
<tr><td class="sidebarText" align="left" >derelikt</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">220.83</td></tr>
<tr><td class="sidebarText" align="left" >TheFaxman</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">207.85</td></tr>
<tr><td class="sidebarText" align="left" >derek</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">193.35</td></tr>
<tr><td class="sidebarText" align="left" >haha</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">190.54</td></tr>
<tr><td class="sidebarText" align="left" >NickolausP</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">189.43</td></tr>
<tr><td class="sidebarText" align="left" >snok</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">182.17</td></tr>
<tr><td class="sidebarText" align="left" >jdmetz</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">181.99</td></tr>
<tr><td class="sidebarText" align="left" >markjam</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">178.48</td></tr>
<tr><td class="sidebarText" align="left" >rsteinberger</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">174.90</td></tr>
<tr><td class="sidebarText" align="left" >dweebo</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">169.34</td></tr>
<tr><td class="sidebarText" align="left" >Fred[dy]</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">167.76</td></tr>
<tr><td class="sidebarText" align="left" >helloall</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">163.45</td></tr>
<tr><td class="sidebarText" align="left" >arun</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">161.46</td></tr>
<tr><td class="sidebarText" align="left" >Humbug</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">161.45</td></tr>
<tr><td class="sidebarText" align="left" >jawnty</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">160.91</td></tr>
<tr><td class="sidebarText" align="left" >Kukulza</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">159.23</td></tr>
<tr><td class="sidebarText" align="left" >iamignorant</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">154.80</td></tr>
<tr><td class="sidebarText" align="left" >boldters</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">150.81</td></tr>
<tr><td class="sidebarText" align="left" >unclejed</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">150.30</td></tr>
<tr><td class="sidebarText" align="left" >byteCoder</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">149.73</td></tr>
<tr><td class="sidebarText" align="left" >AndrewSmith</td><td class="sidebarText" align="left" >Qualification Set 5</td><td class="sidebarText" align="right">149.46</td></tr>
<tr><td class="sidebarText" align="left" >AlexandraRU</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">1107.69</td></tr>
<tr><td class="sidebarText" align="left" >bladerunner</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">1064.27</td></tr>
<tr><td class="sidebarText" align="left" >jcd1</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">1037.90</td></tr>
<tr><td class="sidebarText" align="left" >Slamin</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">1032.64</td></tr>
<tr><td class="sidebarText" align="left" >mascot</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">961.06</td></tr>
<tr><td class="sidebarText" align="left" >Rustyoldman</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">951.30</td></tr>
<tr><td class="sidebarText" align="left" >ntrhieu</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">944.28</td></tr>
<tr><td class="sidebarText" align="left" >dvickrey</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">844.84</td></tr>
<tr><td class="sidebarText" align="left" >topodisc</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">841.45</td></tr>
<tr><td class="sidebarText" align="left" >smloh</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">841.34</td></tr>
<tr><td class="sidebarText" align="left" >kikuni</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">810.77</td></tr>
<tr><td class="sidebarText" align="left" >Maris</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">788.14</td></tr>
<tr><td class="sidebarText" align="left" >amitc</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">787.75</td></tr>
<tr><td class="sidebarText" align="left" >mics</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">786.33</td></tr>
<tr><td class="sidebarText" align="left" >Wasyuu</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">771.78</td></tr>
<tr><td class="sidebarText" align="left" >gladius</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">761.41</td></tr>
<tr><td class="sidebarText" align="left" >wisdompoet</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">744.85</td></tr>
<tr><td class="sidebarText" align="left" >Yi_Zhang</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">733.14</td></tr>
<tr><td class="sidebarText" align="left" >inrm2</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">691.58</td></tr>
<tr><td class="sidebarText" align="left" >vivek_vedagiri</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">683.94</td></tr>
<tr><td class="sidebarText" align="left" >lkesteloot</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">680.22</td></tr>
<tr><td class="sidebarText" align="left" >Andrew_Lazarev</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">674.35</td></tr>
<tr><td class="sidebarText" align="left" >yaniv</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">670.22</td></tr>
<tr><td class="sidebarText" align="left" >gevak</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">621.62</td></tr>
<tr><td class="sidebarText" align="left" >csernak</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">596.09</td></tr>
<tr><td class="sidebarText" align="left" >Vladko</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">559.48</td></tr>
<tr><td class="sidebarText" align="left" >ckirmse</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">417.53</td></tr>
<tr><td class="sidebarText" align="left" >MPhk</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">239.32</td></tr>
<tr><td class="sidebarText" align="left" >igorsk</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">234.96</td></tr>
<tr><td class="sidebarText" align="left" >Koroibos</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">234.19</td></tr>
<tr><td class="sidebarText" align="left" >WingedCat</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">233.63</td></tr>
<tr><td class="sidebarText" align="left" >gustn</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">233.07</td></tr>
<tr><td class="sidebarText" align="left" >HardCoder</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">232.74</td></tr>
<tr><td class="sidebarText" align="left" >btspider</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">232.25</td></tr>
<tr><td class="sidebarText" align="left" >Karshikinpa</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">230.97</td></tr>
<tr><td class="sidebarText" align="left" >rodif</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">225.26</td></tr>
<tr><td class="sidebarText" align="left" >rasactive</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">224.98</td></tr>
<tr><td class="sidebarText" align="left" >achurch</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">224.25</td></tr>
<tr><td class="sidebarText" align="left" >donniet</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">223.64</td></tr>
<tr><td class="sidebarText" align="left" >Gandi</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">223.59</td></tr>
<tr><td class="sidebarText" align="left" >slake</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">221.63</td></tr>
<tr><td class="sidebarText" align="left" >MadMoose</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">219.41</td></tr>
<tr><td class="sidebarText" align="left" >lemming</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">217.88</td></tr>
<tr><td class="sidebarText" align="left" >roshweb</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">217.57</td></tr>
<tr><td class="sidebarText" align="left" >BlackCloud</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">215.83</td></tr>
<tr><td class="sidebarText" align="left" >GabeJones</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">215.54</td></tr>
<tr><td class="sidebarText" align="left" >Assurnasir</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">214.54</td></tr>
<tr><td class="sidebarText" align="left" >Wecksell</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">212.77</td></tr>
<tr><td class="sidebarText" align="left" >CaptainJester</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">212.26</td></tr>
<tr><td class="sidebarText" align="left" >mlch</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">211.05</td></tr>
<tr><td class="sidebarText" align="left" >ded_guy</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">209.75</td></tr>
<tr><td class="sidebarText" align="left" >dlord111</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">209.03</td></tr>
<tr><td class="sidebarText" align="left" >axlrosen</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">205.08</td></tr>
<tr><td class="sidebarText" align="left" >Corrinado</td><td class="sidebarText" align="left" >Qualification Set 6</td><td class="sidebarText" align="right">205.04</td></tr>
<tr><td class="sidebarText" align="left" >asundqui</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">1048.92</td></tr>
<tr><td class="sidebarText" align="left" >KenVogel</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">1043.53</td></tr>
<tr><td class="sidebarText" align="left" >jms137</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">998.00</td></tr>
<tr><td class="sidebarText" align="left" >WishingBone</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">957.26</td></tr>
<tr><td class="sidebarText" align="left" >Mike Mirzayanov</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">936.46</td></tr>
<tr><td class="sidebarText" align="left" >evd</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">931.62</td></tr>
<tr><td class="sidebarText" align="left" >Ukraine</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">892.24</td></tr>
<tr><td class="sidebarText" align="left" >targo</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">794.03</td></tr>
<tr><td class="sidebarText" align="left" >saat</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">738.51</td></tr>
<tr><td class="sidebarText" align="left" >eug</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">733.02</td></tr>
<tr><td class="sidebarText" align="left" >eldering</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">724.01</td></tr>
<tr><td class="sidebarText" align="left" >oldbig</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">695.74</td></tr>
<tr><td class="sidebarText" align="left" >emovla</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">674.34</td></tr>
<tr><td class="sidebarText" align="left" >db</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">627.06</td></tr>
<tr><td class="sidebarText" align="left" >Mosher</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">607.25</td></tr>
<tr><td class="sidebarText" align="left" >johnmoe</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">605.12</td></tr>
<tr><td class="sidebarText" align="left" >ColinMacLeod</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">244.73</td></tr>
<tr><td class="sidebarText" align="left" >batty</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">240.28</td></tr>
<tr><td class="sidebarText" align="left" >jfreyss</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">236.20</td></tr>
<tr><td class="sidebarText" align="left" >Olorin</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">234.49</td></tr>
<tr><td class="sidebarText" align="left" >amirshim</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">234.29</td></tr>
<tr><td class="sidebarText" align="left" >port6000</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">231.81</td></tr>
<tr><td class="sidebarText" align="left" >JayTea</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">230.90</td></tr>
<tr><td class="sidebarText" align="left" >coderlemming</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">228.99</td></tr>
<tr><td class="sidebarText" align="left" >nick_19</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">228.30</td></tr>
<tr><td class="sidebarText" align="left" >sliu</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">228.14</td></tr>
<tr><td class="sidebarText" align="left" >chungfat</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">227.61</td></tr>
<tr><td class="sidebarText" align="left" >Walbert</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">227.22</td></tr>
<tr><td class="sidebarText" align="left" >sargentm</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">226.96</td></tr>
<tr><td class="sidebarText" align="left" >groovymother</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">225.97</td></tr>
<tr><td class="sidebarText" align="left" >phark4evr</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">225.95</td></tr>
<tr><td class="sidebarText" align="left" >dimer0</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">224.18</td></tr>
<tr><td class="sidebarText" align="left" >frenetic</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">222.26</td></tr>
<tr><td class="sidebarText" align="left" >dpecora</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">222.05</td></tr>
<tr><td class="sidebarText" align="left" >hgliebe</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">217.20</td></tr>
<tr><td class="sidebarText" align="left" >skeeve</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">216.37</td></tr>
<tr><td class="sidebarText" align="left" >zsacul</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">215.12</td></tr>
<tr><td class="sidebarText" align="left" >joely</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">214.19</td></tr>
<tr><td class="sidebarText" align="left" >abheek</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">213.80</td></tr>
<tr><td class="sidebarText" align="left" >netspade</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">213.16</td></tr>
<tr><td class="sidebarText" align="left" >davemssavage</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">211.77</td></tr>
<tr><td class="sidebarText" align="left" >cyanide</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">210.21</td></tr>
<tr><td class="sidebarText" align="left" >Scorpion1976</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">209.35</td></tr>
<tr><td class="sidebarText" align="left" >Holgrave</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">206.99</td></tr>
<tr><td class="sidebarText" align="left" >bquinlan</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">206.66</td></tr>
<tr><td class="sidebarText" align="left" >nicksim</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">206.57</td></tr>
<tr><td class="sidebarText" align="left" >gizzywump</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">206.54</td></tr>
<tr><td class="sidebarText" align="left" >vitaly.kiruta</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">206.28</td></tr>
<tr><td class="sidebarText" align="left" >vlado</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">205.56</td></tr>
<tr><td class="sidebarText" align="left" >mcbevin</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">204.22</td></tr>
<tr><td class="sidebarText" align="left" >cbthiess</td><td class="sidebarText" align="left" >Qualification Set 7</td><td class="sidebarText" align="right">201.75</td></tr>
<tr><td class="sidebarText" align="left" >bmerry</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">1014.26</td></tr>
<tr><td class="sidebarText" align="left" >po</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">971.71</td></tr>
<tr><td class="sidebarText" align="left" >doeth</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">949.65</td></tr>
<tr><td class="sidebarText" align="left" >gunnark</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">880.69</td></tr>
<tr><td class="sidebarText" align="left" >centipede80</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">806.75</td></tr>
<tr><td class="sidebarText" align="left" >Modulator</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">798.72</td></tr>
<tr><td class="sidebarText" align="left" >ealf</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">791.70</td></tr>
<tr><td class="sidebarText" align="left" >kaiser84</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">790.06</td></tr>
<tr><td class="sidebarText" align="left" >jshute</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">774.54</td></tr>
<tr><td class="sidebarText" align="left" >mvkazit</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">771.94</td></tr>
<tr><td class="sidebarText" align="left" >redman</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">719.50</td></tr>
<tr><td class="sidebarText" align="left" >abanik</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">685.41</td></tr>
<tr><td class="sidebarText" align="left" >indigo9</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">666.96</td></tr>
<tr><td class="sidebarText" align="left" >O_O</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">644.80</td></tr>
<tr><td class="sidebarText" align="left" >TheOneSmiley</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">642.07</td></tr>
<tr><td class="sidebarText" align="left" >mugwumpj</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">637.94</td></tr>
<tr><td class="sidebarText" align="left" >PeskyGnat</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">625.47</td></tr>
<tr><td class="sidebarText" align="left" >Qythyx</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">618.11</td></tr>
<tr><td class="sidebarText" align="left" >agl</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">613.33</td></tr>
<tr><td class="sidebarText" align="left" >alena</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">602.83</td></tr>
<tr><td class="sidebarText" align="left" >ahoenig</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">594.90</td></tr>
<tr><td class="sidebarText" align="left" >GamePimp</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">584.24</td></tr>
<tr><td class="sidebarText" align="left" >guru_cyp</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">495.81</td></tr>
<tr><td class="sidebarText" align="left" >assembler</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">477.37</td></tr>
<tr><td class="sidebarText" align="left" >rvcoder</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">447.33</td></tr>
<tr><td class="sidebarText" align="left" >pohl12</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">410.14</td></tr>
<tr><td class="sidebarText" align="left" >minkov</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">401.97</td></tr>
<tr><td class="sidebarText" align="left" >willamowius</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">386.48</td></tr>
<tr><td class="sidebarText" align="left" >jacklai</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">222.47</td></tr>
<tr><td class="sidebarText" align="left" >kats</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">222.39</td></tr>
<tr><td class="sidebarText" align="left" >srowen</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">220.42</td></tr>
<tr><td class="sidebarText" align="left" >mindloss</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">212.93</td></tr>
<tr><td class="sidebarText" align="left" >acki2003</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">212.22</td></tr>
<tr><td class="sidebarText" align="left" >Eeyore</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">205.33</td></tr>
<tr><td class="sidebarText" align="left" >AmosYang</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">202.24</td></tr>
<tr><td class="sidebarText" align="left" >Dumitru</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">199.74</td></tr>
<tr><td class="sidebarText" align="left" >Revenger</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">198.60</td></tr>
<tr><td class="sidebarText" align="left" >thesack</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">197.53</td></tr>
<tr><td class="sidebarText" align="left" >Composure1</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">196.28</td></tr>
<tr><td class="sidebarText" align="left" >colder</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">194.78</td></tr>
<tr><td class="sidebarText" align="left" >k_m</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">194.76</td></tr>
<tr><td class="sidebarText" align="left" >s_senthil_kumar</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">194.17</td></tr>
<tr><td class="sidebarText" align="left" >chandraka</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">193.27</td></tr>
<tr><td class="sidebarText" align="left" >jackh</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">184.62</td></tr>
<tr><td class="sidebarText" align="left" >john7331</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">184.33</td></tr>
<tr><td class="sidebarText" align="left" >ironcamel</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">181.09</td></tr>
<tr><td class="sidebarText" align="left" >RandySaint</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">179.83</td></tr>
<tr><td class="sidebarText" align="left" >dr_burrito</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">178.87</td></tr>
<tr><td class="sidebarText" align="left" >vv</td><td class="sidebarText" align="left" >Qualification Set 8</td><td class="sidebarText" align="right">177.22</td></tr>
<tr><td class="sidebarText" align="left" >TekGoNos</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">1163.16</td></tr>
<tr><td class="sidebarText" align="left" >LunaticFringe</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">1112.20</td></tr>
<tr><td class="sidebarText" align="left" >RunningWild</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">1035.87</td></tr>
<tr><td class="sidebarText" align="left" >thooot</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">976.99</td></tr>
<tr><td class="sidebarText" align="left" >ardiankp</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">970.42</td></tr>
<tr><td class="sidebarText" align="left" >firefox</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">914.42</td></tr>
<tr><td class="sidebarText" align="left" >ploh</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">912.76</td></tr>
<tr><td class="sidebarText" align="left" >venco</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">911.88</td></tr>
<tr><td class="sidebarText" align="left" >benetin</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">863.81</td></tr>
<tr><td class="sidebarText" align="left" >IElt</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">859.76</td></tr>
<tr><td class="sidebarText" align="left" >dark_lord</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">857.17</td></tr>
<tr><td class="sidebarText" align="left" >dmj</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">846.33</td></tr>
<tr><td class="sidebarText" align="left" >sabu</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">831.10</td></tr>
<tr><td class="sidebarText" align="left" >mickle</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">809.70</td></tr>
<tr><td class="sidebarText" align="left" >alexcchan</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">787.27</td></tr>
<tr><td class="sidebarText" align="left" >Jumping-John</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">783.71</td></tr>
<tr><td class="sidebarText" align="left" >wleite</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">770.94</td></tr>
<tr><td class="sidebarText" align="left" >jochang</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">746.95</td></tr>
<tr><td class="sidebarText" align="left" >Spike</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">688.76</td></tr>
<tr><td class="sidebarText" align="left" >dukeola</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">664.40</td></tr>
<tr><td class="sidebarText" align="left" >PaulJefferys</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">644.66</td></tr>
<tr><td class="sidebarText" align="left" >sandeepgupta</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">485.18</td></tr>
<tr><td class="sidebarText" align="left" >dmap</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">483.83</td></tr>
<tr><td class="sidebarText" align="left" >tungwaiyip</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">465.91</td></tr>
<tr><td class="sidebarText" align="left" >rgrig</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">405.13</td></tr>
<tr><td class="sidebarText" align="left" >incandenza</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">235.42</td></tr>
<tr><td class="sidebarText" align="left" >aussie</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">234.72</td></tr>
<tr><td class="sidebarText" align="left" >BradAustin</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">225.84</td></tr>
<tr><td class="sidebarText" align="left" >Abednego</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">219.56</td></tr>
<tr><td class="sidebarText" align="left" >arosca</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">219.54</td></tr>
<tr><td class="sidebarText" align="left" >[UoM]Icenine</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">214.66</td></tr>
<tr><td class="sidebarText" align="left" >mossop</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">210.39</td></tr>
<tr><td class="sidebarText" align="left" >gaborka2</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">208.59</td></tr>
<tr><td class="sidebarText" align="left" >bokbok</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">208.26</td></tr>
<tr><td class="sidebarText" align="left" >FrodoB</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">205.97</td></tr>
<tr><td class="sidebarText" align="left" >adams</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">204.19</td></tr>
<tr><td class="sidebarText" align="left" >D0SBoots</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">201.51</td></tr>
<tr><td class="sidebarText" align="left" >jeff_wegher</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">201.26</td></tr>
<tr><td class="sidebarText" align="left" >maa_t</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">198.70</td></tr>
<tr><td class="sidebarText" align="left" >tyrithe</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">195.01</td></tr>
<tr><td class="sidebarText" align="left" >alosix</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">190.15</td></tr>
<tr><td class="sidebarText" align="left" >FD</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">189.02</td></tr>
<tr><td class="sidebarText" align="left" >kresho</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">188.49</td></tr>
<tr><td class="sidebarText" align="left" >apokrif</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">186.28</td></tr>
<tr><td class="sidebarText" align="left" >harryliu</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">185.14</td></tr>
<tr><td class="sidebarText" align="left" >Blytzstryke</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">182.19</td></tr>
<tr><td class="sidebarText" align="left" >Sparrow-</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">179.08</td></tr>
<tr><td class="sidebarText" align="left" >biaconho</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">176.98</td></tr>
<tr><td class="sidebarText" align="left" >wcai</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">168.60</td></tr>
<tr><td class="sidebarText" align="left" >dotosu</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">167.77</td></tr>
<tr><td class="sidebarText" align="left" >sasulzer</td><td class="sidebarText" align="left" >Qualification Set 9</td><td class="sidebarText" align="right">164.32</td></tr>
<tr><td class="sidebarText" align="left" >antimatter</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">1133.51</td></tr>
<tr><td class="sidebarText" align="left" >tjq</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">1110.06</td></tr>
<tr><td class="sidebarText" align="left" >Jan Kuipers</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">1032.36</td></tr>
<tr><td class="sidebarText" align="left" >AdrianKuegel</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">917.06</td></tr>
<tr><td class="sidebarText" align="left" >ZorbaTHut</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">866.93</td></tr>
<tr><td class="sidebarText" align="left" >Larry</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">841.74</td></tr>
<tr><td class="sidebarText" align="left" >seaniswise</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">841.64</td></tr>
<tr><td class="sidebarText" align="left" >Wasteland</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">839.31</td></tr>
<tr><td class="sidebarText" align="left" >puzzlehacker</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">767.16</td></tr>
<tr><td class="sidebarText" align="left" >drsammyb</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">732.27</td></tr>
<tr><td class="sidebarText" align="left" >ccooper</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">713.32</td></tr>
<tr><td class="sidebarText" align="left" >coshx</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">701.67</td></tr>
<tr><td class="sidebarText" align="left" >neal_googl</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">698.23</td></tr>
<tr><td class="sidebarText" align="left" >RobertNix</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">689.59</td></tr>
<tr><td class="sidebarText" align="left" >leibniz</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">672.63</td></tr>
<tr><td class="sidebarText" align="left" >jimmy</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">669.11</td></tr>
<tr><td class="sidebarText" align="left" >axiom</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">661.22</td></tr>
<tr><td class="sidebarText" align="left" >aaaaaaa14</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">660.01</td></tr>
<tr><td class="sidebarText" align="left" >guidox</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">649.05</td></tr>
<tr><td class="sidebarText" align="left" >_u0043_u0042</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">648.19</td></tr>
<tr><td class="sidebarText" align="left" >(OO)</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">623.42</td></tr>
<tr><td class="sidebarText" align="left" >ceturc</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">623.19</td></tr>
<tr><td class="sidebarText" align="left" >Razafishaha</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">622.14</td></tr>
<tr><td class="sidebarText" align="left" >hw_Tim</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">618.98</td></tr>
<tr><td class="sidebarText" align="left" >harisuthan</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">618.77</td></tr>
<tr><td class="sidebarText" align="left" >flozell</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">616.42</td></tr>
<tr><td class="sidebarText" align="left" >dirk28</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">611.72</td></tr>
<tr><td class="sidebarText" align="left" >paltherr</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">601.10</td></tr>
<tr><td class="sidebarText" align="left" >ssancho2</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">594.37</td></tr>
<tr><td class="sidebarText" align="left" >omasoud</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">593.50</td></tr>
<tr><td class="sidebarText" align="left" >Chang1</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">520.22</td></tr>
<tr><td class="sidebarText" align="left" >Nexius</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">478.17</td></tr>
<tr><td class="sidebarText" align="left" >joeli</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">455.54</td></tr>
<tr><td class="sidebarText" align="left" >ragerules</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">382.34</td></tr>
<tr><td class="sidebarText" align="left" >FuzzyOmar</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">363.93</td></tr>
<tr><td class="sidebarText" align="left" >xianguangli</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">211.70</td></tr>
<tr><td class="sidebarText" align="left" >b0b0b0b</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">204.37</td></tr>
<tr><td class="sidebarText" align="left" >wuzika</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">202.62</td></tr>
<tr><td class="sidebarText" align="left" >gupta35895</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">183.13</td></tr>
<tr><td class="sidebarText" align="left" >rashok</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">178.82</td></tr>
<tr><td class="sidebarText" align="left" >Symme7ry</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">177.36</td></tr>
<tr><td class="sidebarText" align="left" >petch</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">176.30</td></tr>
<tr><td class="sidebarText" align="left" >Rud0lf</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">170.41</td></tr>
<tr><td class="sidebarText" align="left" >akibare</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">169.79</td></tr>
<tr><td class="sidebarText" align="left" >project</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">166.06</td></tr>
<tr><td class="sidebarText" align="left" >vrajeshkannan</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">164.17</td></tr>
<tr><td class="sidebarText" align="left" >patsup</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">160.94</td></tr>
<tr><td class="sidebarText" align="left" >HappyMutant</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">159.88</td></tr>
<tr><td class="sidebarText" align="left" >lindril</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">154.11</td></tr>
<tr><td class="sidebarText" align="left" >otseng</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">153.69</td></tr>
<tr><td class="sidebarText" align="left" >scorbett</td><td class="sidebarText" align="left" >Qualification Set 10</td><td class="sidebarText" align="right">153.39</td></tr>


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