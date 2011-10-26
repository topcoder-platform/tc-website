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
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/2002tccc/QuickBrownFox_250.pdf" CLASS="bodyText">QuickBrownFox</A> by kyky<BR/>
Level Two (500) - <A HREF="/i/2002tccc/HiddenSeq_500.pdf" CLASS="bodyText">HiddenSeq</A> | <A HREF="/i/2002tccc/HiddenSeq_Anly.pdf" CLASS="bodyText">HiddenSeq Analysis</A> by wyzmo<BR/>
Level Three (1000) - <A HREF="/i/2002tccc/Cubes_1000.pdf" CLASS="bodyText">Cubes</A> | <A HREF="/i/2002tccc/Cubes_Anly.pdf" CLASS="bodyText">Cubes Analysis</A> by qubits<BR/><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 2 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
11:00:02 AM - bigg_nate opens the Level One problem <BR/>
11:00:04 AM - ColinMacLeod opens the Level One problem <BR/>
11:00:06 AM - dmwright opens the Level One problem <BR/>
11:00:31 AM - Logan opens the Level Three problem <BR/>
11:04:35 AM - ColinMacLeod opens the Level Two problem <BR/>
11:12:01 AM - dmwright submits the Level One problem for 214.73 points <BR/>
11:12:32 AM - dmwright opens the Level Two problem <BR/>
11:13:24 AM - bigg_nate submits the Level One problem for 207.89 points <BR/>
11:13:42 AM - bigg_nate opens the Level Two problem <BR/>
11:27:46 AM - dmwright submits the Level Two problem for 397.86 points <BR/>
11:28:14 AM - dmwright opens the Level Three problem <BR/>
11:30:21 AM - ColinMacLeod submits the Level Two problem for 310.51 points <BR/>
11:31:50 AM - ColinMacLeod opens the Level Three problem <BR/>
11:32:18 AM - Logan opens the Level One problem <BR/>
11:42:35 AM - Logan submits the Level One problem for 222.34 points <BR/>
11:42:47 AM - Logan opens the Level Two problem <BR/>
11:47:01 AM - bigg_nate submits the Level Two problem for 267.72 points <BR/>
11:47:04 AM - bigg_nate opens the Level Three problem <BR/>
12:04:01 PM - Logan submits the Level Two problem for 344.25 points <BR/>
12:05:26 PM - dmwright submits the Level Three problem for 502.32 points <BR/><BR/>

<B>Challenges</B><BR/>
12:23:47 PM - bigg_nate challenges ColinMacLeod on the Level Two problem UNsuccessfully <BR/>
12:31:05 PM - ColinMacLeod challenges bigg_nate on the Level Two problem UNsuccessfully <BR/>

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
