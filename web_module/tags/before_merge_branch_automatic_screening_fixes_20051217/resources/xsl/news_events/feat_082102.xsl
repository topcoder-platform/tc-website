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
        <TITLE>TopCoder Feature: Wireless Woes and Winners</TITLE>
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
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Wireless Woes and Winners</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, August 21, 2002<BR/>
By&#160;polgara,<I>TopCoder Member</I><BR/>
</P>

<P>
I have a laptop with a wireless card in it. Before you get jealous, you should know that the range 
is 150 km (100 miles) from the core Toronto area, and it is SLOW!  Dialing-up and pcanywhere-ing 
to my machine will waste anywhere from 2-4 minutes in connection time, while performing any routine 
tasks will bring back unwelcome memories of a 300-baud modem.   My cell phone has a screen that is 
two inches by two inches - small and handy to carry - but not ideal web surfing size. In fact, 
I have had web access via my cell phone for over one year and have only used it once - to look 
for movie showings at a theatre, when I decided to see "Men in Black II" on a whim.  It 
has been three years since wireless first emerged in a big way on the technology radar, yet 
we still do not have a single, global standard for wireless technology. 
</P>

<P>
It is worth noting that despite these limitations, according to many of the US industry analysts, 
mobile phones with colour screens and cameras are some of the hottest technology items today, and 
are set to be the "star" gadgets for holiday shopping season '02.  And manufacturers are doing their 
bit by offering prettier and faster goodies.  For example, Sidekick, from Danger, combines a mobile 
phone, handheld computer and a large display screen in a tiny, compact-sized kit.  Handspring has a 
combination phone and Palm-based handheld computer organizer.  And Sony Ericsson (joint venture between 
the two companies) sells a phone with a clip-on camera attachment.    Service providers have also gotten 
into the game, with Sprint now offering customers the ability to easily check email and surf the web from 
their mobile phones.  Blackberry's RIM pager, now provides secure email access.  
</P>

<P>
The bottom line is that the added flexibility and mobility of not being physically tied to a network 
outweigh many of the annoyances. Mobile devices are obviously here to stay, and as a programmer, 
you have an opportunity to provide better, faster and more convenient applications to your customers.  
Though the arena is constantly evolving, there are tips or tricks, which can make your 
job as a developer, just a bit easier, when developing mobile applications.
</P>

<P>
<B>1. Delivery of application to clients:</B><BR/>
 You will need a wireless network to deploy your application to customers.  Issues to consider when selecting an efficient network carrier to best deliver your particular program include a consideration of:
<UL>
	<LI> Coverage Range offered (outside)</LI>
	<LI> Inside Buildings Coverage</LI>
	<LI> Network Congestion/Traffic patterns</LI>
	<LI> Packet Size and data "massage" adjustments by network gateways</LI>
	<LI> Data transmission characteristics:  carriers optimize their networks for different types of data e.g. binary data transfer versus human readable text </LI>
</UL>
</P>

<P>
<B>2. Standardization does not exist:</B><BR/>
Each manufacturer has their own standard and protocols for talking to devices. The 
Holy Grail of wireless programming involves leveraging the full capabilities of every 
wireless device while still providing a consistent user experience.  One of the most highly 
anticipated developments in this quest, was "BlueTooth" technology.  Named after a 10th century 
Viking King, and using the unlicensed 1.4GHz band, BlueTooth was supposed to enable devices in 
close proximity (e.g. computers, printers, refrigerators or other household appliances) to 
communicate with each other. It was expected to be of special value to users who had multiple 
mobile devices (e.g. Rim, Palm or Cell) and wanted to be able to control all of them from one source.   
Thus programmers could code for any one of the devices, and have the others update each other automatically.  
There are currently several BlueTooth handsets available in the United States and Europe, however 
the rate of adoption has not been anywhere close to anticipated or matching the hype surrounding it.
</P>

<P>
<B>3. It's tough to please everybody, so choose carefully:</B><BR/>
Everyone has his or her favorite mobile device. Some will swear that they cannot live without their Palm, or Cassiopeia or PocketPC, whereas for me, the cell is my appendage of choice (despite often forgetting to re-charge it). Due to lack of universal standards, it is  difficult to create a single application that is optimized for every wireless device.  A more sensible approach involves putting personal preferences aside, taking a poll of  the top three most popular, wireless devices used by your clients and building for those devices.  You can always expand outwards to include other devices, if your mobile application is a success.
</P>

<P>
<B>4. Customization of the application to different devices:</B><BR/>   
At minimum, to begin writing a wireless application requires a text editor, since most hand-held tools support WML (subset of XML).  WML allows for device neutrality by advocating a lowest common denominator approach that requires catering to myriad screen-widths, input methods and processing power.  The trade-off is that the more sophisticated coding opportunities offered by advanced hand-held devices might not be used to full advantage by the coder.  Many wireless manufacturers offer a SDK or emulator to optimize the writing of applications for their particular device or series of devices.  However, to utilize this method, would require re-writing the application for each set of mobile gadgets.  
</P>

<P>
There are ways to get around developing for each individual device, by using third party software.  These products fall into two major methodologies:
</P>

<P>
<UL>
	<LI> <B>Screen Scraping  Programs:</B><BR/> 
	Most first generation software products that assist in creating Wireless applications (like IBM's Transcoding Server) use this approach.  In this model, data is pulled from existing website content (or the data can be pulled as an XML feed) and then formatted using a style sheet for each particular WAP device. The advantage of "Screen-Scraping" is that you can take advantage of your existing web pages, without re-writing your code and you can continue to develop in the CGI or scripting language of your preference.</LI>
</UL>
</P>

<P>
There are a number of disadvantages to "Screen-Scraping":
<UL>
	<LI> Your website may need to go thorough a major overhaul so it is better able to appear on a WAP device.  For instance, many web applications require acknowledgement of a legal disclaimer before utilizing the services.  A WAP device is not an ideal device for reading legal disclaimers.</LI>
	<LI> If your website relies on ECMA Script or other client side technologies, they are unlikely to be supported in the browser. </LI>
	<LI> You may have to manually tweak each style sheet (for every kind of WAP device) so your site appears more appropriately, though this can also be considered an advantage in the end.</LI>
</UL>
</P>

<UL>
	<LI> <B>Abstract Application Creation:</B><BR/>  
	The other approach to developing wireless applications is to build it as an abstract application.   Companies like Bitmovers or Verisign provide a set of  tools which allow programmers to develop code or modules in the IDE.  Their software then figures out how best to render the modules/code to each type of PDA unit.  The software company is responsible for providing updates and plug-ins to facilitate proper rendering, as new types of devices enter the market.
<P>The advantage of an "Abstract Application" model, is that it features a Write Once, Deploy Anywhere (isn't WODA a cool acronym?) philosophy.  Most of the technologies that advocate this approach use Java as their base, so that gives the added bonus of being able to re-use Java classes that may have been previously written for other applications.</P>
<P>The primary disadvantage of this latter system is that it requires learning to program in the development environment provided by the software company. </P></LI>
</UL>

<P>
<B>5. Security of mobile applications:</B><BR/>  
Wireless devices cannot verify the status of a traditional SSL certificate, but companies like Verisign offer short-lived certificates (WTLS) that are re-issued every 24 hours to lessen the risk of encountering a compromised connection.  Verisign technology works with  a number of major manufacturers (Motorola, Nokia, Ericsson, CMG, Materna, 724 Solutions, and Openwave), however it does not work with all WAP servers, so check before you build and deploy your program.  You also need to consider the case that the customer loses their mobile device - assess the security risks to your data or network if the device is stolen or goes missing.
</P>

<P>
<B>6. Testing phase:</B><BR/> 
There is a great deal of pressure to push applications out the door as quickly as possible, especially when it is a relatively hot technology like wireless. Just like a traditional application deployment though, it is important to go through a Beta-testing phase before rolling out to the world.  This gives you the chance to correct deficiencies as well as to fine-tune your application and optimize it for latency, coverage and time-of-day considerations.
</P>

<P>
<B>7. Futurama:</B><BR/>
Always build for the future, whether it is wireless or wired technology.  This means considering software updates and changes to your application.  Does the client have to do anything, if you change the application (e.g. download an updated program)?  Will the customer need to be re-trained, if the program changes?  Are you going to expand the application and optimize it for other mobile devices?
</P>

<P>
<B>8. You cannot step twice into the same river:</B><BR/>
Wireless technology is constantly changing.  To keep up with the mobile market is a constant struggle between being "bleeding" edge, having no customers or lagging behind, and knowing that there is a good chance of finding an audience for your application.
</P>


<P>
There are several factors currently limiting the spread of wireless applications. Network speed, security 
issues and competing operating systems are among the major obstacles. In addition to physical limitations, 
it is necessary to think really hard about what would constitute appropriate mobile programs.  
After all, do you really need to be able to pay your hydro bill via a cell phone - is there any added convenience over using a regular desktop or laptop to perform web-banking transactions?   However, while demand from customers for programs has been low, there are still  "killer" applications for the wireless world:
</P>

<P>
<UL>
	<LI> Location-based Services:<BR/>Generally your cell phone "knows" where it is as long as you have service  (at least it "knows" within a triangulation of cell towers). Using your mobile unit to look for alternate driving routes, to check movie locations, bus schedules or other location-based services are ideal applications for PDAs.</LI>
	<LI> Wireless Gaming:<BR/>Game playing is big in Japan.  And according to Frost and Sullivan, the US wireless game industry could be worth US $2.8 billion by 2006. While waiting in lines for transportation or other services, checking e-mail, downloading music or playing games with friends, can be a more pleasant way to spend the otherwise wasted time.</LI>
	<LI> Email:<BR/>Blackberry's handheld RIM or Palm's i705, which has service all over Canada and the United States, are some of the hottest growing devices in the portable e-mail delivery field.  Updating in real time, with the addition of secure connections, means leaving the heavier, clunky laptop behind, but still being able to stay in touch with the office.</LI>
	<LI> Virtual Offices:<BR/>Use of PDAs can give the illusion that your company is much larger in size that is actually true, since it allows entrepreneurs to respond to customer requests immediately.  Or it can be used to maintain the illusion of a local office, where there is no physical presence. Any software application that augments this illusion or provides the means for better communication with clients can be a winner.</LI>
	<LI> Quick Peek at Financial Data:<BR/>While performing a lengthy banking transaction is not an ideal wireless application, providing a quick summary page of financial status can be a useful program.  For example, a quick peek at my visa account via cell-phone or other mobile device, would be handy - particularly when traveling. It is not necessary to display the detailed transactions, but simply a summary of current balance and outstanding credit.</LI>
</UL>
</P>

<P>
And perhaps my favorite use of cell phones - not having to remember to change phone number listings with all my friends, when I move!
</P>


<IMG SRC="/i/m/polgara_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;polgara<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=153650" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
   
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
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

