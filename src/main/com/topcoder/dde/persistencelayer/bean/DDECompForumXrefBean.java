package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompVersions;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the comp_forum_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDECompForumXrefBean extends DDEBaseCompVersionsBean {

    /**
     * Creates a new instance.
     */
    public DDECompForumXrefBean() {
    }

    /**
     * Gets the forum type.
     *
     * @return forum type.
     */
    public abstract int getForumType();

    /**
     * Sets the forum type.
     *
     * @param forumType     forum type.
     */
    public abstract void setForumType(int forumType);

    /**
     * Gets the forum id.
     *
     * @return forum id.
     */
    public abstract long getForumId();

    /**
     * Sets the forum id.
     *
     * @param forumId       forum id.
     */
    public abstract void setForumId(long forumId);

    /**
     * Creates an entity object.
     *
     * @param forumId               forum id.
     * @param forumType             forum type.
     * @param compVersions          compVersions.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long forumId, int forumType, LocalDDECompVersions compVersions) throws CreateException {
        setPrimaryKey();
        setForumId(forumId);
        setForumType(forumType);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param forumId               forum id.
     * @param forumType             forum type.
     * @param compVersions          compVersions.
     */
    public void ejbPostCreate(long forumId, int forumType, LocalDDECompVersions compVersions) {
        setCompVersions(compVersions);
    }

}
