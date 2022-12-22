/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;
import com.topcoder.shared.util.logging.Logger;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import java.io.*;
import java.lang.String;
import java.lang.StringBuilder;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.net.ssl.HttpsURLConnection;
import javax.net.ssl.SSLContext;

import com.topcoder.json.object.JSONObject;
import java.net.URLEncoder;

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

  private static PayoneerConfig config = null;

  private static com.topcoder.server.util.logging.Logger log = Logger.getLogger(PayoneerService.class);

  /**
   * <p>
   * Constructs new <code>PayoneerService</code> instance. This implementation
   * does nothing.
   * </p>
   */
  private PayoneerService() {
  }

  /**
   * <p>
   * Represents all possible statuses a member can have with respect to
   * registering with Payoneer.
   * </p>
   */
  public static enum PayeeStatus {
    ACTIVATED, REGISTERED, NOT_REGISTERED
  }

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
    log.info("Getting payee status for user ID " + payeeId);
    try {
      PayoneerConfig payoneerConfig = getPayoneerConfig();
      Map<String, String> parameters = new HashMap<String, String>();

      String requestUrl = payoneerConfig.baseApiUrl + "/programs/" + payoneerConfig.partnerId + "/payees/"
          + payeeId + "/status";

      JSONObject result = httpClient(requestUrl, "GET", parameters, "");

      String value = new JSONObject(new JSONObject(result.get("result").toString())
          .get("status").toString()).get("description").toString();

      if (value != null && value.trim().equalsIgnoreCase("Active")) {
        return PayeeStatus.ACTIVATED;
      } else if (value != null && value.trim().equalsIgnoreCase("Pending")) {
        return PayeeStatus.REGISTERED;
      }
      return PayeeStatus.NOT_REGISTERED;

    } catch (PayoneerServiceException e) {
      throw e;
    } catch (Exception e) {
      throw new PayoneerServiceException("Error occurred while getting the payee status", e);
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
    log.info("Getting registration link for user ID " + payeeId);
    try {
      PayoneerConfig payoneerConfig = getPayoneerConfig();
      Map<String, String> parameters = new HashMap<String, String>();
      parameters.put("Content-Type", "application/json");
      String requestUrl = payoneerConfig.baseApiUrl + "/programs/" + payoneerConfig.partnerId
          + "/payees/registration-link";
      String body = "{\"payee_id\":\"" + payeeId + "\"}";
      JSONObject res = httpClient(requestUrl, "GET", parameters, body);
      String link = new JSONObject(res.get("result").toString()).get("registration_link").toString();
      return link;

    } catch (PayoneerServiceException e) {
      throw e;
    } catch (Exception e) {
      throw new PayoneerServiceException("Error occurred while getting the Payoneer registration link", e);
    }

    throw new PayoneerServiceException("Unable to get the registration link from the Payoneer's response");
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
  public static long createPayment(long internalPaymentId, long payeeId, double amount)
      throws PayoneerServiceException {
    log.info("Creating payment in Payoneer for user ID " + payeeId + " with amount $" + amount);
    try {
      DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
      PayoneerConfig payoneerConfig = getPayoneerConfig();
      Map<String, String> parameters = new HashMap<String, String>();
      parameters.put("Content-Type", "application/json");

      // New code
      String requestUrl = payoneerConfig.baseApiUrl + "/programs/" + payoneerConfig.partnerId + "/masspayouts";

      String body = "{\"Payments\": [{\"client_reference_id\":\"" + internalPaymentId + "\",\"payee_id\":\""
          + payeeId + "\",\"description\":\"TopCoder payment\"," + "\"currency\":\"USD\",\"amount\":\""
          + df.format(amount) + "\"}]}";

      JSONObject res = httpClient(requestUrl, "POST", parameters, body);
      if (res.get("result").toString().trim().equalsIgnoreCase("Payments Created")) {
        String url = payoneerConfig.baseApiUrl + "/programs/" + payoneerConfig.partnerId + "/payouts/"
            + internalPaymentId + "/status";
        JSONObject payStatus = httpClient(url, "GET", parameters, "");
        long id = new JSONObject(payStatus.get("result").toString()).getLong("payout_id");
        return id;
      }
      throw new PayoneerServiceException("Unable to create payment in Payoneer");

    } catch (PayoneerServiceException e) {
      throw e;
    } catch (Exception e) {
      throw new PayoneerServiceException("Error occurred while getting the Payoneer balance amount", e);
    }

    throw new PayoneerServiceException("Unable to get the balance amount from the Payoneer's response");
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
    log.info("Getting balance amount on the Payoneer account");

    try {
      PayoneerConfig payoneerConfig = getPayoneerConfig();
      String requestUrl = payoneerConfig.baseApiUrl + "/programs/" + payoneerConfig.partnerId + "/balance";
      Map<String, String> parameters = new HashMap<String, String>();
      JSONObject result = httpClient(requestUrl, "GET", parameters, "");
      double value = new JSONObject(result.get("result").toString()).getDouble("balance");
      return value;
    } catch (PayoneerServiceException e) {
      throw e;
    } catch (Exception e) {
      throw new PayoneerServiceException("Error occurred while getting the Payoneer balance amount", e);
    }

    throw new PayoneerServiceException("Unable to get the balance amount from the Payoneer's response");
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
        config.loginUrl = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "loginUrl");
      }
    }
    return config;
  }

  /**
   * <p>
   * This is a private helper method to get the application token from the
   * configuration.
   * </p>
   */
  private static JSONObject httpClient(String inputUrl, String method, Map<String, String> parameters, String body)
      throws Exception {
    try {

      URL url = new URL(inputUrl);
      HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();

      conn.setRequestMethod(method);

      for (String key : parameters.keySet()) {
        conn.setRequestProperty(key, parameters.get(key));
      }
      String token = getApplicationToken();
      conn.setRequestProperty("Authorization", "Bearer " + token);
      log.info("URL: " + inputUrl);
      log.info("Parameters" + parameters.toString());
      if (!body.isEmpty()) {
        log.info("Body: " + body);
        conn.setDoOutput(true);
        OutputStream os = conn.getOutputStream();
        OutputStreamWriter osw = new OutputStreamWriter(os, "UTF-8");
        osw.write(body);
        osw.flush();
        osw.close();
        os.close(); // don't forget to close the OutputStream
      }

      BufferedReader buf = new BufferedReader(new InputStreamReader(conn.getInputStream()));

      String output;
      String result = "";

      while ((output = buf.readLine()) != null) {
        result += output;
      }

      JSONObject obj = new JSONObject(result);

      conn.disconnect();
      return obj;
    } catch (Exception e) {
      log.error("Http Client Error error", e);
      throw e;

    }

  }

  private static String getApplicationToken() throws Exception {
    try {
      String token = checkToken();
      return token;
    } catch (Exception e) {
    }
    PayoneerConfig payoneerConfig = getPayoneerConfig();
    try {
      URL url = new URL(payoneerConfig.loginUrl + "/api/v2/oauth2/token");
      HttpsURLConnection conn = (HttpsURLConnection) url.openConnection();
      String rawAuth = payoneerConfig.username + ":" + payoneerConfig.password;
      String base64Auth = Base64.getEncoder().encodeToString(rawAuth.getBytes());
      conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
      conn.setRequestProperty("Authorization", "Basic " + base64Auth);

      conn.setDoOutput(true);
      PrintWriter pw = new PrintWriter(conn.getOutputStream());
      pw.println("grant_type=" + URLEncoder.encode("client_credentials") + "&scope="
          + URLEncoder.encode("read write openid"));
      pw.close();

      BufferedReader buf = new BufferedReader(new InputStreamReader(conn.getInputStream()));

      String output;
      String result = "";

      while ((output = buf.readLine()) != null) {
        result += output;
      }

      JSONObject obj = new JSONObject(result);

      conn.disconnect();
      Calendar tokenExp = Calendar.getInstance();
      // Set EXP to 10 minutes before actual expiration
      tokenExp.add(Calendar.SECOND, (obj.getInt("expires_in") - (10 * 60)));
      String token = obj.get("access_token").toString();
      payoneerConfig.applicationToken = token;
      payoneerConfig.tokenExp = tokenExp;

      return token;
    } catch (Exception e) {
      payoneerConfig.applicationToken = "";
      log.error("Bearer token error", e);
      throw e;
    }
  }

  private static String checkToken() throws Exception {
    log.info("Checking token");
    PayoneerConfig payoneerConfig = getPayoneerConfig();
    Calendar now = Calendar.getInstance();
    if (payoneerConfig.applicationToken.isEmpty()) {
      throw new Exception("No token");
    }
    if (now.after(payoneerConfig.tokenExp)) {
      throw new Exception("Expired token");
    }
    return payoneerConfig.applicationToken;
  }

  private static class PayoneerConfig {
    public String baseApiUrl = "";
    public String partnerId = "";
    public String programId = "";
    public String username = "";
    public String password = "";
    public String loginUrl = "";
    public String applicationToken = "";
    public Calendar tokenExp = Calendar.getInstance();
  }
}
