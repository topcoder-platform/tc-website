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
        <TITLE>TopCoder Feature: From the Field - Avoid Overloading!</TITLE>
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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>From the Field - Avoid Overloading!</B></FONT><BR/>
<!-- <I>Avoid Overloading!</I><BR/><BR/> -->
Wednesday, July 10, 2002<BR/>
By&#160;bitbucket43,<I>TopCoder Member</I><BR/>
</P>

 
<P>
While that might sound like heresy to C++ practitioners, it's not what I'm addressing. Instead, travel along with me as I recount some lessons learned when too many variables were added to a project, one which subsequently ran into a brick wall. While it's great to be able to play with the latest toys, we still have to keep in mind that, at the end of the day, there's always a deliverable! 
</P>

<P>
I had the dubious distinction of working on a large public service contract in the North East a number of years ago. My employer had purchased a small company engaged in delivering solutions to some local departments and we leveraged their knowledge and skills in order to land a profitable and high-profile contract. The RFP was a typical government monster and concerns were raised about the ability of the team to address the development methodology, documentation and testing requirements. 
</P>

<P>
What we're talking about here are sophisticated dispatch systems which use Geographical Information Systems (GIS) to pin-point the location of emergency calls. In addition to transcribing the call particulars, dispatchers can locate elements like the nearest squad car or fire hydrant in order to facilitate the speedy delivery of services. Combined with additional information such as road closures and HazMat (hazardous material) locations, such systems can provide crucial data to responding emergency crews. 
</P>

<P>
I was brought in to perform an analysis of the development effort and was very impressed with what I found. Here was an intelligent, motivated team with a wide range of skills. They included veterans of fire and police departments who were able to offer their insights and contribute to the development of systems which would truly merit the label 'mission-critical.' These systems had to be absolutely rock-solid with not even a remote possibility of losing data else people could, quite literally, lose their lives. 
</P>

<P>
Most of the developers had root access to the various UNIX servers as well as their own workstations. They were performing distributed builds across the LAN and enjoyed excellent communications. The code was concise and elegant, yet easy to read and understand. There was a fault-tolerant server in-house and the development efforts to partition the application were progressing well. Most of the elements of the target architecture had already been specified and it was the epitome of the redundant, state-of-the-art technology available at the time. 
</P>

<P>
My recommendations involved nothing more than standardizing on some common products for code management and testing (unit, system and regression) as well as some procedures. This was only in order to address contractual obligations, mind you. Quite frankly, the developers could have survived without these tools. They were already using code management on the UNIX platforms but needed a common store so that the client code for the Windows platform could be included. They were all involved in system testing but an automated tool would make their lives easier. 
</P>

<P>
At this point you might be forgiven for asking "so what's the problem?" I couldn't see one! I'd hoisted a few brews with the crew after-hours and found them to be totally committed to developing a world-class product. They had the knowledge, skills and enthusiasm to pull it off. Unfortunately, they weren't using enough of the industry-standard protocols to satisfy certain people. Allow me to clarify. 
</P>

<P>
There's a lot to be said for using appropriate technology where warranted. I fully embrace Java, XML and even CORBA in the right circumstances. Portability is something which is inherently good yet only recently have we started to see products and platforms which deliver on the promise. In situations where interoperability is not a concern, the use of "hand-rolled" but highly efficient protocols is perfectly acceptable. Why incur unnecessary overhead? 
</P>

<P>
Our salvation came in the form of a newly announced platform from California. It was supposed to make partitioning of applications simple and permit the deployment of functional elements to available servers on an as-needed basis and in real-time. It also used industry-standard protocols such as RMI (remote method invocation) with XDR (external data representation.) Yes, we were using those technologies BJ (Before Java.) 
</P>

<P>
The product was in the process of being released (version 1.0) and there were some quid pro quo offers being made by the vendor. They needed a success story and so there were some concessions to be had. It didn't seem to matter that the model was incompatible with the intended application. There were also some serious concerns about using the product in a mission-critical role, echoes of the warnings which accompanied the early releases of Java. Finally, it was a brand new product with no track record. 
</P>

<P>
Myself and the development team were treated to a demonstration of the new platform and were unrelenting in our questioning. The representative finally conceded that while the product was capable of using RMI, standard socket communications was the norm since it provided "higher performance." In other words, the claimed advantage of using industry-standard protocols could only be attained at the cost of performance. This admission was lost on management, however, as it appeared that the decision to use the platform had already been made. 
</P>

<P>
Product analysis in the IT field can be subjective and/or objective. The vendor was cooing the right buzzwords into the ear of management, giving them the warm fuzzies. The developers were detecting a serious impedance mismatch between the product capabilities and the intended application. A difficult situation at the best of times, deadlines were rapidly approaching for some deliverables. A decision was made to utilize the existing development staff to address the existing obligations and set up a parallel development effort for work on the new contract. 
</P>

<P>
While accommodations could have been made for the new team by expanding the existing facility, it was decided to secure separate office space for the new team. The thinking was that there would be little need for the two groups to share or exchange information since their development platforms were so completely different. Should the need arise it was only a short drive down the road to reach the other office, after all. Duplication of administrative staff and hardware such as PBXs and LANs would merely represent short-term costs. 
</P>

<P>
Can you imagine what it would be like to be a member of the new team? The telephones are still being installed so you might not have a line on your desk for a couple of weeks. You may have a computer on your desk but it might not be connected to the network. Your sys admin and DBA are brand new and will spend the next few months just getting everything configured. Don't even think about actually defining tables and using them. Ask anyone who has worked in a start-up to describe these joys and you'll understand from whence I speak. 
</P>

<P>
Now you have to learn about this new platform. The company is good enough to provide some on-site education but it's intensive and not all the tools are in place. Technical support is a serious problem since you have the three hour time difference between the coasts and it's still a version 1.0 product so there isn't a knowledge base to draw from. While most things appear to work there are also the inevitable glitches, some of them show-stoppers. Workarounds and patches are the order of the day. 
</P>

<P>
There's a huge learning curve when you start to deal with mission-critical computing. It's not like filling out a form on a web page and losing your connection before you're done: you know that you'll have to fill it out all over again once you get reconnected. Not so for someone taking a 9-1-1 call! One shot is often all you get so you'd better not lose a byte. So how do you ensure that all information is saved while being entered? What are the lessons which have been learned before? 
</P>

<P>
Have you ever looked at the GIS data encodings? Different vendors use different formats and there are the regular updates which have to be incorporated into the database. How is an on-ramp or an off-ramp represented? How do you deal with divided highways or those which enjoy multiple designations? Is that 5435 State Route 124 or 5435 Interstate 94? Are they perchance the same? How are you going to manage the pan and zoom features? How are you going to decide which features should be displayed at each resolution? What about overlays? 
</P>

<P>
Once you've decided how to partition the application, how are you going to deploy it? What about data consistency considerations when you're dealing with redundant sites? Are you going to use one-way or two-way replication of the database tables? How are you going to manage fail-over and recovery? Will there be scheduled maintenance windows? How will that affect the real-time data being collected by the operators? Are you ready for a Excedrin about now? 
</P>

<P>
This is not a fictional example but a true scenario. What happened was that management undervalued the knowledge of the staff in place. They didn't truly comprehend the complexity of the required solution and selected an inappropriate platform for development. They exacerbated the problem by bringing in a new development team completely unfamiliar with the demands of the class of application. The learning curve was simply too steep and the obstacles too many to be surmountable. The overloading was to blame. 
</P>

<P>
<B>Epilogue </B><BR/>
There were a number of attempts to deliver a solution over a period of years, far outside the original terms of the contract. None was successful and I believe (but have no evidence) that another contractor was eventually hired to deliver a functional product. The original development team I spoke about either quit or were terminated within six months. A real shame, since they were some of the best I've met and would give most TopCoders a serious run for their money! 
</P>

 
<IMG SRC="/i/m/bitbucket43_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;bitbucket43<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=151719" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
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
