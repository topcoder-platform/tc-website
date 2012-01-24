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
                    
<div align="right"><tc-webtag:forumLink forumID="528768" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces 2009 TopCoder Open Champions</span><br />
<span class="bodySubTitle"><em>Top Programmers Share $150,000 in Prizes; High School Student From China Earns International Honors from Global Software Development Competition in Las Vegas</em></span></p>
</div>
      
<p><strong>Las Vegas, NV - June 5, 2009 - </strong><a href="http://www.topcoder.com">TopCoder</a>&reg;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the Champions for all 9 tracks of the 2009 TopCoder Open along with a new accessibility challenge. Chinese member Bin Jin, known by his TopCoder handle crazyb0y, took top honors in the Algorithm competition. Members from China, Russian Federation, Argentina, Australia, Ukraine and Canada won their respective competitions in Mod Dash, Architecture, Development, Marathon Competition, Assembly, TopCoder Studio, Design and Specification. Sponsors of the 2009 TopCoder Open included IEEE-USA, SNIA-XAM, Facebook and patron NSA. Additional support was provided by AOL for the Sensations Developer Challenge. The competition attracted nearly 6,000 registrants earlier in the year, and after a series of online qualification rounds, 76 of the top finalists were flown in from 17 different countries to compete live on stage in Las Vegas. Full details of the 2009 TopCoder Open are available at <a href="http://www.topcoder.com/tco09">www.topcoder.com/tco09</a>.</p>

<p><strong>2009 TopCoder Open Results</strong><br />
Algorithm Coding Champion $10,000 Prize: Bin Jin, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=22675094">crazyb0y</a>, of Shanghai, China. Jin, a student from Changzhou High School, also won this year’s 2009 TopCoder High School International tournament.
	<div style="float: left; width: 50%;">
		<strong>Algorithm Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>crazyb0y, China * (winner)</strong></li>
			<li>Petr, Russian Federation</li>
			<li>SnapDragon, Canada</li>
			<li>lucasr, Argentina</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>Im2Good, Norway</li>
			<li>syg96, Russian Federation</li>
			<li>UdH-WiNGeR, Russian Federation</li>
			<li>marek_cygan, Poland</li>
		</ul><br />
	</div>
</p>

<p>Marathon Competition Champion $10,000 Prize: Andrey Lopatin, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=15805598">KOTEHOK</a>, of St. Petersburg, Russian Federation. 
	<div style="float: left; width: 50%;">
		<strong>Marathon Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>KOTEHOK, Russian Federation * (winner)</strong></li>
			<li>AlexanderL, Ukraine</li>
			<li>nhzp339, China</li>
			<li>Psyho, Poland</li>
			<li>wleite, Brazil</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>maniek, Poland</li>
			<li>jdmetz, USA</li>
			<li>prober, China</li>
			<li>roma, Ukraine</li>
			<li>zibada, Russian Federation</li>
		</ul><br />
	</div>
</p>

<p>Mod Dash Champion $10,000 Prize: Ninghai Huang, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=9998760">PE</a>, of Beijing, China.
	<div style="float: left; width: 50%;">
		<strong>Mod Dash Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>PE, China * (winner)</strong></li>
			<li>cucu, Argentina</li>
			<li>saarixx, Ukraine</li>
			<li>will.xie, China</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>ShindouHikaru, Philippines</li>
			<li>enefem21, Indonesia</li>
			<li>Margarita, Ukraine</li>
			<li>Yeung, China</li>
		</ul><br />
	</div>
</p>

<p>TopCoder Studio Champion $15,000 Prize: Dale Napier, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=19989263">djnapier</a>, of Brisbane, Australia. 
	<div style="float: left; width: 50%;">
		<strong>TopCoder Studio Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>djnapier, Australia * (winner)</strong></li>
			<li>abedavera, Indonesia</li>
			<li>foxyhu, China</li>
			<li>mahestro, Venezuela</li>
			<li>sweetpea, Indonesia</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>Elizabethhee, China</li>
			<li>djackmania, Indonesia</li>
			<li>oton, Indonesia</li>
			<li>oninkxronda, Philippines</li>
			<li>Tricia_Tjia, Indonesia</li>
		</ul><br />
	</div>
</p>

<p>Architecture Champion $10,000 Prize: GuanZhuo Jin, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=310233">Standlove</a>, of Hangzhou City, China.
	<div style="float: left; width: 50%;">
		<strong>Architecture Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>Standlove, China * (winner)</strong></li>
			<li>Ghostar, USA</li>
			<li>the_best, Ukraine</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>argolite, Canada</li>
			<li>AleaActaEst, Canada</li>
			<li>saevio, Romania</li>
		</ul><br />
	</div>
</p>

<p>Assembly Champion $10,000 Prize: Pablo Wolfus, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=14882871">pulky</a> of Buenos Aires, Argentina. 
	<div style="float: left; width: 50%;">
		<strong>Assembly Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>pulky, Argentina * (winner)</strong></li>
			<li>PE, China</li>
			<li>retunsky, Russian Federation</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>oldbig, China</li>
			<li>pinoydream, Philippines</li>
			<li>BeBetter, China</li>
		</ul><br />
	</div>
</p>

<p>Design Champion $10,000 Prize: Olexiy Sadovnikov, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=21932422">saarixx</a>, of Dniepropetrovsk, Ukraine.
	<div style="float: left; width: 50%;">
		<strong>Design Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>saarixx, Ukraine * (winner)</strong></li>
			<li>bramandia, Indonesia</li>
			<li>gevak, Russian Federation</li>
			<li>Mafy, Romania</li>
			<li>Standlove, China</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>argolite, Canada</li>
			<li>caru, Italy</li>
			<li>Indemar, Romania</li>
			<li>nicka81, Russian Federation</li>
			<li>Pops, USA</li>
		</ul><br />
	</div>
</p>

<p>Development Champion $10,000 Prize: Yanbo Wu, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=20076717">assistant</a>, of Adelaide, Australia & China.   
	<div style="float: left; width: 50%;">
		<strong>Development Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>assistant, China * (winner)</strong></li>
			<li>hefeng, China</li>
			<li>morehappiness, China</li>
			<li>romanoTC, Brazil</li>
			<li>Orange_Cloud, Russian Federation</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>Hacker_QC, China</li>
			<li>iKnown, China</li>
			<li>myxgyy, China</li>
			<li>velorien, Romania</li>
			<li>EveningSun, China</li>
		</ul><br />
	</div>
</p>

<p>Specification Champion: Piotr Paweska, TopCoder handle <a href="http://www.topcoder.com/tc?module=MemberProfile&cr=252022">AleaActaEst</a>, of Toronto, Canada.
	<div style="float: left; width: 50%;">
		<strong>Specification Finalists</strong>
		<ul style=" margin-top: 0;">
			<li><strong>AleaActEst, Canada * (winner)</strong></li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		&nbsp;
		<ul style="margin-top: 0;">
			<li>MiG-29, Russian Federation</li>
		</ul><br />
	</div>
</p>

<p>In addition to the nine tracks of competition, a special event, the <a href="http://sensations.aol.com/">AOL/TopCoder Sensations Developer Challenge</a>, was won by a group of TopCoder members whose contributions to the winning application "<a href="http://sensations.aol.com/sensations-app-accessible-walking-directions/">Accessible Walking Directions</a>" earned them a share a $25,000 bonus prize. Honorable mention went to the runner up submission "<a href="http://sensations.aol.com/sensations-app-my-parents-email-client/">My Parents’ Email Client</a>". </p>

<p>The Sensations Developer Challenge was focused on advancing internet accessibility and utilizing all software development and Studio tracks of TCO'09 competition to build solutions for improved usability of mainstream internet-based products by people with disabilities.</p>

<p>"This year’s TCO reflected the evolution of innovation and growth that is so much a part of our community and the company which supports it," said Rob Hughes, President and COO of TopCoder, Inc. "TopCoder would like to thank our valued sponsors IEEE-USA, SNIA-XAM, Facebook and patron NSA for supporting and recognizing the entire TopCoder community."</p>

<p>This annual TopCoder tournament is open to professionals and students worldwide and offers a unique opportunity for members to test their skills in every aspect of software development and graphics.</p>

<p><strong>About TopCoder, Inc.</strong><br />
TopCoder is the world’s largest competitive software development community with nearly 200,000 developers representing over 200 countries. TopCoder hosts the largest and most comprehensive developer ratings and performance metrics available. The TopCoder community builds software for a wide-ranging client base through a competitive, rigorous, standards based methodology. This methodology results in a highly consistent set of software components allowing a software-as-parts approach to application development. TopCoder makes this large library of software components built through competition available to all of our clients. Utilizing a world-wide member base and this library, TopCoder seeks to lower the cost of software development while increasing both the speed at which applications can be developed and the quality of the ultimate application. For more information about sponsoring TopCoder events, recruiting TopCoder members and utilizing TopCoder's software services, visit <a href="http://www.topcoder.com">www.topcoder.com</a>.</p>
<p>
<em>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</em>
</p>
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
