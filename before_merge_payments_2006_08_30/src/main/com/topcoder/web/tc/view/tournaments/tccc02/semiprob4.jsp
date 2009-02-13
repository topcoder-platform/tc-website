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
                <jsp:param name="node" value="topcoder_tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<TD class="bodyText" width="100%" valign="top">
<div align="center" style="margin: 0px 10px 0px 10px;">

<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="statTextBig" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

<jsp:include page="links_summary.jsp" />

<BR CLEAR="all"/>         
          
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">         
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/2002tccc/PolePosition_250.pdf" CLASS="bodyText">PolePosition</A> | <A HREF="/i/2002tccc/PolePosition_Anly.pdf" CLASS="bodyText">PolePosition Analysis</A> by jay_peg<BR/>
Level Two (500) - <A HREF="/i/2002tccc/SetPartition_500.pdf" CLASS="bodyText">SetPartition</A> Writer: kyky | <A HREF="/i/2002tccc/SetPartition_Anly.pdf" CLASS="bodyText">SetPartition Analysis</A> by jay_peg<BR/>
Level Three (1000) - <A HREF="/i/2002tccc/ExactChange_1000.pdf" CLASS="bodyText">ExactChange</A> Writer: kyky | <A HREF="/i/2002tccc/ExactChange_Anly.pdf" CLASS="bodyText">ExactChange Analysis</A> by jay_peg<BR/><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 4 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
6:00:00 PM - ZorbaTHut opens the Level One problem <BR/>
6:00:01 PM - Wasteland opens the Level One problem <BR/>
6:00:01 PM - Joe opens the Level One problem <BR/>
6:00:01 PM - evd opens the Level One problem <BR/>
6:28:50 PM - ZorbaTHut submits the Level One problem for 145.54 points <BR/>
6:29:05 PM - ZorbaTHut opens the Level Three problem <BR/>
6:31:56 PM - Wasteland submits the Level One problem for 137.14 points <BR/>
6:32:05 PM - Wasteland opens the Level Two problem <BR/>
6:32:14 PM - Joe opens the Level Two problem <BR/>
6:49:08 PM - Joe submits the Level Two problem for 382.06 points <BR/>
6:49:13 PM - Joe opens the Level Three problem <BR/>
6:50:56 PM - evd opens the Level Two problem <BR/>
6:52:21 PM - Wasteland submits the Level Two problem for 352.22 points <BR/>
6:52:48 PM - Wasteland opens the Level Three problem <BR/>
7:06:22 PM - ZorbaTHut opens the Level Two problem <BR/>
7:10:34 PM - evd submits the Level Two problem for 357.63 points <BR/>
7:12:13 PM - evd submits the Level One problem for 92.03 points <BR/>
7:12:23 PM - evd opens the Level Three problem <BR/>
7:23:29 PM - ZorbaTHut submits the Level Two problem for 380.15 points <BR/>
7:25:25 PM - Joe submits the Level Three problem for 510.29 points <BR/>
7:28:34 PM - Joe submits the Level One problem for 86.71 points <BR/><BR/>

<B>Challenges</B><BR/>
7:40:36 PM - ZorbaTHut challenges Joe on the Level One problem UNsuccessfully<BR/>
          </TD>
            </TR>            
                                   
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
