/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.w3c.dom.Element;

import java.lang.String;
import java.lang.StringBuilder;
import java.rmi.RemoteException;
import java.io.DataOutputStream;
import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.*;

/**
 * <p>This class provides convenient static methods for calling the Payoneer API.</p>
 *
 * @author VolodymyrK
 * @version 1.0
 */
public class PayoneerService {

    private static final String DEFAULT_PAYONEER_NAMESPACE = "com.topcoder.web.tc.controller.PayoneerService";

    /**
     * <p>Constructs new <code>PayoneerService</code> instance. This implementation does nothing.</p>
     */
    private PayoneerService() {
    }

    /**
     * <p>Represents all possible statuses a member can have with respect to registering with Payoneer.</p>
     */
    public static enum PayeeStatus {
        ACTIVE, REGISTERED, NOT_REGISTERED
    }

    /**
     * <p>Returns status of the specified member in the Payoneer system.</p>
     */
    public static PayeeStatus getPayeeStatus(long payeeId) throws PayoneerServiceException {
        try {
            PayoneerConfig config = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "GetPayeeDetails");
            parameters.put("p1", config.username);
            parameters.put("p2", config.password);
            parameters.put("p3", config.partnerId);
            parameters.put("p4", ""+payeeId);

            Document response = getXMLResponse(config.baseApiUrl, parameters);

            // Error node means the user is unknown to Payoneer and thus not registered.
            NodeList error = response.getElementsByTagName("Error");
            if (error.getLength() > 0) {
                return PayeeStatus.NOT_REGISTERED;
            }

            // If there's a PayOutMethod node check its value. If the value is "Direct deposit"
            // the member is assumed to be approved by Payoneer.
            NodeList payOutMethod = response.getElementsByTagName("PayOutMethod");
            if (payOutMethod.getLength() > 0) {
                String value = payOutMethod.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Direct deposit")) {
                    return PayeeStatus.ACTIVE;
                }
            }

            // If there's a CardStatus node it means the user applied for the prepaid card option.
            // In this case check the value.
            NodeList cardStatus = response.getElementsByTagName("CardStatus");
            if (cardStatus.getLength() > 0) {
                String value = cardStatus.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Active")) {
                    return PayeeStatus.ACTIVE;
                }
            }

            // If there's a PayeeStatus node it means the user applied for the iACH option.
            // In this case check the value.
            NodeList payeeStatus = response.getElementsByTagName("PayeeStatus");
            if (payeeStatus.getLength() > 0) {
                String value = payeeStatus.item(0).getFirstChild().getNodeValue();
                if (value != null && value.trim().equalsIgnoreCase("Active")) {
                    return PayeeStatus.ACTIVE;
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
            throw new PayoneerServiceException("Error occured while getting the payee status", e);
        }
    }

    /**
     * <p>Returns the link for the specified member to register with Payoneer.</p>
     */
    public static String getRegistrationLink(long payeeId) throws PayoneerServiceException {
        try {
            PayoneerConfig config = getPayoneerConfig();
            Map<String,String> parameters = new HashMap<String,String>();
            parameters.put("mname", "GetToken");
            parameters.put("p1", config.username);
            parameters.put("p2", config.password);
            parameters.put("p3", config.partnerId);
            parameters.put("p4", ""+payeeId);
            parameters.put("p10", "True"); // Creates a XML response with the token URL.

            Document response = getXMLResponse(config.baseApiUrl, parameters);

            // Error node means something went wrong.
            NodeList error = response.getElementsByTagName("Error");
            if (error.getLength() > 0) {
                NodeList descriptionNode = response.getElementsByTagName("Description");
                String descripton = descriptionNode.getLength() > 0 ?
                    descriptionNode.item(0).getFirstChild().getNodeValue() : "";
                throw new PayoneerServiceException("Payoneer service reported an error : " + descripton);
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
            throw new PayoneerServiceException("Error occured while getting the Payoneer registration link", e);
        }

        throw new PayoneerServiceException("Unable to get the registration link from the Payoneer's response");
    }
    
    /**
     * <p>This is a private helper method to get the Payoneer API credentials from the configuration.</p>
     */
    private static PayoneerConfig getPayoneerConfig() throws ConfigManagerException {
        PayoneerConfig config = new PayoneerConfig();

        ConfigManager configManager = ConfigManager.getInstance();
        if (configManager.existsNamespace(DEFAULT_PAYONEER_NAMESPACE)) {
            config.baseApiUrl = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "base_api_url");
            config.partnerId = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "partner_id");
            config.username = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "username");
            config.password = (String) configManager.getProperty(DEFAULT_PAYONEER_NAMESPACE, "password");
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

            //Create connection
            connection = (HttpURLConnection) (new URL(baseApiUrl)).openConnection();
            connection.setRequestMethod("POST");
            connection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            connection.setRequestProperty("Content-Length", "" + Integer.toString(urlParameters.getBytes().length));
            connection.setRequestProperty("Content-Language", "en-US");
            connection.setUseCaches (false);
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
            return response;
        } finally {
          if(connection != null) {
            connection.disconnect(); 
          }
        }

    }

    private static class PayoneerConfig {
        public String baseApiUrl = "";
        public String partnerId = "";
        public String username = "";
        public String password = "";
    }
}
