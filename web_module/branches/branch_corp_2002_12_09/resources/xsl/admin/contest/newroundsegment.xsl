<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
<xsl:import href="../../css.xsl"/>
<xsl:import href="../../top.xsl"/>
<xsl:import href="../../bottom.xsl"/>
<xsl:import href="../adminLeft.xsl"/>
<xsl:import href="contesttop.xsl"/>
<xsl:import href="contestbottom.xsl"/>

<xsl:template match="/">
<html>

<head>
<title>Contest Round Segment Setup Screen</title>

<xsl:call-template name="CSS"/>

</head>

<SCRIPT TYPE="text/Javascript"><![CDATA[

function doNext() { 
  if(doCheck()) {
    window.document.frmRoundSegment.Command.value="roundsegmentnext";
    doSubmit();
  }
}

function doContest() {
  window.document.frmRoundSegment.Command.value="getContestModifyScreen";
  window.document.frmRoundSegment.results.value = document.frmRoundSegment.contestId.value;
  doSubmit();
}

function doRound() {
  window.document.frmRoundSegment.Command.value="getRoundModifyScreen";
  window.document.frmRoundSegment.results.value = document.frmRoundSegment.roundId.value;
  doSubmit();
}

function doSubmit(){ window.document.frmRoundSegment.submit(); }

function doCheck(){
  if(window.document.frmRoundSegment.roundtype.value=="") {
    alert("Please enter a Round Type.");
    window.document.frmRoundSegment.roundtype.focus();
    return false;
  }
  
  if(timeCheck('starttime') && timeCheck('endtime')) {
    return timeCheck('intendtime');
  }
  else {
   return false;
  }

  return true;
}


function timeCheck(whatTime) {
  timeString = window.document.frmRoundSegment[whatTime].value;

  if((timeString == "") || (timeString.length != 8)) {
    alert("Please enter valid Round Segment Times.");
    window.document.frmRoundSegment[whatTime].focus();
    return false;
  }


  delimChar = ':';

  delimIndex1 = timeString.indexOf(delimChar);

  if(delimIndex1 == 2) {
    hourVal = timeString.substring(0, delimIndex1);
    hourVal = parseInt(hourVal);
    if((hourVal < 24) && (hourVal > -1)) {
      delimIndex2 = timeString.indexOf(delimChar, delimIndex1 + 1);
      if(delimIndex2 == 5) {
        minuteVal = timeString.substring(delimIndex1 + 1, delimIndex2);
        if((minuteVal < 60) && (minuteVal > -1)) {
          secondVal = timeString.substring(delimIndex2 + 1);
          if((secondVal < 60) && (secondVal > -1)) {
            return true;
          }
        }
      }
    }
  }

  alert("Please enter valid Round Segment Times.");
  window.document.frmRoundSegment[whatTime].focus();
  return false;
}


function initPage() {
  setYears('Start');
  setYears('End');
  setYears('IntEnd');
  setMonths('Start');
  setMonths('End');
  setMonths('IntEnd');
  setDays('Start');
  setDays('End');
  setDays('IntEnd');
  setSelectedDays('Start');
  setSelectedDays('End');
  setSelectedDays('IntEnd');
}

function setDays(whatDate) {
  numDays = getDays(whatDate);

  col = "";

  if(whatDate == 'Start') {
    col = "StartDay";
  } 
  else if(whatDate == 'End') {
    col = "EndDay";
  }
  else if(whatDate == 'IntEnd') {
    col = "IntEndDay";
  }


  numOpts = document.frmRoundSegment[col].options.length;

  var i;
  if(numOpts > numDays) {
    for(i = numOpts; i > numDays; i--) {
      document.frmRoundSegment[col].options[i-1] = null;
    }
  }
  else if(numOpts < numDays) {
    for(i = numOpts; i < numDays; i++) {
      op = new Option();
      op.value = i + 1;
      op.text = i + 1;
      document.frmRoundSegment[col].options[i] = op;
    }
  }
}

function getDays(whatDate) {
  month = 0;
  year = 0;

  monthCol = "";
  yearCol = "";

  if(whatDate == 'Start') {
    monthCol = 'StartMonth';
    yearCol = 'StartYear';
  }
  else if(whatDate == 'End') {
    monthCol = 'EndMonth';
    yearCol = 'EndYear';
  }
  else if(whatDate == 'IntEnd') {
    monthCol = 'IntEndMonth';
    yearCol = 'IntEndYear';
  }


  month = document.frmRoundSegment[monthCol].value;
  year = document.frmRoundSegment[yearCol].value;

 
  rem = year % 4;

  if(rem == 0) {
    leap = 1;
  } else {
    leap = 0;
  }

  numDays = 0;

  if ( (month == 4) || (month == 6) || (month == 9) ||
       (month == 11) ) {
    numDays = 30;
  } else if (month == 2) {
    numDays = 28 + leap;
  } else {
    numDays = 31;
  }

  return numDays;
 
}

function setSelectedDays(whatDate) {
  col = "";
  colVal = "";

  if(whatDate == 'Start') {
    col = "StartDay";
    colVal = "StartDayVal";
  }
  else if(whatDate == 'End') {
    col = "EndDay";
    colVal = "EndDayVal";
  }
  else if(whatDate == 'IntEnd') {
    col = "IntEndDay";
    colVal = "IntEndDayVal";
  }
  
  if(document.frmRoundSegment[colVal].value != 0) {
    //subtract 1 because indexes are zero based.
    document.frmRoundSegment[col].selectedIndex = document.frmRoundSegment[colVal].value - 1;
  }
  else {
    document.frmRoundSegment[col].selectedIndex = document.frmRoundSegment.CurrDayVal.value - 1;
  }

}

function setMonths(whatDate) {
  col = "";
  monthVal = "";
  currMonth = document.frmRoundSegment.CurrMonthVal.value - 1;
  selectedMonth = 0;

  if(whatDate == 'Start') {
    col = "StartMonth";
    monthVal = "StartMonthVal";
  }
  else if(whatDate == 'End') {
    col = "EndMonth";
    monthVal = "EndMonthVal";
  }
  else if(whatDate == 'IntEnd') {
    col = "IntEndMonth";
    monthVal = "IntEndMonthVal";
  }


  var i;
    for(i = 0; i < 12; i++) {
      op = new Option();
      op.value = i + 1;

      if(i == 0) {
        op.text = "January";
      }
      else if(i == 1) {
        op.text = "February";
      }
      else if(i == 2) {
        op.text = "March";
      }
      else if(i == 3) {
        op.text = "April";
      }
      else if(i == 4) {
        op.text = "May";
      }
      else if(i == 5) {
        op.text = "June";
      }
      else if(i == 6) {
        op.text = "July";
      }
      else if(i == 7) {
        op.text = "August";
      }
      else if(i == 8) {
        op.text = "September";
      }
      else if(i == 9) {
        op.text = "October";
      }
      else if(i == 10) {
        op.text = "November";
      }
      else if(i == 11) {
        op.text = "December";
      }

      document.frmRoundSegment[col].options[i] = op;

      //set the selected month if there is StartMonth or EndMonth value
      if(document.frmRoundSegment[col].options[i].value == document.frmRoundSegment[monthVal].value) {
        document.frmRoundSegment[col].selectedIndex = i;
        selectedMonth = 1;
      }
    }

    if(selectedMonth == 0) {
      document.frmRoundSegment[col].selectedIndex = currMonth;
    }
}

function setYears(whatDate) {
  col = "";
  yearVal = "";
  currYear = document.frmRoundSegment.CurrYearVal.value;

  if(whatDate == 'Start') {
    col = "StartYear";
    yearVal = "StartYearVal";
  }
  else if(whatDate == 'End') {
    col = "EndYear";
    yearVal = "EndYearVal";
  }
  else if(whatDate == 'IntEnd') {
    col = "IntEndYear";
    yearVal = "IntEndYearVal";
  }


  minYear = Math.min(currYear,document.frmRoundSegment[yearVal].value);
  maxYear = Math.max(currYear,document.frmRoundSegment[yearVal].value);

  //if there was no StartYear or EndYear value, set the minYear
  //equal to the current year.
  if(minYear == 0) {
    minYear = currYear - 0;
  }

  diff = maxYear - minYear;

    var i;
    year = 0;
    for(i = 0; i <= diff + 1; i++) {
      year = minYear + i;
      op = new Option();
      op.value = year;
      op.text = year;
      document.frmRoundSegment[col].options[i] = op;

      //set the selected year if there is StartYear or EndYear value
      if(document.frmRoundSegment[col].options[i].value == document.frmRoundSegment[yearVal].value) {
        document.frmRoundSegment[col].selectedIndex = i;
      }
    }
}


]]></SCRIPT>


<body bgcolor="#000000" background="/images/background_2.jpg" marginwidth="0" marginheight="0" topmargin="0" leftmargin="0" onLoad="initPage()">

<table width="100%" cellpadding="0" cellspacing="0" border="0">
  <tr>
    <td colspan="2" valign="top">
      <xsl:choose>
        <xsl:when test="/ADMIN/LoggedIn='true'">
          <xsl:call-template name="TopLoggedIn"/>
        </xsl:when>
        <xsl:otherwise>
          <xsl:call-template name="TopLoggedOut"/>
        </xsl:otherwise>
      </xsl:choose>
    </td>
    <td width="619" bgcolor="#4d0000"><img src="/images/spacer.gif" width="1" height="1"/></td>
  </tr> 
  <tr>
    <td valign="top">
      <table width="156" cellpadding="0" cellspacing="0" border="0">
        <xsl:choose>
          <xsl:when test="/ADMIN/LoggedIn='true'">
            <xsl:call-template name="Contest_LI"/>
          </xsl:when>
        </xsl:choose>
        <tr>
          <td valign="top">
            <xsl:call-template name="LeftSideNavBarForm"/>
         </td>
        </tr>
      </table>
    </td>
    <td valign="top">
    <table width="619" cellpadding="0" cellspacing="0" border="0"  >
           <tr>
              <td align="center" valign="top" colspan="2">
               <font face="arial, verdana, helvetica, sans-serif" size="3" color="#ff0000">
                    <b>CONTEST ROUND SEGMENT SETUP SCREEN</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmRoundSegment" METHOD="POST">
               <xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
               <tr>
                 <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
               </tr>
               <tr>
                  <td>
                       <xsl:call-template name="ContestInformationInactive"/>
                       <xsl:call-template name="RoundInformationInactive"/>
                       <xsl:call-template name="RoundSegmentsActive"/>
                       <xsl:call-template name="RoundProblemsInactive"/>
                   </td>
                </tr>
 
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Round Type: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <xsl:variable name="thisRoundType">
                    <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/RoundType"/>
                  </xsl:variable>
                  <SELECT NAME="roundtype" SIZE="1" >
                    <OPTION VALUE="A">
                      <xsl:if test="$thisRoundType='A'"><xsl:attribute name="SELECTED"/></xsl:if>A
                    </OPTION>
                    <OPTION VALUE="B">
                      <xsl:if test="$thisRoundType='B'"><xsl:attribute name="SELECTED"/></xsl:if>B
                    </OPTION>
                  </SELECT>
                </td>
              </tr>

<!--           Start Date          -->
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Start Date </xsl:text></b>
                  </font>
                </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Start Year: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisStartYear">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/StartYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/StartYear"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="StartYear" SIZE="1" onChange="setDays('Start')">
                          </SELECT>

                       </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Start Month: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisStartMo">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/StartMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/StartMonthNum"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="StartMonth" SIZE="1" onChange="setDays('Start')">
                          </SELECT>
                       </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Start Day: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisStartDay">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/StartDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/StartDay"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="StartDay" SIZE="1" >
                          </SELECT>

                       </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Start Time: </xsl:text>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="starttime" size="10">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/StartTime"/>
                    </xsl:attribute>
                  </INPUT>

                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>(hh:mm:ss)</xsl:text>
                  </font>
                </td>
              </tr>

              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>


<!--          End Date          -->
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>End Date </xsl:text></b>
                  </font>
                </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>End Year: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisEndYear">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/EndYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/EndYear"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="EndYear" SIZE="1" onChange="setDays('End')">
                          </SELECT>

                       </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>End Month: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisEndMo">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/EndMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/EndMonthNum"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="EndMonth" SIZE="1" onChange="setDays('End')">
                          </SELECT>
                       </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>End Day: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisEndDay">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/EndDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/EndDay"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="EndDay" SIZE="1" >
                          </SELECT>
                       </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>End Time: </xsl:text>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="endtime" size="10">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/EndTime"/>
                    </xsl:attribute>
                  </INPUT>
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>(hh:mm:ss)</xsl:text>
                  </font>
                </td>
                
              </tr>

              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>


<!--             Interval End Date          -->
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Interval End Date </xsl:text></b>
                  </font>
                </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Interval End Year: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisIntEndYear">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/IntEndYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="IntEndYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/IntEndYear"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="IntEndYear" SIZE="1" onChange="setDays('IntEnd')">
                          </SELECT>

                       </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Interval End Month: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisIntEndMo">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/IntEndMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="IntEndMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/IntEndMonthNum"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="IntEndMonth" SIZE="1" onChange="setDays('IntEnd')">
                          </SELECT>
                       </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Int End Day: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisIntEndDay">
                            <xsl:value-of select="ADMIN/CONTESTS/RoundSegment/IntEndDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="IntEndDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/IntEndDay"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="IntEndDay" SIZE="1" >
                          </SELECT>

                       </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Int End Time: </xsl:text>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="intendtime" size="10">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/IntEndTime"/>
                    </xsl:attribute>
                  </INPUT>

                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>(hh:mm:ss)</xsl:text>
                  </font>
                </td>
              </tr>

              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>

 
              <tr>
                 <td colspan="2" ><img src="/images/spacer.gif" width="600" height="15" /></td>
              </tr>
              <tr>
                 <td><img src="/images/spacer.gif" width="200" height="15" /></td>
                 <td><img src="/images/spacer.gif" width="400" height="15" /></td>
              </tr>
           <tr>
             <td align="center" colspan="2">
                <xsl:call-template name="NextButton"/>
             </td>
           </tr>
           </table>
              
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="contest"/>
              <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="results" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/LoggedIn"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="roundId">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/RoundId"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="contestId">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/ContestId"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="CurrMonthVal">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/Date/Month"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="CurrYearVal">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/Date/Year"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="CurrDayVal">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/Date/Day"/>
                </xsl:attribute>
              </INPUT>
              <INPUT TYPE="HIDDEN" NAME="modified">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/CONTESTS/RoundSegment/Modified"/>
                </xsl:attribute>
              </INPUT>

              </FORM>
           </table>
    </td>
  </tr>
</table>


</body>

</html>
</xsl:template>
</xsl:stylesheet>
