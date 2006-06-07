package com.topcoder.dde.persistencelayer.interfaces;

import javax.ejb.EJBLocalObject;

/**
 * The local interface representing the CMP bean for the doc_forum_xref table.
 *
 * @version     1.0
 * @author      Timur Zambalayev
 */
public interface LocalDDEDocForumXref extends EJBLocalObject {

    /**
     * Gets the compDocumentation (CMR).
     *
     * @return compDocumentation.
     */
    LocalDDECompDocumentation getCompDocumentation();

    /**
     * Gets the topic id.
     *
     * @return topic id.
     */
    long getTopicId();

}
