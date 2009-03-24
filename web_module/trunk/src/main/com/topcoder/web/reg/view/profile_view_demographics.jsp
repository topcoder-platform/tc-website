<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Profile View (demographics)</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
        
        <div id="wrapper">
        
            <div id="box-head">
                <jsp:include page="header.jsp" />
                <div id="page-head">
                    <h3 id="your_profile"><span>Your Profile</span></h3>
                </div>
            </div>
            
            <div id="box-body">
            
                <ul id="tab">
                    <li><a href="profile_view_personal_information.jsp" title="Profile View (Personal Information)"><span>Personal Information</span></a></li>
                    <li><a href="profile_view_demographics.jsp" title="Profile View (Demographics)" class="active"><span>Demographics</span></a></li>
                </ul>
                
                <div id="tab-content">

                    <div class="sidebox">

                        <%-- Hidden until functionality is ready 
                        <h4>Profile Completeness</h4>
                        <img src="/i/registration/progress_65.jpg" alt="65% complete" />
                        <div class="center">60% completed</div>
                        <hr />
                        <ul>
                            <li class="profile-completed">Name &amp; Contact Info</li>
                            <li class="profile-completed">Account Information</li>
                            <li class="profile-completed">Demographics</li>
                        </ul>
                        --%>
                      <h4>SuperSmoothie</h4>
                        <div class="sidebox-bottom center">
                            <img src="/i/registration/profile_thumbs.jpg" alt="SuperSmoothie photo" />
                        </div>
                        
                        <h4 class="floated">Favorite Quote<a href="edit_favorite_quote.jsp" title="Edit Favorite Quote" class="edit">Edit</a></h4>
                        <p class="quote">
                            Things which are complicated tend to disappear and get lost.
                            Simplicity is difficult, not easy. Beauty is simple. All 
                            unnecessary elements are removed - only essence remains.
                            <br />-- Alan Hovhaness    
                        </p>

                    </div>
                    <div class="content">
                    
                        <h4 class="floated">
                            <span>Demographic Information</span><span class="end">&nbsp;</span>
                            <a href="edit_demographics.jsp" title="Edit Demographics" class="edit">Edit</a>                        
                        </h4>
                        
                        <div class="content-body">
                            <table width="100%" class="plain">
                                <tr>
                                    <td class="field-name">Age:</td>
                                    <td class="field-value">Decline To Answer</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Gender:</td>
                                    <td class="field-value">male</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Ethnic Backgroud:</td>
                                    <td class="field-value">Decline To Answer</td>
                                </tr>
                                <tr>
                                  <td class="field-name">Primary Interest in TopCoder:</td>
                                  <td class="field-value">Creative Competition</td>
                              </tr>
                                <tr>
                                  <td class="field-name">How Did You Hear About TopCoder:</td>
                                  <td class="field-value">Friend</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Clubs/Organizations:</td>
                                  <td class="field-value">SHPE</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Other Clubs/Organizations:</td>
                                  <td class="field-value">&nbsp;</td>
                              </tr>
                                <tr>
                                    <td class="field-name">Currently Employed:</td>
                                    <td class="field-value">Yes</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Industry:</td>
                                    <td class="field-value">Other</td>
                                </tr>
                                <tr>
                                  <td class="field-name">Purchasing Role:</td>
                                  <td class="field-value">None</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Company Revenue:</td>
                                  <td class="field-value">N/A</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Company Spending on IT:</td>
                                  <td class="field-value">N/A</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Primary Area of Interest:</td>
                                  <td class="field-value">Web</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Shirt Size:</td>
                                  <td class="field-value">Medium</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Job Title:</td>
                                  <td class="field-value">Information Architect</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Company:</td>
                                  <td class="field-value">TopCoder</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Resume:</td>
                                  <td class="field-value">&nbsp;</td>
                              </tr>
                            </table>
                      </div>

                    </div>
                    
                </div>
                <div id="tab-content-bottom"></div>
            </div>

            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
