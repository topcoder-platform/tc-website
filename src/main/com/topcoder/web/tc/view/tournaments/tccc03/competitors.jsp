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

            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr><td colspan="4" class="statText"><strong>This Year's Competitors</strong><br /><br /></td></tr>

                            <tr>
                                <td width="20%" align="center" class="tourney_subhead1">Northeast</td>
                                <td width="20%" align="center" class="tourney_subhead1">Southeast</td>
                                <td width="20%" align="center" class="tourney_subhead1">West</td>
                                <td width="20%" align="center" class="tourney_subhead1">Midwest</td>
                                <td width="20%" align="center" class="tourney_subhead1">International</td>
                            </tr>

                        <tr valign="top">
                            <td align="left" class="statText">
<tc-webtag:handle coderId="267272" context="algorithm"/><br>
<tc-webtag:handle coderId="158149" context="algorithm"/><br>
<tc-webtag:handle coderId="156742" context="algorithm"/><br>
<tc-webtag:handle coderId="276719" context="algorithm"/><br>
<tc-webtag:handle coderId="260170" context="algorithm"/><br>
<tc-webtag:handle coderId="266625" context="algorithm"/><br>
<tc-webtag:handle coderId="290237" context="algorithm"/><br>
<tc-webtag:handle coderId="156640" context="algorithm"/><br>
<tc-webtag:handle coderId="158837" context="algorithm"/><br>
<tc-webtag:handle coderId="158823" context="algorithm"/><br>
<tc-webtag:handle coderId="156592" context="algorithm"/><br>
<tc-webtag:handle coderId="290448" context="algorithm"/><br>
<tc-webtag:handle coderId="287496" context="algorithm"/><br>
<tc-webtag:handle coderId="159054" context="algorithm"/><br>
<tc-webtag:handle coderId="115699" context="algorithm"/><br>
<tc-webtag:handle coderId="268547" context="algorithm"/><br>
<tc-webtag:handle coderId="310936" context="algorithm"/><br>
<tc-webtag:handle coderId="297059" context="algorithm"/><br>
<tc-webtag:handle coderId="141448" context="algorithm"/><br>
<tc-webtag:handle coderId="267264" context="algorithm"/><br>
<tc-webtag:handle coderId="267455" context="algorithm"/><br>
<tc-webtag:handle coderId="293597" context="algorithm"/><br>
<tc-webtag:handle coderId="156642" context="algorithm"/><br>
<tc-webtag:handle coderId="285916" context="algorithm"/><br>
<tc-webtag:handle coderId="156634" context="algorithm"/><br>
<tc-webtag:handle coderId="263189" context="algorithm"/><br>
<tc-webtag:handle coderId="260578" context="algorithm"/><br>
<tc-webtag:handle coderId="261471" context="algorithm"/><br>
<tc-webtag:handle coderId="303197" context="algorithm"/><br>
<tc-webtag:handle coderId="344099" context="algorithm"/><br>
<tc-webtag:handle coderId="289288" context="algorithm"/><br>
<tc-webtag:handle coderId="281121" context="algorithm"/><br>
<tc-webtag:handle coderId="282489" context="algorithm"/><br>
<tc-webtag:handle coderId="275813" context="algorithm"/><br>
<tc-webtag:handle coderId="261979" context="algorithm"/><br>
<tc-webtag:handle coderId="300203" context="algorithm"/><br>
<tc-webtag:handle coderId="309647" context="algorithm"/><br>
<tc-webtag:handle coderId="309329" context="algorithm"/><br>
<tc-webtag:handle coderId="251591" context="algorithm"/><br>
<tc-webtag:handle coderId="263580" context="algorithm"/><br>
<tc-webtag:handle coderId="273998" context="algorithm"/><br>
<tc-webtag:handle coderId="156738" context="algorithm"/><br>
<tc-webtag:handle coderId="293976" context="algorithm"/><br>
<tc-webtag:handle coderId="252277" context="algorithm"/><br>
<tc-webtag:handle coderId="273419" context="algorithm"/><br>
<tc-webtag:handle coderId="266685" context="algorithm"/><br>
<tc-webtag:handle coderId="305463" context="algorithm"/><br>
<tc-webtag:handle coderId="274885" context="algorithm"/><br>
<tc-webtag:handle coderId="293262" context="algorithm"/><br>
<tc-webtag:handle coderId="150954" context="algorithm"/><br>
<tc-webtag:handle coderId="267834" context="algorithm"/><br>
<tc-webtag:handle coderId="265545" context="algorithm"/><br>
<tc-webtag:handle coderId="302330" context="algorithm"/><br>
<tc-webtag:handle coderId="272761" context="algorithm"/><br>
<tc-webtag:handle coderId="287266" context="algorithm"/><br>
<tc-webtag:handle coderId="265918" context="algorithm"/><br>
<tc-webtag:handle coderId="276749" context="algorithm"/><br>
<tc-webtag:handle coderId="271521" context="algorithm"/><br>
<tc-webtag:handle coderId="264761" context="algorithm"/><br>
<tc-webtag:handle coderId="269553" context="algorithm"/><br>
<tc-webtag:handle coderId="158067" context="algorithm"/><br>
<tc-webtag:handle coderId="115147" context="algorithm"/><br>
<tc-webtag:handle coderId="260828" context="algorithm"/><br>
<tc-webtag:handle coderId="138158" context="algorithm"/><br>
<tc-webtag:handle coderId="301004" context="algorithm"/><br>
<tc-webtag:handle coderId="158896" context="algorithm"/><br>
<tc-webtag:handle coderId="288392" context="algorithm"/><br>
<tc-webtag:handle coderId="251625" context="algorithm"/><br>
<tc-webtag:handle coderId="269879" context="algorithm"/><br>
<tc-webtag:handle coderId="158110" context="algorithm"/><br>
<tc-webtag:handle coderId="286112" context="algorithm"/><br>
<tc-webtag:handle coderId="268007" context="algorithm"/><br>
<tc-webtag:handle coderId="154090" context="algorithm"/><br>
<tc-webtag:handle coderId="157601" context="algorithm"/><br>
<tc-webtag:handle coderId="310750" context="algorithm"/><br>
<tc-webtag:handle coderId="290667" context="algorithm"/><br>
<tc-webtag:handle coderId="158301" context="algorithm"/><br>
<tc-webtag:handle coderId="264949" context="algorithm"/><br>
<tc-webtag:handle coderId="157582" context="algorithm"/><br>
<tc-webtag:handle coderId="343975" context="algorithm"/><br>
<tc-webtag:handle coderId="265730" context="algorithm"/><br>
<tc-webtag:handle coderId="292296" context="algorithm"/><br>
<tc-webtag:handle coderId="310622" context="algorithm"/><br>
<tc-webtag:handle coderId="157972" context="algorithm"/><br>
<tc-webtag:handle coderId="158137" context="algorithm"/><br>
<tc-webtag:handle coderId="287864" context="algorithm"/><br>
<tc-webtag:handle coderId="155750" context="algorithm"/><br>
<tc-webtag:handle coderId="261825" context="algorithm"/><br>
<tc-webtag:handle coderId="343613" context="algorithm"/><br>
<tc-webtag:handle coderId="251134" context="algorithm"/><br>
<tc-webtag:handle coderId="277021" context="algorithm"/><br>
<tc-webtag:handle coderId="150257" context="algorithm"/><br>
<tc-webtag:handle coderId="272760" context="algorithm"/><br>
<tc-webtag:handle coderId="263468" context="algorithm"/><br>
<tc-webtag:handle coderId="266680" context="algorithm"/><br>
<tc-webtag:handle coderId="281156" context="algorithm"/><br>
<tc-webtag:handle coderId="159166" context="algorithm"/><br>
<tc-webtag:handle coderId="299144" context="algorithm"/><br>
<tc-webtag:handle coderId="260835" context="algorithm"/><br>
<tc-webtag:handle coderId="128449" context="algorithm"/><br>
<tc-webtag:handle coderId="251398" context="algorithm"/><br>
<tc-webtag:handle coderId="289253" context="algorithm"/><br>
<tc-webtag:handle coderId="299911" context="algorithm"/><br>
<tc-webtag:handle coderId="277162" context="algorithm"/><br>
<tc-webtag:handle coderId="266705" context="algorithm"/><br>
<tc-webtag:handle coderId="268951" context="algorithm"/><br>
<tc-webtag:handle coderId="111359" context="algorithm"/><br>
<tc-webtag:handle coderId="272085" context="algorithm"/><br>
<tc-webtag:handle coderId="101459" context="algorithm"/><br>
<tc-webtag:handle coderId="156541" context="algorithm"/><br>
<tc-webtag:handle coderId="293468" context="algorithm"/><br>
<tc-webtag:handle coderId="150852" context="algorithm"/><br>
<tc-webtag:handle coderId="260898" context="algorithm"/><br>
<tc-webtag:handle coderId="154135" context="algorithm"/><br>
<tc-webtag:handle coderId="299761" context="algorithm"/><br>
<tc-webtag:handle coderId="272499" context="algorithm"/><br>
<tc-webtag:handle coderId="263242" context="algorithm"/><br>
<tc-webtag:handle coderId="274259" context="algorithm"/><br>
<tc-webtag:handle coderId="297264" context="algorithm"/><br>
<tc-webtag:handle coderId="158447" context="algorithm"/><br>
<tc-webtag:handle coderId="311173" context="algorithm"/><br>
<tc-webtag:handle coderId="311502" context="algorithm"/><br>
<tc-webtag:handle coderId="269091" context="algorithm"/><br>
<tc-webtag:handle coderId="300137" context="algorithm"/><br>
<tc-webtag:handle coderId="310251" context="algorithm"/><br>
<tc-webtag:handle coderId="269198" context="algorithm"/><br>
<tc-webtag:handle coderId="159965" context="algorithm"/><br>
<tc-webtag:handle coderId="273416" context="algorithm"/><br>
<tc-webtag:handle coderId="251552" context="algorithm"/><br>
<tc-webtag:handle coderId="309786" context="algorithm"/><br>
<tc-webtag:handle coderId="309417" context="algorithm"/><br>
<tc-webtag:handle coderId="156804" context="algorithm"/><br>
<tc-webtag:handle coderId="265832" context="algorithm"/><br>
<tc-webtag:handle coderId="343371" context="algorithm"/><br>
                            </td>

                            <td align="left" class="statText">
<tc-webtag:handle coderId="277536" context="algorithm"/><br>
<tc-webtag:handle coderId="301491" context="algorithm"/><br>
<tc-webtag:handle coderId="251989" context="algorithm"/><br>
<tc-webtag:handle coderId="308110" context="algorithm"/><br>
<tc-webtag:handle coderId="270100" context="algorithm"/><br>
<tc-webtag:handle coderId="307189" context="algorithm"/><br>
<tc-webtag:handle coderId="262467" context="algorithm"/><br>
<tc-webtag:handle coderId="111057" context="algorithm"/><br>
<tc-webtag:handle coderId="300369" context="algorithm"/><br>
<tc-webtag:handle coderId="310040" context="algorithm"/><br>
<tc-webtag:handle coderId="111202" context="algorithm"/><br>
<tc-webtag:handle coderId="269739" context="algorithm"/><br>
<tc-webtag:handle coderId="159437" context="algorithm"/><br>
<tc-webtag:handle coderId="262936" context="algorithm"/><br>
<tc-webtag:handle coderId="303087" context="algorithm"/><br>
<tc-webtag:handle coderId="344860" context="algorithm"/><br>
<tc-webtag:handle coderId="292288" context="algorithm"/><br>
<tc-webtag:handle coderId="159758" context="algorithm"/><br>
<tc-webtag:handle coderId="344194" context="algorithm"/><br>
<tc-webtag:handle coderId="155148" context="algorithm"/><br>
<tc-webtag:handle coderId="155619" context="algorithm"/><br>
<tc-webtag:handle coderId="297782" context="algorithm"/><br>
<tc-webtag:handle coderId="113176" context="algorithm"/><br>
<tc-webtag:handle coderId="138655" context="algorithm"/><br>
<tc-webtag:handle coderId="291591" context="algorithm"/><br>
<tc-webtag:handle coderId="155786" context="algorithm"/><br>
<tc-webtag:handle coderId="269678" context="algorithm"/><br>
<tc-webtag:handle coderId="302640" context="algorithm"/><br>
<tc-webtag:handle coderId="157005" context="algorithm"/><br>
<tc-webtag:handle coderId="264728" context="algorithm"/><br>
<tc-webtag:handle coderId="156822" context="algorithm"/><br>
<tc-webtag:handle coderId="266485" context="algorithm"/><br>
<tc-webtag:handle coderId="289706" context="algorithm"/><br>
<tc-webtag:handle coderId="283493" context="algorithm"/><br>
<tc-webtag:handle coderId="307190" context="algorithm"/><br>
<tc-webtag:handle coderId="269046" context="algorithm"/><br>
<tc-webtag:handle coderId="110321" context="algorithm"/><br>
<tc-webtag:handle coderId="265410" context="algorithm"/><br>
<tc-webtag:handle coderId="298146" context="algorithm"/><br>
<tc-webtag:handle coderId="262916" context="algorithm"/><br>
<tc-webtag:handle coderId="274760" context="algorithm"/><br>
<tc-webtag:handle coderId="271978" context="algorithm"/><br>
<tc-webtag:handle coderId="310522" context="algorithm"/><br>
<tc-webtag:handle coderId="272999" context="algorithm"/><br>
<tc-webtag:handle coderId="157628" context="algorithm"/><br>
<tc-webtag:handle coderId="299798" context="algorithm"/><br>
<tc-webtag:handle coderId="296461" context="algorithm"/><br>
<tc-webtag:handle coderId="284726" context="algorithm"/><br>
<tc-webtag:handle coderId="263744" context="algorithm"/><br>
<tc-webtag:handle coderId="301210" context="algorithm"/><br>
<tc-webtag:handle coderId="265554" context="algorithm"/><br>
<tc-webtag:handle coderId="156485" context="algorithm"/><br>
<tc-webtag:handle coderId="294463" context="algorithm"/><br>
<tc-webtag:handle coderId="263299" context="algorithm"/><br>
<tc-webtag:handle coderId="271874" context="algorithm"/><br>
<tc-webtag:handle coderId="274840" context="algorithm"/><br>
<tc-webtag:handle coderId="311051" context="algorithm"/><br>
                            </td>

                            <td align="left" class="statText">
<tc-webtag:handle coderId="286215" context="algorithm"/><br>
<tc-webtag:handle coderId="279876" context="algorithm"/><br>
<tc-webtag:handle coderId="343341" context="algorithm"/><br>
<tc-webtag:handle coderId="286361" context="algorithm"/><br>
<tc-webtag:handle coderId="268804" context="algorithm"/><br>
<tc-webtag:handle coderId="266319" context="algorithm"/><br>
<tc-webtag:handle coderId="264869" context="algorithm"/><br>
<tc-webtag:handle coderId="142797" context="algorithm"/><br>
<tc-webtag:handle coderId="157974" context="algorithm"/><br>
<tc-webtag:handle coderId="309346" context="algorithm"/><br>
<tc-webtag:handle coderId="294034" context="algorithm"/><br>
<tc-webtag:handle coderId="265817" context="algorithm"/><br>
<tc-webtag:handle coderId="156491" context="algorithm"/><br>
<tc-webtag:handle coderId="154650" context="algorithm"/><br>
<tc-webtag:handle coderId="271250" context="algorithm"/><br>
<tc-webtag:handle coderId="108438" context="algorithm"/><br>
<tc-webtag:handle coderId="302561" context="algorithm"/><br>
<tc-webtag:handle coderId="260987" context="algorithm"/><br>
<tc-webtag:handle coderId="343553" context="algorithm"/><br>
<tc-webtag:handle coderId="114853" context="algorithm"/><br>
<tc-webtag:handle coderId="129672" context="algorithm"/><br>
<tc-webtag:handle coderId="159495" context="algorithm"/><br>
<tc-webtag:handle coderId="158333" context="algorithm"/><br>
<tc-webtag:handle coderId="263808" context="algorithm"/><br>
<tc-webtag:handle coderId="290481" context="algorithm"/><br>
<tc-webtag:handle coderId="156853" context="algorithm"/><br>
<tc-webtag:handle coderId="153902" context="algorithm"/><br>
<tc-webtag:handle coderId="152617" context="algorithm"/><br>
<tc-webtag:handle coderId="289765" context="algorithm"/><br>
<tc-webtag:handle coderId="292056" context="algorithm"/><br>
<tc-webtag:handle coderId="343252" context="algorithm"/><br>
<tc-webtag:handle coderId="251089" context="algorithm"/><br>
<tc-webtag:handle coderId="263103" context="algorithm"/><br>
<tc-webtag:handle coderId="300447" context="algorithm"/><br>
<tc-webtag:handle coderId="271008" context="algorithm"/><br>
<tc-webtag:handle coderId="265973" context="algorithm"/><br>
<tc-webtag:handle coderId="292021" context="algorithm"/><br>
<tc-webtag:handle coderId="269058" context="algorithm"/><br>
<tc-webtag:handle coderId="266571" context="algorithm"/><br>
<tc-webtag:handle coderId="265845" context="algorithm"/><br>
<tc-webtag:handle coderId="300675" context="algorithm"/><br>
<tc-webtag:handle coderId="299323" context="algorithm"/><br>
<tc-webtag:handle coderId="114443" context="algorithm"/><br>
<tc-webtag:handle coderId="309238" context="algorithm"/><br>
<tc-webtag:handle coderId="265558" context="algorithm"/><br>
<tc-webtag:handle coderId="252114" context="algorithm"/><br>
<tc-webtag:handle coderId="311193" context="algorithm"/><br>
<tc-webtag:handle coderId="304026" context="algorithm"/><br>
<tc-webtag:handle coderId="284141" context="algorithm"/><br>
<tc-webtag:handle coderId="120816" context="algorithm"/><br>
<tc-webtag:handle coderId="278932" context="algorithm"/><br>
<tc-webtag:handle coderId="251183" context="algorithm"/><br>
<tc-webtag:handle coderId="108262" context="algorithm"/><br>
<tc-webtag:handle coderId="129063" context="algorithm"/><br>
<tc-webtag:handle coderId="295365" context="algorithm"/><br>
<tc-webtag:handle coderId="287979" context="algorithm"/><br>
<tc-webtag:handle coderId="310294" context="algorithm"/><br>
<tc-webtag:handle coderId="150796" context="algorithm"/><br>
<tc-webtag:handle coderId="344698" context="algorithm"/><br>
<tc-webtag:handle coderId="108078" context="algorithm"/><br>
<tc-webtag:handle coderId="160378" context="algorithm"/><br>
<tc-webtag:handle coderId="113178" context="algorithm"/><br>
<tc-webtag:handle coderId="289251" context="algorithm"/><br>
<tc-webtag:handle coderId="251207" context="algorithm"/><br>
<tc-webtag:handle coderId="275699" context="algorithm"/><br>
<tc-webtag:handle coderId="284007" context="algorithm"/><br>
<tc-webtag:handle coderId="154671" context="algorithm"/><br>
<tc-webtag:handle coderId="251410" context="algorithm"/><br>
<tc-webtag:handle coderId="107835" context="algorithm"/><br>
<tc-webtag:handle coderId="264782" context="algorithm"/><br>
<tc-webtag:handle coderId="158236" context="algorithm"/><br>
<tc-webtag:handle coderId="156402" context="algorithm"/><br>
<tc-webtag:handle coderId="295201" context="algorithm"/><br>
<tc-webtag:handle coderId="159530" context="algorithm"/><br>
<tc-webtag:handle coderId="260906" context="algorithm"/><br>
<tc-webtag:handle coderId="280135" context="algorithm"/><br>
<tc-webtag:handle coderId="274529" context="algorithm"/><br>
<tc-webtag:handle coderId="262933" context="algorithm"/><br>
<tc-webtag:handle coderId="251130" context="algorithm"/><br>
<tc-webtag:handle coderId="285974" context="algorithm"/><br>
<tc-webtag:handle coderId="304168" context="algorithm"/><br>
<tc-webtag:handle coderId="301902" context="algorithm"/><br>
                            </td>

                            <td align="left" class="statText">
<tc-webtag:handle coderId="263249" context="algorithm"/><br>
<tc-webtag:handle coderId="344711" context="algorithm"/><br>
<tc-webtag:handle coderId="297938" context="algorithm"/><br>
<tc-webtag:handle coderId="297073" context="algorithm"/><br>
<tc-webtag:handle coderId="264700" context="algorithm"/><br>
<tc-webtag:handle coderId="300617" context="algorithm"/><br>
<tc-webtag:handle coderId="277814" context="algorithm"/><br>
<tc-webtag:handle coderId="282715" context="algorithm"/><br>
<tc-webtag:handle coderId="104861" context="algorithm"/><br>
<tc-webtag:handle coderId="278938" context="algorithm"/><br>
<tc-webtag:handle coderId="297232" context="algorithm"/><br>
<tc-webtag:handle coderId="260732" context="algorithm"/><br>
<tc-webtag:handle coderId="271688" context="algorithm"/><br>
<tc-webtag:handle coderId="264073" context="algorithm"/><br>
<tc-webtag:handle coderId="293371" context="algorithm"/><br>
<tc-webtag:handle coderId="282357" context="algorithm"/><br>
<tc-webtag:handle coderId="308503" context="algorithm"/><br>
<tc-webtag:handle coderId="271224" context="algorithm"/><br>
<tc-webtag:handle coderId="260967" context="algorithm"/><br>
<tc-webtag:handle coderId="281262" context="algorithm"/><br>
<tc-webtag:handle coderId="263636" context="algorithm"/><br>
<tc-webtag:handle coderId="266335" context="algorithm"/><br>
<tc-webtag:handle coderId="159921" context="algorithm"/><br>
<tc-webtag:handle coderId="303105" context="algorithm"/><br>
<tc-webtag:handle coderId="298056" context="algorithm"/><br>
<tc-webtag:handle coderId="280380" context="algorithm"/><br>
<tc-webtag:handle coderId="155275" context="algorithm"/><br>
<tc-webtag:handle coderId="263874" context="algorithm"/><br>
<tc-webtag:handle coderId="157390" context="algorithm"/><br>
<tc-webtag:handle coderId="261283" context="algorithm"/><br>
<tc-webtag:handle coderId="290450" context="algorithm"/><br>
<tc-webtag:handle coderId="272512" context="algorithm"/><br>
<tc-webtag:handle coderId="311382" context="algorithm"/><br>
<tc-webtag:handle coderId="154619" context="algorithm"/><br>
<tc-webtag:handle coderId="289235" context="algorithm"/><br>
<tc-webtag:handle coderId="311168" context="algorithm"/><br>
<tc-webtag:handle coderId="264065" context="algorithm"/><br>
<tc-webtag:handle coderId="142795" context="algorithm"/><br>
<tc-webtag:handle coderId="302810" context="algorithm"/><br>
<tc-webtag:handle coderId="152377" context="algorithm"/><br>
<tc-webtag:handle coderId="264692" context="algorithm"/><br>
<tc-webtag:handle coderId="343185" context="algorithm"/><br>
<tc-webtag:handle coderId="271803" context="algorithm"/><br>
<tc-webtag:handle coderId="159635" context="algorithm"/><br>
<tc-webtag:handle coderId="261407" context="algorithm"/><br>
<tc-webtag:handle coderId="288584" context="algorithm"/><br>
<tc-webtag:handle coderId="271280" context="algorithm"/><br>
<tc-webtag:handle coderId="263788" context="algorithm"/><br>
<tc-webtag:handle coderId="262271" context="algorithm"/><br>
<tc-webtag:handle coderId="277202" context="algorithm"/><br>
<tc-webtag:handle coderId="262269" context="algorithm"/><br>
<tc-webtag:handle coderId="303388" context="algorithm"/><br>
<tc-webtag:handle coderId="158658" context="algorithm"/><br>
<tc-webtag:handle coderId="274498" context="algorithm"/><br>
<tc-webtag:handle coderId="274880" context="algorithm"/><br>
<tc-webtag:handle coderId="264986" context="algorithm"/><br>
<tc-webtag:handle coderId="157578" context="algorithm"/><br>
<tc-webtag:handle coderId="311341" context="algorithm"/><br>
<tc-webtag:handle coderId="267495" context="algorithm"/><br>
<tc-webtag:handle coderId="294527" context="algorithm"/><br>
<tc-webtag:handle coderId="299560" context="algorithm"/><br>
<tc-webtag:handle coderId="300159" context="algorithm"/><br>
<tc-webtag:handle coderId="287495" context="algorithm"/><br>
<tc-webtag:handle coderId="261393" context="algorithm"/><br>
<tc-webtag:handle coderId="271582" context="algorithm"/><br>
<tc-webtag:handle coderId="260761" context="algorithm"/><br>
<tc-webtag:handle coderId="263371" context="algorithm"/><br>
<tc-webtag:handle coderId="275043" context="algorithm"/><br>
<tc-webtag:handle coderId="273112" context="algorithm"/><br>
<tc-webtag:handle coderId="159400" context="algorithm"/><br>
<tc-webtag:handle coderId="298480" context="algorithm"/><br>
<tc-webtag:handle coderId="156372" context="algorithm"/><br>
                            </td>

                            <td align="left" class="statText">
<tc-webtag:handle coderId="343492" context="algorithm"/><br>
<tc-webtag:handle coderId="289396" context="algorithm"/><br>
<tc-webtag:handle coderId="300426" context="algorithm"/><br>
<tc-webtag:handle coderId="263396" context="algorithm"/><br>
<tc-webtag:handle coderId="293387" context="algorithm"/><br>
<tc-webtag:handle coderId="310325" context="algorithm"/><br>
<tc-webtag:handle coderId="278342" context="algorithm"/><br>
<tc-webtag:handle coderId="307060" context="algorithm"/><br>
<tc-webtag:handle coderId="281635" context="algorithm"/><br>
<tc-webtag:handle coderId="277356" context="algorithm"/><br>
<tc-webtag:handle coderId="274018" context="algorithm"/><br>
<tc-webtag:handle coderId="251223" context="algorithm"/><br>
<tc-webtag:handle coderId="309165" context="algorithm"/><br>
<tc-webtag:handle coderId="260911" context="algorithm"/><br>
<tc-webtag:handle coderId="303437" context="algorithm"/><br>
<tc-webtag:handle coderId="265773" context="algorithm"/><br>
<tc-webtag:handle coderId="311045" context="algorithm"/><br>
<tc-webtag:handle coderId="284038" context="algorithm"/><br>
<tc-webtag:handle coderId="159146" context="algorithm"/><br>
<tc-webtag:handle coderId="288822" context="algorithm"/><br>
<tc-webtag:handle coderId="266049" context="algorithm"/><br>
<tc-webtag:handle coderId="251074" context="algorithm"/><br>
<tc-webtag:handle coderId="302415" context="algorithm"/><br>
<tc-webtag:handle coderId="251263" context="algorithm"/><br>
<tc-webtag:handle coderId="307882" context="algorithm"/><br>
<tc-webtag:handle coderId="303185" context="algorithm"/><br>
<tc-webtag:handle coderId="289600" context="algorithm"/><br>
<tc-webtag:handle coderId="299706" context="algorithm"/><br>
<tc-webtag:handle coderId="283423" context="algorithm"/><br>
<tc-webtag:handle coderId="267920" context="algorithm"/><br>
<tc-webtag:handle coderId="310627" context="algorithm"/><br>
<tc-webtag:handle coderId="343373" context="algorithm"/><br>
<tc-webtag:handle coderId="309617" context="algorithm"/><br>
<tc-webtag:handle coderId="251832" context="algorithm"/><br>
<tc-webtag:handle coderId="260274" context="algorithm"/><br>
<tc-webtag:handle coderId="263386" context="algorithm"/><br>
<tc-webtag:handle coderId="276230" context="algorithm"/><br>
<tc-webtag:handle coderId="309641" context="algorithm"/><br>
<tc-webtag:handle coderId="297930" context="algorithm"/><br>
<tc-webtag:handle coderId="273434" context="algorithm"/><br>
<tc-webtag:handle coderId="285248" context="algorithm"/><br>
<tc-webtag:handle coderId="303385" context="algorithm"/><br>
<tc-webtag:handle coderId="296466" context="algorithm"/><br>
<tc-webtag:handle coderId="307169" context="algorithm"/><br>
<tc-webtag:handle coderId="273025" context="algorithm"/><br>
<tc-webtag:handle coderId="310430" context="algorithm"/><br>
<tc-webtag:handle coderId="310269" context="algorithm"/><br>
<tc-webtag:handle coderId="261567" context="algorithm"/><br>
<tc-webtag:handle coderId="268851" context="algorithm"/><br>
<tc-webtag:handle coderId="292113" context="algorithm"/><br>
<tc-webtag:handle coderId="298761" context="algorithm"/><br>
<tc-webtag:handle coderId="261024" context="algorithm"/><br>
<tc-webtag:handle coderId="279471" context="algorithm"/><br>
<tc-webtag:handle coderId="285283" context="algorithm"/><br>
<tc-webtag:handle coderId="307192" context="algorithm"/><br>
<tc-webtag:handle coderId="260913" context="algorithm"/><br>
<tc-webtag:handle coderId="288429" context="algorithm"/><br>
<tc-webtag:handle coderId="274022" context="algorithm"/><br>
<tc-webtag:handle coderId="306980" context="algorithm"/><br>
<tc-webtag:handle coderId="270505" context="algorithm"/><br>
<tc-webtag:handle coderId="273461" context="algorithm"/><br>
<tc-webtag:handle coderId="310333" context="algorithm"/><br>
<tc-webtag:handle coderId="295768" context="algorithm"/><br>
<tc-webtag:handle coderId="306786" context="algorithm"/><br>
<tc-webtag:handle coderId="260406" context="algorithm"/><br>
<tc-webtag:handle coderId="285634" context="algorithm"/><br>
<tc-webtag:handle coderId="287105" context="algorithm"/><br>
<tc-webtag:handle coderId="302928" context="algorithm"/><br>
<tc-webtag:handle coderId="299273" context="algorithm"/><br>
<tc-webtag:handle coderId="286587" context="algorithm"/><br>
<tc-webtag:handle coderId="280722" context="algorithm"/><br>
<tc-webtag:handle coderId="308953" context="algorithm"/><br>
<tc-webtag:handle coderId="300150" context="algorithm"/><br>
<tc-webtag:handle coderId="283388" context="algorithm"/><br>
<tc-webtag:handle coderId="143871" context="algorithm"/><br>
<tc-webtag:handle coderId="309367" context="algorithm"/><br>
<tc-webtag:handle coderId="289824" context="algorithm"/><br>
<tc-webtag:handle coderId="155880" context="algorithm"/><br>
<tc-webtag:handle coderId="302501" context="algorithm"/><br>
<tc-webtag:handle coderId="296745" context="algorithm"/><br>
<tc-webtag:handle coderId="288170" context="algorithm"/><br>
<tc-webtag:handle coderId="293013" context="algorithm"/><br>
<tc-webtag:handle coderId="308657" context="algorithm"/><br>
<tc-webtag:handle coderId="288302" context="algorithm"/><br>
<tc-webtag:handle coderId="263379" context="algorithm"/><br>
<tc-webtag:handle coderId="275394" context="algorithm"/><br>
<tc-webtag:handle coderId="343297" context="algorithm"/><br>
<tc-webtag:handle coderId="287568" context="algorithm"/><br>
<tc-webtag:handle coderId="302018" context="algorithm"/><br>
<tc-webtag:handle coderId="271037" context="algorithm"/><br>
<tc-webtag:handle coderId="302085" context="algorithm"/><br>
<tc-webtag:handle coderId="266698" context="algorithm"/><br>
<tc-webtag:handle coderId="284168" context="algorithm"/><br>
<tc-webtag:handle coderId="298528" context="algorithm"/><br>
<tc-webtag:handle coderId="267506" context="algorithm"/><br>
<tc-webtag:handle coderId="307638" context="algorithm"/><br>
<tc-webtag:handle coderId="286907" context="algorithm"/><br>
<tc-webtag:handle coderId="293574" context="algorithm"/><br>
<tc-webtag:handle coderId="286911" context="algorithm"/><br>
<tc-webtag:handle coderId="296232" context="algorithm"/><br>
<tc-webtag:handle coderId="269554" context="algorithm"/><br>
<tc-webtag:handle coderId="303900" context="algorithm"/><br>
                              </td>
                            </tr>

                            <tr><td colspan="5"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                        </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
            </table>

   <br><br>
   </div>
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
