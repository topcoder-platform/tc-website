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
function open_window(url) {
mywin =
window.open(url,"win",'toolbar=0,location=0,directories=0,status=0,menubar=0,scrollbars=1,resizable=0,width=433,height=288');
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
                <jsp:param name="node" value="press_room"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div style="margin: 0px 10px 0px 10px;">

<jsp:include page="/page_title.jsp">
    <jsp:param name="image" value="press_room"/>
    <jsp:param name="title" value="TopCoder Press Release"/>
</jsp:include>

<P CLASS="bodyTextBold">08.29.2001 - Applet Source Code Released <BR/></P>
<P>TopCoder has recently made an important decision. We have decided to begin outsourcing all of the development of TopCoder's competition software to our member base. Starting immediately, the source code for the Competition Arena ("the applet") will be available to all of our registered members. We are providing this in hopes that our members will add features, point out problems or bugs, and potentially increase the value and the quality of the interface. You are all certainly welcome to discuss any potential applet improvements and enhancements in our Round Tables.</P>
<P>In order to download the applet source code, you will need to agree to a software license that TopCoder has created. Comments on this agreement are welcomed and encouraged in the TopCoder Round Tables. In essence, the agreement specifies that we (TopCoder) own the original code, and you (the developer) own any modifications to our code - granting TopCoder a non-exclusive right to use those modifications. In the event that a member develops an improvement or addition to the Competition Arena Applet that is ultimately incorporated into TopCoder's production software, the member may, and for any foreseeable circumstances will be offered compensation for their development effort. All correspondence with TopCoder regarding the applet development effort should be conducted using the applet@topcoder.com email address. The source code package is accessible by logging in to the web site, and selecting "Source Library" from within the "Competition Area".</P>
<P>Over the next couple of weeks, TopCoder will be defining larger scale projects that will encompass server code, in addition to the client code. In these cases, we will solicit participation interest from our members, and choose project participants based primarily on prior TopCoder involvement in Round Tables and competitions. These developers will be given access to a member development environment that we've created that mirrors our production environment. The development environment will be accessible via a virtual-private-network. We will expect any participating members to assist TopCoder in the design, development, and integration processes associated with these projects. Our ultimate goal is to "componentize" our software, allowing the users of our web site and our competition software to choose which functionality and style they wish to utilize. Payment for these projects will be established ahead of time, and will be based on milestones in the design, development, and integration processes.  </P>
<P><BR/></P>



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
