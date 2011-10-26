<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

    <jsp:include page="/script.jsp" />
    <jsp:include page="/style.jsp">
      <jsp:param name="key" value="tc_main"/>
    </jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>
                    
	<div align="right"><tc-webtag:forumLink forumID="539981" message="Discuss this press release" /></div>
                        
<div align="center">
  <p align="center"><strong>Onsite Finalists Announced for 2010 TopCoder Open </strong><br>
    <strong>Programming Tournament</strong><br />
    <strong><em>World&rsquo;s Premier Competitive Programming Showcase Set for October 11-14 in Las Vegas</em></strong></p>
</div>
      
<p><strong>Glastonbury, CT - September 8, 2010</strong> -  <a href="http://www.topcoder.com">TopCoder&reg;, Inc.</a>, the leader in online programming competition, skills assessment and competitive software development platforms, today announced the 82 semifinalist the 2010 TopCoder Open (TCO), the world&rsquo;s foremost competitive computer programming and creative design tournament. The live rounds scheduled for October 11th -14th at the MGM Mirage in Las Vegas., will match the top finalists representing 28 countries within six tournament tracks for a share of $150,000 in prizes. Full details including event schedules, rules and guidelines are available online at <a href="http://www.topcoder.com/tco10">http://www.topcoder.com/tco10</a>.</p>
<p>During the past four months of online competition, thousands of skilled competitors from around the globe were narrowed down to these 82 top performers who will now travel from around the world and feature as onsite finalists in the world&rsquo;s premier programming showcase. This year's TCO features competitions in six highly contested tournament tracks - Algorithm, Component Design and Development, Marathon Match, Mod Dash and Studio Design Competitions.</p>
<p>TopCoder competitive events offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world. </p>
<p>&quot;The TopCoder Community continues to grow in significance as a center of cyber activity creating new technologies and solutions for our business and public sector partners,&quot; said Rob Hughes, President and COO of TopCoder, Inc. &quot;In the digital world, the TCO has become both a high visibility playground and virtual workplace for the next generation of global technology developers.&quot; </p>
<p>The 24 <strong>Algorithm </strong>semifinalists, representing 11 nationalities, are: </p>
<ul>
  <li>ACRush, China</li>
  <li>AS1_PML30, Russian Federation</li>
  <li>bmerry, &nbsp;South Africa</li>
  <li>dzhulgakov, Ukraine</li>
  <li>gmark, Denmark</li>
  <li>griffon, Russian Federation</li>
  <li>grotmol, Norway</li>
  <li>izulin, Poland</li>
  <li>kefir, Poland</li>
  <li>Klinck, Ukraine</li>
  <li>liympanda, China</li>
  <li>Louty, China</li>
  <li>lucasr, Argentina</li>
  <li>Mimino, Slovakia</li>
  <li>Onufry, Poland</li>
  <li>PaulJefferys, United Kingdom</li>
  <li>Petr, Russian Federation</li>
  <li>RAD., Russian Federation</li>
  <li>rng_58, Japan</li>
  <li>syg96, Russian Federation</li>
  <li>tomekkulczynski, Poland</li>
  <li>Vasyl[alphacom], Ukraine</li>
  <li>w_, Poland</li>
  <li>wata, Japan</li>
  </ul>
<p>The 15 <strong>Design </strong>semifinalists, representing 8 countries are: </p>
<ul>
  <li>argolite, Canada</li>
  <li>Standlove, China</li>
  <li>AleaActaEst, Canada</li>
  <li>saarixx, Ukraine</li>
  <li>mekanizumu, China</li>
  <li>MiG-29, Russian Federation</li>
  <li>caru, Italy</li>
  <li>iogy, Romania</li>
  <li>abkqz, Ukraine</li>
  <li>faeton, Ukraine</li>
  <li>bramandia, Indonesia</li>
  <li>kurtrips, India</li>
  <li>xin135, China</li>
  <li>DanLazar, Romania</li>
  <li>Urmass, Ukraine&nbsp; </li>
</ul>
<p>The 15 <strong>Development </strong>semifinalists, representing 7 countries are: </p>
<ul>
  <li>Yeung, China</li>
  <li>iversonLv, China</li>
  <li>BeBetter, USA</li>
  <li>iRabbit, China</li>
  <li>flexme, China</li>
  <li>quesks, Phillippines</li>
  <li>yext, China</li>
  <li>soso0574, China</li>
  <li>j3_guile, Phillippines</li>
  <li>sandaruwang, Sri Lanka</li>
  <li>mumujava, China</li>
  <li>velorien, Romania</li>
  <li>FireIce, China</li>
  <li>Kit1980, Ukraine</li>
  <li>Akinwale, Nigeria </li>
</ul>
<p>The 12 <strong>Marathon Match semifinalists</strong>, representing 8 countries are: </p>
<ul>
  <li>ACRush, China</li>
  <li>ainu7, South Korea</li>
  <li>chokudai, Japan</li>
  <li>doudouille, France</li>
  <li>irakli, Georgia</li>
  <li>jdmetz, USA</li>
  <li>nhzp339, China</li>
  <li>O_O, China</li>
  <li>ploh, USA</li>
  <li>Psyho, Poland</li>
  <li>tpelkone, Finland</li>
  <li>wata, Japan</li>
</ul>
<p>The 9 <strong>Mod Dash </strong>semifinalists, representing 6 countries are: </p>
<ul>
  <li>2PaVel, Ukraine</li>
  <li>hohosky, China</li>
  <li>humblesunflower, China</li>
  <li>Margarita, Ukraine</li>
  <li>rac_,&nbsp; Poland</li>
  <li>rst9288, India</li>
  <li>supercharger, India</li>
  <li>TeCNoYoTTa, Egypt</li>
  <li>Yeung, China</li>
</ul>
<p>The 10 <strong>Studio competition </strong>semifinalists, representing 7 countries are: </p>
<ul>
  <li>abedavera, Indonesia</li>
  <li>CMYK, Denmark</li>
  <li>daddum, Indonesia</li>
  <li>djackmania, Indonesia</li>
  <li>djnapier, Australia</li>
  <li>idblack, Indonesia</li>
  <li>kathymak, Hong Kong</li>
  <li>mahestro, Venezuela</li>
  <li>oninkxronda, Phillippines</li>
  <li>puchki, India</li>
</ul>
<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world's largest competitive software development community with more than 240,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. For more information about sponsoring TopCoder events and utilizing TopCoder's software services and platforms, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>

<p><em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em></p>

                        <p>###</p>
                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
