/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.portal;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.StringReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.Date;

import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;

import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.shared.util.logging.Logger;

/**
 * <p>
 * This is a 3scale portal accessor.
 * </p>
 *
 * <p>
 * Class is immutable and thread-safe.
 * </p>
 *
 * @author gevak
 * @version 1.0
 */
public class Access3scale {

    /**
     * Amount of attempts for activate user request.
     */
    private static final int ACTIVATE_USER_ATTEMPTS_AMOUNT = 5;

    /**
     * Logger.
     */
    protected static final Logger log = Logger.getLogger(Access3scale.class);

    /**
     * Portal URL pattern.
     */
    private static final String PORTAL_URL_PATTERN = "https://%s.3scale.net";

    /**
     * Amin portal URL pattern.
     */
    private static final String ADMIN_PORTAL_URL_PATTERN = "https://%s-admin.3scale.net";

    /**
     * Gets that the 3scale response content.
     * It will log the response details.
     *
     * @param connection Connection with 3scale.
     * @return Response content.
     */
    private static String getConnectionResponse(HttpURLConnection connection) {
        try {
            log.info("3scale response code = " + connection.getResponseCode());
        } catch (Exception ex) {
            log.error(ex);
        }
        try {
            log.info("3scale response message = " + connection.getResponseMessage());
        } catch (Exception ex) {
            log.error(ex);
        }
        String response = null;
        try {
            String successResponse = streamToString(connection.getInputStream());
            log.info("3scale response success content = " + successResponse);
            response = successResponse;
        } catch (Exception ex) {
            log.error(ex);
        }
        try {
            String errorResponse = streamToString(connection.getErrorStream());
            log.info("3scale response error content = " + errorResponse);
            if (response == null) {
                response = errorResponse;
            }
        } catch (Exception ex) {
            log.error(ex);
        }
        return response;
    }

    /**
     * Gets content of the stream as a string.
     *
     * @param stream Stream.
     * @return String containing the content of the given stream.
     * @throws IOException if any I/O error occurs.
     */
    private static String streamToString (InputStream stream) throws IOException {
        BufferedReader reader = new BufferedReader(new InputStreamReader(stream));
        String line;
        String result = "";
        while ((line = reader.readLine()) != null) {
            result += line + "\n";
        }
        return result;
    }


    /**
     * <p>
     * Portal name.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String portalName;

    /**
     * <p>
     * Provider key.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String providerKey;

    /**
     * <p>
     * Portal URL.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String portalUrl;

    /**
     * <p>
     * Admin portal URL.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String adminPortalUrl;

    /**
     * <p>
     * Optional attribute, used to set access code when accessing private 3scale portal URL.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String accessCode;

    /**
     * <p>
     * Required attribute, the account ID used to create members in 3scale portal.
     * </p>
     *
     * <p>
     * Initialized in constructor and never changed afterwards. Not null/empty.
     * </p>
     */
    private final String accountId;

    /**
     * Gets portal name.
     *
     * @return Portal name.
     */
    public String getPortalName() {
        return portalName;
    }

    /**
     * Gets admin portal name.
     *
     * @return Admin portal name.
     */
    public String getAdminPortalUrl() {
        return adminPortalUrl;
    }

    /**
     * Gets portal URL.
     *
     * @return Portal URL.
     */
    public String getPortalUrl() {
        return portalUrl;
    }

    /**
     * Gets portal name.
     *
     * @return Portal name.
     */
    public String getAccessCode() {
        return accessCode;
    }

    /**
     * Gets account id.
     *
     * @return account id.
     */
    public String getAccountId() {
        return accountId;
    }

    /**
     * Creates and configures instance.
     *
     * @param config Configuration.
     * @throws Exception If any error occurs with configuration.
     */
    public Access3scale(ConfigurationObject config) throws Exception {
        this.portalName = (String) config.getPropertyValue("portalName");
        this.providerKey = (String) config.getPropertyValue("providerKey");
        this.accessCode = (String) config.getPropertyValue("accessCode");
        this.portalUrl = String.format(PORTAL_URL_PATTERN, getPortalName());
        this.accountId = (String) config.getPropertyValue("accountId");
        this.adminPortalUrl = String.format(ADMIN_PORTAL_URL_PATTERN, getPortalName());
    }

    /**
     * Creates and acitvates user in 3scale portal.
     *
     * @param username User name.
     * @param password User password.
     * @param email User e-mail.
     * @throws Exception if any error occurs.
     */
    public void createUser(String username, String password, String email) throws Exception {
        log.info("Enter createUser(" + username + ", ...)");

        // Send request and get response.
        URL url = new URL(adminPortalUrl + "/admin/api/accounts/" + accountId + "/users.xml");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        OutputStreamWriter writer = null;
        String response = null;
        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            writer = new OutputStreamWriter(connection.getOutputStream());
            writer.write("provider_key=" + URLEncoder.encode(providerKey, "UTF-8"));
            writer.write("&username=" + URLEncoder.encode(username, "UTF-8"));
            writer.write("&password=" + URLEncoder.encode(password, "UTF-8"));
            writer.write("&email=" + URLEncoder.encode(email, "UTF-8"));
            writer.close();
            connection.connect();
            response = getConnectionResponse(connection);
        } finally {
            try {
                writer.close();
            } catch (Exception ex) { }
            connection.disconnect();
        }

        // Parse response.
        InputSource responseSource = new InputSource();
        responseSource.setCharacterStream(new StringReader(response));
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(responseSource);
        String userId = ((Element) (doc.getElementsByTagName("user").item(0))).
                getElementsByTagName("id").item(0).getTextContent();
        log.info("userId = " + userId);

        // Activate user.
        activateUser(userId);

        log.info("Exit createUser(" + username + ", ...)");
    }

    /**
     * Generates SSO token for user.
     *
     * @param username User name.
     * @return SSO token.
     *
     * @throws UserNotFoundException if specified user doesn't exist in the portal.
     * @throws Exception if any error occurs.
     */
    public SSOToken generateToken(String username) throws Exception {
        log.info("Enter generateToken(" + username + ")");

        // Send request and get response.
        URL url = new URL(adminPortalUrl + "/admin/api/sso_tokens.xml");
        HttpURLConnection connection = (HttpURLConnection) url.openConnection();
        OutputStreamWriter writer = null;
        String response = null;
        try {
            connection.setDoOutput(true);
            connection.setRequestMethod("POST");
            writer = new OutputStreamWriter(connection.getOutputStream());
            writer.write("provider_key=" + URLEncoder.encode(providerKey, "UTF-8"));
            writer.write("&username=" + URLEncoder.encode(username, "UTF-8"));
            writer.close();
            connection.connect();
            response = getConnectionResponse(connection);
        } finally {
            try {
                writer.close();
            } catch (Exception ex) { }
            connection.disconnect();
        }

        // Parse response.
        InputSource responseSource = new InputSource();
        responseSource.setCharacterStream(new StringReader(response));
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(responseSource);
        if (connection.getResponseCode() != HttpURLConnection.HTTP_OK
                && connection.getResponseCode() != HttpURLConnection.HTTP_CREATED) {
            // Check if user exists.
            NodeList errorNodeList = doc.getElementsByTagName("errors");
            if (errorNodeList.getLength() > 0) {
                String errorMessage = ((Element) errorNodeList.item(0)).
                        getElementsByTagName("error").item(0).getTextContent();
                if (errorMessage.equalsIgnoreCase("Username is invalid")) {
                    throw new UserNotFoundException("User not found.");
                }
            }
            throw new Exception("Error response from 3scale. " + connection.getResponseCode()
                    + " " + connection.getResponseMessage());
        }
        String ssoUrl = doc.getElementsByTagName("sso_url").item(0).getTextContent();
        // append access code
        if(accessCode != null) {
           log.info("append access code.");
           ssoUrl  +=  "&access_code=" + URLEncoder.encode(accessCode, "UTF-8");
        }
        log.info("ssoUrl = " + ssoUrl);
        int expiresAtBeginIndex = ssoUrl.indexOf("expires_at=") + "expires_at=".length();
        int expiresAtEndIndex = ssoUrl.indexOf("&", expiresAtBeginIndex);
        if (expiresAtEndIndex < 0) expiresAtEndIndex = ssoUrl.length();
        Date expiresAt = new Date(1000 * Long.parseLong(ssoUrl.substring(expiresAtBeginIndex, expiresAtEndIndex)));
        log.info("expiresAt = " + expiresAt.toString());

        // Construct and return SSO token.
        SSOToken ssoToken = new SSOToken();
        ssoToken.setExpiresAt(expiresAt);
        ssoToken.setUrl(ssoUrl);
        log.info("Exit generateToken(" + username + ")");
        return ssoToken;
    }

    /**
     * Activates portal user.
     *
     * @param userId User ID.
     * @throws Exception if any error occurs.
     */
    private void activateUser(String userId) throws Exception {
        log.info("Enter activateUser(" + userId + ")");

        // Make request. 404 error is expected, so keep trying (fixed amount of attempts) until 200 or other error.
        URL url = new URL(adminPortalUrl + "/admin/api/users/" + URLEncoder.encode(userId, "UTF-8") + "/activate.xml");
        boolean success = false;
        for (int attempsRemaining = ACTIVATE_USER_ATTEMPTS_AMOUNT; attempsRemaining > 0 && !success; attempsRemaining--) {
            HttpURLConnection connection = (HttpURLConnection) url.openConnection();
            OutputStreamWriter writer = null;
            try {
                connection.setDoOutput(true);
                connection.setRequestMethod("PUT");
                connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
                writer = new OutputStreamWriter(connection.getOutputStream());
                writer.write("provider_key=" + URLEncoder.encode(providerKey, "UTF-8"));
                writer.close();
                connection.connect();
                if (connection.getResponseCode() != HttpURLConnection.HTTP_OK
                        && connection.getResponseCode() != HttpURLConnection.HTTP_NOT_FOUND) {
                    throw new Exception("Activate user request failure. Response code " + connection.getResponseCode());
                }
                if (connection.getResponseCode() == HttpURLConnection.HTTP_OK) {
                    success = true;
                }
            } finally {
                try {
                    writer.close();
                } catch (Exception ex) { }
                if (success || attempsRemaining == 0) {
                    connection.disconnect();
                }
            }
        }
        if (!success) {
            throw new Exception("Activate user request failure. Ran out of attempts.");
        }

        log.info("Exit activateUser(" + userId + ")");
    }

}
