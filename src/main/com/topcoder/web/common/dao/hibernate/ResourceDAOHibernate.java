/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.common.dao.hibernate;

import com.topcoder.web.common.dao.ResourceDAO;
import com.topcoder.web.common.model.comp.Resource;
import org.hibernate.Session;

/**
 * <p>Resource DAO implementation.</p>
 * 
 * @author isv
 * @version 1.0 (Replatforming Studio Release 1 Assembly)
 */
public class ResourceDAOHibernate extends Base implements ResourceDAO {

    /**
     * <p>Constructs new <code>ResourceDAOHibernate</code> instance. This implementation does nothing.</p>
     */
    public ResourceDAOHibernate() {
        super();
    }

    /**
     * <p>Constructs new <code>ResourceDAOHibernate</code> instance.</p>
     * 
     * @param session a <code>Session</code> providing current session. 
     */
    public ResourceDAOHibernate(Session session) {
        super(session);
    }

    /**
     * <p>Creates new resource.</p>
     *
     * @param resource a <code>Resource</code> to be created.
     * @return created resource.
     */
    public Resource createResource(Resource resource) {
        saveOrUpdate(resource);
        return resource;
    }
}
