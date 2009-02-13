<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../authentication/form.xsl"/>
  <xsl:template name="module_login">
      		<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" VALIGN="top" WIDTH="170">
              	<TR> 
                	<TD CLASS="moduleTitle" BGCOLOR="#990000" HEIGHT="17" VALIGN="middle"><IMG SRC="/i/label_login.gif" ALT="Member Login" WIDTH="170" HEIGHT="17" VSPACE="3" BORDER="0"/></TD>
              	</TR>        		
        		<TR> 
          			<TD BGCOLOR="#43515E" VALIGN="top"> 
            			<TABLE BGCOLOR="#990000" WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0">
              				<TR> 
                				<TD CLASS="data" BGCOLOR="#990000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                				<TD CLASS="statText"  BGCOLOR="#990000" VALIGN="top">
			
<xsl:call-template name="Form"/>				
               				<A HREF="index?t=authentication&amp;c=recover_password" CLASS="statText">- Password help</A>
                				</TD>
                				<TD CLASS="data" BGCOLOR="#990000" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
              				</TR>
							<TR> 
                				<TD BGCOLOR="#990000" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
              				</TR>
            			</TABLE>
		          	</TD>
        		</TR>       		
      		</TABLE>
              <!-- <DIV CLASS="smallText" ALIGN="right">
                Forget your password? 
                <A HREF="index?t=authentication&amp;c=recover_password" CLASS="smallText">Click here</A>.
              <BR/>New to TopCoder?
	      <A CLASS="smallText"><xsl:attribute name="HREF">https://<xsl:value-of select="/TC/Host"/>/Registration</xsl:attribute>Register now</A>.
              </DIV><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/>  -->   		
  </xsl:template>
</xsl:stylesheet>
