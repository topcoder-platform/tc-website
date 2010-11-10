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

<title>TopCoder | Press Room</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr>

    <!-- Left Column Begins -->
        <td width="180" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4" valign="top"><img src="/i/table_top_fill.gif" width="4" height="26" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->	
        <td class="bodyText" width="100%" valign="top">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">press_room</xsl:with-param>
                <xsl:with-param name="title">&#160;Articles - 2003</xsl:with-param>
            </xsl:call-template>
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr><td valign="middle" class="bodyText" colspan="2"><img src="/i/clear.gif" alt="" width="1" height="23" border="0"/></td></tr>
                <tr>
                    <td valign="top" width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="400" height="1" border="0"/><br />

                        <div align="center"><img src="/i/pressroom/the_age_logo.gif" alt="The Age (Melbourne, Australia)" width="302" height="56" border="0" /></div>

                        <h2>John Dethridge Receives Award</h2>
                        <p>2002 TopCoder Invitational Winner Honored by Governor John Landy</p>
                        
                        <p><a href="http://newsstore.f2.com.au/apps/viewDocument.ac?sid=24788309&amp;sy=age&amp;kw=John+Dethridge&amp;pb=all_ffx&amp;dt=selectRange&amp;dr=1year&amp;so=relevance&amp;st=nw&amp;ss=AGE&amp;sf=all&amp;rc=10&amp;rm=200&amp;clsPage=1&amp;docID=AGE030320B42D04Q56QU" target="_blank">Read original article</a> (Paid subscription required)<br />
                        March 20, 2003<br />
                        <em>By Lucy Beaumont</em></p>

                        <p>When Zerina Lokmic arrived in Australia in 1992 as a refugee from war-torn Bosnia, she never dreamed she 
                        would one day be applauded in the Windsor Hotel ballroom.</p>

                        <p>"I came here and I didn't speak any English. In 10 years, I've done quite a lot," Ms Lokmic, 26, said yesterday 
                        after being honoured by the Rotary Club of Melbourne with a young achiever award for her medical science work.</p>

                        <p>"I can't believe that I came from this little village that is not even on the map, and here I am in Melbourne, 
                        doing great stuff and using whatever I learn for the benefit of others."</p>

                        <p>Ms Lokmic, who is combining her PhD studies with vascular engineering research at St Vincent's Hospital, 
                        was among three young Victorians recognised for their achievements yesterday.</p>

                        <p>Other award winners were Benjamin Namdarin, 22, and John Dethridge, 23.</p>

                        <p>Mr Namdarin, a final-year medical student at Melbourne University, was honoured for his medical and 
                        musical achievements.</p>

                        <p>He said his recent secondments with doctors treating Northern Territory Aboriginal communities and people 
                        in East Timor had confirmed his interest in Third World health.</p>

                        <p>"I will never again take for granted the luxuries we have here in Melbourne... roads, sanitation, clean water 
                        and education," he said.</p>

                        <p>Mr Namdarin, an accomplished violinist and chorister, said the award confirmed that perhaps he was "doing 
                        the right thing".</p>

                        <p>Mr Dethridge, who won the TopCoder international computer programming competition first prize of 
                        $US50,000 ($A84,480) last November, plans to extend and pass on his skills to the next generation of Australian
                        mathematicians and computer scientists.</p>

                        <p>"Australia has talented individuals in many fields," he said. "By recognising and capitalising on their skills, I 
                        believe we can compete against the best in the world in science and industry."</p>

                        <p>Governor John Landy, who presented the awards, said the recipients were an inspiration to young people who 
                        needed "positive role models and leaders who are not necessarily entertainers or sporting heroes".</p>

                        <p>"I think it's tremendously important to be honouring people who've achieved so much academically," he said.</p>

                        <p><br /></p>

                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr><td colspan="3" valign="top" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>   	
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

<xsl:call-template name="Foot"/>

</body>

</html>

  </xsl:template>
</xsl:stylesheet>
