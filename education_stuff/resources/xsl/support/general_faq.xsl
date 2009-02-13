<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>General FAQ at TopCoder</TITLE>
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
  <xsl:with-param name="image">support</xsl:with-param>
  <xsl:with-param name="title">&#160;General FAQ</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                   <BR/>
                   <TABLE BORDER="0" CELLPADDING="0" CELLSPACING="0">
                        <TR><TD VALIGN="middle" ALIGN="left"><A HREF="#10" CLASS="bodyText">What Is "TopCoder"?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#20" CLASS="bodyText">What's in it for me?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#25" CLASS="bodyText">What's in it for TopCoder?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#30" CLASS="bodyText">Who can participate in TopCoder tournaments?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#35" CLASS="bodyText">Can TopCoder members from countries other than the United States win prize money in TopCoder tournaments?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                        
                        <TR><TD><A HREF="#40" CLASS="bodyText">Who are the creators of the "TopCoder" site?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#45" CLASS="bodyText">What technologies have been used to build TopCoder's site and tournament applications?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#50" CLASS="bodyText">If I give you private information, how do I know it'll be safe?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#60" CLASS="bodyText">How does the tournament work?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#65" CLASS="bodyText">Do you really think this is a good way to measure the relative merit of programmers?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#67" CLASS="bodyText">Who owns the source code that I write during tournaments?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#70" CLASS="bodyText">Who supplies the prizes for TopCoder events that pay prizes?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#80" CLASS="bodyText">How does the rating system work?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#90" CLASS="bodyText">How will I know where I stand in the ratings?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#110" CLASS="bodyText">How do I find out when the next tournament is being held?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#120" CLASS="bodyText">In contests open to everyone, will college students be competing against professionals, or will there be separate divisions?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#130" CLASS="bodyText">What do I need to do in order to participate in a TopCoder match?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#140" CLASS="bodyText">If I miss the match registration period, can TopCoder just place me in a room, allowing me to compete?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                        
                        <TR><TD><A HREF="#150" CLASS="bodyText">After I register for a TopCoder competition, do I need to stay logged into the applet until the competition starts?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#160" CLASS="bodyText">How long do TopCoder competitions last?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#170" CLASS="bodyText">How do I get paid after I've won money in a TopCoder competition?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                        
                        <TR><TD><A HREF="#180" CLASS="bodyText">I'm having a problem with font properties on Linux platforms.</A></TD></TR>


                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Java</B></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#java1" CLASS="bodyText">How is my submission judged?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#java2" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#java3" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#java4" CLASS="bodyText">What options are set when starting up the VM?</A></TD></TR>                                                
                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C#</B></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#c1" CLASS="bodyText">How is my submission judged?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#c2" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#c3" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>                       
                        
                                                
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C++</B></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#181" CLASS="bodyText">How is my submission judged?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#182" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#183" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#184" CLASS="bodyText">What compiler options are used?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR> 
                        <TR><TD><A HREF="#188" CLASS="bodyText">Why doesn't my code compile anymore under gcc 3.x?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>                                                                       
                        <TR><TD><A HREF="#185" CLASS="bodyText">What libraries are available?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#186" CLASS="bodyText">How do i get 64-bit integers?</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#187" CLASS="bodyText">What STL types are available?</A></TD></TR>                        
                        
                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>MAC OSX</B></TD></TR>                                                                    
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac1" CLASS="bodyText">The small HTML window that holds the contest applet does not load up the applet in MAC OSX</A></TD></TR>                        
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac2" CLASS="bodyText">Once I log into the Arena the menu's are transparent in MAC OSX </A></TD></TR>                         
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac3" CLASS="bodyText">I tried loading the Arena through the JWS link and I'm getting an error when JWS is running that the applet cannot be loaded.</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD></TR>
                        <TR><TD><A HREF="#mac4" CLASS="bodyText">How do I copy and paste in the Arena when using Mac OSX?</A></TD></TR>
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
                        <TR><TD CLASS="bodyText"><A NAME="35"><B>Can TopCoder members from countries other than the United States win prize money in TopCoder tournaments?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Prizes in TopCoder tournaments will be paid to those winning members from all countries, except where prohibited by applicable law.  If you are unsure whether you are lawfully permitted to win a cash prize in a skills contest, you should consult an attorney regarding applicable laws.  In addition, you should consult with an accountant and/or tax expert regarding any applicable tax consequences on your winnings.  TopCoder tournaments are void in the Quebec province of Canada, and elsewhere where prohibited by applicable law.  Cash prizes will not be paid to residents of Cuba, Iran, Iraq, Libya, North Korea, Sudan or Syria.</TD></TR>
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
                        <TR><TD CLASS="bodyText">Because we value privacy as much as we value programmers. You deserve to keep your private information private, and to benefit any time you let someone use your information. TopCoder is determined to be true to that. When you give us information, it will be for the benefit of only three parties: you, TopCoder, Inc. and participating sponsors. If you have any questions or comments about our privacy practices, you can <A HREF="/?t=contacts&amp;c=index">contact us</A> or for more details you can <A HREF="/?t=about_tc&amp;c=privacy" CLASS="bodyText">go to the "Privacy" section.</A></TD></TR>
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
                        <TR><TD CLASS="bodyText">The coder.  Our Terms of Use agreement basically specifies that the coder who submits any source code to TopCoder owns the code.  We simply require that we can display the source code for the normal course of the tournaments.  The actual source code is viewable during certain parts of the competition to competitors and spectators. You can read the complete Terms of Use agreement <A HREF="/?t=about_tc&amp;c=terms" CLASS="bodyText">here</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="70"><B>Who supplies the prizes for TopCoder events that pay prizes?</B></A></TD></TR>
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
                        <TR><TD CLASS="bodyText">At the conclusion of each match, TopCoder will typically wait until mid-day on the next business day following the match to notify the winners.  The reason for this is to provide all of the competitors with sufficient time to inform TopCoder of any potential inconsistencies with the match results.  At the end of this waiting period, TopCoder will send emails to all of the money winners with instructions on what to do in order to receive payment.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="180"><B>I'm having a problem with font properties on Linux platforms.</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Apparently, Sun has a problem with their font.properties file on the Linux platform that is causing errors with some fonts (Arial is one of them).  The fix is to replace the font.properties file with the following: <A HREF="http://java.sun.com/j2se/1.3/font.properties" TARGET="_blank" CLASS="bodyText">http://java.sun.com/j2se/1.3/font.properties</A></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                       
                       
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Java</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                                                                                                
                        <TR><TD CLASS="bodyText"><A NAME="java1"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText"><P>TopCoder submissions typically consist of a single class definition. For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments. Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc.</P>
<P>Each Java test is performed in a separate thread. The process is forcibly terminated after consuming 8 seconds of System time. At most 64 megabytes of memory may be mapped.</P>
<P>If your method does return a value, that is the only basis for judging correctness.</P></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="java2"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">We use 3 4-way 700 Mhz Pentium III Xeon systems. Each processor has separate 16kb level one caches for instructions and data, and its own 1024kb level two cache clocked at core speed.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                        
                        <TR><TD CLASS="bodyText"><A NAME="java3"><B>What software does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Linux 2.4, Java 1.4.1 (build 1.4.1_04).</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                       
                        <TR><TD CLASS="bodyText"><A NAME="java4"><B>What options are set when starting up the VM?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">java -client -Xmx64m &lt;main class&gt;</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C#</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="c1"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>TopCoder submissions typically consist of a single class definition. For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments. Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc. </P>
<P>Each C# test is performed in a separate thread. The process is forcibly terminated after consuming 8 seconds of System time.</P>
<P>If your method does return a value, that is the only basis for judging correctness.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="c2"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>We use 2 4-way 700 Mhz Pentium III Xeon systems. Each processor has separate 16kb level one caches for instructions and data, and its own 1024kb level two cache clocked at core speed.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>                        
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="c3"><B>What software does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>Microsoft Windows 2000 5.00.2195 SP2, .NET Framework version 1.0.3705</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR> 
                        
                                                                                               
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C++</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="181"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>TopCoder submissions typically consist of a single class definition.  For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments.  Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc.</P>
<P>C++ submissions may also define other classes and global variables or functions.  However, defining main() will prevent your submission from linking, and referring to library globals (stdout or cout for example) before your method is called is not guaranteed to work as expected.</P>
<P>Each C++ test is performed in a separate process.  The instance of your class used by the tester is not guaranteed to be destroyed.  The process is forcibly terminated after consuming 8 seconds of CPU time.  At most 64 megabytes of memory may be mapped.  Stack space is limited to 8 megabytes (the Linux default).  Most system calls are emulated or ignored.  Note especially that fork() or use of threads (library or kernel) will fail, and use of temporary files is not permitted.</P>
<P>If your method does not return before the process exits (due to exceeding the time limit, an uncaught exception, segmentation fault, divide by zero, etc), it has failed the test.</P>
<P>If your method does return a value, that is the only basis for judging correctness.  Anything printed to stdout or stderr is ignored, although you will see it when testing your own code.  Output may even return an IO error, and takes extra time during testing; you are advised not to leave unnecessary IO in your final submission. </P>                       
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="182"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">We use 4-way 700 Mhz Pentium III Xeon systems.  Each processor has separate 16kb level one caches for instructions and data, and its own 1024kb level two cache clocked at core speed.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="183"><B>What software does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>Linux 2.4.20-8smp, gcc 3.2.2 (Redhat 9), glibc-2.3.2, and libstdc++-3.</P>
<P>
pointers to appropriate docs for each<BR/>
<A HREF="http://gcc.gnu.org/onlinedocs/gcc-2.95.3/gcc.html" TARGET="_blank" CLASS="bodyText">http://gcc.gnu.org/onlinedocs/gcc-2.95.3/gcc.html</A><BR/>
<A HREF="http://www.gnu.org/software/libc/" TARGET="_blank" CLASS="bodyText">http://www.gnu.org/software/libc/</A><BR/>
<A HREF="http://gcc.gnu.org/onlinedocs/libstdc%2B%2B/documentation.html" TARGET="_blank" CLASS="bodyText">http://gcc.gnu.org/onlinedocs/libstdc++/documentation.html</A><BR/>
</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="184"><B>What compiler options are used?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>The compiler is invoked as:<BR/>
g++ -Wall -W -O2 -s -pipe</P>
<P>
Additional info on gcc 3.1<BR/> 
<A HREF="http://gcc.gnu.org/bugs.html#updating" TARGET="_blank" CLASS="bodyText">http://gcc.gnu.org/bugs.html#updating</A>
</P>          
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR> 
                        
                        <TR><TD CLASS="bodyText"><A NAME="188"><B>Why doesn't my code compile anymore under gcc 3.x?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
The upgrade to GCC 3.x may require some changes to C++ submissions to
make them conform to standards that weren't implemented prior to 3.x,
but are now enforced:
<UL>
<P>
	<LI>Everything in the C++ standard library (a.k.a. Standard Template
	  Library or STL) is declared in the namespace std; previously they
were all declared globally.  The most convenient way to use standard
library symbols is to add the declaration "using namespace std;"
before any code that uses identifiers from the library.</LI>
</P>

<P>
<LI>It is also possible to simply prefix every affected identifier with
"std::"; e.g. "std::vector&lt;std::string&gt; d;" or "r=std::max(r,x);".
Or only a few select symbols can be imported into the global scope
with a directive like "using std::string;" or "using std::find;".</LI>
</P>

<P>
	<LI>Make sure that you really do include all the headers you use.
Previously certain library headers would include other headers
(e.g. &lt;algorithm&gt; would pull in &lt;iostream&gt;), but the new gcc is
somewhat tidier about such things.</LI>
</P>

<P>
	<LI>Non-standard library extensions present with the old GCC may no
longer be available; for details see the library documentation at
<A HREF="http://gcc.gnu.org/onlinedocs/libstdc%2B%2B/libstdc%2B%2B-html-USERS-3.1" TARGET="_blank" CLASS="bodyText">http://gcc.gnu.org/onlinedocs/libstdc++/libstdc++-html-USERS-3.1</A>                        
 </LI> 
</P>

    
</UL>
                   
                        
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR> 
                        
                                                                       
                        <TR><TD CLASS="bodyText"><A NAME="185"><B>What libraries are available?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Only default libraries will be linked with your code.  Math functions requiring libm on some platforms, eg cos(), are automatically linked if needed.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="186"><B>How do i get 64-bit integers?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>
Integer types on our platform:<BR/>
  char - 8 bits (signed)<BR/>
  short - 16 bits<BR/>
  int - 32 bits<BR/>
  long - 32 bits<BR/>
  long long - 64 bits<BR/>
</P>
<P>long long is not merely a gcc extension, but part of ISO C99.</P>
<P>If you test locally with a compiler other than gcc, the preprocessor may be useful for hiding the differences.  For example:</P>
<P>
#ifdef __GNUC__<BR/>
#define int64 long long<BR/>
#else /* MSVC, say */<BR/>
#define int64 __int64<BR/>
#endif<BR/>
</P>
<P>In this way, you can test the same code using 64 bit integers in our environment and on your system.</P>
<P>The C++ standard libraries do not include support for arbitrary precision arithmetic.</P>

                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>                                                
                        <TR><TD CLASS="bodyText"><A NAME="187"><B>What STL types are available?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">All of the standard value types and container types should be present.
Some extensions are also present, including most of those from SGI's STL, such as rope, hash_set, hash_map, tree, slist, etc.
                            </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>                                                                                                                                                
                                               

                        
                        <TR><TD HEIGHT="20" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>MAC OSX</B></TD></TR> 
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                                               
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
                        <TR><TD CLASS="bodyText"><A NAME="mac4"><B>How do I copy and paste in the Arena when using Mac OSX?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Although many Mac users commonly use command-C and command-V to copy and paste, you must use ctrl-C and ctrl-V to copy and paste from within the Arena.</TD></TR>
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
        <xsl:call-template name="public_right_col"/>       
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

