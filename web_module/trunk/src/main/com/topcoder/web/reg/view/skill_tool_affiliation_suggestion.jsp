<%@ page import="com.topcoder.shared.util.ApplicationServer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
        <title>Skill/Tool/Affiliation Suggestion</title>
        <script type="text/javascript" src="/js/regReskin20080904.js"></script>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_reg"/>
        </jsp:include>
    </head>
    
    <body>
		<jsp:include page="header.jsp" />
		<div id="heading" class="registrationSuccessfulHedading">	
			<div class="inner">
				<h1>Skill, Tool, and Affiliation Suggestions</h1>
			</div><!-- END .inner -->
		</div>
		<p class="padded">We value your feedback. Your suggestions will help us to improve our website for all members.</p>  
		<form name="form" method="post" action="">
			<div id="content" class="registrationForm">                                               
				<div class="leftSide">
					<p>List up to five skills not already listed that you would like to see added.</p>
				</div>                                                
				<div class="information rightSide">
					<h4><span>Skills</span><span class="end">&nbsp;</span></h4>
					<div class="content-body">
						<ul class="form">
							<li class="row">
								<label for="skills_1">1:</label>                            
								<input type="text" name="skills[]" id="skills_1" size="40" />
							</li>
							<li class="row">
								<label for="skills_2">2:</label>                            
								<input type="text" name="skills[]" id="skills_2" size="40" />
							</li>
							<li class="row">
								<label for="skills_3">3:</label>                            
								<input type="text" name="skills[]" id="skills_3" size="40" />
							</li>
							<li class="row">
								<label for="skills_4">4:</label>                            
								<input type="text" name="skills[]" id="skills_4" size="40" />
							</li>
							<li class="row">
								<label for="skills_5">5:</label>                            
								<input type="text" name="skills[]" id="skills_5" size="40" />
							</li>                                
						</ul>                                                                                            
					</div>
				</div>
				<div class="clear"></div>
				<div class="leftSide">
					<p>List up to five tools not already listed that you would like to see added.</p>
				</div>                                                
				<div class="information rightSide">
					<h4><span>Tools</span><span class="end">&nbsp;</span></h4>
					<div class="content-body">
						<ul class="form">
							<li class="row">
								<label for="tools_1">1:</label>                            
								<input type="text" name="tools[]" id="tools_1" size="40" />
							</li>
							<li class="row">
								<label for="tools_2">2:</label>                            
								<input type="text" name="tools[]" id="tools_2" size="40" />
							</li>
							<li class="row">
								<label for="tools_3">3:</label>                            
								<input type="text" name="tools[]" id="tools_3" size="40" />
							</li>
							<li class="row">
								<label for="tools_4">4:</label>                            
								<input type="text" name="tools[]" id="tools_4" size="40" />
							</li>
							<li class="row">
								<label for="tools_5">5:</label>                            
								<input type="text" name="tools[]" id="tools_5" size="40" />
							</li>                                
						</ul>    
					</div>                                            
				</div>
				<div class="clear"></div>                                                
				<div class="leftSide">
					<p>List up to five organizations or clubs not already listed that you would like to see added.</p>
				</div>                                                
			
				<div class="information rightSide">
					<h4><span>Affiliations</span><span class="end">&nbsp;</span></h4>
					<div class="content-body">
						<ul class="form">
							<li class="row">
								<label for="affiliations_1">1:</label>                            
								<input type="text" name="affiliations[]" id="affiliations_1" size="40" />
							</li>
							<li class="row">
								<label for="affiliations_2">2:</label>                            
								<input type="text" name="affiliation[]" id="affiliations_2" size="40" />
							</li>
							<li class="row">
								<label for="affiliations_3">3:</label>                            
								<input type="text" name="affiliation[]" id="affiliations_3" size="40"/>
							</li>
							<li class="row">
								<label for="affiliations_4">4:</label>                            
								<input type="text" name="affiliation[]" id="affiliations_4" size="40" />
							</li>
							<li class="row">
								<label for="affiliations_5">5:</label>                            
								<input type="text" name="affiliation[]" id="affiliations_5" size="40" />
							</li>                                
						</ul>
					</div>
				</div>
				<div class="clear"></div>  
				<div class="center">
					<a class="redBtn btnSave" id="submit_add_skills" href="JavaScript:self.close();">
						<span class="buttonMask"><span class="text">SUBMIT</span></span>
					</a>
					<br /> Or <a href="#" onclick="self.close();">cancel and close this window</a>
				</div>
			</div>
		</form>
		<jsp:include page="footer.jsp" />
    </body>
</html>
