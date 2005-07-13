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

<title>Single Round Match 149 Statistics at TopCoder</title>

<xsl:call-template name="CSS"/>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 149</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Monday, June 2, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
										
                        <h2>Match summary</h2>

                        <p>SRM 149 was pretty wild with 100 successful challenges, and only 15 successful solutions to what seemed like a pretty easy division 1 medium. The hard 
                        problem also caused people some trouble, since it was somewhat novel. It was also was the first problem to return a double though that probably wasn't much 
                        of an issue for anyone. <strong>SnapDragon</strong> ended up winning division 1 by a fairly large margin, despite a resubmission on the hard (which he 
                        claims still has a bug which was missed by the system tests), and recaptured the all time highest rating. <strong>tomek</strong> continued to look good in his 
                        third match with the 2nd highest score. In division 2, an experienced TopCoder, <strong>kmd-10</strong>, won by a wide margin and moved into division 1.</p>

                        <br />
                        <h2>Problem Set Analysis &amp; Opinion</h2>

<font size="+2"><strong>FormatAmt</strong></font><br />Used as: Division Two - Level One: 
<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">250</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">174 / 202 (86.14%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">134 / 174 (77.01%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>simcoen</strong> for 248.13 
        points</td></tr></tbody></table></blockquote>

<p>This was probably one of the harder division 2 easy problems that TopCoder has 
posed. The easiest way to do it was probably to add digits from right to left. 
First, add the number of cents to a String. Then, if the number of cents is less 
than 10, you have to add an extra '0'. Next, you add the decimal point. Now, 
adding the dollars is probably easiest to do three digits at a time. You can use 
the modulus operator (num % 1000) to get the last 3 digits, but you have to add 
leading zeroes if the number is less than 100 and there are more digits left to 
add. Then, you add a comma, divide the number by 1000, to cut off the last 3 
digits, and repeat. Last, add the dollar sign and return. That is the approach 
I'll show in the reference solution here. Another way to do it is to add the 
dollars all at once, and then insert the commas afterwards. If you really knew 
your libraries well, there are formatting functions which can help. 
<pre>	String s = "."+(cents&lt;10?"0":"")+cents;
	do{
		s = (dollars%1000)+s;
		if(dollars/1000 &gt; 0){
			if(dollars%1000&lt;100)s = "0"+s;
			if(dollars%1000&lt;10)s = "0"+s;
		}
		dollars/=1000;
		if(dollars&gt;0)s=","+s;
	}while(dollars&gt;0);
	return "$"+s;
</pre>
</p>

<font size="+2"><strong>BigBurger</strong></font><br />Used as: Division Two - Level Two: 
<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">500</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">152 / 202 (75.25%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">127 / 152 (83.55%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>kmd-10</strong> for 484.20 
        points</td></tr></tbody></table></blockquote>Used as: Division One - Level One: 
<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">250</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">123 / 126 (97.62%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">115 / 123 (93.50%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>radeye</strong> for 248.27 
        points</td></tr></tbody></table></blockquote>
<p>This was a pretty simple simulation. Since the input is given in order by 
arrival time, we can loop through all of the customers and serve them one at a 
time, keeping track of the current time as we go. When we get to a new person, 
if the current time is less than or equal to the arrival time, we set the 
current time to the arrival time. Otherwise, we check to see if the difference 
between the current time and the arrival time is greater than the maximum wait 
so far, and if it is, we update the maximum wait time. Then, we increase the 
current time by the amount of time it takes to prepare he food. <pre>int t = 0;
int ret = 0;
for(int i = 0; i &lt; arrival.length; i++){
	if(arrival[i] &gt; t)t=arrival[i];
	ret = Math.max(ret,t-arrival[i]);
	t += service[i];
}
return ret;
</pre>
</p>

<font size="+2"><strong>Pricing</strong></font><br />Used as: Division Two - Level Three: 
<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">1000</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">55 / 202 (27.23%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">39 / 55 (70.91%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>kmd-10</strong> for 934.30 
        points</td></tr></tbody></table></blockquote>
<p>The first thing to observe is that the prices changed to each group should be 
one of the prices in the input. If it weren't, it would be better to increase it 
a little, since the same people would still be willing to pay. This suggests 
that we should pick the four prices for the groups, such that each of them is 
one of the prices from the input. To handle the case where there are less than 4 
groups, we simply allow multiple groups to have the same price. So, to pick the 
4 group prices, we just have 4 nested for loops. Then, we go through all of the 
people, and assign them to the group with the highest price that they are 
willing to pay. If we sort the input first, it makes things a little simpler and 
faster: <pre>	Arrays.sort(price);
	int ret = 0;
	for(int i = 0; i&lt;price.length; i++){
		for(int j = i; j&lt;price.length; j++){
			for(int k = j; k&lt;price.length; k++){
				for(int m = k; m&lt;price.length; m++){
					int rev = 0;
					for(int n = 0; n&lt;price.length; n++){
						if(price[n]&gt;=price[m]){
							rev+=price[m];
						}else if(price[n]&gt;=price[k]){
							rev+=price[k];
						}else if(price[n]&gt;=price[j]){
							rev+=price[j];
						}else if(price[n]&gt;=price[i]){
							rev+=price[i];
						}
					}
					ret=Math.max(ret,rev);
				}
			}
		}
	}
	return ret;
</pre>
</p>

<font size="+2"><strong>MessageMess</strong></font><br />Used as: Division One - Level 
Two: 
<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">250</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">117 / 202 (92.86%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">15 / 117 (12.82%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>ante</strong> for 458.06 
      points</td></tr></tbody></table></blockquote>

<p>This problem tripped a lot of people up, mostly because the examples made it 
look like a brute force approach might work. But, as experienced TopCoders will 
tell you, medium level problems usually aren't that simple. To solve this 
problem in time required a little bit of simple dynamic programming. You should 
have a String[] to keep track of valid restored substrings. That is, element i 
of the String[] represents a valid restoration of the characters from 0 to i, if 
there is one. If there is no valid restoration, or if there is more than one 
valid restoration, the String[] should have "IMPOSSIBLE!", or "AMBIGUOUS!", 
respectively. So, how do we do this now? Well, if there is a valid restoration 
for a substring, then there is a last word in that restoration. So, if we have a 
valid restoration for characters 0 to i, then we check each word to see if 
adding that word to the restoration from 0 to i is consistent with the input. If 
it is, then we update the restoration from 0 to j, where j is the index of the 
character where the added word ends. Once we have this figured out, its pretty 
simple to handle the cases where the return is "AMBIGUOUS!" or "IMPOSSIBLE!". I 
should note that another way to solve this problem is to use memoized recursion, 
which involves a recursive function that determines whether a substring from 
character 0 to character i can be restored or not. Here is dgoodman's (the 
writer) code: <pre>        int len = mess.length(); 
        int[] ways = new int[len+1];
        String[] ans = new String[len+1]; 
        ways[0]=1;
        ans[0]="";
        for(int i=0; i&lt;len; i++){
            if(ways[i]&gt;0){
                for(int id = 0; id&lt;dic.length; id++){
                    String word = dic[id]; int n = i + word.length();
                    if(n&gt;len) continue; 
                    if(!word.equals(mess.substring(i,n))) continue;
                    if(ways[n]&gt;0) ways[n]=2; else ways[n]=ways[i];
                    if(ways[n]==1) ans[n] = ans[i] + " " + word;
                }
            }
        }
        if(ways[len]&gt;1) return "AMBIGUOUS!";
        if(ways[len]&lt;1) return "IMPOSSIBLE!";
        return ans[mess.length()].trim();
</pre>
</p>

<font size="+2"><strong>GForce</strong></font><br />Used as: Division One - Level Three: 

<blockquote>
  <table cellspacing="2" cellpadding="3">
    <tbody>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Value</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">250</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Submission Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">15 / 202 (11.90%) </td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>Success Rate</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee">4 / 15 (26.67%)</td></tr>
    <tr>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>High Score</strong></td>
      <td class="bodyText" style="BACKGROUND: #eee"><strong>SnapDragon</strong> for 529.16 
        points</td></tr></tbody></table></blockquote>
<p>There are a couple of ways to do this. One of them involves some searching, 
and the other involves solving some equations explicitly. I'll discuss the 
searching solution first, and then the faster solution that dispenses with any 
search.<br /><br />Before we get into the solution though, lets talk a little about 
the calculus behind the problem. First, let's define a function avgForce(n) 
representing the average force starting at n. avgForce(n) is the same as the 
area under the curve from n to n+period, which is the same as the integral from 
n to n+period. Now, the integral from n to n+period is the sum of the integrals 
of all the pieces involved, and each of these integrals is a quadratic, since 
the integral of a linear equation is a quadratic. <br /><br />So, one way to solve 
this problem is to break the function into a number of segments, each of which 
is continuous (doesn't have any of the points from the input in it) and then 
search that segment, which is a quadratic, for the maxima. To find the segments, 
we take all of the points in the input, and all of the point in the input and 
subtract period from them, and sort them. Each of the intervals between two 
adjacent points in the sorted list is one of the above segments. To search this 
segment for a maxima, we can use the trinary search discussed in the round 
tables a while ago (seen in SnapDragon's solution). There are a number of 
iterative approaches that would also work, including gradient ascent and 
Newton's method. Depending on which approach we use, we might also have to check 
all the endpoints separately. The last task remaining is to write a function to 
calculate the avgForce(n) function. Since the function isn't continuous, the 
simplest way to compute it is one piece at a time. We can try to do some 
calculus to solve this, and it isn't that tricky, but we can use some simple 
geometry instead. Each section in the integral is a rectangle with a triangle on 
top of it. So, if we just find the dimensions of the rectangles and triangles 
the areas follow. Using the slopes of the line segments, this is pretty simple. 
<br /><br />Now, the solution without search. All of the previous observations 
apply, but here we also note that, at a maxima, the derivative (if it is 
defined) is zero. So, we can find the derivative of the quadratic, and then 
solve for when it is equal to zero. Finding the quadratic explicitly and solving 
it is more work than we need though. Instead, we observe that, unless one of the 
endpoints is one of the points in the input (when the derivative is not 
defined), the forces at the endpoints are equal. If they weren't we could slide 
the window one way or the other, and increase the total force. To see this, 
observe that when sliding the window some small amount, the force changes by 
that small amount times the difference between the forces. So, given a starting 
point, we want to slide the window to the point where the two forces are equal. 
If you work out the math, you'll find that this distance is the difference in 
the forces divided by the difference in the slopes. Once you have the point 
where the two forces are equal you check the force this produces, and also check 
all of windows with an endpoint at one of the points in the input. Here is the 
writer's solution, which uses this approach: 

<pre>public class GForce{
    int n; int[] f, time; double[] whole,slope;
    //solution interval must either start at start, end at end, or be an
    //interval whose endhts are equal to each other with left slope &gt;= right slope
    public double avgAccel(int period, int[] zf,int[] zt){
        n = zf.length; f=zf; time=zt;
        whole = new double[n];  //[0] is gbg, [1] is 0..1  [n-1] is last segment
        slope = new double[n];
        for(int i=1; i&lt;n; i++) whole[i] = (time[i]-time[i-1])*(f[i]+f[i-1])*.5;
        for(int i=1; i&lt;n; i++) slope[i] = (f[i]-f[i-1])*1.0/(time[i]-time[i-1]);
        
        int iFin = 1; // segment containing time[n-1]-period
        for(int i=1; time[i]+period &lt; time[n-1]; i++) iFin = i+1;
        double max = area(time[n-1]-period,iFin,time[n-1],n-1);
        for(int i=1; i&lt;n; i++) for(int j=i; j&lt;n; j++){ //seg i to seg j?
            double t1 = Math.max(time[i-1], time[j-1]-period); //start
            double t2 = Math.min(time[i], time[j]-period);    //end
            if(t1&gt;t2) continue;
	    double oldmax = max;
            max = Math.max( max, area(t1,i,t1+period,j) );  //equal slopes?
            if(max&gt;oldmax)System.out.println("improve "+t1+" =&gt;"+max);
            max = Math.max( max, eqHt(i,j, t1,t2, period) );
        }
        return max/period;
    }
    double eqHt(int i, int j, double t1, double t2, int period){
        if(slope[i]&lt;= slope[j]) return -1.0;
        double tstar = t1 + (getY(j,t1+period) - getY(i,t1))/(slope[i]-slope[j]);
        if(tstar&lt;t1 || tstar&gt;t2) return -1.0;
        return area(tstar,i,tstar+period,j);
    }
    double getY(int i, double t){ return f[i-1] + slope[i]*(t-time[i-1]); }
    
    double area(double ti, int i, double tj, int j){//segi, time ti to segj,timetj
        double ai = (time[i]-ti)  *.5*(f[i]  +getY(i,ti));
        double aj = (tj-time[j-1])*.5*(f[j-1]+getY(j,tj));
        double sum = ai+aj; if(i==j) sum -= whole[i];
        for(int k=i+1; k&lt;j; k++) sum += whole[k];
        return sum;
    }
}
</pre>
</p>

		     <!-- <p><img src="/i/m/brett1479_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=251317"><strong>brett1479</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" /></p> -->
                        
                        <p><img src="/i/m/lbackstrom_mug.jpg" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left"/><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=159052"><strong>lbackstrom</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" /></p>

                        <!-- <p><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" /><br />
                        By&#160;<a class="bodyText" href="/tc?module=MemberProfile&amp;cr=269554"><strong>Yarin</strong></a><br/>
                        <span class="smallText"><em>TopCoder Member</em></span><br clear="all" /></p> -->

                    </td>
                </tr>
            </table>
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
