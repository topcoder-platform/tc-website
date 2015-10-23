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
            <h2>Problem Statement for SubgridsCounter</h2>

            <div>
            <strong>
            <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=subgridsCounter" class="bcLink">Problem Statement</a>
            | Solution
            </strong>
            </div>
            
<pre>
import java.util.*;
public class SubgridsCounter {
  class pair implements Comparable&lt;pair&gt;{
    int x;
    int y;
    public pair(int a, int b){
      x = a;
      y = b;
    }
    public int compareTo(pair arg0) {
      // TODO Auto-generated method stub
      return this.y - arg0.y;
    }
    
  }
  boolean find(int[] x, int[] y, int a, int b){
    for (int i = 0; i &lt; x.length; i++){
      if(x[i] == a &amp;&amp; y[i] == b)
        return true;
    }
    return false;
  }
    public int howMany(int[] x, int[] y) {
        int res = 0;
        int n = x.length;
        for (int i = 0; i &lt; n; i++){
          for (int j = i + 1; j &lt; n; j++){
            for(int k = j + 1; k &lt; n; k++){
              if (x[i] == x[j] &amp;&amp; x[j] == x[k]){
                pair[] t = new pair[3];
                t[0] = new pair(x[i], y[i]);
                t[1] = new pair(x[j], y[j]);
                t[2] = new pair(x[k], y[k]);
                Arrays.sort(t);
                if(t[2].y - t[1].y != t[1].y - t[0].y)
                  continue;
                int d = t[2].y - t[1].y;
                int tx = x[i] + d;
                if (!find(x, y, tx, y[i]) || !find(x, y, tx, y[j]) || !find(x, y, tx, y[k]))
                  continue;
                tx += d;
                if (!find(x, y, tx, y[i]) || !find(x, y, tx, y[j]) || !find(x, y, tx, y[k]))
                  continue;
                res++;
              }
            }
          }
        }
        return res;
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