/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.shared.util.logging.Logger;

import java.lang.String;
import java.lang.StringBuilder;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.rmi.RemoteException;
import java.net.HttpURLConnection;
import java.net.InetAddress;
import java.net.URL;
import java.net.URLEncoder;
import java.net.URLDecoder;
import java.util.*;
import java.io.*;

/**
 * <p>This class provides convenient static methods for calling the PayPal API.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayPalService {

    private static final String DEFAULT_PAYPAL_NAMESPACE = "com.topcoder.web.tc.controller.PayPalService";
    
    private static PayPalConfig config = null;

    private static String CHARSET_NAME = "UTF-8";

    private static Logger log = Logger.getLogger(PayPalService.class);

    /**
     * <p>Constructs new <code>PayPalService</code> instance. This implementation does nothing.</p>
     */
    private PayPalService() {
    }

    /**
     * <p>Creates payment of the specified amount for the specified PayPal account in PayPal.
     * The method returns the pay key of the payment registered in PayPal.
     * The payment must be completed in 3 hours by passing the pay key to executePayment() method
     * otherwise the payment will be automatically cancelled.</p>
     * @param emailAddress The email address associated with the PayPal account to send the money to.
     * @param amount The amount to be paid.
     * @return The pay key of the payment in PayPal system.
     * @throws PayPalServiceException if any error occurs.
     */
    public static String createPayment(String emailAddress, double amount) throws PayPalServiceException {
        if (emailAddress == null || emailAddress.trim().length() == 0) {
            throw new IllegalArgumentException("Invalid emailAddress parameter.");
        }
        if (amount < 0.01) {
            throw new IllegalArgumentException("Invalid amount parameter.");
        }

        try {
            PayPalConfig payPalConfig = getPayPalConfig();

            DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
            String requestBody="requestEnvelope.errorLanguage=en_US" +
                    "&actionType=CREATE" +
                    "&senderEmail=" + URLEncoder.encode(payPalConfig.senderEmail, CHARSET_NAME) +
                    "&receiverList.receiver(0).email=" +  URLEncoder.encode(emailAddress, CHARSET_NAME) +
                    "&receiverList.receiver(0).amount=" + URLEncoder.encode(df.format(amount), CHARSET_NAME) +
                    "&currencyCode=USD" +
                    "&feesPayer=EACHRECEIVER" +
                    "&memo=TopCoder payment" +
                    "&returnUrl=http://www.topcoder.com" +
                    "&cancelUrl=http://www.topcoder.com";

            log.debug("PayPal request: " + requestBody);
            String response = getNVResponse(payPalConfig.baseAdaptivePaymentsUrl + "Pay", requestBody);
            log.debug("PayPal response: " + response);

            Map<String, String> nvp = stringToNVP(response);

            String ack = nvp.get("responseEnvelope.ack");
            if (!"Success".equalsIgnoreCase(ack) && !"SuccessWithWarning".equalsIgnoreCase(ack)) {
                throw new PayPalServiceException("PayPal service returned an error in createPayment method.");
            }

            String paymentExecStatus = nvp.get("paymentExecStatus");
            if ("COMPLETED".equalsIgnoreCase(paymentExecStatus) || "CREATED".equalsIgnoreCase(paymentExecStatus) ||
                "PROCESSING".equalsIgnoreCase(paymentExecStatus) || "PENDING".equalsIgnoreCase(paymentExecStatus)) {
                String payKey = nvp.get("payKey");
                if (payKey == null) {
                    throw new PayPalServiceException("Missing payKey value.");
                }
                return payKey;
            } else {
                throw new PayPalServiceException("Failed to enter a payment into the PayPal.");
            }
        } catch (PayPalServiceException e) {
            throw e;
        } catch (Throwable e) {
            throw new PayPalServiceException("Error occurred in createPayment method", e);
        }
    }

    /**
     * <p>Finalizes the payment previously created by the createPayment() method.</p>
     * @param payKey The pay key of the payment in PayPal system.
     * @throws PayPalServiceException if any error occurs.
     */
    public static void executePayment(String payKey) throws PayPalServiceException {
        if (payKey == null || payKey.length() == 0) {
            throw new IllegalArgumentException("Invalid payKey parameter.");
        }

        try {
            PayPalConfig payPalConfig = getPayPalConfig();

            String requestBody="requestEnvelope.errorLanguage=en_US" +
                    "&payKey=" +  URLEncoder.encode(payKey, CHARSET_NAME);

            log.debug("PayPal request: " + requestBody);
            String response = getNVResponse(payPalConfig.baseAdaptivePaymentsUrl + "ExecutePayment", requestBody);
            log.debug("PayPal response: " + response);

            Map<String, String> nvp = stringToNVP(response);

            String ack = nvp.get("responseEnvelope.ack");
            if (!"Success".equalsIgnoreCase(ack) && !"SuccessWithWarning".equalsIgnoreCase(ack)) {
                throw new PayPalServiceException("PayPal service returned an error in executePayment method.");
            }

            String paymentExecStatus = nvp.get("paymentExecStatus");
            if (!"COMPLETED".equalsIgnoreCase(paymentExecStatus) && !"CREATED".equalsIgnoreCase(paymentExecStatus)) {
                throw new PayPalServiceException("Failed to execute payment.");
            }
        } catch (PayPalServiceException e) {
            throw e;
        } catch (Throwable e) {
            throw new PayPalServiceException("Error occurred in executePayment method", e);
        }
    }

    /**
     * <p>Returns the balance on the TopCoder's PayPal merchant account.</p>
     * @return The balance amount.
     * @throws PayPalServiceException if any error occurs.
     */
    public static double getBalanceAmount() throws PayPalServiceException {
        log.info("Getting balance amount on the PayPal account");

        try { 
            PayPalConfig payPalConfig = getPayPalConfig();
            
            String requestBody="METHOD=GetBalance" +
                    "&VERSION=94.0" +
                    "&PWD=" + URLEncoder.encode(payPalConfig.password, CHARSET_NAME) +
                    "&USER=" + URLEncoder.encode(payPalConfig.username, CHARSET_NAME) +
                    "&SIGNATURE=" + URLEncoder.encode(payPalConfig.signature, CHARSET_NAME) +
                    "&RETURNALLCURRENCIES=0";

            log.info("PayPal request: " + requestBody);
            String response = getNVResponse(payPalConfig.nvpUrl, requestBody);
            log.info("PayPal response: " + response);

            Map<String, String> nvp = stringToNVP(response);

            String ack = nvp.get("ACK");
            if (!"Success".equalsIgnoreCase(ack) && !"SuccessWithWarning".equalsIgnoreCase(ack)) {
                throw new PayPalServiceException("PayPal service returned an error in getBalanceAmount method.");
            }

            String currencyCode = nvp.get("L_CURRENCYCODE0");
            if (!"USD".equalsIgnoreCase(currencyCode)) {
                throw new PayPalServiceException("PayPal service returned unexpected result in getBalanceAmount method.");
            }

            String balance = nvp.get("L_AMT0");
            return Double.parseDouble(balance);
        } catch (PayPalServiceException e) {
            throw e;
        } catch (Throwable e) {
            throw new PayPalServiceException("Generic error occurred in getBalanceAmount method", e);
        }
    }

    /**
     * <p>A private helper method to get the PayPal API credentials from the configuration.</p>
     */
    private static PayPalConfig getPayPalConfig() throws ConfigManagerException {
        if (config == null) {
            config = new PayPalConfig();

            ConfigManager configManager = ConfigManager.getInstance();
            if (configManager.existsNamespace(DEFAULT_PAYPAL_NAMESPACE)) {
                config.baseAdaptivePaymentsUrl = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "baseAdaptivePaymentsUrl");
                config.nvpUrl = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "nvpUrl");
                config.applicationId = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "applicationId");
                config.username = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "username");
                config.password = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "password");
                config.signature = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "signature");
                config.senderEmail = (String) configManager.getProperty(DEFAULT_PAYPAL_NAMESPACE, "senderEmail");
            }
        }
        return config;
    }

    /**
     * <p>A private helper method that queries the PayPal API with the specified parameters and returns the response.</p>
     */
    private static String getNVResponse(String url, String requestBody) throws Exception {
        HttpURLConnection connection = null;

        try {
            PayPalConfig payPalConfig = getPayPalConfig();
            
            //Create connection
            connection = (HttpURLConnection) (new URL(url)).openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", "" + Integer.toString(requestBody.getBytes().length));
            connection.setRequestProperty("Content-Language", "en-US");

            connection.setRequestProperty("X-PAYPAL-SECURITY-USERID", payPalConfig.username);
            connection.setRequestProperty("X-PAYPAL-SECURITY-PASSWORD", payPalConfig.password);
            connection.setRequestProperty("X-PAYPAL-SECURITY-SIGNATURE", payPalConfig.signature);
            connection.setRequestProperty("X-PAYPAL-APPLICATION-ID", payPalConfig.applicationId);
            connection.setRequestProperty("X-PAYPAL-DEVICE-IPADDRESS", InetAddress.getLocalHost().getHostAddress());

            connection.setRequestProperty("X-PAYPAL-REQUEST-DATA-FORMAT", "NV");
            connection.setRequestProperty("X-PAYPAL-RESPONSE-DATA-FORMAT", "NV");

            connection.setUseCaches(false);
            connection.setDoInput(true);
            connection.setDoOutput(true);

            //Send request
            DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(requestBody);
            wr.flush();
            wr.close();

            //read response with BufferedReader
            BufferedReader br  = new BufferedReader(new InputStreamReader(connection.getInputStream()));
            StringBuilder sb = new StringBuilder();

            String line;
            while ((line = br.readLine()) != null) {
                sb.append(line);
            }
            return sb.toString();
        } finally {
          if(connection != null) {
            connection.disconnect();
          }
        }
    }

    /**
     * <p>A private helper method that splits string into name-value pairs.</p>
     */
    private static Map<String, String> stringToNVP(String s) throws UnsupportedEncodingException {
        String[] parts = s.split("&");
        Map<String, String> ret = new HashMap<String,String>();
        for (String part : parts) {
            int index = part.indexOf("=");            
            if (index == -1) {
                log.error("Invalid NVP format.");
                continue;
            }
            ret.put(URLDecoder.decode(part.substring(0, index), CHARSET_NAME),
                URLDecoder.decode(part.substring(index + 1), CHARSET_NAME));
        }
        return ret;
    }

    /**
     * <p>Internal class to hold the PayPal config values.</p>
     */
    private static class PayPalConfig {
        public String baseAdaptivePaymentsUrl = "";
        public String nvpUrl = "";
        public String applicationId = "";
        public String username = "";
        public String password = "";
        public String signature = "";
        public String senderEmail = "";
    }
}
