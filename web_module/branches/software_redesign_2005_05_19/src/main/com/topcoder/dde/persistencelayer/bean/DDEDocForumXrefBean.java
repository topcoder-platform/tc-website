package com.topcoder.dde.persistencelayer.bean;

import com.topcoder.dde.persistencelayer.interfaces.LocalDDECompDocumentation;

import javax.ejb.CreateException;

/**
 * The bean implementation class representing the CMP bean for the doc_forum_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public abstract class DDEDocForumXrefBean extends DDEBaseEntityBean {

    /**
     * Creates a new instance.
     */
    public DDEDocForumXrefBean() {
    }

    /**
     * Gets the compDocumentation (CMR).
     *
     * @return compDocumentation.
     */
    public abstract LocalDDECompDocumentation getCompDocumentation();

    /**
     * Sets the compDocumentation (CMR).
     *
     * @param compDocumentation     compDocumentation.
     */
    public abstract void setCompDocumentation(LocalDDECompDocumentation compDocumentation);

    /**
     * Gets the topic id.
     *
     * @return topic id.
     */
    public abstract long getTopicId();

    /**
     * Sets the topic id.
     *
     * @param topicId   topic id.
     */
    public abstract void setTopicId(long topicId);

    /**
     * Creates an entity object.
     *
     * @param topicId               topic id.
     * @param compDocumentation     compDocumentation.
     * @return the entity bean's primary key (should be null for CMP bean implementations).
     * @throws CreateException      an application level error occurred during the create operation.
     */
    public Long ejbCreate(long topicId, LocalDDECompDocumentation compDocumentation) throws CreateException {
        setPrimaryKey();
        setTopicId(topicId);
        return null;
    }

    /**
     * Creates an entity object.
     *
     * @param topicId               topic id.
     * @param compDocumentation     compDocumentation.
     */
    public void ejbPostCreate(long topicId, LocalDDECompDocumentation compDocumentation) {
        setCompDocumentation(compDocumentation);
    }

}
