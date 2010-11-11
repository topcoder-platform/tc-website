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
            <h2>Problem Statement for TemplateMatching</h2>

            <div>
            <strong>
            <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=templateMatching" class="bcLink">Problem Statement</a>
            | Solution
            </strong>
            </div>
            
<pre>
import java.util.*;
public class TemplateMatching
{
  public String bestMatch(String text, String prefix, String suffix)
  {
    int n = text.length();
    for(int i=0;i&lt;n;i++)
      for(int j=i+1;j&lt;=n;j++)
        compare(text.substring(i, j), prefix, suffix);
    return res;
  }
  String res = null;
  int pre = -1, suff = -1;
  void compare(String str, String prefix, String suffix)
  {
    int p = 0, s = 0;
    for(int i=0;i&lt;str.length();i++)
      if(prefix.endsWith(str.substring(0, i+1)))
        p = i+1;
    for(int i=1;i&lt;=str.length();i++)
      if(suffix.startsWith(str.substring(str.length()-i)))
        s = i;
    if((p+s &gt; pre+suff) ||
      (p+s==pre+suff &amp;&amp; p&gt;pre) ||
        (p+s==pre+suff &amp;&amp; p==pre &amp;&amp; str.compareTo(res)&lt;0))
    {
      pre = p;
      suff = s;
      res = str;
    }
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