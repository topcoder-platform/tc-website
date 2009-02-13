package com.topcoder.web.ejb.termsofuse;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 12, 2006
 */
public interface TermsOfUseLocal extends EJBLocalObject {


    long createTermsOfUse(String dataSource, String idDataSource);

    long getTermsOfUseTypeId(long termsOfUseId, String dataSource);

    void setTermsOfUseTypeId(long termsOfUseId,
                             long termsOfUseTypeId, String dataSource);

    String getText(long termsOfUseId, String dataSource);

    void setText(long termsOfUseId, String text, String dataSource);

}
