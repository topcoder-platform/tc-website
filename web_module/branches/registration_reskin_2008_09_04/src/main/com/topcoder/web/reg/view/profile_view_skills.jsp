<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Profile View (Registrations)</title>
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
                    <li><a href="profile_view_skills.jsp" title="Profile View (Skills)" class="active"><span>Skills &amp; Affiliations</span></a></li>
                    <li><a href="profile_view_demographics.jsp" title="Profile View (Demographics)"><span>Demographics</span></a></li>
                </ul>
                
                
                <div id="tab-content">

                    <div class="sidebox">

                        <%-- Hidden till functionality can be put in 
                        <h4>Profile Completeness</h4>
                        <img src="/i/registration/progress_85.jpg" alt="85% complete" />
                        <div class="center">80% completed</div>
                        <hr />
                        <ul>
                            <li class="profile-completed">Name &amp; Contact Info</li>
                            <li class="profile-completed">Account Information</li>
                            <li class="profile-completed">Skills</li>
                            <li class="profile-completed">Affiliations</li>
                            <li>Demographics</li>        
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
                            <span>Skills</span><span class="end">&nbsp;</span>
                            <a href="edit_skills_and_affiliations.jsp" title="Edit Skills &amp; Affiliations" class="edit">Edit</a>
                        </h4>
                        <div class="content-body">
                            <table width="95%" class="zebra" cellspacing="0">
                                <th>Skill</th>
                                <th>Skill Level</th>
                                <th>Last Used</th>
                                <th>Years Used</th>
                                <tr class="odd">
                                    <td>XHTML</td>
                                    <td class="center">Expert</td>
                                    <td class="center">2008</td>
                                    <td class="center">6</td>
                                </tr>
                                <tr class="even">
                                    <td>CSS</td>
                                    <td class="center">Expert</td>
                                    <td class="center">2008</td>
                                    <td class="center">4</td>
                                </tr>
                                <tr class="odd">
                                    <td>ECMAScript</td>
                                    <td class="center">Intermediate</td>
                                    <td class="center">2008</td>
                                    <td class="center">4</td>
                                </tr>
                                <tr class="even">
                                    <td>Web Design</td>
                                    <td class="center">Expert</td>
                                    <td class="center">2008</td>
                                    <td class="center">6</td>
                                </tr>
                                <tr class="odd">
                                    <td>ActionScript</td>
                                    <td class="center">Beginner</td>
                                    <td class="center">2008</td>
                                    <td class="center">&lt;1</td>
                                </tr>
                                <tr class="even">
                                    <td>Brand Design</td>
                                    <td class="center">Beginner</td>
                                    <td class="center">2008</td>
                                    <td class="center">1</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <div class="content">
                        <h4 class="floated">
                            <span>Tools</span><span class="end">&nbsp;</span>
                            <a href="edit_skills_and_affiliations.jsp" title="Edit Skills &amp; Affiliations" class="edit">Edit</a>
                        </h4>
                        <div class="content-body">
                            <table width="95%" class="zebra" cellspacing="0">
                                <th>Skill</th>
                                <th>Skill Level</th>
                                <th>Last Used</th>
                                <th>Years Used</th>
                                <tr class="odd">
                                    <td>Photoshop</td>
                                    <td class="center">Expert</td>
                                    <td class="center">2008</td>
                                    <td class="center">3</td>
                                </tr>
                                <tr class="even">
                                    <td>Illustrator</td>
                                    <td class="center">Expert</td>
                                    <td class="center">2007</td>
                                    <td class="center">5</td>
                                </tr>
                                <tr class="odd">
                                    <td>Dreamweaver</td>
                                    <td class="center">Intermediate</td>
                                    <td class="center">2008</td>
                                    <td class="center">2</td>
                                </tr>
                                <tr class="even">
                                    <td>Flex Builder</td>
                                    <td class="center">Beginner</td>
                                    <td class="center">2008</td>
                                    <td class="center">&lt;1</td>
                                </tr>
                            </table>
                        </div>
                    </div>

                    <%-- Once the functionality for the progress bar is complete, remove the inline style below. --%>
                    <div class="content" style="float:right; margin-right:10px;">

                        <h4 class="floated">
                            <span>Affiliations</span><span class="end">&nbsp;</span>
                            <a href="edit_skills_and_affiliations.jsp" title="Edit Skills &amp; Affiliations" class="edit">Edit</a>
                        </h4>    
                        <div class="content-body">
                            <table width="50%" class="zebra" cellspacing="0">
                                <th>Organization &amp; Club Memberships</th>
                                <tr class="odd"><td>AIGA</td></tr>
                                <tr class="even"><td>SIGGRAPH</td></tr>
                                <tr class="odd"><td>ICOGRADA</td></tr>
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
