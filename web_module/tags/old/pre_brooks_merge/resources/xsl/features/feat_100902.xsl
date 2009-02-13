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
        <TITLE>TopCoder :: Features</TITLE>
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
  <xsl:with-param name="image">features</xsl:with-param>
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

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>Graphics Programming for Motion Capture</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, October 9, 2002<BR/>
By&#160;Penwiper,<I>TopCoder Member</I><BR/>
</P>

<P><B>A Very Brief History of Motion Capture</B><BR/>
If you have ever played a video game, gone to a movie, or just watched a bit of television at some point in the last ten years, chances are you have already seen the end results of what motion capture (mocap) technology can help to produce. Mocap technology as we know it today probably first came into widespread use in the late 1970s and early 1980s when biomechanics labs began to use computers to analyze human motion. Throughout the late 1980s and early 1990s mocap was adopted by the film and entertainment industries, often on an experimental basis. Although they were initially designed to save time and obviate the need for hiring scores of key-frame animators, many of the early systems were difficult to use, and did not work very well. The early optical systems which required markers placed on an actor's body and multiple cameras, would often suffer from occlusion, requiring animators to painstakingly edit the captured motion data by hand. The first non-optical systems were also usually unsatisfactory in terms of their ability to lighten the workload of animators. All too often the required mocap footage for a project would be collected over a period of a day or two, and then the next few months, and in some cases years, would be devoted to cleaning up the data and making it suitable for production purposes.</P> 

<P>Ongoing advances in computing power have helped substantially to make mocap a more realistic tool. Real-time software now allows mocap users the luxury of viewing the desired animation footage while data is being collected from the actor(s). The availability of added computing power also allows for the possibility of using sophisticated cleanup, filtering, and interpolation routines in software. Although mocap technology is still by no means inexpensive, it is now truly an effective timesaving tool for many production studios that need to have realistic motion in their animations.</P>

<P><B>How I Got My Start</B><BR/>
I became involved with mocap and computer programming in general mostly by accident. After completing a Master's degree in Aerospace Engineering six years ago, I moved back home and tried to look for a job. Trying to find something directly related to aerospace engineering at the time, even an entry-level position seemed next to impossible. After being rejected by over 200 of North America's finest aerospace companies, I decided to broaden my search, and ended up taking an entry-level hardware testing job at a marine equipment company near my home town. Luckily for me, my employer allowed me to write some C++ and BASIC software to help automate my testing duties. I was also allowed to spend some time developing software for an orientation sensor that the company had built and was planning to use in an instrument for measuring underwater ocean currents. The orientation sensor that I was working with consisted of 3 accelerometers, 3 magnetometers, and a single temperature sensor. My first crack at writing software for this device seemed fairly straightforward. Having taken a robotics course in university, along with a couple of flight dynamics and control courses, I knew all about Euler angle transformations and 3-D math. Since the accelerometers and magnetometers were arranged tri-axially, I figured I would just have to find the direction of the gravity vector using the accelerometers, find the magnetic field vector (i.e. North) using the magnetometers, and then use simple matrix math to calculate the three Euler angles that combine to produce these vectors. As is often the case with sensors of any sort, it was not quite that easy. My first program assumed that each of the sensors would have fixed linear gains and offsets that I had earlier determined from a simple calibration procedure. </P>


<P><B>My Mocap Problems</B><BR/>
The program drew a simple wire-frame box whose orientation shifted around on the screen in real-time with the movement of the sensor module. At first glance, it seemed as though the sensors must have been really noisy. Every time I moved the module around, the wire-frame representation on the screen would jump wildly and then seem to settle down in the proper orientation once the movement was complete. This was a classic example of the pitfalls inherent in using inertial devices for orientation sensing. Accelerometers do not just measure the gravitational field; they also measure every tiny shake, rattle, and roll that you apply to them! As mentioned, our application for the sensor module was to be underwater, where motion events would be relatively slow and controlled. This allowed us to clean up most of the motion noise by simply averaging a large number of samples. Magnetic interference was another concern, both for calibration and for use in the field. Objects containing iron and wires bearing electronic current are common sources of magnetic field which are often variable under normal conditions. Every time I brought the sensing module near a computer monitor the orientation would change abruptly because of the magnetic field surrounding the monitor.</P>

<P>The biggest calibration nuisance however proved to be temperature. The gains and offsets of both accelerometers and magnetometers were dependent upon temperature. These dependencies appeared to be linear for the accelerometers and non-linear for the magnetometers. Eventually I came to realize that the temperature chamber we were using to calibrate the sensors also generated huge magnetic fields whenever the heating or cooling coils were activated, and whenever the fans were turned on or off. It became necessary to either heat the chamber up to some maximum temperature (or cool it down to some minimum value) and then pull the power plug and let it slowly return to room temperature on its own. This made testing much slower, but gave nice linear results for the temperature dependencies of the magnetometer gains and offsets. </P>

<P>Once all of these physical calibration parameters were included in my software the orientation sensor was able to function rather well in most environments, providing there were no significant magnetic field sources in the vicinity. In lab testing we were able to get less than 2 degrees of solid angle accuracy. Unfortunately, most of the field tests that were performed with orientation sensors were foiled due to a recurring leak problem in the flow sensors that we were also using. After about a year of leaky trials, the project was abandoned, and I went back to doing testing and writing the odd bit of test software for our other products.</P>


<P><B>A New Job</B><BR/>
After a few years, my wife and I decided to move so that we could be closer to her friends and family. I was able to find work as a software developer for a small company that manufactured and sold fiber-optic sensors for capturing 3-D motion. My initial task was to write some software for a real-time embedded device that would capture data from numerous sensors on a person's body and transmit that data wirelessly to a PC for display and analysis. The first challenge to overcome was my complete ignorance of all things multi-threaded. After reading through some of the thread creation examples that came with the embedded device's sdk, I decided to forge ahead. The commands used for creating threads seemed fairly straightforward, and I did not have to worry about stopping the threads since the embedded computer would always be collecting data from each of the sensing devices for as long as it was powered up. Using one thread per device seemed like a sensible thing to do, and I was able to write a simple program in a few days that appeared to handle the I/O for all of the sensors at the same time. More detailed testing however, revealed some weird intermittent glitches in the data that I was getting from some of the sensors. These glitches seemed to occur on a random basis, on average every few minutes, resulting in impossible sequences of data for a given sensor. Debugging for the embedded computer was limited to using printf statements at strategic locations in the code, but through a few trial and error tests it became obvious that certain data-acquisition functions on our system were not &quot;thread-safe&quot;. They would need to be protected somehow so that they could not be entered by more than one thread at the same time. My first instinct was to write my own code to do this. The stuff that I wrote mostly worked, but not entirely. Every so often (more like once per hour now) some invalid data would be generated. This was not really a big deal at the time, since I had other more pressing problems, like trying to figure out how to get realistic looking human motion data from our sensors. A few months later though I happened to be reading a book about POSIX threads1 and discovered that there are actually things called mutexes which are perfectly designed for protecting data and sections of code inside threads. This allowed me to replace my own code protection mechanisms with the tried and true mutex, and this solved the problem of intermittent data glitches.</P>

<P>Another software tool that I became familiar with in my new job was OpenGL. OpenGL gave me a nice simple way of creating lines, stick figures, and even simple graphical characters to depict our captured human movements. It was a bit daunting to use at first, but the Big Red Book2 helped a lot, as did a plethora of tutorials and examples available online. The hardest part about learning the basics seemed to be getting able to see something on the screen. It was kind of hard to do much debugging when all I could see was a black screen in front of me! Once the first line was drawn though, everything else, such as lighting, shading, positional transformations, etc., seemed to fall into place. The software I developed for use at the PC end of things used a simple graphical stick figure to depict what the person wearing our sensors was doing. </P>

<P>Once I was able to drive a rudimentary stick figure using our sensors and the software that I had written, the next hurdle was &quot;How do I make this thing operate in real-time?&quot; The latency (the time difference between actor movements and on-screen stick figure movements) was about 0.5 sec at this point, but I was fairly confident that I could chop it down quite a bit, since up to this point I had not been overly concerned with optimization. The following things all contributed to our high level of latency:
<OL>
<LI>Time required to send request for data out to all sensors, and receive data from all sensors</LI> 
<LI>Time required to transmit the sensor data over a wireless network link from the embedded computer to a PC</LI> 
<LI>Time required to check the data at the PC, convert it to 3-D data, and then apply the 3-D data to a human body model</LI>
<LI>Time required to swap the back graphics buffer with the front graphics buffer, and draw data for the current sample to the back buffer</LI>
</OL>
An extensive amount of code optimization was undertaken to reduce the latency, but in the end it was just some judicious hardware purchases that really saved the day. By switching to a standard 802.11b ethernet link, we saved about 100 ms of latency. In fact our 802.11b link was only a few ms worse than running over wired ethernet. We got a second big performance improvement from buying a decent video card. Because we had to double-buffer the drawing of our graphics to get a nice smooth display, this meant that we could suffer as much as 100 ms of additional latency if our graphics update rate was only 20 Hz. Most video cards available now do offer update rates as high as the monitor refresh rate, providing you aren't trying to do millions of graphics operations per sample. For a monitor refresh rate of 70 Hz, this resulted in a much-improved maximum latency contribution of 29 ms. These hardware changes, coupled with a doubling of our processing power at the PC end, and better coding efficiency, helped to reduce the latency down to a practically real-time value of about 60 ms. Personally, I can not distinguish 60 ms time differences between consecutive events, although some people claim that they can.</P>

<P>Improving sensor accuracy and achieving an improved means for mapping our exoskeleton sensor information to human motion have proven to be the biggest challenges so far, and we continue to work towards that end. The effects of temperature and mechanical hysterisis play a role in determining how our sensors behave, and require that we come up with some clever software tricks to compensate for and work around these physical limitations. In my relatively short (so far) career as a mocap programmer, I've noticed that it's most often the &quot;physical world&quot; as opposed to the &quot;software&quot; or &quot;virtual world&quot; of bits and bytes that you really need to be concerned about. I believe that the capabilities you build into your software for modeling important physical effects, largely determines how successful your mocap experience will be.</P>

<P>All that said, I guess I'm glad that over 200 aerospace companies rejected me. Had I managed to actually hook up with one of them, I might not have become a computer programmer, might not have gotten involved with mocap and might not have the really cool job that I have now.</P>


<P><B>References:</B></P>
<OL>
<LI>Butenhof, David R.; Programming With POSIX(R) Threads; 381 p; Addison-Wesley Publishing Co.; May 1997.</LI>
<LI>Woo, Mason; OpenGL Architecture Review Board; Neider, Jackie; Davis, Tom; Shreiner,<BR/> 
Dave; The OpenGL Programming Guide 3rd Edition: The Official Guide to Learning OpenGL Version 1.2; 800 p; Addison-Wesley Publishing Co.; 1999.</LI>
</OL>

<IMG SRC="/i/m/Penwiper_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Penwiper<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=150527" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
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

