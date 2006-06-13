package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;
import javax.ejb.FinderException;
import java.util.Collection;

/**
 * The local home interface representing the CMP bean for the doc_forum_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDocForumXrefHome extends EJBLocalHome {

    /**
     * The EJB reference name.
     */
    public static final String EJB_REF_NAME = "java:comp/env/ejb/DDEDocForumXrefEJB";

    /**
     * Locates an entity object using a primary key.
     *
     * @param key                   the primary key value to find.
     * @return the local interface that represents an entity object.
     * @throws FinderException      an application level error occurred during the find operation.
     */
    LocalDDEDocForumXref findByPrimaryKey(Long key) throws FinderException;

    /**
     * Creates an entity object.
     *
     * @param topicId               topic id.
     * @param compDocumentation     compDocumentation.
     * @return the local interface of the created entity object.
     * @throws CreateException      an application level error occurred during the create operation.
     */
    LocalDDEDocForumXref create(long topicId, LocalDDECompDocumentation compDocumentation) throws CreateException;

    /**
     * Returns a Collection of LocalDDEDocForumXref with the given document id.
     *
     * @param documentId            document id.
     * @return a Collection of local interfaces (LocalDDEDocForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByDocumentId(long documentId) throws FinderException;

    /**
     * Returns a Collection of LocalDDEDocForumXref with the given topic id.
     *
     * @param topicId               topic id.
     * @return a Collection of local interfaces (LocalDDEDocForumXref).
     * @throws FinderException      an application level error occurred during the find operation.
     */
    Collection findByTopicId(long topicId) throws FinderException;

}
