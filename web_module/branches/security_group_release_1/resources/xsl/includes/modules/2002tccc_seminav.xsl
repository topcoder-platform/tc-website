<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="seminav">
<SPAN>
<!-- <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" WIDTH="96" ALIGN="left">
 	<TR>
        <TD BGCOLOR="#FFFFFF" VALIGN="middle"></TD>
    </TR>
</TABLE> -->   
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="100%" ALIGN="right">
 	<TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText" ALIGN="center"><IMG SRC="/i/02tccc_logow_sm.gif" ALT="" WIDTH="96" HEIGHT="74" ALIGN="left" HSPACE="5" VSPACE="15" BORDER="0"/></TD> 	
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="3" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
	<TR><TD COLSPAN="3" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
	<TR>
		<TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
		<TD WIDTH="70%" BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">TOURNAMENT LINKS:</TD> 
		
		<TD WIDTH="30%" BGCOLOR="#FFFFFF" VALIGN="middle" ALIGN="right" CLASS="moduleTitle"><A HREF="/index?t=statistics&amp;c=2002tccc_breakdown" CLASS="bodyText">-&#160;Bracket&#160;Update</A>&#160;&#160;</TD>
	</TR>                    
	<TR>
    	<TD COLSPAN="3" VALIGN="top" BGCOLOR="#999999" WIDTH="100%" NOWRAP="0">
		<TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
		<TR>
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Room 1:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1" CLASS="bodyText">Summary</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob1" CLASS="bodyText">Problems</A><BR/>			
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob1#log" CLASS="bodyText">Chrono Log</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1#photo" CLASS="bodyText">Photos</A><BR/>
			</TD>		
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Room 2:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2" CLASS="bodyText">Summary</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob2" CLASS="bodyText">Problems</A><BR/>			
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob2#log" CLASS="bodyText">Chrono Log</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2#photo" CLASS="bodyText">Photos</A><BR/>
			</TD>
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Room 3:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3" CLASS="bodyText">Summary</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob3" CLASS="bodyText">Problems</A><BR/>			
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob3#log" CLASS="bodyText">Chrono Log</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3#photo" CLASS="bodyText">Photos</A><BR/>
			</TD>
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Room 4:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4" CLASS="bodyText">Summary</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob4" CLASS="bodyText">Problems</A><BR/>			
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob4#log" CLASS="bodyText">Chrono Log</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4#photo" CLASS="bodyText">Photos</A><BR/>
			</TD>									
			<TD VALIGN="top" CLASS="bodyText" NOWRAP="0">&#160;&#160;<B>Championship:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_champ" CLASS="bodyText">Summary</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_champprob" CLASS="bodyText">Problems</A><BR/>			
			- <A HREF="/index?t=statistics&amp;c=2002tccc_champprob#log" CLASS="bodyText">Chrono Log</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_champ#photo" CLASS="bodyText">Photos</A><BR/>
			</TD>						
        </TR>
		<!-- <TR>
			<TD VALIGN="top" CLASS="bodyText">&#160;&#160;<B>Summary:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1" CLASS="bodyText">Round 1</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2" CLASS="bodyText"></A>Round 2<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3" CLASS="bodyText"></A>Round 3<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4" CLASS="bodyText"></A>Round 4<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semichamp" CLASS="bodyText"></A>Championship<BR/>
			</TD>		
			<TD VALIGN="top" CLASS="bodyText">&#160;&#160;<B>Problems:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob1" CLASS="bodyText">Round 1</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob2" CLASS="bodyText"></A>Round 2<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob3" CLASS="bodyText"></A>Round 3<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprob4" CLASS="bodyText"></A>Round 4<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiprobchamp" CLASS="bodyText"></A>Championship<BR/>
			</TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;&#160;<B>Chrono Log:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semilog1" CLASS="bodyText">Round 1</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semilog2" CLASS="bodyText"></A>Round 2<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semilog3" CLASS="bodyText"></A>Round 3<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semilog4" CLASS="bodyText"></A>Round 4<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semilogchamp" CLASS="bodyText"></A>Championship<BR/>			
			</TD>
			<TD VALIGN="top" CLASS="bodyText">&#160;&#160;<B>Photos:</B><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom1#photo" CLASS="bodyText">Round 1</A><BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom2#photo" CLASS="bodyText"></A>Round 2<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom3#photo" CLASS="bodyText"></A>Round 3<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semiroom4#photo" CLASS="bodyText"></A>Round 4<BR/>
			- <A HREF="/index?t=statistics&amp;c=2002tccc_semichamp#photo" CLASS="bodyText"></A>Championship<BR/>			
			</TD>						
        </TR> -->
        
        
        
        
        
		<TR><TD VALIGN="top" COLSPAN="3" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>    		
		</TABLE>
		</TD>
	</TR>
 	<TR><TD COLSPAN="3" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE></SPAN>
  </xsl:template>
</xsl:stylesheet>
