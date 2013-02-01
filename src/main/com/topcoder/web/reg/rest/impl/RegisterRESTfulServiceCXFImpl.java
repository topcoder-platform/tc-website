/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.rest.impl;

import java.util.Map;
import javax.ws.rs.OPTIONS;
import javax.ws.rs.POST;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import javax.ws.rs.core.Response.Status;

import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.HibernateUtils;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.WebConstants;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.reg.RegEmailSetting;
import com.topcoder.web.reg.RegHelper;
import com.topcoder.web.reg.UserDTO;
import com.topcoder.web.reg.rest.RegisterRESTfulService;

/**
 * <p>
 * This class provides an implementation taking advantage of CXF framework. For
 * specific REST exposed APIs, see the {@link RegisterRESTfulService} interface.
 * For the validation logics, see the {@link UserDTO} class.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> This implementation is thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public class RegisterRESTfulServiceCXFImpl implements RegisterRESTfulService {

    /**
     * Represents the logger.
     */
    protected static final Logger LOGGER = Logger.getLogger(RegisterRESTfulServiceCXFImpl.class);

    /**
     * This field represents the qualified name of this class.
     */
    private static final String CLASS_NAME = RegisterRESTfulServiceCXFImpl.class.getName();

    /**
     * Represents register source.
     */
    private static final String REGISTER_SOURCE_NAME = "reg2";

    /**
     * Default access control age in seconds.
     */
    private static final int DEFAULT_ACCESS_CONTROL_AGE = 1728000;

    /**
     * Registration email settings.
     */
    private RegEmailSetting setting;

    /**
     * This method will be used to handle POST request to ${context}/account.
     * 
     * @param user
     *            New account to register.
     * @return Instance of {@link Response}, containing JSON data.
     */
    @POST
    @Produces(MediaType.APPLICATION_JSON)
    public Response register(UserDTO userDTO) {
        final String signature = CLASS_NAME + "#register(UserDTO)";
        System.out.println("Entering " + signature + " with parameter userDTO: " + userDTO);
        LOGGER.info("Entering " + signature + " with parameter userDTO: " + userDTO);
        LOGGER.debug("Entering " + signature + " with parameter userDTO: " + userDTO);
        try {
            // begin transaction.
            HibernateUtils.begin();
            Map<String, String> errors = RegHelper.validate(userDTO);
            if (errors.isEmpty()) {
                UserDAO userDAO = DAOUtil.getFactory().getUserDAO();
                User user = RegHelper.populateUser(userDTO);
                try {
                    userDAO.saveOrUpdate(user);
                    String activationCode = StringUtils.getActivationCode(user.getId().longValue());
                    userDTO.setActivationURL(ApplicationServer.SERVER_NAME + "/reg2/activate.action?"
                            + WebConstants.ACTIVATION_CODE + "=" + activationCode);
                    RegHelper.addSecurityStuff(user);
                    // send activation mail
                    RegHelper.sendActivationEmail(setting.getActivationEmailSubject(), activationCode, setting
                            .getActivationEmailBodyTemplateFile(), userDTO.getEmail(), setting
                            .getActivationEmailFromAddress());
                    user.setActivationCode(activationCode);
                    user.setRegSource(REGISTER_SOURCE_NAME);
                    userDAO.saveOrUpdate(user);
                } catch (Exception e) {
                    if (null != user) {
                        try {
                            RegHelper.revertSecurityStuff(user, e);
                        } catch (Exception ex) {
                            errors.put("security_error", ex.getMessage());
                        }
                    }
                    errors.put("general", e.getMessage());
                    return Response.status(Status.BAD_REQUEST).entity(errors).build();
                }
            } else {
                return Response.status(Status.BAD_REQUEST).entity(errors).build();
            }

        } finally {
            // commit transaction.
            HibernateUtils.getSession().flush();
            HibernateUtils.commit();
            HibernateUtils.closeSession();
        }
        return Response.ok(userDTO).build();
    }

    /**
     * This method is to handle the brower's pre-flight operation before POST.
     * See https://developer.mozilla.org/en-US/docs/HTTP_access_control for
     * more.
     * 
     * @return {@link Response} instance, allowing cross site requesting.
     */
    @OPTIONS
    public Response preflight() {
        return Response.ok().header("Access-Control-Allow-Origin", "*").header("Access-Control-Allow-Methods",
                "POST, GET, OPTIONS").header("Access-Control-Allow-Headers", "Content-Type").header(
                "Access-Control-Max-Age", String.valueOf(DEFAULT_ACCESS_CONTROL_AGE)).build();
    }

    /**
     * <p>
     * Getter of setting field.
     * </p>
     * 
     * @return the setting
     */
    public RegEmailSetting getSetting() {
        return setting;
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
}
