<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:template name="arena">
          <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="170">            
                <TR> 
                  <TD CLASS="moduleTitle" BGCOLOR="#43515E" BACKGROUND="/i/steel_gray_bg.gif" HEIGHT="18" VALIGN="TOP"><IMG SRC="/i/label_arena.gif" ALT="The Arena" WIDTH="170" HEIGHT="17" BORDER="0"/></TD>
                </TR>             
            <TR> 
                <TD BGCOLOR="#43515E" VALIGN="top"> 
                  <TABLE BGCOLOR="#FFFFFF" WIDTH="170" CELLSPACING="0" CELLPADDING="0" BORDER="0">
                  
              <TR> 
                        <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                       
                       <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="13">
                                  &#160;&#160;Java Web Start
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                      
                      <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="moduleText" BGCOLOR="#FFFFFF" VALIGN="bottom">
                         Run the Arena as a <A HREF="http://java.sun.com/products/javawebstart/index.html" TARGET="_blank" CLASS="moduleText">Java Web Start</A> Application.<BR/><BR/>
                          If you have Java Web Start installed, <A HREF="/contest/arena/ContestAppletProd.jnlp" CLASS="moduleText">Click here</A> to load the Arena as a Java application.<BR/><BR/>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
                      
                       <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="13">
                                  &#160;&#160;Arena Plugins
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                     
                       <TR> 
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="moduleText" BGCOLOR="#FFFFFF" VALIGN="bottom">
<A HREF="/index?t=arena&amp;c=plugins" CLASS="moduleText">Click here</A> for information and downloads.<br/><br/>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>                      

<xsl:if test="/TC/LoggedIn='true'">
                       <TR>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="statTextBig" BACKGROUND="/i/steel_bluebv_bg.gif" VALIGN="middle" HEIGHT="13">
                                  &#160;&#160;Arena Source
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
                       <TR>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                        <TD CLASS="moduleText" BGCOLOR="#FFFFFF" VALIGN="bottom">
<A HREF="/index?t=arena&amp;c=source" CLASS="moduleText">Click here</A> for information.<br/>
                        </TD>
                        <TD CLASS="data" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="6" HEIGHT="1" BORDER="0"/></TD>
                      </TR>
</xsl:if>
                     

 
              <TR> 
                        <TD BGCOLOR="#FFFFFF" COLSPAN="3"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
                      </TR>
                  </TABLE>
                </TD>
            </TR>
          </TABLE>
  </xsl:template>
</xsl:stylesheet>
