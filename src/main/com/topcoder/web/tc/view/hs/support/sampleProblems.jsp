<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - Help</title>

<jsp:include page="../script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>

</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
         <jsp:include page="/includes/global_left.jsp">
            <jsp:param name="node" value="hs_sample_problems"/>
         </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
        <td width="100%" align="left" class="bodyText">
         <jsp:include page="../../page_title.jsp" >
         <jsp:param name="image" value="hs_support_faqs"/>
         <jsp:param name="title" value="Sample Problem Statements"/>
         </jsp:include>

<H2>Sample Problem Statements</H2>

<P>
Here are a couple of examples of the types of problems you can expect from a TopCoder competition. Once you become a TopCoder member, you can view all of the problems that TopCoder has ever used in the statistics section of our web site. If you're looking to practice, you'll find that after each TopCoder competition the problem sets that were used will be added as "practice rooms" in the TopCoder competition Arena. The TopCoder practice rooms are a great place to test your skills without the pressure of live competition and at the same time, get a feel for the competition environment. During an event you are presented with mulitple problems (usually 3) of increasing difficulty.
<br/><br/>
<b>Example Level 1 Problem Statement</b><br/>
(From SRM 303)
<br/><br/>
<b>Problem Statement</b>
<br/>
In the English language, the plural form of a noun is created according to many difficult rules, but for the most part, a noun can be transformed into its plural form using four simple rules. These rules are:<br/>
<ol>
	<li>If the word ends in 's', 'z', 'x', 'ch' or 'sh', add 'es' to the end of the word;</li>
	<li>If the word ends in 'ay', 'ey', 'iy', 'oy' or 'uy', add 's' to the end of the word;</li>
	<li>If the word ends in 'y', but doesn't satisfy the previous rule, replace the trailing 'y' with 'ies';</li>
	<li>In all other cases, just add 's' to the end of the word.</li>
</ol>
<br/>
You will be given a String[] nouns. Transform each element of nouns into its plural form using the rules above and return the resulting String[].
<br/><br/>

DEFINITION<br/>
<pre>
Class:            NounReform
Method:           makePlural
Parameters:       String[]
Returns:          String[]
Method signature: String[] makePlural(String[] nouns)
(be sure your methodis public)
</pre>
<br/><br/>


CONSTRAINTS<br/>
- <b>nouns</b> will contain between 1 and 50 elements, inclusive.<br/>
- Each element of <b>nouns</b> will contain between 1 and 20 characters, inclusive.<br/>
- Each element of <b>nouns</b> will consist of only lower-case letters ('a'-'z').<br/>
<br/><br/>
EXAMPLES<br/>

0)<br/>
<br/>

{"box", "church", "elephant", "stereo"}<br/>
Returns: {"boxes", "churches", "elephants", "stereos" }<br/>

1)<br/>
<br/>

{"tray", "key", "enemy", "baby"}<br/>
Returns: {"trays", "keys", "enemies", "babies" }<br/>

2)<br/>
<br/>

{"a", "s", "oy", "y", "yy"}<br/>
Returns: {"as", "ses", "oys", "ies", "yies" }<br/>
<br/>

<b>Java Submission</b><br/>
<pre>
public class NounReform {
  public String[] makePlural(String[] nouns) {
    String[] ret = new String[nouns.length];
    int count = 0;
    for(String s : nouns) {
      if(s.endsWith("s") || s.endsWith("z") || s.endsWith("x") || s.endsWith("ch") || s.endsWith("sh")) {
        //Rule 1
        ret[count++] = s + "es";
      } else if(s.endsWith("ay") || s.endsWith("ey") || s.endsWith("iy") || s.endsWith("oy") || s.endsWith("uy")) {
        //Rule 2
        ret[count++] = s + "s";
      } else if(s.endsWith("y")) {
        //Rule 3
        ret[count++] = s.substring(0, s.length() -1) + "ies";
      } else {
        ret[count++] = s + "s";
      }
    }
    return ret;
  }
}
</pre>
<br/>

<b>C# Submission</b><br/>
<pre>
public class NounReform {
  public string[] makePlural(string[] nouns) {
    string[] ret = new string[nouns.Length];
    int count = 0;
    foreach(string s in nouns) {
      if(s.EndsWith("s") || s.EndsWith("z") || s.EndsWith("x") || s.EndsWith("ch") || s.EndsWith("sh")) {
        //Rule 1
        ret[count++] = s + "es";
      } else if(s.EndsWith("ay") || s.EndsWith("ey") || s.EndsWith("iy") || s.EndsWith("oy") || s.EndsWith("uy")) {
        //Rule 2
        ret[count++] = s + "s";
      } else if(s.EndsWith("y")) {
        //Rule 3
        ret[count++] = s.Substring(0, s.Length -1) + "ies";
      } else {
        ret[count++] = s + "s";
      }
    }
    return ret;
  }
}
</pre>
<br/>

<b>C++ Submission</b><br/>
<pre>
#include&lt;vector&gt;
#include&lt;string&gt;

using namespace std;

class NounReform {
  int endsWith(string a, string b) {
    if(a.size() &lt; b.size())
      return 0;
    for(int i = 0; i &lt; b.size(); i++) {
      if(a[a.size()-i-1] != b[b.size()-i-1])
        return 0;
    }
    return 1;
  }

  public:
    vector&lt;string&gt; makePlural(vector&lt;string&gt; nouns) {
      vector&lt;string&gt; ret;
      for(int i = 0; i &lt; nouns.size(); i++) {
        if(endsWith(nouns[i],"s") || endsWith(nouns[i],"z") || endsWith(nouns[i],"x") || endsWith(nouns[i],"ch") || endsWith(nouns[i],"sh")) {
          //Rule 1
          ret.push_back(nouns[i] + "es");
        } else if(endsWith(nouns[i],"ay") || endsWith(nouns[i],"ey") || endsWith(nouns[i],"iy") || endsWith(nouns[i],"oy") || endsWith(nouns[i],"uy")) {
          //Rule 2
          ret.push_back(nouns[i] + "s");
        } else if(endsWith(nouns[i],"y")) {
          //Rule 3
          ret.push_back(nouns[i].substr(0, nouns[i].size() -1) + "ies");
        } else {
          ret.push_back(nouns[i] + "s");
        }
      }
      return ret;
  }
};
</pre>
<br/>

<b>VB.NET Submission</b><br/>
<pre>
Public Class NounReform
  Public Function makePlural(nouns as String()) as String() 
    Dim ret as String()
    Redim ret(nouns.Length - 1)

    For i as Integer = 0 To nouns.Length - 1
      If nouns(i).EndsWith("s") Or nouns(i).EndsWith("z") Or nouns(i).EndsWith("x") Or nouns(i).EndsWith("ch") Or nouns(i).EndsWith("sh") Then
        'Rule 1
        ret(i) = nouns(i) + "es"
      Else If nouns(i).EndsWith("ay") Or nouns(i).EndsWith("ey") Or nouns(i).EndsWith("iy") Or nouns(i).EndsWith("oy") Or nouns(i).EndsWith("uy") Then
        'Rule 2
        ret(i) = nouns(i) + "s"
      Else If nouns(i).EndsWith("y") Then
        'Rule 3
        ret(i) = nouns(i).Substring(0, nouns(i).Length -1) + "ies"
      Else
        ret(i) = nouns(i) + "s"
      End If
    Next
    Return ret
  End Function
End Class
</pre>
<br/>

<b>Example Level 2 Problem Statement</b><br/>
(From SRM 302)
<br/><br/>
<b>Problem Statement</b>
<br/><br/>
Fans of the game X-ball frequently use the official players' stats. These stats are presented as a list of players' names and the positions they can play. If a player can play at several positions, he is shown in the list once for each position.
<br/><br/>
The fans want to get the statistics in a new format. In the old format, each element of the list contained a single player and a single position played by that player. In the new format, each element of the list will contain a single player and all the positions that the player can play. The new list must contain the same number of elements as the old one, and players must appear in the same order as before. Each element of the new list must contain the name of the player, a '-' character, and a comma-separated list of all the positions the player can play. The first position must be the same position that was in the corresponding element of the old list, and the other positions must be sorted in alphabetical order.
<br/><br/>
<pre>
<b>Old format stats:</b>  |  <b>New format stats:</b>
John-DH            |  John-DH,RP,SP         
Jack-SP            |  Jack-SP               
Sam-OF             |  Sam-OF                
John-SP            |  John-SP,DH,RP         
John-RP            |  John-RP,DH,SP
</pre>
<br/>
You will be given a String[] <b>placeboard</b> containing the statistics in the old format. Each element will contain a player's name and an abbreviation of the player's position in the form "Name-Position" (quotes for clarity). Return the list after converting it to the new format.
<br/><br/>

DEFINITION<br/>

<pre>
Class:            XBallGame
Method:           newStatistics
Parameters:       String[]
Returns:          String[]
Method signature: String[] newStatistics(String[] placeboard)
(be sure your methodis public)
</pre>
<br/>

NOTES<br/>
- Note that the names of the players are case-sensitive.
<br/><br/>

CONSTRAINTS<br/>
- <b>placeboard</b> will contain between 1 and 50 elements, inclusive.<br/>
- Each element of <b>placeboard</b> will contain between 4 and 23 characters, inclusive.<br/>
- Each element of <b>placeboard</b> will be in the format "Name-Position" without any leading or trailing spaces.<br/>
- Position will consist of two upper-case letters ('A'-'Z').<br/>
- Name will contain between 1 and 20 letters ('A'-'Z', 'a'-'z'), inclusive.<br/>
- All elements of <b>placeboard</b> will be distinct.<br/>
<br/>

EXAMPLES<br/>
0)<br/>
<br/>
{"John-DH",<br/>
 "Jack-SP",<br/>
 "Sam-OF",<br/>
 "John-SP",<br/>
 "John-RP"}<br/>
 <br/>
Returns: {"John-DH,RP,SP", "Jack-SP", "Sam-OF", "John-SP,DH,RP", "John-RP,DH,SP" }<br/>
<br/>
1)<br/>
<br/>
{"John-DH",<br/>
 "Jack-SP",<br/>
 "Sam-OF",<br/>
 "John-SP",<br/>
 "John-RP",<br/>
 "John-RA",<br/>
 "John-RZ",<br/>
 "Jack-OF",<br/>
 "Sam-SP"}<br/>
Returns:<br/>
<br/>
{"John-DH,RA,RP,RZ,SP",<br/>
"Jack-SP,OF",<br/>
"Sam-OF,SP",<br/>
"John-SP,DH,RA,RP,RZ",<br/>
"John-RP,DH,RA,RZ,SP",<br/>
"John-RA,DH,RP,RZ,SP",<br/>
"John-RZ,DH,RA,RP,SP",<br/>
"Jack-OF,SP",<br/>
"Sam-SP,OF" }<br/>
<br/>
2)<br/>
<br/>
{"PFwL-GE", "PFwL-EV","agXL-SR", "PFwL-CS", "PFwL-FE", "PFwL-MS", "agXL-VS", "agXL-AL", "PFwL-BI", "PFwL-DK",<br/>
 "PFwL-MW", "PFwL-DS", "agXL-XJ", "agXL-PJ", "agXL-CK", "PFwL-KI", "agXL-KP", "agXL-EL", "PFwL-EA"}<br/>
Returns:<br/>
{"PFwL-GE,BI,CS,DK,DS,EA,EV,FE,KI,MS,MW",<br/>
"PFwL-EV,BI,CS,DK,DS,EA,FE,GE,KI,MS,MW",<br/>
"agXL-SR,AL,CK,EL,KP,PJ,VS,XJ",<br/>
"PFwL-CS,BI,DK,DS,EA,EV,FE,GE,KI,MS,MW",<br/>
"PFwL-FE,BI,CS,DK,DS,EA,EV,GE,KI,MS,MW",<br/>
"PFwL-MS,BI,CS,DK,DS,EA,EV,FE,GE,KI,MW",<br/>
"agXL-VS,AL,CK,EL,KP,PJ,SR,XJ",<br/>
"agXL-AL,CK,EL,KP,PJ,SR,VS,XJ",<br/>
"PFwL-BI,CS,DK,DS,EA,EV,FE,GE,KI,MS,MW",<br/>
"PFwL-DK,BI,CS,DS,EA,EV,FE,GE,KI,MS,MW",<br/>
"PFwL-MW,BI,CS,DK,DS,EA,EV,FE,GE,KI,MS",<br/>
"PFwL-DS,BI,CS,DK,EA,EV,FE,GE,KI,MS,MW",<br/>
"agXL-XJ,AL,CK,EL,KP,PJ,SR,VS",<br/>
"agXL-PJ,AL,CK,EL,KP,SR,VS,XJ",<br/>
"agXL-CK,AL,EL,KP,PJ,SR,VS,XJ",<br/>
"PFwL-KI,BI,CS,DK,DS,EA,EV,FE,GE,MS,MW",<br/>
"agXL-KP,AL,CK,EL,PJ,SR,VS,XJ",<br/>
"agXL-EL,AL,CK,KP,PJ,SR,VS,XJ",<br/>
"PFwL-EA,BI,CS,DK,DS,EV,FE,GE,KI,MS,MW" }<br/>
<br/>
3)<br/>
<br/>
{"a-AA", "a-ZZ"}<br/>
Returns: {"a-AA,ZZ", "a-ZZ,AA" }<br/>
<br/>

<b>Java Submission</b><br/>
<pre>
import java.util.ArrayList;
import java.util.Collections;

public class XBallGame {
  public String[] newStatistics(String[] placeboard) {
    String[] ret = new String[placeboard.length];
    for(int i = 0; i < ret.length; i++) {
      ret[i] = placeboard[i];

      ArrayList<String> positions = new ArrayList();

      for(int j = 0; j < placeboard.length; j++) {
        if(i == j) continue;
        if(ret[i].substring(0,ret[i].indexOf("-")).equals(placeboard[j].substring(0,placeboard[j].indexOf("-")))) {
          //same person
          positions.add(placeboard[j].substring(placeboard[j].indexOf("-")+1));
        }
      }

      Collections.sort(positions);
      for(String s : positions) {
        ret[i] = ret[i] + "," + s;
      }
    }
    return ret;
  }
}
</pre>
<br/>

<b>C# Submission</b><br/>
<pre>
using System.Collections.Generic;

public class XBallGame {
  public string[] newStatistics(string[] placeboard) {
    string[] ret = new string[placeboard.Length];
    for(int i = 0; i < ret.Length; i++) {
      ret[i] = placeboard[i];

      List<string> positions = new List<string>();

      for(int j = 0; j < placeboard.Length; j++) {
        if(i == j) continue;
        if(ret[i].Substring(0,ret[i].IndexOf("-")) == placeboard[j].Substring(0,placeboard[j].IndexOf("-"))) {
          //same person
          positions.Add(placeboard[j].Substring(placeboard[j].IndexOf("-")+1));
        }
      }

      positions.Sort();

      foreach(string s in positions) {
        ret[i] = ret[i] + "," + s;
      }
    }
    return ret;
  }
}
</pre>
<br/>

<b>C++ Submission</b><br/>
<pre>
#include&lt;vector&gt;
#include&lt;string&gt;

using namespace std;

class XBallGame {
  public:
    vector&lt;string&gt; newStatistics(vector&lt;string> placeboard) {
      vector&lt;string&gt; ret(placeboard.size());
      for(int i = 0; i &lt; ret.size(); i++) {
        ret[i] = placeboard[i];

        vector&lt;string&gt; positions;

        for(int j = 0; j &lt; placeboard.size(); j++) {
          if(i == j) continue;
          if(ret[i].substr(0,ret[i].find("-")) == placeboard[j].substr(0,placeboard[j].find("-"))) {
            //same person
            positions.push_back(placeboard[j].substr(placeboard[j].find("-")+1));
          }
        }

        sort(positions.begin(), positions.end());

        for(int k = 0; k &lt; positions.size(); k++) {
          ret[i] = ret[i] + "," + positions[k];
        }
      }
      return ret;
    }
};
</pre>
<br/>

<b>VB.NET Submission</b><br/>
<pre>
Imports System.Collections.Generic

Public Class XBallGame 
  Public Function newStatistics(placeboard as String()) as String()
    Dim ret as String()
    Redim ret(placeboard.Length-1)

    For i as Integer = 0 To ret.Length - 1
      ret(i) = placeboard(i)

      Dim positions as New List(Of String) 

      For j as Integer = 0 To placeboard.Length -1 
        If Not i = j Then
          If ret(i).Substring(0,ret(i).IndexOf("-")) = placeboard(j).Substring(0,placeboard(j).IndexOf("-")) Then
            'same person
            positions.Add(placeboard(j).Substring(placeboard(j).IndexOf("-")+1))
          End If
        End If
      Next

      positions.Sort()

      For k as Integer = 0 To positions.Count -1
        ret(i) = ret(i) + "," + positions(k)
      Next
    Next
    Return ret
  End Function
End Class
</pre>
<br/>
</p>
         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
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

<jsp:include page="../../foot.jsp" />

</body>

</html>
