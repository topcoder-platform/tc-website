<%--
   - Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
   - This page contains modal windows requierd in registartion app.
   -
   - Version 1.1(Release Assembly - TopCoder Reg2 Password Recovery Revamp and Misc Bug Fixes) change log:
   - Updated the modal window to use reset code instead of secret question for recovery password
   -
   - Version: 1.1
   - Author: leo_lol, TCSASSEMBLER
 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<div id="modalBackground"></div>
	   <!-- Privacy Policy Modal -->
	   <div id="privacyPolicyModal" class="modal">
	       <a href="javascript:;" class="btnClose"></a>
	       <div class="section" style="text-align: center;">
	           <h3>Privacy Policy</h3>
	       </div>
	       
	       <div class="section">
	           <p>Our privacy policy, updated as of February 23, 2006, describes the information we collect and how we use it. </p>
               <p>TopCoder values privacy as much as we value programmers, and therefore we are committed to protecting the privacy of our users. We want to provide a safe, secure user experience. We will use reasonable commercial efforts to ensure that the information you submit to us remains private. Your personal information is immediately transferred from our Web server to behind our firewall, where it remains isolated from a direct connection to the Internet. By using this Web site, and in doing so accepting the Terms and Conditions of Use under which you may use this Web site (see <a href="terms_of_use.jsp">Terms and Conditions of Use</a>), you consent to the use of your personal information as described in this privacy policy. </p>
               <p>Our privacy policy and security measures are periodically reviewed and enhanced as necessary. You should understand, however, that &quot;perfect security&quot; does not exist on the Internet. The information that you submit to us is used only for the purposes as set forth herein, as required by law, or when we believe in good faith that disclosure is legally required to protect our rights. We will not use your personal information for any other purpose other than as set out here without first obtaining your permission. The following reflects our commitment to you. </p>
               <h4>Your California Privacy Rights</h4>
               <p>California Civil Code Section 1798.83 permits registered users who are California residents to request certain information regarding disclosure of personal information to third parties for their direct marketing purposes. To request such information, please e-mail <a href="mailto:support@topcoder.com">support@topcoder.com</a> or write to us at:</p>
               <p>TopCoder<br />
               95 Glastonbury Blvd<br />
               Glastonbury, CT 06033 </p>
               <h4>Information About All TopCoder Visitors</h4>
               <p>We gather information about all of our users collectively, including without limitation, (a) their Internet domain and their computer IP address, (b) what area users visit most frequently, (c) the type of browser and operating system they use and (d) if the user linked to our Web site from another Web site, the address of that other Web site. We use this information for analyzing trends and statistics, fraud protection, improving our services, planning Web site enhancements and measuring overall Web site effectiveness. From time to time we may reveal general, anonymous, aggregated statistical information about our Web site, services and users, such as the number of visits and users and what Web site features they use. </p>
               <h4>Information About You Specifically</h4>
               <p>If you choose to register as a member in order to participate in TopCoder competitions, you will provide us with additional information about yourself, including your name, handle (public login name) and address. If you are a winner, for legal purposes we will also request confirmation of your date of birth. In addition, if you are a U.S. person (including U.S. resident aliens), we will request your social security number (or taxpayer identification number) on IRS form W-9. If you are a winner, and you are not a U.S. person, we will request a Certificate of Foreign Status of Beneficial Owner for United States Tax Withholding on IRS form W-8BEN. We use this information to verify your eligibility to participate in specific competitions, and to contact you and properly notify the IRS should you be a winner. From time to time, we may use the contact information to alert members of new competitions and communicate news, events and reminders. If you do not want to be alerted of any of these items, uncheck all boxes in the &quot;Email Notifications&quot; section on the second page of the registration form, or send an e-mail to <a href="mailto:support@topcoder.com">support@topcoder.com</a> asking to be removed from email notifications. During a competition, users participating will be shown and identified only by their handles, which are their public login names. A TopCoder member's handle, rating, country, school, competition statistics, date registered, winnings to date, skill set, and personal quote will be publicly available to any participants of the TopCoder Web site and competition applications. </p>
               <p>Spectators may be allowed to view a competition without identifying themselves, but competition participants must be members and must log in to prove it. All source code created during a competition will be available to anyone-spectators, members and sponsors and may be subject to challenge from other members. Your performance in a competition will allow us to help balance the competition. It will be recorded to calculate competition rating values and it will be posted on the Web site and in the competition area. Winners' names may also be released to governmental authorities as required by law. At registration, we will ask you to answer questions regarding certain demographic information as it relates to your status as a student or a professional. </p>
               <p>As a TopCoder member, you may choose to create a more extensive profile that includes your work and educational experience, as well as your relevant technology skills. You have the ability to update and change this information at any time and we encourage you to keep it updated. </p>
               <p>In certain circumstances such as participating in or opting in to certain events, TopCoder sponsors and subscribing employers will be given access to view your demographic information, educational and work experience (if provided by you), and contact information. </p>
               <p>TopCoder sponsors and subscribing employers may contact you proactively based upon your skills, experience and TopCoder success. If you are contacted by a third-party regarding employment opportunities and/or media interest as a result in your participation in TopCoder competitions (including, but not limited to, single-round matches and tournaments), you agree to promptly notify TopCoder of such contact. TopCoder may decide to utilize a process through which TopCoder members may choose to review online inquiries from interested TopCoder sponsors or subscribing companies before being contacted by those companies. </p>
               <p>The personal information you provide must be accurate and complete and all registration details (where applicable) must contain your real name, address and other requested details. You are solely responsible for your personal information and we may take any action with respect to your personal information we deem necessary or appropriate if we believe it may cause us to suffer any loss, liability or commercial damage.</p>
               <h4>Forums</h4>
               <p>TopCoder makes forum-style discussion topics available to our members and sponsors. These forums will identify TopCoder members by their user handles. Those simply viewing the forums may do so without identifying themselves, but those who wish to participate must be members or sponsors and must log in to prove it. Please remember that any information you disclose in these areas becomes public information. Accordingly, you should always exercise caution when deciding to disclose any personal information. </p>
               <h4>Cookies</h4>
               <p>To enhance your experience at TopCoder, we may use a feature on your Internet browser called a &quot;cookie.&quot; As you may already know, cookies are small files that your Web browser places on your computer's hard drive. We use cookies for purposes such as remembering user names, passwords and preferences, tracking click streams, and for load balancing. Because of our use of cookies, we can deliver faster service, consistent, updated results, and a more personalized site experience. You have the option of setting your browser to reject cookies. Doing this, however, may hinder performance and negatively impact your experience on our Web site. </p>
               <h4>Feedback</h4>
               <p>TopCoder may ask you for feedback and comments about the Web site or the competitions and we encourage your participation. Any feedback that is submitted becomes the property of TopCoder. We may use this feedback, such as success stories, for marketing purposes, or to contact you for further feedback on the Web site. </p>
               <h4>Links to Other Sites</h4>
               <p>We may provide links to other Web sites that we believe can offer you useful information. We are not, however, responsible for the privacy policies of other Web sites, including those Web sites on which our logo or other information supplied by us appears. This privacy policy only applies to information collected by this Web site. We suggest that you access other Web sites' online policies regarding their own data collection practices. </p>
               <h4>Access to Your Information</h4>
               <p>TopCoder will provide you with a reasonable opportunity to review the information that it has compiled about you, as well as a reasonable opportunity to correct any erroneous information. To view or correct your information, log in to the TopCoder web site, click on &quot;Update Profile&quot; on your &quot;Member Home&quot; page, or contact us at <a href="mailto:support@topcoder.com">support@topcoder.com</a>. </p>
               <h4>Privacy of Children on Our Web Site</h4>
               <p>Our Web site is not intended for use by children under the age of 13, and we do not knowingly collect personal information from children under the age of 13.</p>
               <h4>Privacy Commitment Changes</h4>
               <p>If we decide to change our privacy commitment for TopCoder, we will post those changes here so that you will always know what information we gather, how we might use that information, and whether we will disclose it to anyone. In the event that we make any significant changes to our Privacy Policy regarding the personal information we collect or the ways in which we use such personal information, we will also provide you with the opportunity to consent to these different uses of your personal information. If, at any time, you have questions or concerns about TopCoder's privacy commitment, please feel free to e-mail us at <a href="mailto:support@topcoder.com">support@topcoder.com</a>. </p>
               <h4>This privacy policy is effective as of February 23, 2006. </h4>
               <p>Thank you for visiting our site. We'll keep working hard to earn your loyalty.</p>
	       </div>
	   </div>
	   
	   <!-- Password recovery modal -->
		<div id="passwordRecoveryModal" class="modal">
				<a href="javascript:;" class="btnClose"></a>
				<img width="48" height="48" src="i/password-recovery-icon.png" alt="passwordRecovery" />
				<img width="176" height="21" src="i/password-recovery-heading.png" alt="passwordRecovery" />
				<div class="password_recovery_msg"></div>
				
				<div class="section">
					<div class="columnLeft"><p>Enter handle, primary email or secondary email</p></div>
					<div class="columnRight"><input type="text" id="handle" class="text" name="handle" /></div>
					<div class="clear"></div>
                    <a class="redBtn submit fRight arrow" href="javascript:;">
					    <span class="buttonMask"><span class="text"><span class="arrow">SUBMIT</span></span></span>
					</a>
                    <div class="clear"></div>
				</div>
		</div>
		<!-- end .passwordRecoveryModal -->
		<div id="passwordForgotModal" class="modal">
			<a href="javascript:;" class="btnClose"></a>
			<img width="48" height="48" src="i/password-recovery-icon.png" alt="passwordRecovery" />
			<img width="176" height="21" src="i/password-recovery-heading.png" alt="passwordRecovery" />
			<div class="password_recovery_msg"></div>
			
			<div class="section">
				<div class="clear"></div>
                <div class="columnLeft"><p>How would you like to reset your password?</p></div>
				<a class="redBtn submit fRight arrow" href="javascript:;">
					<span class="buttonMask"><span class="text"><span class="arrow">SUBMIT</span></span></span>
				</a>
				<div class="clear"></div>
			</div>
		</div>
		<!-- end .passwordForgotModal -->
        <div id="passwordResetModal" class="modal">
            <a href="javascript:;" class="btnClose"></a>
            <img width="48" height="48" src="i/password-recovery-icon.png" alt="passwordRecovery" />
            <img width="176" height="21" src="i/password-recovery-heading.png" alt="passwordRecovery" />
            <div class="password_recovery_msg"></div>
            <div class="section">
                <h3>Reset Your Password</h3>
                <p class="dl" id="msg_content">A code has been sent to your <strong class="receiveEmail"></strong> email. You have <span class="expireTime"></span> minutes to enter the code.</p>
                <table>
                    <tbody>
                        <tr>
                            <td class="tdLabel">Verification Code:</td>
                            <td class="tdInput">
                                <input type="text" maxlength="6" size="6" name="tk" class="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLabel">New Password:</td>
                            <td class="tdInput">
                                <input type="password" name="pwd" class="text">
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLabel">Confirm Password:</td>
                            <td class="tdInput">
                                <input type="password" name="pwdc" class="text">
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <a class="redBtn submit fRight arrow" href="javascript:;">
                                    <span class="buttonMask"><span class="text"><span class="arrow">SUBMIT</span></span></span>
                                </a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
		<!-- end .passwordResetModal -->
        <div id="passwordResetSuccessModal" class="modal">
            <a href="javascript:;" class="btnClose"></a>
            <img width="48" height="48" src="i/password-recovery-icon.png" alt="passwordRecovery" />
            <img width="176" height="21" src="i/password-recovery-heading.png" alt="passwordRecovery" />
            <div class="section">
                <p class="dl">Your password have been updated successfully!</p>
                <a class="redBtn done fRight" href="javascript:;">
                    <span class="buttonMask"><span class="text">DONE</span></span>
                </a>
            </div>

        </div>
		<!-- end .passwordResetSuccessModal -->

		<!-- Registration Result Modal -->
		<div id="registrationModal" class="modal">
		  <a href="javascript:;" class="btnClose"></a>
		  <div class="section">
		      <h3>Registration Message</h3>
		      <p></p>
		  </div>
		</div>

        <table class="emailTypeRadioTable">
            <tbody>
            <tr>
                <td>
                    <label><input type="radio" value="true" name="type">Primary Email</label>
                </td>
            </tr>
            <tr>
                <td>
                    <label><input type="radio" value="false" name="type">Secondary Email</label>
                </td>
            </tr>
            </tbody>
        </table>