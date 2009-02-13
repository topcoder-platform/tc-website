/*
 * ForumModeratePermission.java
 * 6 September 2002
 * 1.0
 *
 * Copyright (c) 2002, TopCoder, Inc.
 * All rights reserved.
 */


package com.topcoder.dde.forum;

import com.topcoder.security.policy.TCPermission;


/**
 * A permission for moderating discussion forums. Used internally by
 * DDEForumEJB.
 *
 * @version 1.0, 6 September 2002
 * @author  Albert Mao
 * @see     DDEForum
 */
public class ForumModeratePermission extends TCPermission {


    /**
     * Constructs a new <code>ForumModeratePermission</code> object.
     *
     * @param forumId the primary key of the forum
     */
    public ForumModeratePermission(long forumId) {
        super("com.topcoder.dde.forum.ForumModeratePermission " + forumId);
    }


}