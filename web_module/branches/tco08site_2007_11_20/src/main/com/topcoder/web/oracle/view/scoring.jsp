<%@ page contentType="text/html;charset=utf-8" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">

<html>
<head>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>TopCoder</title>
    <link type="text/css" rel="stylesheet" href="/css/oracle/main.css">
    <link type="text/css" rel="stylesheet" href="/css/oracle/stats.css">
</head>

<body>

<div align="center">
    <div id="contentOut">
        <div id="contentIn">

            <div style="margin-bottom: 20px;">
                <A href="/"><img src="/i/oracle/layout/topcoder.png" alt="TopCoder" /></A>
            </div>
            
            <jsp:include page="nav.jsp" >
            <jsp:param name="selectedTab" value="scoring"/>
            <jsp:param name="tabLev2" value=""/>
            <jsp:param name="tabLev3" value=""/>
            </jsp:include>
            
            <div id="bodyColumn">

                <p>
                Competitors will be scored using this table:
                </p>
                
                <div align="center" style="margin-bottom: 10px;">
                <table cellpadding="3" cellspacing="0">
                <thead>
                <tr><td align="center" style="border-bottom: 1px solid #999999; border-right: 1px solid #999999;"><strong>Candidate<br>placement</strong></td><td align="center" style="border-bottom: 1px solid #999999;"><strong>Point value<br>for predicting<br>placement</strong></td></tr>
                </thead>
                <tbody>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>1</strong></td><td align="center">65535</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>2</strong></td><td align="center">32767</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>3</strong></td><td align="center">16383</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>4</strong></td><td align="center">8191</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>5</strong></td><td align="center">4095</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>6</strong></td><td align="center">2047</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>7</strong></td><td align="center">1023</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>8</strong></td><td align="center">511</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>9</strong></td><td align="center">255</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>10</strong></td><td align="center">127</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>11</strong></td><td align="center">63</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>12</strong></td><td align="center">31</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>13</strong></td><td align="center">15</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>14</strong></td><td align="center">7</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>15</strong></td><td align="center">3</td></tr>
                <tr><td align="center" style="border-right: 1px solid #999999;"><strong>16</strong></td><td align="center">1</td></tr>
                </tbody>
                </table>
                </div>
                
                <p>
                Column 1 contains the candidate placement.<br>
                Column 2 contains the corresponding number of points a competitor receives for correctly predicting that placement.
                </p>
                <p>
                As you can see, the scoring works in such a way that someone who correctly predicts 1st place cannot be beaten by someone who does not.  Similarly for 2nd place and on down.
                </p>
                <p> 
                We will apply the following formula to each of a competitors individual predictions in order to determine that competitor's total score for a round:
                </p>
                <div align="center">
                    <div style="width: 60px;">
                        <span id="init" style="display: block; text-align: center; border-bottom: 1px solid black">
                            <strong>p</strong>
                        </span>
                        <span id="delta" style="display: block; text-align: center;">
                            (<strong>&#916;</strong>+1)<sup>2</sup>
                        </span>
                    </div>
                </div>
                <p> 
                <strong>p</strong> is the number of points associated with the finishing position of the candidate, from the table above.<br>
                <strong>&#916;</strong>  is the difference between what the competitor predicted for the candidate's finishing placement and its actual placement.  
                </p>
                <p> 
                So, if a competitor predicts that candidate A will finish in 1st place, but it actually finishes in 2nd place, the competitor will receive
                </p>
                <div align="center">
                    <div style="width: 60px;">
                        <span id="init" style="display: block; text-align: center; border-bottom: 1px solid black">
                            <strong>65535</strong>
                        </span>
                        <span id="delta" style="display: block; text-align: center;">
                            (<strong>1</strong>+1)<sup>2</sup>
                        </span>
                    </div>
                </div>
                <p>
                points.
                </p>

            </div>

        <div style="clear:both;">&nbsp;</div>
        <jsp:include page="foot.jsp"/>
        </div>
    </div>
</div>

</body>
</html>