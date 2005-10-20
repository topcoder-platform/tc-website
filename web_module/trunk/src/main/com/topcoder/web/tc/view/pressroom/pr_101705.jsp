<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Press Room</title>

<jsp:include page="../script.jsp" />
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
                <jsp:param name="level1" value="press_room"/>
                <jsp:param name="level2" value=""/>
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
                        <jsp:param name="title" value="Press Release"/>
                    </jsp:include>

<div align="right"><tc-webtag:forumLink forumID="505813" message="Discuss this press release" /></div>

<div align="center">
<p><span class="bodyTitle">Champions Announced In 2005 TopCoder&#174; Open Sponsored by Sun Microsystems</span><br />
<span class="bodySubTitle"><em>Champions from Poland, Russian Federation and China Share $150,000 Prize Purse</em></span></p>
</p>
</div>
                        
<p><strong>GLASTONBURY, CT, October 17, 2005 &#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, today announced that Eryk Kopczy&#241;ski of Poland, Nikolay Archak of the Russian Federation, and Qi Liu of China have won the Algorithm, Design and Development Component tournaments of the 2005 TopCoder Open sponsored by Sun, held at the Santa Clara Marriott in Santa Clara, CA on October 14th.  Kopczy&#241;ski, known to the member base by his handle 'Eryx', beat 48 of the world's top computer programmers during the onsite semifinal and Championship rounds for the $20,000 grand prize in the Algorithm tournament. 
<br><br>
Archak, or 'nicka81' as he is known to the member base, and Liu, known as 'visualage', took home $20,000 and $12,500 respectively as the Design and Development winners in the Component tournament. 
<br><br>
The Algorithm tournament was a timed competition where the participants solved complex algorithmic problems using Java, VB.Net, C++ or C#. The Component tournament was divided into two tracks. The Design competition required competitors to submit a software design based on general requirements and The Development competition asked competitors to develop a re-useable software component from a specific TopCoder guideline. A peer review board evaluated submissions and awarded final point standings based on TopCoder's rigorous scorecard system.
<br><br>
At the start of the Algorithm tournament, Eryx was the 3rd ranked member among more than 64,000 TopCoder members worldwide. Kopczy&#241;ski was the only contestant to successfully submit the difficult 1,000 point problem - which proved to be the deciding factor in an otherwise closely contested Championship round. Eryx beat out second place finisher Po-Ru Loh, aka 'ploh', of the United States and second runner up Michal Forisek, aka 'misof' of Slovakia. The onsite finalists each earned a spot at the event by besting more than 3,200 other programmers from around the world in simultaneous, online competitions. 
<br><br>
"There were many good competitors in the tournament this year, and all had a chance to win," said Kopczy&#241;ski. "Tomek didn't advance this year, so I thought someone from Poland should win!"
<br><br>
"Sun congratulates today's tournament champions along with the other finalists for providing an exciting and entertaining TopCoder Open," said Dan Roberts, Director of Marketing, Developer Tools at Sun Microsystems. "We've seen some amazing creativity in problem solving from our international group of finalists and salute all three champions!"
<br><br>
This year's Design and Development tournament focused on creating generic standards-based JavaServer Faces components designed to take advantage of the rich design time API for Sun's Java Studio Creator.
<br><br>
Archak and Liu won hard fought contests against an elite field of international opponents. Archak took top Design honors over opponents from the US, China and the Phillipines.
<br><br>
"This is very unexpected - I didn't expect such a result," said an elated Archak. "I was quite nervous coming to the TopCoder Open for the first time and thought I had missed everything." 
<br><br>
Liu won the Development title by besting opponents from Sweden, Poland, China, Hong Kong and Indonesia. 
<br><br>
"The finalists in the development tournament were very competitive with very close scores so the margin of victory was quite small," explained Liu.
<br><br>
"It's been an intense two days of competition with plenty of drama and sub plots during the knockout rounds and challenge phase," said Rob Hughes, President and COO of TopCoder, Inc. "TopCoder would like to thank Sun along with our other valued sponsors for supporting and recognizing the entire TopCoder community."
<br><br>
<span class="bodySubtitle">About Sun Microsystems, Inc.</span><br>
Since its inception in 1982, a singular vision --"The Network Is The Computer" - has propelled Sun Microsystems, Inc. (Nasdaq: SUNW) to its position as a leading provider of industrial-strength hardware, software and services that make the Network. Sun can be found in more than 100 countries and on the World Wide Web at http://www.sun.com
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of highly talented programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
<div align="center"><i>TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.</i><div>
                        </p>
                        <p>###</p>
                        <p><br /></p>
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
