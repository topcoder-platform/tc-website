<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505516" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm98" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 98</span><br>June 19, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>
<br/>
<B>Coding Phase</B>
<p>
            There were only four rookie rooms in SRM 98.  In 
        Room 60, only <B>purpleurple</B>
            submitted solutions to all three problems, for a total of 954.81.  However, he was followed not too far behind by
            <B>Celeborn</B>, with 608.92 points from two submissions.
        </p>
<p>
            In 
        Room 61, <B>bchadwick</B> submitted three solutions for 1122.82.  <B>jewphoria</B>
            followed far behind with two submissions for 584.50 points.
        </p>
<p>
            
        Room 62 saw the most submissions, where six coders submitted solutions to all three problems.
            <B>liviutzu</B> led the pack with 1269.22 points.
        </p>
<p>
            
        Room 63 had nearly the same amount of submissions as 
        Room 62, with five coders submitting
            solutions to all three problems.  <B>ragnabot</B> was quickest, with 1188.44 points.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <B>purpleurple</B>
                    - 954.81</li>
    <li>
      <B>Celeborn</B>
                    - 608.92</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>bchadwick</B>
                    - 1122.82</li>
    <li>
      <B>jewphoria</B>
                    - 584.50</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 1269.22</li>
    <li>
      <B>jbwmubrncs</B>
                    - 1019.61</li>
    <li>
      <B>dodja</B>
                    - 1016.82</li>
    <li>
      <B>rreyelts</B>
                    - 985.91</li>
    <li>
      <B>flip</B>
                    - 953.12</li>
    <li>
      <B>Catalepsy</B>
                    - 941.47</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1188.44</li>
    <li>
      <B>sirishks</B>
                    - 1109.74</li>
    <li>
      <B>Unknown</B>
                    - 1021.71</li>
    <li>
      <B>ahertz</B>
                    - 996.32</li>
    <li>
      <B>aycock</B>
                    - 983.20</li>
  </ol>
</ul>
<B>Challenge Phase</B>
<p>
            In 
        Room 60, <B>purpleurple</B> and <B>Celeborn</B> each successfully challenged
            another coder.  <B>purpleurple</B> challenged <B>mistaceo</B>'s Level 1 submission, which neglected
            to handle the special case of being able to provide change to every customer.  <B>Celeborn</B> challenged
            <B>asva</B>'s Level 2 submission, which didn't quite cover all the possible ways in which the last four
            digits could constitute a vanity number.
        </p>
<p>
            In 
        Room 61, <B>jewphoria</B> took over the lead by taking out <B>bchadwick</B>'s
            Level 3 submission, which was very inefficient.  <B>bingo</B> also got a piece of <B>bchadwick</B>,
            taking out his Level 2 submission, which also failed to cover all the possible ways in which a vanity number
            could be constructed.   <B>bingo</B> also successfully challenged <B>vadim_li</B>'s Level 2
            submission with the same test case.
        </p>
<p>
            With so many submissions, one would expect many challenges to occur in 
        Room 62, and indeed this was the case.
            <B>dodja</B> managed to be challenged more than anyone else, accruing five defenses.  <B>rreyelts</B>
            and <B>Catalepsy</B> each challenged <B>dodja</B>'s Level 3 submission, but neither was successful.
            <B>liviutzu</B> then challenged <B>dodja</B>'s Level 2 submission, and succeeded.  This was followed
            by another two unsuccessful challenges, this time by <B>jbwmubrncs</B> and again by <B>rreyelts</B>,
            both against his Level 1 submission.
        </p>
<p>
            <B>liviutzu</B> was the next popular target, being challenged three times.  The first two challenges came
            from <B>Catalepsy</B> and <B>flip</B> against his Level 3 submission, and the third came from
            <B>Catalepsy</B> again, against his Level 2 submission.  None of these challenges succeeded.
        </p>
<p>
            As for other successful challenges, <B>rreyelts</B> successfully challenged <B>jbwmubrncs</B>'s
            Level 3 submission.  However, <B>rreyelts</B>'s own Level 3 submission was successfully challenged
            by <B>Catalepsy</B>.  <B>Catalepsy</B> did not escape unscathed, either, with his Level 1 submission
            being successfully challenged by <B>jbwmubrncs</B> (thus completing the cycle).  <B>Catalepsy</B>
            also succesfully challenged <B>flip</B>'s Level 3 submission.
            At the end of the Challenge Phase, <B>liviutzu</B> was the only coder in
        Room 62 to end up
            with a higher score than he had when the Challenge Phase began.
        </p>
<p>
            
        Room 63 was nearly as active as 
        Room 62 during the Challenge Phase.
            <B>sirishks</B> submitted six challenges, exactly half of which were successful (giving him
            no net gain in terms of offense).  <B>sirishks</B> succeeded against the Level 3 submissions
            of <B>ahertz</B>, <B>Unknown</B>, and <B>aycock</B>, with the same test case
            against all three.  <B>ahertz</B>'s solution overflowed (due to using 32-bit <code>int</code>s
            to hold intermediate results), while the other two solutions timed out.  <B>sirishks</B> 
            also tried a similar test case against <B>ragnabot</B> and <B>diango</B>'s Level 3 submissions, but was unsuccessful
            on both counts.
            <B>sirishks</B> also challenged <B>ragnabot</B>'s Level 2 submission unsucessfully.
        </p>
<p>
            <B>ragnabot</B>, on the other hand, was a little less active, yet more productive.
            <B>ragnabot</B>'s only challenge was against <B>sirishks</B>'s Level 3 submission,
            which really didn't do anything at all.  <B>ahertz</B> and <B>diango</B> were
            not as careful, however, each submitting an unsuccessful challenge.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <B>purpleurple</B>
                    - 1004.81</li>
    <li>
      <B>Celeborn</B>
                    - 658.92</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>jewphoria</B>
                    - 634.50</li>
    <li>
      <B>bingo</B>
                    - 568.96</li>
    <li>
      <B>MMDDay</B>
                    - 566.40</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 1319.22</li>
    <li>
      <B>dodja</B>
                    - 636.12</li>
    <li>
      <B>jbwmubrncs</B>
                    - 605.94</li>
    <li>
      <B>Catalepsy</B>
                    - 597.58</li>
    <li>
      <B>rreyelts</B>
                    - 550.93</li>
    <li>
      <B>flip</B>
                    - 436.09</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1238.44</li>
    <li>
      <B>diango</B>
                    - 624.69</li>
    <li>
      <B>aycock</B>
                    - 510.55</li>
    <li>
      <B>Unknown</B>
                    - 428.58</li>
    <li>
      <B>sirishks</B>
                    - 406.22</li>
  </ol>
</ul>
<B>System Test Phase</B>
<p>
            In 
        Room 60, the lead changed again, as <B>purpleurple</B>'s Level 2 and Level 3 submissions both failed.
            In 
        Room 62, <B>liviutzu</B> lost his Level 2 submission, but this hardly dented his commanding lead.
            <B>dodja</B> and <B>Catalepsy</B> each lost their Level 3 submissions, and <B>Catalepsy</B> lost his
            Level 2 submission as well.
        </p>
<B>Final Results</B>
<ul>
            Room 60:
            <ol>
    <li>
      <B>Celeborn</B>
                    - 658.92</li>
    <li>
      <B>purpleurple</B>
                    - 275.02</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <B>jewphoria</B>
                    - 634.50</li>
    <li>
      <B>bingo</B>
                    - 568.96</li>
    <li>
      <B>MMDDay</B>
                    - 566.40</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <B>liviutzu</B>
                    - 961.95</li>
    <li>
      <B>jbwmubrncs</B>
                    - 605.94</li>
    <li>
      <B>rreyelts</B>
                    - 550.93</li>
    <li>
      <B>flip</B>
                    - 436.09</li>
  </ol>
            Room 63:
            <ol>
    <li>
      <B>ragnabot</B>
                    - 1238.44</li>
    <li>
      <B>diango</B>
                    - 624.69</li>
    <li>
      <B>aycock</B>
                    - 510.55</li>
    <li>
      <B>zia</B>
                    - 467.00</li>
  </ol>
</ul>
<p>
                    <B>ragnabot</B> was the only rookie to submit all three problems correctly.  As a result,
                    he wins the rookie rooms by a rather large margin, and his new yellow rating of 1578 is well-earned.
                </p>

<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>

