<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Profile View (Personal Information)</title>
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
                    <li><a href="profile_view_personal_information.jsp" title="Profile View (Personal Information)" class="active"><span>Personal Information</span></a></li>
                    <li><a href="profile_view_demographics.jsp" title="Profile View (Demographics)"><span>Demographics</span></a></li>
                </ul>
                
                <div id="tab-content">

                    <div class="sidebox">

                        <%-- Hidden till we can properly implement it
                        <h4>Profile Completeness</h4>
                        <img src="/i/registration/progress_50.jpg" alt="50% completed" />
                        <div class="center">40% completed</div>
                        <hr />
                        <ul class="sidebox-bottom">
                            <li class="profile-completed">Name &amp; Contact Info</li>
                            <li class="profile-completed">Account Information</li>
                            <li>Demographics</li>
                        </ul>
                        --%>
                        
                        
                        
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
                            <span>Name and Contact</span><span class="end">&nbsp;</span>
                            <a href="edit_personal_information.jsp" title="Edit Name and Contacts" class="edit">Edit</a>
                        </h4>

                        <div class="content-body">
                            <table width="100%" class="plain">
                                <tr>
                                    <td class="field-name">First Name:<br /><span>(Given Name)</span></td>
                                    <td class="field-value">Ralph</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Last Name:<br /><span>(Surname)</span></td>
                                    <td class="field-value">Crammer</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Date of Birth:<br /><span>(MM/DD/YYYY)</span></td>
                                    <td class="field-value">01/01/1989</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Pursuing Secondary Education:</td>
                                    <td class="field-value">Yes</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Address:</td>
                                    <td class="field-value">1234 Streetname</td>
                                </tr>
                                <tr>
                                    <td class="field-name">City:</td>
                                    <td class="field-value">Cityname</td>
                                </tr>
                                <tr>
                                    <td class="field-name">State:</td>
                                    <td class="field-value">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Zip/Postal Code:</td>
                                    <td class="field-value">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Country:</td>
                                    <td class="field-value">United States</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Country to represent:</td>
                                    <td class="field-value">United States</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Time Zone:</td>
                                    <td class="field-value">US/Eastern</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Phone Number:</td>
                                    <td class="field-value">&nbsp;</td>
                                </tr>
                                <tr>
                                  <td class="field-name">Email Address:</td>
                                  <td class="field-value">ralph@mycomany.com</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Email Notifications:</td>
                                  <td class="field-value"><input name="checkbox" type="checkbox" id="checkbox" checked="checked" />
                                    Algorithm Competitions</td>
                              </tr>
                                <tr>
                                  <td class="field-name">&nbsp;</td>
                                  <td class="field-value"><input type="checkbox" name="checkbox" id="checkbox" />
                                    Software Development Opportunities</td>
                              </tr>
                                <tr>
                                  <td class="field-name">&nbsp;</td>
                                  <td class="field-value"><input name="checkbox" type="checkbox" id="checkbox" checked="checked" />
                                    TopCoder Studio Competitions</td>
                              </tr>
                                <tr>
                                  <td class="field-name">&nbsp;</td>
                                  <td class="field-value"><input type="checkbox" name="checkbox" id="checkbox" />
                                    Open AIM Competition Announcements</td>
                              </tr>
                                <tr>
                                  <td class="field-name">&nbsp;</td>
                                  <td class="field-value"><input type="checkbox" name="checkbox" id="checkbox" />
                                    Employment Opportunities</td>
                              </tr>
                                <tr>
                                  <td class="field-name">&nbsp;</td>
                                  <td class="field-value"><input type="checkbox" name="checkbox" id="checkbox" />
                                    TopCoder News &amp; Events</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Enable Member Contact:</td>
                                  <td class="field-value">Yes</td>
                              </tr>
                                <tr>
                                  <td class="field-name">Show/Hide Earnings:</td>
                                  <td class="field-value">Hide</td>
                              </tr>
                            </table>
                      </div>
                    </div>
                    
                    <div class="sidebox">
                        <h4>SuperSmoothie</h4>
                        <div class="sidebox-bottom center">
                            <img src="/i/registration/profile_thumbs.jpg" alt="SuperSmoothie photo" />
                        </div>
                    </div>
                    <div class="content">
                        <h4 class="floated">
                            <span>Account Information</span><span class="end">&nbsp;</span>
                            <a href="edit_personal_information.jsp" title="Account Information" class="edit">Edit</a>    
                        </h4>
                        <div class="content-body">
                            <table width="98%" class="plain" align="center">
                                <tr>
                                    <td class="field-name">Username:</td>
                                    <td class="field-value">SuperSmoothie</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Password:</td>
                                    <td class="field-value">********</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Secret Question:</td>
                                    <td class="field-value">What is your favorite drink?</td>
                                </tr>
                                <tr>
                                    <td class="field-name">Secret Question Response:</td>
                                    <td class="field-value">****************</td>
                                </tr>
                                <tr>
                                  <td class="field-name">Student/Professional:</td>
                                  <td class="field-value">Student</td>
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
