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
        <HTML>
            <HEAD>
                <xsl:call-template name="Preload"/>
                <TITLE>TopCoder :: Statistics</TITLE>
                <xsl:call-template name="CSS"/>
                <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
                <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
                <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
                <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
            </HEAD>
            <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
                <xsl:call-template name="Top"/>
                <!-- Body Begins -->
                <TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
                    <TR>
                        <!-- Left Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
                            <!-- Left Column Include Begins -->
                            <!-- Global Seconday Nav Begins -->
                            <xsl:call-template name="global_left"/>
                            <!-- Global Seconday Nav Ends -->
                            <!-- Left Column Include Ends -->
                        </TD>
                        <!-- Left Column Ends -->
                        <!-- Gutter Begins -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->

                        <!-- Body Area -->
                        <!-- Center Column Begins -->
                        <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
                            <xsl:call-template name="BodyTop">
                                <xsl:with-param name="image1">white</xsl:with-param>
                                <xsl:with-param name="image">statisticsw</xsl:with-param>
                                <xsl:with-param name="title">&#160;TC Last Match Editorials</xsl:with-param>
                            </xsl:call-template>
                            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
                                <TR>
                                    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/>
                                        <BR/>
                                        <!--body contextual links-->
                                        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%">
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" BGCOLOR="#43515E" VALIGN="top">
                                                    <IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/>
                                                </TD>
                                            </TR>
                                            <TR>
                                                <TD VALIGN="top" BGCOLOR="#43515E" CLASS="moduleTitle">&#160; &#160;</TD>
                                                <TD BGCOLOR="#43515E" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
                                            </TR>
                                            <TR>
                                                <TD COLSPAN="2" VALIGN="top" BGCOLOR="#43515E">
                                                    <TABLE BORDER="0" WIDTH="100%" CELLSPACING="1" CELLPADDING="" BGCOLOR="#FFFFFF">
                                                        <TR>
                                                            <!-- <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC" HEIGHT="15"><A HREF="/?t=statistics&amp;c=srm104_prob" CLASS="bodyGeneric">&#160;Problem&#160;Set&#160;</A></TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><A HREF="/?t=statistics&amp;c=srm103_rookie" CLASS="bodyGeneric">&#160;Rookie&#160;Review&#160;</A></TD> -->
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="/index?t=statistics&amp;c=editorial_archive" CLASS="bodyGeneric">&#160;Archive&#160;</A>
                                                            </TD>
                                                            <TD VALIGN="middle" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC">
                                                                <A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">&#160;Comments/Ideas?&#160;</A>
                                                            </TD>
                                                        </TR>
                                                    </TABLE>
                                                </TD>
                                            </TR>
                                        </TABLE>
                                        <!--end contextual links-->
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="6" BORDER="0"/>
                                        <BR/>
                                        <!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->

                                        <P>
                                            <B>Problem Set Analysis &amp; Opinion</B>
                                        </P>
                                        <p>
                                            Div 1 had a rather rough set tonight, as only 1 person (SnapDragon) was able to solve all three problems successfully.  However, SnapDragon was rather slow on the hard problem, and despite being the only one to solve all three problems, he came in third.  It was lars, with the highest score on the hard, who took first place, pushing him up 184 rating points.  WishingBone was a close second, and moved up 93 points.  Div 2 had a rather easy set, and first timer TekGoNos won by a large margain.
                                        </p>
                                        <font size="+2">
                                            <b>NewPhone</b>
                                        </font>
                                        <BR/>
                                        Used as: Division 2 - Level 1:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">250</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">163 / 196  (83.16%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">112 / 163  (68.71%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>maximuscranius</b> for 245.17 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>

                                            The most obvious way to do this is with a stable sort.  A stable sort is one that preserves the order of elements with equal value.  In this problem, you want to stable sort phone numbers so that those which are called more often come first.  Then, you can just pick the first
                                            <b>spaces</b> numbers in your sorted array.  Another way to do this, which is perhaps simpler, is to loop backwards through all possible frequencies (the max is 1000), and add the numbers to an array as they are found.
                                        </p>
                                        <pre>
	String ret[] = new String[spaces];
	int ptr = 0;
	for(int i = 1000; i&gt;=0; i--) for(int j = 0; j&lt;freq.length &amp;&amp; ptr!=spaces; j++)
		if(freq[j]==i)ret[ptr++] = n[j];
	return ret;
                                        </pre>


                                        <font size="+2">
                                            <b>RunLengthEncode</b>
                                        </font>
                                        <BR/>
                                        Used as: Division 2 - Level 2:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">500</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">135 / 196  (68.88%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">89 / 135  (65.71%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Spike</b> for 478.75 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        Used as: Division 1 - Level 1:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">200</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">137 / 138  (99.28%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">127 / 137  (92.70%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Oblok</b> for 198.08 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>
                                            Most people had little trouble with this, and getting it correct was not algorithmically difficult.  Basically just check each character, and see if it is the start of a run of length greater than 4.  If it is, delete the run, and replace it with a slash and the number of characters in the run.  You could also do it by building a wholly new string out of the old one.
                                        </p>
                                        <pre>
	StringBuffer r = new StringBuffer(50);
	for(int i = 0; i&lt;input.length(); i++){
		int j = i;
		while(++j&lt;input.length() &amp;&amp; input.charAt(j)==input.charAt(i));
		if(j-i>4){
			r.append('/');
			r.append(new DecimalFormat("00").format(j-i));
			r.append(input.charAt(i));
			i = j-1;
		}else r.append(input.charAt(i));
	}
	return r.toString();
                                        </pre>

                                        <font size="+2">
                                            <b>GiftWrap</b>
                                        </font>
                                        <BR/>
                                        Used as: Division 2 - Level 3:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">1000</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">58 / 196  (29.59%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">25 / 58  (43.10%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>TekGoNos</b> for 774.59 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>
                                            Probably one of the easier div 2 hard problems.  There are three different ways that the package can be wrapped, corresponding to the three different dimensions of the box.  We can use each of the three dimensions as the dimension along which the seam runs after the paper is first wrapped around (the seam in step 3 of the diagram).  Thus, if the seam runs down
                                            <tt>dimension 1</tt>, then one of the dimensions of the paper must be
                                            <tt>1 + 2 * (dimension 2 + dimension 3)</tt> - enough to wrap around, and overlap by 1.  Note that we add one for the overlap, not two, because if the paper were just touching, we would only have to add 1 to one side of the paper to make it overlap by 1.  So, then we must see how long the paper must be to fold down on the ends.  Looking at the diagram provided, it should be clear that the overlap should occur along the longer dimension of the end that is folded over, across the shorter dimension.  So, then if the first seam was along
                                            <tt>dimension 1</tt>, the other two seams would cause the other dimension of the paper to be:
                                            <br/>
                                            <tt>dimension 1 + 2 * (1/2 + min(dimension 2, dimension 3)/2) = 1 + min(dimension 2, dimension 3)</tt>.
                                        </p>
                                        <p>
                                            So, if the first seam runs along
                                            <tt>dimension 1</tt>, then the paper's dimensions are:
                                            <br/>
                                            <tt>1 + 2 * (dimension 2 + dimension 3)</tt> by
                                            <tt>1 + dimension 1 + min(dimension 2, dimension 3)</tt>.
                                            <br/>
                                            <br/>Once you have this, you simply need to check that it is smaller than the paper given, and then follow the tiebreaker rules.
                                        </p>


                                        <font size="+2">
                                            <b>LongLine</b>
                                        </font>
                                        <BR/>
                                        Used as: Division 1 - Level 2:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">450</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">54 / 138  (39.13%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">3 / 54  (5.56%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Jumping John</b> for 250.63 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>
                                        <p>
                                            This was probably the hardest "450" ever.  Only three people were able to solve it successfully, perhaps due in part to a slightly misleading problem statement, but much more probably due to the algorithmic difficulty of the problem.  In response to the requests made in the round tables, here is a hint:  try to think about which points the line hits, both of whose coordinates are integers.
                                        </p>
                                        <p>
                                            Now, for the spoiler.  The key to this problem is GCD.  The first thing that we should do is divide
                                            <i>dx</i> and
                                            <i>dy</i> by gcd(
                                            <i>dx</i>,
                                            <i>dy</i>).  This guarantees that if we successively increment
                                            <i>x</i> and
                                            <i>y</i> by
                                            <i>dx</i> and
                                            <i>dy</i>, we will hit every point that the line segments hit.  As we increment, we have to wrap around, and count how many times we wrap around.  Each time we wrap around, we will form a new line segment.  When we get back to the point where we started (this is guaranteed to happen eventually), we are done.
                                        </p>
                                        <p>
                                            The two things to watch for are cases when we hit the corners, and the case when
                                            <i>dx</i> or
                                            <i>dy</i> is negative.  The easiest way to handle the negative case, in my opinion, is to simply flip things around so that nothing is negative.  The corner case can be handled by decrementing the return value by one when we get to a corner, which will never happen more than once.  But, this causes trouble for the case where
                                            <i>dx</i> or
                                            <i>dy</i> is 0, so we just handle that separately.
                                        </p>
                                        <p>
                                            In the end, the solution seems surprisingly simple, which is what led to the misleading points assignment.  The most common mistake seems to be the mishandling of the case where one or both of the directions is negative.  People also had trouble when the line ran along an edge.  There were also some solutions which timed out because they did not use division and modulus, but used addition and subtraction to accomplish the same thing.  Here is something similar to the way most people did it:
                                        </p>
                                        <pre>
	int w = in[0], h = in[1], sx = in[2], sy = in[3], dx = in[4], dy = in[5];
	if(dx==0||dy==0)return 1;
	if(dx&lt;0){
		sx = (w-sx)%w;
		dx = -dx;
	}
	if(dy&lt;0){
		sy = (h-sy)%h;
		dy = -dy;
	}
	int g = gcd(dx,dy);
	dx/=g;dy/=g;
	int ret = 0;
	int nx = sx, ny = sy;
	while(true){
		ret+=(nx+dx)/w + (ny+dy)/h;
		nx = (nx+dx)%w;
		ny = (ny+dy)%h;
		if(nx==0 &amp;&amp; ny==0)ret--;
		if((nx-sx)*dy == (ny-sy) * dx &amp;&amp; ret !=0)break;
	}
	return ret;
                                        </pre>
                                        <p>The above code is quite similar to all 3 successful submission, and was the easiest way to do it.  However, for those who are interested, there is also a constant time solution (well, actually it's logrithmic in the size of the numbers because of gcd, but constant with respect to the answer) to this problem.  The first thing to note in order to come up with this solution is that, unless the line hits a corner, the start location does not matter.  To see this, imagine that you start at some point in the square, and draw all of the line segments.  Then, if you shift the point one square to the right, all of the segments will shift one square to the right.  It should not be too hard to verify that if shifting causes a segment to hit a corner, the total number of segments decreases by 1, while if shifting causes no segment to hit a corner, when it did before, then the number of segments increases by 1.  So, this suggests that we should first start by calculating the number of segments in the case where none of the segments hits a corner.  To do this, consider how far the segment goes up, each time it goes across the paper.  A little algebra gives you
                                            <tt>w*dy/dx</tt>, or
                                            <tt>width*slope</tt>.  Now, lets consider this as a fraction of the total height, so divide by h to get
                                            <tt>(w*dy)/(h*dx)</tt>.  We represent this as a reduced fraction, which tells us how far up the paper we get, each time we go across it.  So, now observe that we will end up back where we started when we have gone across the paper an integer number of times, in both the
                                            <tt>x</tt> and
                                            <tt>y</tt> directions.  Thus, we want to find the smallest integer,
                                            <tt>n</tt>, such that
                                            <tt>n*(w*dy)/(h*dx)</tt> is an integer.  In other words, the smallest number of times we have to go across the paper in the
                                            <tt>x</tt> direction so that we have also gone across the paper an integer number of times in the
                                            <tt>y</tt> direction.  It is not hard to see that
                                            <tt>n</tt> is the denominator in the reduced fraction
                                            <tt>(w*dy)/(h*dx)</tt>.  Thus, the total number of segments is:
                                            <br/>
                                            <tt>n+n*(w*dy)/(h*dx)=number of times across in the x direction + number of times across in the y direction</tt>
                                        </p>
                                        <p>This brings us very close, but now we have to figure out if any of our segments hits a corner, in which case the answer is actually 1 less that calculated above.  To figure out if it crosses a corner, first figure out where it crosses
                                            <tt>x=0</tt> as a fraction of the total height.  If the denominator in this fraction is a factor of the denominator of the fraction we previously calculated, then some segment will hit a corner.  This is because of the property that, when
                                            <tt>n</tt> and
                                            <tt>d</tt> are relatively prime, there will be some x such that
                                            <tt>n*x % d = y</tt> for all integers
                                            <tt>y</tt> less than
                                            <tt>d</tt>.
                                        </p>
                                        <p>
                                            That was probably a bit confusing, but if you try to work it out yourself with a paper and pencil, it should become clearer.  Anyhow, here is the code:
                                        </p>
                                        <pre>
	int w = params[0], h = params[1], sx = params[2], sy = params[3], dx = params[4], dy = params[5];
	if(dx==0||dy==0)return 1;
	if(dx&lt;0){dx=-dx;sx=(w-sx)%w;}
	if(dy&lt;0){dy=-dy;sy=(h-sy)%h;}
	int g = gcd(dx,dy);
	dx/=g;dy/=g;
	int n = w*dy;
	int d = dx*h;
	g = gcd(n,d);
	d/=g; n/=g;
	int ret = d+n;
	int nsy = sy*dx+dy*(w-sx);
	int dsy = dx*h;
	g = gcd(nsy,dsy);
	dsy/=g;nsy/=g;
	if(d%dsy==0){
		ret--;
	}
	return ret;
                                        </pre>

                                        <font size="+2">
                                            <b>Layoff</b>
                                        </font>
                                        <BR/>
                                        Used as: Division 1 - Level 3:
                                        <blockquote>
                                            <table cellspacing="2">
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Value</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">1000</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Submission Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">13 / 138  (9.42%) </td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>Success Rate</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">11 / 13  (84.62%)</td>
                                                </tr>
                                                <tr>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>High Score</b>
                                                    </td>
                                                    <td class="bodyText" style="background: #eee;">
                                                        <b>lars</b> for 680.33 points
                                                    </td>
                                                </tr>
                                            </table>
                                        </blockquote>

                                        <p>If you know max flow, this problem should be pretty easy, although it may take a while to code.  If you don't know max flow, you were pretty much out of luck.  I'm not going to provide an in depth explanation of how max flow works, because it is a rather long explanation, and there are better resources for it.  The simplest algorithm to solve it is probably the Ford-Fulkerson Algorithm.</p>
                                        <p>First a brief explanation of what max flow is.  The problem is to find the largest possible flow from a designated source node,
                                            <tt>s</tt>, to a designated sink node,
                                            <tt>t</tt>, in a directed graph.  Each edge in the graph has some capacity, and any number of units of flow up to that capacity may be pushed along that edge.  Furthermore, for all nodes other than
                                            <tt>s</tt> and
                                            <tt>t</tt>, the incoming flow must be equal to the outgoing flow.
                                        </p>
                                        <p>So, how is this problem max flow?  Well, each position has some capacity, so add a node for each position, and draw a directed edge from that node to the sink, with a capacity equal to the number of positions of that type.  Thus, for each type of position, we have one node.  Similarly, for each type of person, we add a node, and draw an edge from the source to that node, with capacity equal to the number of that type of person.  This ensures that the flow out of each person node will be at most the number of people that the node represents, and the flow out of each position node will be at most the number of positions that node represents.  The crucial step is then to connect people to positions.  For each type of person, we check each type of position and see if that type of person can do that type of job.  If they can, then we add an edge of infinite capacity from the person's node to the position's node.  It doesn't have to be infinite capacity, anything greater than 1000 will work in this case.  Now, we run max flow, and return the number of people minus the flow.  Since the incoming flow at each node other than the source and sink is equal to the outgoing flow, no person is assigned to more than one position, and no position is assigned to more than one person.  And, if we draw all of our edge correctly, the max flow gives us a maximal assignment of people to positions.
                                        </p>
                                        <p>
                                            So, assuming that you get the max flow part correctly, you then only have to determine how to draw edges from people to positions.  This can be done be examining the strings related to each person and position in a pair wise fashion.  If the person has a superset of the skills that the position requires, and his security clearance is greater than or equal to that required, then he can do the job.
                                        </p>

                                        <IMG SRC="/i/m/lbackstrom_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
                                        By&#160;lbackstrom
                                        <BR/>
                                        <DIV CLASS="smallText">
                                            <I>TopCoder Member</I>
                                            <BR/>
                                            <A HREF="/tc?module=MemberProfile&amp;cr=159052" CLASS="smallText">Author Profile</A>
                                        </DIV>
                                        <BR CLEAR="all"/>
                                        <P>
                                            <BR/>
                                        </P>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" WIDTH="75">
                                        <IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                                <TR>
                                    <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14">
                                        <IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                    <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10">
                                        <IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/>
                                    </TD>
                                </TR>
                            </TABLE>
                        </TD>
                        <!-- Center Column Ends -->
                        <!-- Body Area Ends -->

                        <!-- Gutter -->
                        <TD WIDTH="4" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                        <!-- Right Column Begins -->
                        <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top">
                            <IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/>
                            <BR/>
                            <!-- <A HREF="/?&amp;t=sponsor&amp;c=link&amp;link=http://idenphones.motorola.com/iden/developer/developer_home.jsp&amp;refer=srm98"><IMG SRC="/i/motorola_sidebar1.gif" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A>
                            <A href="Javascript:sponsorLinkWindow('/?&amp;t=sponsor&amp;c=link&amp;link=/contest/citrix/index.html&amp;refer=srm91_room1','Citrix','1','1','680','489')"><img src="/i/citrix_sidebar.jpg" ALT="" WIDTH="171" HEIGHT="117" BORDER="0"/></A><BR/>
                            <A HREF="/index?t=schedule&amp;c=tourny_sched"><IMG SRC="/i/tournament/sun_small_banner2.gif" ALT="" WIDTH="170" HEIGHT="84" BORDER="0"/></A> -->
                            <!-- Right Column Include Begins -->
                            <xsl:call-template name="public_right_col"/>
                            <!-- Right Column Include Ends -->
                        </TD>
                        <!-- Right Column Ends -->
                        <!-- Gutter -->
                        <TD WIDTH="10" BGCOLOR="#FFFFFF">
                            <IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/>
                        </TD>
                        <!-- Gutter Ends -->
                    </TR>
                </TABLE>
                <!-- Body Ends -->
                <xsl:call-template name="Foot"/>
            </BODY>
        </HTML>
    </xsl:template>
</xsl:stylesheet>
