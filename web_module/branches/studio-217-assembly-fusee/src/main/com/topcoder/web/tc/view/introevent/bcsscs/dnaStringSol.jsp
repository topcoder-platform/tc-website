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
            <h2>Problem Statement for DNAString</h2>

            <div>
            <strong>
            <a href="/tc?module=Static&amp;d1=introevent&amp;d2=bcsscs&amp;d3=dnaString" class="bcLink">Problem Statement</a>
            | Solution
            </strong>
            </div>
            
<pre>
public class DNAString{
  public int minChanges(int mp, String[] dna){
    String resDna;
    StringBuilder sb = new StringBuilder(dna[0]);
    for (int i=1; i&lt;dna.length; ++i){
      sb.append(dna[i]);
    }
    resDna = sb.toString();
    
    int[][] ctr = new int[2500][4];
    int res=1000000, temp;
    for (int i=1; i&lt;=mp; ++i){
      for (int j=0; j&lt;resDna.length(); ++j){
        switch (resDna.charAt(j)){
          case 'A':
            ctr[j%i][0]++;
            break;
          case 'C':
            ctr[j%i][1]++;
            break;
          case 'G':
            ctr[j%i][2]++;
            break;
          case 'T':
            ctr[j%i][3]++;
            break;
        }
      }
      temp=0;
      for (int j=0; j&lt;i; ++j){
        temp+=getReplNum(ctr[j]);
        ctr[j][0] = ctr[j][1] = ctr[j][2] = ctr[j][3] = 0;
      }
      if (res &gt; temp) res = temp;
    }
    return res;
  }
  private int getReplNum(int[] a){
    int j=0, sum=0;
    for (int i=1; i&lt;4; ++i){
      if (a[j]&lt;a[i]) j=i;
    }
    for (int i=0; i&lt;4; ++i){
      if (i != j) sum+=a[i];
    }
    return sum;
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