/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.xpath.XPath;
import javax.xml.xpath.XPathExpression;
import javax.xml.xpath.XPathFactory;

import org.apache.commons.httpclient.HttpStatus;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;
import org.xml.sax.InputSource;


import com.topcoder.message.email.EmailEngine;
import com.topcoder.message.email.TCSEmailMessage;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.Property;
import com.topcoder.util.objectfactory.ObjectFactory;
import com.topcoder.util.objectfactory.impl.ConfigManagerSpecificationFactory;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.TCResponse;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.DocuSignEnvelopeDAO;
import com.topcoder.web.common.model.DocuSignEnvelope;

/**
 * It is the controller that receives the notification from the DocuSign.
 * 
 * Thread-Safety
 * The base class of this one is not thread-safe, so this class does not guarantee thread-safety.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class DocuSignCallback extends ShortHibernateProcessor {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(DocuSignCallback.class);
    /**
     * The class name.
     */
    private static final String NAMESPACE = DocuSignCallback.class.getName();

    /**
     * The handler namespace name.
     */
    private static final String HANDLER_NAMESPACE = NAMESPACE + ".handlers";

    /**
     * It is the mapping between the templateId and the list of handlers for the template.
     */
    private final Map<String, List<SignedDocumentHandler>> handlers;

    /**
     * The configured connectKey used to validate
     * if the request is actually sent from the DocuSign Connect service.
     */
    private final String connectKey;

    /**
     * The configured support email address where the error report should be sent to.
     */
    private final String supportingEmailAddress;

    /**
     * The configured from email address where the error report should be sent from.
     */
    private final String fromEmailAddress;

    /**
     * The email body template.
     * It should be used as the template of the email body.
     * It should support the variables like "${userId}", "${templateId}", "${envelopeId}", and "${error}".
     */
    private final String emailBodyTemplate;

    /**
     * The email subject template.
     */
    private final String emailSubjectTemplate;

    /**
     * The error message of connectKey that not present.
     */
    private static final String CONNECT_KEY_NOT_PRESENT = "Connect Key is missing or invalid!";

    /**
     * The constructor
     * which loads the configuration and initialize the list of handlers for the templates, and the connectKey.
     *
     * @throws Exception
     *   when the configuration fails because of some underlying errors. 
     */
    public DocuSignCallback() throws Exception {
        log.debug("Enter method " + NAMESPACE + " Constructor.");
        try {
            handlers = new HashMap<String, List<SignedDocumentHandler>>();
            
            ConfigManager configManager = ConfigManager.getInstance();
            
            connectKey = configManager.getString(NAMESPACE, "connectKey");
            supportingEmailAddress = configManager.getString(NAMESPACE, "supportingEmailAddress");
            fromEmailAddress = configManager.getString(NAMESPACE, "fromEmailAddress");
            emailBodyTemplate = configManager.getString(NAMESPACE, "emailBodyTemplate");
            emailSubjectTemplate = configManager.getString(NAMESPACE, "emailSubjectTemplate");
            
            Property property = configManager.getPropertyObject(NAMESPACE, "handlers");
    
            ObjectFactory handlerFactory = new ObjectFactory(new ConfigManagerSpecificationFactory(HANDLER_NAMESPACE),
                    ObjectFactory.BOTH);
    
            Enumeration<String> names = property.propertyNames();
            while (names.hasMoreElements()) {
                String templateId = names.nextElement();
                List<SignedDocumentHandler> handlersForTemplate = new ArrayList<SignedDocumentHandler>();
    
                String[] handlerKeys = property.getValues(templateId);
    
                for (String key : handlerKeys) {
                    SignedDocumentHandler handler = (SignedDocumentHandler) handlerFactory.createObject(key);
                    handlersForTemplate.add(handler);
                }
                handlers.put(templateId, handlersForTemplate);
            }
        } catch(Exception e) {
            log.error(e.getMessage(), e);
            log.debug("Leave method " + NAMESPACE + " Constructor.");
            throw e;
        }
        log.debug("Leave method " + NAMESPACE + " Constructor.");
    }
    /**
     * Send email to the configured supporting email address.
     * @param subject - The email subject.
     * @param body - The email body.
     */
    private void sendMailToSupport(String subject, String body) {
        try {
            TCSEmailMessage mail = new TCSEmailMessage();
            mail.setFromAddress(fromEmailAddress);
            mail.setSubject(subject);
            mail.setBody(body);
            mail.addToAddress(supportingEmailAddress, TCSEmailMessage.TO);
            mail.setContentType("text/html");
            EmailEngine.send(mail);
        } catch (Exception e) {
            log.error("error occur during the send mail to support", e);
        }
    }
    /**
     * Format the email message to replace all the variables.
     * @param envelope the docusign envelope entity.
     * @param templateMessage the email template message.
     * @param error the error message.
     * @return the formatted email message.
     */
    private String formatEmailMessage(DocuSignEnvelope envelope, String templateMessage, String error) {
        String content = templateMessage.replace("${envelopeId}", envelope.getEnvelopeId());
        content = content.replace("${userId}", String.valueOf(envelope.getUserId()));
        content = content.replace("${templateId}", envelope.getTemplateId());
        content = content.replace("${error}", error);
        return content;
    }
    /**
     * Given the notification from the DocuSignConnect,
     * update the envelope status and call the handler to perform the extra logic for each document.
     * @throws IOException
     *    If it fails to write the content to the response
     */
    protected void dbProcessing() throws IOException {
        if (!connectKey.equals(getRequest().getParameter("connectKey"))) {
            // log error and do nothing.
            log.error(CONNECT_KEY_NOT_PRESENT);
            // send response
            writeResponse(HttpStatus.SC_NOT_FOUND, CONNECT_KEY_NOT_PRESENT);
            return;
        }
        log.debug("Enter method " + NAMESPACE + "#dbProcessing() the paramters[connectKey=."+connectKey+"]");
        try {
            InputStream input = getRequest().getInputStream();

            Map<String, String> info = new HashMap<String, String>();
            Map<String, String> tabs = new HashMap<String, String>();

            if (parseNotification(input, info, tabs)) {

                String envelopeId = info.get("envelopeId");
                if (envelopeId != null && envelopeId.trim().length() > 0) {
                    DocuSignEnvelopeDAO dao = DAOUtil.getFactory().getDocuSignEnvelopeDAO();
                    DocuSignEnvelope envelope = dao.completeEnvelope(envelopeId);
    
                    if (envelope != null) {
                        try {
                            log.info("envelopeId = " + envelopeId + ", userId = " + envelope.getUserId() +
                                    ", templateId = " + envelope.getTemplateId());
                            if (!handlers.containsKey(envelope.getTemplateId())) {
                                log.warn("there is no handler exist with the template id " + envelope.getTemplateId());
                            } else {
                                for (SignedDocumentHandler handler : handlers.get(envelope.getTemplateId())) {
                                    handler.handleDocument(envelope.getUserId(), tabs);
                                }
                            }
                        } catch (HandlerPermanentErrorException e) {
                            log.error(e.getMessage(), e);
                            writeResponse(HttpStatus.SC_OK, e.getLocalizedMessage());
                            //we should send email to support
                            String subject = formatEmailMessage(envelope, this.emailSubjectTemplate, e.getMessage());
                            String body = formatEmailMessage(envelope, this.emailBodyTemplate, e.getMessage());
                            this.sendMailToSupport(subject, body);
                            
                            log.debug("Leave method " + NAMESPACE + "#dbProcessing(), the HttpCode=" +
                                    HttpStatus.SC_OK);
                            return;
    
                        } catch (HandlerTemporaryErrorException e) {
                            log.error(e.getMessage(), e);
                            writeResponse(HttpStatus.SC_INTERNAL_SERVER_ERROR, e.getLocalizedMessage());
                            //we should send email to support
                            String subject = formatEmailMessage(envelope, this.emailSubjectTemplate, e.getMessage());
                            String body = formatEmailMessage(envelope, this.emailBodyTemplate, e.getMessage());
                            this.sendMailToSupport(subject, body);
    
                            log.debug("Leave method " + NAMESPACE + "#dbProcessing(), the HttpCode=" +
                                    HttpStatus.SC_INTERNAL_SERVER_ERROR);
                            return;
                        }
                    } else {
                        log.error("we can't find the envelope record with envelopeId = " + envelopeId);
                    }
                } else {
                    log.error("the envelopeId is null or empty");
                }
            }
            writeResponse(HttpStatus.SC_OK, "Success");
            log.debug("Leave method " + NAMESPACE + "#dbProcessing(), the HttpCode=" +
                    HttpStatus.SC_OK);
        } catch (Exception e) {
            log.error(e.getMessage(), e);
            writeResponse(HttpStatus.SC_INTERNAL_SERVER_ERROR, e.getLocalizedMessage());
            log.debug("Leave method " + NAMESPACE + "#dbProcessing(), the HttpCode=" +
                    HttpStatus.SC_INTERNAL_SERVER_ERROR);
        }
    }
    /**
     * Used to parse the notifiation XML sent from the DocuSign connect.
     * If the status is not "Completed", it will return false directly.
     * If the status is "Completed", it will return true.
     * In addition it will set the tab values to the "tabs" map,
     * and set the envelopeId to the "info" map.
     * @param input - The input stream where the payload is read
     * @param info  - The map which is used to carry the information like "envelopeId".
     *                It will be set after the payload is parsed.
     * @param tabs  - The map which is used to store all the tab values.
     *              The keys are tab labels, and the values are tab values. 
     *              It will be populated after the payload is parsed.
     * @return True or false indicating whether the notification is an "envelope-completed" one.
     * @throws Exception - when any error occurs during the XML parsing.
     */
    private boolean parseNotification(InputStream input,
            Map<String, String> info, Map<String, String> tabs) throws Exception {
        InputSource source = new InputSource();
        source.setCharacterStream(new InputStreamReader(input));
        Document doc = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(source);

        XPath xPath = XPathFactory.newInstance().newXPath();

        String statusExpr = "/DocuSignEnvelopeInformation/EnvelopeStatus/Status";

        // read the status
        String status = xPath.compile(statusExpr).evaluate(doc);
        
        if (!"Completed".equals(status)) {
            return false;
        }
        
        String envelopeIdExpr = "/DocuSignEnvelopeInformation/EnvelopeStatus/EnvelopeID";

        // read the envelope ID
        String envelopeId = xPath.compile(envelopeIdExpr).evaluate(doc);
        
        info.put("envelopeId", envelopeId);
        
        NodeList nodeList = doc.getElementsByTagName("TabStatus");
        
        XPathExpression labelExpr = xPath.compile("TabLabel");
        XPathExpression valueExpr = xPath.compile("TabValue");
        for (int i = 0; i < nodeList.getLength(); i++) {
            Node node = nodeList.item(i);
            tabs.put(labelExpr.evaluate(node), valueExpr.evaluate(node));
            log.debug("tab label = " +labelExpr.evaluate(node) + " tab value=" + valueExpr.evaluate(node));
        }
        return true;
    }
    /**
     * Write message and HTTP status code to the response. The response content type is simply "text/plain".
     * @param status - The HTTP status code of the response
     * @param localizedMessage - The message as the response body, could be empty string.
     * @throws IOException  - If it fails to write the content to the response
     */
    private void writeResponse(int status, String localizedMessage) throws IOException {
        TCResponse response = getResponse();
        response.setContentType("plain/text");
        response.setStatus(status);
        PrintWriter responseWriter = response.getWriter();
        responseWriter.write(localizedMessage);
        //To commit the HttpServletResponse.
        response.flushBuffer();
    }

}
