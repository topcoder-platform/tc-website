<%@ page contentType="text/html;charset=utf-8" %> 
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <title>TopCoder</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>
<body>

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="m_algo_competitions"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="left" class="bodyColumn">
            
            <jsp:include page="/page_title.jsp" >
               <jsp:param name="image" value="algorithm"/>
               <jsp:param name="title" value="Introduction Event"/>
            </jsp:include>

            <div style="float:right; margin-top: 6px;"><a href="/tc?module=Static&amp;d1=help&amp;d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></a></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for GuitarChords</h2>

            <div>
            <strong>
            <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=guitarChords" class="bcLink">Problem Statement</a>
            | Solution
            </strong>
            </div>
            
<pre>
import java.util.*;
import java.util.regex.*;
import java.text.*;
import java.math.*;
import java.awt.geom.*;

public class GuitarChords
{
    String [] str = new String []{  "A", "A#", "B", "C", "C#", "D", "D#" , "E", "F", "F#", "G" , "G#"};
  
  int []s;
  int [] c;
  
  int test[];
  
  void gen(int k){
    if(k == s.length){
      testt();
      return;
    }
    for(int i = 0;i &lt; c.length;i++){
      test[k] = c[i];
      gen(k+1);
    }
  }
  
  int min = Integer.MAX_VALUE;
  
  void testt(){
    for(int i = 0;i &lt; c.length;i++){
      boolean found = false;
      for(int j = 0;j &lt; test.length;j++){
        if(test[j] == c[i]){
          found = true;
          break;
        }
      }
      if(!found)
        return;
    }
    int t[] = new int[test.length];
    for(int i = 0;i &lt; test.length;i++){
      t[i] = test[i] - s[i];
      if(t[i] &lt; 0)
        t[i] += 12;
    }
    
    List&lt;Integer&gt; l = new LinkedList&lt;Integer&gt;();
    for(int i = 0;i &lt; t.length;i++)
      if(t[i] != 0)
        l.add(t[i]);
    
    if(l.isEmpty())
      min = 0;
    t = new int[l.size()];
    for(int i = 0;i &lt; t.length;i++){
      t[i] = l.get(i);
    }
    
    for(int i = 0;i &lt;  t.length; i++){
      int max = 0;
      for(int j = 0;j &lt; t.length; j++){
        if(t[j] &lt;= t[i] &amp;&amp; max &lt; t[j] - t[i] + 1)
          max = t[j] - t[i] + 1;
        
        if(t[j] &lt; t[i] &amp;&amp; max &lt; t[j] - t[i] + 13)
            max = t[j] - t[i] + 13;
        
      }
      if(max &lt; min)
        min = max;
    }
  }
  
  public int stretch(String [] strings, String [] chord){
    s = new int[strings.length];
    c = new int[chord.length];
    for(int i = 0;i &lt; s.length;i++){
      int j;
      for(j = 0;j &lt; str.length;j++){
        if(str[j].equals(strings[i]))
          break;
      }
      s[i] = j;
    }
    
    for(int i = 0;i &lt; c.length;i++){
      int j;
      for(j = 0;j &lt; str.length;j++)
        if(str[j].equals(chord[i]))
          break;
      c[i] = j;
    }
    test = new int[s.length];
    gen(0);
    return min;
  } 
</pre>

        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>