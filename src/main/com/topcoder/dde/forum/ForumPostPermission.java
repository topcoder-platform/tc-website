/*
 * ForumPostPermission.java
 * 6 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.forum;

import com.topcoder.security.policy.TCPermission;


/**
 * A permission for posting to discussion forums. Used internally by
 * DDEForumEJB.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     DDEForum
 */
public class ForumPostPermission extends TCPermission {


    /**
     * Constructs a new <code>ForumPostPermission</code> object.
     *
     * @param forumId the primary key of the forum
     */
    public ForumPostPermission(long forumId) {
        super("com.topcoder.dde.forum.ForumPostPermission " + forumId);
    }


}