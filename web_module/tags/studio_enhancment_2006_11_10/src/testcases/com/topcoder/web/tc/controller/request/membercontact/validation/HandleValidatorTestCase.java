package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.dao.UserDAO;
import com.topcoder.web.common.model.Email;
import com.topcoder.web.common.model.MemberContactBlackList;
import com.topcoder.web.common.model.Preference;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.model.UserPreference;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TCHibernateTestCase;

/**
 * @author cucu
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: July 24, 2006
 */
public class HandleValidatorTestCase extends TCHibernateTestCase {

    private HandleValidator validator;

    public void setUp() {
        super.setUp();
        UserDAO ud = DAOUtil.getFactory().getUserDAO();

        User user = ud.find("cucu", true, true);
        
        // user with member contact disabled 
        User u = ud.find("anees", true, true);
        UserPreference up = DAOUtil.getFactory().getUserPreferenceDAO().find(u.getId(), Preference.MEMBER_CONTACT_PREFERENCE_ID);
        up.setValue(String.valueOf(false));
        DAOUtil.getFactory().getUserPreferenceDAO().saveOrUpdate(up);

        // user with mc enabled but inactive email
        u = ud.find("bertman", true, true);
        up = DAOUtil.getFactory().getUserPreferenceDAO().find(u.getId(), Preference.MEMBER_CONTACT_PREFERENCE_ID);
        up.setValue(String.valueOf(true));
        DAOUtil.getFactory().getUserPreferenceDAO().saveOrUpdate(up);
        u.getPrimaryEmailAddress().setStatusId(Email.STATUS_ID_UNACTIVE);
        ud.saveOrUpdate(u);
        
        // chronoewk blocks user cucu
        u = ud.find("chronoewk", true, true);
        up = DAOUtil.getFactory().getUserPreferenceDAO().find(u.getId(), Preference.MEMBER_CONTACT_PREFERENCE_ID);
        up.setValue(String.valueOf(true));
        DAOUtil.getFactory().getUserPreferenceDAO().saveOrUpdate(up);
        MemberContactBlackList bl = DAOUtil.getFactory().getMemberContactBlackListDAO().findOrCreate(u, user);
        bl.setBlocked(true);
        DAOUtil.getFactory().getMemberContactBlackListDAO().saveOrUpdate(bl);
        
        
        validator = new HandleValidator(user);
    }

    public void testEmpty() {
        assertFalse("validated an empty handle", validator.validate(new StringInput(" ")).isValid());
    }

    public void testUnknown() {
        assertFalse("validated an unknown handle", validator.validate(new StringInput("aertjlk4893jk")).isValid());
    }

    public void testMemberContactDisabled() {
        assertFalse("validated a handle with MC disabled", validator.validate(new StringInput("anees")).isValid());
    }

    public void testMemberContactInvalidAddress() {
        assertFalse("validated a handle with invalid email address", 
        		validator.validate(new StringInput("bertman")).isValid());
    }

    public void testMemberContactBlocked() {
        assertFalse("validated a handle that is blocked", validator.validate(new StringInput("chronoewk")).isValid());
    }

}

