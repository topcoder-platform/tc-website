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


<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD COLSPAN="2" VALIGN="top" BGCOLOR="#000033" BACKGROUND="/i/steel_darkblue_bg.gif" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><br>

            <jsp:include page="links.jsp" />

  <br><br>
                    <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
                    <TR>
                      <TD COLSPAN="3" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Online Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" WIDTH="30%" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #1<BR/>
                      </TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round1a" CLASS="statTextBig">Advancers</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="35%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round1b" CLASS="statTextBig">Advancers</A></TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=pt1" CLASS="statTextBig">Part 1 Seeding</A></TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=pt2" CLASS="statTextBig">Part 2 Seeding</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">1,024</TD>
                      <TD ALIGN="center" CLASS="statText">512</TD>
                      <TD ALIGN="center" CLASS="statText">512</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                                            
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Dates&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD VALIGN="top" CLASS="statText">Tues. Oct. 8th<BR/>Registration: 6:30 PM - 9:25 PM EDT<BR/>Start: 9:30 EDT</TD>
                      <TD VALIGN="top" CLASS="statText">Thurs. Oct. 10th<BR/>Registration: 6:30 PM - 9:25 EDT<BR/>Start: 9:30 EDT</TD>
                    </TR>
                                                          
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #2<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round2" CLASS="statTextBig">Advancers</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=breakdown" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">512</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">64<BR/>192</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 16th, Start: 9:30 PM EDT</TD>
                    </TR>                   
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #3<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round3" CLASS="statTextBig">Advancers</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=breakdown_r3" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">256</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">32<BR/>32</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                       
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 23th, Start: 9:30 PM EDT</TD>
                    </TR>
                     <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">
                        &#160;&#160;Online Round #4<BR/>
                      </TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=round4" CLASS="statTextBig">Advancers</A> | <A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=breakdown_r4" CLASS="statTextBig">qubits Breakdown</A></TD>
                    </TR>                    
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">64</TD>
                      <TD COLSPAN="2" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                 
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners<BR/>Wildcards</TD>
                      <TD COLSPAN="2" ALIGN="center" HEIGHT="13" CLASS="statText">8<BR/>8</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                       
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">&#160;</TD>
                    </TR>                                                           
                    <TR>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD COLSPAN="2" VALIGN="middle" CLASS="statText">Wed. Oct. 30th, Start: 9:30 PM EST</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="3"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD>
                    </TR>                    
                    </TABLE>                

                   <TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BACKGROUND="/i/steel_darkblue_bg.gif">
                    <TR>
                      <TD COLSPAN="5" VALIGN="middle" HEIGHT="18" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">&#160;&#160;Onsite Schedule</TD>
                    </TR>
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                                        
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Semifinals</TD>
                      <TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_semi" CLASS="statTextBig">Room #1</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_semi" CLASS="statTextBig">Room #2</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_semi" CLASS="statTextBig">Room #3</A></TD>
                      <TD ALIGN="center" VALIGN="middle" WIDTH="11%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_semi" CLASS="statTextBig">Room #4</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">16</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                      <TD ALIGN="center" CLASS="statText">4</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Advancing&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText">&#160;</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">Room Winners</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                      <TD ALIGN="center" HEIGHT="13" CLASS="statText">1</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date: Fri. Nov. 22nd&#160;</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">8:00 AM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">11:00 AM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">3:00 PM</TD>
                      <TD ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">6:00 PM</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=semiroom1" CLASS="statTextBig">Summary</A></TD>
                      <TD COLSPAN="4" ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>
                    </TR>                                     
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
                    </TR> 
                    <TR>
                      <TD HEIGHT="18" ALIGN="left" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">&#160;&#160;Championship</TD>
                      <TD COLSPAN="4" BACKGROUND="/i/steel_bluebv_bg.gif"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD> 
                    </TR>                    
                    <TR>
                      <TD COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                    </TR>                    
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" WIDTH="26%" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><B>Total Competitors</B></TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" WIDTH="74%" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=tourny_champ" CLASS="statTextBig">1 Room</A></TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText">4</TD>
                      <TD COLSPAN="4" ALIGN="center" CLASS="statText">&#160;</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/orangebv_bg.gif">Invitational Champion&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText">1</TD>
                    </TR>                  
                    <TR>
                      <TD ALIGN="right" VALIGN="middle" HEIGHT="13" CLASS="statTextBig" BACKGROUND="/i/steel_gray_bg.gif">Date&#160;</TD>
                      <TD COLSPAN="4" ALIGN="center" VALIGN="middle" CLASS="statText" BACKGROUND="/i/steel_gray_bg.gif">Sat. Nov. 23rd 11:00 AM</TD>
                    </TR>
                    <TR>
                      <TD ALIGN="right" HEIGHT="13" CLASS="statText"><A HREF="/tc?module=Static&d1=tournaments&d2=tci02&d3=champ" CLASS="statTextBig">Summary</A></TD>
                      <TD COLSPAN="4" ALIGN="center" HEIGHT="13" CLASS="statText">&#160;</TD>
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
