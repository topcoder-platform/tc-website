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

<title>Single Round Match 164 Statistics at TopCoder</title>

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
                                <td class="statTextLarge" bgcolor="#999999" width="50%"><font size="3">Single Round Match 164</font></td>
                                <td class="bodyText" bgcolor="#999999" width="50%" align="right"><a href="/index?t=statistics&amp;c=editorial_archive" class="bodyText"><strong>Archive</strong></a></td>
                            </tr>

                            <tr valign="middle">
                                <td class="bodyText">Saturday, September 20, 2003</td>
                                <td class="bodyText" align="right"><a href="mailto:editorial@topcoder.com">Comments / Ideas?</a></td>
                            </tr>
                        </table>
<!--end contextual links-->
<h2>Match summary</h2> 

<p> 
Turnout was pretty high for SRM 164, perhaps due to the buzz surrounding the upcoming Google Code Jam, and the TCO.  Those in division 1 picked a tough day to show up, as almost half of the easy submissions failing during challenge, most of them for the same reason.  But, when a contest has a tricky easy problem, there is always the opportunity for one person to get a plethora of points from challenges.  ChistopherH took advantage of this opportunity in a big way, getting 5 successful challenges, and a much deserved first SRM win.  Not only did ChristopherH get his first win, he got the highest division 1 score since dmwright got 1814.93, over 2 years ago.  In second place was dgarthur, who actually had the most points from coding, but didn't do as well in the challenge phase.  Rounding out the top 3, from down under, John Dethridge had 1449 points, almost 300 behind ChristopherH.<br/><br/>
Division 2 had an easier time of it, as almost everyone solved the easy problem, about half of the competitors solved the medium problem, and a relatively high 31 coders got the hard.  Of the coders who solved all 3, 9 of them were first time competitors who debuted in the yellow.  Top honors in division 2 went to Klinick, who won pretty handily with the help of 2 challenges, beating out second place agentsmith be about 41 points.
</p> 
  
<H1> 
The Problems 
</H1> 

<font size="+2"> 
<b>Justifier</b>
</font><A href="javascript:infoWindow('/')"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      200 / 212 (94.34%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      194 / 200 (97.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ceranith</b> for 249.11 points (1 mins 42 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      217.19 (for 194 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
The best way to do this problem is in two parts.  First, find the length of the longest string in the input.  This will tell you how far you need to indent the other strings.   Then, you go back through all of the strings, and add spaces until the length of each string has the same length as the longest one.  In pseudocode, it goes like this:
<pre>
    function justify(string[] textIn)
        longest = 0
        foreach string s in textIn
            longest = max(longest, lengthOf(s))
        end for
        foreach string s in textIn
            while(lengthOf(s)!=longest)
                s.prepend(" ")
            end while
        end for
        return textIn
    end function
</pre>
</p> 

<font size="+2"> 
<b>PartySeats</b> 
</font><A href="javascript:infoWindow('/')"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      160 / 212 (75.47%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      107 / 160 (66.88%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>NeverMore</b> for 490.54 points (10 mins 8 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      336.65 (for 107 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
In order for there to be a valid seating plan, there are a couple of conditions that must be met.  First, we observe that there must be an equal number of boys and girls on each side of the table, so that we can alternate boys and girls as we go from host to hostess.  Next, since the host and hostess are to be seated across from each other, there have to be an equal number of people on either side of the table.  Now, since there are an equal number of boys and girls on either side of the table, and there are equal numbers of people on each side of the table, the total number of people, not including the host and hostess, must be divisible by 4, and exactly half of them must be girls.  So, the first thing to do in this problem is to check that there are equal numbers of boys and girls, and that the total number of people is divisible by 4.  If either of these conditions are not met, we return an empty array, otherwise there must be a legal arrangement.<br/><br/>
Now, on to the arranging.  As you are counting the number of boys and girls around the table, you can divide them into two separate groups (which is easy because if there is going to be a legal arrangement, the number of girls must be exactly half of the total number of people).  Once we have the two groups divided, we sort each on independently.  The sorting should be simple, and if you don't already know about you languages sorting routines, I suggest you learn them.  Finally, we go through all of the people, and alternate boys and girls, starting with a girl, until we get to the hostess.  Then, we place another boy, and continue to alternate.  The simplest way to do the alternation is to first place half of the boys and girls, alternating with the girl first, before the hostess, and then place the other half of the boys and girls, alternating with the boy first, after the hostess.  In very high level, verbose pseudocode, this can be done as follows:
<pre>
    function(string[] attendees)
        boys = new string[lengthOf(attendees)/2]
        girls = new string[lengthOf(attendees)/2]
        ret = new string[lengthOf(attendees)+2]
        bptr = 0
        gptr = 0
        if(lengthOf(attendees)%4 != 0)
            return new string[0]
        end if
        foreach string s in attendees
            if (s is a boy)
                if(bptr == lengthOf(boys))
                    return new string[0]
                end if
                boys[bptr] = nameOf(s)
                bptr = bptr + 1
            else
                if(gptr == lengthOf(girle))
                    return new string[0]
                end if
                girls[gptr] = nameOf(s)
                gptr = gptr + 1
            end if
        end for
        sort(boys)
        sort(girls)
        ret[0] = "HOST"
        ret[lengthOf(boys)+1] = "HOSTESS"
        for i = 0 to lengthOf(boys)-1
            if(i &lt; lengthOf(boys)/2)
            <font color="blue">//Put a boy, then a girl, since we are to the hosts left.</font>
                ret[i*2+2] = boys[i];
                ret[i*2+1] = girls[i];
            else
            <font color="blue">//Put a girl, then a boy, since we are to the hosts right.</font>
                ret[i*2+2] = boys[i];
                ret[i*2+3] = girls[i];
            end if
        end for
        return ret
    end function
</pre>
</p> 

<font size="+2"> 
<b>WhatSort</b> 
</font><A href="javascript:infoWindow('/')"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      55 / 212 (25.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      31 / 55 (56.36%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Klinck</b> for 856.18 points (16 mins 9 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      607.65 (for 31 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 



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
      120 / 146 (82.19%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      86 / 120 (71.67%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>aneubeck</b> for 479.83 points (5 mins 52 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      342.13 (for 86 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
There are 6 possible sort orders to consider, so one way to solve this problem is to simply write 6 sorting methods, and then sort a copy of the input in each of the 6 possible ways, and see which sorted orders match the original order.  However, this is a lot of code, and very error prone.  In general, I find it is usually better to try to do things elegantly, because if you make a mistake, it is usually easier to track down if there is less code.  However, in this case, the more elegant solution may not really be that much more elegant, but I'll explain it that way anyway.  The first step is to write a single compare method, which will compare two people by any criteria.  For example, you might have an int array containing 0, 1, and 2, where 0 represented name, 1 represented age, and 2 represented weight.  The element at index 0 would be your primary sort criteria, and so on.  Like this (for Java):
<pre>
    int compare(int index1, int index2){
        for(int i = 0; i&lt;3; i++){
            if(order[i]==0 &amp;&amp; !name[index1].equals(name[index2])){
                return name[index1].compareTo(name[index2]);
            }else if(order[i]==1 &amp;&amp; age[index1] != age[index2]){
                return age[index1]-age[index2];
            }else if(order[i]==2 &amp;&amp; wt[index1] != wt[index2]){
                return wt[index2]-wt[index1];
            }
        }
        return 0;
    }
</pre>
Then, in the main body of your code, you can generate all permutations of order, and do a simple bubble sort to sort the elements.  In this case, it would probably be easiest to write a sort method, and then hard code the 6 different permutations, but it can also be done recursively:
<pre>
    String[] name, name2;
    int[] age, wt, age2, wt2;
    String let = "NAW";
    String ret = "NOT";
    int[] order = new int[3];
    public String sortType(String[] name, int[] age, int[] wt){
        this.name2 = name;
        this.age2 = age;
        this.wt2 = wt;
        this.name = (String[])name.clone();
        this.age = (int[])age.clone();
        this.wt = (int[])wt.clone();
        recurse(new boolean[3],0,"");
        return ret;
    }
    void recurse(boolean[] used, int index, String s){
        if(index==3){
            sort();
if(Arrays.equals(name2,name) &amp;&amp; Arrays.equals(age2,age) &amp;&amp; Arrays.equals(wt2,wt)){
                if(ret.equals("NOT")){
                    ret = s;
                }else ret = "IND";
            }
        }
        for(int i = 0; i&lt;3; i++){
            if(!used[i]){
                order[index] = i;
                used[i] = true;
                recurse(used,index+1,s+let.charAt(i));
                used[i] = false;
            }
        }
    }
</pre>
Granted, going to all the trouble to make it recursive is probably a bit overkill when there are only 6 possible orders.  However, if there were 5 variables, and 120 orders, it would make a lot more sense.  Also, I should note that another way to do the sorting would be to make a class that represented the triple, or in the case of C++, use pair, as gepa did in his code (in the practice room).  This allows you to use the built in sort functions, and can make things a bit simpler.
</p> 

<font size="+2"> 
<b>UserId</b> 
</font><A href="javascript:infoWindow('/')"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
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
      143 / 146 (97.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      77 / 143 (53.85%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Ken Vogel</b> for 269.27 points (9 mins 49 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      199.05 (for 77 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 

Most of the time, if your code passes all of the examples on the easy problem, it will turn out to be correct.  However, this was not the case tonight, as a large number of coders missed a key piece of information in the problem statement, but not in any example.  If there were less than two letters (a-z or A-Z) in the first or last name you are supposed to return "BAD DATA".  However, a large number of coders didn't catch that there had to be two <i>letters</i> and instead only returned "BAD DATA" when there were less than two characters.  Aside from that subtlety though, most of the coders seemed to have the right idea on this problem.  Basically, you just need to generate all of the user ids, in the order specified, and keep going until you find a new one.  The best way to deal with the spaces and apostrophe's is to just remove them all at the very beginning of your code, and while you are at it, you might as well convert everything to lower case.  That makes it easy to find initials, and build the user ids.  The most straightforward way to do this, after that, is to handle the first two cases ([first initial][last name] and [first initial][middle initial][last name]) separately, and if they are both in use, then to have a for loop counting up the digits for the third case.  There are a couple of things to watch out for.  In particular, there may not always be a middle initial, and you may have to truncate the last name to ensure that the ids are less then 8 characters long.
</p> 

<font size="+2"> 
<b>DesertWind</b> 
</font><A href="javascript:infoWindow('/')"><img src="/i/rate_it.gif" width="60" height="18" border="0" hspace="10"/></A><br/> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1050 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      25 / 146 (17.12%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      15 / 25 (60.00%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ChristopherH</b> for 873.63 points (13 mins 20 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      632.90 (for 15 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

<p> 
This problem stumped me for a while.  I was too used to solving graph problems from start to finish.  But, as any expert maze solver will tell you, it is often simplest to work backwards.  Such was the case in tonight's hard, where the best way to solve the problem was to start by saying, if I am at an oasis, then I can get to an oasis in 0 days.  Beyond that, you should work backwards, keeping track of the distance to some oasis from each location on the map.  Finally, you should return the number of days from the location with the '@'.  <br/><br/>
To see exactly how to work backwards, its easiest to provide a few simple examples:<br/>
Say you were given the following map:
<pre>
    @ -
    * *
</pre>
You would start be labeling the '*' as 0.  Next, since there are two ways to get to a zero from the @, and the wind can only blow against you in one of these two directions, you will always be able to get to one of the oases in 1 day.  So, from this, we can see that if there are two directions from a point, each of which lead to a location marked with the same number of days, we are ensured that the wind will not be blowing against us in one direction.  Now, lets do a slightly more abstract example, say you have worked backwards, and have determined the following distances for each location other than the '@':
<pre>
    @ 2 ...
    1 3 ...
    ...
</pre>
The wind can only blow against you in one of the three available directions.  If it blows from any direction other than the south, you can move south in 1 day, and you will be one day away from an oasis.  If it blows from the south, you can move east in 1 day, and then be two days away from an oasis.  So, from the '@', the worst case is that it will take you 3 days.  Finally, the last case we will consider is this:
<pre>
    @ 5 ...
    1 5 ...
    ...
</pre>
Here, regardless of which direction the wind blows, it is best to go south.  In the worst case, it will then take us 4 days from the '@' sign.  From these examples, we can now generalize an algorithm to update the distances:
<pre>
    foreach location loc
        int closest = INF;
        int nextClosest = INF;
        foreach location adj that is adjacent to loc and is not an 'X'
            if(dist(adj))&lt;closest)
                nextClosest = closest
                closest = dist(adj)
            else if(dist(adj)&lt;nextClosest)
                nextClosest = dist(adj)
            end if
        end for
        dist(loc) = min(dist(loc),closest+3,nextClosest+1)    
    end for
</pre> 
Running the above code once will not give us the results we want, since it only updates the distances once, and many updates may be required.  But, if we run the above algorithm over and over, until none of the distances change any more, we will converge on the true distances, and we can simply return the distance at the location associated with the '@'.  Since each iteration is once step, and there is no reason to go to the same place twice, the most iterations we will need is less than 2500 (the worst case is about 1250 iterations).  For those who want a more complete algorithm, here it is in Java:
<pre>
public class DesertWind{
    public int daysNeeded(String[] map){
        int best[][] = new int[map.length][map[0].length()];
        for(int i = 0; i&lt;best.length; i++)
        for(int j = 0; j&lt;best[0].length; j++)
        if(map[i].charAt(j)=='*')
            best[i][j] = 0;
        else
            best[i][j] = 10000;
        boolean updated = true;
        while(updated){
            updated = false;
            for(int i = 0; i&lt;best.length; i++){
                for(int j = 0; j&lt;best[0].length;j++){
                    int n1 = 10000, n2 = 10000;
                    for(int dx = -1; dx&lt;2; dx++)
                    for(int dy = -1; dy&lt;2; dy++){
                        int xx = i+dx;
                        int yy = j+dy;
if(xx&lt;0||xx&gt;=best.length||yy&lt;0||yy&gt;=best[0].length||map[xx].charAt(yy)=='X')continue;
                        if(best[xx][yy]&lt;n1){
                            n2 = n1;
                            n1 = best[xx][yy];
                        }else if(best[xx][yy]&lt;n2){
                            n2 = best[xx][yy];
                        }
                    }
                    int n = Math.min(n1+3,n2+1);
                    if(n&lt;best[i][j]){
                        updated = true;
                        best[i][j] = n;
                    }
                }
            }
        }
        for(int i = 0; i&lt;best.length; i++)
        for(int j = 0; j&lt;best[0].length; j++)
            if(map[i].charAt(j)=='@')return best[i][j]&gt;=10000?-1:best[i][j];
        return -1;
    }
}
</pre></p>


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

