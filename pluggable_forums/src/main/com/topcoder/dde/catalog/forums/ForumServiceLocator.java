/*
 * Copyright (C) 2008 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.dde.catalog.forums;

import com.topcoder.web.ejb.forums.Forums;

/**
 * 
 * @version 1.0
 * @author Bauna
 */
public interface ForumServiceLocator {
	Forums createForumService() throws ForumsServiceCreationException;
}
