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
<title>Contest Setup Screen</title>

<xsl:call-template name="CSS"/>

</head>

<SCRIPT TYPE="text/Javascript"><![CDATA[

function doUpdate() {
  if(doCheck()) {
    window.document.frmContest.Command.value="contestsave";
    doSubmit();
  }
}

function doNext() { 
  if(doCheck()) {
    window.document.frmContest.Command.value="contestnext";
    doSubmit();
  }
}

function doRound() {
  window.document.frmContest.Command.value="round";
  if(window.document.frmContest.modified.value="M") {
    doSubmit();
  }
  else if(doCheck()) {
    doSubmit();
  }
}

function doSubmit(){ window.document.frmContest.submit(); }

function doCheck(){
  if(window.document.frmContest.contestname.value=="") {
    alert("Please enter a Contest Name.");
    window.document.frmContest.contestname.focus();
    return false;
  }
  
  if(timeCheck('starttime') && timeCheck('endtime') &&
     timeCheck('adstarttime')) {
    return timeCheck('adendtime');
  }
  else {
   return false;
  }

  return true;
}


function timeCheck(whatTime) {
  timeString = window.document.frmContest[whatTime].value;

  if((timeString == "") || (timeString.length != 8)) {
    alert("Please enter valid Contest Times.");
    window.document.frmContest[whatTime].focus();
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

  alert("Please enter valid Contest Times.");
  window.document.frmContest[whatTime].focus();
  return false;
}


function initPage() {
  setYears('Start');
  setYears('End');
  setYears('AdStart');
  setYears('AdEnd');
  setMonths('Start');
  setMonths('End');
  setMonths('AdStart');
  setMonths('AdEnd');
  setDays('Start');
  setDays('End');
  setDays('AdStart');
  setDays('AdEnd');
  setSelectedDays('Start');
  setSelectedDays('End');
  setSelectedDays('AdStart');
  setSelectedDays('AdEnd');
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
  else if(whatDate == 'AdStart') {
    col = "AdStartDay";
  } 
  else if(whatDate == 'AdEnd') {
    col = "AdEndDay";
  }


  numOpts = document.frmContest[col].options.length;

  var i;
  if(numOpts > numDays) {
    for(i = numOpts; i > numDays; i--) {
      document.frmContest[col].options[i-1] = null;
    }
  }
  else if(numOpts < numDays) {
    for(i = numOpts; i < numDays; i++) {
      op = new Option();
      op.value = i + 1;
      op.text = i + 1;
      document.frmContest[col].options[i] = op;
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
  else if(whatDate == 'AdStart') {
    monthCol = 'AdStartMonth';
    yearCol = 'AdStartYear';
  }
  else if(whatDate == 'AdEnd') {
    monthCol = 'AdEndMonth';
    yearCol = 'AdEndYear';
  }

  month = document.frmContest[monthCol].value;
  year = document.frmContest[yearCol].value;

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
  else if(whatDate == 'AdStart') {
    col = "AdStartDay";
    colVal = "AdStartDayVal";
  }
  else if(whatDate == 'AdEnd') {
    col = "AdEndDay";
    colVal = "AdEndDayVal";
  }
  
  if(document.frmContest[colVal].value != 0) {
    //subtract 1 because indexes are zero based.
    document.frmContest[col].selectedIndex = document.frmContest[colVal].value - 1;
  }
  else {
    document.frmContest[col].selectedIndex = document.frmContest.CurrDayVal.value - 1;
  }

}

function setMonths(whatDate) {
  col = "";
  monthVal = "";
  currMonth = document.frmContest.CurrMonthVal.value - 1;
  selectedMonth = 0;

  if(whatDate == 'Start') {
    col = "StartMonth";
    monthVal = "StartMonthVal";
  }
  else if(whatDate == 'End') {
    col = "EndMonth";
    monthVal = "EndMonthVal";
  }
  else if(whatDate == 'AdStart') {
    col = "AdStartMonth";
    monthVal = "AdStartMonthVal";
  }
  else if(whatDate == 'AdEnd') {
    col = "AdEndMonth";
    monthVal = "AdEndMonthVal";
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

      document.frmContest[col].options[i] = op;

      //set the selected month if there is StartMonth or EndMonth value
      if(document.frmContest[col].options[i].value == document.frmContest[monthVal].value) {
        document.frmContest[col].selectedIndex = i;
        selectedMonth = 1;
      }
    }

    if(selectedMonth == 0) {
      document.frmContest[col].selectedIndex = currMonth;
    }
}

function setYears(whatDate) {
  col = "";
  yearVal = "";
  currYear = document.frmContest.CurrYearVal.value;

  if(whatDate == 'Start') {
    col = "StartYear";
    yearVal = "StartYearVal";
  }
  else if(whatDate == 'End') {
    col = "EndYear";
    yearVal = "EndYearVal";
  }
  else if(whatDate == 'AdStart') {
    col = "AdStartYear";
    yearVal = "AdStartYearVal";
  }
  else if(whatDate == 'AdEnd') {
    col = "AdEndYear";
    yearVal = "AdEndYearVal";
  }


  minYear = Math.min(currYear,document.frmContest[yearVal].value);
  maxYear = Math.max(currYear,document.frmContest[yearVal].value);

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
      document.frmContest[col].options[i] = op;

      //set the selected year if there is StartYear or EndYear value
      if(document.frmContest[col].options[i].value == document.frmContest[yearVal].value) {
        document.frmContest[col].selectedIndex = i;
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
                    <b>CONTEST SETUP SCREEN</b>
               </font>
             </td>
           </tr>
    </table>
    <table width="619" cellspacing="0" cellpadding="0" border="0">
      <br/>
            <FORM NAME="frmContest" METHOD="POST">
               <xsl:attribute name="ACTION">http<xsl:value-of select="/ADMIN/PostURL"/></xsl:attribute>
               <tr>
                 <td valign="top" height="1"><img src="/images/spacer.gif" width="619" height="1" /></td>
               </tr>
               <tr>
                  <td>
                       <xsl:call-template name="ContestInformationActive"/>
                       <xsl:call-template name="RoundInformationInactive"/>
                       <xsl:call-template name="RoundSegmentsActive"/>
                       <xsl:call-template name="RoundProblemsActive"/>
                   </td>
                </tr>
 
           <table width="600" cellpadding="0" cellspacing="0" border="0" >
              <tr>
                 <td colspan="2"><img src="/images/spacer.gif" width="200" height="15" /></td>
              </tr>
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Contest Name: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="contestname" size="45">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/Contest/ContestName"/>
                    </xsl:attribute>
                  </INPUT>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/StartYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/StartYear"/>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/StartMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/StartMonthNum"/>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/StartDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="StartDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/StartDay"/>
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
                      <xsl:value-of select="/ADMIN/CONTESTS/Contest/StartTime"/>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/EndYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/EndYear"/>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/EndMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/EndMonthNum"/>
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
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/EndDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="EndDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/EndDay"/>
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
                      <xsl:value-of select="/ADMIN/CONTESTS/Contest/EndTime"/>
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


<!--        Ad Start Date         -->
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Ad Start Date </xsl:text></b>
                  </font>
                </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad Start Year: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdStartYear">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdStartYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdStartYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdStartYear"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdStartYear" SIZE="1" onChange="setDays('AdStart')">
                          </SELECT>

                       </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad Start Month: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdStartMo">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdStartMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdStartMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdStartMonthNum"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdStartMonth" SIZE="1" onChange="setDays('AdStart')">
                          </SELECT>
                       </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad Start Day: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdStartDay">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdStartDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdStartDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdStartDay"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdStartDay" SIZE="1" >
                          </SELECT>

                       </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Ad Start Time: </xsl:text>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="adstarttime" size="10">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdStartTime"/>
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


<!--             Ad End Date          -->
              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Ad End Date </xsl:text></b>
                  </font>
                </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad End Year: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdEndYear">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdEndYear"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdEndYearVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdEndYear"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdEndYear" SIZE="1" onChange="setDays('AdEnd')">
                          </SELECT>

                       </td>
              </tr>


              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad End Month: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdEndMo">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdEndMonthNum"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdEndMonthVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdEndMonthNum"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdEndMonth" SIZE="1" onChange="setDays('AdEnd')">
                          </SELECT>
                       </td>
              </tr>

              <tr>
                        <td align="left" colspan="1">
                          <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                            <xsl:text>Ad End Day: </xsl:text>
                          </font>
                        </td>
                        <td align="left" colspan="1">
                          <xsl:variable name="thisAdEndDay">
                            <xsl:value-of select="ADMIN/CONTESTS/Contest/AdEndDay"/>
                          </xsl:variable>
                          <INPUT TYPE="HIDDEN" NAME="AdEndDayVal">
                            <xsl:attribute name="VALUE">
                              <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdEndDay"/>
                            </xsl:attribute>
                          </INPUT>
                          <SELECT NAME="AdEndDay" SIZE="1" >
                          </SELECT>

                       </td>
              </tr>

              <tr>
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <xsl:text>Ad End Time: </xsl:text>
                  </font>
                </td>
                <td align="left" colspan="1">
                  <INPUT type="text" name="adendtime" size="10">
                    <xsl:attribute name="VALUE">
                      <xsl:value-of select="/ADMIN/CONTESTS/Contest/AdEndTime"/>
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
                <td align="left" colspan="1">
                  <font face="arial, verdana, helvetica, sans-serif" size="2" color="#ccff99">
                    <b><xsl:text>Subject: </xsl:text></b>
                  </font>
                </td>
                <td align="left" colspan="2">
                  <SELECT NAME="subjectId" SIZE="1">
                    <OPTION VALUE=""></OPTION>
                    <xsl:for-each select="/ADMIN/CONTESTS/Subjects">
                      <OPTION>
                        <xsl:attribute name="VALUE"><xsl:value-of select="SubjectId"/></xsl:attribute>
                        <xsl:if test="SubjectId=/ADMIN/CONTESTS/Contest/Subjects/SubjectId">
                          <xsl:attribute name="SELECTED">TRUE</xsl:attribute>
                        </xsl:if>
                        <xsl:value-of select="SubjectName"/>
                      </OPTION>
                    </xsl:for-each>
                  </SELECT>
                </td>
                <td colspan="1">
                </td>
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
                <xsl:call-template name="UpdateButton"/>
             </td>
           </tr>
           </table>
              
              <INPUT TYPE="HIDDEN" NAME="Task" VALUE="contest"/>
              <INPUT TYPE="HIDDEN" NAME="Command" VALUE=""/>
              <INPUT TYPE="HIDDEN" NAME="LoggedIn">
                <xsl:attribute name="VALUE">
                  <xsl:value-of select="/ADMIN/LoggedIn"/>
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
                  <xsl:value-of select="/ADMIN/CONTESTS/Contest/Modified"/>
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
