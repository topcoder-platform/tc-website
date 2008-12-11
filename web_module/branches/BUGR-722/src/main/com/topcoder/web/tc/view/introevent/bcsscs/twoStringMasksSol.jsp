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
            <h2>Problem Statement for TwoStringMasks</h2>

            <div>
            <strong>
            <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=twoStringMasks" class="bcLink">Problem Statement</a>
            | Solution
            </strong>
            </div>
<pre>
import java.util.*;
public class TwoStringMasks {
  public String shortestCommon(String _s1, String _s2) {
    String[] s1 = _s1.split("\\*",-1);
    String[] s2 = _s2.split("\\*",-1);
    String ss = s1[0]+s1[1];
 
    String best=null;
    for(int i=0;i&lt;=ss.length();++i){
      for(int j=i;j&lt;=ss.length();++j){
        String st = s2[0]+ss.substring(i,j)+s2[1];
        if(st.matches(s1[0]+".*"+s1[1]) &amp;&amp; (best==null||best.length()&gt;st.length())) best = st;
      }
    }
    if (best==null) return "impossible";
    else return best;
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