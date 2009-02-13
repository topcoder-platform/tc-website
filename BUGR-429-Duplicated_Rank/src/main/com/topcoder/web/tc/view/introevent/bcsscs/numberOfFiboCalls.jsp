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
            <h2>Problem Statement for NumberofFiboCalls</h2>

            <div>
            <strong>
            Problem Statement
            | <a href="/tc?module=Static&d1=introevent&d2=bcsscs&d3=numberOfFiboCallsSol" class="bcLink">Solution</a>    
            </strong>
            </div>

            <table>
                <tbody>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td><p>Look at the following pseudo-code, which computes the n-th Fibonacci number:<br />
<pre>
    int fibonacci(int n)
        begin
        if n equals 0
            begin
            print(0)
            return 0
            end
        if n equals 1
            begin
            print(1)
            return 1
            end
        return fibonacci(n - 1) + fibonacci(n - 2)
        end
</pre></p>
                            <p>For example, if one calls fibonacci(3), then the following will happen:<br />
<pre>
    fibonacci(3) calls fibonacci(2) and fibonacci(1) (the first call). 
    fibonacci(2) calls fibonacci(1) (the second call) and fibonacci(0). 
    The second call of fibonacci(1) prints 1 and returns 1. 
    fibonacci(0) prints 0 and returns 0. 
    fibonacci(2) gets the results of fibonacci(1) and fibonacci(0) and returns 1. 
    The first call of fibonacci(1) prints 1 and returns 1. 
    fibonacci(3) gets the results of fibonacci(2) and fibonacci(1) and returns 2.
</pre></p>
                            <p>In total, '1' will be printed twice and '0' will be printed once.</p>
                            <p>We want to know how many times '0' and '1' will be printed for a given n. You are to return a int[] which contains exactly two elements. The first and second elements of the return value must be equal to the number of times '0' and '1', respectively, will be printed during a fibonacci(n) call.</p>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Definition</h3></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>Class:</td>
                                        <td>NumberofFiboCalls</td>
                                    </tr>
                                    <tr>
                                        <td>Method:</td>
                                        <td>fiboCallsMade</td>
                                    </tr>
                                    <tr>
                                        <td>Parameters:</td>
                                        <td>int</td>
                                    </tr>
                                    <tr>
                                        <td>Returns:</td>
                                        <td>int[]</td>
                                    </tr>
                                    <tr>
                                        <td>Method signature:</td>
                                        <td>int[] fiboCallsMade(int n)</td>
                                    </tr>
                                    <tr>
                                        <td colspan="2">(be sure your method is public)</td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td></td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Constraints</h3></td>
                    </tr>
                    <tr>
                        <td align="center" valign="top">-</td>
                        <td><b>n</b> will be between 0 and 40, inclusive.</td>
                    </tr>
                    <tr>
                        <td colspan="2">&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="2"><h3>Examples</h3></td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">0)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>0</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {1, 0 }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">If I call the Fibonacci function with n = 0, it just calls the 1st base case. Hence, the result is {1,0}.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">1)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>3</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {1, 2 }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">The test case given in the problem statement.</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">2)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>6</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {5, 8 }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="center" nowrap="true">3)</td>
                        <td></td>
                    </tr>
                    <tr>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;</td>
                        <td>
                            <table>
                                <tbody>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td>
                                                            <pre>22</pre>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <pre>Returns: {10946, 17711 }</pre>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table>
                                                <tbody>
                                                    <tr>
                                                        <td colspan="2">&nbsp;</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                </tbody>
            </table>
            
            <hr><p>This problem statement is the exclusive and proprietary property of TopCoder, Inc. Any unauthorized use or reproduction of this information without the prior written consent of TopCoder, Inc. is strictly prohibited. &copy;2006, TopCoder, Inc. All rights reserved. </p></hr>

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