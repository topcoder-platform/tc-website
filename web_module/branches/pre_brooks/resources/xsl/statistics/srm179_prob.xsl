<?xml version="1.0"?>
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

<title>Single Round Match 179 Statistics at TopCoder</title>

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
        <td width="170" bgcolor="#FFFFFF">
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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 179</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, January 17, 2004</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
Despite a high score on the easy and hard problems, tomek finished second to radeye in his second SRM since winning the TCO.  Radeye was close behind on the easy and hard problems, and his amazing 571/600 left him more than a full challenge ahead.  With the help of a challenge, grotmol took the bronze in room 4.  In division 2, coders made short work of their easy problem, but stumbled on the medium problem with less than 17% of solutions passing system tests.  In the end, new comer Per had the highest score, followed by two other new comers gunnark and Itank, in second and third.
</p> 
  
<p>
<H1> 
The Problems 
</H1> 
</p> 

<font size="+2"> 
<b>OnLineRank</b> 
</font> 
<A href="Javascript:openProblemRating(2264)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      189 / 210 (90.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      137 / 189 (72.49%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>preetham</b> for 244.03 points (4 mins 27 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194.05 (for 137 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The simplest way to solve this problem is with two nested loops.  The outer loop iterates over each element in the input, while the inner loop iterates over the k prior elements.  If there are not k prior elements, then you should just iterate over all of the prior elements.  Then, all you have to do is count how many of the prior scores are higher than each score.  In fact, since you want the sum, you don't even need to compute the rank of each score, since you can accumulate them all in the same variable:
<pre>
	public int calcRanks(int k, int[] scores){
		int ret = 0;
		for(int i = 0; i&lt;scores.length; i++){
			ret++;
			for(int j = Math.max(0,i-k); j&lt;i; j++){
				if(scores[j] &gt; scores[i])ret++;
			}
		}
		return ret;
	}
</pre>
</p> 

<font size="+2"> 
<b>Packhorses</b> 
</font> 
<A href="Javascript:openProblemRating(2259)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      550 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      140 / 210 (66.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      23 / 140 (16.43%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Per</b> for 537.87 points (4 mins 17 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      359.87 (for 23 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Coders came up with a lot of different ways to determine how to split up the large and small packs.  However, the incredibly low success rate suggests that most approaches are subtly flawed.  Instead of trying to be clever and come up with some greedy way to split up the packs, it is best to just try all possibilities.  With only 1000 of each type of pack, a brute force solution should be plenty fast.  In fact, we can write one that runs in O(n) time, which is no problem at all when n is only 1000.  First, we observe that each person requires his or her own horse.  Furthermore, aside from the bags we put on horses with people, there is no question of how to distribute the bags: just load up horses with small bags until there are none left, and then load up horses with large bags.  So, really the only decision our code has to make is how many small bags to put on horses with people, and how many large bags to put on horses with people.  So, we can simply loop over the number of people, trying each value as the number of horses to put small bags on with our people.  The remaining horses, we load up with large bags, and then we put the left over bags on their own horses:
<pre>
	int horses(int p, int x, int y){
		int ret = 10000;
		for(int i = 0; i&lt;=p; i++){
			int xx = max(0,x - i*2);
<font color="blue">//xx is the number of small bags remaining after 
//i horses are loaded with one person and two small bags.</font>
			int yy = max(0,y - (p-i));
<font color="blue">//yy is the number of large bags remaining after 
//the other p-i horses are loaded with large bags.</font>
			ret = min(ret, p + (xx+2)/3 + (yy+1)/2);
		}
		return ret;
	}

</pre>
Note that (xx+2)/3 is just a way of taking the ceiling of xx/3.
<br/><br/>
Although I won't go into the details, there is a way to solve this problem in constant time.  The key is to observe that you can get two thirds as many small bags on a horse with a person than on one without a person, and only 1/2 as many large bags on a horse with a person.  From there, you can break the problem into two cases, and come up with a solution.
</p> 

<font size="+2"> 
<b>Regions</b> 
</font> 
<A href="Javascript:openProblemRating(1099)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1100 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 210 (14.76%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      4 / 31 (12.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ltank</b> for 585.80 points (33 mins 38 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      518.05 (for 4 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 



Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
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
      48 / 152 (31.58%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 48 (52.08%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>radeye</b> for 571.03 points (6 mins 27 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      362.33 (for 25 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem is a little bit similar to problems that have been used in the past.  The one important difference is that rather than being located at lattice points, the relevant coordinates are offset by (0.5,0.5) from lattice points.  However, the solution to this problem is similar in that solving the problem requires GCD.  First, consider the case when the path from one point to another does not pass through any lattice points.  In this case, if the path is from (x<sub>1</sub>,y<sub>1</sub>) to (x<sub>2</sub>,y<sub>2</sub>) then it crosses exactly |x<sub>1</sub>-x<sub>2</sub>| vertical boundaries, and |y<sub>1</sub>-y<sub>2</sub>| horizontal boundaries.  Thus, the path passes through |x<sub>1</sub>-x<sub>2</sub>| + |y<sub>1</sub>-y<sub>2</sub>| regions.  The tricky part is that the path might touch the corner of a region, in which case it crosses both a horizontal and vertical border simultaneously, and causes our count to be too high.  To deal with this case, the first thing to do is to note that we can break any path up into a number of identical paths by factoring out the GCD(|y<sub>1</sub>-y<sub>2</sub>|,|x<sub>1</sub>-x<sub>2</sub>|).  For example, a path from (3,2) to (6,5) has a difference of (3,3), and is identical to three paths with difference of (1,1), each of which ends at the center of a region.  Doing this allows us to work with paths whose differences in x and y coordinates are relatively prime (have no common factors).  We can break these paths into two cases: those with two odd differences, and those with an odd difference and an even difference.  When both the differences are odd, the path passes through a single corner, half way along the path.  You can see this by noting that half of an odd integer is always an integer plus 0.5, and since we started at an integer plus 0.5, we end up at an integer for both coordinates.  Since the numbers are relatively prime, there is no fraction other than one half that has this property.  In the other case, when one of the differences is even, there is no fraction at all that gives you two numbers that are integers plus 0.5.<br/><br/>
Putting this all together, we traverse the path, each time adding the differences in x and y coordinates to our running total, and subtracting the number of corners along each leg.  The number of corners is either the GCD of the differences (the number of identical, relatively prime paths), or else 0:
<pre>
	int numTaxes(int[] row, int[] col){
		long ret = 0;
		for(int i = 0; i+1 &lt; row.length; i++){
			int rx = abs(row[i+1]-row[i]);
			int cx = abs(col[i+1]-col[i]);
			int g = gcd(rx,cx);
			if(g==0)continue;
			ret += rx + cx - (rx/g%2==cx/g%2?g:0);
		}
		return ret>2000000000?-1:(int)ret;
	}
	int gcd(int a, int b){return b==0?a:gcd(b,a%b);}
</pre>
</p> 

<font size="+2"> 
<b>NameCheck</b> 
</font> 
<A href="Javascript:openProblemRating(1855)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

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
      144 / 152 (94.74%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      97 / 144 (67.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 230.78 points (8 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      163.06 (for 97 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
Regular expressions can shorten up solutions to this problem a little bit and I'm going to go over a solution (in Java) which uses them, but they are mainly for convenience, and can be avoided without much added difficulty.  The first thing to do when checking a potential name is to make sure that it has either 2 or 3 parts, and no leading or trailing spaces.  Once that's done, we check each part individually, and make sure that it meets our requirements.  Finally, if everything is OK, we capitalize the parts.  To check if a part is either a name or initial, we can match it against "[a-zA-Z](\\.|[a-zA-Z]+)", which accepts any letter followed by a '.' or more letters.  To check if a part is a valid last name, we can use the expression "[a-zA-Z]{2,}".  Both of these are pretty simple expressions, and could be replaced by a couple of relatively short methods if you didn't want to use regular expressions.  To capitalize the parts, I wrote a method that capitalized each element of an array using some built-in functions:
<pre>
import java.util.*;
public class NameCheck{
   public String[] formatList(String[] list){
      ArrayList ret = new ArrayList();
      String n1 = "[a-zA-Z](\\.|[a-zA-Z]+)";
      String n2 = "[a-zA-Z]{2,}";
      for(int i = 0; i&lt;list.length; i++){
         String[] sp = list[i].split(" +",100);
         if(sp.length == 2 &amp;&amp; sp[0].matches(n1) &amp;&amp; sp[1].matches(n2)){
         cap(sp);
            ret.add(sp[0]+" "+sp[1]);
         }
         if(sp.length == 3 &amp;&amp; sp[0].matches(n1) &amp;&amp; sp[1].matches(n1) &amp;&amp; sp[2].matches(n2)){
         cap(sp);
            ret.add(sp[0]+" "+sp[1]+" "+sp[2]);
         }
      }
      return (String[])ret.toArray(new String[0]);
   }
   void cap(String[] s){
      for(int i = 0; i&lt;s.length; i++){
         s[i] = s[i].substring(0,1).toUpperCase() + s[i].substring(1).toLowerCase();
      }
   }
}
</pre>
I saw a couple of solutions which failed because they didn't handle trailing spaces properly.  Note that by default, Java's split method will not have any elements corresponding to trailing characters that match the split pattern.
</p> 

<font size="+2"> 
<b>AntiMatter</b> 
</font> 
<A href="Javascript:openProblemRating(1358)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br/> 

Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      850 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      41 / 152 (26.97%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      22 / 41 (53.66%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>tomek</b> for 776.65 points (8 mins 54 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      600.47 (for 22 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There were two ways to solve this problem.  The shorter, but more advanced one uses GCD.  It turns out that, given two numbers, a and b, there exists some number, n, such that all numbers greater than n which have gcd(a,b) as a factor can be formed as a*x+b*y for some integers x and y.  For example, all even numbers greater than 54 can be formed from some combination of 10's and 16's.  Now, the particles in this problem are moving in such a way that the difference between than can either increase or decrease by certain values, as defined by pairs of integers in the input.  For example, if xForm = {4,6,9}, the difference can change by 2, 5, or 3.  So, in this case, since gcd(2,3,5) = 1, there exists some n such that any differences greater than n can be achieved.  And, since the difference can either increase or decrease, we can make the difference some number greater than n which is a multiple of 2, 3 or 5, and then decrease it down to zero.  Hence, so long as the initial difference is a multiple of the gcd of all the differences, we can increase it to some large value and then decrease it to zero.
<br/><br/>To find the exact probability, we just need to count the number of pairs that have a difference divisible by the gcd.  We can do this by looping over all values, or by coming up with a formula for the count.  In my opinion, looping over all pairs is a lot simpler, and less error-prone, but the following formula also works (thanks to brett for working this out): <br/>
<tt>20000*(10000/gcd) - gcd*(10000/gcd)*(10000/gcd+1) + 10000</tt>
<br/>The one exception to this whole discussion is when all the differences are 0 and the GCD is undefined (all elements of xForm are the same).  As noted in an example, the answer is simply ".00010000" in this case.  Here is brett's code, using the formula mentioned.
<pre>
	String unstable(int[] vals) {
		int d = 0, big = 10000, ret = big;
		for (int a = 0; a &lt; 4; a++){
			for (int b = 0; b &lt; a; b++) {
				int k = abs(vals[a]-vals[b]);
				if (k==0) continue;
				d = (d==0) ? k : gcd(d,k);
			}
		}
		if (d!=0) ret += 2*big*(big/d) - d*(big/d)*(big/d+1);
		String temp = ret+"";
		while (temp.length() &lt; 8) temp = "0"+temp;
		return d==1?"1.00000000":"."+temp;
	}
</pre>
Another way to solve this problem doesn't require any number theory or GCD.  Instead, we can simply determine which differences are achievable by repeatedly moving the particles.  The simplest way to make a solution like this run in time is to do a breadth first search (you'll probably blow the stack if you use recursion).  The other trick to make this work is to never let the difference go above 40,000 or below 0.  Since, any time we go above 40,000, we will have to come back down in order to have a relevent difference, we might as well go down first, and then back up later.  Also, since negative differences are pretty much equivalent to their positive counterparts, there is no need to consider them.  Once we figure out which differences are achievable, we can loop over all of the pairs, and see which ones have achievable differences.  In pseudocode:
<pre>
	int dif[6]
	boolean achievable[40001]
	String unstable(int[] xForm){
		int ptr = 0
		for a = 0 to 3
			for b = 0 to a-1
				dif[ptr++] = abs(xForm[a]-xForm[b])
			end for
		end for

		int queue[40001]
		queue[0] = 0
		achievable[0] = true
		int h = 0
		int t = 1
		while (t&gt;h)
			for i = 0 to 5
				int x = queue[h] + dif[i]
				if(x&gt;=0 &amp;&amp; x &lt;= 40000 &amp;&amp; !achievable[x])
					queue[t++] = x
					achievable[x] = true
				end if
				x = queue[h] - dif[i]
				if(x&gt;=0 &amp;&amp; x &lt;= 40000 &amp;&amp; !achievable[x])
					queue[t++] = x
					achievable[x] = true
				end if
			end for
			h++
		end while

		int ret = 0;
		for a = 0 to 9999
			for b = 0 to 9999
				if(achievable[abs(a-b)]) 
					ret++
				end if
			end for
		end for
		return ret as a probability
	}
</pre>
</p> 

                        <p>
                        <img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=159052"><strong>lbackstrom</strong></a><br />
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
