/*
 * Copyright (C) 2010 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.dto.Resource;

/**
 * <p>Resource DAO.</p>
 * 
 * @author isv
 * @version 1.0 (Replatforming Studio Release 1 Assembly)
 */
public interface ResourceDAO {

    /**
     * <p>Creates new resource.</p>
     * 
     * @param resource a <code>Resource</code> to be created. 
     * @return created resource.
     */
    Resource createResource(Resource resource);
}
