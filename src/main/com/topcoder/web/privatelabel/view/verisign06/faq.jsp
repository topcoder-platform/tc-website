<%@ page contentType="text/html; charset=ISO-8859-1" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <link type="text/css" rel="stylesheet" href="/css/verisign06.css"/>
    <title>VeriSign Coder Challenge 2006, Powered by TopCoder</title>
    <jsp:include page="../script.jsp"/>
</head>

<body bgcolor="#FFF">

<table align="left" cellspacing="0" cellpadding="0" valign="top" width="760">
    <tr>
        <td width="115" height="60" align="left" valign="top" rowspan="2">
            <a href="http://www.verisign.com/index.html"><img border=0 src="/i/events/verisign06/www_vrsn_logo.gif" alt="VeriSign, Inc.&#0174;"></a>
        </td>
        <td width="645" height="20" align="right" valign="top" style="padding: 1px 0px 0px 0px;">
            <a href="http://www.verisign.com/index.html" class="VStop">US Home</a> &#160;&#160; | &#160;&#160;
            <a href="http://www.verisign.com/verisign-worldwide/index.html" class="VStop">Worldwide Sites</a> &#160;&#160;
            | &#160;&#160;
            <a href="http://www.verisign.com/site-map/index.html" class="VStop">Site Map</a>
        </td>
    </tr>
    <tr>
        <td width="645" height="40" align="left" valign="top">
            <img border=0 src="/i/events/verisign06/connectionline.gif" alt=""></td>
    </tr>

    <!-- Tab bar links-->
    <tr>
        <td colspan="2">
            <div align="left">
                <jsp:include page="links.jsp">
                    <jsp:param name="selectedTab" value="faq"/>
                </jsp:include>
            </div>
        </td>
    </tr>

    <!-- main content -->

    <tr>
        <td align="left" valign="top" colspan="2" style="padding: 0px 0px 0px 20px;">

            <span valign=top><jsp:include page="right.jsp"/></span><br/>

            <p class="blkBigHead">FAQ</p>

            <b>Is there a way to practice before the elimination rounds?</b><br/>
            You may use your handle and password to login to the competition arena. Within the arena there is a practice
            area that mimics the functionality of the real competition. Nothing that you do in the practice room will
            count against you in the competition.
            <br/><br/>
            <b>What resources can I use to help me during the competition?</b><br/>
            You may utilize any reference materials, including those found on the Internet. You may not collaborate with
            any other person.
            <br/><br/>
            <b>Can I use code that has already been written as a part of my solution?</b><br/>
            Only code that has been authored by you may be used in a code submission. No third-party source code may be
            used as a part of any code submission.
            <br/><br/>
            <b>I've submitted a solution for a problem, but the time has not run out. Can I submit again?</b><br/>
            Yes. However, if you've already submitted a problem and you choose to submit again, your score for that
            submission will be adjusted to account for the additional lapsed time since your last submission, as well as
            an additional penalty of 10% of the maximum point value for the problem.
            <br/><br/>
            <b>What is the Challenge Phase?</b><br/>
            The Challenge phase only takes place during Rounds 1 and 2. It does not take place during the Qualification
            Round.
            <br/><br/>
            During the Challenge Phase, you have the opportunity to view the source code submissions of the other
            competitors in your room. If you believe that any of the submissions are flawed, you may challenge the
            submission with a specific test case that you feel will result in that submission returning the wrong
            result. If your challenge is successful, and the submission returns the wrong result, you will be awarded 50
            points and the competitor will lose the points for the challenged submission. However, if your challenge is
            unsuccessful, and the submission returns the correct result for the test case, you will lose 25 points from
            your score.
            <br/><br/>
            Be sure to read the <A href="/pl/?&module=Static&d1=verisign06&d2=instructions">Instructions</A> page for a
            complete explanation.
            <br/><br/>
            <b>How will I know if I have advanced the next round of the VeriSign Coder Challenge?</b><br/>
            As soon as the Testing Phase has been completed, the advancers to the next round will be posted
            <A href="/pl/?&module=Static&d1=verisign06&d2=overview">here</A>. In addition, an email will be sent to all
            participants indicating whether or not each has advanced.
            <br/><br/>
            Questions not addressed here should be directed to
            <A href="verisign06@topcoder.com?subject=Question regarding VeriSign Coder Challenge 2006">verisign06@topcoder.com</A>
            <br/><br/>
            Good luck!
            <br/><br/>
            To find out more detailed information about the VeriSign&#153; Coder Challenge 2006, including a list of the
            prizes, please read the <a href="/pl/?&module=Static&d1=verisign06&d2=rules">Terms and Conditions</a>.
        </td>
    <tr>
    <tr><td colspan="2">&#160;</td></tr>
    <tr><td colspan="2">
        <jsp:include page="foot.jsp"/>
    </td></tr>
</table>
</body>
</html>