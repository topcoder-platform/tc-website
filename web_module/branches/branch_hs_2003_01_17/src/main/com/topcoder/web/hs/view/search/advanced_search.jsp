<%@ page errorPage="../home/error.jsp" %>
<%@ taglib uri="/search-taglib.tld" prefix="adv" %>
<jsp:useBean id="search" type="com.topcoder.web.hs.model.SearchBean" scope="request"/>
<%@ include file="head.inc" %>
<P><BR></P>   
<P>Enter search criteria below then click the go button. Search results matching the criteria selections will be returned. Click on a Handle to view information about the Coder.</P>
<FORM METHOD="get" name="advForm">
 <INPUT TYPE="hidden" NAME="cmd" VALUE="search">
 <INPUT TYPE="hidden" NAME="next" VALUE="">
 <INPUT TYPE="hidden" NAME="prev" VALUE="">
 <TABLE WIDTH="100%" CELLPADDING="0" CELLSPACING="0" BORDER="0">
  <TR>
   <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/hs/clear.gif" HEIGHT="4" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" HEIGHT="18" VALIGN="middle" CLASS="bodyText">&nbsp;Member Search: Search by handle, rating or state.</TD>
  </TR>
  <TR>
   <TD COLSPAN="4" BACKGROUND="/i/steel_darkblue_bg.gif"><IMG SRC="/i/hs/clear.gif" HEIGHT="4" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" HEIGHT="30" VALIGN="middle" CLASS="bodyText">
    &nbsp;An underscore ( _ ) = one character space<BR>
    &nbsp;A percent sign ( % ) = any number of character spaces
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2" WIDTH="50%" HEIGHT="15" VALIGN="middle" CLASS="bodyText">
    Handle&nbsp;<INPUT TYPE="text" NAME="handle" VALUE="" MAXLENGTH="20" SIZE="15" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD CLASS="bodyText">&nbsp;</TD>
   <TD COLSPAN="1" CLASS="bodyText" ALIGN="left" VALIGN="middle">
    State&nbsp;<adv:listSelect name="state_code" class="dropdown" onChange="Javascript:changeState()" list="<%=search.getStateList()%>" selected="<%=search.getStateCode()%>"/>
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="4"><IMG SRC="/i/hs/clear.gif" HEIGHT="6" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText">Rating</TD>
   <TD COLSPAN="2">
  </TR>
  <TR>
   <TD WIDTH="25%" VALIGN="middle" CLASS="bodyText">
    &nbsp;Min&nbsp;<INPUT TYPE="text" NAME="min_rating" VALUE="" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD WIDTH="25%" VALIGN="middle" CLASS="bodyText">
    &nbsp;Max&nbsp;<INPUT TYPE="text" NAME="max_rating" VALUE="" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD CLASS="bodyText">&nbsp;</TD>
   <TD COLSPAN="1" CLASS="bodyText" VALIGN="center" ALIGN="left">
    School&nbsp;<adv:listSelect name="school_id" class="dropdown" list="<%=search.getSchoolList()%>" selected="<%=search.getSchoolId().toString()%>"/>
   </TD>
  </TR>
  <TR>
   <TD HEIGHT="18" VALIGN="middle" ALIGN="center" CLASS="statText" COLSPAN="4">
    <A HREF="?module=Static&d1=search&d2=advanced_search" CLASS="statText">&nbsp;[ submit ]</A>
   </TD>
  </TR>
  <TR>
   <TD CLASS="statText" COLSPAN="4" BACKGROUND="/i/hs/steel_blue_bg.gif"><IMG BORDER="0" HEIGHT="3" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD>
  </TR>
  <TR>
   <TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="12" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD>
  </TR>
 </TABLE>
 <SCRIPT type="text/javascript">
            var search=document.searchForm;
            function submitEnter(e) {
              var keycode;
              if (window.event) keycode = window.event.keyCode;
              else if (e) keycode = e.which;
              else return true;
              if (keycode == 13) {
               submitSearch();
               return false;
              } else return true;
            }
            function submitSearch() {
              if (checkInput()) {
                search.submit();
              }
            }
            function checkInput() {
              if (isNaN(search.MinRating.value)) {
                alert("Please enter a valid number.");
                search.MinRating.focus();
                return false;
              }
              if (search.MinRating.value < 0) {
                alert("Please enter a non-negative number.");
                search.MinRating.focus();
                return false;
              }
              if (isNaN(search.MaxRating.value)) {
                alert("Please enter a valid number.");
                search.MaxRating.focus();
                return false;
              }
              if (search.MaxRating.value < 0) {
                alert("Please enter a non-negative number.");
                search.MaxRating.focus();
                return false;
              }
              tempMax = parseInt(search.MaxRating.value);
              tempMin = parseInt(search.MinRating.value);
              if (tempMax < tempMin) {
                alert("The the Max Rating must be greater than the Min Rating.");
                search.MaxRating.focus();
                return false;
              }
              if (isNaN(search.MinNumRatings.value)) {
                alert("Please enter a valid number.");
                search.MinNumRatings.focus();
                return false;
              }
              if (search.MinNumRatings.value < 0) {
                alert("Please enter a non-negative number.");
                search.MinNumRatings.focus();
                return false;
              }
              if (isNaN(search.MaxNumRatings.value)) {
                alert("Please enter a valid number.");
                search.MaxNumRatings.focus();
                return false;
              }
              if (search.MaxNumRatings.value < 0) {
                alert("Please enter a non-negative number.");
                search.MaxNumRatings.focus();
                return false;
              }
              tempMaxNum = parseInt(search.MaxNumRatings.value);
              tempMinNum = parseInt(search.MinNumRatings.value);
              if (tempMaxNum < tempMinNum) {
                alert("The the Max number of competions must be greater than the Min.");
                search.MaxRating.focus();
                return false;
              }
              return true;
            }
 </SCRIPT>
</FORM>
<%@ include file="tail.inc" %>
