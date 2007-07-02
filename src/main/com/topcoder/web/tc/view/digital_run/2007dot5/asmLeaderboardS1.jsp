<%@ page contentType="text/html;charset=utf-8" %> 
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" 
    "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<head>
    <title>TopCoder - Digital Run Assembly Cup Series Leaderboard</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <script type="text/javascript" src="/js/popup.js"></script>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
    <script language="JavaScript" type="text/javascript">
    <!--
    function postPopUpText(myText) {
        document.getElementById("popUpText").innerHTML = myText;
    }
    //-->
    </script>
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
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="maxWidthBody">
            
            <jsp:include page="../../page_title.jsp">
                <jsp:param name="image" value="digital_run_20061031"/>
                <jsp:param name="title" value="Assembly Cup Series Leaderboard"/>
            </jsp:include>

<table cellpadding="0" cellspacing="0" class="stat" width="100%">
<tbody>
    <tr>
        <td class="title" colspan="8">
            Assembly Cup Series Leaderboard
        </td>
    </tr>
    <tr>
        <td class="headerC">
            Rank
        </td>
        <td class="header" style="border-right: 1px solid #999999;" width="20%">
            Handle
        </td>
        <td class="headerR" colspan="3">
            Points
        </td>
        <td class="headerR" nowrap="nowrap" width="20%">
            Top Five Prize*</td>
        <td class="headerR" nowrap="nowrap" width="20%">
            Top Performer Prize*</td>
        <td class="headerR" width="20%">
            Total Prizes*</td>
    </tr>
    <tr class="light">
<td class="valueC">1</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="11790647" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">4815</td>
<td class="valueR">$15,000.00</td>
<td class="valueR">$10,134.62</td>
<td class="valueR">$25,134.62</td>
    </tr>
    <tr class="dark">
<td class="valueC">1</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="22672905" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">4815</td>
<td class="valueR">$15,000.00</td>
<td class="valueR">$10,134.62</td>
<td class="valueR">$25,134.62</td>
    </tr>
    <tr class="light">
<td class="valueC">3</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="21822205" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">4175</td>
<td class="valueR">$7,000.00</td>
<td class="valueR">$8,787.55</td>
<td class="valueR">$15,787.55</td>
    </tr>
    <tr class="dark">
<td class="valueC">4</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="22672442" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">3000</td>
<td class="valueR">$1,666.67</td>
<td class="valueR">$6,314.40</td>
<td class="valueR">$7,981.07</td>
    </tr>
    <tr class="light">
<td class="valueC">4</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="22681353" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">3000</td>
<td class="valueR">$1,666.67</td>
<td class="valueR">$6,314.40</td>
<td class="valueR">$7,981.07</td>
    </tr>
    <tr class="dark">
<td class="valueC">4</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="21271044" /></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Five</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueC"><div align="center"><img src="/i/interface/emblem/prize.gif" alt="" onmouseover="postPopUpText('Cash prize for placing in the <strong>Top Performers</strong>'); popUp(this,'myPopUp')" onmouseout="popHide()" border="0" /></div></td>
<td class="valueR">3000</td>
<td class="valueR">$1,666.67</td>
<td class="valueR">$6,314.40</td>
<td class="valueR">$7,981.07</td>
    </tr>
    <tr class="light">
<td class="valueC">7</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="299180" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">2925</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="dark">
<td class="valueC">8</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="7211060" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">2000</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="light">
<td class="valueC">9</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="278460" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">1950</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="dark">
<td class="valueC">10</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="22682300" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">1440</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="light">
<td class="valueC">10</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="22654284" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">1440</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="dark">
<td class="valueC">10</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="21866650" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">1440</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
    <tr class="light">
<td class="valueC">13</td>
<td class="value" style="border-right: 1px solid #999999;"><tc-webtag:handle coderId="21935467" /></td>
<td class="valueC">&nbsp;</td>
<td class="valueC">&nbsp;</td>
<td class="valueR">1250</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
<td class="valueR">&nbsp;</td>
    </tr>
</tbody>
</table>

<p class="small" align="left">
    * Prizes are based on current earned points and the dollar per point value for completed projects. Current and
    future projects may affect the final results.
</p>

<div class="popUp" id="myPopUp">
    <div id="popUpText">&nbsp;</div>
</div>

            </div>
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