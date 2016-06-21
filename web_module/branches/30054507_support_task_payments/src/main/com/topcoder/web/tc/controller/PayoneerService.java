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

/**
 * <p>This class provides convenient static methods for calling the Payoneer API.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayoneerService {

    private static final String DEFAULT_PAYONEER_NAMESPACE = "com.topcoder.web.tc.controller.PayoneerService";
    
    private static PayoneerConfig config = null;

    private static Logger log = Logger.getLogger(PayoneerService.class);

    /**
     * <p>Constructs new <code>PayoneerService</code> instance. This implementation does nothing.</p>
     */
    private PayoneerService() {
    }

    /**
     * <p>Represents all possible statuses a member can have with respect to registering with Payoneer.</p>
     */
    public static enum PayeeStatus {
        ACTIVATED, REGISTERED, NOT_REGISTERED
    }

    /**
     * <p>Returns status of the specified member in the Payoneer system.</p>
     * @param payeeId Payee ID.
     * @return ACTIVATED for activated status, REGISTERED if the payee has registered but hasn't activated yet and NOT_REGISTERED otherwise.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static PayeeStatus getPayeeStatus(long payeeId) throws PayoneerServiceException {
        log.info("Getting payee status for user ID " + payeeId);
        try {
            PayoneerConfig payoneerConfig = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "GetPayeeDetails");
            parameters.put("p1", payoneerConfig.username);
            parameters.put("p2", payoneerConfig.password);
            parameters.put("p3", payoneerConfig.partnerId);
            parameters.put("p4", ""+payeeId);

            Document response = getXMLResponse(payoneerConfig.baseApiUrl, parameters);

            // Code "002" means the payee is unknown to Payoneer and thus is not registered.
            NodeList codeNode = response.getElementsByTagName("Code");            
            String code = codeNode.getLength() > 0 ? codeNode.item(0).getFirstChild().getNodeValue().trim() : null;
            if ("002".equals(code))  {
                return PayeeStatus.NOT_REGISTERED;
            }

            // If there's a PayOutMethod node check its value. If the value is "Direct deposit"
            // the member is assumed to be approved by Payoneer.
            NodeList payOutMethod = response.getElementsByTagName("PayOutMethod");
            if (payOutMethod.getLength() > 0) {
                String value = payOutMethod.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Direct deposit")) {
                    return PayeeStatus.ACTIVATED;
                }
            }

            // If there's a CardStatus node it means the user applied for the prepaid card option.
            // In this case check the value.
            NodeList cardStatus = response.getElementsByTagName("CardStatus");
            if (cardStatus.getLength() > 0) {
                String value = cardStatus.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Active")) {
                    return PayeeStatus.ACTIVATED;
                }
            }

            // If there's a PayeeStatus node it means the user applied for the iACH option.
            // In this case check the value.
            NodeList payeeStatus = response.getElementsByTagName("PayeeStatus");
            if (payeeStatus.getLength() > 0) {
                String value = payeeStatus.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Active")) {
                    return PayeeStatus.ACTIVATED;
                }
            }

            // If we get to this point and there's still a "Payee" node it means the member is registered but not activated yet.
            NodeList payee = response.getElementsByTagName("Payee");
            if (payee.getLength() > 0) {
                return PayeeStatus.REGISTERED;
            } else {
                throw new PayoneerServiceException("Unable to get the payee status from the Payoneer's response");
            }

        } catch (PayoneerServiceException e) {
            throw e;
        } catch (Exception e) {
            throw new PayoneerServiceException("Error occurred while getting the payee status", e);
        }
    }

    /**
     * <p>Returns the link for the specified member to register with Payoneer.</p>
     * @param payeeId Payee ID.
     * @return The registration URL.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static String getRegistrationLink(long payeeId) throws PayoneerServiceException {
        log.info("Getting registration link for user ID " + payeeId);
        try {
            PayoneerConfig payoneerConfig = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "GetToken");
            parameters.put("p1", payoneerConfig.username);
            parameters.put("p2", payoneerConfig.password);
            parameters.put("p3", payoneerConfig.partnerId);
            parameters.put("p4", ""+payeeId);
            parameters.put("p10", "True"); // Creates a XML response with the token URL.

            Document response = getXMLResponse(payoneerConfig.baseApiUrl, parameters);

            // Code node means something went wrong.
            NodeList codeNode = response.getElementsByTagName("Code");
            if (codeNode.getLength() > 0) {
                NodeList descriptionNode = response.getElementsByTagName("Description");
                String description = descriptionNode.getLength() > 0 ?
                    descriptionNode.item(0).getFirstChild().getNodeValue().trim() : "";
                throw new PayoneerServiceException("Payoneer service reported an error : " + description);
            }

            // The token node contains the registration URL.
            NodeList token = response.getElementsByTagName("Token");
            if (token.getLength() > 0) {
                String value = token.item(0).getFirstChild().getNodeValue();
                if (value != null) {
                    return value.trim();
                }
            }

        } catch (PayoneerServiceException e) {
            throw e;
        } catch (Exception e) {
            throw new PayoneerServiceException("Error occurred while getting the Payoneer registration link", e);
        }

        throw new PayoneerServiceException("Unable to get the registration link from the Payoneer's response");
    }
    
    /**
     * <p>Creates payment of the specified amount for the specified payee in Payoneer.</p>
     * @param internalPaymentId The ID that this payment will be associated with in the Payoneer system. Should be unique.
     * @param payeeId Payoneer payee ID. Corresponds to the TopCoder user ID.
     * @param amount The amount to be paid.
     * @return Payment ID in the Payoneer system.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static long createPayment(long internalPaymentId, long payeeId, double amount) throws PayoneerServiceException {
        log.info("Creating payment in Payoneer for user ID " + payeeId + " with amount $" + amount);
        try {
            DecimalFormat df = new DecimalFormat("0.00", new DecimalFormatSymbols(Locale.US));
            PayoneerConfig payoneerConfig = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "PerformPayoutPayment");
            parameters.put("p1", payoneerConfig.username);
            parameters.put("p2", payoneerConfig.password);
            parameters.put("p3", payoneerConfig.partnerId);
            parameters.put("p4", payoneerConfig.programId);
            parameters.put("p5", ""+internalPaymentId);
            parameters.put("p6", ""+payeeId);
            parameters.put("p7", df.format(amount));
            parameters.put("p8", "TopCoder payment");

            String currentDate = (new SimpleDateFormat("MM/dd/yyyy HH:mm:ss")).format(new Date());
            parameters.put("p9", currentDate);

            Document response = getXMLResponse(payoneerConfig.baseApiUrl, parameters);

            // Statuses other than "000" mean error
            NodeList statusNode = response.getElementsByTagName("Status");
            String status = statusNode.getLength() > 0 ? statusNode.item(0).getFirstChild().getNodeValue().trim() : null;
            if (!"000".equals(status)) {
                NodeList descriptionNode = response.getElementsByTagName("Description");
                String description = descriptionNode.getLength() > 0 ?
                    descriptionNode.item(0).getFirstChild().getNodeValue().trim() : "";
                throw new PayoneerServiceException("Payoneer service reported an error : " + description);
            }

            // The PaymentID node contains the payment ID assigned by Payoneer.
            NodeList idNode = response.getElementsByTagName("PaymentID");
            if (idNode.getLength() > 0) {
                String value = idNode.item(0).getFirstChild().getNodeValue();
                if (value != null) {
                    return Long.parseLong(value);
                }
            }
        } catch (PayoneerServiceException e) {
            throw e;
        } catch (Exception e) {
            throw new PayoneerServiceException("Error occurred while getting the Payoneer balance amount", e);
        }

        throw new PayoneerServiceException("Unable to get the balance amount from the Payoneer's response");
    }

    /**
     * <p>Returns the balance on the TopCoder's Payoneer account.</p>
     * @return The balance amount.
     * @throws PayoneerServiceException if any error occurs.
     */
    public static double getBalanceAmount() throws PayoneerServiceException {
        log.info("Getting balance amount on the Payoneer account");
        
        try {
            PayoneerConfig payoneerConfig = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "GetAccountDetails");
            parameters.put("p1", payoneerConfig.username);
            parameters.put("p2", payoneerConfig.password);
            parameters.put("p3", payoneerConfig.partnerId);

            Document response = getXMLResponse(payoneerConfig.baseApiUrl, parameters);

            // Code node means something went wrong.
            NodeList codeNode = response.getElementsByTagName("Code");
            if (codeNode.getLength() > 0) {
                NodeList errorNode = response.getElementsByTagName("Error");
                String error = errorNode.getLength() > 0 ?
                        errorNode.item(0).getFirstChild().getNodeValue() : null;
                throw new PayoneerServiceException("Payoneer service reported an error : " + error);
            }

            // The AccountBalance node contains the balance amount.
            NodeList balanceNode = response.getElementsByTagName("AccountBalance");
            if (balanceNode.getLength() > 0) {
                String value = balanceNode.item(0).getFirstChild().getNodeValue();
                if (value != null) {
                    return Double.parseDouble(value);
                }
            }
        } catch (PayoneerServiceException e) {
            throw e;
        } catch (Exception e) {
            throw new PayoneerServiceException("Error occurred while getting the Payoneer balance amount", e);
        }

        throw new PayoneerServiceException("Unable to get the balance amount from the Payoneer's response");
    }
   
    /**
     * <p>This is a private helper method to get the Payoneer API credentials from the configuration.</p>
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
            }
        }
        return config;
    }

    /**
     * <p>This is a private helper method that queries the Payoneer API with the specified parameters and returns the response.</p>
     */
    private static Document getXMLResponse(String baseApiUrl, Map<String,String> parameters) throws Exception {
        HttpURLConnection connection = null;

        try {
            StringBuilder builder = new StringBuilder();
            for(String key : parameters.keySet()) {
                if (builder.length() > 0) {
                    builder.append("&");
                }
                builder.append(key+"="+parameters.get(key));
            }
            String urlParameters = builder.toString();
            
            // Log the request string but hide the password (which is the 'p2' parameter value).
            log.info("Payoneer request: " + urlParameters.replaceAll(parameters.get("p2"), "XXXXXXXX"));

            //Create connection
            connection = (HttpURLConnection) (new URL(baseApiUrl)).openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
            connection.setRequestProperty("Content-Language", "en-US");
            connection.setUseCaches(false);
            connection.setDoInput(true);
            connection.setDoOutput(true);

            //Send request
            DataOutputStream wr = new DataOutputStream(connection.getOutputStream());
            wr.writeBytes(urlParameters);
            wr.flush();
            wr.close();

            //Get Response
            Document response = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(connection.getInputStream());
            response.getDocumentElement().normalize();
            log.info("Payoneer response: " + xmlToString(response));
            return response;
        } finally {
          if(connection != null) {
            connection.disconnect(); 
          }
        }

    }

    /**
     * <p>This is a private helper method that converts XML document to a String.</p>
     */
    public static String xmlToString(Node node) {
        try {
            Source source = new DOMSource(node);
            StringWriter stringWriter = new StringWriter();
            Result result = new StreamResult(stringWriter);
            TransformerFactory.newInstance().newTransformer().transform(source, result);
            return stringWriter.getBuffer().toString();
        } catch (Throwable e) {
            log.error("Unable to convert XML Document to String", e);
        }
        return null;
    }

    private static class PayoneerConfig {
        public String baseApiUrl = "";
        public String partnerId = "";
        public String programId = "";
        public String username = "";
        public String password = "";
    }
}
