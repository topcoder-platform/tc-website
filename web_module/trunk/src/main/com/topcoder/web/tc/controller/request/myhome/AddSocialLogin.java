/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.myhome;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.JSONDecodingException;
import com.topcoder.json.object.io.StandardJSONDecoder;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.NavigationException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserSocialLoginDAO;
import com.topcoder.web.common.model.UserSocialLogin;
import com.topcoder.web.tc.Constants;
import org.apache.commons.lang.StringUtils;
import org.apache.cxf.jaxrs.client.WebClient;
import org.apache.cxf.jaxrs.ext.form.Form;

/**
 * <p>
 * Add social login account to user.
 * </p>
 *
 * <p>
 * Thread safety: The controller instances will be created for the new requests, thus there won't be multiple
 * threads using the same controller instance.Thus there's no thread-safety concern.
 * </p>
 *
 * <p>
 *   Version 1.0 (Release Assembly - Social Login Linking for Existing User) Change notes:
 *   <ol>
 *      <li>The first version of this processor.</li>
 *   </ol>
 * </p>
 *
 * @author tangzx
 * @version 1.0
 */
public class AddSocialLogin extends ShortHibernateProcessor {
    /**
     * The class name.
     */
    private final static String CLASS_NAME = AddSocialLogin.class.getName();

    /**
     * The code parameter name.
     */
    private final static String CODE_PARAM = "code";

    /**
     * The user info path.
     */
    private final static String USER_INFO_PATH = "/userinfo";

    /**
     * The token path.
     */
    private final static String TOKEN_PATH = "/oauth/token";

    /**
     * The facebook id.
     */
    private static final int FACEBOOK_PROVIDER_ID = 1;

    /**
     * The google id.
     */
    private static final int GOOGLE_PROVIDER_ID = 2;

    /**
     * The twitter id.
     */
    private static final int TWITTER_PROVIDER_ID = 3;

    /**
     * The github id.
     */
    private static final int GITHUB_PROVIDER_ID = 4;

    /**
     * The salesforce id.
     */
    private static final int SALESFORCE_PROVIDER_ID = 5;

    /**
     * The web client.
     */
    private WebClient client = WebClient.create("https://" + Constants.DOMAIN_AUTH0);

    /**
     * The process method. Add social account here.
     *
     * @throws PermissionException if user is not identified.
     * @throws NavigationException if error occurs
     */
    protected void dbProcessing() throws PermissionException, NavigationException {
        log.debug("Enter method " + CLASS_NAME + "#dbProcessing().");

        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        UserSocialLoginDAO userSocialLoginDAO = DAOUtil.getFactory().getUserSocialLoginDAO();

        // check whether user has already been associated with social account.
        if (!userSocialLoginDAO.findByUserId(getUser().getId()).isEmpty()) {
            throw new NavigationException("The user is already associated with social account.");
        }

        String code = getRequest().getParameter(CODE_PARAM);
        if (StringUtils.isNotEmpty(code)) {
            String accessToken = getAccessToken(code);
            String jsonString = client.reset().path(USER_INFO_PATH).query("access_token", accessToken).get(String.class);

            log.debug("retrieved json string:");
            log.debug(jsonString);

            JSONObject rootNode = getJsonNode(jsonString);

            UserSocialLogin socialLogin = new UserSocialLogin();

            socialLogin.setId(new UserSocialLogin.Identifier());
            socialLogin.getId().setUserId(getUser().getId());
            socialLogin.getId().setSocialLoginProviderId(getProviderId(rootNode.getString("user_id")));

            // note we're using nickname here according to docs:
            // nickname: User name (if available, might not be unique across identity providers).
            // for twitter, we're using screen_name.
            switch ((int) socialLogin.getId().getSocialLoginProviderId()) {
                case TWITTER_PROVIDER_ID:
                    socialLogin.setSocialUserName((String) getFieldValue(rootNode, "screen_name", ""));
                    break;
                default:
                    socialLogin.setSocialUserName((String) getFieldValue(rootNode, "nickname", ""));
            }

            socialLogin.setSocialEmail((String) getFieldValue(rootNode, "email", ""));
            socialLogin.setSocialEmailVerified((Boolean) getFieldValue(rootNode, "email_verified", false));

            JSONArray identities = rootNode.getArray("identities");
            if (identities.getSize() > 0) {
                JSONObject identity = identities.getJSONObject(0);

                if (identity.isKeyDefined("user_id")) {
                    socialLogin.setSocialUserId(identity.getObject("user_id").toString());
                }
            }

            // we should check whether this social login is associated with someone else.
            // but we can't make sure user name is unique across identity providers for now.
            boolean alreadyAssociated = false;
            if (StringUtils.isNotEmpty(socialLogin.getSocialUserId())) {
                alreadyAssociated = userSocialLoginDAO.findByProviderIdAndSocialUserId(
                        socialLogin.getId().getSocialLoginProviderId(), socialLogin.getSocialUserId()) != null;
            }
            // if can't find by social user id, still check by username/email.
            if (!alreadyAssociated) {
                if (socialLogin.getId().getSocialLoginProviderId() == TWITTER_PROVIDER_ID) {
                    if (StringUtils.isNotEmpty(socialLogin.getSocialUserName())) {
                        alreadyAssociated =
                            userSocialLoginDAO.findByProviderIdAndName(TWITTER_PROVIDER_ID, socialLogin.getSocialUserName()) != null;
                    }
                } else {
                    if (StringUtils.isNotEmpty(socialLogin.getSocialEmail())) {
                        alreadyAssociated =
                            userSocialLoginDAO.findByProviderIdAndVerifiedEmail(socialLogin.getId().getSocialLoginProviderId(), socialLogin.getSocialEmail()) != null;
                    }
                }
            }
            if (alreadyAssociated) {
                throw new NavigationException("The social account is already associated with someone else.", "/tc?module=MyHome");
            }
            userSocialLoginDAO.saveOrUpdate(socialLogin);
        }
        setNextPage("/tc?module=MyHome");

        log.debug("Leave method " + CLASS_NAME + "#dbProcessing().");
    }

    /**
     * Get field value, return default value if it does not exist.
     *
     * @param object       the json object
     * @param key          the key
     * @param defaultValue the default value
     *
     * @return retrieved value
     */
    private Object getFieldValue(JSONObject object, String key, Object defaultValue) {
        if (object.isKeyDefined(key)) {
            if (defaultValue instanceof Boolean) {
                if (object.isAvailableAsBoolean(key)) {
                    return object.getBoolean(key);
                }
            } else if (defaultValue instanceof String) {
                if (object.isAvailableAsString(key)) {
                    return object.getString(key);
                }
            }
        }

        return defaultValue;
    }

    /**
     * <p>
     * Getting the Access Token.
     * </p>
     *
     * @param code the authorization code from Auth0, which is disposable.
     *
     * @return the access token from Auth0.
     * @throws NavigationException if error occurs while get token.
     */
    private String getAccessToken(String code) throws NavigationException {
        Form form = new Form();

        form.set("client_id", Constants.CLIENT_ID_AUTH0);
        form.set("client_secret", Constants.CLIENT_SECRET_AUTH0);
        form.set("redirect_uri", "https://" + ApplicationServer.SERVER_NAME + Constants.BIND_CALLBACK_URL_AUTH0);
        form.set("grant_type", "authorization_code");
        form.set("code", code);

        String jsonString = client.reset().path(TOKEN_PATH).post(form, String.class);
        JSONObject rootNode = getJsonNode(jsonString);
        return rootNode.getString("access_token");
    }

    /**
     * Convert the json string into <code>JSONObject</code>.
     *
     * @param jsonString the json string.
     *
     * @return the <code>JSONObject</code>
     * @throws NavigationException if the parameter can not be parsed as a json string.
     */
    private JSONObject getJsonNode(String jsonString) throws NavigationException {
        JSONObject rootNode;
        try {
            rootNode = new StandardJSONDecoder().decodeObject(jsonString);
        } catch (JSONDecodingException e) {
            throw new NavigationException("Fail to parse json string", e);
        }
        return rootNode;
    }

    /**
     * retrieve provider information from the userId string.
     *
     * @param userId the userId provided by Auth0.
     *
     * @return the social account provider id.
     * @throws NavigationException if the provider id is unknown.
     */
    private int getProviderId(String userId) throws NavigationException {
        if (userId.startsWith("facebook")) {
            return FACEBOOK_PROVIDER_ID;
        }
        if (userId.startsWith("google")) {
            return GOOGLE_PROVIDER_ID;
        }
        if (userId.startsWith("twitter")) {
            return TWITTER_PROVIDER_ID;
        }
        if (userId.startsWith("github")) {
            return GITHUB_PROVIDER_ID;
        }
        if (userId.startsWith("salesforce")) {
            return SALESFORCE_PROVIDER_ID;
        }
        throw new NavigationException("The provider id is unknown.");
    }
}
