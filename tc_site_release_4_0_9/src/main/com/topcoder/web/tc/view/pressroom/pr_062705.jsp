<%@  page language="java"  %>
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
                        <div align="center">
                        <p><span class="bodyTitle">TopCoder Announces Sun Microsystems as Title Sponsor for 2005 TopCoder Open</span><br />
                        <span class="bodySubTitle"><em>October World Championship of Competitive Coding Stakes $150,000 In Prizes for Programmers Across Algorithm, Design and Development Categories</em></span></p>
                        </p>
                        </div>
                        
<p><strong>GLASTONBURY, CT, June 27, 2005&#151;</strong>TopCoder, Inc., the leader in online programming competition, skills assessment and competitive software development, announced at the JavaOne Conference today that Sun Microsystems, Inc. (Nasdaq "SUNW"), has been named the title sponsor of the 2005 TopCoder Open (TCO). The Premier event for competitive coding's elite, the 2005 TopCoder Open will bring the world's finest professional and collegiate programmers together for international ranking, celebrity and a share of the $150,000 prize purse for Algorithm, Component Design and Development categories. The Onsite Finals will take place October 12th through 14th at the Santa Clara Marriott in Santa Clara, CA. Full registration details and rules are provided at:  http://www.topcoder.com/tco05
<br><br>
"Sun is excited that this year's TopCoder Open Component Competition will introduce a Java-centric theme," said Dan Roberts, Group Manager Development Tools Marketing at Sun Microsystems. "Developers in the Design and Development contests will compete to build reusable JSF components that simplify user interface builds for Java Web applications. The highest-rated submissions from six separate component competitions will ultimately find their way into the JSF catalogs and libraries of Java users everywhere." 
<br><br>
Component Design and Development registration began June 13th and closes June 29th, with online rounds running weekly through August 18th and a final online round starting on August 24th. The top 8 competitors from each of these categories will advance to the Onsite Finals in Santa Clara, CA on October 12th. Online registration for the Algorithm competition will run August 1 - 16, with qualification rounds beginning August 16th and continuing on a weekly basis through September 7th. The top 48 competitors will advance to the Onsite Finals.  Contestants can compete in the Algorithm or Component competitions, or both. Cash prizes for the 2005 TopCoder Open will comprise $75,000 for the Algorithm contest and $75,000 for the Component tournament ($46,500 Design, $28,500 Development) for an overall prize purse worth $150,000. 
<br><br>
"Both Sun and TopCoder are leaders in our respective fields and we're excited to help advance the Java development industry in terms of the tools and expertise developers need to create reusable software components and applications," said Rob Hughes, President and COO of TopCoder. "As title sponsor of the 2005 TopCoder Open, Sun underscores a shared vision and commitment to developing talent as well as technology."
<br><br>
<span class="bodySubtitle">About Sun Microsystems, Inc.</span><br>
Since its inception in 1982, a singular vision --"The Network Is The Computer" - has propelled Sun Microsystems, Inc. (Nasdaq: SUNW) to its position as a leading provider of industrial-strength hardware, software and services that make the Network. Sun can be found in more than 100 countries and on the World Wide Web at http://www.sun.com
<br><br>
<span class="bodySubtitle">About TopCoder, Inc.</span><br>
TopCoder is the recognized leader in identifying, evaluating and mobilizing effective software development resources. Through its proprietary programming competitions and rating system, TopCoder recognizes and promotes the abilities of the best programmers around the world.  TopCoder Software harnesses the talent of these developers to design, develop and deploy software through its revolutionary competitive development methodology. TopCoder's methodology emphasizes thorough specification and design, distributed development using reusable components, and a rigorous quality assurance review process and results in higher quality, lower cost software solutions than traditional software development methodologies.  For more information about sponsoring TopCoder Events, recruiting TopCoder members and utilizing TopCoder Software, visit www.topcoder.com.
<br><br>
TopCoder is a registered trademark of TopCoder, Inc. in the United States and other countries. All other product and company names herein may be trademarks of their respective owners.
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
