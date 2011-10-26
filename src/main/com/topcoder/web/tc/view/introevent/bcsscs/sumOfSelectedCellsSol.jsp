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
            <h2>Problem Statement for SumOfSelectedCells</h2>

            <div>
            <strong>
            <A href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=sumOfSelectedCells" class="bcLink">Problem Statement</A>
            | Solution
            </strong>
            </div>

<pre>
import java.util.*; 

public class SumOfSelectedCells { 
    public String hypothesis(String[] table) { 
        int height = table.length; 
        int width = table[0].split(" ").length; 
        int[][] data = new int[height][width]; 
        for (int i = 0; i &lt; height; ++i) { 
            String[] p = table[i].split(" "); 
            for (int j = 0; j &lt; width; ++j) { 
                data[i][j] = Integer.parseInt(p[j]); 
            } 
        } 
        boolean res = true; 
        if (height == width) { 
            for (int a = 0; a &lt; 1; ++a) 
                for (int b = 0; b &lt; height; ++b) 
                    for (int c = 0; c &lt; 1; ++c) 
                        for (int d = 0; d &lt; width; ++d) 
                            if (data[a][c] + data[b][d] != data[a][d] + data[b][c]) 
                                res = false; 
        } else if (height &lt; width) { 
            for (int a = 0; a &lt; 1; ++a) 
                for (int b = 0; b &lt; height; ++b) 
                    for (int c = 0; c &lt; 1; ++c) 
                        for (int d = 0; d &lt; width; ++d) 
                            if (data[b][c] != data[b][d]) 
                                res = false; 
        } else { 
            for (int a = 0; a &lt; 1; ++a) 
                for (int b = 0; b &lt; height; ++b) 
                    for (int c = 0; c &lt; 1; ++c) 
                        for (int d = 0; d &lt; width; ++d) 
                            if (data[a][d] != data[b][d]) 
                                res = false; 
        } 
        return res ? "CORRECT" : "INCORRECT"; 
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