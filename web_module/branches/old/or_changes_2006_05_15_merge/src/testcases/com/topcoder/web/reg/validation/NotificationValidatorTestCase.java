package com.topcoder.web.reg.validation;

import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.model.Notification;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.common.validation.ListInput;

import java.util.List;
import java.util.ArrayList;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 12, 2006
 */
public class NotificationValidatorTestCase extends TCHibernateTestCase {
    public void testValid() {

        List l = Util.getFactory().getNotificationDAO().getNotifications();
        assertTrue("found a valid notification to be invalid",
                new NotificationValidator().validate(new ListInput(l)).isValid());
    }

    public void testInvalid() {
        Notification n = new Notification();
        n.setId(new Integer(9393));
        ArrayList a = new ArrayList();
        a.add(n);
        assertFalse("found an invalid notification to be valid",
                new NotificationValidator().validate(new ListInput(a)).isValid());
    }
}
