<%@ taglib uri="/search-taglib.tld" prefix="adv" %>
<%@ page import="com.topcoder.web.hs.model.*,java.util.*" %>
<jsp:usebean id="search" type="com.topcoder.web.hs.model.SearchBean" scope="request"/>
<jsp:usebean id="NavZone" class="com.topcoder.web.hs.model.NavZoneBean" scope="request" />
<jsp:setproperty name="NavZone" property="Level0" value="stats" />
<jsp:setproperty name="NavZone" property="Level1" value="advanced_search" />

<html>
<head>

<title>TopCoder | High School</title>

<meta name="description" content="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities." />
<meta name="keywords" content="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++" />

<jsp:include page="../includes/css.jsp"/>

</head>

<body>

<jsp:include page="../includes/top.jsp"/>

<table border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF" width="100%">
    <tr valign="top">
        <td width="170" bgcolor="#001934">

<!-- Left Column begins -->
<jsp:include page="../includes/left_nav.jsp"/>
<jsp:include page="../includes/left_calendar.jsp"/>
<!-- Left Column ends -->

        </td>
        
<!-- Center Column begins -->
        <td width="1" bgcolor="#c5c5c9" valign="top"><img src="/i/hs/frame_1pix_bg_lg_top_left.gif" width="1" height="3" alt="" border="0"></td>
        <td width="1" bgcolor="#000000" valign="top"><img src="/i/hs/frame_1pix_bg_lg_top_left.gif" width="1" height="3" alt="" border="0"></td>
        <td valign="top" background="/i/hs/bluegradiant_bg.gif" bgcolor="#FFFFFF">
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td align="left" height="44" width="348"><img src="/i/hs/headinginside_search.gif" width="348" height="44" alt="" border="0"></td>
                    <td background="/i/hs/headinginside_1pix_bg.gif" align="left" width="99%" height="44">&nbsp;</td>
                </tr>

                <tr>
                    <td colspan="2" height="10"><img src="/i/hs/clear_10_pix_width.gif" width="10" height="10" alt="" border="0"></td>
                </tr>
            </table>

            <form method="get" name="advForm">
            
            <table border="0" cellspacing="0" cellpadding="0" width="100%">
                <tr>
                    <td width="10"><img src="/i/hs/clear_10_pix_width.gif" width="10" height="1" alt="" border="0"></td>
                    <td height="100%" class="bodyText">
                        <p>Enter search criteria below then click the go button. Search results matching the criteria selections will be returned. Click on a Handle 
                        to view information about the Coder.</p>
                                    
                        <input type="hidden" name="module" value="Search">
                        <input type="hidden" name="cmd" value="adv">
                        <input type="hidden" name="start" value="<jsp:getProperty name="search" property="Start"/>">
                        <input type="hidden" name="end" value="<jsp:getProperty name="search" property="End"/>">
                        <input type="hidden" name="next" value="">
                        
                        <table width="100%" cellpadding="3" cellspacing="0" border="0" id="formFrame">
                            <tr><td colspan="4" class="formTitle">&nbsp;Member Search: Search by handle, rating or state.</td></tr>

                            <tr>
                                <td colspan="4" height="30" valign="middle" class="bodyText">
                                    &nbsp;An underscore ( _ ) = one character space<br>
                                    &nbsp;A percent sign ( % ) = any number of character spaces
                                </td>
                            </tr>

                            <tr><td colspan="4" class="statText"><img src="/i/hs/clear.gif" height="1" width="1" border="0"></td></tr>

                             <tr valign="middle">
                                <td></td>
                                <td></td>
                                <td></td>
                                <td class="errorText"><adv:errorIterator id="error" name="MinRating"><%=error%></adv:errorIterator></td>
                            </tr>
  
                            <tr valign="middle">
                                <td width="25%" class="bodyText" align="right">Handle&nbsp;</td>
                                <td width="25%" class="bodyText"><input type="text" name="handle" value="<jsp:getProperty name="search" property="Handle"/>" MAXLENGTH="20" SIZE="15" ONKEYPRESS="submitEnter(event);"></td>
                                <td width="25%" class="bodyText" align="right">Min&nbsp;Rating&nbsp;</td>
                                <td width="25%" class="bodyText"><input type="text" name="min_rating" value="<jsp:getProperty name="search" property="MinRating"/>" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);"></td>
                            </tr>
                            
                             <tr valign="middle">
                                <td></td>
                                <td class="errorText"><adv:errorIterator id="error" name="StateCode"><%=error%></adv:errorIterator></td>
                                <td></td>
                                <td class="errorText"><adv:errorIterator id="error" name="MaxRating"><%=error%></adv:errorIterator></td>
                            </tr>
  
                            <tr valign="middle">
                                <td class="bodyText" align="right">State&nbsp;</td>
                                <td class="bodyText"><adv:rscSelect name="state_code" class="dropdown" onchange="Javascript:changeState()" list="<%=search.getStateList()%>" selectedvalue="<%=search.getStateCode()%>" topvalue="" toptext="Any State" fieldvalue="state_code" fieldtext="state_name"/></td>
                                <td class="bodyText" align="right">Max&nbsp;Rating&nbsp;</td>
                                <td class="bodyText"><input type="text" name="max_rating" value="<jsp:getProperty name="search" property="MaxRating"/>" MAXLENGTH="6" SIZE="6" ONKEYPRESS="submitEnter(event);"></td>
                            </tr>
  
                             <tr valign="middle">
                                <td></td>
                                <td class="errorText"><adv:errorIterator id="error" name="SchoolId"><%=error%></adv:errorIterator></td>
                                <td></td>
                                <td class="errorText"><adv:errorIterator id="error" name="MinMax"><%=error%><br></adv:errorIterator></td>
                            </tr>
  
                           <tr valign="middle">
                                <td class="bodyText" align="right">School&nbsp;</td>
                                <td class="bodyText"><adv:rscSelect name="school_id" class="dropdown" list="<%=search.getSchoolList()%>" selectedvalue="<%=search.getSchoolId().toString()%>" topvalue="-1" toptext="Any School" fieldvalue="school_id" fieldtext="full_name"/></td>
                                <td></td>
                                <td></td>
                            </tr>
  
                            <tr><td colspan="4" height="10"><img src="/i/hs/clear.gif" height="10" width="1" alt="" border="0"></td></tr>
                            
                            <tr valign="middle"><td align="center" class="statText" colspan="4"><input type="button" name="submitButton" value="Submit" onclick="Javascript:submitSearch()"></td></tr>

                            <tr><td colspan="4" height="10"><img src="/i/hs/clear.gif" height="10" width="1" alt="" border="0"></td></tr>
                        </table>
                                
                        <table width="100%" cellpadding="3" cellspacing="0" border="0" id="formFrame">
                            <tr><td colspan="5" align="left">&nbsp;Search Results:&nbsp;&nbsp;<jsp:getProperty name="search" property="Start"/> to <jsp:getProperty name="search" property="End"/></td></tr>

                            <tr><td colspan="5" height="10"><img src="/i/hs/clear.gif" height="10" width="1" alt="" border="0"></td></tr>

                                <% if (search.hasMemberList()) {
                                    if (search.getMemberList().size()==0) { %>
                            <tr><td class="bodyText" align="center">No members found.</td></tr>
                                <% } else { %>
                                        
                            <tr><td colspan="5" align="center"><%=(search.getHasPrev()?"<A HREF=\"Javascript:document.advForm.next.value='false';Javascript:document.advForm.submit()\">&lt;&lt; prev</A>":"&lt;&lt; prev")%> | <%=(search.getHasNext()?"<A HREF=\"Javascript:document.advForm.next.value='true';Javascript:document.advForm.submit()\">next &gt;&gt;</A>":"&gt;&gt; next")%></td></tr>

                            <tr>
                                <td><b>Handle</b></td>
                                <td><b>Rating</b></td>
                                <td><b>State</b></td>
                                <td><b>School</b></td>
                                <td><b>Last Competed</b></td>
                            </tr>
                                        
                            <adv:resultSetRowIterator id="member" list="<%=search.getMemberList()%>">
        
                            <tr>
                                <td><a href="?module=Statistics&c=member_profile&cr=<adv:resultSetItem row='<%=member%>' name="user_id"/>"><adv:resultSetItem row="<%=member%>" name="handle"/></a></td>
                                <td><adv:resultSetItem row="<%=member%>" name="rating"/></td>
                                <td><adv:resultSetItem row="<%=member%>" name="state_code"/></td>
                                <td><adv:resultSetItem row="<%=member%>" name="school_name"/></td>
                                <td><adv:resultSetItem row="<%=member%>" name="last_competed" format="MM/dd/yyyy" ifnull="N/A"/></td>
                            </tr>

                            </adv:resultSetRowIterator>
                                <% }
                                } %>
                            <tr><td colspan="5" height="10"><img src="/i/hs/clear.gif" height="10" width="1" alt="" border="0"></td></tr>

                        </table>

<script type="text/javascript">

function changeState() {
    document.advForm.cmd.value="";
    document.advForm.submit();
    }
function submitSearch() {
    document.advForm.submit();
    }
function submitEnter(_event) {
    var keycode;
    if (window.event) {
        keycode=window.event.keyCode;
        }
    else if (_event) {
        keycode=e.which;
        }
    else {
        return(true);
        }
    if (keycode==13) {
        submitSearch();
        return(false);
        }
    else {
        return(true);
        }
    }

</script>

                    </td>
                    <td><img src="/i/hs/clear_10_pix_width.gif" width="10" height="1" alt="" order="0"></td>
                </tr>
            </table>
            
            </form>
<!-- Center Column ends -->

        </td>
        <td width="1" bgcolor="#000000" valign="top"><img src="/i/hs/frame_1pix_bg_lg_top.gif" width="1" height="18" alt="" border="0"></td>
        <td width="1" bgcolor="#c5c5c9" valign="top"><img src="/i/hs/frame_1pix_bg_lg_top_right.gif" width="1" height="18" alt="" border="0"></td>
        <td bgcolor="#001934" valign="top">

<!-- Right Column begins -->
<jsp:include page="../includes/right_resources.jsp"/>
<!-- Right Column ends -->

        </td>
    </tr>
</table>

<!-- Footer begins -->
<jsp:include page="../includes/foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
