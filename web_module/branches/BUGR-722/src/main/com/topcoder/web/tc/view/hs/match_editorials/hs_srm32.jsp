<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10656&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506248" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 32</span><br>Monday, February 12, 2007
<br><br>

<h2>Match summary</h2>

    HS SRM 32 may have been a departure from other HS SRMs, in that the problems 
    didn't require any specific knowledge of algorithms. Ignoring the complexity of 
    the 500 and the 1000, it seemed possible for anyone to solve them. However, by 
    the end of the match, the number of successful submissions were less than I had 
    hoped for, which I attribute to the complexity of the problems. Looking 
    back, I can see that the more code you have to write, the more potential there 
    is for error, and that is probably what happened. <br />
    <br />
    Regardless of how 
    complex the problems may have been, two high school students from China did manage to solve them all -- and in less than 40 minutes at that.
    <tc-webtag:handle coderId="22375930" context="hs_algorithm" />    finished in first place, with 
    <tc-webtag:handle coderId="20812309" context="hs_algorithm" /> in second.
    <tc-webtag:handle coderId="20812309" context="hs_algorithm" />
    was in the lead after the coding phase, but with the help of the challenge 
    phase
    <tc-webtag:handle coderId="22375930" context="hs_algorithm" /> took over the lead.
    <tc-webtag:handle coderId="20331303" context="hs_algorithm" />, who ended up in third place,
    solved all three as well. It looked like
    <tc-webtag:handle coderId="20093875" context="hs_algorithm" />
    would also, but his medium failed system tests.

<H1>
    The Problems
</H1>
</p> <font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=7237&amp;rd=10656" name="7237">
            BoulderRace</a></b> </font><A href="Javascript:openProblemRating(7237)">
    <img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506248" CLASS="statText">
    <img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level One: <blockquote><table cellspacing="2">
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                250
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Submission Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                145 / 162 (89.51%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Success Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                134 / 145 (92.41%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>High Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                <b>snomak</b> for 245.52 points (3 mins 51 secs)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Average Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                211.58 (for 134 correct submissions)
            </td>
        </tr>
    </table>
</blockquote>

    This problem asks the the coder to compute the winner of a race being run by 
    boulders. Each boulder must travel the specified distance. The first to reach 
    the bottom of the mountain is the winner, and ties are broken by selecting the 
    boulder with the lower index.<br />
    <br />
    This problem was simple simulation. You can keep the <i>distance to go</i> or 
    the overall progress for each boulder. In my code, I choose the former. If you 
    update each boulder’s progress starting with the first and continuing through 
    to the last you can return immediately when a boulder’s <i>distance to go</i> reaches 
    zero or less. My code is below:
<pre>
#include &lt;iostream>
#include &lt;string>
#include &lt;vector>

using namespace std;

class BoulderRace
{
  public:
    int winner(vector&lt;string> boulders, int distance)
    {
      int i    = 0;
      int time = 0;
      vector&lt;int> distancesToGo;

      //  Keep going until at least one boulder reaches the base of the mountain.
      int time = 0;
      while (true)
      {
        //  Update the progress for each boulder for the current time unit.
        for (i = 0; i &lt; boulders.size(); i++)
        {
          //  If the boulder's distance to go has not been set.
          if (time == 0)
            distancesToGo.push_back(distance);
          //  Update the progress for the current boulder given the current time unit.
          if ((distancesToGo[i] -= (int) (boulders[i][time % boulders[i].length()] - '0')) <= 0)
            return i;  //  The boulder reached the bottom.
        }
        time++;
      }
    }
};
</pre>

<font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=7428&amp;rd=10656" name="7428">
            SpecialDay</a></b> </font><A href="Javascript:openProblemRating(7428)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506248" CLASS="statText">
    <img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Two: <blockquote><table cellspacing="2">
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                500
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Submission Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                86 / 162 (53.09%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Success Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                57 / 86 (66.28%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>High Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                <b>ahyangyi</b> for 459.81 points (8 mins 33 secs)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Average Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                290.20 (for 57 correct submissions)
            </td>
        </tr>
    </table>
</blockquote>

    The inspiration for this problem came as I remembered my birthday falling on 
    Thanksgiving one year. I decided to write a program to calculate 
    the number of times this happened. Only later did I realize my birthday has 
    never fallen on Thanksgiving and gets only as close as one day away. Never the 
    less, I thought solving this kind of problem was interesting.<br />
    <br />
    Ultimately, solving this problem is again simple simulation. There are a few 
    more variables than there are in the easy, but that is only natural given this was the 
    medium. In my code, I start with January 1, 2000 and compute through to 
    December 31, 2100. Every time the <b>month</b>, <b>day</b>, <b>weekday</b> and <b>which</b>
    variables matched, the counter is incremented. As
    <tc-webtag:handle coderId="10428762" context="hs_algorithm" />
    pointed out <a href="http://forums.topcoder.com/?module=Thread&threadID=527167&start=0&mc=8">
        here</a>, you could use date libraries; a nice benefit to this is that, if 
    implemented correctly, your code should be less error prone. My code is below:
        <pre>
#include &lt;iostream>
#include &lt;string>
#include &lt;vector>

using namespace std;

string weekDays[] =
{
  "SUNDAY", "MONDAY", "TUESDAY", "WEDNESDAY", "THURSDAY", "FRIDAY", "SATURDAY"
};
string months[] =
{
  "JANUARY", "FEBRUARY", "MARCH", "APRIL", "MAY", "JUNE", "JULY", 
  "AUGUST", "SEPTEMBER", "OCTOBER", "NOVEMBER", "DECEMBER"
};

class SpecialDay
{
  public:
    int howMany(string weekday, int which, string month, int day)
    {
      int currentDay     = 0;
      int currentMonth   = 0;
      int currentWeekday = 6;
      int currentYear    = 0;
      int daysInMonth    = 0;
      int returnCode     = 0;

      for (currentYear = 2000; currentYear &lt;= 2100; currentYear++)
      {
        for (currentMonth = 0; currentMonth &lt; 12; currentMonth++)
        {
          for (currentDay = 1;
            currentDay &lt;= (daysInMonth = DaysInMonth(months[currentMonth], currentYear));
            currentDay++, (currentWeekday = (currentWeekday + 1) % 7))
          {
            //  Is this day a match?
            if (months[currentMonth] == month && 
              weekday == weekDays[currentWeekday] &&
              which == (currentDay / 7) + (currentDay % 7 ? 1 : 0) &&
              currentDay == day)
            {
              returnCode++;
            }
          }
        }
      }
      
      return returnCode;
    }
        
    int DaysInMonth(string month, int year)
    {
      int days[] =
      {
        31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31
      };
      int i = 0;
            
      for (i = 0; i &lt; 12; i++)
        if (month == months[i])
          break;            
        return days[i] + (IsLeapYear(month, year) == true ? 1 : 0);
    }
        
    bool IsLeapYear(string month, int year)
    {
      if (month != "FEBRUARY")
        return false;
      if (year % 4)
        return false;
      if (year % 100 == 0 && year % 400)
        return false;
      return true;
    }
};
</pre>

<font size="+2"><b><a href="/stat?c=problem_statement&amp;pm=6868&amp;rd=10656" name="6868">
            SuperPasture</a></b> </font><A href="Javascript:openProblemRating(6868)">
    <img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> <A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506248" CLASS="statText">
    <img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br>
Used as: Division One - Level Three: <blockquote><table cellspacing="2">
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Value</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                1000
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Submission Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                12 / 162 (7.41%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Success Rate</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                4 / 12 (33.33%)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>High Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                <b>ahyangyi</b> for 699.97 points (20 mins 33 secs)
            </td>
        </tr>
        <tr>
            <td class="bodyText" style="background: #eee;">
                <b>Average Score</b>
            </td>
            <td class="bodyText" style="background: #eee;">
                579.18 (for 4 correct submissions)
            </td>
        </tr>
    </table>
</blockquote>

    About 10 years ago, I worked for my grandparents on their ranch. They owned a number of pastures spread out all over the county. If an adjacent pasture or small 
    stretch of land became available my grandmother would buy it. My memory of that 
    inspired this problem.<br />
    <br />
    I saw this as a brute force problem and the constraints were low enough that timing out wasn't an issue. My code simply looped through the given pastures 
    building super pastures. If the goodness of the super pasture warranted further 
    examination, my code tested each pasture in the super pasture to see if 
    removing it was valid. If removing the pasture was valid and it was the best 
    choice so far, the pasture was cached. My code is below:
    <pre>
#include &lt;iostream>
#include &lt;string>
#include &lt;vector>

using namespace std;

typedef struct
{
  int area;
  int bottom;
  int index;
  int left;
  int right;
  int top;
} Pasture;

class SuperPasture
{
  public:
    int whichOne(vector &lt; string > pastures)
    {
      int                goodness      = 0;
      int                i             = 0;
      int                j             = 0;
      int                worstGoodness = -1;
      Pasture            returnCode    = {-1, -1, -1, -1, -1, -1};
      vector &lt; Pasture > parsedPastures;
      vector &lt; Pasture > superPasture;
      vector &lt; Pasture > tempSource;
      vector &lt; Pasture > tempSuperPasture;            


      ParseInput(pastures, parsedPastures);

      //  Find all the super pastures.
      while (parsedPastures.size())
      {
        superPasture.erase(superPasture.begin(), superPasture.end());
        superPasture.push_back(parsedPastures[0]);
        parsedPastures.erase(parsedPastures.begin());
        GetSuperPasture(parsedPastures, superPasture);
        goodness = GetGoodness(superPasture);

        //  Process each super pasture as it is found.
        if (goodness >= worstGoodness)
        {
          //  Try removing each pasture from the super pasture..
          for (i = 0; i &lt; superPasture.size(); i++)
          {
            //  Build temporary super pastures that can be mangled.
            tempSource.erase(tempSource.begin(), tempSource.end());
            tempSuperPasture.erase(tempSuperPasture.begin(), tempSuperPasture.end());
            for (j = 0; j &lt; superPasture.size(); j++)
              tempSource.push_back(superPasture[j]);

            //  Remove the pasture we are testing.
            tempSource.erase(tempSource.begin() + i);

            //  Handle the special case of the 1 pasture super pasture.
            if (tempSource.size() == 0)
            {
              if (returnCode.index == -1 || returnCode.area > superPasture[0].area)
                returnCode = superPasture[0];
              continue;
            }
            tempSuperPasture.push_back(tempSource[0]);
            tempSource.erase(tempSource.begin());
            GetSuperPasture(tempSource, tempSuperPasture);
            //  If removing the current pasture broke apart the super pasture.
            if (tempSource.size() > 0)
              continue;

            //  Is this the best pasture so far?
            if (returnCode.index == -1 || worstGoodness &lt; goodness || returnCode.area > superPasture[i].area ||
              (returnCode.area == superPasture[i].area && returnCode.index > superPasture[i].index))
            {
              worstGoodness = goodness;
              returnCode    = superPasture[i];
            }
          }

          worstGoodness = goodness;                    
        }
      }


      return returnCode.index;
    }

    int GetGoodness(vector &lt; Pasture > superPasture)
    {
      int bottom     = superPasture[0].bottom;
      int i          = 0;
      int left       = superPasture[0].left;
      int right      = superPasture[0].right;
      int sumOfAreas = superPasture[0].area;
      int top        = superPasture[0].top;

      for (i = 1; i &lt; superPasture.size(); i++)
      {
        if (superPasture[i].left &lt; left)
          left = superPasture[i].left;
        if (superPasture[i].right > right)
          right = superPasture[i].right;
        if (superPasture[i].top &lt; top)
          top = superPasture[i].top;
        if (superPasture[i].bottom > bottom)
          bottom = superPasture[i].bottom;

        sumOfAreas += superPasture[i].area;
      }

      return ((right - left) * (bottom - top)) - sumOfAreas;
    }

    void GetSuperPasture(vector &lt; Pasture > &source, vector &lt; Pasture > &destination)
    {
      bool added = true;
      int  i     = 0;
      int  j     = 0;

      while (source.size() && added)
      {
        added = false;
        for (i = 0; i &lt; source.size(); i++)
        {
          for (j = 0; j &lt; destination.size(); j++)
          {
            if (source[i].left == destination[j].right ||
              source[i].right == destination[j].left)
            {
              if (source[i].top >= destination[j].bottom || source[i].bottom &lt;= destination[j].top)
                continue;
              destination.push_back(source[i]);
              source.erase(source.begin() + i);
              added = true;
              break;
            }
            if (source[i].top == destination[j].bottom ||
              source[i].bottom == destination[j].top)
            {
              if (source[i].left >= destination[j].right || source[i].right &lt;= destination[j].left)
                continue;
              destination.push_back(source[i]);
              source.erase(source.begin() + i);
              added = true;
              break;
            }
          }

          if (added)
            break;
        }
      }
    }

    void ParseInput(vector &lt; string > &pastures, vector &lt; Pasture > &parsedPastures)
    {
      int i = 0;

      for (i = 0; i &lt; pastures.size(); i++)
      {
        char     szPasture[20];
        char    *pToken          = NULL;
        int      coordinateCount = 0;
        Pasture  pasture;

        strcpy(szPasture, pastures[i].c_str());
        pToken = strtok(szPasture, " ");
        for (coordinateCount = 0; pToken; coordinateCount++)
        {
          if (coordinateCount == 0)
            pasture.left = atoi(pToken);
          else if (coordinateCount == 1)
            pasture.right = atoi(pToken);
          else if (coordinateCount == 2)
            pasture.top = atoi(pToken);
          else if (coordinateCount == 3)
            pasture.bottom = atoi(pToken);

          pToken = strtok(NULL, " ");
        }        
        pasture.area  = (pasture.right - pasture.left) * (pasture.bottom - pasture.top);
        pasture.index = i;
        parsedPastures.push_back(pasture);
      }        
    }
};
</pre>

 

<%--
<div class="authorPhoto">
    <img src="/i/m/soul-net_big.jpg" alt="Author" />
</div>
--%>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="343655" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
