<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/support/public_support_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Support/FAQs</TITLE>
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
        <xsl:call-template name="public_support_left"/>
	<!-- Global Seconday Nav Ends -->		
<!-- Left Column Include Ends -->							
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="8" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#CCCCCC" VALIGN="top"><img src="/i/clear.gif" width="240" height="1" VSPACE="5" BORDER="0"/><BR/>
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;General FAQ</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                   <BR/>
                   <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR><TD VALIGN="middle" ALIGN="left"><A HREF="#10" CLASS="bodyText"><B>What Is "TopCoder"?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#20" CLASS="bodyText"><B>What's in it for me?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#25" CLASS="bodyText"><B>What's in it for TopCoder?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#30" CLASS="bodyText"><B>Who can participate in TopCoder tournaments?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#40" CLASS="bodyText"><B>Who are the creators of the "TopCoder" site?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#45" CLASS="bodyText"><B>What technologies have been used to build TopCoder's site and tournament applications?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#50" CLASS="bodyText"><B>If I give you private information, how do I know it'll be safe?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#60" CLASS="bodyText"><B>How does the tournament work?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#65" CLASS="bodyText"><B>Do you really think this is a good way to measure the relative merit of programmers?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#67" CLASS="bodyText"><B>Who owns the source code that I write during tournaments?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#70" CLASS="bodyText"><B>Who's supplying the prizes?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#80" CLASS="bodyText"><B>How does the rating system work?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#90" CLASS="bodyText"><B>How will I know where I stand in the ratings?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#110" CLASS="bodyText"><B>How do I find out when the next tournament is being held?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#120" CLASS="bodyText"><B>In contests open to everyone, will college students be competing against professionals, or will there be separate divisions?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#130" CLASS="bodyText"><B>What do I need to do in order to participate in a TopCoder match?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#140" CLASS="bodyText"><B>If I miss the match registration period, can TopCoder just place me in a room, allowing me to compete?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                        
                        <TR><TD><A HREF="#150" CLASS="bodyText"><B>After I register for a TopCoder competition, do I need to stay logged into the applet until the competition starts?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#160" CLASS="bodyText"><B>How long do TopCoder competitions last?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#170" CLASS="bodyText"><B>How do I get paid after I've won money in a TopCoder competition?</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                        
                        <TR><TD><A HREF="#180" CLASS="bodyText"><B>I'm having a problem with font properties on Linux platforms.</B></A></TD></TR>

                                                                      
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac1" CLASS="bodyText"><B>The small HTML window that holds the contest applet does not load up the applet in MAC OSX</B></A></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac2" CLASS="bodyText"><B>Once I log into the Arena the menu's are transparent in MAC OSX </B></A></TD></TR>                         
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac3" CLASS="bodyText"><B>I tried loading the Arena through the JWS link and I'm getting an error when JWS is running that the applet cannot be loaded.</B></A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                       
                        <TR>
                            <TD CLASS="bodyText">
                                    <B>More Questions? <A HREF="/?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B>
                            </TD>
                        </TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <!--end questions-->
                        <TR><TD VALIGN="top" CLASS="bodyText"> <B>For FAQs specific to the competition phase, see the <A HREF="/?t=support&amp;c=comp_faq" CLASS="bodyText">Competition FAQ</A>.</B></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="25" BORDER="0"/></TD></TR>
                        <!--begin answers-->
                        <TR><TD CLASS="bodyText"><A NAME="10"><B>What is "TopCoder"?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">TopCoder, a site designed <I>for</I> programmers <I>by</I> programmers, builds opportunity and community for programmers through computer programming tournaments and employer referrals.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="20"><B>What's in it for me?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">This site will provide a means for coders to prove their coding ability in tournaments.  A purse is divided among the winners.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="25"><B>What's in it for TopCoder?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">TopCoder is a commercial endeavor; we need to make money to keep running.  We plan to make money by charging corporate sponsors and subscribers for the right to query our members' competition statistics.  We are planning a "work-flow" type system that will broker the initial communication that takes place from our sponsors and subscribers to our members.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="30"><B>Who can participate in TopCoder tournaments?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Anyone can be a member of TopCoder.  Some tournaments are open to all programmers; others are for specific groups. For instance, the TopCoder 2001 Collegiate Challenge Tournament is targeted very specifically towards residents of the United States who are matriculated full-time at an accredited American college or university. The details of each tournament will outline the elegibility requirements.</TD></TR>
                        <TR><TD CLASS="bodyText" VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="40"><B>Who are the creators of the "TopCoder" site?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Jack Hughes, a fellow programmer, came up with the idea for TopCoder. You can get his perspective as well as more About TopCoder if you <A HREF="/?t=about_tc&amp;c=index" CLASS="bodyText">click here</A>. As for what TopCoder is to become, that is in part up to you. We are asking for input from the developer community in order to make this site the best it can be. <A HREF="/?t=contacts&amp;c=index" CLASS="bodyText">Contact us</A> with any suggestions you may have. If you're a member, you can also introduce your ideas in one of our <A TARGET="_top" HREF="/rtables/index.jsp" CLASS="bodyText">roundtable discussions</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="45"><B>What technologies have been used to build TopCoder's site and tournament applications?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">So far, all of the code we've written is in Java.  We use Apache (Stronghold) for our web servers, Weblogic for our J2EE server layer, PostgreSQL for our database, Jive for our Round Tables, and Apache Xalan for XML translation.  All of our servers are running RedHat Linux.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="50"><B>If I give you profile information, how do I know it'll be safe?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Because we value privacy as much as we value programmers. You deserve to keep your private information private, and to benefit any time you let someone use your information. TopCoder is determined to be true to that. When you give us information, it will be for the benefit of only three parties: you, TopCoder, Inc. and participating sponsors. If you have any questions or comments about our privacy practices, you can <A HREF="/?t=contacts&amp;c=index">contact us</A> or for more details you can <A HREF="/?c=privacy" CLASS="bodyText">go to the "Privacy" section.</A></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="60"><B>How does the tournament work?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Head-to-head contests will determine who becomes the next TopCoder.<BR/>These contests have two phases: the coding phase and the challenge phase.<BR/><BR/>
							<UL>
							<LI>In the coding phase, contestants will be given a set of problems to solve using their programming skills.</LI>
                            <LI>In the challenge phase, participants have the opportunity to review their competitors' code for errors. Successful challenges contribute to the overall standing of both the challenger and the developer whose code gets challenged.</LI>
                           </UL>
						</TD>
						</TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="65"><B>Do you really think this is a good way to measure the relative merit of programmers?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">The ability to quickly code solutions to a set of somewhat simple algorithmic problems does not completely define a "top" programmer. However, our attempt to make TopCoder tournaments as objective as possible has initially lead us in this direction.  We continuously discuss ways in which we might introduce code elegance, style, reusability, and other less objectively ratable elements into our tournaments.  We'd love to hear any suggestions on how this might be accomplished.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="67"><B>Who owns the source code that I write during tournaments?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">The coder.  Our Terms of Use agreement basically specifies that the coder who submits any source code to TopCoder owns the code.  We simply require that we can display the source code for the normal course of the tournaments.  The actual source code is viewable during certain parts of the competition to competitors and spectators. You can read the complete Terms of Use agreement <A HREF="/?c=terms" CLASS="bodyText">here</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="70"><B>Who's supplying the prizes?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">At first the tournaments will be sponsored exclusively by TopCoder, Inc. Future tournaments will be jointly or exclusively sponsored by companies interested in supporting programmers and promoting themselves (as employers) or their products.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="80"><B>How does the rating system work?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Each tournament round is an elimination round. Contestants survive to subsequent rounds by being the fastest to write working programs that accurately answer the challenge question(s). Ratings will then be adjusted by comparing the competitor's record against the other members.  The details of the rating formula can be found <A HREF="/index?t=support&amp;c=ratings" CLASS="bodyText"> here</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="90"><B>How will I know where I stand in the ratings?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Once registered, you can log in to the member side of the site. The first page you will come to is your personalized home page called "Member Home". On this page you will find a summary of your performance in competition to date including your rating and ranking.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="110"><B>How do I find out when the next tournament is being held?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Just click on this link to <A HREF="/?t=schedule&amp;c=index" class="bodyText">"Tournaments"</A> to bring up a list of up-coming tournaments and registration details.  The up-coming tournaments are also listed on the member home page.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="120"><B>In contests open to everyone, will college students be competing against professionals, or will there be separate divisions?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Effective February, 2002, we will be instituting Divisions I and II. These do not differentiate between Students or Professionls. Instead, members are placed in a Division based upon their rating. <a href="/index?t=support&amp;c=divisions" class="bodyText">More about Divisions</a>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="130"><B>What do I need to do in order to participate in a TopCoder match?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">If you have not already registered as a TopCoder member, you will need to do so first.  Prior to each match, TopCoder has a 90 minute match registration period during which you will need to log into the TopCoder applet (using the your TopCoder handle and password), and choose Main / Event Registration from the menu.  You will need to answer a brief survey question and accept the terms of the match.  If you do not go through this process prior to a match, you will not be assigned to a competition room come match time. </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="140"><B>If I miss the match registration period, can TopCoder just place me in a room, allowing me to compete?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Unfortunately, we cannot allow anyone to compete in a match that they did not register for.  This is due to the formula that is used to calculate the room assignments.  Once the room assignments have been determined, adding any coder to a room will throw off the balance of all of the room distributions for that division.  This simply would not be fair.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="150"><B>After I register for a TopCoder competition, do I need to stay logged into the applet until the competition starts?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">No.  TopCoder's system will remember that you have registered for the event even if you log out after you've registered. </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="160"><B>How long do TopCoder competitions last?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">The majority of the time, each coder is given 75 minutes to code, a five minute intermission, and 15 minutes to challenge.  On occasion, the length of the coding phase will be extended by five or ten minutes due to the difficulty of the problem set.  After the challenge portion of the competition has ended, the system testing phase will begin.  The system testing phase is non-interactive, so you do not need to stay logged in during this phase.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="170"><B>How do I get paid after I've won money in a TopCoder competition?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">At the conclusion of each match, TopCoder will typically wait until mid-day on the next business day following the match to notify the winners.  The reason for this is to provide all of the competitors with sufficient time to inform TopCoder of any potential inconsistencies with the match results.  At the end of this ³waiting period², TopCoder will send emails to all of the money winners with instructions on what to do in order to receive payment.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="180"><B>I'm having a problem with font properties on Linux platforms.</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Apparently, Sun has a problem with their font.properties file on the Linux platform that is causing errors with some fonts (Arial is one of them).  The fix is to replace the font.properties file with the following: <A HREF="http://java.sun.com/j2se/1.3/font.properties" TARGET="_blank" CLASS="bodyText">http://java.sun.com/j2se/1.3/font.properties</A></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        
                       
                        <TR><TD CLASS="bodyText"><A NAME="mac1"><B>The small HTML window that holds the contest applet does not load up the applet in MAC OSX</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">A workaround is to load the arena through Java Web Start (JWS).  A link that allows you to load the arena through JWS and more info on JWS is available on TopCoder home page.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="mac2"><B>Once I log into the Arena the menu's are transparent in MAC OSX </B></A></TD></TR>
                        <TR><TD CLASS="bodyText">This bug is currently under investigation.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="mac3"><B>I tried loading the Arena through the JWS link and I'm getting an error when JWS is running that the applet cannot be loaded.</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">JWS on OSX has a tendency to cache past loading of the applet. If you did tried to load the applet with a previous version of JWS or continue to have problems, open JWS and select "Preferences". You will see a field for "Application Folder Options". In this you will see a reference to /Users/you/.javaws/cache. Click on "Clear Folder" to remove the cache. Return to TopCoder.com and click on the JWS link. The applet should now load (assuming you are running OSX 10.1).</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>                                   
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><B>More Questions? <A HREF="/index?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                    </TABLE>
					<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR><TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#CCCCCC"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#CCCCCC" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
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

