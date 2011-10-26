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

            <div style="float:right; margin-top: 6px;"><A href="/tc?module=Static&d1=help&d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></A></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for StringFragmentation</h2>

            <div>
            <strong>
            <A href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=stringFragmentation" class="bcLink">Problem Statement</A>
            | Solution
            </strong>
            </div>
<pre>
import java.util.*;
import java.math.*;
import java.io.*;
import java.text.*;
import java.util.regex.*;
import static java.util.Arrays.*;
import static java.lang.Math.*;
import static java.lang.Integer.parseInt;
public class StringFragmentation {
  public int largestFontSize(String text, int width, int height) {
    StringTokenizer st = new StringTokenizer(text);
    
    int[] ar = new int[st.countTokens()];
    for(int i = 0; i &lt; ar.length; i++){
      ar[i] = st.nextToken().length();
    }
    outer:
    for(int n = 10000; n &gt; 7; n--){
      int w = 0;
      int h = height;
      for(int i = 0; i &lt; ar.length; i++){
        if(ar[i]*(2+n) &gt; w){
          if(h &lt; 2*n) continue outer;
          h -= 2*n;
          w = width;
        }
        if(ar[i]*(2+n) &gt; w) continue outer;
        w -= (ar[i]+1)*(2+n);
      //  if(n == 10)System.out.println(w+" "+h);
      }
      return n;
    }
    
    return -1;
  }
 
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