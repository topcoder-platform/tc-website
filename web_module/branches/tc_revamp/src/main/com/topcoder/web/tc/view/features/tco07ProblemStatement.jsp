<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Marathon Match</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="algo_match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<%--
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="Match Editorials Archive"/>
<jsp:param name="title" value="Problem Statement"/>
</jsp:include>
--%>

<table cellspacing="0" cellpadding="0" class="pageTitleTable">
    <tr>
        <td width="100%" class="pageTitle"><img border="0" src="/i/header_long_comps_topcoder.gif" alt="long_comps_topcoder"/></td>
        <td align="right" class="pageSubtitle">&#160;Problem Statement</td>
    </tr>
</table>



            <div align="center">

                <table><tr><td colspan="2"><h3>Problem Statement</h3></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><h2>Introduction</h2>
In this problem you will have to navigate a spaceship to a series of waypoints in a two dimensionsal universe with a few stationary planets.  Your goal is to visit all the waypoints, in order, as quickly as possible, but without using much fuel.  Along the way, you need to avoid crashing into the planets, while taking their gravity into account for navigation.
<h2>Universe Details</h2>
Each waypoint is defined by its x and y coordinates, while each planet is defined by its coordinates and its radius.  The mass of each planet is <tt>radius<sup>3</sup></tt> and standard physics equations are used to determine the movement of the ship.  You have a single thruster that can accelerate your ship in any direction at a rate of 1E-4. The acceleration on your ship due to the gravity of a single planet is 5E-6*m/dist<sup>2</sup>, where <tt>m = radius<sup>3</sup></tt> is the mass of the planet.  This acceleration is a vector in the direction of the center of the planet.  The sum of all the acceleration vectors at a particular point gives the acceleration on the ship.  Recall that to sum two vectors, you need only sum their components independently.<br></br><br></br>

The center of each planet will be chosen with x and y in [-15000,15000], with its radius in [200,1200].  Each waypoint will be chosen with x and y in [-10000,10000].  Your ship will start at (0,0).  There will be between 0 and 10 planets, and between 2 and 10 waypoints.  All choices will be uniform except for radius, which will be chosen as rand<sup>2</sup>*1000+200, where rand is a uniform number in [0,1].   Any planet that is too close to the start will be rejected and a new one will be generated.  In particular, if the distance to (0,0) is less than <tt>sqrt(0.05*r<sup>3</sup>)</tt> it will be rejected.  Also, any planet that touches another planet will be rejected.  Any waypoint generated within a planet (planets are generated first) will be rejected.  To summarize:
<pre>
0-10 planets in [-15000,15000]
radii in [200,1200]
2-10 waypoints in [-10000,10000]
G = 5E-6
thrust acceleration = 1E-4
gravity acceleration = G*r<sup>3</sup>/dist<sup>2</sup>
</pre>
<h2>Implementation Details</h2>

At the beginning of execution, your init method will be called, giving the details of all the planets and waypoints.  After this, getMoves will be called a number of times with your ships current position and velocity, as well as the index of the next waypoint you need to visit.  You should return a String[] where each element gives either a thrust direction and time, or just a drift time.  These commands will be executed in order, and the getMoves method will be called again.  Each element should either be formatted as "dx dy time" or just "time".  The first format gives the thrust direction and duration, while the second format tells how long to drift for.  If your ship comes within 100 units of the next waypoint, that waypoint is considered to be touched.  You may execute at most 10000 commands, and may use at most 10,000,000 units of time. Execution will continue until you give up (return {}), crash into a planet, run out of time, run out of commands, or touch all the waypoints.
<h2>Scoring</h2>
Your score will be based on how much fuel you use, how much time you take, and how many waypoints you touch.  You will only be scored based on the time and fuel you had used at the last waypoint you touched (so there is never a penalty for trying to go further).  Your base score will be time + fuel * 10, where fuel is the sum of your thrust durations, up to the last waypoint touched.  When computing the final score, relative scoring will be used.  If you touched at least one waypoint and as many as the person who touched the most (for a particular test case) you will get BEST/YOU points for that test.  Otherwise, you will get 0.
<h2>Simulation Details</h2>

Computing the exact location of the ship after some interval will be done numerically, using a somewhat complicated method.  The algorithm iteratively approximates and refines until it converges:
<ol>
<li> compute a<sub>x</sub>(t) and a<sub>y</sub>(t) -- the acceleration at time t</li>
<li> approximate x(t+h/2), y(t+h/2), x(t+h), and y(t+h), assuming that acceleration remains constant over this interval</li>

<li> compute a<sub>x</sub>(t+h/2), a<sub>y</sub>(t+h/2), a<sub>x</sub>(t+h), and a<sub>y</sub>(t+h) using the current positional values for x(t+h/2), y(t+h/2), x(t+h), and y(t+h)</li>
<li> fit a quadratic to the values from steps 1 and 3</li>
<li> integrate the quadratic twice to find new values for x(t+h/2), y(t+h/2), x(t+h), and y(t+h)</li>

<li> if convergence reached exit, else goto step 3</li>
</ol>
The only parameter in the above algorithm is h, the step size.  To produce faster, more accurate reults, this parameter is determined during the above execution.  In particular, it is chosen so that if the fitted quadratic is a(t) = U + V*t + W*t<sup>2</sup>, the value |W|*t<sup>5</sup>/12 = 1E-7.  This causes the effect of the second order term to be small, and when the second order term has a small contribution, the error from the missing third order term should be even smaller.  Here is the code used to simulate your ship.

<pre>
    /*
     * x, y, dx, dy, and wp describe the current situation
     * p and w give the planets and waypoints, while wp is the index of the next waypoint
     * MAX_CHANGE controls the error
     * when we simulate your code, we use 1E-7, 
     * however much larger results may work for most purposes
     * for instance, even 0.1 gives good results over a short period of time,
     * though the errors obviously accumulate to be huge in the long run
     *
     * tx and ty give the acceleration vector.  
     * It should have length 1E-4 or 0.
     *
     * The ship is then accelerated in that direction for time seconds
     *
     * The code is a bit complicated.  It runs a numeric simulation.
     * The idea behind the simulation is to approximate the acceleration equation with a 
     * quadratic equation over a small interval.  This can be integrated exactly.
     * The size of the interval depends on how crazy things are.
     */
    boolean move(double tx, double ty, double time){
        double expended = 0;
        while(expended &lt; time){
            //start with a small amount of time -- simulation should be pretty stable over 
            //this intereval, in all but the crazies situations
            double interval = 10;
            double fx = tx;
            double fy = ty;
            double closest = hypot(x-w[wp][0],y-w[wp][1]);
            for(int i = 0; i&lt;p.length; i++){
                double xd = p[i][0]-x;
                double yd = p[i][1]-y;
                double d = hypot(xd,yd);
                if(d &lt; p[i][2]){
                    //CRASH!
                    return false;
                }
                closest = min(closest,d-p[i][2]);
                double F = pow(p[i][2],3)/d/d*G;
                fx += F*xd/d;
                fy += F*yd/d;
            }
            //fx and fy are something like force vectors (though really acceleration vectors)
            //they give the vector at the start point
            double ax = 0, bx = 0, cx = 0, ay = 0, by = 0, cy = 0;
            double nfx1 = fx;
            double nfy1 = fy;
            double nfx2 = fx;
            double nfy2 = fy;
            //based on fx and fy, we approximate the ship's position interval/2 and interval seconds later
            double nx1 = x + dx * interval/2 + fx * interval*interval/8;
            double ny1 = y + dy * interval/2 + fy * interval*interval/8;
            double nx2 = x + dx * interval + fx * interval*interval/2;
            double ny2 = y + dy * interval + fy * interval*interval/2;
            //now comes the refinement
            for(int it = 0; it &lt; ITERATIONS; it++){//shouldn't even reach ITERATIONS (200)
                nfx1 = nfx2 = tx;
                nfy1 = nfy2 = ty;
                for(int i = 0; i&lt;p.length; i++){
                    double xd1 = p[i][0]-nx1;
                    double yd1 = p[i][1]-ny1;
                    double d1 = hypot(xd1,yd1);
                    double F1 = pow(p[i][2],3)/d1/d1*G;
                    double xd2 = p[i][0]-nx2;
                    double yd2 = p[i][1]-ny2;
                    double d2 = hypot(xd2,yd2);
                    double F2 = pow(p[i][2],3)/d2/d2*G;
                    nfx1 += F1*xd1/d1;
                    nfy1 += F1*yd1/d1;
                    nfx2 += F2*xd2/d2;
                    nfy2 += F2*yd2/d2;
                }
                //nfx1,nfy1 and nfx2,nfy2 give the acceleration vectors at two
                //positions: interval/2 and interval seconds later
                //now we fit a quadratic to the x and y directions, independently
                //so x(t) =~ ax + bx*t + cx * t * t
                //so y(t) =~ ay + by*t + cy * t * t
                ax = fx;
                bx = -(nfx2-4*nfx1+3*fx)/interval;
                cx = (nfx2-2*nfx1+fx)*2/interval/interval;
                ay = fy;
                by = -(nfy2-4*nfy1+3*fy)/interval;
                cy = (nfy2-2*nfy1+fy)*2/interval/interval;
                

                //here we adjust the time interval
                //the goal is for the change acceleration to be MAX_CHANGE

                double nt = pow(MAX_CHANGE/hypot(cx,cy)*12,.2);

                //don't go very far if close to a planet or waypoint
                double ttc = max(1,interval*closest/hypot(nx2-x,ny2-y));
                if(nt &gt; ttc){
                    nt = ttc;
                }

                //we ensure that we don't skip anything important by only
                //adjusting up by factors of 2
                if(nt &gt; interval*2)nt = interval*2;

                //always go at least 1
                if(nt &lt; 1)nt = 1;
                if(nt &gt; time-expended)nt = time-expended;
                double pt = interval;

                interval = nt;
                
                //finally we integrate twice to get a better approximation of
                //nx1,ny1 and nx2,ny2

                double onx2 = nx2;
                double ony2 = ny2;
                nx1 = x + dx * interval/2 + ax * interval*interval/2/4 + bx*interval*interval*interval/6/8 + cx*interval*interval*interval*interval/12/16;
                ny1 = y + dy * interval/2 + ay * interval*interval/2/4 + by*interval*interval*interval/6/8 + cy*interval*interval*interval*interval/12/16;
                nx2 = x + dx * interval + ax * interval*interval/2 + bx*interval*interval*interval/6 + cx*interval*interval*interval*interval/12;
                ny2 = y + dy * interval + ay * interval*interval/2 + by*interval*interval*interval/6 + cy*interval*interval*interval*interval/12;

                //convergence reached
                if(hypot(nx2-onx2,ny2-ony2) &lt; MAX_CHANGE*1e-2 &amp;&amp; abs(nt-pt) &lt; 1e-8){
                    break;
                }

            }
            x = nx2;
            y = ny2;
            dx += ax*interval + bx*interval*interval/2 + cx * interval * interval * interval / 3;
            dy += ay*interval + by*interval*interval/2 + cy * interval * interval * interval / 3;

            expended += interval;

            //check waypoints
            double wpd;
            if(wp &lt; w.length)wpd = hypot(x-w[wp][0],y-w[wp][1]);
            else wpd = 1e9;
            while(wpd &lt; 100){//I guess we might we hit two at once
                wp++;
                if(wp &lt; w.length)wpd = hypot(x-w[wp][0],y-w[wp][1]);
                else wpd = 1e9;
            }
        }
        return true;
    }

</pre>
<h2>Visualizer</h2>
The interface to the visualizer will work using standard in, out, and err, as in previous contests.  You will read the parameters from standard in and write your return to standard out.  First, you should read the parameters to init, in the same order as they appear in the function definition.  Each parameter will be placed on a line by itself, formatted as: "NUM_ELEMENTS ELEMENT<sub>1</sub> ELEMENT<sub>2</sub> ...".  Once you've read the parameters to init, you should print your first sequence of moves (the one you make will x=y=dx=dy=wp=0).  You should then read the parameters to the next call to the getMoves method, one per line, and output your sequence of moves, and so on.  Each time you output a a sequence of moves, you should first print the number of moves on a line by itself, and then the moves, one per line.  In code, this looks like:
<pre>
	readIntArray(){
		int length = readInt();
		ret = new int[length];
		for(int i = 0; i &lt; length; i++){
			ret[i] = readInt();
		}
		return ret;
	}
	main(){
		px = readIntArray();
		py = readIntArray();
		pr = readIntArray();
		wx = readIntArray();
		wy = readIntArray();
		moves = getMoves(0,0,0,0,0);
		while(moves.length &gt; 0){
			printLine(moves.length);
			for(int i = 0; i &lt; moves.length; i++){
				printLine(moves[i]);
			}
			x = readDouble();
			y = readDouble();
			dx = readDouble();
			dy = readDouble();
			wp = readInt();
			moves = getMoves(x,y,dx,dy,wp);
		}
	}

</pre>
Sample sequence of communication (the pare after the '#' or before the ':' is not part of the communication):
<pre>
SERVER: 1 10342        #px
SERVER: 1 -1044        #py
SERVER: 1 1234         #pr
SERVER: 2 44 -904      #wx
SERVER: 2 -19229 52    #wy
YOU   : 2              #moves.length
YOU   : 200            #first move
YOU   : 1 1 1000       #second move
SERVER: -23.11094      #x
SERVER: 3.3539         #y
SERVER: -1.50923E-6    #dx
SERVER: 0.000014948    #dy
SERVER: 0              #wp
YOU   : 1              #moves.length
...
</pre>
The password for the visualizer is marathon900

</td></tr><tr><td colspan="2">&#160;</td></tr><tr><td colspan="2"><h3>Definition</h3></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td>Class:</td><td>Navigator</td></tr><tr><td>Method:</td><td>getMoves</td></tr><tr><td>Parameters:</td><td>double, double, double, double, int</td></tr><tr><td>Returns:</td><td>String[]</td></tr><tr><td>Method signature:</td><td>String[] getMoves(double x, double y, double dx, double dy, int wp)</td></tr><tr><td colspan="2"<tr><td>&nbsp;</td></tr><tr><td>Method:</td><td>init</td></tr><tr><td>Parameters:</td><td>int[], int[], int[], int[], int[]</td></tr><tr><td>Returns:</td><td>int</td></tr><tr><td>Method signature:</td><td>int init(int[] px, int[] py, int[] pr, int[] wx, int[] wy)</td></tr><tr><td colspan="2">(be sure your methods are public)</td></tr></table></td></tr><tr><td>&#160;&#160;&#160;&#160;</td></tr><tr><td></td></tr><tr><td colspan="2">&#160;</td></tr><tr><td colspan="2"><h3>Notes</h3></td></tr><tr><td align="center" valign="top">-</td><td>Planets don't move.</td></tr><tr><td align="center" valign="top">-</td><td>All coordinates and radii are integers.</td></tr><tr><td align="center" valign="top">-</td><td>Your ship is treated as a point.</td></tr><tr><td align="center" valign="top">-</td><td>While the visualizer uses the same code as the servers, the floating point arithmetic is slightly different between the two versions.  Due to the chaotic nature of the problem, this can potentially lead to dramatic differences by the end of the game, for some solutions and test cases.</td></tr><tr><td align="center" valign="top">-</td><td>The visualizer may use scientific notation when writing floating point numbers.</td></tr><tr><td align="center" valign="top">-</td><td>The time limit is 60 seconds, and the memory limit is 1024M.</td></tr><tr><td align="center" valign="top">-</td><td>There are 50 regular tests.</td></tr><tr><td align="center" valign="top">-</td><td>Keep in mind that you don't have as much time as you are used to and that the way the scoring works, the most important thing is to hit waypoints.</td></tr><tr><td colspan="2">&#160;</td></tr><tr><td colspan="2"><h3>Examples</h3></td></tr><tr><td align="center" nowrap="true">0)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 1 there are 0 planets and 2 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">1)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 2 there are 9 planets and 5 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">2)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 3 there are 5 planets and 2 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">3)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 4 there are 7 planets and 9 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">4)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 5 there are 4 planets and 2 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">5)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 6 there are 9 planets and 10 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">6)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 7 there are 10 planets and 3 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">7)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 8 there are 1 planets and 9 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">8)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 9 there are 0 planets and 3 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr><tr><td align="center" nowrap="true">9)</td><td></td></tr><tr><td>&#160;&#160;&#160;&#160;</td><td><table><tr><td><pre>From seed 14 there are 8 planets and 8 waypoints</pre></td></tr><tr><td><table><tr><td colspan="2"></td></tr></table></td></tr></table></td></tr></table><hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc.  Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited.  (c)2006, TopCoder, Inc.  All rights reserved.  </p>

            </div>
        </td>

        
        <td width="170">
            



<script type="text/javascript" language="javascript">

</script>





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