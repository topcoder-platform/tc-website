<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
    <xsl:import href="../menu.xsl"/>
    <xsl:import href="../top.xsl"/>

    <xsl:preserve-space elements="*"/>
    <xsl:template match="/">

        <html>
            <head>
                <title>Contest Round Administrative Menu Page</title>
            </head>
            <body>
                <xsl:call-template name="Top"/>
                <xsl:call-template name="Menu"/>


                    <TABLE width="100%" cellpadding="0" cellspacing="0" border="0">
                        <tr>
                            <td valign="center" align="center">
                                <br/>
                                <br/>
                                <table width="819" cellspacing="0" cellpadding="0" border="5">
                                    <tr>
                                        <td>
                                            <xsl:text>Round Id</xsl:text>
                                        </td>
                                        <td>
                                            <xsl:text>Challenges by Room</xsl:text>
                                        </td>
                                        <td>
                                            <xsl:text>Challenges by Problem</xsl:text>
                                        </td>
                                        <td>
                                            <xsl:text>Challenges by Coder</xsl:text>
                                        </td>
                                        <td>
                                            <xsl:text>Round Name</xsl:text>
                                        </td>
                                    </tr>
                                    <xsl:for-each select="/TC/CHALLENGE/Round">
                                        <tr>
                                            <td>
                                                <xsl:value-of select="RoundId"/>
                                            </td>
                                            <td>
                                                <A>
                                                    <xsl:attribute name="HREF">/admin?Task=challenge&amp;Command=getRoomList&amp;roundid=<xsl:value-of select="RoundId"/></xsl:attribute>
                                                    By Room
                                                </A>
                                            </td>
                                            <td>
                                                <A>
                                                    <xsl:attribute name="HREF">/admin?Task=challenge&amp;Command=getProblemList&amp;roundid=<xsl:value-of select="RoundId"/></xsl:attribute>
                                                    By Problem
                                                </A>
                                            </td>
                                            <td>
                                                <A>
                                                    <xsl:attribute name="HREF">/admin?Task=challenge&amp;Command=getCoderList&amp;roundid=<xsl:value-of select="RoundId"/></xsl:attribute>
                                                    By Coder
                                                </A>
                                            </td>
                                            <td>
                                                <xsl:value-of select="ContestName"/> /
                                                <xsl:value-of select="RoundName"/>
                                            </td>
                                        </tr>
                                    </xsl:for-each>
                                </table>
                            </td>
                        </tr>
                    </TABLE>

            </body>

        </html>
    </xsl:template>
</xsl:stylesheet>
