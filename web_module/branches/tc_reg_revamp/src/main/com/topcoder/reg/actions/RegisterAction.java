/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.actions;

import com.opensymphony.xwork2.Preparable;
import com.opensymphony.xwork2.config.ConfigurationException;
import com.topcoder.reg.CaptchaGenerator;
import com.topcoder.reg.Constants;
import com.topcoder.reg.EmailSetting;
import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.dto.SessionSocialAccount;
import com.topcoder.reg.dto.SocialAccount;
import com.topcoder.reg.dto.UserDTO;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.util.DataProvider;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.model.Country;
import org.apache.struts2.ServletActionContext;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;

/**
 * This action will be used to create new user account into persistence given user instance.
 * <p>
 * <strong>Thread Safety:</strong> Technically speaking, this class is mutable and not thread-safe. But Struts only
 * uses this class in thread-safe manner.
 * </p>
 * 
 * <p>
 * Change in v1.1 (Release Assembly - TopCoder Website Social Login)
 * <ol>
 * <li>If it's a GET request, then retrieve the <code>SocialAccount</code> instance from session and display it
 * on JSP page.</li>
 * <li>If it's a POST request, then store the <code>SocialAccount</code> instance inside session into database
 * as one step of registeration.</li>
 * <ol>
 * <p>
 *
 * <p>
 *     version 1.2(BugR 10042) change log:
 *     <ol>
 *         <li>Add {@link #utm_source} field and its getter/setter method.</li>
 *         <li>Add {@link #utm_medium} field and its getter/setter method.</li>
 *         <li>Add {@link #utm_campaign} field and its getter/setter method.</li>
 *     </ol>
 * </p>
 * 
 * @author sampath01, leo_lol, ecnu_haozi, KeSyren
 * @version 1.2
 * @since 1.0
 */
public class RegisterAction extends BaseAction implements Preparable {

    /**
     * Generated serial.
     */
    private static final long serialVersionUID = 3203052058754758476L;

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = RegisterAction.class.getName();
	
	private static final Logger logger = Logger.getLogger(RegisterAction.class);

    /**
     * Instance of {@link UserDTO}.
     */
    private UserDTO user;

    /**
     * This field will be filled up in {@link #prepare()} method. It'll be read by the front-end.
     */
    private List<Country> countries;

    /**
     * Registration email settings, used to send email to new TC users. It'll be injected by Spring.
     */
    private EmailSetting setting;

    /**
     * Validation messages for front-end to display.
     */
    private List<String> messages;

    /**
     * The current logged in social account data.
     * @since 1.1
     */
    private SocialAccount social;

    /**
     *  Identify the advertiser, site, publication, etc. that is sending traffic to your property, e.g. google,
     *  city search, newsletter4, billboard.
     */
    private String utm_source;

    /**
     * The advertising or marketing medium, e.g.: cpc, referral, email.
     */
    private String utm_medium;

    /**
     * The individual campaign name, slogan, promo code, etc. for a product.
     */
    private String utm_campaign;

    /**
     * This method would create and persist new user according user input data.
     * 
     * @throws Exception
     *             If there is any error.
     * @return result code.
     */
    @Override
    public String execute() throws Exception {
        final String signature = CLASS_NAME + "#execute()";
        logger.info(signature);

        HttpServletRequest request = ServletActionContext.getRequest();
        HttpSession session = ServletActionContext.getRequest().getSession();

        String redirectURL = request.getParameter("redirect");
        if (null != redirectURL && redirectURL.trim().length() > 0) {
            session.setAttribute(RegistrationHelper.NEXT_PAGE_SESSION_KEY, redirectURL);
        }
        //If there is a SocialAccount instance in session and it's POST request, then this is a registration with social account.
        //If there isn't a SocialAccount instance in session and it's POST request, then this is a direct registration.
        SessionSocialAccount socialAccountInSession =
            (SessionSocialAccount) session.getAttribute(RegistrationHelper.SOCIAL_ACCOUNT_SESSION_KEY);

        //The GET request is to display registration page.
        if (request.getMethod().equals("GET")) {
            if (socialAccountInSession != null) {
                if (!socialAccountInSession.isExpired()) {
                    social = socialAccountInSession.getSocialAccount();
                    // This object is disposable.
                    socialAccountInSession.setExpired(true);
                    session.setAttribute(RegistrationHelper.SOCIAL_ACCOUNT_SESSION_KEY, socialAccountInSession);
                } else {
                    session.removeAttribute(RegistrationHelper.SOCIAL_ACCOUNT_SESSION_KEY);
                }
            }
        }

        //put tracking attributes into session.
        if(null != utm_source) {
            session.setAttribute("utm_source", utm_source);
            session.setAttribute("utm_medium", utm_medium);
            session.setAttribute("utm_campaign", utm_campaign);
        }

        //The POST request is to do registration process.
        if (request.getMethod().equals("POST")) {
            //To eliminate NULL field.
            if (null == messages) {
                messages = new ArrayList<String>();
            }
            if (null == user) {
                user = new UserDTO();
            }

            validateHandle();
            validateFirstName();
            validateLastName();
            validateEmail();
            validateCountry();
            validateVerificationCode();
            
            if(socialAccountInSession != null){
			    String pwd = Constants.DEFAULT_PASSWORD;
                user.setPassword(pwd);
            }else{
                validatePassword();
            }
            
            if (messages.isEmpty()) {
                user.setStatus('U');
                user.setSource(regSource);
                try {
                    //Try to register.
                    long userId = userService.registerUser(user);
                   
                    //If there a social account exist, then store the mapping between this social account and the TC account.
                    if (socialAccountInSession != null) {
                        socialService.bindUserWithSocialAccount(userId, socialAccountInSession.getSocialAccount());
                     }
                    
                    String url =
                        ApplicationServer.SERVER_NAME + "/" + regSource + "/activate.action?"
                            + WebConstants.ACTIVATION_CODE + "=" + user.getActivationCode();
                    // send activation mail
                    RegistrationHelper.sendActivationEmail(setting.getEmailSubject(), user.getActivationCode(),
                        setting.getEmailBodyTemplateFile(), user.getEmail(), setting.getEmailFromAddress(),
                        setting.getSenderName(), url);
                } catch (PersistenceException e) {
                    logger.error(signature+ e);
                    messages.add(e.getMessage());
                } catch (Exception e) {
                    logger.error(signature+ e);
                    messages.add(e.getMessage());
                }
            } else {
                
                for (String s : messages) {
                    logger.error(s);
                }
            }
        }
        //No matter the registration is successful or fail, the same struts result can handle them.
        //LoggingWrapperUtility.logExit(logger, signature, new String[] {SUCCESS});
        return SUCCESS;
    }

    /**
     *  validate handle
     * 
     * @throws PersistenceException
     *             If there is any DB error.
     */
    private void validateHandle() throws PersistenceException{
        if (RegistrationHelper.isNullOrEmptyString(user.getHandle())) {
            messages.add("Handle is requried");
        } else {
            final int handleLen = user.getHandle().length();
            if (handleLen > Constants.MAX_HANDLE_LENGTH || handleLen < Constants.MIN_HANDLE_LENGTH) {
                messages.add("Length of handle in character should be between " + Constants.MIN_HANDLE_LENGTH
                    + " and" + Constants.MAX_HANDLE_LENGTH);
            } else {
                // Check if the handle is invalid.
                String result = RegistrationHelper.validateHandle(user.getHandle());
                if (null != result) {
                    messages.add(result);
                } else {
                    // Validate handle availability.
                    try {
                        if (userService.handleExists(user.getHandle())) {
                            messages.add("Handle '" + user.getHandle() + "' has already been taken");
                        }
                    } catch (Exception e) {
                        // drop quietly.
                    }
                }
            }
        }

    }
    /**
     * validate first name.
     */
    private void validateFirstName(){
        if (RegistrationHelper.isNullOrEmptyString(user.getFirstName())) {
            messages.add("First name is required");
        } else {
            final int firstNameLen = user.getFirstName().length();
            if (firstNameLen > Constants.MAX_GIVEN_NAME_LENGTH) {
                messages.add("Maximum length of first name is " + Constants.MAX_GIVEN_NAME_LENGTH);
            }
        }
    }
    
    /**
     *  validate last name.
     */
    private void validateLastName(){
        if (RegistrationHelper.isNullOrEmptyString(user.getLastName())) {
            messages.add("Last name is required");
        } else if (user.getLastName().length() > Constants.MAX_SURNAME_LENGTH) {
            messages.add("Maximum length of last name is " + Constants.MAX_SURNAME_LENGTH);
        }
    }

    /**
     * validate email.
     * 
     * @throws PersistenceException
     *             If there is any DB error.
     */
    private void validateEmail() throws PersistenceException {
        // validate email.
        if (RegistrationHelper.isNullOrEmptyString(user.getEmail())) {
            messages.add("Email is required");
        } else {
            if (user.getEmail().length() > Constants.MAX_EMAIL_LENGTH) {
                messages.add("Maxiumum lenght of email address is " + Constants.MAX_EMAIL_LENGTH);
            } else {
                Matcher matcher = RegistrationHelper.EMAIL_PATTERN.matcher(user.getEmail());
                if (!matcher.matches()) {
                    messages.add("Email address is invalid");
                }

                if (!DataProvider.isEmailAvailable(user.getEmail())) {
                    messages.add("The email - '" + user.getEmail() + "' is already registered, please use another one.");
                }
            }
        }
    }
    /**
     * validate country.
     */
    private void validateCountry(){
        if (RegistrationHelper.isNullOrEmptyString(user.getCountry())) {
            messages.add("Please select a country");
        }
    }
    /**
     * validate verification code.
     */
    private void validateVerificationCode(){
        HttpSession session = ServletActionContext.getRequest().getSession();
        
        if (RegistrationHelper.isNullOrEmptyString(user.getVerificationCode())) {
            messages.add("Captcha code is required");
        } else {
            if (!user.getVerificationCode().equalsIgnoreCase(
                session.getAttribute(captchaWordSessionKey).toString())) {
                messages.add("Captcha code error");
            }
        }

        // cleanup the used image.
        String uuid = (String) session.getAttribute("UUID");
        if (null != uuid) {
            CaptchaGenerator.deleteCaptcha(session.getServletContext(), uuid);
        }
    }
    
    /**
     *  validate password.
     */
    private void validatePassword(){
        if (RegistrationHelper.isNullOrEmptyString(user.getPassword())) {
            messages.add("Password is required");
        } else {
            final int passwordLen = user.getPassword().length();
            if (passwordLen > Constants.MAX_PASSWORD_LENGTH || passwordLen < Constants.MIN_PASSWORD_LENGTH) {
                messages.add("Length of password should be between " + Constants.MIN_PASSWORD_LENGTH + " and "
                    + Constants.MAX_PASSWORD_LENGTH);
            } else {
                // length OK, check password strength.
                int strength = RegistrationHelper.calculatePasswordStrength(user.getPassword());
                switch (strength) {
                case -1:
                    messages.add("Password cannot end with a number");
                    break;
                case 1:
                case 2:
                    messages.add("Password is too weak");
                    break;
                default:
                    break;
                }
            }
        }

        if (null != user.getPassword() && !user.getPassword().equals(user.getConfirmPassword())) {
            messages.add("Password and confirm password should be exactly same");
        }
    }

    /**
     * This method checks success of IoC.
     * 
     * @throws ConfigurationException
     *             there is any configuration error.
     */
    @PostConstruct
    public void checkConfiguration() throws ConfigurationException {
        super.checkConfiguration();
        RegistrationHelper.checkNotNull("setting", setting, ConfigurationException.class);
       
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public UserDTO getUser() {
        return user;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param user
     *            the name-sake field to set
     */
    public void setUser(UserDTO user) {
        this.user = user;
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public List<Country> getCountries() {
        return countries;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param countries
     *            the name-sake field to set
     */
    public void setCountries(List<Country> countries) {
        this.countries = countries;
    }

    /**
     * <p>
     * Setter of setting field.
     * </p>
     * 
     * @param setting
     *            the setting to set
     */
    public void setSetting(EmailSetting setting) {
        this.setting = setting;
    }

   

    /**
     * Populate countries before performing validation and executing action.
     * 
     * @throws Exception
     *             If there is any error.
     */
    @SuppressWarnings("unchecked")
    public void prepare() throws Exception {
        HttpSession session = ServletActionContext.getRequest().getSession();
        countries = (List<Country>) session.getAttribute("countries");
        if (null == countries) {
            countries = DataProvider.getAllCountries();
            session.setAttribute("countries", countries);
        }
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public List<String> getMessages() {
        return messages;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param messages
     *            the name-sake field to set
     */
    public void setMessages(List<String> messages) {
        this.messages = messages;
    }

    /**
     * <p>
     * The getter method for field social.
     * </p>
     * @since 1.1
     * @return the social
     */
    public SocialAccount getSocial() {
        return social;
    }

    /**
     * <p>
     * The setter method for field social.
     * </p>
     * @since 1.1
     * @param social
     *            the social to set
     */
    public void setSocial(SocialAccount social) {
        this.social = social;
    }

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_source() {
        return utm_source;
    }

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_medium() {
        return utm_medium;
    }

    /**
     * Gets namesake field.
     *
     * @return the namesake value.
     */
    public String getUtm_campaign() {
        return utm_campaign;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_source the source
     */
    public void setUtm_source(String utm_source) {
        this.utm_source = utm_source;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_medium the medium
     */
    public void setUtm_medium(String utm_medium) {
        this.utm_medium = utm_medium;
    }

    /**
     * Sets the namesake field.
     *
     * @param utm_campaign the campaign.
     */
    public void setUtm_campaign(String utm_campaign) {
        this.utm_campaign = utm_campaign;
    }
}
