<%@  page language="java"  %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Tournaments</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<script language="JavaScript">
  function changeImage(image, newImage) {
    document[image].src=newImage;
    return;
  }
</script>
</head>

<body>

<jsp:include page="/top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />

  <br><br>
<TABLE ALIGN="center" CELLSPACING="1" CELLPADDING="1" BORDER="0" WIDTH="100%"><TR><TD BGCOLOR="#666666" HEIGHT="18" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Handle</TD><TD BGCOLOR="#666666" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Points</TD><TD BGCOLOR="#666666" CLASS="statTextBig" VALIGN="middle" ALIGN="center">Tourney Seed</TD></tr>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="272072" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1279.29</TD><TD ALIGN="right" CLASS="statText">1</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="270505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">1025.74</TD><TD ALIGN="right" CLASS="statText">4</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152347" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">837.82</TD><TD ALIGN="right" CLASS="statText">5</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="153505" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">801.24</TD><TD ALIGN="right" CLASS="statText">14</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="262936" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">746.14</TD><TD ALIGN="right" CLASS="statText">16</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="114853" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">726.94</TD><TD ALIGN="right" CLASS="statText">8</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="277659" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">722.16</TD><TD ALIGN="right" CLASS="statText">6</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="120816" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">719.18</TD><TD ALIGN="right" CLASS="statText">12</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="157972" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">718.17</TD><TD ALIGN="right" CLASS="statText">17</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287105" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">701.77</TD><TD ALIGN="right" CLASS="statText">62</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152073" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">684.42</TD><TD ALIGN="right" CLASS="statText">3</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="155275" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">674.64</TD><TD ALIGN="right" CLASS="statText">18</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="260835" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">666.38</TD><TD ALIGN="right" CLASS="statText">2</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="152342" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">647.42</TD><TD ALIGN="right" CLASS="statText">134</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="287266" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">641.49</TD><TD ALIGN="right" CLASS="statText">55</TD></TR>
<TR><TD CLASS="statText"><tc-webtag:handle coderId="264949" context="algorithm"/>
</TD><TD ALIGN="right" CLASS="statText">620.33</TD><TD ALIGN="right" CLASS="statText">59</TD></TR>
</TABLE><BR>
<TABLE CELLSPACING="1" CELLPADDING="0" BORDER="0" WIDTH="100%"><TR><TD BACKGROUND="/i/steel_bluebv_bg.gif" CLASS="statTextBig" HEIGHT="18" VALIGN="middle">&nbsp;&nbsp;<A CLASS="statText" HREF="#top">Back to top</A>
</TD></tr>
</TABLE>


      </TD>
   </TR>
</TABLE>

   <br><br>
</div>
</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="/foot.jsp" />

</body>

</html>
