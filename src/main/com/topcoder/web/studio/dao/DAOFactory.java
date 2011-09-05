/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.common.dao.EventRegistrationDAO;
import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.dao.PathDAO;
import com.topcoder.web.common.dao.TermsOfUseDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.NotificationDAO;

/**
 * <p>An interface for the DAO Factory.</p>
 *
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public interface DAOFactory {
    
    /**
     * Gets the <code>ProjectDAO</code> instance.
     * 
     * @return the <code>ProjectDAO</code> instance
     */
    ProjectDAO getProjectDAO();
    
    /**
     * Gets the <code>SubmissionDAO</code> instance.
     * 
     * @return the <code>SubmissionDAO</code> instance
     */
    SubmissionDAO getSubmissionDAO();
    
    /**
     * Gets the <code>UploadDAO</code> instance.
     * 
     * @return the <code>UploadDAO</code> instance
     */
    UploadDAO getUploadDAO();
    
    /**
     * Gets the <code>FileTypeCatalogDAO</code> instance.
     * 
     * @return the <code>FileTypeCatalogDAO</code> instance
     */
    FileTypeCatalogDAO getFileTypeCatalogDAO();
    
    /**
     * Gets the <code>UserDAO</code> instance.
     * 
     * @return the <code>UserDAO</code> instance
     */
    UserDAO getUserDAO();
    
    /**
     * Gets the <code>TermsOfUseDAO</code> instance.
     * 
     * @return the <code>TermsOfUseDAO</code> instance
     */
    TermsOfUseDAO getTermsOfUse();
    
    /**
     * Gets the <code>EventRegistrationDAO</code> instance.
     * 
     * @return the <code>EventRegistrationDAO</code> instance
     */
    EventRegistrationDAO getEventRegistrationDAO();
    
    /**
     * Gets the <code>ResourceDAO</code> instance.
     * 
     * @return the <code>ResourceDAO</code> instance
     */
    ResourceDAO getResourceDAO();
    
    /**
     * Gets the <code>ImageDAO</code> instance.
     * 
     * @return the <code>ImageDAO</code> instance
     */
    ImageDAO getImageDAO();
    
    /**
     * Gets the <code>PathDAO</code> instance.
     * 
     * @return the <code>PathDAO</code> instance
     */
    PathDAO getPathDAO();
    
    /**
     * Gets the <code>ReviewDAO</code> instance.
     * 
     * @return the <code>ReviewDAO</code> instance
     */
    ReviewDAO getReviewDAO();

    /**
     * Gets the <code>NotificationDAO</code> instance.
     * 
     * @return the <code>NotificationDAO</code> instance
     */
    NotificationDAO getNotificationDAO();
}

