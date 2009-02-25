<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Coaches</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>


<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>

</head>

<body>

<jsp:include page="../../top.jsp" >
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

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="component"/>
   <jsp:param name="tabLev2" value="coaches"/>
   <jsp:param name="tabLev3" value="request"/>
</jsp:include>

         <h2>Collegiate Challenge Coaches</h2>

         <p>Please note that coaches are only available for the Component Design Competition of the 2004 TCCC.  When requesting a coach, include your TopCoder handle in the email body.  Coaching slots will be assigned on a first-come-first-serve basis.  TopCoder asks that you only send a coaching request email if you are sure that you are eligible to participate, and you intend to participate in the Component Design Competition of the 2004 TCCC.</p>

         <p>IMPORTANT:  By requesting a coach, you are agreeing to forgo 10% of all prize and component payments that you earn for the Component Design Competition of the 2004 TCCC</p>

         <h3 align="center"><font color="#CC0000">TopCoder is no longer accepting coach requests for the 2004 Collegiate Challenge</font></h3>

            <table width="300" align="center" border="0" cellpadding="6" cellspacing="2" class="sidebarBox">
                <tr>
                    <td class="sidebarTitle" width="40%">Coach</td>
                    <td class="sidebarTitle" width="30%" align="center">View Stats</td>
                    <td class="sidebarTitle" width="30%" align="center">Total Slots</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">b0b0b0b</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=273206">View stats</a></td>
                    <td class="sidebarText" align="center">2</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">bokbok</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=153434">View stats</a></td>
                    <td class="sidebarText" align="center">2</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Farlox</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=252277">View stats</a></td>
                    <td class="sidebarText" align="center">4</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">giginim</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=304976">View stats</a></td>
                    <td class="sidebarText" align="center">5</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">isv</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=299180">View stats</a></td>
                    <td class="sidebarText" align="center">1</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">kyky</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=152342">View stats</a></td>
                    <td class="sidebarText" align="center">3</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">mishagam</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=299904">View stats</a></td>
                    <td class="sidebarText" align="center">3</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">orb</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=150940">View stats</a></td>
                    <td class="sidebarText" align="center">3</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">Pops</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=119676">View stats</a></td>
                    <td class="sidebarText" align="center">3</td>
                </tr>
                <tr valign="top">
                    <td class="sidebarText">srowen</td>
                    <td class="sidebarText" align="center" nowrap="0"><a href="/tc?module=MemberProfile&cr=296145">View stats</a></td>
                    <td class="sidebarText" align="center">3</td>
                </tr>
             </table>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
