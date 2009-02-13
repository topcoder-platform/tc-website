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
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Problems</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
<IMG SRC="/i/pdf_iconw.gif" ALT="" WIDTH="31" HEIGHT="31" BORDER="0"/><BR/>
Level One (250) - <A HREF="/i/2002tccc/MaxDensity_250.pdf" CLASS="bodyText">MaxDensity</A> by kyky<BR/>
Level Two (500) - <A HREF="/i/2002tccc/Gin_500.pdf" CLASS="bodyText">Gin</A> Writer: jay_peg | <A HREF="/i/2002tccc/Gin_Anly.pdf" CLASS="bodyText">Gin Analysis</A> by alexcchan<BR/>
Level Three (1000) - <A HREF="/i/2002tccc/Nested_1000.pdf" CLASS="bodyText">Nested</A> | <A HREF="/i/2002tccc/Nested_Anly.pdf" CLASS="bodyText">Nested Analysis</A> by qubits<BR/><BR/>

          </TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><A NAME="log"></A><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>             
            <TR>
              <TD VALIGN="middle" HEIGHT="18" BACKGROUND="/i/steel_gray_bg.gif" CLASS="statTextBig">&#160;&#160;Semifinal Room 3 Chrono Logs</TD>
            </TR>
            <TR>
              <TD VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="3" BORDER="0"/></TD>
            </TR>                                             
            <TR>
              <TD VALIGN="top" CLASS="bodyText">
3:00:00 PM - po opens the Level One problem <BR/>
3:00:01 PM - milhouse opens the Level One problem <BR/>
3:00:02 PM - malpt opens the Level One problem <BR/>
3:00:11 PM - ante opens the Level One problem <BR/>
3:08:30 PM - po submits the Level One problem for 230.04 points <BR/>
3:08:39 PM - po opens the Level Two problem <BR/>
3:08:52 PM - malpt submits the Level One problem for 228.66 points <BR/>
3:09:52 PM - malpt opens the Level Two problem <BR/>
3:10:35 PM - milhouse submits the Level One problem for 221.02 points <BR/>
3:10:53 PM - milhouse opens the Level Two problem <BR/>
3:11:16 PM - ante submits the Level One problem for 218.60 points <BR/>
3:11:48 PM - ante opens the Level Two problem <BR/>
3:34:37 PM - malpt submits the Level Two problem for 317.48 points <BR/>
3:35:08 PM - malpt opens the Level Three problem <BR/>
3:35:20 PM - ante submits the Level Two problem for 326.40 points <BR/>
3:36:13 PM - ante opens the Level Three problem <BR/>
3:38:29 PM - milhouse submits the Level Two problem for 298.75 points <BR/>
3:38:42 PM - milhouse opens the Level Three problem <BR/>
3:49:33 PM - po submits the Level Two problem for 238.07 points <BR/>
3:49:42 PM - po opens the Level Three problem <BR/>
4:02:39 PM - ante submits the Level Three problem for 612.34 points <BR/>
4:09:13 PM - malpt submits the Level Three problem for 528.33 points <BR/><BR/>

<B>Challenges</B><BR/>
4:33:51 PM - milhouse challenges malpt on the Level Two problem UNsuccessfully <BR/>
4:34:26 PM - po challenges ante on the Level Three problem successfully <BR/>
4:43:07 PM - ante challenges malpt on the Level Three problem UNsuccessfully<BR/>

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
