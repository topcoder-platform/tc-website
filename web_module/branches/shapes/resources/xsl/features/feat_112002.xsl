<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/practice_room.xsl"/>
  <xsl:import href="../includes/modules/calendar.xsl"/>
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Features</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY>
        <xsl:call-template name="Top"/>
<!-- Body Begins -->
<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
	<TR>
    <!-- Left Column Begins -->
		<TD WIDTH="180" VALIGN="top">
<!-- Left Column Include Begins -->	
    <!-- Global Seconday Nav Begins -->	
        <xsl:call-template name="global_left"/>
	<!-- Global Seconday Nav Ends -->	
<!-- Left Column Include Ends -->    		
	  	</TD>
	<!-- Left Column Ends -->
	<!-- Gutter Begins -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
	<!-- Center Column Begins -->	
		<TD CLASS="bodyText" WIDTH="100%" BGCOLOR="#FFFFFF" VALIGN="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">features</xsl:with-param>
  <xsl:with-param name="title">&#160;TopCoder Feature</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
				<TR>
					<TD VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
					<TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>          
					<TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#FFFFFF">
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="21" BORDER="0"/></TD></TR>						
						<TR><TD VALIGN="middle" CLASS="bodyText" COLSPAN="2">
<!-- <IMG SRC="/i/f/feat_050102_tn3.jpg" ALT="" WIDTH="100" HEIGHT="150" HSPACE="10" VSPACE="3" ALIGN="right" BORDER="0"/> -->

<P><FONT SIZE="5" COLOR="#000000" FACE="tahoma, verdana"><B>The eight seconds of death: <BR/>tips on preventing timeout</B></FONT><BR/>
<!-- <I>"If you take it slow you'll move up."</I><BR/><BR/> -->
Wednesday, November 20, 2002<BR/>
By&#160;leadhyena_inran,<I>TopCoder Member</I><BR/>
</P>

<P>
I remember Round 3 of the 2002 Invitational vividly: I was doing rather well going into challenges, 
having submitted all three problems, and I felt confident about my solutions. Then <B>NDBronson</B> 
challenged my 900 (having one of the best challenge percentages in TopCoder, he easily caught my bug), and 
I failed a challenge, so I was slightly bummed coming out of the challenge phase, but I still had some 
hope. That's when <B>NDBronson</B> told me to check out Room 5.
</P>

<P>
There, <B>ZorbaThut</B> had challenged four people in his room successfully by using a timeout case, a 
type of challenge designed to make your code run longer than 8 seconds. Immediately my heart sank
 because I KNEW my code wouldn't survive it... not only had I lost all hope of making it into the 
 final online round, but I lost 101 rating points. It was then that I fully realized the power 
 of a timeout case and the perils of programming code that must run in an 8 second window.
</P>

<P>
So how do you avoid timeout? Well, one way to do it is to learn about computational complexity,
 and you'll find that a good proportion of the upper-level coders on TopCoder are fluent in this
  field of computer science. But computational complexity is a humongous can of worms, and as 
  long as you understand the basics as they apply to the competitions, you can skip the theory 
  and still do reasonably well. I will attempt to cover some of these basics below. 
</P>

<P>
<B>Know the Magic Number:</B>
</P>

<P>
The magic number is one of the most important concepts involved in avoiding timeout. Start off by doing the following: go into any practice room and type in the following, or its C++/C# equivalent:
</P>

<PRE>
public class /*class signature*/{
	/*method signature*/{
for(int i=0; i&lt;1000000000; i++);
return 0;//or appropriate for method signature
}
}
</PRE>
<P>
You're not writing this program to pass systests, but rather to judge the power of the server running your code. As an exercise, test this program and adjust that 1000000000 figure to fit in exactly less than 8 seconds (I got around 1.085 billion without timing out). This is to illustrate a basic fact: in any contest solution you can perform up to a billion simple operations. That's the magic number; never forget it.
</P>
	
<B>Judging the cost of expensive primitives:</B>

<P>
The magic number is the number of simple operations that can be performed before timeout. But not every operation is simple, and many of your language's primitive operations may not be so simple. Try the same experiment above in Java with this line inside the loop:
</P>

<P>
	<PRE>String temp = "test" + (i%10);</PRE>
</P>

<P>
	You will find the "magic number for Strings" is a lot less than the real magic number: around 3,900,000. Making a String is a time consuming task, and with this code you end up doing that with every loop. With some basic division you will see that creating this String costs us about 250 "steps" towards our magic number. In comparison the lines:
</P>

	<PRE>Outside the loop: StringBuffer test = new StringBuffer("test0");
	Inside the loop: test.setCharAt(4,(char)('0'+(char)(i%10)));</PRE>

<P>
which does essentially the same thing only costs us about 27-28 "steps". This is why some of the Java programmers will convert Strings to StringBuffer for speed considerations: StringBuffer does things differently internally than String does and although StringBuffer is sometimes more cumbersome to manipulate if running into time problems, this could be an easy way to speed up your code quickly.
</P>

<P>
Much like using StringBuffer instead of String,  Java has many other classes that have more than one implementation. The Collections Framework, which makes it even easier to swap between implementations, is a great example of this format: it has interfaces for Lists, Sets, and Maps, and the implementations are classes that allow for different optimizations for the same collections. 
</P>

<P>
<B>Using the Magic Number:</B>
</P>

<P>
	Remember that every operation will take at least one step. Thus, if you end performing more than 1 billion operations, no matter what these operations are, you will eventually timeout. Likewise, if you know that at worst case your program will run 2000 operations, and each of them will take less than 250 steps apiece, you can be pretty sure that your code won't timeout. Getting a feel for the number of operations and the number of "steps" each of those operations will take will give you a good estimate as to how long your code will take to run.
</P>

<P>
	Loops are the easiest pieces of code to evaluate for time: the number of "steps" a loop uses is equal to the number of "steps" inside the loop times the number of iterations. The numbers can creep up on you quickly, especially when you nest deeply: I remember a devilish patch of code for which I had wanted to use 6 nested for loops, all of which had the potential of iterating 50 times, which at worst case is 50^6 or about 15.5 billion, well beyond the magic number. Therefore I realized that I needed a more elegant approach than the brute force.
</P>

<P>
And yet, sometimes-brute force is sufficient to solve a problem. To be sure before you code, make some gross estimate by figuring out in your head how many "steps" your code will have to make. (Taking time to plan what you're coding beforehand will save you coding time as well as execution time, and in general it's a good strategy). If it's well under a billion, don't even bother. Good examples of this case are string manipulation problems, where most of the time you won't ever pass 1000 operations, and thus have no chance of breaking the magic number.
</P>

<P>
<B>Optimizing your nested loops:</B>
</P>

<P>
	So let's say that you make the mistake of coding that six-level nested loop mentioned above. You're timing 
	out on a test and you have 10 minutes left to fix the code. Trying a new approach is totally out of the 
	question; you have to stick with the nested loops. So, what do you do? Fortunately there are several 
	ways you can possibly optimize those nested loops in order to get them to work.
</P>

<P>
	First off, check to see whether or not you're covering too much ground. Your nested loops may be 
	testing twice as many cases as they need to be. Look for symmetry in the space of values covered 
	in the nested loop. Testing unordered pairs of values in an array is a prime example: if you test 
	in a loop like for
	<PRE>(int i=0;i&lt;vals.length-1;i++)for(int j=i+1;j&lt;vals.length;j++) </PRE>
	you end up cutting your operations in half. 
</P>


<P>
	Second, if you've finished the job that the loop was performing, break out of the loop. This is particularly useful in searches: If you find the case you're searching for or if it can be determined that continuing the search would be pointless, then there's no reason to continue the search. There were many instances of blanket searches in change algorithms used in SRM 120's Vending problem that would timeout because they wouldn't exit the loop after finding the correct change, or worse, would search all these cases that were already over the amount being changed, when one single cleverly placed "if(condition)break;" statement would have saved their code against timeout.
</P>

<P>
	Finally, you can optimize a nested loop just by changing around the method of computation in the innermost loop. Remove computations that you don't need. Remove your debugging println statements (it is easy to forget about these, and they cost loads of precious time). Try not to create objects inside of a nested loop if you can help it (Object creation is notoriously slow, especially in Java where you have to worry about garbage collection). Remember that all operations in the innermost part of a nested loop are extremely magnified time wise and that every little bit of time you can shave off there can make a big difference when fighting against the magic number.
</P>

<P>
<B>Never calculate twice: Optimizing recursion</B>
</P>

<P>
	Recursion can be a very optimal solution for many problems, and it is sometimes ridiculously easy to write. However, recursion is very costly when you repeat states, or when you perform the same calculation over and over. This is exactly what happened to me in Round 3 with the Ski Slopes problem: I had used recursion to determine the difficulty, and had inaccurately estimated the number of steps in the worst-case scenario.  The key to estimation is noting that without some way of pruning, the worst case for a recursion is the number of times you execute yourself in the code raised to the power of however many levels you go down. I didn't realize you could have 50 levels of slopes, each slope feeding into the five below it, taking 545 steps, which is nightmarishly above the magic number.
</P>

<P>
It's easy to fix this kind of recursion timeout with a simple cache of already calculated values. Just by keeping a store of your previously calculated values in a static collection variable inside the function you reduce the number of times you need to descend to atomic values, and you actually benefit from "crossing over yourself" on your way down. I call this approach safe recursion and many times it can save you from a timeout bind just by adding a few lines to your current recursive solution. The only thing you have to be careful of when you do this is that the number of possible subproblems isn't too large, or you'll "flood the safe" of cached values and timeout anyway.
</P>

<P>
<B>Learn new algorithms</B>
</P>

<P>
One of your best weapons in the war against timeout is education. You can learn a lot of fresh approaches to problems from a good algorithms book. This is because there has been half a century of concentrated analysis on algorithms, and most of the posers of problems have already been thought up and optimized to death. Sometimes you can learn a whole new approach to coding from these books, such as dynamic programming.
</P>

<P>
I assume most people in TopCoder are familiar with the concepts of recursion, but not many are as familiar with dynamic programming(or DP for short). The best way for me to illustrate DP is in comparison with recursion. Recursion builds a return from starting at the most complex part of the computation and breaking it up into smaller identical problems, which can be broken up the same way, etc., knowing that eventually after enough fracturing of the problem you'll hit atomic properties that can be returned immediately, and then the stack of recursive calls eventually builds the value. The point is: recursion starts from the complex and reaches the simple. DP does exactly the opposite: it starts with atomic values and builds up to complex answers, eventually hitting the requested answer on the way up. 
</P>

<P>
A textbook example of DP is Pascal's Triangle: you start at the top with 1(your atomic value), build the next row from that, and then the next row and so on until you reach the coefficients for the binomial expansion of (x+y)^n that you're looking for. This is the essence of DP: you start simple and through layers of computation you get to the correct value. You can see how DP is tailored for problems that cross over themselves: it builds these values first and they never get the chance to become problematic. Try calculating values in Pascal's Triangle using uncached recursion in a competition and you'll find yourself challenged with a timeout case.
</P>

<P>
<B>Use the limitations of the problem.</B>
</P>
	
<P>
	Many times it is because of timeout that problem writers are required to create limits on the inputs to their questions. Examining these limits can give you a very good idea what algorithm the writer had in mind, thus steering you clear of timeout. For example: say a program is looking for a subset of values in an array that has the greatest sum without going over a specified limit. If the size of the array is limited to 20 but the specified limit can be any positive integer up to a billion, then dynamic programming may not work in the traditional sense because you'd potentially create 21 billion values or 20 times too slow. In this case, it's best to just brute force your way through every subset for there are 2^20 or just over a million cases. However, if the array size is allowed to be up to 50 but the limit is to be kept under 10000, you can't brute force it (2^50 is much greater than 1 billion) , but dynamic programming is feasible (only 500,000 values is well under 1 billion). 
</P>

<P>
<B>Practice, practice, practice...</B>
</P>
	
<P>
	The best advice to follow when learning how to detect and protect yourself from timeout is to practice and experiment as much as you can in the practice rooms. Try writing bloated code and see if you can fix it. Try using classes and algorithms you haven't used before. Try writing three or more different solutions for the same problem and compare how much time each one takes. Always keep in mind how many "steps" your code takes in producing a return value, and always look for ways to optimize your code. Through constant vigilance and study you can hopefully avoid the 8 seconds of death.
</P>

<IMG SRC="/i/m/leadhyena_inran_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;leadhyena_inran<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/stat?c=member_profile&amp;cr=282560" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
      
<P><A HREF="mailto:editorial@topcoder.com" CLASS="bodyGeneric">Would you like to write a feature?</A></P>
						</TD></TR>                                                                 
					</TABLE>
		<P><BR/></P>
					</TD>
					<TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
				</TR>
				<TR>
					<TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
				</TR>   	
				<TR>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>	
				<TR>
					<TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
					<TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
				</TR>
			</TABLE>
		</TD>
	<!-- Center Column Ends -->
<!-- Body Area Ends -->

	<!-- Gutter -->
		<TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	<!-- Right Column Begins -->
		<TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><BR/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->       
        </TD>
	<!-- Right Column Ends -->
	<!-- Gutter -->
		<TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
	</TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>

