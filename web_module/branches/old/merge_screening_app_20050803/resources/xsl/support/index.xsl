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
                        <TR><TD><A HREF="#65" CLASS="bodyText">Do you really think this is a good way to measure the relative merit of programmers?</A></TD></TR>

                        <TR><TD><A HREF="#67" CLASS="bodyText">Who owns the source code that I write during tournaments?</A></TD></TR>

                        <TR><TD><A HREF="#80" CLASS="bodyText">How does the rating system work?</A></TD></TR>

                        <TR><TD><A HREF="#180" CLASS="bodyText">I'm having a problem with font properties on Linux platforms.</A></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>


                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Java</B></TD></TR>

                        <TR><TD><A HREF="#java1" CLASS="bodyText">How is my submission judged?</A></TD></TR>

                        <TR><TD><A HREF="#java2" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#java3" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#java4" CLASS="bodyText">What options are set when starting up the VM?</A></TD></TR>

                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET</B></TD></TR>

                        <TR><TD><A HREF="#c1" CLASS="bodyText">How is my submission judged?</A></TD></TR>

                        <TR><TD><A HREF="#c2" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#c3" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#c4" CLASS="bodyText">What do I need to import to use standard VB.NET functions?</A></TD></TR>

                        <TR><TD><A HREF="#c5" CLASS="bodyText">Why is my stack trace reporting strange/incorrect line numbers?</A></TD></TR>



                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C++</B></TD></TR>

                        <TR><TD><A HREF="#181" CLASS="bodyText">How is my submission judged?</A></TD></TR>

                        <TR><TD><A HREF="#182" CLASS="bodyText">What hardware does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#183" CLASS="bodyText">What software does TopCoder use?</A></TD></TR>

                        <TR><TD><A HREF="#184" CLASS="bodyText">What compiler options are used?</A></TD></TR>

                        <TR><TD><A HREF="#188" CLASS="bodyText">Why doesn't my code compile anymore under gcc 3.x?</A></TD></TR>

                        <TR><TD><A HREF="#185" CLASS="bodyText">What libraries are available?</A></TD></TR>

                        <TR><TD><A HREF="#186" CLASS="bodyText">How do i get 64-bit integers?</A></TD></TR>

                        <TR><TD><A HREF="#187" CLASS="bodyText">What STL types are available?</A></TD></TR>


                        <TR><TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>MAC OSX</B></TD></TR>

                        <TR><TD><A HREF="#mac1" CLASS="bodyText">The small HTML window that holds the contest applet does not load up the applet in MAC OSX</A></TD></TR>

                        <TR><TD><A HREF="#mac3" CLASS="bodyText">I tried loading the Arena through the JWS link and I'm getting an error when JWS is running that the applet cannot be loaded.</A></TD></TR>

                        <TR><TD><A HREF="#mac4" CLASS="bodyText">How do I copy and paste in the Arena when using Mac OSX?</A></TD></TR>

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
                        <TR><TD CLASS="bodyText"><A NAME="65"><B>Do you really think this is a good way to measure the relative merit of programmers?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">The ability to quickly code solutions to a set of somewhat simple algorithmic problems does not completely define a "top" programmer. However, our attempt to make TopCoder tournaments as objective as possible has initially lead us in this direction.  We continuously discuss ways in which we might introduce code elegance, style, reusability, and other less objectively ratable elements into our tournaments.  We'd love to hear any suggestions on how this might be accomplished.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="67"><B>Who owns the source code that I write during tournaments?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">The coder.  Our Terms of Use agreement basically specifies that the coder who submits any source code to TopCoder owns the code.  We simply require that we can display the source code for the normal course of the tournaments.  The actual source code is viewable during certain parts of the competition to competitors and spectators. You can read the complete Terms of Use agreement <A HREF="/tc?module=Static&amp;d1=about&amp;d2=terms" CLASS="bodyText">here</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="80"><B>How does the rating system work?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Each tournament round is an elimination round. Contestants survive to subsequent rounds by being the fastest to write working programs that accurately answer the challenge question(s). Ratings will then be adjusted by comparing the competitor's record against the other members.  The details of the rating formula can be found <A HREF="/index?t=support&amp;c=ratings" CLASS="bodyText"> here</A>.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="180"><B>I'm having a problem with font properties on Linux platforms.</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Apparently, Sun has a problem with their font.properties file on the Linux platform that is causing errors with some fonts (Arial is one of them).  The fix is to replace the font.properties file with the following: <A HREF="http://java.sun.com/j2se/1.3/font.properties" TARGET="_blank" CLASS="bodyText">http://java.sun.com/j2se/1.3/font.properties</A></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>



                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Java</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="java1"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText"><P>TopCoder submissions typically consist of a single class definition. For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments. Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc.</P>
<P>Each Java test is performed in a separate thread. The process is forcibly terminated after consuming 2 seconds of System time. At most 64 megabytes of memory may be mapped.</P>
<P>If your method does return a value, that is the only basis for judging correctness.</P></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="java2"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">We use 6 2-way 3.6 Ghz Pentium IV Xeon systems.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="java3"><B>What software does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Linux 2.4, Java 5.0 (build 1.5.0_03).</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="java4"><B>What options are set when starting up the VM?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">java -client -Xmx64m &lt;main class&gt;</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>


                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="c1"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>TopCoder submissions typically consist of a single class definition. For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments. Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc. </P>
<P>Each Microsoft&#174; Visual C#&#174; .NET or Microsoft&#174; Visual Basic&#174; .NET test is performed in a separate thread. The process is forcibly terminated after consuming 2 seconds of System time.</P>
<P>If your method does return a value, that is the only basis for judging correctness.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="c2"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>We use 2 4-way 700 Mhz Pentium III Xeon systems. Each processor has separate 16kb level one caches for instructions and data, and its own 1024kb level two cache clocked at core speed.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="c3"><B>What software does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>Microsoft Windows 2000 5.00.2195 SP2, .NET Framework version 1.0.3705</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="c4"><B>What do I need to import to use standard VB.NET functions?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>You need to import "Imports Microsoft.VisualBasic"</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="c5"><B>Why is my stack trace reporting strange/incorrect line numbers?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>Because we compile with optimization on, the compiler will sometimes rearrange and optimize functions in such a way that line numbers no longer match the original source code.  We recommend you add Console.WriteLine() statements to help debug the problem if necessary.</P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>



                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>C++</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="181"><B>How is my submission judged?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">
<P>TopCoder submissions typically consist of a single class definition.  For each test, one instance of the class is constructed; then the method described in the problem is called with the test arguments.  Therefore, your method must be public, and your class must be instantiable: public default constructor, no abstract methods, etc.</P>
<P>C++ submissions may also define other classes and global variables or functions.  However, defining main() will prevent your submission from linking, and referring to library globals (stdout or cout for example) before your method is called is not guaranteed to work as expected.</P>
<P>Each C++ test is performed in a separate process.  The instance of your class used by the tester is not guaranteed to be destroyed.  The process is forcibly terminated after consuming 2 seconds of CPU time.  At most 64 megabytes of memory may be mapped.  Stack space is limited to 8 megabytes (the Linux default).  Most system calls are emulated or ignored.  Note especially that fork() or use of threads (library or kernel) will fail, and use of temporary files is not permitted.</P>
<P>If your method does not return before the process exits (due to exceeding the time limit, an uncaught exception, segmentation fault, divide by zero, etc), it has failed the test.</P>
<P>If your method does return a value, that is the only basis for judging correctness.  Anything printed to stdout or stderr is ignored, although you will see it when testing your own code.  Output may even return an IO error, and takes extra time during testing; you are advised not to leave unnecessary IO in your final submission. </P>
                        </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="182"><B>What hardware does TopCoder use?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">We use 2 2-way 3.6 Ghz Pentium IV Xeon systems.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

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



                        <TR><TD CLASS="bodyText"><A NAME="185"><B>What libraries are available?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Only default libraries will be linked with your code.  Math functions requiring libm on some platforms, eg cos(), are automatically linked if needed.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

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

                        <TR><TD CLASS="bodyText"><A NAME="187"><B>What STL types are available?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">All of the standard value types and container types should be present.
Some extensions are also present, including most of those from SGI's STL, such as rope, hash_set, hash_map, tree, slist, etc.
                            </TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>




                        <TR><TD HEIGHT="5" VALIGN="top" CLASS="bodyText"><B>MAC OSX</B></TD></TR>
                        <TR><TD HEIGHT="10" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>
                        <TR><TD CLASS="bodyText"><A NAME="mac1"><B>The small HTML window that holds the contest applet does not load up the applet in MAC OSX</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">A workaround is to load the arena through Java Web Start (JWS).  A link that allows you to load the arena through JWS and more info on JWS is available on TopCoder home page.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="mac3"><B>I tried loading the Arena through the JWS link and I'm getting an error when JWS is running that the applet cannot be loaded.</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">JWS on OSX has a tendency to cache past loading of the applet. If you did tried to load the applet with a previous version of JWS or continue to have problems, open JWS and select "Preferences". You will see a field for "Application Folder Options". In this you will see a reference to /Users/you/.javaws/cache. Click on "Clear Folder" to remove the cache. Return to TopCoder.com and click on the JWS link. The applet should now load (assuming you are running OSX 10.1).</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><A NAME="mac4"><B>How do I copy and paste in the Arena when using Mac OSX?</B></A></TD></TR>
                        <TR><TD CLASS="bodyText">Although many Mac users commonly use command-C and command-V to copy and paste, you must use ctrl-C and ctrl-V to copy and paste from within the Arena.</TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>

                        <TR><TD CLASS="bodyText"><B>More Questions? <A HREF="/index?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B></TD></TR>
                        <TR><TD VALIGN="bottom" ALIGN="left"><A HREF="#top" CLASS="bodyText">[back to top]</A></TD></TR>


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

