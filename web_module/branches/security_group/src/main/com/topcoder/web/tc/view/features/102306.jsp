<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<jsp:include page="/script.jsp"/>
<jsp:include page="/style.jsp">
<jsp:param name="key" value="tc_main"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>

<style type="text/css">
.codeBox
{
   width: 600;
   padding: 10px;
   margin: 20px;
   color: #333;
   font-size: 11px;
   font-weight: normal;
   line-height: 14px;
   background-color: #EEEEEE;
   border: 1px solid #999;
    }
</style>

</head>

<body>

<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="features"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td width="100%" align="left" class="bodyColumn">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="features"/>
    <jsp:param name="title" value="&#160;"/>
</jsp:include>


<div class="linkBox">
    <A href="/tc?module=Static&d1=features&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <tc-webtag:forumLink forumID="506153" message="Discuss this article" />
</div>

<span class="bigTitle">A Number or a String:  <br>Parsing Your Input and Formatting Your Output in C++</span>
<br><br>

<div class="authorPhoto">
    <img src="/i/m/Nickolas_big.jpg" alt="Author" />
</div>
<div class="authorText">
  By&#160;<tc-webtag:handle coderId="15635590" context="algorithm"/><br />
      <em>TopCoder Member</em>
</div>

<br clear="all">

<span class="subtitle">Introduction</span><br>
While TopCoder problems are generally hard enough to solve as is, sometimes their solution is complicated with the necessity of extra data conversion: parsing input strings into numerical data to be processed, or formatting the final result as a string of special format.
<br><br>
Such transformations are not as simple as they seem; if worst comes to worst, they can prevent one from solving the problem, and even the easiest cases can take enough time to lose precious points. At one point, while working on one of the Google CodeJam practice problems, I found myself just giving up after an extremely boring hour of parsing input without ever starting the solution itself.
<br><br>
This article is focused on main fast-to-type and convenient means of parsing input and formatting output in cases that are typical for TopCoder problems. All methods are specific to C++, but Java and VB coders may find several helpful ideas.
<br><br>

<span class="subtitle">Typical problems</span><br>
The problem of parsing input arises when you are given a string (or a set of strings) of a given format that contains data you will need for your computations. The following parsing cases are the most frequent in TopCoder problems:
<ul>
<li>String fragmentation problem: The given string contains several text fragments separated with delimiters, and you need to get all fragments. From here on we assume that the delimiters are sequences of spaces, while text fragments consist of letters and a certain set of special characters. This assumption is legitimate, since otherwise we can scan the string, replace special delimiters with spaces, and replace spaces that are part of the text with some "exotic" character like '&amp;' that wouldn't normally appear in the text. In that case after the fragmentation you will need to scan the result and to replace the "exotic" characters with spaces before later processing.</li>
<li>Numbers extracting problem: The given string contains some numbers and some non-numerical information -- you need to extract the numbers, and possibly the other data. If you can neglect the dividers, this problem is the same as the previous one after you have replaced all the non-digit characters with spaces. If not, you will need some other means of extracting every part of the string.</li>
<li>Data conversion problem: The given string contains a notation of a number (not necessarily decimal), which you need to get. This problem usually arises after string fragmentation, in situations when you need to convert some of the leftover text fragments into numbers.</li>
<li>Time parsing problem: The given string contains a notation of time in a given format (usually "HH:MM"), and  you need to get hours and minutes or convert them to minutes only. This problem can be solved easily with any of the general-purpose methods and several special ones, which will be considered separately.</li>
<li>Mixed problem: There are a variety of other parsing situations you might encounter, most of which can be broken-down to the cases listed here. For example, you might know the position of the wanted number in the string, or the exact format of the string, and so forth.</li>
</ul>

One case we won't consider here is one that comes up fairly regularly in TopCoder problems -- a set of strings representing a pattern, maze, or game field, in which each character is a significant part of the whole. Cases like this must be parsed character-by-character, and usually no improvements can be done.
<br><br>
Problems in formatting outputs arise when you need to produce the output as a string of a particular format while including the results of numerical computations. Generally speaking, there are fewer commonly used formatting cases, including:
<ul>
<li>Writing integers: You need to represent a given integer as a string containing its notation (decimal or not).</li>
<li>Writing doubles: You need to represent a given double as its notation, usually with a certain number of fractional digits using a set truncation procedure.</li>
<li>Mixed problem: The output should be a sequence of strings and numbers composed in a certain order. The problem of formatting time is a nice example of such problems, though it has some problem-specific methods, too.</li>
</ul>

<span class="subtitle">Methods of attack</span><br>
<ul>
<li>Manual parsing and formatting: As its name implies, this method involves parsing the string manually, character by character, keeping in memory all possible sequences and the current parser position within them. This method is considered only for several problems in this article; because its implementation greatly depends on the string format, is usually time- and mind consuming, and is extremely error-prone, it is strongly recommended that you use something else. The only exception I can see is the task of parsing and formatting time, since here the string format is quite simple and both parsing and formatting can be done in one line. See the "managing time" section below for more information.</li>
<li>Using special functions: There are a great deal of functions that have been created for data conversion and string fragmentation. Some of them accomplish only data conversion tasks like those described above, but others can have wider applications. For example, strtod can be used for number extracting if the numbers are separated with spaces, and sscanf can parse a string of almost any format. Sometimes search functions can be helpful for half-manual parsing, e.g. find_first_of and find_first_not_of methods of class string. This write-up contains no specifications or detailed descriptions of the existing special functions &mdash; for more information, consult MSDN or any IDE Help.</li>
<li>Other methods: These include methods that originally were not meant for data conversion or string parsing, but can be used rather efficiently. Stringstream is a representative of this group. The &#8230;stream family was designed as a tool for managing streams of data, but by representing the string you need to parse as a stream of characters you can work wonders. The main idea is that characters in the stream can be part of a string, or a number notation, or single characters, and all the &#8230;stream routines manage them all freely. In some cases stringstream's settings are rather complicated, but it's a universal means of parsing and formatting. Among leading coders, misof is an adherent of using stringstreams for simple things, having mentioned that they are "slow (as in runtime) but convenient". tomek uses istringstream for data conversion string to integer. On the other hand, bmerry considers stream classes uncomfortable because they require a temporary variable with a long typename, and because it is hard to remember all the parameters used for weird formatting. This article provides enough examples, below, that you should be able to see the value of stringstream for yourself.</li>
<li>Pre-written templates: The use of pre-written templates is discussed below, along with several tips for writing your own template.</li>
</ul>
Now that we have reviewed different methods for parsing and formattings, let's see how are they are applied to some typical TopCoder situations.
<br><br>

<strong>String fragmentation problem</strong><br>
We are given string s, and we need to get and process all the text fragments it consists of. We assume that delimiters are spaces, though this assumption is essential only for the last approach (which uses stringstream).
<br><br>
This problem allows manual parsing, though the corresponding code is rather lengthy.

<pre class="codeBox">
	string tmp="";
	int i=0;
	s+=" ";	//so that we needn't check the last text fragment separately
	while (i&lt;s.size())
	{ if (s[i]==' ') 		//check if the current char is a delimiter
	   { if (tmp.size()&gt;0)
	      { // process the current fragment tmp
	      }
	   } 
	  else tmp+=s[i];
	  i++;
	}
</pre>

Using string type member functions find and find_first_not_of for searching the beginnings of spaces and text fragments makes the solution smarter.

<pre class="codeBox">
	string tmp;
	int j=0,i=s.find_first_not_of(" ",j);
	while (i != string::npos)
	{  j=s.find(" ",i);			//first argument here...
	   tmp=s.substr(i,j-i);
	   i=s.find_first_not_of(" ",j);	//...and here is a string of delimiters
	   // process the current fragment tmp
	}
</pre>

Special function strtok searches delimiters in a string and replaces them with null character (one delimiter at a time):

<pre class="codeBox">
	char *st,*buf, sep[]=" .,";		//sep is a string of delimiters
	buf=strdup(s.c_str());
	st=strtok(buf,sep);
	while (st)
	{ //process the current fragment st
	  st=strtok(0,sep);
	}
</pre>

The solution that uses stringstream is the shortest and the smartest:

<pre class="codeBox">
	string tmp;
	stringstream a;
	a&lt;&lt;s;
	while (a&gt;&gt;tmp)
	{ //process the current fragment tmp
	}
</pre>

<strong>Extracting numbers</strong><br>
We are given string s, and we need to extract and process all integers it contains.
<br><br>
First we consider that we can neglect all other characters (like in <A href="/stat?c=problem_statement&pm=3075&rd=5866">HiddenNumbers</A> (SRM 220, Div1 Easy, Div2 Medium). Then we can replace all characters except for numbers with spaces, and trim ending spaces:

<pre class="codeBox">
	for(int i=0;i&lt;s.sz;i++)
	  if ((s[i]&gt;'9')||(s[i]&lt;'0')) s[i]=' ';
	s.erase(s.find_last_not_of(" "));
</pre>

Then we can use one of these approaches:
<ul>
<li>get numbers as text fragments, as described above, and then convert each into a number with an appropriate function;</li>
<li>use another approach based on the fact that the text fragments we need are numbers.</li>
</ul>

The following are several examples of extracting data as numbers. The first is based on the strtod function, which returns not only the extracted number but also the position of the character that stopped scanning the string:

<pre class="codeBox">
	char *tek,st[20];
	int i;
	strcpy(st,s.c_str());
	tek=st;
	while (tek-st&lt;s.sz)
	{ i=strtod(tek,&amp;tek);
	  // process the current number i
	}
</pre>

The next is stringstream based, and doesn't even need to trim ending spaces:

<pre class="codeBox">
	int i;
	stringstream a;
	a&lt;&lt;s;
	while (a&gt;&gt;i)
	{ //process the current number i
	}
</pre>

The third uses the special functions strtok and atoi:

<pre class="codeBox">
	char *st,*buf, sep[]=" ";
	int i;
	buf=strdup(s.c_str());
	st=strtok(buf,sep);
	while (st)
	{ i=atoi(st);
	  //process the current number i
	  st=strtok(0,sep);
	}
</pre>

If we need each piece of information that the string contains, we'll need some more information about the string format to be sure that we're getting the right pieces. Let's examine the parsing task in the <A href="/stat?c=problem_statement&pm=2272&rd=4710">SimpleCalculator</A> (SRM 178, Div2 Easy). Here we have an integer n1, a character sign and one more integer n2. The parsing here can look like:

<pre class="codeBox">
	sscanf(s.c_str(),"&#37;d&#37;c&#37;d",&amp;n1,&amp;sign,&amp;n2);
</pre>
or

<pre class="codeBox">
	stringstream A;
	A&lt;&lt;s;
	A&gt;&gt;n1&gt;&gt;sign&gt;&gt;n2;
</pre>

<strong>Data conversion string to number</strong><br>
We are given string s that is a notation of one number, and we need to extract this number into a variable d.
<br><br>
First, let's consider a situation when the number is an integer. There are a number of ways to get the d:

<pre class="codeBox">
	0) d=0;
	   for(int i=0; i&lt;s.size(); i++)
	   { d+=s[i]-'0';
	     d*=10; }
	1) d=atoi(s.c_str());
	2) sscanf(s.c_str(),"&#37;d",&amp;d);
	3) char *t;
	   d=strtod(s.c_str(),&amp;t);
	4) stringstream A(s);
	   A&gt;&gt;d;
</pre>

If we have a floating-point number, written in a standard way (i.e. not with a scientific notation, though many functions recognize that too) with an obligatory decimal point. Corresponding ways to get the number are:

<pre class="codeBox">
	0) d=0;
	   int pos=0, i;
	   for(i=0; s[i]!='.'; i++)
	     d=(d+s[i]-'0')*10;
	   pos=i;
	   i++;
	   for(; i&lt;s.size(); i++)
	     d+=(s[i]-'0')/pow(10,i-pos);
	1) d=atof(s.c_str());
	2) sscanf(s.c_str(),"&#37;f",&amp;d);
	3) stringstream A(s);
	   A&gt;&gt;d;
</pre>

<strong>Formatting doubles</strong><br>
We will consider the most common problem definition: we need to represent a positive double d as its notation with the given number of digits before and after decimal point. For simplicity sake let's assume that we need exactly 4 digits before the decimal point and 4 digits after (this task occurs in <A href="/stat?c=problem_statement&pm=3447&rd=5867">PointLifeGame</A> (SRM 221, Div2 Medium)).
<br><br>
Manual formatting is overly long and full of enumeration of possibilities that include round-up and adding leading and trailing zeroes. The sprintf function, however, is perfect for the task:

<pre class="codeBox">
	char st[10];
	sprintf(st,"&#37;09.4f",d);	//9 stands for total result length
	s=string(st);
</pre>

The stringstream can manage this task, too, though it takes several hard-to-remember flags:

<pre class="codeBox">
	stringstream A;
	A&lt;&lt;setw(9)&lt;&lt;setfill('0')&lt;&lt;fixed&lt;&lt;setprecision(4)&lt;&lt;d;
	A&gt;&gt;s;
</pre>

Other special functions yield worse results. The &#8230;toa family doesn't support conversion from doubles at all. ecvt and fcvt support either the total number of digits or the number of digits after decimal point -- but not both -- and neither of the functions actually writes the decimal point. You could use these with lots of extra work, like checking the actual position of the decimal point and inserting it by hand, but even manual formatting is probably preferable.
<br><br>
<strong>Managing time</strong><br>
Let's consider one more problem that is an example of parsing and formatting time. Given a string time that contains notation of time in format "HH:MM", we need to extract integer numbers of hours h and of minutes m (cases that include seconds, "am" or "pm" modifiers, or don't include hours should be processed the same way).
<br><br>
Manual parsing is short and elegant here, if we use the property of numeric characters:

<pre class="codeBox">
	h = (time[0]-'0')*10+(time[1]-'0');
	m = (time[3]-'0')*10+(time[4]-'0');
</pre>

Other approaches are not much smarter, because this task is extremely easy and can be performed in dozens of ways. For atoi the code is:

<pre class="codeBox">
	h = atoi( time.c_str() );
	m = atoi( time.c_str()+3 );
</pre>

For strtod it looks like this:

<pre class="codeBox">
	char *end;
	h=strtod( time.c_str(), &amp;end);
	m=strtod( time.c_str()+3, &amp;end);
</pre>

For sscanf we get:

<pre class="codeBox">
	sscanf( time.c_str(), "&#37;d:&#37;d",&amp;h,&amp;m);
</pre>

Using stringstream gives us:

<pre class="codeBox">
	stringstream s;	time[2]=' ';	s&lt;&lt;time;	s&gt;&gt;h&gt;&gt;m;
</pre>

Now let's consider a pair of integer numbers of hours h and minutes m, which we need to write to a string time as "HH:MM". This task is an example of writing an integer with leading zeros. Manual formatting is easy but comparatively long:

<pre class="codeBox">
	time="  :  ";
	time[0] = h/10+'0';
	time[1] = h&#37;10+'0';
	time[3] = m/10+'0';
	time[4] = m&#37;10+'0';
</pre>

The problem with using the special functions here is that some of them don't give you a chance to set the resulting string's width. Thus, if you choose to use itoa, you will need to add zeros manually:

<pre class="codeBox">
	time="";
	char hs[3],ms[3];
	itoa(h,hs,10);
	itoa(m,ms,10);
	if (strlen(hs)==1) time +="0";
	time +=string(hs)+":";
	if (strlen(ms)==1) time +="0";
	time +=string(ms);
</pre>

You can use fcvt with no digits after decimal point, but it will also need adding zeros:
<pre class="codeBox">
	time ="";
	int dec,sign;
	char *hs;
	hs=fcvt(h,0,&amp;dec,&amp;sign);
	if (strlen(hs)==1) time +='0';
	time +=string(hs)+":";
	hs=fcvt(m,0,&amp;dec,&amp;sign);
	if (strlen(hs)==1) time +="0";
	time +=string(hs);
</pre>

sprintf fulfils the task easily, though using it requires data conversion from char[] to string:

<pre class="codeBox">
	char st[6];
	sprintf(st,"&#37;02d:&#37;02d",h,m);
	time=string(st);
</pre>

Using stringstream, with its format functions, gives us:

<pre class="codeBox">
	#include &lt;iomanip&gt;
	stringstream A;
	A&lt;&lt;setw(2)&lt;&lt;setfill('0')&lt;&lt;h&lt;&lt;':'&lt;&lt;setw(2)&lt;&lt;setfill('0')&lt;&lt;m;
	A&gt;&gt;time;
</pre>

<strong>Should you use a template?</strong><br>
The appeal of using pre-written templates is that, if you have written all the functions you might need for parsing and formatting beforehand, all you will need to do during the Coding Phase is just choose the best one to use. 
<br><br>
This approach unites the advantages of other methods, and it is extremely handy. The disadvantage, though, is that when the template is written its author can't be sure that it covers all the parsing and formatting problems they will face during their coder career. (And, as I'm pretty sure that our problem writers' imaginations are far from exhausted, we should expect to encounter many more exotic parsing tasks.)
<br><br>
The sensible advice here is to take a compromise approach -- write a nice short template for cases that are hard to remember, and memorize some quick and multi-purpose methods for both typical and exotic cases.
<br><br>
Experienced coders (<tc-webtag:handle coderId="144400" context="algorithm"/>, <tc-webtag:handle coderId="270505" context="algorithm"/>, <tc-webtag:handle coderId="8355516" context="algorithm"/>, <tc-webtag:handle coderId="311170" context="algorithm"/>) include in their templates a function for string fragmentation into strings or integers, since such parsing tasks are the most frequent in TopCoder problems. Some coders, like bladerunner, have template functions for data conversion that encapsulate a call of some special function with the necessary temporary variables so that they needn't waste time on typing it. One can view their templates in any of their recent solutions. Taking the opposite approach is misof, who doesn't use a template at all; he remembers everything he needs by heart.
<br><br>
<strong>Beware</strong><br>
The problems of parsing and data conversion look rather simple once they are solved correctly, but they can still hold pitfalls. The following are several tricky cases.
<br><br>
If you are formatting a double as its notation with a given number of fractional digits, you will need to use some round-up algorithm implemented by the function you've chosen. Remember, though, that the function's round-up might be different from the one the problem statement asks for, so check the boundary cases carefully and consider writing a more complicated conversion.
<br><br>
Thus, in the <A href="/stat?c=problem_statement&pm=3447&rd=5867">PointLifeGame</A> (SRM 221, Div2 Medium) you need to round the result down to the nearest ten-thousands. In the <A href="/stat?c=problem_statement&pm=4470&rd=7221">PiCalculator</A> (SRM 246, Div1 Easy) "the last digit(s) should be rounded according to the standard rounding rules (less than five round down, more than or equal to five round up)". One more rounding-up problem might occur when working with negative doubles, though it is a rare case for TopCoder problems.
<br><br>
I wouldn't say that you should format the numbers manually, but using a certain combination of floor, ceil and constants like 0.49 before writing the number to a string might be helpful in case of special rounding rules.
<br><br>
Another pitfall is computational speed. Data conversion is a rather slow operation compared to numerical computations, so you shouldn't use them needlessly. For example consider the <A href="/tc?module=HSProblemStatement&pm=6433&rd=10024">ApocalypseSomeday</A> (TCHS SRM 2, Div1 Medium) problem. There are various ways to check whether the number contains "666" in its notation. If you convert the number into a string using stringstream and then search for "666" with find member function, you will run into the time limit on the maximum test.
<br><br>
You should also take into account the fact that using different methods of data conversion takes significantly different time. If we compare times of conversions string to integer using the described above methods, we can see that atoi is the fastest, sscanf is about 3 times slower, strtod is 4 times slower than sscanf, and stringstream is 9 times slower than strtod. Therefore, if you need several thousands of data conversions, you should weight the chosen function against others.
<br><br>
And finally, there exist problems concerned with parsing and formatting that aren't limited to them. Sometimes other knowledge is needed, or just reading the "Constraints" section carefully. Thus, in the <A href="/stat?c=problem_statement&pm=4470&rd=7221">PiCalculator</A> (SRM 246, Div1 Easy) you should notice that double and even long double type is not enough to store all 25 digits of Pi, so you will need to write

<pre class="codeBox">
	if (precision==1) return "3.1";
	if (precision==2) return "3.14";
	if (precision==3) return "3.142";
</pre>

&#8230;and so on.

<tc-webtag:handle coderId="8355516" context="algorithm"/> recalls a problem in which "some people had a problem with parsing, because they didn't notice that numbers can have more than one digit."
<br><br>
<span class="subtitle">Conclusion</span><br>
Different problems and pitfalls might be encountered in different parsing or formatting tasks, but, as misof pointed out, "the most common cause of mistakes is ... trying to do something by hand when there is a library function that does the job." A certain amount of practice is necessary for managing such tasks freely and confidently, however annoying it can be.
<br><br>
<span class="subtitle">Practice Room</span><br>
Listed below are a couple of TopCoder problems that illustrate the use of the parsing and formatting tasks outlined above. Some of them were mentioned in the write-up, others are a good practice for a novice. The problems are grouped roughly by the task they implement, though some problems need several ones.
<br><br>
<i>String fragmentation</i><br>
<A href="/stat?c=problem_statement&pm=3489&rd=6515">VLNString</A> (SRM 226, Div2 Easy)<br>
<A href="/stat?c=problem_statement&pm=4557&rd=7996">SortBooks</A> (SRM 262, Div2 Medium, Div1 Easy)<br>
<A href="/stat?c=problem_statement&pm=6476&rd=9988">TreasuresPacking</A> (SRM 308, Div2 Hard)<br>
<A href="/stat?c=problem_statement&pm=4708&rd=8007">Recipe</A> (SRM 265, Div1 Medium)
<br><br>
<i>String fragmentation with non-space delimiters</i><br>
<A href="/tc?module=HSProblemStatement&pm=6492&rd=10058">DigitalDisplay</A> (TCHS SRM 6, Div1 Easy)<br>
<A href="/stat?c=problem_statement&pm=1874&rd=4645">DirectoryTree</A> (SRM 168, Div1 Medium)<br>
<A href="/stat?c=problem_statement&pm=4608&rd=7998">GradingGridIns</A> (SRM 264, Div1 Medium)
<br><br>
<i>Numbers extracting</i><br>
<A href="/stat?c=problem_statement&pm=2272&rd=4710">SimpleCalculator</A> (SRM 178, Div2 Easy)<br>
<A href="/stat?c=problem_statement&pm=4448&rd=6535">MassiveNumbers</A> (SRM 236, Div2 Easy)<br>
<A href="/stat?c=problem_statement&pm=6013&rd=9808">TwoEquations</A> (SRM 287, Div1 Easy, Div2 Medium)<br>
<A href="/stat?c=problem_statement&pm=3075&rd=5866">HiddenNumbers</A> (SRM 220, Div1 Easy, Div2 Medium)
<br><br>
<i>Managing time</i><br>
<A href="/stat?c=problem_statement&pm=4680&rd=8020">VideoEncode</A> (TCO05, Qual 1/3)<br>
<A href="/stat?c=problem_statement&pm=6105&rd=9903">SlowKeyboard</A> (TCO06 Qual 7/9/14)<br>
<A href="/stat?c=problem_statement&pm=1708&rd=4515">Time</A> (SRM 144, Div2 Easy)<br>
<A href="/stat?c=problem_statement&pm=4520&rd=8005">TimeCard</A> (SRM 257, Div2 Hard)<br>
<A href="stat?c=problem_statement&pm=4765&rd=7994">SlowDigitalClock</A> (SRM 260, Div1 Medium)
<br><br>
<i>Formatting doubles</i><br>
<A href="/stat?c=problem_statement&pm=1313&rd=4550">FormatAmt</A> (SRM 149, Div2 Easy)<br>
<A href="/stat?c=problem_statement&pm=3447&rd=5867">PointLifeGame</A> (SRM 221, Div2 Medium)<br>
<A href="/stat?c=problem_statement&pm=1935&rd=4656">RoomSummary</A> (CRPF Charity Round 1, Div1 Medium)<br>
<A href="/stat?c=problem_statement&pm=1522&rd=4702">Planets</A> (TCO'03 Round1, Div1 Medium)
<br><br>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170"id="onRight">
         <div id="onBottom">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="defaults"/>
            </jsp:include>
         </div>
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
