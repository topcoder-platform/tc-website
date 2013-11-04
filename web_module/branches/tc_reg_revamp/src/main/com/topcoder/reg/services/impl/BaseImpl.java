/*
 * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.reg.services.impl;

import javax.annotation.PostConstruct;

import org.springframework.jdbc.core.JdbcTemplate;

import com.topcoder.reg.RegistrationHelper;
import com.topcoder.reg.services.ConfigurationException;
import com.topcoder.util.log.Log;
import com.topcoder.util.log.LogFactory;
import com.topcoder.shared.util.logging.Logger;

/**
 * This class provides basic infrastructure.
 * <p>
 * <strong>Thread Safety:</strong> It will be thread-safe after injection.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
public abstract class BaseImpl {
    /**
     * {@link JdbcTemplate} instance, it'll be injected by spring.
     */
    protected JdbcTemplate jdbcTemplate;

    /**
     * Instance of Log for logging. It's injected by spring.
     */
    //protected Logger logger;
	private static final Logger logger = Logger.getLogger(BaseImpl.class);

    /**
     * This method validates success of IoC.
     * 
     * @throws ConfigurationException
     *             If there is any configuration error.
     */
    @PostConstruct
    public void checkConfiguration() throws ConfigurationException {
        RegistrationHelper.checkNotNull("jdbcTempalte", jdbcTemplate, ConfigurationException.class);
        //logger = LogFactory.getInstance().getLog("BaseImpl");
        //RegistrationHelper.checkNotNull("logger", logger, ConfigurationException.class);
    }

    /**
     * Getter of the name-sake field.
     * 
     * @return the value of name-sake field.
     */
    public JdbcTemplate getJdbcTemplate() {
        return jdbcTemplate;
    }

    /**
     * Setter of the name-sake field.
     * 
     * @param jdbcTemplate
     *            the name-sake field to set
     */
    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }



}
