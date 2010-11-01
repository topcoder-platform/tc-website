/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao.hibernate;

import com.topcoder.web.studio.model.Medium;
import com.topcoder.web.studio.dao.MediumDAO;
import com.topcoder.web.common.dao.hibernate.GenericBase;

import java.util.List;

/**
 * <p>A default implementation of {@link MediumDAO} interface built on top of <code>Hibernate ORM</code> framework.</p>
 *
 * @author isv
 * @version 1.0
 * @since TopCoder Studio Modifications Assembly (Req# 5.1.5)
 */
public class MediumDAOHibernate extends GenericBase<Medium, Integer> implements MediumDAO {

    /**
     * <p>Constructs new <code>MediumDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public MediumDAOHibernate() {
    }
}
