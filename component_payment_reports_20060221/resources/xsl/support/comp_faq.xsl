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
        <TITLE>Competition FAQ at TopCoder</TITLE>
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
  <xsl:with-param name="title">&#160;Competition FAQ</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
                    <BR/>
                    <TABLE WIDTH="100%" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                        <TR>
                            <TD ALIGN="left" VALIGN="middle" WIDTH="490">

                                    <A HREF="#4" CLASS="bodyText">How does rating work?</A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#9" CLASS="bodyText">
                Occasionally, when navigating between rooms, I lose my cursor/focus, or stranger
                it may have two blinking cursors, but I can't type anything?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#10" CLASS="bodyText">
                Why am I not able to copy and paste to my arena applet?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#13" CLASS="bodyText">
                The small HTML window that holds the contest applet does not pop up in Mozilla 0.9.4.
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#15" CLASS="bodyText">
                If I choose to code a solution in C++, which implementation of string or vector do I use?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#18" CLASS="bodyText">
              How are returns of type double evaluated for correctness?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
                                    <A HREF="#19" CLASS="bodyText">My submission failed because it ran out of memory, what's wrong?</A>
                            </TD>
                        </TR>

                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText">

                                    <B>More Questions? <A HREF="/?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="20" VALIGN="top"><IMG ALT="" SRC="/images/spacer.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" VALIGN="top">
                                        <A NAME="4" CLASS="bodyText"><B>How does rating work?</B></A>

                                    <BR/>

      Rating events occur at the completion of every round, following the system tests.
      Single round matches and tournament rounds are considered rated events, and therefore rating will be adjusted
      after each.  Finishing first and advancing does not necessarily guarantee your rating will go up. It is
      based on your performance compared everyone else participating in that round, taking into account relative
      ratings. <A HREF="/index?t=support&amp;c=ratings" CLASS="bodyText">Click here to see a detailed description of the rating process.</A>

                                    <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="9" CLASS="bodyText"><B>
            Occasionally, when navigating between rooms, I lose my cursor/focus, or stranger
            it may have two blinking cursors, but I can't type anything?
          </B></A>

                                    <BR/>
This problem is currently being examined.  The current temporary solution is to reload the applet.
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="10" CLASS="bodyText"><B>
            Why am I not able to copy and paste to my arena applet?
          </B></A>

                                    <BR/>
      This problem seems to be specific to JRE 1.3.1.
      Here is the fix asumming you are using JRE1.3.1:
      make sure to check for all java.policy files on your machine to catch the plugin JRE directory.
      If you are a Windows user, it should be something like
      c:\program files\javasoft\jre\1.3.1\lib\security.
      Add this permission to the java.policy file:<BR/>
      grant CodeBase "http://www.topcoder.com/-" {<BR/>
        permission java.awt.AWTPermission "accessClipboard";<BR/>
      };<BR/>
                                    <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="13" CLASS="bodyText"><B>
            The small HTML window that holds the contest applet does not pop up in Mozilla 0.9.4.
          </B></A>

                                    <BR/>
This is caused by mozilla bug 101323 (http://bugzilla.mozilla.org), which is new as of 0.9.4. The effect of the bug is that you can't use Javascript Window.open to popup a new window with a background image. If you do, the browser becomes unable to open any new windows until you manually kill it.  A workaround is to pop up a new window on your own and then go to the URL "http://www.topcoder.com/?Task=arena"
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="15" CLASS="bodyText"><B>
            If I choose to code a solution in C++, which implementation of string or vector do I use?
          </B></A>

                                    <BR/>
C++ solutions that use string refer to the C++ string.  Arguments or returns that indicate "vector" refer to the STL (Standard Template Library) implementation of vector.
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="18" CLASS="bodyText"><B>
            How are returns of type double evaluated for correctness?
          </B></A>

                                    <BR/>
Since math involving floating point numbers is subject to rounding errors, double are evaluated differently than other return types.
For most return types, your method's result must exactly match the result of the reference solution.  Doubles, however, are a special case
where your result must be correct only to a certain degree of precision.  To determine whether or not your solution is close enough, the system will test as follows:
<br/><ul>
<li>If the expected result is NaN, +Infinity, or -Infinity, your result must be also.  (We do not plan on using any of these returns for the time being.)</li>
<li>If your result is within 10<sup>-9</sup> of the expected result, your solution will be evaluated as correct.</li>
<li>If your result is between (1+10<sup>-9</sup>) * expected and (1-10<sup>-9</sup>) * expected, it will be evaluated as correct.</li>
<li>If none of the above are true, your result will be evaluated as incorrect.</li></ul>
<br/>If the return type is a double[] (vector&lt;double&gt; in C++) each of the elements of the array must pass the above tests.
<br/>The exact implementation of this is:
<pre>
    static final double MAX_DOUBLE_ERROR = 1E-9;
    private static boolean doubleCompare(double expected, double result){
        if(Double.isNaN(expected)){
            return Double.isNaN(result);
        }else if(Double.isInfinite(expected)){
            if(expected &gt; 0){
                return result &gt; 0 &amp;&amp; Double.isInfinite(result);
            }else{
                return result &lt; 0 &amp;&amp; Double.isInfinite(result);
            }
        }else if(Double.isNaN(result) || Double.isInfinite(result)){
            return false;
        }else if(Math.abs(result - expected) &lt; MAX_DOUBLE_ERROR){
            //always allow it to be off a little, regardless of scale
            return true;
        }else{
            double min = Math.min(expected * (1.0 - MAX_DOUBLE_ERROR),
                                 expected * (1.0 + MAX_DOUBLE_ERROR));
            double max = Math.max(expected * (1.0 - MAX_DOUBLE_ERROR),
                                  expected * (1.0 + MAX_DOUBLE_ERROR));
            return result &gt; min &amp;&amp; result &lt; max;
        }
    }

</pre>
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="19" CLASS="bodyText"><B>
            My submission failed because it ran out of memory, what's wrong?
          </B></A>

                                    <BR/>

Using any form of output to the console (cout in C++, System.println in Java,
Console.WriteLine in C# / VB) will add to your memory use.  The system has to
redirect the standard out to memory so that it can trap the results.  This
means that if you have a lot of output in your code, it will likely fail
testing.

<br/><br/>

We recommend that you remove all output statements before submitting your code
to avoid this situation.

      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>



                            </TD>
                        </TR>
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


