/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.project;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * <p>Local home interface for the project role terms of use EJB.</p>
 *
 * @author pulky
 * @version 1.0 (Configurable Contest Terms Release Assembly v1.0)
 */
public interface ProjectRoleTermsOfUseLocalHome extends EJBLocalHome {

    /**
     * Create method for the Project Role Terms of Use EJB
     *
     * @return an instance implementing <code>ProjectRoleTermsOfUseLocal</code>.
     * @throws CreateException if any error occurs during creation
     */
    public ProjectRoleTermsOfUseLocal create() throws CreateException;
}
