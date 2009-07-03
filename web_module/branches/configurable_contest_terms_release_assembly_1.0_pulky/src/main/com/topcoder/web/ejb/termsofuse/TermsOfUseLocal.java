package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface TermsOfUseLocal extends EJBLocalObject {


    TermsOfUseEntity updateTermsOfUse(TermsOfUseEntity terms, String dataSource);

    TermsOfUseEntity getEntity(long termsOfUseId, String dataSource);

    /**
     * @param termsOfUseId
     * @param dataSource
     * @return
     * @deprecated since 1.1
     */
    long getTermsOfUseTypeId(long termsOfUseId, String dataSource);

    /**
     * @param termsOfUseId
     * @param termsOfUseTypeId
     * @param dataSource
     * @deprecated since 1.1
     */
    void setTermsOfUseTypeId(long termsOfUseId,
                             long termsOfUseTypeId, String dataSource);

    /**
     * @param termsOfUseId
     * @param dataSource
     * @return
     * @deprecated since 1.1
     */
    String getText(long termsOfUseId, String dataSource);

    /**
     * @param termsOfUseId
     * @param text
     * @param dataSource
     * @deprecated since 1.1
     */
    void setText(long termsOfUseId, String text, String dataSource);

}
