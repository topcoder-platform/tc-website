<xml version="1.0">
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../top.xsl"/>
    <xsl:import href="../script.xsl"/>
    <xsl:import href="../includes/body_top.xsl"/>
    <xsl:import href="../foot.xsl"/>
    <xsl:import href="../includes/modules/srm_results.xsl"/>
    <xsl:import href="../includes/modules/white_last_srm.xsl"/>
    <xsl:import href="../includes/modules/quick_stats_pulldown.xsl"/>
    <xsl:import href="../includes/modules/coder_week2.xsl"/>
    <xsl:import href="../includes/modules/practice_room.xsl"/>
    <xsl:import href="../includes/modules/calendar.xsl"/>
    <xsl:import href="../includes/modules/top_room_wins.xsl"/>
    <xsl:import href="../includes/global_left.xsl"/>
    <xsl:import href="../includes/public_right_col.xsl"/>
    <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
    <xsl:template match="/">

<html>

<head>

<xsl:call-template name="Preload"/>

<title>Single Round Match 171 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

<script>
function openWin(url, name, w, h) {
    win = window.open(url, 'biowin', "scrollbars=yes,toolbar=no,resizable=no,menubar=no,width="+w+",height="+h);
    win.location.href = url;
    win.focus();
}
</script>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>

</head>

<body>

<xsl:call-template name="Top"/>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170" bgcolor="#CCCCCC">
            <xsl:call-template name="global_left"/>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="4"><img src="/i/table_top_fill.gif" width="4" height="26" alt="" border="0" /></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td class="bodyText" width="100%">
            <xsl:call-template name="BodyTop">
                <xsl:with-param name="image1">white</xsl:with-param>
                <xsl:with-param name="image">statisticsw</xsl:with-param>
                <xsl:with-param name="title">Last Match Editorials</xsl:with-param>
            </xsl:call-template>
            
            <table border="0" cellspacing="10" cellpadding="0" width="100%">
            <tr valign="top">
                    <td class="bodyText" width="100%">

<!--body contextual links-->
                        <table width="100%" border="0" cellspacing="0" cellpadding="3">
                            <tr valign="middle">
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 171</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/indext=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Wednesday, November 12, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2>

<p>
SRM 171 had a nice variety of problems, which <b>benetin</b> plowed through easily to win the match by an impressive margin of 190 points.  
Division 2 was also won by a large margin, 150, by first time coder <b>Mossop</b>.  Many coders found the division 1 easy / division 2 
medium more difficult that usual, with the average submission time in division 1 at about 20 minutes.  It also proved easy game during the 
challenge phase, with about 40 challenges total over both divisions, and coders like <b>ambrose</b> and <b>cgu</b> claiming three of those
challenges each.
</p>
 
<p>
<H1>
The Problems
</H1>
</p>

<font size="+2">
<b>RPG</b>
</font>
<A href="Javascript:openProblemRating(1944)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level One: <blockquote><table cellspacing="2">
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
      225 / 269 (83.64%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      196 / 225 (87.11%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>jaivasanth</b> for 242.77 points (4 mins 55 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      185.47 (for 196 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
Aside from parsing, which wasn't too hard, this problem was fairly straightforward. Allocate an array of three elements for 
the return value, loop through all the input values, and increment the elements in the array as necessary.  The only hitch is 
that you can't calculate the average value as you go because that can introduce rounding errors.  One of the example cases 
made this problem explicit, though, and it is easily solved by waiting until you've gone through all the values, then the average 
value is given by (min+max)/2.  The input is in the form "ndx", if it is parsed into arrays <i>n</i> and <i>d</i>, then the 
following code will find the minimum, maximum, and average die rolls and store it in the array <i>ret</i>:
<pre>
for (int i=0;i&lt; n.size();i++) {
	ret[0]+=n[i];
	ret[1]+=n[i]*d[i];
}
ret[2]=(ret[0]+ret[1])/2;
</pre>
</p>

<font size="+2">
<b>CrossCountry</b>
</font>
<A href="Javascript:openProblemRating(1950)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Two: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      600
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 269 (46.47%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      38 / 125 (30.40%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Humbug75</b> for 430.26 points (19 mins 32 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      317.36 (for 38 correct submissions)
    </td>
  </tr>
</table></blockquote>


Used as: Division One - Level One: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      300
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      205 / 219 (93.61%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      125 / 205 (60.98%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>ZorbaTHut</b> for 291.08 points (5 mins 0 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      214.22 (for 125 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem boiled down to sorting by a specific criterion, and this, of course, can be done in many different ways.  
If you are familiar with the standard sorting functions of your language, one way to do this is to make an appropriate struct 
and comparator, and then the sorting is done for you.  Using the standard template library for C++ the struct and 
comparator could be declared like this:
<pre>
struct  team {
	int score;
	int sixth;
	char name;
};

bool operator &lt; (const team & lhs, const team & rhs) {
	if (lhs.score!=rhs.score) return lhs.score&lt; rhs.score;
	if (lhs.sixth!=rhs.sixth) return lhs.sixth&lt; rhs.sixth;
	return lhs.name&lt; rhs.name;
}
</pre>
As long as you score the teams correctly, remove teams that didn't have at least five runners finish, and assign a 
large value (like 1000000) to the sixth place runner if a team didn't have more than 5 finish, then this will sort 
exactly how the problem specifies.  The following code demonstrates this:
<pre>
vector&lt; team &gt; teamScores;
for (int i=0;i&lt; numTeams;i++) {
	int numFinished=0;
	team t;
	t.score=0;
	t.sixth=1000000;
	t.name='A'+i;
	for (int j=0;j&lt; finishOrder.size();j++) {
		if (finishOrder[j]==('A'+i)) {
			if (numFinished<&lt;  5) {
				numFinished++;
				t.score+=j;
			} else if (numFinished==5) {
				t.sixth=j;
				numFinished++;
			}
		}
	}
	if (numFinished&gt; =5)
		teamScores.push_back(t);
}
sort(teamScores.begin(),teamScores.end());
</pre>
Now that the teams are sorted in the correct order, all that remains is to go through and put the team names into a string for the return value.
<pre>
string ret;
for (int i=0;i&lt; teamScores.size();i++)
	ret+=teamScores[i].name;
return ret;
</pre>
</p>

<font size="+2">
<b>TextEditor</b>
</font>
<A href="Javascript:openProblemRating(1942)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

Used as: Division Two - Level Three: <blockquote><table cellspacing="2">
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Value</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      900
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Submission Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      40 / 269 (14.87%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      11 / 40 (27.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Mossop</b> for 765.03 points (12 mins 23 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      522.84 (for 11 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem had two main parts.  First, take the input text and turn it into an array of strings of the appropriate width.  
Second, reorder these strings so that they correspond to two columns of text.  If you note that extra whitespace in the input
can be disregarded, the first part becomes as simple as using the appropriate parsing tools of your language.  In 
C++ this can be done as follows using stringstreams:
<pre>
string t;
for (int i=0;i&lt; text.size();i++) {
	t+=text[i];
	t+=' ';
}
stringstream ss(t);
vector&lt; string &gt; v;
string temp;
int back=-1;
while (ss &gt;&gt; temp) {
	if (v.size()&gt; 0 &amp&amp v[back].size()+1+temp.size() &lt; =width) v[back]+=" "+temp;
	else {
		v.push_back(temp);
		back++;
	}
};
</pre>
This code first takes the input text and makes one large string out of it.  Then it takes one word at a time out of the string 
and makes new lines of text, always making the lines as  long as possible without exceeding <i>width</i> characters in length.   
Now we have to reorder the text.  If you are careful about how many lines there are in each column, this can be done with 
minimal coding.  The thing to note is that with an even number of lines, there will be an equal number of lines per column, 
but with an odd number there will be one more line in the first column.
<pre>
	vector<string> ret(v.size());
	int offset=v.size()%2;
	for (int i=0;i&lt; v.size();i++)
	if (i%2==0) {
		ret[i]=v[i/2];
	} else {
		ret[i]=v[i/2+v.size()/2+offset];
	}
</pre>
</p>

<font size="+2">
<b>ResistorCombinations</b>
</font>
<A href="Javascript:openProblemRating(1941)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      99 / 219 (45.21%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      51 / 99 (51.52%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>WishingBone</b> for 456.03 points (8 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      310.83 (for 51 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This problem was most easily approached with a complete search to find all possible values of resistors that can be made, 
and then finding the one of those that is closest to the target value.  The complete search can be done with a recursive procedure 
that takes as input which resistors to be used, breaks those resistors up into two sets, calls itself recursively to find all 
possible resistances from those two sets, and then makes all combinations of one resistance from the first set and one from 
the second set.  The base case is when there is only one resistor in a set, in which case the only resistance that can be made is 
that of the one resistor itself.  For a Java implementation of this, see <b>writer</b>'s solution in the practice room.  Here is 
some incomplete C++ code that gives the general idea:
<pre>
set &lt; double &gt; getAllCombos(vector &lt; double &gt; vr) {
	if (vr.size()&lt;=1) return set<double>(vr.begin(),vr.end());
	vector &lt; double &gt; A,B;
	set &lt; double &gt; comboA,comboB;
	set &lt; double &gt; ret;
	for all combinations of non-empty sets A and B such that the union of A and B is in vr
		comboA=getAllCombos(A);
		comboB=getAllCombos(B);
		for every element EA in comboA
			for every element EB in comboB
				ret.insert(EA+EB); //series combination
				ret.insert((EA*EB)/(EA+EB)); //parallel combination
	return ret;
}
</pre>
Also be sure to find all combinations, not just combinations that use all of the resistors.  Once all possible combinations have 
been found it is trivial to find the closest value to the target value.
</p>

<font size="+2">
<b>UndergroundVault</b>
</font>
<A href="Javascript:openProblemRating(1939)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/>

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
      36 / 219 (16.44%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      23 / 36 (63.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>benetin</b> for 859.42 points (11 mins 53 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      624.81 (for 23 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>
This was definitely one of those problems where, if you could figure out how to solve it, the coding was easy.  
The problem statement might have been clear, but it wasn't quite clear how to go about solving it.  The problem 
statement itself gave a useful clue though, "You can't do this, however, just by sealing any door you see, 
because you could close off a section of the vault and be unable to seal doors in that section, or you could seal 
yourself in the vault!"  This is really all the information we need.  Consider the problem as a graph with the 
rooms as vertices and the doors between them as edges.  Whenever you seal a room you remove certain edges 
from that vertex.  To determine whether or  not a room can be sealed, temporarily remove the appropriate 
edges, and then check to see  whether all unsealed rooms (including the one you are currently checking) can 
be reached from room 0.  If so, then you aren't sealing off any part of the vault, and you aren't sealing yourself 
in the vault, so that room can be sealed.<br/>
Here is my solution to this problem.  First parse the input into an adjacency matrix <i>adj</i>[][] such that <i>adj</i>[<i>i</i>][<i>j</i>]=1 
if there is a door from room <i>i</i> to room <i>j</i> that must be sealed from room <i>i</i>, and <i>adj</i>[<i>i</i>][<i>j</i>]=Inf 
otherwise (where Inf is some arbitrary large number).  Make sure to set the diagonal values of <i>adj</i> to 1 as well.  
Now make an array <i>unsealed</i>[] which has one element for each room such that <i>unsealed</i>[<i>i</i>]=1 if 
room <i>i</i> is unsealed, and 0 otherwise.  Now use the Floyd-Warshall algorithm with a small modification to 
find what rooms can be reached if we don't use doors from one specific room.
<pre>
bool canBeSealed(vector &lt; vector &lt; int &gt; &gt; adj,vector &lt; int &gt; unsealed,int room) {
	for (int k=0;k &lt; adj.size();k++)
	for (int i=0;i &lt; adj.size();i++)
	for (int j=0;j &lt; adj.size();j++) {
		if (i==room || k==room) continue;
		adj[i][j] &lt; =adj[i][k]+adj[k][j];
	}
	for (int i=0;i &lt; unsealed.size();i++)
		if (unsealed[i] &amp&amp adj[0][i]==1000000) return false;
	return true;
}
</pre>
The small modification is that we can't use edges that begin in room <i>room</i>.  Now that we have this, all we have to do is check rooms one at a time to see what we can seal.
<pre>
vector &lt; int &gt; ret;
for (int i=0;i &lt; adj.size();i++) {
	int j=0;
	while (j &lt; adj.size()) {
		if (! unsealed[j]) {
			j++;
			continue;
		}
		vector &lt; vector &lt; int &gt; &gt; temp=adj;
		for (int k=0;k &lt; adj.size();k++)
		temp[j][k]=1000000;		
		if (canBeSealed(temp,unsealed,j)) {
			unsealed[j]=0;
			adj=temp;
			ret.push_back(j);
			break;
		}
		j++;
	}
}
ret.push_back(0);
return ret;
</pre>
Admittedly, using Floyd-Warshall to check a room is not the fastest solution.  It runs in O(v<sup>3</sup>), and we could use a breadth first search which would run in O(v+e).
I chose Floyd-Warshall because it is easier and faster to code, and less error prone.
</p>

                        <p>
                        <img src="/i/m/Running_Wild_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/statc=member_profile&amp;cr=274760"><strong>Running Wild</strong></a><br />
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
                        </p>
                    </td>
                </tr>
            </table>
            
            <p><br /></p>
            
        </td>
<!-- Center Column Ends -->

<!-- Gutter -->
        <td width="4"><img src="/i/clear.gif" width="4" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
        <td width="170">
            <img src="/i/clear.gif" width="170" height="1" border="0"/><br />
            <xsl:call-template name="public_right_col"/>
        </td>
<!-- Right Column Ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"/></td>
<!-- Gutter Ends -->

    </tr>
</table>

<xsl:call-template name="Foot"/>

</body>

</html>

    </xsl:template>
</xsl:stylesheet>

