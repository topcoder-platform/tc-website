/*
 * Copyright (C) 2014 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import java.io.IOException;
import java.net.ConnectException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.docusign.esignature.DocuSignClient;
import com.docusign.esignature.json.RequestSignatureFromTemplate;
import com.docusign.esignature.json.Tabs;
import com.docusign.esignature.json.TemplateRole;
import com.docusign.esignature.json.TextTab;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.UnknownNamespaceException;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.DocuSignEnvelopeDAO;
import com.topcoder.web.common.model.DocuSignEnvelope;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.Constants;

/**
 * It is the controller that used to render the embedded signing page for the user to sign the document.
 *
 * Thread-Safety
 * The base class of this one is not thread-safe, so this class does not guarantee thread-safety.
 *
 * @author vangavroche, gonia_119
 * @version 1.0
 */
public class SignDocument extends ShortHibernateProcessor {
    /**
     * <p>A <code>Logger</code> to be used for logging.</p>
     */
    private static Logger log = Logger.getLogger(SignDocument.class);
    /**
     * The class name.
     */
    private final static String NAMESPACE = SignDocument.class.getName();

    /**
     * It is the account email address used for accessing the DocuSign API.
     */
    private final String docuSignAccountEmail;

    /**
     * It is the account password used to access the DocuSign API.
     */
    private final String docuSignAccountPassword;

    /**
     * It is the account integrator key used for accessing the DocuSign API.
     */
    private final String docuSignIntegratorKey;

    /**
     * The docusign client user id.
     */
    private static final String DOCUSIGN_CLIENT_USER_ID = "Member";

    /**
     * The default template role name to send to docusign.
     */
    private static final String DEFAULT_ROLE_NAME = "Member";

    /**
     * The generic error message that show to user interface.
     */
    private static final String GENERIC_ERROR_MESSAGE = "Error occurs when signing document with DocuSign";

    /**
     * The error message that template id is not provided.
     */
    private static final String TEMPLATE_ID_IS_NOT_PROVIDED = "Template ID is not provided";

    /**
     * This is the production server URL of DocuSign API.
     */
    private final String docuSignServerUrl;

    /**
     * It is the return URL used in the recipient view.
     * It supports variables - ${envelopeId}.
     */
    private final String returnUrl;

    /**
     * Default constructor of the class, which loads the configuration.
     * @throws UnknownNamespaceException
     *      when the configuration fails because the namespace is not correctly configured.
     */
    public SignDocument() throws UnknownNamespaceException {
        log.debug("Enter method " + NAMESPACE + " Constructor.");
        try {
            ConfigManager configManager = ConfigManager.getInstance();
            docuSignAccountEmail = configManager.getString(NAMESPACE, "docuSignAccountEmail");
            docuSignAccountPassword = configManager.getString(NAMESPACE, "docuSignAccountPassword");
            docuSignIntegratorKey = configManager.getString(NAMESPACE, "docuSignIntegratorKey");
            docuSignServerUrl = configManager.getString(NAMESPACE, "docuSignServerUrl");
            returnUrl = configManager.getString(NAMESPACE, "returnUrl");
        } catch(UnknownNamespaceException e) {
            log.error("error occur during create SignDocument", e);
            throw new UnknownNamespaceException(e.getMessage());
        }
        log.debug("Leave method " + NAMESPACE + " Constructor.");
    }
    /**
     * It is used to prepare the recipient view for the document signing and render the page
     * that uses IFrame to display the recipient view.
     * @throws PermissionException
     *      If the user is not logged-in
     * @throws IOException
     *      If the DocuSign API client libary fails to connect to or invoke the DocuSign API.
     */
    protected void dbProcessing() throws PermissionException, IOException {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }
        String templateId = getRequest().getParameter("templateId");
        log.debug("Enter method " + NAMESPACE + "#dbProcessing() the paramters[templateId="+templateId+"]");
        if (templateId == null || "".equals(templateId.trim())) {
            addError(Constants.ERROR_INFO, TEMPLATE_ID_IS_NOT_PROVIDED);
            log.error(TEMPLATE_ID_IS_NOT_PROVIDED);
            // set the page to be render
            setNextPage(Constants.SIGN_DOCUMENT); 
            setIsNextPageInContext(true);
            log.debug("Leave method " + NAMESPACE + " #dbProcessing() with jsp page " + Constants.SIGN_DOCUMENT);
            return;
        }
        // get tab params
        Map<String, String> tabParams = new HashMap<String, String>();
        Enumeration<String> paramNames = getRequest().getParameterNames();
        while (paramNames.hasMoreElements()) {
            String name = paramNames.nextElement();
            if (name.startsWith("tabs.")) {
                tabParams.put(name.substring(5), getRequest().getParameter(name));
            }
        }
        try {
            // login docusign
            DocuSignClient client = new DocuSignClient(docuSignAccountEmail, docuSignAccountPassword, docuSignIntegratorKey);
            client.setServerUrl(docuSignServerUrl);
    
            boolean isLoginSuccess = client.login();
            if (!isLoginSuccess) {
                addError(Constants.ERROR_INFO, GENERIC_ERROR_MESSAGE);
                log.error("Login docusign is failed, please check you account, password and docusign integrator key");
                // set the page to be render
                setNextPage(Constants.SIGN_DOCUMENT); 
                setIsNextPageInContext(true);
                log.debug("Leave method " + NAMESPACE + " #dbProcessing() with jsp page " + Constants.SIGN_DOCUMENT);
                return;
            }
       

            // Check if there's already a completed envelope for the requested
            // template ID and current user ID.
            DocuSignEnvelopeDAO dao = DAOUtil.getFactory().getDocuSignEnvelopeDAO();
            DocuSignEnvelope envelope = dao.findCompletedEnvelope(templateId, getUser().getId());
    
            // if a completed envelope exists, directly get the recipient view of it;
            // otherwise create a new envelope and get the recipient view of it:
    
            User user = DAOUtil.getFactory().getUserDAO().find(getUser().getId());
    
            if (envelope == null) {
    
                RequestSignatureFromTemplate request = new RequestSignatureFromTemplate();
                request.setTemplateId(templateId);
                request.setStatus("sent");
                request.setAdditionalProperties("enableWetSign", "false");  // disallow signature on paper
    
                // The recipient
                TemplateRole role = new TemplateRole();
                role.setName(user.getFirstName() + " " + user.getLastName());
                role.setEmail(user.getPrimaryEmailAddress().getAddress());
                role.setRoleName(DEFAULT_ROLE_NAME);
                role.setClientUserId(DOCUSIGN_CLIENT_USER_ID);
    
                tabParams.put("TopCoder Handle", user.getHandle()); // set the default TopCoder Handle tab value

                // Fill the tab parameters            
                List<TextTab> textTabs = new ArrayList<TextTab>();
                for (String key : tabParams.keySet()) {
                    TextTab tab = new TextTab();
                    tab.setTabLabel(key);
                    tab.setValue(tabParams.get(key));
                    textTabs.add(tab);
                }
    
                Tabs t = new Tabs();
                t.setTextTabs(textTabs);
                role.setAdditionalProperties("tabs", t);
                List<TemplateRole> roles = new ArrayList<TemplateRole>(1);
    
                roles.add(role);
                request.setTemplateRoles(roles);
    
                String envelopeId = client.requestSignatureFromTemplate(request);
                if (envelopeId == null || envelopeId.trim().length() == 0) {
                    addError(Constants.ERROR_INFO, GENERIC_ERROR_MESSAGE);
                    log.error("Can't find this document to sign, please check your templateId");
                    // set the page to be render
                    setNextPage(Constants.SIGN_DOCUMENT); 
                    setIsNextPageInContext(true);
                    log.debug("Leave method " + NAMESPACE + " #dbProcessing() with jsp page " + Constants.SIGN_DOCUMENT);
                    return;
                }
                // create a new DocuEnvelope and persist
                envelope = dao.newEnvelope(templateId, user.getId(), envelopeId);
    
            }
    
            // populate the return URL
            String generatedReturnUrl = returnUrl.replace("${envelopeId}", envelope.getEnvelopeId());
    
            String viewUrl = client.requestRecipientView(envelope.getEnvelopeId(),
                    user.getFirstName() + " " + user.getLastName(), user.getPrimaryEmailAddress().getAddress(),
                    DOCUSIGN_CLIENT_USER_ID, generatedReturnUrl, "none");
            if (viewUrl == null || viewUrl.trim().length() == 0) {
                addError(Constants.ERROR_INFO, GENERIC_ERROR_MESSAGE);
                log.error("May be you are not a valid recipient, please check your usename,client username and password");
                // set the page to be render
                setNextPage(Constants.SIGN_DOCUMENT); 
                setIsNextPageInContext(true);
                log.debug("Leave method " + NAMESPACE + " #dbProcessing() with jsp page " + Constants.SIGN_DOCUMENT);
                return;
            }
            getRequest().setAttribute("viewUrl", viewUrl);
        } catch(UnknownHostException e) {
            log.error(e.getMessage(), e);
            addError(Constants.ERROR_INFO, GENERIC_ERROR_MESSAGE);
            log.error("Login docusign is failed, please check the serverUrl that exist");
        } catch(ConnectException e) {
            log.error(e.getMessage(), e);
            addError(Constants.ERROR_INFO, GENERIC_ERROR_MESSAGE);
            log.error("Login docusign is failed, please check the serverUrl that can be connected");
        }
        // set the page to be render
        setNextPage(Constants.SIGN_DOCUMENT); 
        setIsNextPageInContext(true);
        log.debug("Leave method " + NAMESPACE + " #dbProcessing() with jsp page " + Constants.SIGN_DOCUMENT);
    }

}
