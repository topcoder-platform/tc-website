<html>

<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

<jsp:include page="../includes/css.jsp" />

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp" />
<!-- Top ends -->

<table border="0" cellspacing="0" cellpadding="0" width="100%">
    <tr valign="top">

<!-- Left Column begins -->
        <td width="170" bgcolor="#001934">
            <jsp:include page="../includes/left_nav.jsp" />
            <jsp:include page="../includes/left_calendar.jsp" />
        </td>
<!-- Left Column begins -->
        
<!-- Center Column begins -->
        <td valign="top" background="/i/hs/bluegradiant_bg.gif" bgcolor="#FFFFFF" width="99%">
            <table cellspacing="0" cellpadding="10" border="0" width="100%">
                <tr><td width="100%" bgcolor="#001934"><img src="/i/hs/headinginside_faq.gif" width="348" height="44" alt="Support" border="0"></td></tr>
                
                <tr valign="top">
                    <td width="100%">
                        <h3>Competition FAQ</h3><a name="top"></a>

                        <p><a href="#1">How are point values for code submissions determined?</a></p>
                        <p><a href="#2">How do I advance?</a></p>
                        <p><a href="#3">It seems like I have the same points as someone else in my room. Who advances?</a></p>
                        <p><a href="#4">How does rating work?</a></p>
                        <p><a href="#5">Why is the point system so complicated?  Are you saying that at the time I submit a solution,
                        I have no idea how many points I will receive for my submission?</a></p>
                        <p><a href="#8">What if I am participating from behind a firewall?</a></p>
                        <p><a href="#9">Occasionally, when navigating between rooms, I lose my cursor/focus, or stranger
                        it may have two blinking cursors, but I can't type anything?</a></p>
                        <p><a href="#10">Why am I not able to copy and paste to my arena applet?</a></p>
                        <p><a href="#11">How do I emote something or whisper a private message to someone?</a></p>
                        <p><a href="#12">How does the leaderboard work?</a></p>
                        <p><a href="#13">The small HTML window that holds the contest applet does not pop up in Mozilla 0.9.4.</a></p>
                        <p><a href="#14">Is it O.K. for a coder to obfuscate their code before submitting it?</a></p>
                        <p><a href="#15"> If I choose to code a solution in C++, which implementation of string or vector do I use?</a></p>
                        <p><a href="#16">How can I view problem statements, submissions, or statistics for previous matches or tournament rounds?</a></p>
                        <p><a href="#17">Can I re-submit my code during the coding phase if I find an error?</a></p>

                        <img src="/i/hs/clear.gif" width="1" height="10" border="0"/>
                        
                        <p><strong>More Questions?<a href="http://www.topcoder.com/?&t=contacts&c=index">Contact Us</a></strong></p>
                        
                        <img src="/i/hs/clear.gif" width="1" height="10" border="0"/>
                        
                        <table cellspacing="0" cellpadding="10" border="0" width="100%">
                            <tr valign="top">
                                <td><a name="1"><strong>How are point values for code submissions determined?</strong></a><br>
                        
      Points are determined based on two factors: the difficulty of the problem and time it took to code once it was opened.
      The longer it takes to code, the fewer points will be awarded upon submission, and vice versa.<br><a href="#top">[back to top]</a><br><br><a name="2"><strong>How do I advance?</strong></a><br>

      There is no advancement for the matches during the regular season.  For tournaments, at the end of each round, a certain number
      of coders from each arena (room) will advance to the next round. The number of coders who advance will depend on
      the structure of the specific tournament. A specific tournament's advancement structure can be viewed under the
      details of a specific tournament. In all cases, in order to be considered for advancement, a coder must have either
      submitted a problem or a submitted a challenge.<br><a href="#top">[back to top]</a><br><br><a name="3"><strong>It seems like I have the same points as someone else in my room. Who advances?</strong></a><br>

      In the event that there is a tie, the rules vary for each event.  Check the tie breaker rules for a specific
      event under the Tournaments section of the web site.<br><a href="#top">[back to top]</a><br><br><a name="4"><strong>How does rating work?</strong></a><br>

      Rating events occur at the completion of every round, following the system tests.
      Regular season matches and tournament rounds are considered rated events, and therefore rating will be adjusted
      after each.  Finishing first and advancing does not necessarily guarantee your rating will go up. It is
      based on your performance compared to everyone else participating in that round, taking into account relative
      ratings. <a href="?module=Static&d1=faq&d2=ratings_ovrev">Click here to see a detailed description of the rating process.</a><br><a href="#top">[back to top]</a><br><br><a name="5"><strong>Why is the point system so complicated?  Are you saying that at the time I submit a solution, I have no idea how many points
      I will receive for my submission?</strong></a><br>

      That's exactly what we're saying. The reason the point system needs to be so complex is so that ties are avoided.
      Time is the only factor we could use to differentiate two coders who otherwise did the same work.<br><a href="#top">[back to top]</a><br><br>
      <!--<A NAME="7"><strong>How are room assignments done? Will people with similar ratings be assigned to the same room?</strong></A><BR>

      Actually, it's the other way around. There are two divisions of rooms: those with ratings 1500 and above, and
      those will ratings below 1500. All rooms in a division will have roughly the same average room rating. <BR><A HREF="#top">[back to top]</A><BR><BR>--><a name="8"><strong>What if I am participating from behind a firewall? </strong></a><br>
The TopCoder applets use socket connections to connect to the TopCoder servers.
The TopCoder servers use TCP ports 5001-5010, so your firewall must allow outbound TCP
connections to topcoder.com on these ports. Your network administrator may be able to set
up the f irewall to allow for this communication. The applets will utilize the proxy settings
of the browser in which they run.  If you are denied access to port 5001 - 5010 and wish to
connect to the arena via HTTP tunneling you may select the Tunnel Option on the arena login screen.
Note, that selecting this option will reduce your perfomance.
      <br><a href="#top">[back to top]</a><br><br><a name="9"><strong>
            Occasionally, when navigating between rooms, I lose my cursor/focus, or stranger
            it may have two blinking cursors, but I can't type anything.
          </strong></a><br>
This problem is currently being examined.  The current temporary solution is to reload the applet.
      <br><a href="#top">[back to top]</a><br><br><a name="10"><strong>
            Why am I not able to copy and paste to my arena applet?
          </strong></a><br>
      This problem seems to be specific to JRE 1.3.1.
      Here is the fix assuming you are using JRE1.3.1:
      make sure to check for all java.policy files on your machine to catch the plugin JRE directory.
      If you are a Windows user, it should be something like
      c:\program files\javasoft\jre\1.3.1\lib\security.
      Add this permission to the java.policy file:<br>
      grant CodeBase "http://www.topcoder.com/-" {<br>
        permission java.awt.AWTPermission "accessClipboard";<br>
      };<br><br><a href="#top">[back to top]</a><br><br><a name="11"><strong>
            How do I emote something or whisper a private message to someone?
          </strong></a><br>
        To emote something, type a chat that includes /me. The /me will get replaced with your handle. To whisper to
        another user, type a chat in the format: /msg &lt;handle&gt; &lt;message&gt;. This will send a private message to another
        user, if they are logged in. However, for security purposes, bear in mind that all logged in admins will also
        receive that whisper.
      <br><a href="#top">[back to top]</a><br><br><a name="12"><strong>
            How does the leaderboard work?
          </strong></a><br>
        If the leaderboard ticker is running, that means the results for the current (or recently finished) contest are
        available through the applet. Simply click the "Go" button at the top of the applet window, and all the rooms
        will be displayed. An asterisk next to a room leader means that that room is particularly close. Double-clicking
        on a room leader will give you a "window" into that room, where you will be able to see what is taking place
        without actually being there.
      <br><a href="#top">[back to top]</a><br><br><a name="13"><strong>
            The small HTML window that holds the contest applet does not pop up in Mozilla 0.9.4.
          </strong></a><br>
This is caused by mozilla bug 101323 (http://bugzilla.mozilla.org), which is new as of 0.9.4. The effect of the bug is that you can't use Javascript Window.open to popup a new window with a background image. If you do, the browser becomes unable to open any new windows until you manually kill it.  A workaround is to pop up a new window on your own and then go to the URL "http://www.topcoder.com/?Task=arena"
      <br><a href="#top">[back to top]</a><br><br><a name="14"><strong>
            Is it O.K. for a coder to obfuscate their code before submitting it?
          </strong></a><br>
Any code submissions that contains obvious and deliberate code obfuscation will not be allowed.  Violations to this policy will be penalized by a loss of all points received for the obfuscated submission.  For the purpose of this policy TopCoder defines obfuscation as "An obvious and deliberate attempt to disguise the true behavior or nature of the code."  In ALL cases, TopCoder will make the final decision as to whether or not a code submission has been intentionally obfuscated.  We encourage any TopCoder competitor to notify us in the event that you feel that a code submission during a rated event violates this policy.
      <br><a href="#top">[back to top]</a><br><br><a name="15"><strong>
            If I choose to code a solution in C++, which implementation of string or vector do I use?
          </strong></a><br>
C++ solutions that use string refer to the C++ string.  Arguments or returns that indicate "vector" refer to the STL (Standard Template Library) implementation of vector.
      <br><a href="#top">[back to top]</a><br><br><a name="16"><strong>
            How can I view problem statements, submissions, or statistics for previous matches or tournament rounds?
          </strong></a><br>
After each match or tournament round TopCoder creates a practice room with the same problem set that was used.  Here you can view the problem statements and attempt to create solutions to the problems.  In addition, the detailed statistics for each match or tournament round are available to members on the web site.  If you login to the web site and navigate to "Statistics", you can view all problem statements, submissions, challenges, and system tests - including the expected and received values for each challenge and system test.
      <br><a href="#top">[back to top]</a><br><br><a name="17"><strong>
            Can I re-submit my code during the coding phase if I find an error?
          </strong></a><br>

Yes, TopCoder allows multiple submissions during the coding phase.<br>
Here are the rules:
<ul><li>You can submit the same problem as many times as you like.</li><li>For every submission past the first one you will incur a 10% penalty of the problem point total potential.<br>
Example:<br>
Coder A's 1st submission of the 500pt problem results in 400pts because they took approximately 15 minutes to solve it.<br>
Coder A's 2nd submission of the 500pt problem results in 280pts because they took an additional 8 minutes to solve (a total of 23) and we penalized 50pts (50 = 500*.10)</li><li>You can never go below 3/10 of the problems point total potential.<br>
Example:<br>
Coder B's 29th submission of the 500pt problem will result in 150pts<br>
Coder B's 55th submission of the 500pt problem will result in 150pts</li></ul>
**Some of the numbers in the examples above are rounded.

      <br><a href="#top">[back to top]</a><br><br>
      
                                </td>             
                            </tr>
                        </table>
                    
                        <p><br></p>

                    </td>
                </tr>
            </table>
        </td>
        
        <td width="" bgcolor="#001934" valign="top">
            <jsp:include page="../includes/right_resources.jsp" />
        </td>

    </tr>
</table>
</td></tr></table>

<jsp:include page="../includes/foot.jsp" />

</body>

</html>
