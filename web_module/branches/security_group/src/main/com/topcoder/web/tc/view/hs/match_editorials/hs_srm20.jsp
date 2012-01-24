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
    <A href="/tc?module=HSRoundOverview&rd=10072&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="506042" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS SRM 20</span><br>Monday, November 20, 2006
<br><br>

<h2>Match summary</h2> 

 
By now, HS SRMs are well underway, with incredibly gifted high schoolers from around the world competing
regularly, and HS SRM 20 was no exception.  The easy and medium were pretty easy but, despite scaling
down the input on the hard, it remained fairly difficult.  Still,
<tc-webtag:handle coderId="22285847" context="hs_algorithm"/>,
<tc-webtag:handle coderId="20812309" context="hs_algorithm"/>, 
<tc-webtag:handle coderId="20093875" context="hs_algorithm"/>, 
<tc-webtag:handle coderId="22628327" context="hs_algorithm"/>, 
<tc-webtag:handle coderId="21507690" context="hs_algorithm"/> and
<tc-webtag:handle coderId="21290434" context="hs_algorithm"/> successfully submitted all 3 problems, so
hats off to them.

<H1>The Problems</H1>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6873&amp;rd=10072" name="6873">Surname</a></b> 
</font> 

<A href="Javascript:openProblemRating(6873)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506042" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 
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

      106 / 111 (95.50%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      102 / 106 (96.23%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>msg555</b> for 249.35 points (1 mins 27 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      233.40 (for 102 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem asks for the index of the surname with the highest score.  The score of a surname is the 
ASCII value of all its characters summed.  My code is below:
<pre>
    private int getScore(String s)
    {
        int i = 0;
        int r = 0;
        for (i = 0; i < s.length(); i++)
            r += s.charAt(i);
        return r;
    }

    public int bestSurname(String surnames[])
    {
        int i = 0;
        int r = 0;
        for (i = 1; i < surnames.length; i++)
            if (getScore(surnames[r]) < getScore(surnames[i]))
                r = i;
        return r;
    }
</pre>

 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=6859&amp;rd=10072" name="6859">Postnet</a></b> 
</font> 

<A href="Javascript:openProblemRating(6859)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506042" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      102 / 111 (91.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      84 / 102 (82.35%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>msg555</b> for 486.65 points (4 mins 43 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      392.98 (for 84 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


Years ago I wrote code for highspeed barcode sort machines, and that was the inspiration for this problem.
You are given a valid postal zip code of 5, 9 or 11 digits and asked to return its Postnet barcode.  You must
realize that each Postnet barcode begins and ends with a high bar and that each barcode has a checksum digit
appended to the end of the zip code digits.  The bars were given for the numbers [0, 9] so solving this
problem was reduced to following the directions.  My code is shown below:

<pre>
    public String barcode(String zipCode)
    {
        int    index           = 0;
        int    sum             = 0;
	String barcodeDigits[] =
	{
            "HHLLL", "LLLHH", "LLHLH", "LLHHL", "LHLLH",
            "LHLHL", "LHHLL", "HLLLH", "HLLHL", "HLHLL"
	};
        String returnCode      = "H";

        for (index = 0; index < zipCode.length(); index++)
        {
            returnCode += barcodeDigits[zipCode.charAt(index) - '0'];
            sum        += zipCode.charAt(index) - '0';
        }
	
        returnCode += barcodeDigits[(10 - sum % 10)% 10];
        returnCode += "H";


        return returnCode;
    }
</pre>



<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6867&amp;rd=10072" name="6867">Touchdown</a></b> 

</font> 

<A href="Javascript:openProblemRating(6867)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=506042" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br /> 

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

      42 / 111 (37.84%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      7 / 42 (16.67%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Loner</b> for 684.02 points (21 mins 31 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      575.73 (for 7 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 

This problem asked you to take on the role of a coach in the final minutes of an American football game in which
you must make a touchdown to win the game.  The key things to realize in this problem are that you must be able
to move the football [yardsToGo, yardsToGo + 10] yards to make a touchdown;  if this is not possible, it is
not possible to make a touchdown.  You also have to realize that you have a set of 4 downs, during which you must continue to get first downs where needed to keep
the drive alive.  Its easy to see that any number of
plays that are 3 yards or more will continue to get 1st downs (a fresh set of 4 downs).  The only thing that
makes this problem difficult is when you must carefully select 1 and 2 yard plays in order to make a
touchdown.  Example: {4, 3, 2, 1, 1, 1, 2, 2, 3, 3, 4, 4, 3, 2, 4}, it is easy to see that to continue making
1st downs, one should choose subsets of these 4 plays {1, 2, 3, 4}.<br /> 
<br />

I won't post my code because there were better shorter solutions to this problem, but I will provide an
understanding of how I solved it.  My solution used dynamic programming with a 7 dimensional array as follows:
[yardsToGo + 11][maximumDowns + 1][numberOf1YardPlays + 1][numberOf2YardPlays + 1][numberOf3YardPlays + 1][numberOf4YardPlays + 1][2].
<br /> <br />
I then counted the total number of 1, 2, 3 and 4 yard plays.  I sorted the list of plays in descending order
  and worked from biggest play to smallest.  I worked from the maximum number of yards to 0 and added each play
  where others had left off; that is, the first time through, I simply added the first play to the table.
  When adding a play to the table, I also added every allowable combination of 1, 2, 3 and 4 yard plays to it.
  In hindsight, this approach seems kind of ugly, but it runs 20 plays in a 3rd of a second and I believe it
  could run 40 plays in under 2 seconds.  To see a nice DP solution that uses recursion and memoization check
  out <tc-webtag:handle coderId="21911760" context="hs_algorithm"/>'s solution below:<br />
<pre>
#define INF 1000000000
#define FILL(x,y) memset(&x,y,sizeof(x))
#define FORVECTOR(i,v) for (int i=0;i&lt;(v).size();++i);
  
class Touchdown{
  public:
      int mem[1 &lt;&lt; 15][4][11];
      int howMany(int yardsToGo, vector &lt;int> plays)
      {
          FILL(mem,-1);
          int ret=rec(0,3,10,yardsToGo,plays);
          return ret >= INF ? -1 : ret;
      }
      int rec(int bm,int dns,int ytd,int ytg,const vector &lt;int> &plays)
      {
          if (ytg&lt;-10) return INF;
          if (ytg&lt;=0) return 0;
          if (ytd&lt;=0) {dns=3;ytd=10;}
          if (dns&lt;0) return INF;
          if (mem[bm][dns][ytd]>-1) return mem[bm][dns][ytd];
          int ret=INF;
          FORVECTOR(i,plays)
              if (!(bm & (1&lt;&lt;i))
            {
                ret&lt;?=1+rec(bm | (1 &lt;&lt; i),dns-1,ytd-plays[i],ytg-plays[i],plays);
              }
          return mem[bm][dns][ytd]=ret;
      }
}; 
</pre>

 
<%--
<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
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
