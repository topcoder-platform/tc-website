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

            <div style="float:right; margin-top: 6px;"><A href="/tc?module=Static&amp;d1=help&amp;d2=index"><img src="/i/introevent/tryMoreAlgo.png" alt="Try some more Algorithm Competitions?" /></A></div>
            <div align="left" style="margin-bottom: 20px;">
                <img src="/i/introevent/bcsLogo.png" alt="" />
            </div>
            <h2>Problem Statement for DecorationDay</h2>

            <div>
            <strong>
            <A href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=decorationDay" class="bcLink">Problem Statement</A>
            | Solution
            </strong>
            </div>

<pre>
import java.util.*;
import java.util.regex.*;
import java.text.*;
import java.math.*;
import java.awt.geom.*;

public class DecorationDay
{
  int gcd(int a,int b){
    if(b==0)
      return a;
    return gcd(b,a%b);
  }
  
  public int howMany(int[] g)
  {
    int[] ant = new int[100010], crt = new int[100010];
    int base=10000003;
    
    int N=g.length;
    for(int i=0;i&lt;N;i++){
      crt[g[i]] ++;
      crt[g[i]] %= base;
      
      for(int j=1;j&lt;=100000;j++){
        int cmmdc = gcd(g[i],j);
        crt[cmmdc] += ant[j];
        crt[cmmdc] %= base;      
      }
      
      for(int j=1;j&lt;=100000;j++){
        ant[j] += crt[j];
        ant[j] %= base;
        crt[j] = 0;
      }
        
    }
    
    return ant[1];
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