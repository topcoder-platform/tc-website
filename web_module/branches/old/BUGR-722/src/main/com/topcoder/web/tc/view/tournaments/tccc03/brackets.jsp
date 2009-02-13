<%@  page language="java"  %>
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


            <jsp:include page="links.jsp" />
            <jsp:include page="links_summary.jsp" />

            <table border="0" cellspacing="0" cellpadding="3" width="100%">
                <tr><td height="1"><img src="/i/clear.gif" alt="" width="10" height="3" border="0"/></td></tr>
                <tr><td class="tourney_subnav" colspan="3"><strong>Tournament Advancement Brackets</strong></td></tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="100%" bgcolor="#333333">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="99%" class="bodyText"><div align="center"><img src="/i/tournament/tccc03/tccc03_brackets.gif" width="507" height="312" usemap="#tccc03_rooms" border="0"/></div></td>

                        <map name="tccc03_rooms">
                            <AREA SHAPE="rect" ALT="" COORDS="391,261,498,284" HREF="/tc?module=MemberProfile&cr=274498" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,234,498,256" HREF="/tc?module=MemberProfile&cr=266571" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,207,498,229" HREF="/tc?module=MemberProfile&cr=155275" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,179,499,202" HREF="/tc?module=MemberProfile&cr=262936" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,106,498,128" HREF="/tc?module=MemberProfile&cr=156592" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,79,499,101" HREF="/tc?module=MemberProfile&cr=251183" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="389,53,498,74" HREF="/tc?module=MemberProfile&cr=114853" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="390,25,498,48" HREF="/tc?module=MemberProfile&cr=158837" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="268,220,377,242" HREF="/tc?module=MemberProfile&cr=262936" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="268,66,376,88" HREF="/tc?module=MemberProfile&cr=114853" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="199,143,307,165" HREF="/tc?module=MemberProfile&cr=262936" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="130,220,238,242" HREF="/tc?module=MemberProfile&cr=107835" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="129,65,239,88" HREF="/tc?module=MemberProfile&cr=269554" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="8,261,116,283" HREF="/tc?module=MemberProfile&cr=273112" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="7,235,117,256" HREF="/tc?module=MemberProfile&cr=107835" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="8,207,116,228" HREF="/tc?module=MemberProfile&cr=287496" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="8,179,116,202" HREF="/tc?module=MemberProfile&cr=264869" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="8,107,116,129" HREF="/tc?module=MemberProfile&cr=311051" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="9,78,117,101" HREF="/tc?module=MemberProfile&cr=269554" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="7,52,117,73" HREF="/tc?module=MemberProfile&cr=263379" class="statText"/>
                     <AREA SHAPE="rect" ALT="" COORDS="7,24,116,47" HREF="/tc?module=MemberProfile&cr=153902" class="statText"/>
                        </map>   
            
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>

                <tr><td colspan="4" width="100%"><img src="/i/clear.gif" alt="" width="1" height="10" border="0"/></td></tr>     
            </table>

   <br><br>
   </div>
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
