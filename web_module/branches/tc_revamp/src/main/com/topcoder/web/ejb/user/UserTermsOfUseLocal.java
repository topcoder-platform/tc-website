package com.topcoder.web.ejb.user;

import javax.ejb.EJBLocalObject;

/**
 * @author cucu
 */
public interface UserTermsOfUseLocal extends EJBLocalObject {

    public void createUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource);

    public void removeUserTermsOfUse(long userId, long _terms_of_use_id, String dataSource);

    public boolean hasTermsOfUse(long userId, long termsOfUseId, String dataSource);

    public boolean hasTermsOfUseBan(long userId, long termsOfUseId, String dataSource);
}
