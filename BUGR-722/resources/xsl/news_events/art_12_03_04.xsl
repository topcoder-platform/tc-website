<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/>
  <xsl:import href="../includes/pr_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Press Room</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<!-- Header begins -->
<xsl:call-template name="Top"/>
<!-- Header ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
<!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="99%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="0" cellpadding="10" width="100%">
                <tr valign="top">
                    <td class="prText" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />
                        <div align="center">
                        <p><span class="bodyTitle">Top coders seek bigger prize than cash</span><br/>
                        <span class="bodySubTitle"><em>International Coding Elite From 12 Countries Will Compete for $150,000 Purse in Programming Championship</em></span></p>
                        </div>

						<p>
For many, the TopCoder Open - a sort of Olympics for software programmers - is a chance to win US$150,000 in prize money.
<br/><br/>
The stakes are even higher for young challengers from China. The event is an opportunity to be spotted by recruiters from big-name companies such as Yahoo! or Google, and possibly land a lucrative job in Silicon Valley, in the United States.
<br/><br/>
At the semi-annual event, held earlier this month in California, four mainland programmers competed in a field of just 24, having beaten out more than 1,500 in preliminary events. To hear them tell it, they came for the networking opportunities as much as for the prize money.
<br/><br/>
Jin Guanzhuo, who goes by the code name Standlove, walked away with the top prize in the Algorithm Design and Development competition at the Open, earning US$20,000.
<br/><br/>
Zheng Shao, a 24-year-old student at Tsinghua University, said competition for one of the all-expenses-paid slots was fierce, especially with a large number of talented mainland programmers vying for the chance to compete.
<br/><br/>
"In China, we have a lot of people at our educational level, and we hope to get a higher level of skill," said Mr Zheng (Haha). "We want job opportunities."
<br/><br/>
Getting to the TopCoder Open is an achievement in its own right. Only the cream of the crop make it to the event. TopCoder has about 47,000 members, and about 1,500 compete each week in online coding rounds.
<br/><br/>
Mr Zheng and his fellow programmers - 24-year-old Jin, 20-year-old Zheng Changxi (Tomson) and 25-year-old Wu Jiazhi (WishingBone) - began coding when they were in junior high school, writing code competitively after entering university.
<br/><br/>
This was not Mr Zheng's first time in Silicon Valley. He also competed in the April event. During cocktails, he found a mentor, a Yahoo! executive, who offered the programmer a summer internship at the online giant's headquarters in Sunnyvale.
<br/><br/>
He said he did not make any special preparations for the November competition. "I read a few of my old programming books the night before I got on a plane and came here."
<br/><br/>
A coder since the age of 14, Mr Zheng becomes animated when talking about the dearth of opportunity for young programmers in China.
<br/><br/>
He believed the mainland lacked a culture of invention, and failure was not acceptable. Although many of his Tsinghua classmates have also majored in computer science, they were not as highly paid as their counterparts in the US: programmers at multinationals can earn up to 20,000 yuan per month, but only about 3,000 yuan a month at most domestic firms.
<br/><br/>
Zheng Changxi also became interested in computer science at a young age. His parents purchased a "learning calculator" so he would be drawn away from another hobby.
<br/><br/>
"At home I loved video games. My family feared I would get addicted," he said. 
<br/><br/>
Learning coding skills from his father, Mr Zheng took to competitions to further his game. "I want to be with people around my age and boost my knowledge and skills," he said.
<br/><br/>
At the April event, Mr Zheng met with a Microsoft official from the Asia Pacific, which resulted in a summer internship at the software giant in Beijing, as well as a standing offer for a year-long internship when he finished university.
<br/><br/>
Mr Wu said he would have liked more time to see California. 
<br/><br/>
"I feel like all we've seen so far is the Marriott. I hope in the future I can see some more." 
<br/><br/>
Copyright &#169; 2004 South China Morning Post Publishers Ltd

						</p>

                        <p><br /></p>
                        

                    </td>
                </tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170" valign="top"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="pr_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
