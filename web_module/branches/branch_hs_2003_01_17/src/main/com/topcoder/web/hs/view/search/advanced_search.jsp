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
   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="4" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" VALIGN="middle" CLASS="bodyText">&nbsp;Member Search: Search by handle, rating or state.</TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="statText" BACKGROUND="/i/hs/blue_heading_bg_deux.gif"><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" VALIGN="middle" CLASS="statText" BACKGROUND="/i/hs/steel_bluebv_bg.gif">
    &nbsp;An underscore ( _ ) = one character space<BR>
    &nbsp;A percent sign ( % ) = any number of character spaces
   </TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="1" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD VALIGN="middle" CLASS="statText">&nbsp;</TD>
   <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText">Rating</TD>
   <TD CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="10" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD WIDTH="50%" HEIGHT="15" VALIGN="middle" CLASS="statText">
    Handle&nbsp;<INPUT TYPE="text" NAME="handle" VALUE="" MAXLENGTH="20" SIZE="15" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD WIDTH="25%" VALIGN="middle" CLASS="statText">
    Min&nbsp;<INPUT TYPE="text" NAME="min_rating" VALUE="" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD WIDTH="25%" VALIGN="middle" CLASS="statText">
    Max&nbsp;<INPUT TYPE="text" NAME="max_rating" VALUE="" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);">
   </TD>
   <TD CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="10" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD COLSPAN="4" CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="6" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD VALIGN="middle" CLASS="statText">&nbsp;</TD>
   <TD COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText"># of Rated Events</TD>
   <TD CLASS="statText"><IMG SRC="/i/hs/clear.gif" HEIGHT="10" WIDTH="1" BORDER="0"></TD>
  </TR>
  <TR>
   <TD VALIGN="middle" CLASS="statText">
    State&nbsp;
    <SELECT SIZE="1" NAME="State"><OPTION VALUE="">All</OPTION><OPTION VALUE="AL">AL</OPTION><OPTION VALUE="AK">AK</OPTION><OPTION VALUE="AZ">AZ</OPTION><OPTION VALUE="AR">AR</OPTION><OPTION VALUE="CA">CA</OPTION><OPTION VALUE="CO">CO</OPTION><OPTION VALUE="CT">CT</OPTION><OPTION VALUE="DE">DE</OPTION><OPTION VALUE="DC">DC</OPTION><OPTION VALUE="FL">FL</OPTION><OPTION VALUE="GA">GA</OPTION><OPTION VALUE="HI">HI</OPTION><OPTION VALUE="ID">ID</OPTION><OPTION VALUE="IL">IL</OPTION><OPTION VALUE="IN">IN</OPTION><OPTION VALUE="IA">IA</OPTION><OPTION VALUE="KS">KS</OPTION><OPTION VALUE="KY">KY</OPTION><OPTION VALUE="LA">LA</OPTION><OPTION VALUE="ME">ME</OPTION><OPTION VALUE="MD">MD</OPTION><OPTION VALUE="MA">MA</OPTION><OPTION VALUE="MI">MI</OPTION><OPTION VALUE="MN">MN</OPTION><OPTION VALUE="MS">MS</OPTION><OPTION VALUE="MO">MO</OPTION><OPTION VALUE="MT">MT</OPTION><OPTION VALUE="NE">NE</OPTION><OPTION VALUE="NV">NV</OPTION><OPTION VALUE="NH">NH</OPTION><OPTION VALUE="NJ">NJ</OPTION><OPTION VALUE="NM">NM</OPTION><OPTION VALUE="NY">NY</OPTION><OPTION VALUE="NC">NC</OPTION><OPTION VALUE="ND">ND</OPTION><OPTION VALUE="ZZ">ZZ</OPTION><OPTION VALUE="OH">OH</OPTION><OPTION VALUE="OK">OK</OPTION><OPTION VALUE="OR">OR</OPTION><OPTION VALUE="PA">PA</OPTION><OPTION VALUE="PR">PR</OPTION><OPTION VALUE="RI">RI</OPTION><OPTION VALUE="SC">SC</OPTION><OPTION VALUE="SD">SD</OPTION><OPTION VALUE="TN">TN</OPTION><OPTION VALUE="TX">TX</OPTION><OPTION VALUE="UT">UT</OPTION><OPTION VALUE="VT">VT</OPTION><OPTION VALUE="VI">VI</OPTION><OPTION VALUE="VA">VA</OPTION><OPTION VALUE="WA">WA</OPTION><OPTION VALUE="WV">WV</OPTION><OPTION VALUE="WI">WI</OPTION><OPTION VALUE="WY">WY</OPTION></SELECT></TD><TD VALIGN="middle" CLASS="statText">Min&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MinNumRatings" TYPE="text"></TD><TD VALIGN="middle" CLASS="statText">Max&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MaxNumRatings" TYPE="text"></TD><TD CLASS="statText"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="18" VALIGN="middle" ALIGN="center" CLASS="statText" COLSPAN="4"><A HREF="?module=Static&d1=search&d2=advanced_search" CLASS="statText">&nbsp;[ submit ]</A></TD></TR><TR><TD CLASS="statText" COLSPAN="4" BACKGROUND="/i/hs/steel_blue_bg.gif"><IMG BORDER="0" HEIGHT="3" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="12" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR></FORM></TABLE>
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

<%@ include file="tail.inc" %>
