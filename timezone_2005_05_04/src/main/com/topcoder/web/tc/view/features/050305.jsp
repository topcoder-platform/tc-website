<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Feature Articles</title>

<jsp:include page="../script.jsp" />
<style type="text/css">
    .code
{
  width: 500;
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

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="features"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBodyFull">
            
            <h2>Using Regular Expressions</h2>

      <p>
      <img src="/i/m/Dan[Popovici]_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
      By&#160;<a class="bodyText" href="/stat?c=member_profile&amp;cr=7465390"><strong>Dan[Popovici]</strong></a> 
         & <a class="bodyText" href="/stat?c=member_profile&amp;cr=294328"><strong>mariusmuja</strong></a><br />
      <span class="smallText"><em>TopCoder Members</em></span><br clear="all" />
      </p>

<a name="introduction"></a>
<span class="bodySubtitle">Introduction</span><br/>
A regular expression is a special string that describes a search pattern. Many of you have surely seen and used them already when typing expressions like ls(or dir) *.txt , to get a list of all the files with the extension txt. Regular expressions are very useful not only for pattern matching, but also for manipulating text. In SRMs regular expressions can be extremely handy. Many problems that require some coding can be written using regular expressions on a few lines, making your life much easier.
<br><br>
<span class="bodySubtitle">(Not so) Formal Description of Regular Expressions</span><br>
A regular expression(regex) is one or more non-empty branches, separated by '|'.  It matches anything that matches one of the branches. 
The following regular expression will match any of the three words "the","top","coder"(quotes for clarity). 
<pre>
REGEX is : the|top|coder
INPUT is : Marius is one of the topcoders.
Found the text "the" starting at index 17 and ending at index 20.
Found the text "top" starting at index 21 and ending at index 24.
Found the text "coder" starting at index 24 and ending at index 29.
</pre>
A branch is one or more pieces, concatenated. It matches a match for the first, followed by a match for the second, etc.
<br><br>
A piece is an atom possibly followed by a '*', '+', '?', or bound. An atom followed by '*' matches a sequence of 0 or more matches of the atom. An atom followed by `+' matches a sequence of 1 or more matches of the atom. An atom followed by `?' matches a sequence of 0 or 1 matches of the atom. 
<br><br>
The following regular expression matches any successive occurrence of the words 'top' and 'coder'.

<pre>
REGEX is: (top|coder)+
INPUT is: This regex matches topcoder and also codertop.
Found "topcoder" starting at index 19 and ending at index 27.
Found "codertop" starting at index 37 and ending at index 45.
</pre>

A bound is '{' followed by an unsigned decimal integer, possibly followed by ',' possibly followed by another unsigned  decimal  integer, always followed by '}'.If there are two integers, the first may not exceed the second. An atom followed by a bound containing one integer i and no comma matches a sequence of exactly i matches of the atom. An atom followed by a bound containing one integer i and a comma matches a sequence of i or more matches of the atom. An atom followed by a bound containing two integers i and j matches a sequence of i through j (inclusive) matches of the atom.
The following regular expression matches any  sequence made of '1's having length 2,3 or 4 .

<pre>
REGEX is: 1{2,4}
INPUT is: 101 + 10 = 111 , 11111 = 10000 + 1111
Found the text "111" starting at index 11 and ending at index 14.
Found the text "1111" starting at index 17 and ending at index 21.
Found the text "1111" starting at index 33 and ending at index 37.
</pre>

One should observe that, greedily, the longest possible sequence is being matched and that different matches do not overlap. An atom is a regular expression enclosed in '()' (matching a match for the regular expression), a bracket expression (see below), '.' (matching any single character), '^' (matching the null string at the beginning of a line), '$' (matching the null string at the end of a line), a `\' followed by one of the characters `^.[$()|*+?{\' (matching that character taken as an ordinary character) or a single character with no other significance (matching that character). There is one more type of atom, the back reference: `\' followed by a non-zero decimal digit d matches the same sequence of characters matched by the d-th parenthesized subexpression (numbering subexpressions by the positions of their opening parentheses, left to right), so that (e.g.) `([bc])\1' matches `bb' or `cc' but not `bc'.
<br><br>
The following regular expression matches a string composed of two lowercase words separated by any character.

<pre>
Current REGEX is: ([a-z]+).\1
Current INPUT is: top-topcoder|coder
I found the text "top-top" starting at index 0 and ending at index 7.
I found the text "coder|coder" starting at index 7 and ending at index 18.
</pre>

A bracket expression is a list of characters enclosed in '[]'. It normally matches any single character from the list. If the list begins with '^', it matches any single character not from the rest of the list. If  two characters in  the list are separated  by `-', this is shorthand for the full range of characters between those two inclusive (e.g. '[0-9]' matches any decimal digit). With the exception of ']','^','-' all other special characters, including `\', lose their special significance within a bracket expression.
<br><br>
The following regular expression matches any 3 character words not starting with 'b','c','d' and ending in 'at'.

<pre>
Current REGEX is: [^b-d]at
Current INPUT is: bat
No match found.

Current REGEX is: [^b-d]at
Current INPUT is: hat
I found the text "hat" starting at index 0 and ending at index 3.
</pre>

This example combines most concepts presented above. The regex matches a set of open/close pair of html tags.

<pre>
REGEX is: &lt;([a-zA-Z][a-zA-Z0-9]*)(()| [^&gt;]*)&gt;(.*)&lt;/\1&gt;
INPUT is: &lt;font size="2"&gt;TopCoder is the&lt;/font&gt; &lt;b&gt;best&lt;/b&gt;
Found "&lt;font size="2"&gt;TopCoder is the&lt;/font&gt;" starting at index 0 and ending at index 37.
Found "&lt;b&gt;best&lt;/b&gt;" starting at index 38 and ending at index 49.
</pre>

([a-zA-Z][a-zA-Z0-9]*) will match any word that starts with a letter and continues with an arbitrary number of letters or digits. 
(()| [^&gt;]*) will match either the empty string or any string which does not contain '&gt;' . 
\1 will be replaced using backreferencing with the word matched be ([a-zA-Z][a-zA-Z0-9]*)

<br><br>
The above description is a brief one covering the basics of regular expressions. A regex written following the above rules should work in both Java(&gt;=1.4) and C++(POSIX EXTENDED). For a more in depth view of the extensions provided by different languages you can see the links given in the <A href="#references">References</A> section.
<br><br>

<span class="bodySubtitle">Using regular expressions</span><br>
<br>
<strong>In java</strong><br>
In java(1.4 and above) there is a package "java.util.regex" which allows usage of regular expressions.
<br><br>
This package contains three classes : Pattern, Matcher and PatternSyntaxException.
<ul>
<li>A Pattern object is a compiled representation of a regular expression. The Pattern class provides no public constructors. To create a pattern, you must call one of its public static compile methods, both of which will return a Pattern object.</li>
<li>A Matcher object is the engine that interprets the pattern and performs match operations against an input string. Like the Pattern class, Matcher defines no public constructors. You obtain a Matcher object by calling the public matcher method on a Pattern object.</li>
<li>A PatternSyntaxException object is an unchecked exception that indicates a syntax error in a regular expression pattern.</li>
</ul>

Example(adapted from[4]):

<pre>
Pattern pattern;
Matcher matcher;
pattern = Pattern.compile(&lt;REGEX&gt;);
matcher = pattern.matcher(&lt;INPUT&gt;);
boolean found;
while(matcher.find()) {
  System.out.println("Found the text \"" + matcher.group() +  "\" starting at index " + matcher.start() +
      " and ending at index " + matcher.end() + ".");
  found = true;
}

if(!found){
  System.out.println("No match found.");
}
</pre>

Java also offers the following methods in the String class:

<ul>
<li>boolean matches(String regex) (returns if the current string matches the regular expression regex)</li>
<li>String replaceAll(String regex, String replacement) (Replaces each substring of this string that matches the given regular expression with the given replacement.)</li>
<li>String replaceFirst(String regex, String replacement) (Replaces the first substring of this string that matches the given regular expression with the given replacement.)</li>
<li>String[] split(String regex) (Splits this string around matches of the given regular expression)</li>
</ul>

<span class="bodySubtitle">In C++</span><br>
Many TopCoders believe that regular expressions are one of Java's main strengths over C++ in the arena. C++ programmers don't despair, regular expressions can be used in C++ too.
<br><br>
There are several regular expression parsing libraries available for C++, unfortunately they are not very compatible with each other. Fortunately as a TopCoder in the arena one does not have to cope with all this variety of "not so compatible with one another" libraries. If you plan to use regular expressions in the arena you have to choose between two flavors of regex APIs: POSIX_regex and GNU_regex. To use these APIs the header file "regex.h" must be included. Both of these work in two steps - first there is a function call that compiles the regular expression, and then there is a function call that uses that compiled regular expression to search or match a string.
<br><br>
Here is a short description of both of these APIs, leaving it up to the coder to choose the one that he likes the most.
<br><br>

<span class="bodySubtitle">POSIX_regex</span><br>
Includes support for two different regular expression syntaxes, basic and extended. Basic regular expressions are similar to those in ed, while extended regular expressions are more like those in egrep, adding the '|', '+' and '?' operators and not requiring backslashes on parenthesized subexpressions or curly-bracketed bounds. Basic is the default, but extended is prefered.
<br><br>
With POSIX, you can only search for a given regular expression; you can't match it.  To do this, you must first compile it in a pattern buffer, using `regcomp'. Once you have compiled the regular expression into a pattern buffer you can search in a null terminated string using 'regexec'. If either of the 'regcomp' or 'regexec' function fail they return an error code. To get an error string corresponding to these codes you must use 'regerror'. To free the allocated fields of a pattern buffer you must use 'regfree'.
<br><br>
For an in depth description of how to use these functions please consult [2] or [3] in the <A href="#references">References</A> section.
<br><br>

<strong>Example:</strong><br>
Here is a small piece of code showing how these functions can be used:

<pre>  
regex_t reg;

string pattern = "[^tpr]{2,}";
string str = "topcoder";

regmatch_t matches[1];

regcomp(&amp;reg,pattern.c_str(),REG_EXTENDED|REG_ICASE);

if (regexec(&amp;reg,str.c_str(),1,matches,0)==0) {
  cout &lt;&lt; "Match " 
  cout &lt;&lt; str.substr(matches[0].rm_so,matches[0].rm_eo-matches[0].rm_so) 
  cout &lt;&lt; " found starting at: " 
  cout &lt;&lt; matches[0].rm_so 
  cout &lt;&lt; " and ending at " 
  cout &lt;&lt; matches[0].rm_eo 
  cout &lt;&lt; endl;
} else {
  cout &lt;&lt; "Match not found."
  cout &lt;&lt; endl;
}
regfree(&amp;reg);
</pre>

<span class="bodySubtitle">GNU_regex</span><br>
The GNU_regex API has a richer set of functions. With GNU regex functions you can both match a string with a pattern and search a pattern in a string. The usage of these functions is somehow similar with the usage of the POSIX functions: a pattern must first be compiled with 're_compile_pattern', and the pattern buffer obtained is used to search and match. The functions used for searching and matching are 're_search' and 're_match'. In case of searching a fastmap can be used in order to optimize search. Without a fastmap the search algorithm tries to match the pattern at consecutive positions in the string. The fastmap tells the algorithm what are the characters from which a match can start. The fastmap is constructed by calling the 're_compile_fastmap'. The GNU_regex also provides the functions 're_search2' and 're_match2' for searching and matching with split data. To free the allocated fields of a pattern buffer you must use 'regfree'.
<br><br>
For an in-depth description of how to use these functions please consult [3].
<br><br>
<strong>Example:</strong>

<pre>
string pattern = "([a-z]+).\\1";
string str = "top-topcoder|coder";

re_pattern_buffer buffer;
  char map[256];

buffer.translate = 0;
buffer.fastmap = map;
buffer.buffer = 0;
buffer.allocated = 0;

re_set_syntax(RE_SYNTAX_POSIX_EXTENDED);
const char* status = re_compile_pattern(pattern.c_str(),pattern.size(),&buffer); 
if (status) {
    cout &lt;&lt; "Error: " &lt;&lt; status &lt;&lt; endl;
}
re_compile_fastmap(&buffer);

struct re_registers regs;
int ofs = 0;
if (re_search(&buffer,str.c_str(),str.size(),0,str.size(),&amp;regs)!=-1) {
  cout &lt;&lt; "Match " 
  cout &lt;&lt; str.substr(regs.start[0],regs.end[0]-regs.start[0])
  cout &lt;&lt; " found starting at: "
  cout &lt;&lt; regs.start[0]
  cout &lt;&lt; " and ending at "
  cout &lt;&lt; regs.end[0]
  cout &lt;&lt; endl;
} else {
  cout &lt;&lt; "Match not found."
  cout &lt;&lt; endl;
}
regfree(&buffer);  
</pre>



<span class="bodySubtitle">Real SRMs Examples</span><br>
The following examples are written all in Java for the sake of clarity. A C++ user can use the POSIX or the GNU regex APIs to construct functions similar to those available in Java(replace_all, split, matches).
<br><br>
<strong><A href="/stat?c=problem_statement&pm=2396&rd=4755">CyberLine</A> (SRM 187 div 1, level 1)</strong>
<pre>
import java.util.*;
public class Cyberline 
{
  public String lastCyberword(String cyberline) 
  {
    String[]w=cyberline.replaceAll("-","")
          .replaceAll("[^a-zA-Z0-9]"," ")
          .split(" ") ;
    return w[w.length-1];
  }
}
</pre>

<strong><A href="/stat?c=problem_statement&pm=2912&rd=5849">UnLinker</A> (SRM 203 div 2, level 3)</strong>
<pre>
import java.util.*;
public class UnLinker 
{
  public String clean(String text) 
  {
    String []m = text.split("((http://)?www[.]|http://)[a-zA-Z0-9.]+[.](com|org|edu|info|tv)",-1);
    String s = m[0] ;   
    for (int i = 1 ; i &lt; m.length ; ++i)
      s = s + "OMIT" + i + m[i] ;   
    return s ;
  }
}
</pre>

<strong><A href="/stat?c=problem_statement&pm=1779&rd=4575">CheatCode</A> (SRM 154 div 1, level 1)</strong>

<pre>
import java.util.*;
public class CheatCode {
  public int[] matches(String keyPresses, String[] codes) {
    boolean []map = new boolean[codes.length] ; 
    int count = 0 ; 
    for (int i=0;i&lt;codes.length; ++i)
    {
      String regex = ".*" ; 
      for (int j=0; j&lt;codes[i].length(); ) {
        int k = 1;  
        while ((j+k)&lt;codes[i].length() && codes[i].charAt(j+k)==codes[i].charAt(j)) k++;
        regex = regex + codes[i].charAt(j) + "{"+k+",}";
        j+=k;
      }

      regex = regex + ".*" ; 
      if (keyPresses.matches(regex))
      {
        map[i] = true ; 
        count++ ; 
      }
    }
    int []res = new int[count] ;
    int j=0;
    for (int i= 0 ; i &lt; codes.length; ++i)
      if(map[i] == true)
        res[j++]=i ; 
    return res ; 
  }
}
</pre>
<a name="references"></a>
<span class="bodySubtitle">References</span>
<ol>
<li>The regex(7) linux manual page</li>
<li>The regex(3) linux manual page</li>
<li><A href="http://docs.freebsd.org/info/regex/regex.info.Programming_with_Regex.html">http://docs.freebsd.org/info/regex/regex.info.Programming_with_Regex.html</A></li>
<li><A href="http://www.regular-expressions.info/">http://www.regular-expressions.info/</A></li>
<li><A href="http://java.sun.com/docs/books/tutorial/extra/regex/">http://java.sun.com/docs/books/tutorial/extra/regex/</A></li>
</ol>

        </div>
        <p><br/></p>
        </td>
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
