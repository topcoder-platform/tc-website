/*
 * Copyright (C) 2011 - 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.action;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.CaptchaGenerator;
import com.topcoder.web.reg.RegEmailSetting;
import com.topcoder.web.reg.RegHelper;
import com.topcoder.web.reg.UserDTO;

/**
 * <p>
 * Performs the registration action.
 * </p>
 * <p>
 * Version 1.1(Release Assembly - TC Registration Site 2 Handle Validation
 * Upgrade v1.0) Change notes:
 * <ol>
 * <li>{@link #validate()} method has been re-factored.</li>
 * </ol>
 * </p>
 * 
 * @version 1.1
 * @author live_world, leo_lol
 */
public class RegisterAction extends BaseAjaxAction implements PostAction {

    /**
     * serial version UID.
     */
    private static final long serialVersionUID = -3262433961862940959L;

    /**
     * Instance of {@link UserDTO}, used to implement model driven pattern.
     */
    private UserDTO userDTO = new UserDTO();

    /**
     * Registration email settings, used to send email to new TC users.
     */
    private RegEmailSetting setting;

    /**
     * Represents register source.
     */
    private static final String REGISTER_SOURCE_NAME = "reg2";

    /**
     * Registers a new user.
     * 
     * @throws Exception
     *             if an unexpected error occurs while processing the request
     */
    public void executeAction() throws Exception {
        // Validate common fields.
        Map<String, String> validationInfo = RegHelper.validate(userDTO);

        // Check presence of required userDTO.captchaWord field.
        if (RegHelper.isEmptyString(userDTO.getCaptchaWord())) {
            validationInfo.put("captchaWord", "Verification code is missing");
        } else {
            // verify captcha.
            String randomString = getSessionData().getCaptchaWord();
            if (randomString == null || randomString.compareToIgnoreCase(userDTO.getCaptchaWord()) != 0) {
                validationInfo.put("captchaWord", "Verification code doesn't match");
            }
        }

        // Clean up the verification image after use.
        HttpSession session = ServletActionContext.getRequest().getSession();
        String uuid = (String) session.getAttribute("UUID");
        if (null != uuid) {
            CaptchaGenerator.deleteCaptcha(session.getServletContext(), uuid);
        }

        // Add field errors.
        if (!validationInfo.isEmpty()) {
            for (Map.Entry<String, String> entry : validationInfo.entrySet()) {
                addFieldError("userDTO." + entry.getKey(), entry.getValue());
            }
        }

        if (hasFieldErrors()) {
            return;
        }
        User user = RegHelper.populateUser(userDTO);
        try {
            UserDAO userDao = getUserDAO();
            userDao.saveOrUpdate(user);
            String activationCode = StringUtils.getActivationCode(user.getId().longValue());
            RegHelper.addSecurityStuff(user);
            // send activation mail
            if (userDTO.getEmail() != null) {
                RegHelper.sendActivationEmail(setting.getActivationEmailSubject(), activationCode, setting
                        .getActivationEmailBodyTemplateFile(), userDTO.getEmail(), setting
                        .getActivationEmailFromAddress());
            }
            user.setActivationCode(activationCode);
            user.setRegSource(REGISTER_SOURCE_NAME);
            userDao.saveOrUpdate(user);

            Map<String, Object> result = new HashMap<String, Object>();
            result.put("success", true);
            setResult(result);
        } catch (Exception e) {
            RegHelper.revertSecurityStuff(user, e);
            throw e;
        }
    }

    /**
     * <p>
     * Setter of setting field.
     * </p>
     * 
     * @param setting
     *            the setting to set
     */
    public void setSetting(RegEmailSetting setting) {
        this.setting = setting;
    }
    
    /**
     * <p>
     * Getter of userDTO field.
     * </p>
     *
     * @return the userDTO
     */
    public UserDTO getUserDTO() {
        return userDTO;
    }

    /**
     * <p>
     * Setter of userDTO field.
     * </p>
     * 
     * @param userDTO
     *            the userDTO to set
     */
    public void setUserDTO(UserDTO userDTO) {
        this.userDTO = userDTO;
    }
}
