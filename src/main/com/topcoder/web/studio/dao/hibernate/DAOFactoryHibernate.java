/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.common.dao.EventRegistrationDAO;
import com.topcoder.web.common.dao.ImageDAO;
import com.topcoder.web.common.dao.PathDAO;
import com.topcoder.web.common.dao.TermsOfUseDAO;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.dao.hibernate.EventRegistrationDAOHibernate;
import com.topcoder.web.common.dao.hibernate.ImageDAOHibernate;
import com.topcoder.web.common.dao.hibernate.PathDAOHibernate;
import com.topcoder.web.common.dao.hibernate.TermsOfUseDAOHibernate;
import com.topcoder.web.common.dao.hibernate.UserDAOHibernate;
import com.topcoder.web.common.dao.hibernate.NotificationDAOHibernate;
import com.topcoder.web.studio.dao.DAOFactory;
import com.topcoder.web.studio.dao.FileTypeCatalogDAO;
import com.topcoder.web.studio.dao.ProjectDAO;
import com.topcoder.web.studio.dao.ResourceDAO;
import com.topcoder.web.studio.dao.ReviewDAO;
import com.topcoder.web.studio.dao.SubmissionDAO;
import com.topcoder.web.studio.dao.UploadDAO;
import com.topcoder.web.studio.dao.NotificationDAO;

/**
 * <p>Hibernate implementation for the DAO Factory.</p>
 *
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class DAOFactoryHibernate implements DAOFactory {

    /**
     * Gets the <code>SubmissionDAO</code> instance.
     * 
     * @return the <code>SubmissionDAO</code> instance
     */
    public SubmissionDAO getSubmissionDAO() {
        return new SubmissionDAOHibernate();
    }

    /**
     * Gets the <code>UploadDAO</code> instance.
     * 
     * @return the <code>UploadDAO</code> instance
     */
    public UploadDAO getUploadDAO() {
        return new UploadDAOHibernate();
    }

    /**
     * Gets the <code>ProjectDAO</code> instance.
     * 
     * @return the <code>ProjectDAO</code> instance
     */
    public ProjectDAO getProjectDAO() {
        return new ProjectDAOHibernate();
    }

    /**
     * Gets the <code>FileTypeCatalogDAO</code> instance.
     * 
     * @return the <code>FileTypeCatalogDAO</code> instance
     */
    public FileTypeCatalogDAO getFileTypeCatalogDAO() {
        return new FileTypeCatalogDAOHibernate();
    }

    /**
     * Gets the <code>UserDAO</code> instance.
     * 
     * @return the <code>UserDAO</code> instance
     */
    public UserDAO getUserDAO() {
        return new UserDAOHibernate();
    }

    /**
     * Gets the <code>TermsOfUseDAO</code> instance.
     * 
     * @return the <code>TermsOfUseDAO</code> instance
     */
    public TermsOfUseDAO getTermsOfUse() {
        return new TermsOfUseDAOHibernate();
    }
    
    /**
     * Gets the <code>EventRegistrationDAO</code> instance.
     * 
     * @return the <code>EventRegistrationDAO</code> instance
     */
    public EventRegistrationDAO getEventRegistrationDAO() {
        return new EventRegistrationDAOHibernate();
    }
    
    /**
     * Gets the <code>ResourceDAO</code> instance.
     * 
     * @return the <code>ResourceDAO</code> instance
     */
    public ResourceDAO getResourceDAO() {
        return new ResourceDAOHibernate();
    }
    
    /**
     * Gets the <code>ImageDAO</code> instance.
     * 
     * @return the <code>ImageDAO</code> instance
     */
    public ImageDAO getImageDAO() {
        return new ImageDAOHibernate();
    }
    
    /**
     * Gets the <code>PathDAO</code> instance.
     * 
     * @return the <code>PathDAO</code> instance
     */
    public PathDAO getPathDAO() {
        return new PathDAOHibernate();
    }
    
    /**
     * Gets the <code>ReviewDAO</code> instance.
     * 
     * @return the <code>ReviewDAO</code> instance
     */
    public ReviewDAO getReviewDAO() {
        return new ReviewDAOHibernate();
    }

    /**
     * Gets the <code>NotificationDAO</code> instance.
     * 
     * @return the <code>NotificationDAO</code> instance
     */
    public NotificationDAO getNotificationDAO() {
        return new NotificationDAOHibernate();
    }
}
