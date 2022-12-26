/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.shared.util.logging.Logger;
import org.apache.commons.codec.binary.Base64;
import java.nio.charset.StandardCharsets;
import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;
import org.apache.commons.io.IOUtils;
import javax.net.ssl.HttpsURLConnection;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.util.*;



/**
 * <p>
 * This class provides convenient static methods for calling the Payoneer API.
 * </p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayoneerService {

    private static final String DEFAULT_PAYONEER_NAMESPACE = "com.topcoder.web.tc.controller.PayoneerService";

    private static Logger log = Logger.getLogger(PayoneerService.class);

    /**
    * <p>
    * Constructs new <code>PayoneerService</code> instance. This implementation
    * does nothing.
    * </p>
    */
    private PayoneerService() {
    }

    private static final String PAYOUT_DESCRIPTION = "Topcoder Payment";
    private static final String PAYOUT_CURRENCY = "USD";
    private static final String DEFAULT_ENCODING = System.getProperty("file.encoding");
    private static final long EXPIRY_CHECK_DELTA = 3600 * 1000;

    private static PayoneerConfig config = null;
    private static String authTokenHeader = null;
    private static Date expiresAt = null;

    /**
     * <p>
     * Represents all possible statuses a member can have with respect to
     * registering with Payoneer.
     * </p>
     */
    public enum PayeeStatus {ACTIVATED, REGISTERED, NOT_REGISTERED}

    /**
     * <p>
     * Returns status of the specified member in the Payoneer system.
     * </p>
     *
     * @param payeeId Payee ID.
     * @return ACTIVATED for activated status, REGISTERED if the payee has
     *         registered but hasn't activated yet and NOT_REGISTERED otherwise.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static PayeeStatus getPayeeStatus(long payeeId) throws PayoneerServiceException {
        log.info("Get Payee Status: " + payeeId);

        final Map<String, String> headers = getAuthHeader();
        final String requestUrl = config.baseApiUrl + "/programs/" + config.partnerId + "/payees/" + payeeId + "/status";

        try {
            HttpsRequest.RequestResponse httpResponse = HttpsRequest.send(HttpsRequest.RequestType.GET, requestUrl, headers, null, false);

            if (httpResponse.HttpsRequest == HttpsRequest.HTTP_NOT_FOUND) {
                return PayeeStatus.NOT_REGISTERED;
            }

            if (httpResponse.httpStatusCode != HttpsRequest.HTTP_OK) {
                throw new PayoneerServiceException(httpResponse.response.toString());
            }

            if (httpResponse.response.has("result")) {
                JSONObject result = httpResponse.response.getJSONObject("result");

                if (!result.has("status")) throw new PayoneerServiceException("Unexpected response encountered while parsing response from Payoneer.");

                JSONObject status = result.getJSONObject("status");
                final int type = status.getInt("type");

                switch (type) {
                    case 1: return PayeeStatus.ACTIVATED;
                    case 0: return PayeeStatus.REGISTERED;
                    default: return PayeeStatus.NOT_REGISTERED;
                }
            } else throw new PayoneerServiceException("Unexpected response encountered while parsing response from Payoneer.");
        } catch (Exception e) {
            log.error("Failed to get payee status for payeeId: " + payeeId);
            e.printStackTrace();
            throw new PayoneerServiceException("Unable to get Payee Status for payee " + payeeId, e);
        }
    }

    /**
     * <p>
     * Returns the balance on the TopCoder's Payoneer account.
     * </p>
     *
     * @return The balance amount.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static double getBalanceAmount() throws PayoneerServiceException {
        log.info("Getting balance amount");

        final Map<String, String> headers = getAuthHeader();
        final String requestUrl = config.baseApiUrl + "/programs/" + config.partnerId + "/balance";

        try {
            HttpsRequest.RequestResponse httpResponse = HttpsRequest.send(HttpsRequest.RequestType.GET, requestUrl, headers, null, false);

            if (httpResponse.httpStatusCode != HttpsRequest.HTTP_OK) {
                throw new PayoneerServiceException(httpResponse.response.toString());
            }

            if (httpResponse.response.has("result")) {
                JSONObject result = httpResponse.response.getJSONObject("result");

                if (!result.has("balance")) throw new PayoneerServiceException("Unexpected response encountered while parsing response from Payoneer.");
                return result.getDouble("balance");
            } else throw new PayoneerServiceException("Unexpected response encountered while parsing response from Payoneer.");
        } catch (Exception e) {
            e.printStackTrace();
            throw new PayoneerServiceException("Unable to query balance.", e);
        }
    }

    /**
     * <p>
     * Creates payment of the specified amount for the specified payee in Payoneer.
     * </p>
     *
     * @param internalPaymentId The ID that this payment will be associated with in
     *                          the Payoneer system. Should be unique.
     * @param payeeId           Payoneer payee ID. Corresponds to the TopCoder user
     *                          ID.
     * @param amount            The amount to be paid.
     * @return Payment ID in the Payoneer system.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static long createPayment(long internalPaymentId, long payeeId, double amount) throws PayoneerServiceException {
        log.info("Create payment. internalPaymentId = " + internalPaymentId + "; payeeId: " + payeeId + "; amount: " + amount);
        final Map<String, String> headers = getAuthHeader();
        final String requestUrl = config.baseApiUrl + "/programs/" + config.partnerId + "/masspayouts";

        final Map<String, String> payment = new HashMap();
        payment.put("client_reference_id", String.valueOf(internalPaymentId));
        payment.put("payee_id", String.valueOf(payeeId));
        payment.put("description", PAYOUT_DESCRIPTION);
        payment.put("currency", PAYOUT_CURRENCY);
        payment.put("amount", String.valueOf(new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US)).format(amount)));

        JSONObject paymentObj = new JSONObject();
        paymentObj.accumulateAll(payment);

        final Map<String, String> requestParams = new HashMap();
        requestParams.put("program_id", config.programId);
        requestParams.put("Payments", "[" + paymentObj + "]");

        try {
            HttpsRequest.RequestResponse createPaymentResponse = HttpsRequest.send(HttpsRequest.RequestType.POST, requestUrl, headers, requestParams, true);
            if (createPaymentResponse.httpStatusCode != HttpsRequest.HTTP_OK) {
                log.info("Unable to create payment for payment id " + internalPaymentId);
                throw new PayoneerServiceException(createPaymentResponse.response.toString());
            } else return internalPaymentId; // client_reference_id can be used to query payment status
        } catch (Exception e) {
            log.error("Failed to create payment. internalPaymentId = " + internalPaymentId + "; payeeId: " + payeeId);
            e.printStackTrace();
            throw new PayoneerServiceException("Failed to create payment.");
        }
    }

    /**
     * <p>
     * Returns the link for the specified member to register with Payoneer.
     * </p>
     *
     * @param payeeId Payee ID.
     * @return The registration URL.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static String getRegistrationLink(long payeeId) throws PayoneerServiceException {
        throw new PayoneerServiceException("Self registration is not supported at the moment.");
    }

    private static Map<String, String> getAuthHeader() throws PayoneerServiceException {
        try {
            loadConfig();
            refreshAuthTokenIfRequired();
        } catch (Exception e) {
            e.printStackTrace();
            throw new PayoneerServiceException("Unable to refresh authentication token", e);
        }

        final Map<String, String> headers = new HashMap();
        headers.put(HttpsRequest.HEADER_AUTHORIZATION, authTokenHeader);

        return headers;
    }

    private static void refreshAuthTokenIfRequired() throws Exception {
        if (authTokenHeader == null || (expiresAt != null && expiresAt.before(new Date(System.currentTimeMillis() - EXPIRY_CHECK_DELTA)))) {
            final String authUrl = config.loginUrl + "/api/v2/oauth2/token";

            final HashMap<String, String> headers = new HashMap();
            headers.put(HttpsRequest.HEADER_AUTHORIZATION, "Basic " + new String(Base64.encodeBase64((config.username + ":" + config.password).getBytes())));

            final HashMap<String, String> params = new HashMap();
            params.put("grant_type", "client_credentials");
            params.put("scope", "read write");

            HttpsRequest.RequestResponse httpResponse = HttpsRequest.send(HttpsRequest.RequestType.POST, authUrl, headers, params, false);

            if (httpResponse.httpStatusCode != HttpsRequest.HTTP_OK) {
                throw new Exception("Failed to refresh token.");
            }

            final String tokenType = httpResponse.response.getString("token_type");
            final String accessToken = httpResponse.response.getString("access_token");

            final long expires_in = httpResponse.response.getLong("expires_in");
            final long constentedOn = httpResponse.response.getLong("consented_on");

            authTokenHeader = tokenType + " " + accessToken;
            expiresAt = new Date((constentedOn + expires_in) * 1000);

            log.info("Token will expire at: " + expiresAt.toString());
        }
    }

    private static void loadConfig() throws ConfigManagerException {
        if (config == null) {
            config = getPayoneerConfig();
        }
    }

    /**
    * <p>
    * This is a private helper method to get the Payoneer API credentials from the
    * configuration.
    * </p>
    */
    private static PayoneerConfig getPayoneerConfig() throws ConfigManagerException {
    if (config == null) {
        config = new PayoneerConfig();

        ConfigManager configManager = ConfigManager.getInstance();
        if (configManager.existsNamespace(DEFAULT_PAYONEER_NAMESPACE)) {
        config.baseApiUrl = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "base_api_url");
        config.partnerId = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "partner_id");
        config.programId = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "program_id");
        config.username = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "username");
        config.password = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "password");
        config.loginUrl = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "login_url");
        }
    }
    return config;
    }

    private static class PayoneerConfig {
        public String baseApiUrl = "";
        public String partnerId = "";
        public String programId = "";
        public String username = "";
        public String password = "";
        public String loginUrl = "";
    }

    private static class HttpsRequest {
        public static final String HEADER_AUTHORIZATION = "Authorization";
        public static final String CONTENT_TYPE_X_WWW_FORM_URL_ENCODED = "application/x-www-form-urlencoded";
        public static final String CONTENT_TYPE_JSON = "application/json";
        private static final String HEADER_CONTENT_TYPE = "Content-Type";
        private static final String HEADER_CONTENT_LENGTH = "Content-Length";
        private static final String HEADER_ACCEPT = "Accept";

        public static final int HTTP_OK = HttpsURLConnection.HTTP_OK;
        public static final int HTTP_NOT_FOUND = HttpsURLConnection.HTTP_NOT_FOUND;

        public static RequestResponse send(final RequestType reqType, final String urlString, final Map<String, String> headers, final Map<String, String> requestParams, final boolean isBodyTypeJSON) throws Exception {
            log.info(reqType.toString() + ": " + urlString);

            HttpsURLConnection httpsConn = null;
            try {
                httpsConn = (HttpsURLConnection) new URL(urlString).openConnection();
                httpsConn.setRequestMethod(reqType.toString());

                if (headers != null) {
                    Iterator<Map.Entry<String, String>> iterator = headers.entrySet().iterator();
                    while (iterator.hasNext()) {
                        Map.Entry<String, String> header = iterator.next();
                        httpsConn.setRequestProperty(header.getKey(), header.getValue());
                    }
                }

                // all Payoneer API response are of type JSON
                httpsConn.setRequestProperty(HEADER_ACCEPT, CONTENT_TYPE_JSON);

                if (reqType == RequestType.POST && requestParams != null) {
                    httpsConn.setDoOutput(true);
                    String requestData = "";

                    if (isBodyTypeJSON) {
                        httpsConn.setRequestProperty(HEADER_CONTENT_TYPE, CONTENT_TYPE_JSON);

                        final JSONObject jsonObject = new JSONObject();
                        jsonObject.accumulateAll(requestParams);
                        requestData = jsonObject.toString();
                    } else {
                        httpsConn.setRequestProperty(HEADER_CONTENT_TYPE, CONTENT_TYPE_X_WWW_FORM_URL_ENCODED);

                        StringBuilder tmpParams = new StringBuilder();
                        boolean isFirst = true;
                        Iterator<Map.Entry<String, String>> it = requestParams.entrySet().iterator();
                        while (it.hasNext()) {
                            if (isFirst) {
                                isFirst = false;
                            } else {
                                tmpParams.append("&");
                            }
                            Map.Entry<String, String> param = it.next();

                            tmpParams.append(URLEncoder.encode(param.getKey(), "UTF-8"));
                            tmpParams.append("=");
                            tmpParams.append(URLEncoder.encode(param.getValue(), "UTF-8"));
                        }

                        requestData = tmpParams.toString();
                    }

                    log.info((isBodyTypeJSON ? "Body: " : "Form-Data: ") + requestData);

                    httpsConn.setRequestProperty(HEADER_CONTENT_LENGTH, Integer.toString(requestData.length()));
                    DataOutputStream outputStream = new DataOutputStream(httpsConn.getOutputStream());
                    outputStream.write(requestData.getBytes(StandardCharsets.UTF_8));
                }
            } catch (Exception e) {
                e.printStackTrace();
                throw e;
            } finally {
                if (httpsConn != null) {
                    httpsConn.disconnect();
                }
            }

            int responseCode = -1;
            String responseString = null;
            InputStream responseStream = null;

            try {
                responseCode = httpsConn.getResponseCode();

                responseStream = (responseCode == HttpsURLConnection.HTTP_OK) ? httpsConn.getInputStream() : httpsConn.getErrorStream();
                responseString = IOUtils.toString(responseStream, DEFAULT_ENCODING);
            } catch (IOException e) {
                e.printStackTrace();
                throw e;
            } finally {
                if (responseStream != null) {
                    try {
                        responseStream.close();
                    } catch (Exception e) {
                        log.info("Error closing stream.");
                    }
                }

                httpsConn.disconnect();
            }

            try {
                return new RequestResponse(responseCode, (JSONObject) JSONSerializer.toJSON(responseString));
            } catch (Exception e) {
                e.printStackTrace();
                throw e;
            }
        }

        public enum RequestType {GET, POST}

        public static class RequestResponse {
            private final int httpStatusCode;
            private final JSONObject response;

            public RequestResponse(final int httpStatusCode, JSONObject response) {
                this.httpStatusCode = httpStatusCode;
                this.response = response;
            }

            @Override
            public String toString() {
                return "HTTP Response Code: " + this.httpStatusCode + "\n" + "Response Body: " + this.response.toString(3);
            }
        }
    }

}
