<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/module_login.xsl"/>  
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/jobs/public_jobs_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Jobs</TITLE>
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
  <!-- Global Seconday Nav Begins -->    
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->  
        <xsl:call-template name="public_jobs_left"/>
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
  <xsl:with-param name="image">jobs</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Employment Services</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
        <TR>
          <TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
          <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/><BR/>
<!--body contextual links-->
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="150">
   <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
                <TR> 
                <TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD>
                </TR>
              <TR>
                    <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
                <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">EMPLOYMENT LINKS:</TD>
              </TR>                    
              <TR>
                    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#999999">
          <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
            <TR>
              <TD VALIGN="top" CLASS="smallText">&#160;&#160;</TD>
              <TD COLSPAN="2" VALIGN="top" CLASS="bodyText"><A HREF="mailto:tces@topcoder.com" CLASS="bodyText">Contact employment services</A></TD>
            </TR>
            <TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>        
          </TABLE>
                </TD>
            </TR>
   <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE> -->

<IMG SRC="/i/es/google_sm.gif" WIDTH="143" HEIGHT="59" BORDER="0"/><BR/> 
<P>
<A HREF="/?t=jobs&amp;c=google_openings" CLASS="bodyText">View positions available at Google</A> (login required)
</P>      

<P>
<B>  Looking for interesting work that matters to millions of people?</B> 
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
          more than 150 million times per day (i.e. more than three thousand queries 
          per second at peak traffic times), plus providing search over our archives 
          of <a href="http://groups.google.com" class="bodyText">20 years of Usenet data (700M+ 
          messages)</a> and <a href="http://images.google.com" class="bodyText">320M+ images</a>.</li></p>
 <p><li>Harnessing the computational resources of our more than 10,000
			    computers to 
          solve large-scale problems (e.g. not just indexing documents
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
<!--
<li>We apply machine-learning techniques to learn relationships and associations 
          within the data that we have. Our spelling correction system is a good 
          example (<a href="http://google.com/search?q=spehl+korector" class="bodyText">spehl 
          korector</a>? <a href="http://google.com/search?q=phonitick+spewling" class="bodyText">phonitick 
          spewling</a>? who needs a <a href="http://google.com/search?q=dictniary" class="bodyText">dictniary</a>?). 
          People searching for <a href="britney.html" class="bodyText">Britney Spears</a> have 
          clearly found it useful on many occasions. </li>
-->
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
<p>Google's mission is intentionally broad and we actively explore interesting 
        ideas, even when those ideas are risky and not assured of
		  success.  We are looking for bright, creative, and
		  talented individuals who enjoy doing the research, engineering, product development 
        and product management to transform ideas like these into products that 
        are not just beneficial, but essential to millions of people every day.</p>
        
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
<A HREF="/?t=jobs&amp;c=google_openings" CLASS="bodyText">View positions available at Google</A> (login required)
</P> 

        

<!-- <table border=0 cellspacing=2 width="90%" align="center" cellpadding="1">
<tr> <td style="background-color: #006633"> <table class=sidebar bgcolor="#ffffff" cellpadding=8 cellspacing=0 border=0 width="100%">
<tr valign="top" align=left> <td> <table border="0" cellspacing="0" cellpadding="5" bgcolor="#006633" width="100%" align="center">
<tr valign="top"> <td style="background-color: #EFEFEF"> <font face="Arial, sans-serif" size="-1">MYTH: 
                            There are no interesting problems left at
				    Google.</font>
</td>
</tr>
<tr valign="top"> <td><font face="Arial, sans-serif" size="-1">REALITY: 
                          As we improve our search service and expand into other 
                          related areas, there are many interesting problems to 
                          solve, in almost every area of computer science. </font></td>
</tr>
<tr valign="top"> <td style="background-color: #EFEFEF"><font face="Arial, sans-serif" size="-1">MYTH: 
                          Google is &quot;just a search engine&quot; and search 
                          is a solved problem.</font></td>
</tr>
<tr valign="top"> <td><font face="Arial, sans-serif" size="-1">REALITY: 
                          The perfect search engine 
                          would understand exactly what you mean and give back 
                          exactly what you want.  We are continuously making 
                          quality improvements in our search algorithms, but there 
                          is a huge gap between where we are today and where we 
                          would like to be, and there are huge numbers
				    of open, interesting problems.</font></td>
</tr>
<tr valign="top"> <td style="background-color: #EFEFEF"><font face="Arial, sans-serif" size="-1">MYTH: 
                          Dot.com companies don't make money and aren't successful.</font></td>
</tr>
<tr valign="top"> <td><font face="Arial, sans-serif" size="-1">REALITY: 
                          Google is currently profitable and cash-flow
				  positive.
				    Our focus 
                          as a company has always been on building a profitable, 
                          sustainable and thriving business, and we are accomplishing 
                          this, but we are still in the early stages.</font></td>
</tr>
<tr valign="top"> <td style="background-color: #EFEFEF"><font face="Arial, sans-serif" size="-1">MYTH: 
                          It's too late to join Google.</font></td>
</tr>
<tr valign="top"> <td><font face="Arial, sans-serif" size="-1">REALITY: We're 
                        still a very young, small, privately-held company, and 
                        we provide a very attractive risk/reward tradeoff in an 
                        environment where you'll get to work on fascinating things. 
                        </font></td>
</tr>
</table>
</td>
</tr>
</table>
</td>
</tr>
</table>
<p> <p><b><font face="Arial, sans-serif">What we look for when hiring great people:</font></b></p>
<ul>
<li>People with broad knowledge and expertise in many different areas 
          of computer science and mathematics, including distributed systems, 
          operating systems, data mining, information retrieval, machine learning, 
          performance optimization, algorithms, user interface design, statistical 
          inference and information theory, and related areas.</li>
<li>People with world-class programming skills.</li>
<li>People with excellent communication and organizational skills.</li>
<li> People who are passionate about their work and are great colleagues.</li>
<li> People who enjoy working in a high-energy, unstructured environment 
          on very small project teams to build amazing products used by millions 
          of people every day.</li>
<li>People with diverse interests and skills.</li>
</ul>
<p><font face=arial><b>Google's Stable Hiring Over Time</b></font> </p>
<table border=0 cellspacing=5 width="90%" align="center">
<tr> <td style="background-color: #006633"> <table class=sidebar bgcolor="#ffffff" cellpadding=4 cellspacing=0 border=0 width="100%">
<tr> <td> <font size="-1" face="Arial, sans-serif">Google 
                    has been hiring continuously over the lifetime of the company 
                    and we have never had layoffs.  Our employee
			      growth rate has been roughly linear over
			      time, over a period in which our web search traffic has increased by a 
                    factor of 1000X, as shown below: </font> <center><img src="hiring.gif"></center>
</td>
</tr>
</table>
</td>
</tr>
</table>
<p><font face="Arial, sans-serif"><b>Life at Google</b></font></p>
<p>Google's <a href="culture.html">culture</a> is strong and inclusive, 
        and we have an unusually open organization, where communication is actively 
        encouraged among all employees and business information is broadly disseminated. 
        If you think you'd enjoy working on problems like those described above 
        and you have a strong record of accomplishment in a fast-paced technology 
        environment, please send your resume and a brief cover letter to:</p>
<p><center><a href="mailto:greatpeople@google.com">greatpeople@google.com</a></center> </p> -->
<!--
</td>
</tr>
</table>
-->


<!-- <P>
Google's approach is to foster creativity and cooperation in the pursuit of a common goal: creating the world's best search service. In doing so, we have developed two strong revenue streams in search services and advertising, enabling us to attain profitability in a competitive marketplace. While developing services to be used by millions of people daily, you'll enjoy challenging projects and a unique work environment.
</P>

<P>
Positions based in the San Francisco Bay Area unless otherwise noted in job description.
</P>

<BR/>

<P>
<B>An Inside View of Google</B>
</P>

<P>
You won't find any bored engineers at Google. 
You will find friendly colleagues, fascinating projects, and the opportunity to make life better 
for tens of millions of people every day. We work on challenging, real-world problems - 
like crawling and indexing billions of documents, or delivering search results to a mobile phone. 
We're constantly pushing the limits of what can be done with information. And while we work hard, 
we also have fun doing it. Google is an unusually open environment where kids feel welcome and the 
pace is intense, but family-friendly.
</P>
<P>We're looking for people with world-class programming skills who are passionate about their work and 
want to make a difference in the world. Do you thrive in small, focused teams and high-energy environments? 
Would you find it satisfying to develop innovative products that actually matter? If so, there are plenty 
of interesting projects waiting for you at Google.</P>

<P>
<A HREF="/?t=jobs&amp;c=google_openings" CLASS="bodyText">View positions available at Google</A> (login required)
</P>

<P>
If you would like more information about the [TCES] Candidate Recruiting Program, please 
contact us at <A HREF="mailto:tces@topcoder.com" CLASS="bodyText">tces@topcoder.com</A>.
</P> -->
<!--end contextual links-->
          
          <P><BR/></P>
          </TD>
          <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        </TR>
        <TR>
          <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
        </TR>     
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
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- <xsl:if test="not(/TC/LoggedIn='true')">
<xsl:call-template name="module_login"/>
</xsl:if> -->
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


