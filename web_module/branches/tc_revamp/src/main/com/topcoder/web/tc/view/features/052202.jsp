<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder Feature Articles</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_main"/>
    </jsp:include>
    <script language="JavaScript">
        function changeImage(image, newImage) {
            document[image].src = newImage;
            return;
        }
        function open_window(url) {
            mywin =
            window.open(url, "win", 'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
        }
    </script>
</head>

<body>

<jsp:include page="/top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tr valign="top">
<!-- Left Column Begins-->
<td width="180">
    <jsp:include page="/includes/global_left.jsp">
        <jsp:param name="node" value="features"/>
    </jsp:include>
</td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

    <jsp:include page="/page_title.jsp">
        <jsp:param name="image" value="features"/>
        <jsp:param name="title" value="&#160;"/>
    </jsp:include>

    <I>Case studies and the TopCoder view point</I><BR/>Wednesday, May 22, 2002<BR/>
</P>

<P>
    It's the challenge phase. At first glance the code you're looking at
    seems horribly flawed. A crucial if-statement is missing at the
    beginning of a loop, making this coder's solution useless. "How
    could they have made such an obvious mistake," you think, as you
    run through the code one final time to make sure you didn't miss
    anything. It's then that you see it: a slider at the bottom of the
    viewing window indicating that there is more to this code than meets
    the eye. As you move the slider to the right, you see the crucial
    if-statement, indented past the edge of the viewing window.
</P>

<P>
    Was this an act of deception, intended to trick coders into making
    unsuccessful challenges, or was it an innocent mistake by a coder having
    trouble indenting correctly? The answer to this question determines whether
    or not cases like these are punishable under TopCoder's obfuscation rule.
</P>

<P><B>What is obfuscation?</B></P>

<P>
    Webster's Revised Unabridged Dictionary defines obfuscation as "the act of
    darkening or bewildering; the state of being darkened." On their
    <A HREF="/tc?module=Static&amp;d1=help&amp;d2=ratedEvent#codeobfuscation" CLASS="bodyGeneric">FAQ page</A>, TopCoder
    defines obfuscation as "an obvious and deliberate attempt to disguise the
    true behavior or nature of the code."
</P>

<P>
    According to <B>dok</B>, a TopCoder administrator, the obfuscation rule was created
    in response to the Level Two submission of <A HREF="/tc?module=MemberProfile&amp;cr=112438" CLASS="bodyGeneric">stevevai</A>
    in the Semifinals of the 2001 Invitational
    (<A HREF="/stat?c=problem_solution&amp;rm=56&amp;rd=56&amp;pm=205&amp;cr=112438" CLASS="bodyGeneric">members click
    here to view problem statement</A>).
    <B>dok</B> explains the obfuscation of <B>stevevai</B>:
    "If you'll notice, there is a variable declared at the bottom, 'int l=0',
    and at the top there is a comparison, 'if (s.length() == l)'. Well that
    looks a lot like 'if (length == 1)'." This 'hidden' zero fooled
    <A HREF="/tc?module=MemberProfile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>,
    causing him to lose 50 points on an unsuccessful challenge of the code of <B>stevevai</B>.
    The obfuscation rule was set up to prevent coders from writing intentionally confusing
    code to bait others into such challenges.
</P>

<P>
    "Probably every second contest someone will suggest that another person obfuscated
    their code," <B>dok</B> said. Despite frequent accusations, though, no coder has yet lost
    points for their code due to the obfuscation rule. "People accuse obfuscation because
    others don't indent enough, or indent strangely, or single space indent," <B>dok</B> says.
    "That's just not enough for us to go on to make any kind of ruling. We can't just
    drop points because a person has poor coding habits."
</P>

<P><B>The case of fbplayr78</B></P>

<P>
    "Bad indentation or oddly placed brackets doesn't seem like it enough to call it
    obfuscation," agrees <A HREF="/tc?module=MemberProfile&amp;cr=155375" CLASS="bodyGeneric">fbplayr78</A> ,
    a coder who has direct experience with obfuscation charges. <B>fbplayr78</B> was accused for
    a Level Two submission in Single Round Match 86 that contained a 'hidden' if-statement like the one described in
    the first paragraph
    (<A HREF="/stat?c=problem_solution&amp;rm=5315&amp;rd=4150&amp;pm=708&amp;cr=155375" CLASS="bodyGeneric">members
    click here to view problem statement</A>).
    <A HREF="/tc?module=MemberProfile&amp;cr=280238" CLASS="bodyGeneric">Darth Vader</A>,
    who was in the same room as <B>fbplayr78</B> in SRM 86, reported
    the code to the administrators after viewing it in the challenge round. The charge led to a
    two-hour-long argument in the TopCoder lobby on what obfuscation is and how the issue of coder
    intent can be fairly judged.
</P>

<P>
    <B>fbplayr78</B> maintains that the oddly placed if-statement was "absolutely not"
    intentional, and that he had no idea that there was anything odd or confusing about
    the code when he submitted it. "The only thing that I can think of is that I accidentally
    hit backspace or delete," said <B>fbplayr78</B>, when asked how the if statement got where it was.
    "I didn't even realize that I had done it until people started arguing about it."
</P>

<P>
    <A HREF="/tc?module=MemberProfile&amp;cr=267455" CLASS="bodyGeneric">cocoapi</A>,
    who was also in the room with <B>fbplayr78</B> in SRM 86, is skeptical of this explanation.
    "It does not seem really easy to make a mistake like that and not notice it. Usually when you
    click delete, it takes that line to the beginning of the previous line, not to the end of it
    and clearly off the page." Despite his skepticism, though, <B>cocoapi</B> "doesn't think [the code]
    was that clear to really do too much about."
</P>

<P><B>The question of intent</B></P>

<P>
    The issue of coder intent is crucial for determining whether or not a coder is guilty
    of obfuscation. Only "obvious or deliberate" attempts to mislead are punishable by "a
    loss of all points received for the obfuscated submission," according the TopCoder FAQ page.
    A coder that is unfairly accused can argue his case, but in the end "TopCoder will make the final
    decision as to whether or not a code submission has been intentionally obfuscated."
</P>

<P>
    "I can remember once talking to a coder with some strange code," said <B>dok</B>, when asked about how
    he goes about determining coder intent. "It was C++ and he had no return statement, but it turned
    out that C++ would return the last variable he set within his method, which in this case turned out
    to be the value that he would have returned. So, his code returned all the right answers, but to a
    challenger seemed very wrong. It turned out it was just a mistake that he got away with." If an
    obfuscation case is still unclear after talking with the coder, the administrators sometimes "look
    at old code to see a pattern in coding style," according to <B>dok</B>.
</P>

<P>
    Sometimes, careful analysis of the accused code can garner clues as to whether the obfuscation
    was intentional or not. "For example," <B>fbplayr78</B> said, "in my code, the braces were indented
    as if they were to be used for my if-statement," a fact that seems to support the argument
    that the statement was hidden unintentionally.
</P>

<P>
    According to <B>dok</B>, the TopCoder administrators "decided that [the code of <B>fbplayr78</B>] could
    have been a copy/paste issue or a tab issue, etc., basically, that it was not absolutely clear."
    Because no one challenged the code of <B>fbplayr78</B> and the submission failed system testing,
    this official ruling didn't affect the results of the match.
</P>

<P>
    Despite the inconvenience that this obfuscation case has caused, <B>fbplayr78</B> doesn't think any
    less of TopCoder for having such a rule. On the contrary, he thinks "any organization that
    can get its members to care that much about a small mistake deserves our respect."
</P>

<P><B>What you can do</B></P>

<P>
    TopCoder makes it a point on their FAQ page to "encourage any TopCoder competitor to notify
    us in the event that you feel that a code submission during a rated event
    violates [the obfuscation] policy." This doesn't mean you should automatically report any
    code you find confusing, though. Remember, simply using bad formatting or odd indentation is
    not enough to constitute obfuscation; the code has to be intentionally set up to hide the
    true nature of the code. Setting the code viewer to "pretty" on your room's summary menu
    can usually help in cases where the code is simply badly written.
</P>

<P>
    The best way to avoid being accused of obfuscation yourself, according to <B>dok</B>, is to simply
    "write clearer code. Proper coding habits were probably explained to you in school, and
    every coding book you read is probably full of readable code. In a professional environment,
    there is no reason to write unreadable code." Or, as <B>fbplayr78</B> puts it, just "be very, very careful."
</P>


<IMG SRC="/i/m/KaiEl_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;KaiEl<BR/>

<DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=264761" CLASS="smallText">Author
    Profile</A></DIV><BR CLEAR="all"/>


<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a weekly feature?</A></P>


<br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
<td width="170">
    <jsp:include page="/public_right.jsp">
        <jsp:param name="level1" value="default"/>
    </jsp:include>
</td>
<!-- Right Column Ends -->

<!-- Gutter -->
<td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
</tr>
</table>

<jsp:include page="/foot.jsp"/>

</body>

</html>
