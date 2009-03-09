<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Edit Skills &amp; Affiliations</title>
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
                    <h3>
                        <a href="profile_view_skills.jsp" title="Profile View (Registrations)" id="your_profile_link"><span>Your Profile</span></a>
                        <span id="skills_edit"><span> / Skills &amp; Affiliations Areas</span></span>
                    </h3>
                </div>
            </div>
            
            <div id="box-body">
            
                <form name="form" method="post" action="profile_view_skills.jsp">

                    <div class="block">
                        <div class="sidebar">
                            <p>List those skills that you feel best highlight your abilities.</p>
                            <p>
                                If there is a common skill that we don't have listed, 
                                <a href="javascript:popUp('skill_tool_affiliation_suggestion.jsp');" title="Suggest a new skill">suggest a new skill</a>.
                            </p>

                        </div>
                        <div class="content">
                            <h4><span>Skills</span><span class="end">&nbsp;</span></h4>
                            <div class="content-body">
                                <ul class="inline-fields-large">
                                    <li>
                                        <h5>Choose a skill</h5>
                                        <select name="choose_skill" id="choose_skill">
                                            <option value="all skills">All Skills</option>
                                            <option value="design">Design</option>
                                            <option value="programming languages" selected="selected">Programming Languages</option>
                                        </select>
                                        <button type="button" id="choose_skill_go">Go</button>
                                        <select name="skills_subset" id="skills_subset" size="5">
                                            <option value="c">C</option>
                                            <option value="c#">C#</option>
                                            <option value="c++">C++</option>
                                            <option value="java">Java</option>
                                            <option value="javascript" selected="selected">Javascript</option>
                                        </select>
                                    </li>
                                    <li>
                                        <h5>Indicate your experience</h5>
                                        <ul>
                                            <li>
                                                <label for="selected_skill">Selected Skill:</label>
                                                <input type="text" name="selected_skill" id="selected_skill" value="Javascript" />
                                            </li>
                                            <li>
                                                <label for="skill_level">Skill Level:</label>
                                                <select name="skill_level" id="skill_level_subset">
                                                    <option value="beginner">Beginner</option>
                                                    <option value="intermediate">Intermediate</option>
                                                    <option value="expert">Expert</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label for="skill_last_used">Last Used:</label>
                                                <select name="skill_last_used" id="skill_last_used">
                                                    <option value="2002">2002</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2008" selected="selected">2008</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label for="skill_years_used">Years Used:</label>
                                                <select name="skill_years_used" id="skill_years_used">
                                                    <option value="&lt;1">&lt;1</option>
                                                    <option value="1">1</option>
                                                    <option value="2">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="10&gt;">10&gt;</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label>&nbsp;</label>
                                                <button type="button" id="skill_add">Add This Skill</button>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>    
                            <div class="content-body">
                                <table width="95%" class="zebra" cellspacing="0">
                                    <th>Skill</th>
                                    <th>Skill Level</th>
                                    <th>Last Used</th>
                                    <th>Years Used</th>
                                    <th>Action</th>
                                    <tr class="odd">
                                        <td>XHTML</td>
                                        <td class="center">Expert</td>
                                        <td class="center">2008</td>
                                        <td class="center">6</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="even">
                                        <td>CSS</td>
                                        <td class="center">Expert</td>
                                        <td class="center">2008</td>
                                        <td class="center">4</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td>Font Design</td>
                                        <td class="center">Intermediate</td>
                                        <td class="center">2007</td>
                                        <td class="center">3</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="even">
                                        <td>Web Design</td>
                                        <td class="center">Expert</td>
                                        <td class="center">2008</td>
                                        <td class="center">6</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                </table>    
                            </div>
                        </div>
                    </div>

                    <div class="block">
                        <div class="sidebar">
                            <p>Include those tools that best demonstrate your ability to get the job done.</p>
                            <p>
                                If you can't find a tool you think should be included,
                                <a href="javascript:popUp('skill_tool_affiliation_suggestion.jsp');" title="Suggest a new skill">suggest a new tool</a>.
                            </p>
                        </div>
                        <div class="content">
                            <h4><span>Tools</span><span class="end">&nbsp;</span></h4>
                            <div class="content-body">
                                <ul class="inline-fields-large">
                                    <li>
                                        <h5>Choose a tool</h5>
                                        <select name="choose_tool" id="choose_tool">
                                            <option value="all tools">All Tools</option>
                                            <option value="programming">Programming</option>
                                            <option value="visual editors">Visual Editors</option>
                                        </select>
                                        <button type="button" id="choose_tool_go">Go</button>
                                        <select name="tools_subset" id="tools_subset" size="5">
                                            <option value="dreamweaver" selected="selected">Dreamweaver</option>
                                            <option value="eclipse">Eclipse</option>
                                            <option value="emacs">Emacs</option>
                                            <option value="illustrator">Illustrator</option>
                                            <option value="crystal reports">Crystal Reports</option>
                                        </select>
                                    </li>
                                    <li>
                                        <h5>Indicate your experience</h5>
                                        <ul>
                                            <li>
                                                <label for="selected_tool">Selected Tool:</label>
                                                <input type="text" name="selected_tool" id="selected_tool" value="Dreamweaver" />
                                            </li>
                                            <li>
                                                <label for="skill_tool">Tool Level:</label>
                                                <select name="tool_level" id="tool_level">
                                                    <option value="beginner">Beginner</option>
                                                    <option value="intermediate">Intermediate</option>
                                                    <option value="expert">Expert</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label for="tool_last_used">Last Used:</label>
                                                <select name="tool_last_used" id="tool_last_used">
                                                    <option value="2002">2002</option>
                                                    <option value="2003">2003</option>
                                                    <option value="2004">2004</option>
                                                    <option value="2005">2005</option>
                                                    <option value="2006">2006</option>
                                                    <option value="2007">2007</option>
                                                    <option value="2008" selected="selected">2008</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label for="skill_years_used">Years Used:</label>
                                                <select name="skill_years_used" id="skill_years_used">
                                                    <option value="&lt;1" selected="selected">&lt;1</option>
                                                    <option value="1">1</option>
                                                    <option value="2" selected="selected">2</option>
                                                    <option value="3">3</option>
                                                    <option value="4">4</option>
                                                    <option value="5">5</option>
                                                    <option value="6">6</option>
                                                    <option value="7">7</option>
                                                    <option value="8">8</option>
                                                    <option value="9">9</option>
                                                    <option value="10">10</option>
                                                    <option value="10&gt;">10&gt;</option>
                                                </select>
                                            </li>
                                            <li>
                                                <label>&nbsp;</label>
                                                <button type="button" id="tool_add">Add This Tool</button>
                                            </li>
                                        </ul>
                                    </li>
                                </ul>
                            </div>
                            
                            <div class="content-body">
                                <table width="95%" class="zebra margin-top" cellspacing="0">
                                    <th>Tool</th>
                                    <th>Skill Level</th>
                                    <th>Last Used</th>
                                    <th>Years Used</th>
                                    <th>Action</th>
                                    <tr class="odd">
                                        <td>Photoshop</td>
                                        <td class="center">Expert</td>
                                        <td class="center">2008</td>
                                        <td class="center">3</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="even">
                                        <td>Illustrator</td>
                                        <td class="center">Expert</td>
                                        <td class="center">2007</td>
                                        <td class="center">5</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="odd">
                                        <td>Dreamweaver</td>
                                        <td class="center">Intermediate</td>
                                        <td class="center">2008</td>
                                        <td class="center">2</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                </table>    
                            </div>
                        </div>
                    </div>

                    <div class="block">
                        <div class="sidebar">
                            <p>
                                If we have overlooked an important organization, 
                                <a href="javascript:popUp('skill_tool_affiliation_suggestion.jsp');" title="Suggest a new skill">suggest a new organization</a>.
                            </p>
                        </div>
                    
                        <div class="content">
                            <h4><span>Affiliations</span><span class="end">&nbsp;</span> </h4>
                            <div class="content-body">
                                <ul class="inline-fields-large">
                                    <li>
                                        <h5>Choose an organization or club</h5>
                                        <select name="affiliations" id="affiliations" size="5">
                                            <option value="AIGA">AIGA</option>
                                            <option value="GAG">GAG</option>
                                            <option value="ICOGRADA">ICOGRADA</option>
                                            <option value="SIGGRAPH">SIGGRAPH</option>
                                            <option value="SIGWEB">SIGWEB</option>
                                        </select>
                                        <button type="button" id="affiliations_add">Add This Affiliation</button>
                                    </li>
                                </ul>
                            </div>

                            <div class="content-body">
                                <table width="80%" class="zebra margin-top" cellspacing="0">
                                    <th>Organization & Club Memberships</th>
                                    <th>Action</th>
                                    <tr class="odd">
                                        <td>AIGA</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                    <tr class="even">
                                        <td>SIGGRAPH</td>
                                        <td class="center"><a href="#">Delete</a></td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        
                        <div class="center">
                            <button type="submit" id="submit_skills">Save Changes</button>
                            <br /> Or cancel and <a href="profile_view_skills.jsp" title="Profile View (Skills)">return to your profile page</a>
                        </div>
                    </div>
                </form>
            
            </div>
            
            
            
            <jsp:include page="footer.jsp" />
            
        </div>
        
    </body>
</html>
