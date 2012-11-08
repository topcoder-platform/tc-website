/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common;

import com.cronos.termsofuse.dao.ProjectTermsOfUseDao;
import com.cronos.termsofuse.dao.TermsOfUseDao;
import com.cronos.termsofuse.dao.UserTermsOfUseDao;
import com.cronos.termsofuse.dao.impl.ProjectTermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.TermsOfUseDaoImpl;
import com.cronos.termsofuse.dao.impl.UserTermsOfUseDaoImpl;
import com.topcoder.configuration.ConfigurationObject;
import com.topcoder.configuration.persistence.ConfigurationFileManager;

/**
 * <p>This class provide some static methods for creating terms of use component.</p>
 *
 * @author flexme
 * @version 1.0
 */
public final class TermsOfUseUtil {
    /**
     * Private empty constructor.
     */
    private TermsOfUseUtil() {
        
    }
    
    /**
     * Gets the <code>TermsOfUseDao</code> instance.
     * 
     * @return the <code>TermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    public static TermsOfUseDao getTermsOfUseDao() throws Exception {
        return new TermsOfUseDaoImpl(getConfiguration("termsOfUseDao"));
    }
    
    /**
     * Gets the <code>UserTermsOfUseDao</code> instance.
     * 
     * @return the <code>UserTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    public static UserTermsOfUseDao getUserTermsOfUseDao() throws Exception {
        return new UserTermsOfUseDaoImpl(getConfiguration("userTermsOfUseDao"));
    }
    
    /**
     * Gets the <code>ProjectTermsOfUseDao</code> instance.
     * 
     * @return the <code>ProjectTermsOfUseDao</code> instance.
     * @throws Exception if any error occurs
     */
    public static ProjectTermsOfUseDao getProjectTermsOfUseDao() throws Exception {
        return new ProjectTermsOfUseDaoImpl(getConfiguration("projectTermsOfUseDao"));
    }
    
    /**
     * Gets the configuration object by the configuration namespace.
     * @param namespace the configuration namespace
     * @return the configuration object
     * @throws Exception if any error occurs
     */
    private static ConfigurationObject getConfiguration(String namespace) throws Exception {
        return new ConfigurationFileManager(
                "com/topcoder/util/config/ConfigManager.properties").getConfiguration(namespace)
                .getChild(namespace);
    }
}
