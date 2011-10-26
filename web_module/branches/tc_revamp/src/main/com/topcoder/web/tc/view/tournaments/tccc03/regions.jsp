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

            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="100%" class="tourney_subnav"><img src="/i/clear.gif" alt="" width="10" height="1" border="0" /></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="0" class="tourney_bkgd" width="100%">
                <tr valign="top">
                    <td width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                    <td width="100%"><img src="/i/clear.gif" alt="" width="240" height="10" border="0"/><br/>
                        <table width="100%" border="0" cellpadding="3" cellspacing="1">
                            <tr><td colspan="4" class="statText"><strong>Regional Breakdown</strong><br /><br /></td></tr>

                            <tr>
                                <td width="20%" align="center" class="tourney_subhead1">Northeast</td>
                                <td width="20%" align="center" class="tourney_subhead1">Southeast</td>
                                <td width="20%" align="center" class="tourney_subhead1">West</td>
                                <td width="20%" align="center" class="tourney_subhead1">Midwest</td>
                                <td width="20%" align="center" class="tourney_subhead1">International</td>
                            </tr>

                            <tr valign="top">
                                <td class="statText" nowrap="nowrap">
                                    Connecticut<br />
                                    Delaware<br />
                                    Maine<br />
                                    Maryland<br />
                                    Massachusetts<br />
                                    New&#160;Hampshire<br />
                                    New&#160;Jersey<br />
                                    New&#160;York<br />
                                    Ohio<br />
                                    Pennsylvania<br />
                                    Rhode&#160;Island<br />
                                    Vermont<br />
                                    Virginia<br />
                                    Washington,&#160;DC</td>

                                <td class="statText" nowrap="nowrap">
                                    Alabama<br />
                                    Florida<br />
                                    Georgia<br />
                                    Kentucky<br />
                                    Mississippi<br />
                                    North Carolina<br />
                                    Puerto Rico<br />
                                    South Carolina<br />
                                    Tennessee<br />
                                    US Virgin Islands<br />
                                    West Virginia</td>

                                <td class="statText" nowrap="nowrap">
                                    Alaska<br />
                                    Arizona<br />
                                    California<br />
                                    Colorado<br />
                                    Guam<br />
                                    Hawaii<br />
                                    Idaho<br />
                                    Kansas<br />
                                    Montana<br />
                                    New Mexico<br />
                                    Nevada<br />
                                    Oklahoma<br />
                                    Oregon<br />
                                    Texas<br />
                                    Utah<br />
                                    Washington<br />
                                    Wyoming</td>

                                <td class="statText" nowrap="nowrap">
                                    Arkansas<br />
                                    Iowa<br />
                                    Illinois<br />
                                    Indiana<br />
                                    Louisiana<br />
                                    Michigan<br />
                                    Minnesota<br />
                                    Missouri<br />
                                    Nebraska<br />
                                    North Dakota<br />
                                    South Dakota<br />
                                    Wisconsin</td>

                                <td class="statText" nowrap="nowrap">
                                    Australia<br/>
                                    Canada, excluding Quebec<br/>
                                    China<br/>
                                    India<br />
                                    Ireland<br/>
                                    New Zealand<br/>
                                    United Kingdom
                                </td>
                            </tr>

                            <tr><td colspan="5"><img src="/i/clear.gif" alt="" width="1" height="5" border="0"/></td></tr>
                        </table>
                        <p><br/></p>
                    </td>
                    <td valign="top" width="10"><img src="/i/clear.gif" alt="" width="10" height="1" border="0"/></td>
                </tr>
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
