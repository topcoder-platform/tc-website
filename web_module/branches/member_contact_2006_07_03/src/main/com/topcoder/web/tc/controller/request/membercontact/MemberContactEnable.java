package com.topcoder.web.tc.controller.request.membercontact;

import com.topcoder.shared.security.ClassResource;
import com.topcoder.web.common.HibernateProcessor;
import com.topcoder.web.common.PermissionException;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.tc.Constants;

public class MemberContactEnable extends HibernateProcessor {
    
    public static String ENABLE = "enable";
    
    protected void dbProcessing() throws Exception {
        if (!userIdentified()) {
            throw new PermissionException(getUser(), new ClassResource(this.getClass()));
        }

        boolean enable = getRequest().getParameter(ENABLE) != null;

        if (enable) {
            UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO().find(
                    getUser().getId(), Preference.MEMBER_CONTACT_PREFERENCE_ID);
            
            up.setValue("true");
            markForCommit();
            
            setNextPage(Constants.MEMBER_CONTACT_ENABLE_SUCCEEDED);
            setIsNextPageInContext(true);                    
        } else {
            setNextPage(Constants.MEMBER_CONTACT_ENABLE);
            setIsNextPageInContext(true);                    
        }
        
    }


}
