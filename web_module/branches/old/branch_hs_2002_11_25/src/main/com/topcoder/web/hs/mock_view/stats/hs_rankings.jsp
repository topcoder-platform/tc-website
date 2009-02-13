<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="/hs/includes/global/css.jsp" />
<jsp:include page="/hs/includes/global/top_javascript.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="/hs/includes/global/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="/hs/includes/stats/left_nav_stats.jsp" />
<jsp:include page="/hs/includes/global/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_stats_bg.gif" BGCOLOR="#001934">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_stats.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="100%">&nbsp;
             </TD></TR>
            </TABLE>
        </TD>
    </TR>
    <TR>
        <TD>
        <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
        <TR>
            <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                </TR>
                </TABLE>
            </TD>
            <TD class="statText">
            <!-- Start Body-->
                        <P><B><Font COLOR="cccccc" SIZE="2">NOTE:  The information provided on this page is for 
demonstration purposes only</Font></B></P>    
<P><B>School Rankings</B></P>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
                <TD>
    <SPAN class="statText"><B>Please select a round:</B><BR/></SPAN>
    <SELECT CLASS="dropdown" NAME="Contest" onchange="goTo(this)">
        <OPTION value="#">Select a Round:</OPTION>
        
         
           <OPTION value="/stat?c=round_overview&er=4&rd=4380">Single Round Match 121 > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4375">2002 TopCoder Invitational Championship > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4373" selected>2002 TopCoder Invitational Semifinal > Round 4</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4372">2002 TopCoder Invitational Semifinal > Round 3</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4371">2002 TopCoder Invitational Semifinal > Round 2</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4370">2002 TopCoder Invitational Semifinal > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4365">Single Round Match 120 > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4360">Single Round Match 119 > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4355">2002 TopCoder Inv > Round 4</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4350">Single Round Match 118 > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4345">2002 TopCoder Inv. > Round 3</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4340">Single Round Match 117 > Round 1</OPTION>
           <OPTION value="/stat?c=round_overview&er=4&rd=4335">2002 TopCoder Invitational > Round 2</OPTION>
    </SELECT>
    
    </TD>
  </TR>
  <TR>
                  <TD CLASS="statText">
                     <SPAN CLASS="statText"><B>Please select a School:</B><BR/></SPAN>
                     <SELECT NAME="Round" onchange="goTo(this)" CLASS="dropdown"><OPTION value="#">Select a School:</OPTION>
                       
                         
                           <OPTION value="/hs/stats/hs_rankings.jsp" selected>Hartford Regional</OPTION>
                           <OPTION value="/hs/stats/hs_rankings.jsp" selected>Glastonbury High</OPTION>
                           <OPTION value="/hs/stats/hs_rankings.jsp" selected>Montage Academy</OPTION>
                           <OPTION value="/hs/stats/hs_rankings.jsp" selected>Avon High</OPTION>
                           <OPTION value="/hs/stats/hs_rankings.jsp" selected>Windsor Enfield</OPTION>                                                                                                            
                                          
                       
                     </SELECT>
                   </TD>
                 </TR>  
  </Table>
         <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
           <TR>
             <TD BGCOLOR="#001934"   VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
             <TD COLSPAN="2" VALIGN="top" BGCOLOR="#001934" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<form name="coderRankForm" action="/stat" method="get">
               <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#001934"   WIDTH="100%">
                 <TR>
                   <TD  BGCOLOR="#1B2E5D" COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"  COLSPAN="5" CLASS="statText">
                     Show <INPUT TYPE="text" NAME="nr" MAXLENGTH="4" SIZE="4" value="4" CLASS="bodyText">&nbsp;Schools per page. <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D"  COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
				   
				     &lt;&lt; previous
				   
                     |   
				 
                     <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText"></A>next &gt;&gt;
				   					 
                   </TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" WIDTH="20%" HEIGHT="18">Position</TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="left" WIDTH="48%">
				   <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText">School</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" CLASS="statText" VALIGN="middle" ALIGN="right" WIDTH="20%">
				   <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText">Score</a>
				   </TD>
                   <TD BGCOLOR="#1B2E5D" VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"></TD>
                 </TR>
       
	        
                 <TR>
                   <TD   VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD   CLASS="statText" HEIGHT="13">1</TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/hs/stats/hs_round_stats.jsp" CLASS="coderTextRed">Glastonbury</A>
                   </TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="right">600</TD>
                   <TD   VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		
	        
                 <TR>
                   <TD   VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD   CLASS="statText" HEIGHT="13">2</TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/hs/stats/hs_round_stats.jsp" CLASS="coderTextRed">Avon</A>
                   </TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="right">568</TD>
                   <TD   VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		
	        
                 <TR>
                   <TD   VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD   CLASS="statText" HEIGHT="13">3</TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/hs/stats/hs_round_stats.jsp" CLASS="coderTextRed">Manchester</A>
                   </TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="right">537</TD>
                   <TD   VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		
	        
                 <TR>
                   <TD   VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD   CLASS="statText" HEIGHT="13">4</TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/hs/stats/hs_round_stats.jsp" CLASS="coderTextRed">Marlboro</A>
                   </TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="right">430</TD>
                   <TD   VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
		
	        
                 <TR>
                   <TD   VALIGN="middle" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                   <TD   CLASS="statText" HEIGHT="13">5</TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="left">
					<A HREF="/hs/stats/hs_round_stats.jsp" CLASS="coderTextRed">Hartford</A>
                   </TD>
                   <TD   CLASS="statText" VALIGN="middle" ALIGN="right">385</TD>
                   <TD   VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>

		
                 <TR>
                   <TD   COLSPAN="5"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="5" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BACKGROUND="/i/hs/blue_heading_bg.gif" CLASS="statText" HEIGHT="16" COLSPAN="5" ALIGN="center">
				   
				     &lt;&lt; previous
				   
                     |   
				 
                     <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText"></A>next &gt;&gt;
				   			
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" ALIGN="center" CLASS="statText">
                       Viewing coders ranked&#160;
                       <INPUT TYPE="text" NAME="First" MAXLENGTH="4" SIZE="4" value="1" CLASS="bodyText">
                       &#160;to&#160;
                       <INPUT TYPE="text" NAME="Last" MAXLENGTH="4" VALIGN="center" SIZE="4" value="150" CLASS="bodyText">
                       <A HREF="/hs/stats/hs_rankings.jsp" CLASS="statText">&#160;[ submit ]</A>
                   </TD>
                 </TR>
                 <TR>
                   <TD BGCOLOR="#1B2E5D" COLSPAN="5" VALIGN="middle"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"></TD>
                 </TR>
               </TABLE>
			   <input type="hidden" name="sr" value="">
			   <input type="hidden" name="er" value="">
			   <input type="hidden" name="pg" value="1">
   			   <input type="hidden" name="c" value="coder_ratings">
			   
			   </form>
             </TD>
             <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
           </TR>
           <TR>
             <TD COLSPAN="4" VALIGN="top" BGCOLOR="#001934"   WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
           </TR>      
         </TABLE>
            <!-- End Body-->
            </TD>
             <TD>
                <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
                 <TR>
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"></TD>
                 </TR>
                </TABLE>  
            </TD>
           </TR>
          </TABLE>       
         </TD>
        </TR>

       </TABLE>
        </TD>
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>	
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>	
        <TD  BGCOLOR="#001934" VALIGN="top">&nbsp;&nbsp;</TD>		
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="/hs/includes/global/foot.jsp" />
</BODY>
</HTML>
