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
        <TITLE>TopCoder Feature: From the Field</TITLE>
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
  <xsl:with-param name="title">&#160;TopCoder Features</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>From the Field</B></FONT><BR/>
<!-- <I>qubits Became TopCoder's First $100,000 Champion One Year Ago This Week</I><BR/><BR/> -->
Tuesday, June 25, 2002<BR/>
By&#160;kpsmith,<I>TopCoder Member</I><BR/>
</P>

<P>
<B>'The 9s Bug'</B>
</P>

<P>When I first joined TiVo in 1999, the first task I was assigned was to track down and fix 
something called The 9s Bug. The bug caused random memory corruption in our embedded Linux boxes, 
and had to be fixed as soon as possible. We had just started shipping our first boxes to customers 
that month, and software quality was a big concern. Random memory corruption was bad.</P>

<P>This assignment sounded great to me, though a little daunting. It was a good opportunity to contribute in a big way quickly. It also showed that our CTO clearly had some faith in my ability. The down side was that the bug could be anywhere in our entire source tree containing over a million lines of code, and I had never looked at it before. Further, the bug had been around for a while, and even the people who knew the code didn't know where to start looking.</P>

<P>So, it was a great opportunity, but it wasn't going to be easy.</P>

<P><B>The Bug</B></P>

<P>The bug itself was a cache coherency problem. The CPU's data cache was getting out of sync with the memory that it was supposed to be caching. When this happened, any application trying to read that memory would get the wrong answer -- and then anything could happen.</P>

<P>The bug generally exhibited itself when an application was reading from the database. It would read from the database, and sometimes get back garbage. The kernel people thought it was probably an application bug -- perhaps another application thread was corrupting memory. The application people thought it might be a kernel bug -- perhaps the kernel was returning bogus data. There was also the possibility that it was a hardware bug -- we were using disks with special firmware, and the disk might be glitching and returning garbage.</P>

<P>Brian, one of our top engineers, had a theory that the bug was a cache coherency problem and devised a clever way to prove it. First, you have to understand how our hardware worked.</P>

<P><B>The Hardware</B></P>

<P>For the most part, a TiVo was a generic computer with heavy A/V peripherals and a big disk and a slow CPU (a 50 MHz Power PC). Because the system would constantly be streaming audio and video around, encoding and decoding MPEG, it was very memory intensive. Running all of this data through the CPU would be impractical, so we also built a DMA engine that was capable of routing memory to and from the disk directly. This allowed the MPEG encoder (used to record a video stream) to encode the video to memory where the DMA engine could pick it up and transfer it directly to the disk. Meanwhile, the DMA engine could transfer more bits from the disk to memory where the MPEG decoder could decode them. All of this was done without the CPU needing to look at all the bits being transferred. This meant that the 50 MHz CPU could handle recording one video stream to disk while playing another back from disk while only using about 10% of the CPU.</P>

<P>The software on the box was mostly a stock Linux 2.1 kernel, though we had made a few modifications. One of the modifications was to support use of the DMA engine. There was a routine to transfer bits from memory to disk, and another to transfer bits from the disk back to memory.</P>

<P>For this bug, the interesting routine was the one to transfer bits from disk to memory. It worked like this: First, it would invalidate the CPU's data cache for the range of memory being DMAed into. Then, it would instruct the DMA engine to transfer the needed data from the disk to memory. Then the Linux thread would go to sleep and wait for an interrupt to indicate that the transfer was complete. Finally, when the interrupt came in, the kernel returned back to application space where it could read the memory.</P>

<P>Unfortunately, someone was reading this memory while it was being DMAed into -- and that led to a cache coherency bug.</P>

<P><B>Cache Coherency</B></P>

<P>Every modern CPU has a data cache. It is basically a copy of recently accessed memory that the CPU suspects it might want to use again. Without a data cache, every CPU operation involving memory would have to stall until the memory subsystem had read or written the relevant data. With a data cache, however, many of these CPU operations can simply use the memory stored in the data cache knowing that it is an accurate reflection of what is in memory. This allows a CPU to go much faster.</P>

<P>However, this whole theory breaks down if the the memory the CPU is storing in its data cache doesn't match the memory stored in the memory subsystem. This is called a cache coherency problem.</P>

<P>In this case, the CPU's data cache had been flushed, so we knew it was coherent before the DMA transfer. We also didn't think that anyone was reading the memory while the transfer was happening -- after all, no other thread would have any business reading this memory since its value would be indeterminate anyway -- how do you know if you are reading the data from before the transfer or from after the transfer, or perhaps a little of both?</P>

<P>However, if someone was reading the memory while the DMA was in progress, the CPU would faithfully send a read request to the memory subsystem and fill its data cache with the results. The DMA transfer would continue, and fill the memory subsystem with something else. Once that happened, the data cache was out of sync with the memory subsystem. Further attempts to read that memory would get the value that used to be in memory instead of the new stuff.</P>

<P>The first step was to prove that this was a cache coherency bug. Once that was done, we could assign blame later. To prove this, Brian prefilled all of the memory to be read into with 9s. Then he would issue a request to read from the disk right on top of where the 9s were stored -- once this happened, the 9s should be gone. If we later found a crashed thread that appeared to have tripped over memory containing a bunch of 9s, we could be pretty certain that a cache coherency bug during a database read was to blame.</P>

<P>We soon found many crashed threads that had tripped over memory containing 9s. We knew what kind of crime was being committed, though we still had no idea what code was to blame.</P>

<P><B>The Hunt</B></P>

<P>So there I was after being with the company for about a week. I had managed to set up my office, get my computer and my development TiVo set up, compile the source code, and talk to enough people to figure out what the bug was and how they knew it was a cache coherency bug.  Now all I had to do was find it and fix it.</P>

<P>I started off by looking at the application code reading from the disk, and it looked good. It allocated a block of shared memory, filled it with 9s, and read into it. Pretty simple. Noteworthy was that it read the data into shared memory, so any of the 20 other application threads could cause cache coherency problems if they read even a single byte of this memory. Of course, they shouldn't, since it was freshly allocated, and no one but the current thread had a pointer to it, but that didn't mean that they didn't.</P>

<P>I then looked at the kernel code for performing the DMA from disk to memory. It was also pretty simple. Flush the cache, start the disk read and DMA, block until the read completes, and return. There were also some code to lock the memory down during the transfer. We were running a system with virtual memory and a swapper that would swap old pages to the disk when more memory was needed. The locks set up during the DMA were there to tell the swapping process not to swap out these pages, and equally important, not to read them!</P>

<P>Well, I looked around for a week or so to no avail. The 9s bug was very hard to reproduce, so I usually didn't have any crashed boxes to poke at. And when I did find a box that had crashed due to the 9s bug, there wasn't much to do with it. The crime had already been committed, and the criminal was long gone. All I was left with was a dead box and a bunch of 9s.</P>

<P>After a couple weeks, I hadn't really made any progress. The only saving grace was that no one at TiVo had any ideas of what else I could try -- I think they were as unsure how to fix the bug as I was.</P>

<P><B>The PowerPC</B></P>

<P>I was stumped and not very hopeful. So I started doing some research. I had heard that some CPUs have special debug registers for this kind of thing, and I didn't know a thing about the PowerPC. So I pulled out a technical reference on the CPU and started reading.</P>

<P>After looking at the PPC specification for about an hour, I had found what I was looking for. It turns out there were two debug register I could set on the CPU that would cause a debug fault anytime someone attempted to read a specific address. Well, this isn't exactly what I wanted -- I really wanted to trap any reads to a whole range of memory -- but it was pretty good!</P>

<P>So, I patched the kernel code that read from the disk to set this register right after invalidating the CPU cache and reset it right before returning to the application. I didn't know what address to trap on, so I just picked a random address in the middle of the memory range. Then I checked my code into the tree and waited for the trap to spring. If any application or kernel thread dared to read this address while the DMA was in progress, we would catch them!</P>

<P>Even though the 9s bug would only rear its ugly head once every couple days, several of our test machines sprung the trap that night. Apparently the illicit reads were happening more frequently than the crashes. This made some sense once I thought about it -- our data cache was only about 16K, so the odds were pretty good that an out of sync data line would be flushed before the application had a chance to read it -- and so would go by unnoticed. No matter, I was thrilled that I had caught something!</P>

<P>Once the boxes hit the trap I had laid for them, they dropped right into the kernel debugger where I could see the exact stack trace of the guilty party. At that point, fixing the bug was easy.</P>

<P><B>Wrap Up</B></P>

<P>Where was the bug in the end?</P>

<P>Well, the primarily guilty party was the swapper. The locks we had set up to keep it from reading the locked pages weren't working properly. A more careful code inspection showed the problem.</P>

<P>However, I left the traps in place, and they sprung again a few weeks later. It turns out there was also an application bug. One of the application threads would update a database index once a day -- but had set up no locks to prevent reads during the update. If another thread tried to read the index during the update, it would not only get somewhat unpredictable results, but would also produce an incoherent cache.</P>

<P>So, in the end, there were both kernel and application bugs to blame.</P>

<P>I couldn't think of any good reason to remove the trap, so I left it in. Three months later it sprung again. New code we were testing showed another bug existed in the kernel's thread shutdown code.</P>

<P>A few months later, we ran into a new memory corruption problem that we concluded must be caused by the kernel overflowing its 4K stack. Unfortunately, the overflow would spill into another page of physical memory that could be mapped anywhere in virtual memory. This bug exhibited itself by random corruption in memory -- sometimes in application data, sometimes in application code, sometimes in the kernel itself. Having faced this problem before, it only took me a day to use the second debug register on the PPC for trapping memory reads to the end of the 4K kernel stack. After a night of testing in our labs, one of our machines fell into the trap and left us with a nice stack trace. What could have taken weeks to track down only took one night -- I guess I had learned something.</P>


<IMG SRC="/i/m/kpsmith_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;kpsmith<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=277956" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>

<P><BR/></P>
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
