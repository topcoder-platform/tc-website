<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/news_events/public_news_left.xsl"/>
  <xsl:import href="../includes/public_right_col.xsl"/>
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<TITLE>2003 Collegiate Challenge Questionaire</TITLE>

<xsl:call-template name="CSS"/>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body bgcolor="#FFFFFF" topmargin="0" marginheight="0" leftmargin="0" marginwidth="0">

<!-- Top begins -->
<xsl:call-template name="Top"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC"><img src="/i/spacer.gif" height="1" width="170"/></td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="6"><img src="/i/spacer.gif" height="1" width="6"/></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">steelgray</xsl:with-param>
                <xsl:with-param name="image">invitation_gray</xsl:with-param>
                <xsl:with-param name="title">2003 TopCoder Collegiate Challenge</xsl:with-param>
            </xsl:call-template>

            <table border="0" cellspacing="0" cellpadding="0" width="100%" id="tccc_bkgd">
                <tr valign="top">
                    <td width="50%" align="right"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/tccc03_home.gif" alt="" width="110" height="90" border="0" /></a></td>
                    <td width="50%" align="left"><a href="/?&amp;t=tournaments&amp;c=tccc03_sched"><img src="/i/tournament/tccc03/sun03_home.gif" alt="Sun Microsystems" width="135" height="90" border="0" /></a></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr valign="top">
                    <td width="11"><img src="/i/clear.gif" alt="" width="11" height="1" border="0"/></td>
                    <td class="bodyText" width="100%"><img src="/i/clear.gif" alt="" width="240" height="1" border="0"/><br/>





<CENTER>2002 TopCoder Invitational<BR/>
<BR/>
Programmer Questionnaire</CENTER><BR/>
<BR/>
<BR/>
<BR/>
<B><U>Career Questions</U></B><BR/><BR/>
    <FORM name="questForm" method="POST" action="/">
        <INPUT TYPE="hidden" NAME="t" VALUE="affidavit"/>
        <INPUT TYPE="hidden" NAME="c" VALUE="2003_collegiate_submit_questions"/>
        <INPUT TYPE="hidden" NAME="q1" VALUE="What is your perception of the current job market for software developers/engineers?"/>
        &#160;&#160;1.&#160;&#160;
        What is your perception of the current job market for software developers/engineers? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a1"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;2.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q2" VALUE="What is your perception of a reasonable starting salary for a strong developer/engineer?"/>
        What is your perception of a reasonable starting salary for a strong developer/engineer? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a2"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;3.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q3" VALUE="What types of companies are you most interested in working for (e.g., size, industry)? Why?"/>
        What types of companies are you most interested in working for (e.g., size, industry)? Why? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a3"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;4.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q4" VALUE="What types of jobs (functional) are you looking for (e.g., development, networking, support, QA, testing)?"/>
        What types of jobs (functional) are you looking for (e.g., development, networking, support, QA, testing)? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a4"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;5.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q5" VALUE="What is most important to you in a job (e.g., reward, recognition, benefits, salary)?"/>
        What is most important to you in a job (e.g., reward, recognition, benefits, salary)? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a5"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;6.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q6" VALUE="Have you ever been asked to participate in a skills assessment test as part of a job interview?  If so, what did it entail?"/>
        Have you ever been asked to participate in a skills assessment test as part of a job interview?  If so, what did it entail? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a6"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;7.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q7" VALUE="If asked to participate in a TopCoder-style skills assessment as part of an interview process, would you be comfortable that the results would be a good indicator of your actual programming ability? Why or why not?"/>
        If asked to participate in a TopCoder-style skills assessment as part of an interview process, would you be comfortable that the results would be a good indicator of your actual programming ability? Why or why not? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a7"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;8.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q8" VALUE="Please provide feedback on the current TCES offerings and/or any new ideas on how TCES can be most effective in helping TopCoder members secure jobs."/>
        Please provide feedback on the current TCES offerings and/or any new ideas on how TCES can be most effective in helping TopCoder members secure jobs. <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a8"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;9.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q9" VALUE="If you could use your IT abilities to work for any company in the world, which would it be and why?"/>
        If you could use your IT abilities to work for any company in the world, which would it be and why? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a9"></TEXTAREA>
        <BR/><BR/><BR/>


        <B><U>Technology Questions</U></B><BR/><BR/>

        &#160;&#160;1.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q10" VALUE="Describe the most challenging system you have played a role in developing."/>
        Describe the most challenging system you have played a role in developing. <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a10"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;2.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q11" VALUE="Which technology company do you most admire?  For what reasons?"/>
        Which technology company do you most admire?  For what reasons? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a11"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;3.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q12" VALUE="What do you think will be the next 'hot' technology?"/>
        What do you think will be the next "hot" technology? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a12"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;4.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q13" VALUE="What is your preferred operating system and favorite IDE and programming language?"/>
        What is your preferred operating system and favorite IDE and programming language? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a13"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;5.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q14" VALUE="What are your top three sources for information on technology and programming?"/>
        What are your top three sources for information on technology and programming? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a14"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;6.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q15" VALUE="How can TopCoder improve its competition environment?"/>
        How can TopCoder improve its competition environment? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a15"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;7.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q16" VALUE="What would be the single best way for TopCoder to recruit more members?"/>
        What would be the single best way for TopCoder to recruit more members? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a16"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;8.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q17" VALUE="To what degree has TopCoder improved your programming skills, if at all?"/>
        To what degree has TopCoder improved your programming skills, if at all? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a17"></TEXTAREA>
        <BR/><BR/><BR/>


        <B><U>Software Development</U></B><BR/><BR/>

        &#160;&#160;1.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q18" VALUE="Have you participated in TopCoder Software component projects in a design, development or reviewer role?"/>
        Have you participated in TopCoder Software component projects in a design, development or reviewer role? <BR/>
        &#160;&#160;&#160;&#160;A.    If so, what did you think of the experience?<BR/>
        &#160;&#160;&#160;&#160;B.    If not, what would entice you to participate? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a18"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;2.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q19" VALUE="Would you be interested in participating in TopCoder Software application projects?"/>
        Would you be interested in participating in TopCoder Software application projects? Why? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a19"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;3.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q20" VALUE="List 2 reusable software components you have developed on your own."/>
        List 2 reusable software components you have developed on your own. <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a20"></TEXTAREA>
        <BR/><BR/><BR/>


        <B><U>Personal Interests</U></B><BR/><BR/>

        &#160;&#160;1.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q21" VALUE="How old were you when you wrote your first piece of code? What programming language was it in? What did you write?"/>
        How old were you when you wrote your first piece of code? What programming language was it in? What did you write? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a21"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;2.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q22" VALUE="How did you create your handle?"/>
        How did you create your handle? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a22"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;3.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q23" VALUE="With regard to technology and academics, please list any awards or honors you have received."/>
        With regard to technology and academics, please list any awards or honors you have received. <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a23"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;4.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q24" VALUE="What is your favorite movie?"/>
        What is your favorite movie? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a24"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;5.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q25" VALUE="What is your favorite hobby?"/>
        What is your favorite hobby? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a25"></TEXTAREA>
        <BR/><BR/><BR/>

        &#160;&#160;6.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q26" VALUE="Tell me something about yourself that would surprise others."/>
        Tell me something about yourself that would surprise others. <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a26"></TEXTAREA>
        <BR/><BR/><BR/>

        <B><U>Charity Donations</U></B><BR/><BR/>

        &#160;&#160;1.&#160;&#160;
        <INPUT TYPE="hidden" NAME="q27" VALUE="If you are from a non-eligible country, what charity would you like your winnings to go to? "/>
        If you are from a non-eligible country, what charity would you like your winnings to go to? <BR/>
        <TEXTAREA COLS="80" ROWS="5" WRAP="off" NAME="a27"></TEXTAREA>
        <BR/>

        <p>
            Click <A HREF="/?&amp;t=support&amp;c=charities">here</A> for a list of available charities.
            If you would like to suggest your own, add it here.  It will be up to TopCoder's sole discretion to
            approve any new charities.
        </p>

        <input type="submit" name="submit" value=" Submit "/>
    </FORM>

                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
                <tr><td colspan="4" valign="top" bgcolor="#FFFFFF" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>
            </table>
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170"><img src="/i/clear.gif" width="170" height="1" border="0"/><br/>
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="6"><img src="/i/clear.gif" width="6" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<!-- Footer begins -->
<xsl:call-template name="Foot"/>
<!-- Footer ends -->

</body>
</html>

  </xsl:template>
</xsl:stylesheet>
