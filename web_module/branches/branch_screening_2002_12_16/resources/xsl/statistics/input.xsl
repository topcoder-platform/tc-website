<?xml version="1.0"?>

<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">

<!--This template provides a select control for listing Contests-->

<xsl:template name="contestList">

    <SELECT NAME="Contest" SIZE="1" onChange="tmp=this.options[this.selectedIndex].value.split('~');location='index?t=statistics&amp;c=room_stats&amp;Contest_Id='+tmp[0]+'&amp;Round_Id='+tmp[1]">

      <xsl:for-each select="/TC/STATLISTS/Main/ContestItem">

	  	<xsl:sort select="ContestStart" order="descending"/>

		<xsl:sort select="RoundId" order="descending"/>

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="ContestId"/>~<xsl:value-of select="RoundId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/Main/RoundId=RoundId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="ContestName"/> > <xsl:value-of select="RoundDesc"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>



<!--This template provides a select control for listing Rooms-->

<xsl:template name="roomList">

    <SELECT NAME="Contest" SIZE="1">

      <xsl:attribute name="onChange">

        location='index?t=statistics&amp;c=room_stats&amp;Contest_Id=<xsl:value-of select="/TC/STATLISTS/Main/ContestId"/>&amp;Round_Id=<xsl:value-of select="/TC/STATLISTS/Main/RoundId"/>&amp;Room_Id='+this.options[this.selectedIndex].value

      </xsl:attribute>

      <xsl:for-each select="/TC/STATLISTS/Main/ContestItem/RoomItem">

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="RoomId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/Main/RoomId=RoomId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="RoomDesc"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>



<xsl:template name="contestListRound">

    <SELECT NAME="Contest" SIZE="1" onChange="tmp=this.options[this.selectedIndex].value.split('~');location='index?t=statistics&amp;c=round_stats&amp;Contest_Id='+tmp[0]+'&amp;Round_Id='+tmp[1]">

      <xsl:for-each select="/TC/STATLISTS/Main/ContestItem">

	  	<xsl:sort select="ContestStart" order="descending"/>

		<xsl:sort select="RoundId" order="descending"/>

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="ContestId"/>~<xsl:value-of select="RoundId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/Main/RoundId=RoundId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="ContestName"/> > <xsl:value-of select="RoundDesc"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>

<!--This template provides a select control for listing Contests-->

<xsl:template name="contestcombo">

    <SELECT NAME="Contest" SIZE="1" onChange="doLoadContest(this.options[this.selectedIndex].value)">

      <xsl:for-each select="/TC/STATLISTS/CoderContestList/ContestItem">

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="ContestId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/ContestId=ContestId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="ContestName"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>



<!--This template provides a select control for listing Contests-->

<xsl:template name="contestroundList">

    <SELECT NAME="RoundList" SIZE="1" onChange="doLoadRound(this.options[this.selectedIndex].value)">

      <xsl:for-each select="/TC/STATLISTS/CoderContestRoundList/Round">

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="RoundId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/RoundId=RoundId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="RoundDesc"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>



<!--This template provides a select control for listing Problems-->

<xsl:template name="problemList">

    <SELECT NAME="Problem" SIZE="1" onChange="doLoadUserProblem(this.options[this.selectedIndex].value)">

      <xsl:for-each select="/TC/STATLISTS/Main/Contest/Problem">

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="ProblemId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/Main/ProblemId=ProblemId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="ClassName"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>



<!--This template provides a select control for listing Coders-->

<xsl:template name="coderList">

    <SELECT NAME="Coder" SIZE="1">

      <OPTION VALUE=""></OPTION>

      <xsl:for-each select="/TC/STATLISTS/Rounds/Round/KeyCoders">

        <OPTION>

          <xsl:attribute name="VALUE"><xsl:value-of select="ProblemId"/></xsl:attribute>

          <xsl:if test="/TC/STATLISTS/Rounds/Round/KeyCoders/CoderId=CoderId">

            <xsl:attribute name="SELECTED">TRUE</xsl:attribute>

          </xsl:if>

          <xsl:value-of select="CoderHandle"/>

        </OPTION>

      </xsl:for-each>

    </SELECT>

</xsl:template>





</xsl:stylesheet>

 

