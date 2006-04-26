<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
<jsp:include page="../style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">


            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                    <jsp:include page="../page_title.jsp" >
                        <jsp:param name="image" value="press_room"/>
                        <jsp:param name="title" value="Article"/>
                    </jsp:include>
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder's Jack Hughes Appears on CNN's "Lou Dobbs Tonight"</span><br/>
                        <span class="bodySubTitle"><em>Founder Featured in Discussion on Global Programming Talent: Who are the TopCoders?</em></span></p>
                        </div>

<p>
TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that TopCoder Founder and Chairman, Jack Hughes, was interviewed this week on CNN's <A href="http://www.cnn.com/CNN/Programs/lou.dobbs.tonight/">Lou Dobbs Tonight</A>. In the segment titled "Champion Coders", Hughes explained how proficiency with mathematical algorithms, as the underlying piece of logic in a computer program, is an extremely important skill for programmers. TopCoder competitions have created a global ranking of programmers in algorithmic competitions as well as components and application design and development. The segment focused on our measurement of the skills of developers in different countries and at various universities, in particular, in the U.S. and India. 
<br /><br />
<strong>WHO:</strong> CNN Lou Dobbs Tonight - Jack Hughes, Founder and Chairman, TopCoder, Inc.<br />
<strong>WHAT:</strong> Who are the champion coders? Comparison between U.S. and Indian tournament data.<br />
<strong>WHEN:</strong> Monday, January 31, 2005 6:00 p.m. Eastern <br />
<strong>VISUALS:</strong> Interview with Jack Hughes, On-Air B-Roll of TopCoder events. Data points from TopCoder research.
<br /><br />
A rush transcript of the interview is available online at <A href="http://www.cnn.com/TRANSCRIPTS/0408/10/ldt.00.html">CNN's transcript website</A>. [See under "Exporting America: India Too Costly?" aired Monday, January 31, 2005 at 6:00 p.m. (ET).] 
<br /><br />
TopCoder, Inc. was established with the purpose of identifying top computer software engineers world-wide. Since 2001, the company's worldwide membership has grown to over 50,000 developers many of whom who compete regularly in weekly programming matches and high stakes international tournaments. 
<br /><br />
"We're pleased to have been asked to share our industry expertise with Lou Dobbs Tonight and the CNN audience," said Rob Hughes, President and COO TopCoder, Inc.
<br /><br />
"Results from our global programming tournaments show an undeniable correlation between quality math and science education infrastructures and the ability to produce <br /><br />world class software programming talent.
<br /><br />
<span class="bodySubtitle">About TopCoder, Inc.</span><br />
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world. TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies. For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit <A href="/">http://www.topcoder.com.</A> 
<br /><br />
TopCoder is a trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
</p>
ê                        <p><br /></p>
                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
