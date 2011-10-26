/*
 * Copyright (C) 2004 - 2009 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBException;
import javax.ejb.EJBLocalObject;

/**
 * <p>Local interface for the terms of use EJB.</p>
 *
 * <p>
 *   Version 1.1 (Configurable Contest Terms Release Assembly v1.0) Change notes:
 *   <ol>
 *     <li>Added support for new columns in terms_of_use table.</li>
 *     <li>Refactored methods to allos usage of <code>TermsOfUseEntity</code>.</li>
 *     <li>Deprecated old methods.</li>
 *   </ol>
 * </p>
 *
 * @author pulky
 * @version 1.1
 */
public interface TermsOfUseLocal extends EJBLocalObject {

    /**
     * This method will create/update terms of use entity.
     *
     * If the object contains an id, the method will attempt an update, otherwise it will calculate an id and attempt
     * an insertion.
     *
     * @param terms a <code>TermsOfUseEntity</code> containing required information for creation/update.
     * @param dataSource a <code>String</code> containing the datasource.
     *
     * @return a <code>TermsOfUseEntity</code> with updated id attribute.
     * @throws EJBException if any error occurs
     *
     * @since 1.1
     */
    TermsOfUseEntity updateTermsOfUse(TermsOfUseEntity terms, String dataSource);

    /**
     * This method will retrieve a terms of use entity from the database.
     *
     * @param termsOfUseId a <code>long</code> containing the terms of use id to retrieve.
     * @param dataSource a <code>String</code> containing the datasource.
     *
     * @return a <code>TermsOfUseEntity</code> with the requested terms of use or null if not found.
     * @throws EJBException if any error occurs.
     *
     * @since 1.1
     */
    TermsOfUseEntity getEntity(long termsOfUseId, String dataSource);

    /**
     * @deprecated since 1.1
     */
    long getTermsOfUseTypeId(long termsOfUseId, String dataSource);

    /**
     * @deprecated since 1.1
     */
    void setTermsOfUseTypeId(long termsOfUseId,
                             long termsOfUseTypeId, String dataSource);

    /**
     * @deprecated since 1.1
     */
    String getText(long termsOfUseId, String dataSource);

    /**
     * @deprecated since 1.1
     */
    void setText(long termsOfUseId, String text, String dataSource);

}
