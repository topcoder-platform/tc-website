/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.tc.controller.request.docusign;

import com.topcoder.util.config.ConfigManager;
import com.topcoder.util.config.ConfigManagerException;

import com.cronos.termsofuse.dao.ProjectTermsOfUseDao;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.ProjectTermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.cronos.termsofuse.model.TermsOfUse;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;

import com.topcoder.shared.dataAccess.DataAccess;
import com.topcoder.shared.dataAccess.Request;
import com.topcoder.shared.dataAccess.resultSet.ResultSetContainer;
import com.topcoder.shared.security.ClassResource;
import com.topcoder.shared.util.DBMS;
import com.topcoder.shared.util.ApplicationServer;
import com.topcoder.web.common.StringUtils;
import com.topcoder.web.common.HSRegistrationHelper;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.ShortHibernateProcessor;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;

import com.topcoder.web.tc.Constants;

import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.*;
import javax.xml.transform.*;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

public class DocuSignConnect extends ShortHibernateProcessor {

    private static final String DEFAULT_DOCUSIGN_NAMESPACE = "com.topcoder.web.tc.controller.request.docusign.DocuSignConnect";

    private UserTermsOfUseDao userTermsOfUseDao = null;

    /**
     * Handle http request.
     * 
     * @throws Exception if any exception occurs.
     */
    protected void dbProcessing() throws Exception {

        String securityKey = null;

        ConfigManager configManager = ConfigManager.getInstance();
        if (configManager.existsNamespace(DEFAULT_DOCUSIGN_NAMESPACE)) {
            securityKey = (String) configManager.getProperty(DEFAULT_DOCUSIGN_NAMESPACE, "docusign_security_key");
        }

        System.out.println("DocuSignConnect securityKey " + securityKey);
        if (securityKey == null || !securityKey.equals(StringUtils.checkNull(getRequest().getParameter("docusign_security_key")))) {
            return;
        }

        //Get Response
        Document document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(getRequest().getInputStream());
        document.getDocumentElement().normalize();


        String templateName = null;
        NodeList templateNameNodes = document.getElementsByTagName("TemplateName");
        if (templateNameNodes.getLength() > 0) {
            String value = templateNameNodes.item(0).getFirstChild().getNodeValue();
            if (value != null) {
                templateName = value.trim();
            }
        }
        if (templateName == null || !templateName.equals("Appirio Mutual NDA")) {
            return;
        }

        String handleName = null;
        NodeList fieldNodes = document.getElementsByTagName("field");
        for(int i=0;i<fieldNodes.getLength();i++) {
            Node node = fieldNodes.item(i);
            NamedNodeMap atts = node.getAttributes();
            Node att = atts.getNamedItem("name");
            String nodeValue = att.getNodeValue();
            if (nodeValue.equals("UserName")) {
                NodeList childrenNodes = node.getChildNodes();
                handleName = childrenNodes.item(0).getFirstChild().getNodeValue();
            }
        }

        Connection con = DBMS.getConnection(DBMS.JTS_OLTP_DATASOURCE_NAME);
        PreparedStatement stmt = null;
        ResultSet resultSet = null;
        long userId = 0;
        try {
            stmt = con.prepareStatement("select user_id from user where handle='" + handleName + "'");
            resultSet = stmt.executeQuery();
            if (resultSet.next()) {
                userId = resultSet.getLong(1);
            }
        } finally {
            DBMS.close(resultSet);
            DBMS.close(stmt);
            DBMS.close(con);
        }

        UserTermsOfUseDao userTermsOfUseDao = getUserTermsOfUseDao();
        userTermsOfUseDao.createUserTermsOfUse(userId, 21113);
        
    }

    private UserTermsOfUseDao getUserTermsOfUseDao() throws Exception {
        if (userTermsOfUseDao == null) {
            userTermsOfUseDao = new UserTermsOfUseDaoImpl(getConfiguration(Constants.USER_TERMS_OF_USE_DAO_NS));
        }
        return userTermsOfUseDao;
    }

    private ConfigurationObject getConfiguration(String namespace) throws Exception {
        return new ConfigurationFileManager(
                Constants.CONFIGURATION_FILE).getConfiguration(namespace)
                .getChild(namespace);
    }

}
