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
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">
                                    <A HREF="#1" CLASS="bodyText">How are point values for code submissions determined?</A>
                            </TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#2" CLASS="bodyText">How do I advance?</A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD ALIGN="left" VALIGN="middle" WIDTH="490">

                                    <A HREF="#3" CLASS="bodyText">It seems like I have the same points as someone else in my room. Who advances?</A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
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

                                    <A HREF="#5" CLASS="bodyText">Why is the point system so complicated?  Are you saying that at the time I submit a solution,
             I have no idea how many points I will receive for my submission?</A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#7" CLASS="bodyText">How are room assignments done? Will people with similar ratings be assigned to the same room?</A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#8" CLASS="bodyText">What if I am participating from behind a firewall?</A>

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

                                    <A HREF="#11" CLASS="bodyText">
                How do I emote something or whisper a private message to someone?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="5" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#12" CLASS="bodyText">
                How does the leaderboard work?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
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

                                    <A HREF="#14" CLASS="bodyText">
                Is it O.K. for a coder to obfuscate their code before submitting it?
              </A>

                            </TD>
                        </TR>
                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
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

                                    <A HREF="#16" CLASS="bodyText">
               How can I view problem statements, submissions, or statistics for previous matches or tournament rounds?
              </A>

                            </TD>
                        </TR>


                        <TR>
                            <TD VALIGN="top" HEIGHT="5"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" ALIGN="left" VALIGN="middle">

                                    <A HREF="#17" CLASS="bodyText">
              Can I re-submit my code during the coding phase if I find an error?
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
                            <TD CLASS="bodyText">

                                    <B>More Questions? <A HREF="/?t=contacts&amp;c=index" CLASS="bodyText">Contact Us</A></B>

                            </TD>
                        </TR>
                        <TR>
                            <TD HEIGHT="20" VALIGN="top"><IMG ALT="" SRC="/images/spacer.gif" WIDTH="1" HEIGHT="20" BORDER="0"/></TD>
                        </TR>
                        <TR>
                            <TD CLASS="bodyText" VALIGN="top">
                                        <A NAME="1" CLASS="bodyText"><B>How are point values for code submissions determined?</B></A>

                                    <BR/>

      Points are determined based on two factors: the difficulty of the problem and time it took to code once it was opened.
      The longer it takes to code, the fewer points will be awarded upon submission, and vice versa.<BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="2" CLASS="bodyText"><B>How do I advance?</B></A>

                                    <BR/>

      There is no advancement for the Single Round Matches.  For tournaments, at the end of each round, a certain number
      of coders from each arena (room) will advance to the next round. The number of coders who advance will depend on
      the structure of the specific tournament. A specific tournament's advancement structure can be viewed under the
      details of a specific tournament. In all cases, in order to be considered for advancement, a coder must have either
      submitted a problem or a submitted a challenge. Otherwise, we would have nothing to go on!<BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="3" CLASS="bodyText"><B>It seems like I have the same points as someone else in my room. Who advances?</B></A>

                                    <BR/>

      In the event that there is a tie, the rules vary for each event.  Check the tie breaker rules for a specific
      event under the Tournaments section of the web site.<BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

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

                                        <A NAME="5" CLASS="bodyText"><B>Why is the point system so complicated?  Are you saying that at the time I submit a solution, I have no idea how many points
      I will receive for my submission?</B></A>

                                    <BR/>

      That's exactly what we're saying. The reason the point system needs to be so complex is so that ties are avoided.
      Time is the only factor we could use to differentiate two coders who otherwise did the same work.<BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="7" CLASS="bodyText"><B>How are room assignments done? Will people with similar ratings be assigned to the same room?</B></A>

                                    <BR/>

      Actually, it's the other way around. There are two divisions of rooms: those with ratings 1500 and above, and
      those will ratings below 1500. All rooms in a division will have roughly the same average room rating. <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="8" CLASS="bodyText"><B>What if I am participating from behind a firewall? </B></A>

                                    <BR/>
The TopCoder applets use socket connections to connect to the TopCoder servers.
The TopCoder servers use TCP ports 5001-5010, so your firewall must allow outbound TCP
connections to topcoder.com on these ports. Your network administrator may be able to set
up the f irewall to allow for this communication. The applets will utilize the proxy settings
of the browser in which they run.  If you are denied access to port 5001 - 5010 and wish to
connect to the arena via HTTP tunneling you may select the Tunnel Option on the arena login screen.
Note, that selecting this option will reduce your perfomance.
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

                                        <A NAME="11" CLASS="bodyText"><B>
            How do I emote something or whisper a private message to someone?
          </B></A>

                                    <BR/>
        To emote something, type a chat that includes /me. The /me will get replaced with your handle. To whipser to
        another user, type a chat in the format: /msg &lt;handle&gt; &lt;message&gt;. This will send a private message to another
        user, if they are logged in. However, for security purposes, bear in mind that all logged in admins will also
        receive that whisper.
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="12" CLASS="bodyText"><B>
            How does the leaderboard work?
          </B></A>

                                    <BR/>
        If the leaderboard ticker is running, that means the results for the current (or recently finished) contest are
        available through the applet. Simply click the "Go" button at the top of the applet window, and all the rooms
        will be display. An asterisk next to a room leader means that that room is particularly close. Double-clicking
        on a room leader will give you a "window" into that room, where you will be able to see what is taking place
        without actually being there.
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

                                        <A NAME="14" CLASS="bodyText"><B>
            Is it O.K. for a coder to obfuscate their code before submitting it?
          </B></A>

                                    <BR/>
Any code submissions that contains obvious and deliberate code obfuscation will not be allowed.  Violations to this policy will be penalized by a loss of all points received for the obfuscated submission.  For the purpose of this policy TopCoder defines obfuscation as "An obvious and deliberate attempt to disguise the true behavior or nature of the code."  In ALL cases, TopCoder will make the final decision as to whether or not a code submission has been intentionally obfuscated.  We encourage any TopCoder competitor to notify us in the event that you feel that a code submission during a rated event violates this policy.
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

                                        <A NAME="16" CLASS="bodyText"><B>
            How can I view problem statements, submissions, or statistics for previous matches or tournament rounds?
          </B></A>

                                    <BR/>
After each match or tournament round TopCoder creates a practice room with the same problem set that was used.  Here you can view the problem statements and attempt to create solutions to the problems.  In addition, the detailed statistics for each match or tournament round are available to members on the web site.  If you login to the web site and navigate to "Statistics", you can view all problem statements, submissions, challenges, and system tests - including the expected and received values for each challenge and system test.
      <BR/>
                                    <A HREF="#top" CLASS="bodyText">[back to top]</A>
                                    <BR/>
                                    <BR/>

                                        <A NAME="17" CLASS="bodyText"><B>
            Can I re-submit my code during the coding phase if I find an error?
          </B></A>

                                    <BR/>

Yes, TopCoder allows multiple submissions during the coding phase.<BR/>
Here are the rules:
<ul>
<li>You can submit the same problem as many times as you like.</li>
<li>For every submission past the first one you will incur a 10% penalty of the problem point total potential.<br/>
Example:<br/>
Coder A's 1st submission of the 500pt problem results in 400pts because they took approximately 15 minutes to solve it.<br/>
Coder A's 2nd submission of the 500pt problem results in 280pts because they took an additional 8 minutes to solve (a total of 23) and we penalized 50pts (50 = 500*.10)</li>
<li>You can never go below 3/10 of the problems point total potential.<br/>
Example:<br/>
Coder B's 29th submission of the 500pt problem will result in 150pts<br/>
Coder B's 55th submission of the 500pt problem will result in 150pts</li>
</ul>
**Some of the numbers in the examples above are rounded.

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

