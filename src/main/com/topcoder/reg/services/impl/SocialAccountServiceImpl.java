/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services.impl;

import com.topcoder.json.object.JSONArray;
import com.topcoder.json.object.JSONObject;
import com.topcoder.json.object.io.JSONDecodingException;
import com.topcoder.json.object.io.StandardJSONDecoder;
import com.topcoder.reg.Constants;
import com.topcoder.reg.dto.SocialAccount;
import com.topcoder.reg.services.PersistenceException;
import com.topcoder.reg.services.SocialAccountException;
import com.topcoder.reg.services.SocialAccountService;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.shared.util.logging.Logger;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

/**
 * This class provides an implementation for {@link SocialAccountService}.
 *
 * <p>
 *     Version 1.1 (BUGR-10169) changes:
 *     <ul>
 *         <li>Change on {@link #getProviderId(String)} add {@link #ENTERPRISE_LDAP_ID}</li>
 *         <li>Change on {@link #getSocialAccount(String)} to get enterprise login name and id</li>
 *     </ul>
 * </p>
 * 
 * <p>
 *     Version 1.2 (BUGR-10718) changes:
 *     <ul>
 *         <li>Change {@link #getSocialAccount(String)} to set the json web token on the social account/li>
 *         <li>Rename and change {@link #getAccessTokens(String)} to also retrieve the json web token</li>
 *     </ul>
 * </p>
 * <p>
 * <strong>Thread Safety:</strong> This class is mutable and not thread-safe.
 * </p>
 * 
 * @author ecnu_haozi, MonicaMuranyi
 * @version 1.2
 * @since 1.0 (Release Assembly - TopCoder Website Social Login)
 */
public class SocialAccountServiceImpl extends BaseImpl implements SocialAccountService {

    /**
     * Qualified name of this class.
     */
    private static final String CLASS_NAME = SocialAccountServiceImpl.class.getName();
	
	private static final Logger logger = Logger.getLogger(SocialAccountServiceImpl.class);

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
     * The LDAP id
     * @since 1.1
     */
    private static final int ENTERPRISE_LDAP_ID = 50;

    /**
     * Find the user id according to the social account email information.
     */
    private static final String SQL_GET_ID_BY_SOCIAL_ACCOUNT_EMAIL =
        "SELECT user_id FROM user_social_login WHERE social_login_provider_id = ? "
            + "AND social_email = ? AND social_email_verified = ?";

    /**
     * Find the user id according to the social account name information.
     */
    private static final String SQL_GET_ID_BY_SOCIAL_ACCOUNT_NAME =
        "SELECT user_id FROM user_social_login WHERE social_login_provider_id = ? " + "AND social_user_name = ? ";

    /**
     * Check if mapped social account exists by its email.
     */
    private static final String SQL_COUNT_SOCIAL_ACCOUNT_EMAIL =
        "SELECT COUNT(*) FROM user_social_login WHERE social_login_provider_id = ? "
            + "AND social_email = ? AND social_email_verified = ?";

    /**
     * Check if mapped social account exists by its name.
     */
    private static final String SQL_COUNT_SOCIAL_ACCOUNT_NAME =
        "SELECT COUNT(*) FROM user_social_login WHERE social_login_provider_id = ? " + "AND social_user_name = ? ";

    /**
     * Persist the social account, which also include the mapping with TC account by the field user_id.
     */
    private static final String SQL_INSERT_SOCIAL_ACCOUNT =
        "INSERT INTO user_social_login(social_user_id, user_id, social_login_provider_id, social_user_name, social_email, "
            + "social_email_verified) VALUES (?, ?, ?, ?, ?, ?)";

    /**
     * Find the user id according to the social user id..
     */
    private static final String SQL_GET_ID_BY_SOCIAL_USER_ID_AND_PROVIDER_ID =
            "SELECT user_id FROM user_social_login WHERE social_user_id = ? AND social_login_provider_id = ? ";

    /**
     * Check if mapped social account exists by social user id.
     */
    private static final String SQL_COUNT_SOCIAL_USER_ID_AND_PROVIDER_ID =
            "SELECT COUNT(*) FROM user_social_login WHERE social_user_id = ? AND social_login_provider_id = ? ";

    private static final String SQL_UPDATE_SOCIAL_USER_ID =
            "UPDATE user_social_login set social_user_id = ? WHERE user_id = ? ";

    /**
     * This field is used to send HTTP requests. It's injected by Spring.
     */
    @Autowired
    private RestTemplate restTemplate;

    /**
     * Find if there is a TC account mapping to the given social account. If true return the TC user account's user
     * id, otherwise return null.
     * 
     * @param socialAccount
     *            the given social account.
     * @return the mapped TC account's userId.
     * @throws PersistenceException
     *             if there is any database related error.
     * @throws SocialAccountException
     *             if other abnormal thing occurs.
     */
    @Transactional(readOnly = true)
    public Long findUserBySocialAccount(SocialAccount social) throws SocialAccountException, PersistenceException {
        final String signature = CLASS_NAME + "#findUserBySocialAccount(SocialAccount social)";
        logger.info(signature);

        try {
            Long userId = null;
            if (StringUtils.isNotEmpty(social.getSocialUserId())) {
                userId = queryUserId(SQL_COUNT_SOCIAL_USER_ID_AND_PROVIDER_ID,
                        SQL_GET_ID_BY_SOCIAL_USER_ID_AND_PROVIDER_ID,
                        social.getSocialUserId(), social.getProviderId());
            }

            if (userId == null) {
                if (!social.getEmail().equals("")) {
                    userId =
                            queryUserId(SQL_COUNT_SOCIAL_ACCOUNT_EMAIL, SQL_GET_ID_BY_SOCIAL_ACCOUNT_EMAIL,
                                    social.getProviderId(), social.getEmail(), social.isEmailVerified());
                } else if (!social.getName().equals("")) {
                    userId =
                            queryUserId(SQL_COUNT_SOCIAL_ACCOUNT_NAME, SQL_GET_ID_BY_SOCIAL_ACCOUNT_NAME,
                                    social.getProviderId(), social.getName());
                } else {
                    throw new SocialAccountException(
                            "The social account should have at least one valid email or one valid username.");
                }

                if (userId != null) {
                    setSocialUserIdForUser(userId, social);
                }
            }

            //LoggingWrapperUtility.logExit(logger, signature, new Object[] {userId});
            return userId;
        } catch (DataAccessException e) {
            // the exception is logged by caller.
            throw new PersistenceException("Error while query social account", e);
        }

    }

    /**
     * The template to query user id by the social account information.
     * 
     * @param countSql
     *            the count sql statement.
     * @param retrieveSql
     *            the retrieve sql statement.
     * @param args
     *            the social account information arguments.
     * @return the result user id.
     * @throws DataAccessException
     *             if the query fails
     * @throws IncorrectResultSizeDataAccessException
     *             if the query does not return exactly one row, or does not return exactly one column in that row
     */
    private Long queryUserId(String countSql, String retrieveSql, Object... args) throws DataAccessException {
        Long userId;
        int count = jdbcTemplate.queryForInt(countSql, args);
        if (count == 0) {
            userId = null;
        } else {
            userId = jdbcTemplate.queryForObject(retrieveSql, Long.class, args);
        }
        return userId;
    }

    /**
     * Bind the TC account, which is identified by its user id, with the social account.
     * 
     * @param userId
     *            the TC account's identity.
     * @param socialAccount
     *            the social account to persist.
     * @throws PersistenceException
     *             if there is any database related error.
     */
    @Transactional(rollbackFor = PersistenceException.class, propagation = Propagation.REQUIRED)
    public void bindUserWithSocialAccount(long userId, SocialAccount socialAccount) throws PersistenceException {
        final String signature = CLASS_NAME + "#bindUserWithSocialAccount(long userId, SocialAccount socialAccount)";
        logger.info(signature);

        try {
            jdbcTemplate.update(SQL_INSERT_SOCIAL_ACCOUNT, socialAccount.getSocialUserId(), userId, socialAccount.getProviderId(),
                socialAccount.getName(), socialAccount.getEmail(), socialAccount.isEmailVerified());
            //LoggingWrapperUtility.logExit(logger, signature, null);
        } catch (DataAccessException e) {
            // the exception is logged by caller.
            throw new PersistenceException("Error while insert social account", e);
        }
    }

    @Transactional(rollbackFor = PersistenceException.class, propagation = Propagation.REQUIRED)
    public void setSocialUserIdForUser(long userId, SocialAccount socialAccount) throws PersistenceException {
        final String signature = CLASS_NAME + "#setSocialUserIdForUser(long userId, SocialAccount socialAccount)";
        logger.info(signature);

        try {
            jdbcTemplate.update(SQL_UPDATE_SOCIAL_USER_ID, socialAccount.getSocialUserId(), userId);
            //LoggingWrapperUtility.logExit(logger, signature, null);
        } catch (DataAccessException e) {
            // the exception is logged by caller.
            throw new PersistenceException("Error while insert social account", e);
        }
    }

    /**
     * Get the soical account information according to the authorization code given by Auth0.
     * 
     * @param code
     *            the authorization code given by Auth0
     * @return the social account.
     * @throws PersistenceException
     *             if there is any database related error.
     * @throws SocialAccountException
     *             if other abnormal thing occurs.
     */
    public SocialAccount getSocialAccount(String code) throws SocialAccountException, PersistenceException {
        final String signature = CLASS_NAME + "#getSocialAccount(String code)";
        logger.info(signature);

        SocialAccount social = new SocialAccount();
        String[] accessTokens = getAccessTokens(code);
        String accessToken = accessTokens[0];  
        System.out.println("---------accessToken-------"+accessToken);
        social.setJsonWebToken(accessTokens[1]);
        String jsonString;
        try {
            jsonString =
                restTemplate.getForObject("https://" + Constants.DOMAIN_AUTH0 + "/userinfo?access_token="
                    + accessToken, String.class);
        } catch (RestClientException e) { 
            throw new SocialAccountException("Fail to obtain current social account info from Auth0.", e);
        }
        JSONObject rootNode = getJsonNode(jsonString);

        JSONArray identities = rootNode.getArray("identities");
        if (identities.getSize() > 0) {
            JSONObject identity = identities.getJSONObject(0);
            if (identity.isKeyDefined("user_id")) {
                social.setSocialUserId(identity.getObject("user_id").toString());
            }
        }

        social.setProviderId(getProviderId(rootNode.getString("user_id")));

        // try to find an unique name if available.
        switch (social.getProviderId()) {
        case TWITTER_PROVIDER_ID:
            social.setName(rootNode.getString("screen_name"));
            break;
        case GITHUB_PROVIDER_ID:
            social.setName(rootNode.getString("nickname"));
            break;
        //You can add unique user name for other social provider if needed here.
        case ENTERPRISE_LDAP_ID:
            social.setName(rootNode.getString("nickname"));
            social.setEnterpriseLogin(true);
            break;
        default:
            social.setName("");
        }

        // Field email will be absent in Twitter case, in which the screen_name is used instead.
        // The other cases all have email fields.
        if (rootNode.isKeyDefined("email") && rootNode.isAvailableAsString("email")) {
            social.setEmail(rootNode.getString("email"));
        } else {
            social.setEmail("");
        }

        // email_verified can be absent in Twitter case.
        if (rootNode.isKeyDefined("email_verified") && rootNode.isAvailableAsBoolean("email_verified")) {
            social.setEmailVerified(rootNode.getBoolean("email_verified"));
        } else {
            social.setEmailVerified(false);
        }

        // family_name can be absent in Github case.
        if (rootNode.isKeyDefined("family_name") && rootNode.isAvailableAsString("family_name")) {
            social.setFamilyName(rootNode.getString("family_name"));
        } else {
            social.setFamilyName("");
        }

        // given_name can be absent in Github case.
        if (rootNode.isKeyDefined("given_name") && rootNode.isAvailableAsString("given_name")) {
            social.setGivenName(rootNode.getString("given_name"));
        } else {
            social.setGivenName("");
        }

        //LoggingWrapperUtility.logExit(logger, signature, new Object[] {social});
        return social;
    }

    /**
     * <p>
     * Getting the Access Token and Json Web Token.
     * </p>
     * 
     * @param code
     *            the authorization code from Auth0, which is disposable.
     * @return the access token from Auth0.
     * @throws SocialAccountException
     *             if failed to obtain the access token.
     */
    private String[] getAccessTokens(String code) throws SocialAccountException {
        MultiValueMap<String, Object> parts = new LinkedMultiValueMap<String, Object>();

        parts.add("client_id", Constants.CLIENT_ID_AUTH0);
        parts.add("client_secret", Constants.CLIENT_SECRET_AUTH0);
        parts.add("redirect_uri", "https://" + ApplicationServer.SERVER_NAME + Constants.REDIRECT_URL_AUTH0);
        parts.add("grant_type", "authorization_code");
        parts.add("code", code);
        parts.add("scope", "openid");

        String jsonString;
        try {
            jsonString =
                restTemplate.postForObject("https://" + Constants.DOMAIN_AUTH0 + "/oauth/token", parts, String.class);
        } catch (RestClientException e) {
            throw new SocialAccountException(
                "Fail to obtain access token according the given authorization code from Auth0.", e);
        }

        JSONObject rootNode = getJsonNode(jsonString);
        return new String[]{rootNode.getString("access_token"), rootNode.getJSONString("id_token")};
    }

    /**
     * Convert the json string into <code>JSONObject</code>.
     * 
     * @param jsonString
     *            the json string.
     * @return the <code>JSONObject</code>
     * @throws SocialAccountException
     *             if the parameter can not be parsed as a json string.
     */
    private JSONObject getJsonNode(String jsonString) throws SocialAccountException {
        JSONObject rootNode;
        try {
            rootNode = new StandardJSONDecoder().decodeObject(jsonString);
        } catch (JSONDecodingException e) {
            throw new SocialAccountException("Fail to parse " + jsonString + " into json string", e);
        }
        return rootNode;
    }

    /**
     * retrieve provider information from the userId string.
     * 
     * @param userId
     *            the userId provided by Auth0.
     * @return the social account provider id.
     * @throws SocialAccountException
     *             if the provider id is unknown.
     */
    private int getProviderId(String userId) throws SocialAccountException {
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
        if (userId.startsWith("ad")) {
            return ENTERPRISE_LDAP_ID;
        }
        throw new SocialAccountException("The provider id is unknown.");
    }

    /**
     * <p>
     * The setter method for field restTemplate.
     * </p>
     * 
     * @param restTemplate
     *            the restTemplate to set
     */
    public void setRestTemplate(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

}
