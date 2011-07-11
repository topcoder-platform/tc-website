/*
 * Copyright (C) 2011 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.dao.hibernate.DAOFactoryHibernate;

/**
 * The Utility class used to gets the <code>DAOFactory</code> instance.
 * 
 * @author TCSASSEMBER
 * @version 1.0
 * @since Replatforming Studio Release 5
 */
public class DAOUtil {
    public static DAOFactory getFactory() {
        return new DAOFactoryHibernate();
    }
}
