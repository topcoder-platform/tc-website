<HTML>
<HEAD>
	<TITLE>::TopCoder High School::</TITLE>
    <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
    <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
<jsp:include page="../includes/css.jsp" />
</HEAD>
<BODY BGCOLOR="#001934" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
<jsp:include page="../includes/top.jsp" />
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#000000" WIDTH="100%">
<TR><TD>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
    <TR VALIGN="top">
		<TD WIDTH="170" BGCOLOR="#001934">
        <jsp:include page="../includes/left_nav.jsp" />
<jsp:include page="../includes/left_calendar.jsp" />
        </TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_left.gif" WIDTH="1" HEIGHT="3" ALT="" BORDER="0"></TD>
        <TD VALIGN="top" BACKGROUND="/i/hs/bluegradiant_bg.gif" BGCOLOR="#FFFFFF">
            <TABLE CELLSPACING="0" CELLPADDING="0" BORDER="0" WIDTH="100%">
    <TR>
        <TD>
            <TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="" WIDTH="100%">
             <TR><TD ALIGN="left" HEIGHT="44" WIDTH="348"><IMG SRC="/i/hs/headinginside_blank.gif" WIDTH="348" HEIGHT="44" BORDER="0"></TD>
             <TD BACKGROUND="/i/hs/headinginside_1pix_bg.gif" ALIGN="left" HEIGHT="44" WIDTH="4096">&nbsp;
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
                    <TD WIDTH="10"><IMG SRC="/i/hs/clear_10_pix_width.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
                </TR>
                </TABLE>
            </TD>
            <TD HEIGHT="100%"><BR><BR>
                        <P CLASS="bodyText">&nbsp;</P>   
<P CLASS="bodyText">
         Enter search criteria below then click the go button. Search results matching the criteria selections will be returned. Click on a Handle to view information about the Coder.
      </P><TABLE WIDTH="100%"   CELLPADDING="0" CELLSPACING="0" BORDER="0"><FORM METHOD="get" name="searchForm"><INPUT VALUE="search" NAME="t" TYPE="hidden"><INPUT VALUE="member_search" NAME="c" TYPE="hidden"><INPUT VALUE="" NAME="Next" TYPE="hidden"><SCRIPT type="text/javascript">
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
          </SCRIPT><TR><TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="4" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="18" VALIGN="middle" CLASS="bodyText" COLSPAN="4" >&nbsp;Member Search: Search by handle, rating or state.</TD></TR><TR><TD CLASS="statText" BACKGROUND="/i/hs/blue_heading_bg_deux.gif" COLSPAN="4" ><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="30" VALIGN="middle" CLASS="statText" COLSPAN="4" BACKGROUND="/i/hs/steel_bluebv_bg.gif">
            &nbsp;An underscore ( _ ) = one character space<BR>
            &nbsp;A percent sign ( % ) = any number of character spaces</TD></TR><TR><TD WIDTH="1" CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="1" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="15" VALIGN="middle" CLASS="statText">&nbsp;</TD><TD HEIGHT="13" COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText">Rating</TD><TD CLASS="statText"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD WIDTH="50%" HEIGHT="15" VALIGN="middle" CLASS="statText">&nbsp;Handle&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="20" SIZE="15" NAME="SearchHandle" TYPE="text"></TD><TD WIDTH="25%" VALIGN="middle" CLASS="statText">Min&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MinRating" TYPE="text"></TD><TD WIDTH="25%" VALIGN="middle" CLASS="statText">Max&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MaxRating" TYPE="text"></TD><TD CLASS="statText"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="6" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="15" VALIGN="middle" CLASS="statText">&nbsp;</TD><TD HEIGHT="13" COLSPAN="2" ALIGN="center" VALIGN="middle" CLASS="bodyText"># of Rated Events</TD><TD CLASS="statText"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="15" VALIGN="middle" CLASS="statText">&nbsp;State&nbsp;
              <SELECT SIZE="1" NAME="State"><OPTION VALUE="">All</OPTION><OPTION VALUE="AL">AL</OPTION><OPTION VALUE="AK">AK</OPTION><OPTION VALUE="AZ">AZ</OPTION><OPTION VALUE="AR">AR</OPTION><OPTION VALUE="CA">CA</OPTION><OPTION VALUE="CO">CO</OPTION><OPTION VALUE="CT">CT</OPTION><OPTION VALUE="DE">DE</OPTION><OPTION VALUE="DC">DC</OPTION><OPTION VALUE="FL">FL</OPTION><OPTION VALUE="GA">GA</OPTION><OPTION VALUE="HI">HI</OPTION><OPTION VALUE="ID">ID</OPTION><OPTION VALUE="IL">IL</OPTION><OPTION VALUE="IN">IN</OPTION><OPTION VALUE="IA">IA</OPTION><OPTION VALUE="KS">KS</OPTION><OPTION VALUE="KY">KY</OPTION><OPTION VALUE="LA">LA</OPTION><OPTION VALUE="ME">ME</OPTION><OPTION VALUE="MD">MD</OPTION><OPTION VALUE="MA">MA</OPTION><OPTION VALUE="MI">MI</OPTION><OPTION VALUE="MN">MN</OPTION><OPTION VALUE="MS">MS</OPTION><OPTION VALUE="MO">MO</OPTION><OPTION VALUE="MT">MT</OPTION><OPTION VALUE="NE">NE</OPTION><OPTION VALUE="NV">NV</OPTION><OPTION VALUE="NH">NH</OPTION><OPTION VALUE="NJ">NJ</OPTION><OPTION VALUE="NM">NM</OPTION><OPTION VALUE="NY">NY</OPTION><OPTION VALUE="NC">NC</OPTION><OPTION VALUE="ND">ND</OPTION><OPTION VALUE="ZZ">ZZ</OPTION><OPTION VALUE="OH">OH</OPTION><OPTION VALUE="OK">OK</OPTION><OPTION VALUE="OR">OR</OPTION><OPTION VALUE="PA">PA</OPTION><OPTION VALUE="PR">PR</OPTION><OPTION VALUE="RI">RI</OPTION><OPTION VALUE="SC">SC</OPTION><OPTION VALUE="SD">SD</OPTION><OPTION VALUE="TN">TN</OPTION><OPTION VALUE="TX">TX</OPTION><OPTION VALUE="UT">UT</OPTION><OPTION VALUE="VT">VT</OPTION><OPTION VALUE="VI">VI</OPTION><OPTION VALUE="VA">VA</OPTION><OPTION VALUE="WA">WA</OPTION><OPTION VALUE="WV">WV</OPTION><OPTION VALUE="WI">WI</OPTION><OPTION VALUE="WY">WY</OPTION></SELECT></TD><TD VALIGN="middle" CLASS="statText">Min&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MinNumRatings" TYPE="text"></TD><TD VALIGN="middle" CLASS="statText">Max&nbsp;
              <INPUT onKeyPress="submitEnter(event)" MAXLENGTH="6" SIZE="6" NAME="MaxNumRatings" TYPE="text"></TD><TD CLASS="statText"><IMG BORDER="0" HEIGHT="10" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD HEIGHT="18" VALIGN="middle" ALIGN="center" CLASS="statText" COLSPAN="4"><A HREF="?module=Static&d1=search&d2=advanced_search" CLASS="statText">&nbsp;[ submit ]</A></TD></TR><TR><TD CLASS="statText" COLSPAN="4" BACKGROUND="/i/hs/steel_blue_bg.gif"><IMG BORDER="0" HEIGHT="3" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR><TR><TD CLASS="statText" COLSPAN="4" ><IMG BORDER="0" HEIGHT="12" WIDTH="1" ALT="" SRC="/i/hs/clear.gif"></TD></TR></FORM></TABLE>


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
        <TD WIDTH="1" BGCOLOR="#000000" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="1" BGCOLOR="#C5C5C9" VALIGN="top"><IMG SRC="/i/hs/frame_1pix_bg_lg_top_right.gif" WIDTH="1" HEIGHT="18" ALT="" BORDER="0"></TD>
        <TD WIDTH="" BGCOLOR="#001934" VALIGN="top">        
<IMG SRC="/i/hs/right_top_3dots.gif" WIDTH="86" HEIGHT="41" ALT="" BORDER="0" >
<BR/>
<jsp:include page="../includes/right_resources.jsp" /></TD>		
	</TR>
</TABLE>
</TD></TR></TABLE>

<jsp:include page="../includes/foot.jsp" />
</BODY>
</HTML>
