<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>Google jobs at TopCoder Employment Services</TITLE>
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
  <!-- Global Seconday Nav Begins -->    
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
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
	<TR>
		<TD CLASS="statText" BGCOLOR="#43515E" HEIGHT="18" VALIGN="middle">&#160;&#160;<B>Great Jobs at Google</B></TD>
	</TR>
	<TR>
		<TD CLASS="bodyText" HEIGHT="18" VALIGN="middle">&#160;&#160;<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">Jobs</A>&#160;|&#160;
		<A HREF="http://www.google.com/about.html" CLASS="bodyText" TARGET="_blank">About Google</A>&#160;|&#160;
		<A HREF="http://www.google.com/jobs/culture.html" CLASS="bodyText" TARGET="_blank">Culture</A>&#160;|&#160;
		<A HREF="http://www.google.com/jobs/benefits.html" CLASS="bodyText" TARGET="_blank">Benefits</A>&#160;|&#160;
		<A HREF="http://www.google.com/jobs/inside.html" CLASS="bodyText" TARGET="_blank">Inside&#160;View</A>	
		</TD>
	</TR>	
</TABLE>


<IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/> 
<P>
<B>  Looking for interesting work that matters to millions of people?</B><BR/>
<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">View positions available at Google</A> (login required)
</P>

<P>
<B>Google's mission:</B><BR/>
Organize the world's information and make it universally accessible and useful.
</P>

<P>
To make this vision a reality, Google is looking for exceptional people who like to develop innovative new products, especially software engineers and tech-savvy product managers. Are you exceptional at what you do? Do you:
</P>

<P>
<UL>
	<LI> Thrive on working in small teams to develop innovative products?</LI>
	<LI> Enjoy developing efficient new algorithms for processing tremendous amounts of data?</LI>
	<LI> Think it would be fun to write distributed systems that run on thousands of computers?</LI>
	<LI> Live to have the results of your work used and depended upon by millions of people every day?</LI>
</UL>
</P>

<p><b>What is it like to work at Google?</b></p>

<p>Working at Google means solving fascinating problems and making 
        a positive difference in tens of millions of lives every
		      day.  This work has opened up interesting
		    new areas for us and presented challenges that are
		    not only new to us, but new to everyone in
		    computing.  These new problems require 
        exceptional thinking and technical expertise to solve, but
		      their solutions could dramatically improve the
		      accessibility of information for everyone in the
		      world.
      Here's a sampling of the kinds of things we work on at
		      Google:</p>
<p>
<blockquote>
<b>Large-scale computer systems problems, such as: </b> <ul>
<p><li>Designing and improving software that can crawl and index
		    billions of web pages and other documents,
		    comprising 20+ TB of raw data, in a few days. </li></p>
 <p><li>Developing efficient implementations for large-scale mathematical 
          problems, such as running Google's <a href="http://citeseer.nj.nec.com/page98pagerank.html" class="bodyText">Pagerank&#153; algorithm</a> on a graph of 3 billion nodes and 20 billion edges.</li></p>
 <p><li>Developing algorithms and heuristics to keep our index up to the minute by finding and reindexing <b>almost 
          all</b> web pages within minutes of when they change or they
			are created.</li></p>
 <p><li>Efficiently and rapidly searching our full index of more than 2 billion web pages 
          more than 150 million times per day (i.e., more than three thousand queries 
          per second at peak traffic times), plus providing search over our archives 
          of <a href="http://groups.google.com" class="bodyText">20 years of Usenet data (700M+ 
          messages)</a> and <a href="http://images.google.com" class="bodyText">320M+ images</a>.</li></p>
 <p><li>Harnessing the computational resources of our more than 10,000
			    computers to 
          solve large-scale problems (e.g., not just indexing documents
			    but experimenting with 
          new ranking algorithms, running machine learning algorithms on terabytes 
          of data, etc.)</li></p>
 <p><li>Using <i>millions of computers</i> to solve important problems requiring 
          substantial CPU resources, such as cancer and disease research. For 
          example, we have recently begun small-scale tests with the <a href="http://folding.stanford.edu" class="bodyText">Folding 
          at Home</a> project at Stanford University with a few thousand selected 
          <a href="http://toolbar.google.com/" class="bodyText">Google Toolbar</a> users, in preparation 
          for a much larger scale system that would enable our millions of Google 
          Toolbar users to opt-in to contributing their CPU cycles to solving 
          important problems.</li></p>
<p><li> Building large-scale distributed file systems and other infrastructure 
          that makes it possible to reliably and efficiently manage and process hundreds of terabytes of 
          information.</li></p>
 <p><li>Dealing with low-level networking issues as we crawl the
				web and serve user requests.</li></p>
 <p><li>Developing <a href="http://www.google.com/appliance/" class="bodyText">Google's Search 
          Appliance</a> product, consisting of custom hardware and software for 
          deploying Google's technology for searching private content.</li></p>
</ul>
<p><b>Practical application of machine-learning techniques</b></p> <ul>
<li>We apply machine-learning techniques to learn relationships and associations 
          within the data that we have. Our spelling correction system is a good 
          example (<a href="http://google.com/search?q=spehl+korector" class="bodyText">spehl 
          korector</a>? <a href="http://google.com/search?q=phonitick+spewling" class="bodyText">phonitick 
          spewling</a>? who needs a <a href="http://google.com/search?q=dictniary" class="bodyText">dictniary</a>?). </li>
<p><li> In the future, we'd like to improve our search quality by applying 
          machine-learning, artificial intelligence and information retrieval 
          techniques to problems such as: 
          </li></p>
<ul>
<li>Extraction of structured information from the web</li>
<li>Information synthesis (by pulling partial information from multiple 
              documents to fulfill an information need)</li>
<li>Learning of semantic concepts and using this to improve search</li>
<li>Automatic development of vertical search services</li>
<li>Answering of natural language queries</li>
<li>Automatic machine-translation between language pairs</li>
</ul>

<p>
<li> An unusual aspect of machine-learning work here is our ability to 
          process very large amounts of interesting data with large
		      numbers of computers to solve interesting problems.</li>
</p>
</ul>
<p><b>Scanning and providing search over large amounts of published 
        materials. </b></p>
<ul>
<li>See our <a href="http://catalogs.google.com" class="bodyText">printed catalog search</a> for an example of this.</li>
</ul>
<p><b>Automatically identifying important trends</b></p>
<ul>
<li>Using Google's information to keep track of the important new developments, 
          and automatically extracting summaries for people who need this information.</li>
<p>
<li> See our <a href="http://www.google.com/news/newsheadlines.html" class="bodyText">automatically 
          constructed news summary page</a> for an initial application in this 
          area (this system automatically identifies the most important new stories of the moment 
          and clusters together articles from different publications).</li></p>
</ul>
<p><b>Developing Google's <a href="http://www.google.com/ads/" class="bodyText">advertising 
        products</a>, so that we can maximize revenue by optimally
		    targeting advertisements from tens 
        of thousands of advertisers.</b></p>
<ul>
<li> For example, part of our advertising system solves a complex system 
          of hundreds of thousands of equations to more accurately target our 
          ads to our available advertising inventory. </li>
</ul>
<p><b>In addition, there are many other ideas and
		    products which are not listed here because 
        we're not yet ready to share them publicly.</b></p>
</blockquote>
</p>

<P>
<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">View positions available at Google</A> (login required)
</P>
<p>Google's mission is intentionally broad and we actively explore interesting 
        ideas, even when those ideas are risky and not assured of
		  success.  We are looking for bright, creative, and
		  talented individuals who enjoy doing the research, engineering, product development 
        and product management to transform ideas like these into products that 
        are not just beneficial, but essential to millions of people every day.</p>
        
<P>
<B>Google Myths &amp; Realities</B> <BR/>
We often hear myths and  misconceptions about Google that we would like to dispel:
</P>

<P>
      <B>MYTH:</B> There are no interesting problems left at Google.  <B>REALITY:</B> As we improve our search service and expand into other related areas, there are many interesting 
      problems to solve, in almost every area of computer science.  
</P>
      
<P>
      <B>MYTH:</B> Google is "just a search engine" and search is a solved problem.  <B>REALITY:</B> The perfect search 
      engine would understand exactly what you mean and give back exactly what you want.  We are continuously 
      making quality improvements in our search algorithms, but there is a huge gap between where we are 
      today and where we would like to be, and there are huge numbers     of open, interesting problems.   
</P>
      
<P>
      <B>MYTH:</B> Dot.com companies don't make money and aren't successful.  <B>REALITY:</B> Google is currently 
      profitable and cash-flow   positive.     Our focus as a company has always been on building a 
      profitable, sustainable and thriving business, and we are accomplishing this, but we are still in 
      the early stages.   
</P>
      
<P>
      <B>MYTH:</B> It's too late to join Google.   <B>REALITY:</B> We're still a very young, small, privately-held 
      company, and we provide a very attractive risk/reward tradeoff in an environment where you'll get 
      to work on fascinating things.
</P>
<P>
<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">View positions available at Google</A> (login required)
</P> 

<P>
<B>What we look for when hiring great people:</B>
<UL>
	<LI> People with broad knowledge and expertise in many different areas of computer science and mathematics, including distributed systems, operating systems, data mining, information retrieval, machine learning, performance optimization, algorithms, user interface design, statistical inference and information theory, and related areas.</LI>
	<LI> People with world-class programming skills.</LI>
	<LI> People with excellent communication and organizational skills.</LI>
	<LI> People who are passionate about their work and are great colleagues.</LI>
	<LI> People who enjoy working in a high-energy, unstructured environment on very small project teams to build amazing products used by millions of people every day.</LI>
	<LI> People with diverse interests and skills.</LI>
</UL>
</P>

<P>
<A HREF="/?&amp;t=tces&amp;c=google_openings&amp;a=secure" CLASS="bodyText">View positions available at Google</A> (login required)
</P> 
          
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
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
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