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
                    
<div align="right"><tc-webtag:forumLink forumID="528767" message="Discuss this press release" /></div>
                        
<div align="center">
<p><span class="bodyTitle">TopCoder Announces 2009 TopCoder Open Onsite Competitors for World Championship of Programming</span><br />
<span class="bodySubTitle"><em>Top 76 Finalists from 17 Countries to Meet June 4th in Las Vegas, NV</em></span></p>
</div>
      
<p><strong>Glastonbury, Conn. - May 13, 2009 - </strong>TopCoder&reg;, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced the 76 international onsite semifinalists who have advanced to the Championship rounds of the 2009 TopCoder Open. The company also announced today that IEEE-USA, SNIA-XAM and patron NSA have been joined in their support of the tournament by new sponsor Facebook. This annual TopCoder tournament is open to professionals and students worldwide and will award cash prizes totaling $150,000. The tournament's Championship round will be held Thursday, June 4th at the Mirage Resort in Las Vegas, Nevada. This year’s TCO has expanded to include a record nine tracks of competition, offering a specialized opportunity for members to test their skills in every aspect of software. The full lineup of competition tracks include: Algorithm; Architecture; Assembly; Component Design; Component Development; Marathon; Mod Dash; Specification and Studio Design. Full details are provided at: <a href="http://www.topcoder.com/tco09">www.topcoder.com/tco09</a>.</p>

<p>The 18 semi finalists in the <strong>Algorithm Coding Competition</strong>, representing 9 nationalities, are:
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>ACRush, China</li>
			<li>andrewzta, Russian Federation</li>
			<li>crazyb0y, China</li>
			<li>lucasr, Argentina</li>
			<li>Ostap, Ukraine</li>
			<li>Petr, Russian Federation</li>
			<li>SnapDragon, Canada</li>
			<li>UdH-WiNGeR, Russian Federation</li>
			<li>yuhch123, China</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>(iwi), Japan</li>
			<li>blueblimp, Canada</li>
			<li>gluk, Ukraine</li>
			<li>Im2Good, Norway</li>
			<li>marek_cygan, Poland</li>
			<li>pdallago, Argentina</li>
			<li>syg96, Russian Federation</li>
			<li>wata, Japan</li>
			<li>WSX, Slovakia</li>
		</ul><br />
	</div>
</p>

<p>The 10 semi finalists in the <strong>Marathon competition</strong>, representing 6 countries are: 
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>AlexanderL, Ukraine</li>
			<li>KOTEHOK, Russian Federation</li>
			<li>nhzp339, China</li>
			<li>Psyho, Poland</li>
			<li>wleite, Brazil</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>jdmetz, USA</li>
			<li>maniek, Poland</li>
			<li>prober, China</li>
			<li>roma, Ukraine</li>
			<li>zibada, Russian Federation</li>
		</ul><br />
	</div>
</p>

<p>The 8 semi finalists in the new <strong>Mod Dash competition</strong>, representing 5 countries are: 
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>cucu, Argentina</li>
			<li>saarixx, Ukraine</li>
			<li>PE, China</li>
			<li>will.xie, China</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>enefem21, Indonesia</li>
			<li>Margarita, Ukraine</li>
			<li>ShindouHikaru, Philippines</li>
			<li>Yeung, China</li>
		</ul><br />
	</div>
</p>

<p>The 10 semi finalists in the <strong>TopCoder Studio competition</strong>, representing 5 countries are: 
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>abedavera, Indonesia</li>
			<li>djnapier, Australia</li>
			<li>foxyhu, China</li>
			<li>mahestro, Venezuela</li>
			<li>sweetpea, Indonesia</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>djackmania, Indonesia</li>
			<li>Elizabethhee, China</li>
			<li>oton, Indonesia</li>
			<li>oninkxronda, Philippines</li>
			<li>Tricia_Tjia, Indonesia</li>
		</ul><br />
	</div>
</p>

<p>The 6 finalists in the <strong>Architecture competition</strong>, representing 5 countries are:  
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>Standlove, China * (winner)</li>
			<li>Ghostar, USA</li>
			<li>the_best, Ukraine</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>argolite, Canada</li>
			<li>AleaActaEst, Canada</li>
			<li>saevio, Romania</li>
		</ul><br />
	</div>
</p>

<p>The 6 finalists in the <strong>Assembly competition</strong>, representing 4 countries are:   
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>pulky, Argentina * (winner)</li>
			<li>PE, China</li>
			<li>retunsky, Russian Federation</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>oldbig, China</li>
			<li>pinoydream, Philippines</li>
			<li>BeBetter, China</li>
		</ul><br />
	</div>
</p>

<p>The 10 finalists in the <strong>Design competition</strong>, representing 8 countries are:  
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>saarixx, Ukraine * (winner)</li>
			<li>bramandia, Indonesia</li>
			<li>gevak, Russian Federation</li>
			<li>Mafy, Romania</li>
			<li>Standlove, China</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>argolite, Canada</li>
			<li>caru, Italy</li>
			<li>Indemar, Romania</li>
			<li>nicka81, Russian Federation</li>
			<li>Pops, USA</li>
		</ul><br />
	</div>
</p>

<p>The 10 finalists in the <strong>Development competition</strong>, representing 4 countries are:   
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>assistant, China * (winner)</li>
			<li>hefeng, China</li>
			<li>morehappiness, China</li>
			<li>romanoTC, Brazil</li>
			<li>Orange_Cloud, Russian Federation</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>Hacker_QC, China</li>
			<li>iKnown, China</li>
			<li>myxgyy, China</li>
			<li>velorien, Romania</li>
			<li>EveningSun, China</li>
		</ul><br />
	</div>
</p>

<p>And finally, the 2 finalists in the <strong>Specification competition</strong>, representing 2 countries are: 
	<div style="float: left; width: 50%;">
		<ul style=" margin-top: 0;">
			<li>AleaActEst, Canada * (winner)</li>
		</ul><br />
	</div>
	<div style="float: left; width: 50%;">
		<ul style="margin-top: 0;">
			<li>MiG-29, Russian Federation</li>
		</ul><br />
	</div>
</p>

<p>"TopCoder is excited to continue to welcome some of the brightest thinkers in the world to our flagship tournament, the TopCoder Open," said Rob Hughes, President and COO of TopCoder, Inc. "We also would like to express our thanks to returning patron NSA, and first time sponsors IEEE-USA, SNIA-XAM and Facebook, without whose support we could not present this platform for showcasing these highly skilled and impressive individuals."</p>

<p>The TCO offers sponsors equal billing with the same opportunities for global branding and interfacing with the TopCoder community and onsite finalists. This year the TopCoder Open attracted nearly 6,000 of the top software developers from around the world to match skills in a variety of competitions, with the 2008 TCO having drawn more than 4,600 across all competitions. TopCoder competitions offer sponsors a powerful branding platform within the TopCoder global community of proven developers that provides a unique opportunity to build valuable relationships and to hire some of the best developers in the world.</p>

<p><a href="http://www.topcoder.com/tco09">The TopCoder Open</a> is host to both professional and collegiate developers, who compete head-to-head over several online elimination rounds until the best are flown in to compete in person at the onsite finals. This event is dominated by the highest rated members in the TopCoder community, but enjoys heavy participation and spectatorship from developers and business professionals of all levels. </p>

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
