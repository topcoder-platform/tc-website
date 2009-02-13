<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>TopCoder High School 2008</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <link type="text/css" rel="stylesheet" href="/css/tournaments/tchs08.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>
<body>

<div id="wrapper">

    <jsp:include page="nav.jsp" >
    <jsp:param name="tabLev1" value="resultsInd"/>
    <jsp:param name="tabLev2" value=""/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>
    
    
    
        <div id="title">
            <h2>Results</h2>
        </div><%-- #title --%>
        
        <div id="content">
            <p>
                <a href="/tc?module=SimpleStats&amp;c=tchs08_alg_adv_overview&amp;d1=tournaments&amp;d2=tchs08&amp;d3=results">Online Rounds</a>
                | Finals
            </p>
            
            <div align="center">
                The finalists are sorted by score.
            </div>
            
            <br />
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <%--
                    <td align="right"><img src="/i/tournament/tchs08/bracket_NW.png" alt="" border="0" /></td>
                    <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                    <td rowspan="3"><img src="/i/tournament/tchs08/bracket_bar.png" alt="" /></td>
                    ---%>
                    <td align="right"><img src="/i/tournament/tchs08/bracket_NW.png" alt="" border="0" /></td>
                    <td rowspan="3" style="background-color: #ffffff;"><img src="/i/clear.gif" alt="" width="10" height="10" /></td>
                    <td rowspan="3" valign="middle"><img src="/i/tournament/tchs08/bracket_R.png" alt="" border="0" /></td>
                    <td rowspan="3" valign="middle" align="center"><img src="/i/tournament/tchs08/champion.png" alt="" border="0" /><br /><span style="font-size: 15px;"><tc-webtag:handle coderId="20812309" context="hs_algorithm" darkBG="true" /></span></td>
                </tr>
                <tr>
                    <td style="padding: 15px" valign="middle" align="center">
                    <tc-webtag:handle coderId="20812309" context="hs_algorithm" darkBG="true" /><br />1499.37<br />
                    <tc-webtag:handle coderId="22663117" context="hs_algorithm" darkBG="true" /><br />1335.16<br />
                    <tc-webtag:handle coderId="22628118" context="hs_algorithm" darkBG="true" /><br />701.42<br />
                    <tc-webtag:handle coderId="22285847" context="hs_algorithm" darkBG="true" /><br />685.54<br />
                    <tc-webtag:handle coderId="13401907" context="hs_algorithm" darkBG="true" /><br />618.86<br />
                    <tc-webtag:handle coderId="22065595" context="hs_algorithm" darkBG="true" /><br />615.43<br />
                    <tc-webtag:handle coderId="22074787" context="hs_algorithm" darkBG="true" /><br />615.31<br />
                    <tc-webtag:handle coderId="22697869" context="hs_algorithm" darkBG="true" /><br />614.37<br />
                    <tc-webtag:handle coderId="22675937" context="hs_algorithm" darkBG="true" /><br />607.67<br />
                    <tc-webtag:handle coderId="20559795" context="hs_algorithm" darkBG="true" /><br />606.73<br />
                    <tc-webtag:handle coderId="10205233" context="hs_algorithm" darkBG="true" /><br />587.06<br />
                    <tc-webtag:handle coderId="22664055" context="hs_algorithm" darkBG="true" /><br />573.93<br />
                    <tc-webtag:handle coderId="22700358" context="hs_algorithm" darkBG="true" /><br />565.1<br />
                    <tc-webtag:handle coderId="20036294" context="hs_algorithm" darkBG="true" /><br />506.22<br />
                    <tc-webtag:handle coderId="22683576" context="hs_algorithm" darkBG="true" /><br />502.55<br />
                    <tc-webtag:handle coderId="22700760" context="hs_algorithm" darkBG="true" /><br />431.84<br />
                    <tc-webtag:handle coderId="15693225" context="hs_algorithm" darkBG="true" /><br />380.74<br />
                    <tc-webtag:handle coderId="12005484" context="hs_algorithm" darkBG="true" /><br />380.21<br />
                    <tc-webtag:handle coderId="22627975" context="hs_algorithm" darkBG="true" /><br />252.15<br />
                    <tc-webtag:handle coderId="22663617" context="hs_algorithm" darkBG="true" /><br />216.37<br />
                    <tc-webtag:handle coderId="22661890" context="hs_algorithm" darkBG="true" /><br />210.25<br />
                    <tc-webtag:handle coderId="22658036" context="hs_algorithm" darkBG="true" /><br />198.99<br />
                    <tc-webtag:handle coderId="22677097" context="hs_algorithm" darkBG="true" /><br />197.38<br />
                    <tc-webtag:handle coderId="20056783" context="hs_algorithm" darkBG="true" /><br />193.92<br />
                    <tc-webtag:handle coderId="22654463" context="hs_algorithm" darkBG="true" /><br />193.36<br />
                    <tc-webtag:handle coderId="15700786" context="hs_algorithm" darkBG="true" /><br />188.61<br />
                    <tc-webtag:handle coderId="22627747" context="hs_algorithm" darkBG="true" /><br />187.36<br />
                    <tc-webtag:handle coderId="22707311" context="hs_algorithm" darkBG="true" /><br />186.41<br />
                    <tc-webtag:handle coderId="11972352" context="hs_algorithm" darkBG="true" /><br />182.73<br />
                    <tc-webtag:handle coderId="22699521" context="hs_algorithm" darkBG="true" /><br />181.36<br />
                    <tc-webtag:handle coderId="22659963" context="hs_algorithm" darkBG="true" /><br />177.33<br />
                    <tc-webtag:handle coderId="22677150" context="hs_algorithm" darkBG="true" /><br />174.96<br />
                    <tc-webtag:handle coderId="22687801" context="hs_algorithm" darkBG="true" /><br />173.5<br />
                    <tc-webtag:handle coderId="22691391" context="hs_algorithm" darkBG="true" /><br />145.6<br />
                    <tc-webtag:handle coderId="15454422" context="hs_algorithm" darkBG="true" /><br />139.99<br />
                    <tc-webtag:handle coderId="22676039" context="hs_algorithm" darkBG="true" /><br />106.53<br />
                    <tc-webtag:handle coderId="22661554" context="hs_algorithm" darkBG="true" /><br />102.82<br />
                    <tc-webtag:handle coderId="22661300" context="hs_algorithm" darkBG="true" /><br />97.33<br />
                    <tc-webtag:handle coderId="10399429" context="hs_algorithm" darkBG="true" /><br />25.0<br />
                    <tc-webtag:handle coderId="21187686" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="21868978" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22707284" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22629374" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22695639" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22652618" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22674474" context="hs_algorithm" darkBG="true" /><br />0.0<br />
                    <tc-webtag:handle coderId="22688741" context="hs_algorithm" darkBG="true" /><br />-25.0<br />
                    <tc-webtag:handle coderId="22653715" context="hs_algorithm" darkBG="true" /><br />-25.0<br />
                    <tc-webtag:handle coderId="14767863" context="hs_algorithm" darkBG="true" /><br />-25.0<br />
                    </td>
                    <%--
                    <td style="padding: 15px" valign="middle" align="center">
                    <tc-webtag:handle coderId="21111148" context="hs_algorithm" darkBG="true" /><br />1255.42<br />
                    <tc-webtag:handle coderId="15604398" context="hs_algorithm" darkBG="true" /><br />1159.15<br />
                    <tc-webtag:handle coderId="12005484" context="hs_algorithm" darkBG="true" /><br />737.73<br />
                    <tc-webtag:handle coderId="22663117" context="hs_algorithm" darkBG="true" /><br />734.48<br />
                    <tc-webtag:handle coderId="10039742" context="hs_algorithm" darkBG="true" /><br />732.41<br />
                    <tc-webtag:handle coderId="21468741" context="hs_algorithm" darkBG="true" /><br />730.74<br />
                    <tc-webtag:handle coderId="10399429" context="hs_algorithm" darkBG="true" /><br />713.94<br />
                    <tc-webtag:handle coderId="15092597" context="hs_algorithm" darkBG="true" /><br />707.07<br />
                    <tc-webtag:handle coderId="15117368" context="hs_algorithm" darkBG="true" /><br />666.37<br />
                    <tc-webtag:handle coderId="20246344" context="hs_algorithm" darkBG="true" /><br />620.50<br />
                    </td>
                    --%>
                </tr>
                <tr>
                    <td align="right"><img src="/i/tournament/tchs08/bracket_SW.png" alt="" border="0" /></td>
                    <%--
                    <td align="right"><img src="/i/tournament/tchs08/bracket_SW.png" alt="" border="0" /></td>
                    --%>
                </tr>
            </table>

            
        </div><%-- #content --%>
        
        <jsp:include page="footer.jsp" />


</div><%-- #wrapper --%>

</body>
</html>