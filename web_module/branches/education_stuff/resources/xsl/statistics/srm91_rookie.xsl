<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
		<TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyText">Editorial Archive</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
		</TR>
		<TR>
			<TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;</TD>
		</TR>		
		<TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 91</B><BR/>
May 22, 2002</P>
<P><B>Rookie Review</B></P>

<P>
There was relatively low rookie turnout tonight, resulting in only four rookie 
rooms. 
</P>

<P>At the end of the Coding Phase, the rookie high scorers were: 
<UL>
	<LI><B>Room 64</B></LI> 
<UL>
	<LI>JuanitoBandito - 1046.95</LI> 
	<LI>rumil - 1031.70</LI> 
	<LI>Fuzz - 1024.82</LI>
</UL>
	<LI><B>Room 65</B></LI> 
<UL>
	<LI>lolbrish - 1032.28</LI> 
	<LI>ttilling - 1030.89</LI> 
</UL>
	<LI><B>Room 66</B></LI> 
<UL>
	<LI>jinling - 1068.25</LI> 
	<LI>Partorg - 1049.35</LI>
</UL>
	<LI><B>Room 67</B></LI> 
<UL>
	<LI>StevoD - 1255.72</LI> 
	<LI>manaswini - 1160.82</LI>
</UL>
</UL>
</P>

 
<P>
<B>Challenge Phase</B>
</P>

<P>
In Room 64, <A HREF="/stat?c=member_profile&amp;cr=284062" CLASS="bodyGeneric">JuanitoBandito</A>
 had submitted an empty class for the Level 3 problem. 
Within a minute this was found by <A HREF="/stat?c=member_profile&amp;cr=106370" CLASS="bodyGeneric">rumil</A>
, who successfully challenged it. <B>JuanitoBandito</B> 
then attempted to challenge <A HREF="/stat?c=member_profile&amp;cr=284101" CLASS="bodyGeneric">Fuzz's</A>
 Level 2 submission, but failed, losing an additional 50 
points. <B>Fuzz</B> then retaliated by successfully challenging <B>JuanitoBandito's</B> Level 2 submission.
 <B>JuanitoBandito</B> made the simple mistake of assuming the scores were sorted, thus leading to 
 incorrect output for unsorted inputs. 
</P>

<P>
The only successful challenge in Room 65 was by <A HREF="/stat?c=member_profile&amp;cr=282137" CLASS="bodyGeneric">ttilling</A>
, who successfully challenged 
<A HREF="/stat?c=member_profile&amp;cr=279388" CLASS="bodyGeneric">limer619's</A>
 Level 1 submission, a solution that was so incorrect that it never could have 
passed the sample test cases. There were also two unsuccessful challenges, one of which 
were by <A HREF="/stat?c=member_profile&amp;cr=285601" CLASS="bodyGeneric">lolbrish</A>
, giving <B>ttilling</B> the lead in Room 65. 
</P>

<P>
In Room 66, <A HREF="/stat?c=member_profile&amp;cr=285577" CLASS="bodyGeneric">Partorg</A>
 unsuccessfully challenged gmud's Level 2 submission. <B>Partorg's</B> 
Level 3 submission was later annihilated by <A HREF="/stat?c=member_profile&amp;cr=285308" CLASS="bodyGeneric">SushiK</A>
 (who I presume is a Neal Stephenson fan). 
</P>

<P>
<A HREF="/stat?c=member_profile&amp;cr=285479" CLASS="bodyGeneric">StevoD</A>
 racked up two successful challenges in Room 67, defeating 
 <A HREF="/stat?c=member_profile&amp;cr=281252" CLASS="bodyGeneric">dilipdalton</A>
 and <A HREF="/stat?c=member_profile&amp;cr=260618" CLASS="bodyGeneric">jake's</A>
Level 3 submissions, both with the same test case. <B>jake's</B> solution exhibited the dubious 
practice of using reference equality for string comparisons in Java (e.g., str == "abc", 
as opposed to the safer and more likely to be correct str.equals("abc")), though I'm not 
certain this was what caused his problem to fail. <B>dilipdalton's</B> solution, on the other 
hand, generated a runtime exception for the same case. 
</P>

<P>
At the end of the Challenge Phase, the scores were: 
<UL>
	<LI><B>Room 64</B></LI>
	   <UL>
	    	<LI>rumil - 1081.70</LI> 
	    	<LI>Fuzz - 1074.82</LI> 
	    	<LI>JuanitoBandito - 157.55</LI>
	   </UL>
	<LI><B>Room 65</B></LI> 
	   <UL>
	    	<LI>ttilling - 1080.89</LI> 
	    	<LI>lolbrish - 982.28</LI> 
	   </UL>
	<LI><B>Room 66</B></LI> 
	   <UL>
	    	<LI>jinling - 1068.25</LI> 
	    	<LI>Partorg - 534.13</LI>
	   </UL>
	<LI><B>Room 67</B></LI> 
	   <UL>
	    	<LI>manaswini - 1110.82</LI> 
	    	<LI>StevoD - 765.12</LI>
	  </UL>
</UL>
</P>

<P>
<B>System Test Phase</B>
</P>

<P>
Very few rookies came through the system tests unscathed. While <B>Fuzz's</B> Level 3 
submission failed, both of <B>rumil's</B> Level 2 and Level 3 submissions failed as well, 
giving <B>Fuzz</B> a strong lead in Room 64. In Room 65, <B>lolbrish</B> also lost his Level 2 and 
Level 3 submissions. <B>ttilling</B> performed exceptionally well, being one of the two rookies 
to get all three problems correct. The Level 3 submission of 
<A HREF="/stat?c=member_profile&amp;cr=285611" CLASS="bodyGeneric">jinling</A>
 failed in Room 66, but 
due to <B>Partorg's</B> lack of success during the challenge phase, <B>jinling</B> was able to hold on to 
a slim lead of 52 points. <A HREF="/stat?c=member_profile&amp;cr=277563" CLASS="bodyGeneric">manaswini</A>
 in Room 67 was the only other rookie to get all three problems correct. 
</P>

<P>
The final results showed <B>manaswini</B> and <B>ttilling</B> to have commanding leads over the rest of 
the rookies, with the third highest rookie score being <B>Fuzz's</B> 656.51 points. Despite <B>ttilling's</B> 
successful challenge and <B>manaswini's</B> failed challenge in the Challenge Phase, <B>manaswini</B> still 
earned enough points in the Coding Phase to maintain a very slight 30 point lead over <B>ttilling</B> 
at the end of the contest. 
</P>

<P>
The final scores were: 
<UL>
	<LI><B>Room 64</B></LI> 
	    <UL>
	    	<LI>Fuzz - 656.51</LI> 
	    	<LI>sgiribabu - 529.97</LI>
	    </UL>
	<LI><B>Room 65</B></LI> 
	    <UL>
	    	<LI>ttilling - 1080.89</LI> 
	    	<LI>lolbrish - 178.36</LI> 
	    </UL>
	<LI><B>Room 66</B></LI> 
	    <UL>
	    	<LI>jinling - 586.35</LI> 
	    	<LI>Partorg - 534.13</LI>
	    </UL> 
	<LI><B>Room 67</B></LI> 
	    <UL>
	    	<LI>manaswini - 1110.82</LI> 
	    	<LI>pv - 600.3</LI>
	    </UL>
</UL>
</P>


<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

  <!-- Gutter -->
    <TD WIDTH="4" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  <!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<center><A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_rookie','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A></center><BR/>
<!-- <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
<!-- Right Column Include Begins -->        
        <xsl:call-template name="public_right_col"/>        
<!-- Right Column Include Ends -->        
        </TD>
  <!-- Right Column Ends -->
  <!-- Gutter -->
    <TD WIDTH="25" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" WIDTH="25" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
  </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


