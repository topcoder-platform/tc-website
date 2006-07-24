package com.topcoder.web.tc.controller.request.membercontact.validation;

import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.Country;
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
        validator = new HandleValidator(DAOUtil.getFactory().getUserDAO().find("cucu", true, true));
    }

    public void testEmpty() {
        assertFalse("validated an empty handle", validator.validate(new StringInput(" ")).isValid());
    }

    public void testUnknown() {
        assertFalse("validated an unknown handle", validator.validate(new StringInput("aertjlk4893jk")).isValid());
    }

    public void testMemberContactDisabled() {
    	// TODO: choose an appropiate handle
        assertFalse("validated a handle with MC disabled", validator.validate(new StringInput("chronoewk")).isValid());
    }

    public void testMemberContactInvalidAddress() {
    	// TODO: choose an appropiate handle
        assertFalse("validated a handle with invalid email address", 
        		validator.validate(new StringInput("chronoewk")).isValid());
    }

    public void testMemberContactBlocked() {
    	// TODO: choose an appropiate handle
        assertFalse("validated a handle that is blocked", validator.validate(new StringInput("chronoewk")).isValid());
    }

}

