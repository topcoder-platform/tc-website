<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/srm_results.xsl"/>  
  <xsl:import href="../includes/modules/last_srm.xsl"/>
  <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
  <xsl:import href="../includes/modules/coder_week.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>      

<title>Competition Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>      

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<!-- Body Begins -->
<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" valign="top">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="10" valign="top"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->    
        <td class="statText" width="100%" valign="top">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelblue</xsl:with-param>
                <xsl:with-param name="image">statistics</xsl:with-param>
                <xsl:with-param name="title">&#160;Quick Stats</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="5" bgcolor="#001B35" width="100%">
                <tr>
                    <td>
                        <table border="0" cellspacing="0" cellpadding="5" bgcolor="#001B35" width="100%">        
                            <tr valign="top">
                                <td class="statText" width="50%">
                                    <a href="/stat?&amp;c=winning_debuts" class="statText"><img src="/i/stat_labels_win_debuts.gif" alt="Winning Debuts" width="158" height="17" border="0"/></a><br />
                                    This chart represents those members who won their room in their initial Single Round Match... // <a href="/stat?&amp;c=winning_debuts" class="statText">more</a><br /></td>
                                <td class="statText" width="50%">
                                    <a href="/stat?&amp;c=highest_accuracy" class="statText"><img src="/i/stat_labels_sub.gif" alt="Submission Accuracy" width="158" height="17" border="0"/></a><br />
                                    Submission Accuracy is measured by dividing the  number of correct submissions by the number of total submissions by a member...// <a href="/stat?&amp;c=highest_accuracy" class="statText">more</a><br /></td>
                            </tr>
                            
                            <tr valign="top">
                                <td class="statText">
                                    <a href="/stat?&amp;c=all_time_wins" class="statText"><img src="/i/stat_labels_all_wins.gif" alt="All-Time Wins" width="158" height="17" border="0"/></a><br />
                                    This chart ranks the Top-10 in Single Round Match Room Wins.<br/>
                                    <a href="/stat?&amp;c=all_time_wins" class="statText">Overall</a> : 
                                    <a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=1" class="statText">Division I</a> : 
                                    <a href="/stat?&amp;c=all_time_wins_by_div&amp;dn=2" class="statText">Division II</a><br/></td>
                                <td class="statText">
                                    <a href="/stat?&amp;c=impressive_debuts" class="statText"><img src="/i/stat_labels_imp_debuts.gif" alt="Impressive Debuts" width="158" height="17" border="0"/></a><br />
                                    This chart represents the members who have made the most impressive debuts in a Single Round Match... // <a href="/stat?&amp;c=impressive_debuts" class="statText">more</a><br /></td>
                            </tr>
    
                            <tr>
                                <td class="statText" valign="top">
                                    <a href="/stat?&amp;c=highest_totals&amp;dn=1" class="statText"><img src="/i/stat_labels_total.gif" alt="Highest Match Total" width="158" height="17" border="0"/></a><br />
                                    This chart represents the Top-10 highest point totals earned in a Single Round Match.<br/>
                                    <a href="/stat?&amp;c=highest_totals&amp;dn=1" class="statText">Division I</a> : 
                                    <a href="/stat?&amp;c=highest_totals&amp;dn=2" class="statText">Division II</a><br/></td>
                                <td class="statText" valign="top">
                                    <a href="/stat?&amp;c=most_consecutive_wins&amp;dn=1" class="statText"><img src="/i/stat_labels_consec_wins.gif" alt="Consecutive Wins" width="158" height="17" border="0"/></a><br />
                                    This chart represents the longest consecutive room win streaks in Single Round Matches.<br/>
                                    <a href="/stat?&amp;c=most_consecutive_wins&amp;dn=1" class="statText">Division I</a> : 
                                    <a href="/stat?&amp;c=most_consecutive_wins&amp;dn=2" class="statText">Division II</a><br/></td>
                            </tr>
                            
                            <tr>
                                <td class="statText" valign="top">
                                    <a href="/stat?&amp;c=biggest_rating_gains&amp;dn=1" class="statText"><img src="/i/stat_labels_rating.gif" alt="Rating Point Gain" width="158" height="17" border="0"/></a><br />
                                    This chart represents the biggest rating point gain in a Single Round Match.<br/>
                                    <a href="/stat?&amp;c=biggest_rating_gains&amp;dn=1" class="statText">Division I</a> : 
                                    <a href="/stat?&amp;c=biggest_rating_gains&amp;dn=2" class="statText">Division II</a><br/></td>
                                <td class="statText" valign="top">
                                    <a href="/stat?&amp;c=best_challengers" class="statText"><img src="/i/stat_labels_chall.gif" alt="Challenge Success" width="158" height="17" border="0"/></a><br />
                                    Challenge Success is a percentage based on successful challenges divided by total challenges... // <a href="/stat?&amp;c=best_challengers" class="statText">more</a><br /></td>
                            </tr>
                        </table>
                        
                        <p><br/></p>
                        
                    </td>
                </tr>                
            </table>
            
            <p><br/></p>

        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" alt="" border="0" /><br />
            <xsl:call-template name="public_right_col"/>       
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" alt="" border="0" /></td>
<!-- Gutter Ends -->

    </tr>
</table>
<!-- Body Ends -->

<xsl:call-template name="Foot"/>

</body>
</html>

  </xsl:template>
</xsl:stylesheet>

