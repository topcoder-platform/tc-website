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
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Press Room</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
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
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">press_room</xsl:with-param>
  <xsl:with-param name="title">&#160;Articles</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="smallText" COLSPAN="2" HEIGHT="18">&#160;</TD></TR>
						<TR><TD VALIGN="middle" CLASS="statTextBig" COLSPAN="2" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18">&#160;Articles - 2001</TD></TR> 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>                 
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><BR/><BR/><DIV ALIGN="center"><IMG SRC="/i/pressroom/avidpronet_frontpage.jpg" ALT="" WIDTH="428" HEIGHT="28" BORDER="0"/></DIV><BR/><BR/>
						Jul 2, 2001 7:03 PM<BR/>
						Gladiator geeks...<BR/>
						by Jared Kendall<BR/><BR/>
						Oftentimes my readers write to ask why I chose to cover a particular topic, so I've decided to start including a personal note with each column. Here's my 
						thinking for this column:<BR/><BR/>Human beings thrive on competition -- even reclusive, sedentary nerd types. I think good programmers would love to have 
						a way to prove their talent, and TopCoder will finally give them a way to do it. It'll be interesting to see how things play out.<BR/><BR/>
						Computer programmers are like spouses. Everyone wants the best, but by the time you really get to know yours, it's often too late. Like spouses, there never seem to be enough to go 
						around. You have a hard time telling whether yours is any good. Even if the one you end up with is lousy, you're afraid to lose them, on the chance that the next one could be even worse.<BR/><BR/>
						It's a stormy business relationship, to say the least.<BR/><BR/>TopCoder thinks it may have a solution: Programming tournaments. The idea is to take a bunch of 
						programmers, and set them up in direct, head-to-head competition to see just how good they really are. The idea is to provide firms with a way to 
						distinguish between people who really know how to program, and those that have just taken all the right classes, passed the right tests.<BR/><BR/>
						Programming is more than just a function of training. It also involves some natural, instinctual talents. You can take two people and put them through the same programming class and end up with vastly 
						different results. The truth is, all programmers are not equal. Not even close. Some of us are born to code. Others, like myself, just 
						aren't.<BR/><BR/>Unfortunately, there haven't been many ways to tell the difference. On paper, programmers tend to look a lot alike. Being 
						certified in a particular platform just means that you have a certain amount of knowledge. Programming is more about skill than it is about 
						knowledge, so if all you can do is measure knowledge, you're in trouble.<BR/><BR/>Most tests measure whether you know what a particular 
						command does. TopCoder aims to see instead how you apply those commands in the real world. It's like the difference between asking an artist about 
						colors of paint, and asking him to paint you a portrait. The portrait is what matters.<BR/><BR/>As businesses come to rely on computers, they also 
						come to rely on programmers. They just haven't had a good way to rate those programmers. Even if the programmer works for you, it's hard to tell 
						that they know what they're doing. After all, they're bound to know more about what they're doing than you do. How can you tell whether a project 
						is running into delays because the programmer is incompetent, or because it just turned out to be more difficult than originally 
						anticipated?<BR/><BR/>Asking a programmer to tell you whether he stinks is like asking a car salesman whether his cars are any good. The answer you 
						receive is one which you've got to take with a grain of salt. The source is biased, and has a vested interest in the sort of answer you get. You 
						can't tell whether the guy is any good, and he isn't about to tell you that he isn't.<BR/><BR/>Usually, firms don't find out that they were saddled 
						with a second-rate programmer until a new, better programmer comes in and finds flaws in the code that was left behind. This sort of post- mortem 
						evaluation doesn't do you a whole heck of a lot of good. 20/20 hindsight is primarily useful for historians and tail gunners. About the best the 
						rest of us can do is say, "Well, gee, I guess I'm glad he's gone, at least." Which is weak consolation, to say the least.<BR/><BR/>It will be 
						interesting to see if TopCoder can make much money in their venture, as they plan to turn a profit by having firms pay for access to the talent 
						TopCoder uncovers. Whether they make a buck at it or not, I think they have hit upon a system that really will reveal the best programmers out 
						there. Not that it will matter to most businesses.<BR/><BR/>The biggest problem here is that there's a shortage of programmers in general, let 
						alone competent ones. The firms that can afford to attract the champion coders TopCoder will identify will benefit, but the rest of the business 
						world will just have to keep on muddling through. Pageants might be nice, but we can't all marry the winners. Most of us take what we can get, and 
						hope that what we get isn't so bad. We know there are other fish in the sea, we just aren't so sure we can afford to go fishing.<BR/>
						</TD></TR>                                                                 
					</TABLE>
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
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="pr_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>
