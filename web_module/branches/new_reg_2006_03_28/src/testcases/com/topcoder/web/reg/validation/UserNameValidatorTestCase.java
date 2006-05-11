package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.reg.TestUtils;
import com.topcoder.web.reg.dao.Util;
import com.topcoder.web.reg.model.User;
import junit.framework.TestCase;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class UserNameValidatorTestCase extends TestCase {
    protected static final Logger log = Logger.getLogger(UserNameValidatorTestCase.class);

    User existingUser;
    public void setUp() {
        existingUser = Util.getFactory().getUserDAO().find("dok");
    }


    public void testUserNameNull() {
        boolean gotException = false;
        try {
            new UserNameValidator(existingUser).validate(new StringInput(null)).isValid();
        } catch (NullPointerException e) {
            gotException = true;
        }
        assertFalse("got exception", gotException);
    }

    public void testNewUserExistingHandle() {
        assertFalse("validation didn't detect duplicate handle",
                new UserNameValidator(TestUtils.makeUser("dok")).validate(new StringInput("dOk")).isValid());
    }

    public void testNewUserPunctuationHandle() {
        assertFalse("validation didn't detect bad punctuation handle",
                new UserNameValidator(TestUtils.makeUser("----")).validate(new StringInput("----")).isValid());
    }

    public void testNewUserLongHandle() {
        assertFalse("validation didn't detect long handle",
                new UserNameValidator(TestUtils.makeUser("dokdokdokdokdokdokdok")).validate(new StringInput("dokdokdokdokdokdokdok")).isValid());
    }

    public void testNewUserShortHandle() {
        assertFalse("validation didn't detect short handle",
                new UserNameValidator(TestUtils.makeUser("d")).validate(new StringInput("d")).isValid());
    }

    public void testExistingUserBadHandle() {
        assertFalse("validation didn't detect short handle",
                new UserNameValidator(existingUser).validate(new StringInput("----")).isValid());
    }

    public void testJohnDethridgeHandle() {
        User dethridge = Util.getFactory().getUserDAO().find("John Dethridge");
        assertFalse("validation didn't allow us to grandfather dethridge in",
                new UserNameValidator(dethridge).validate(new StringInput(dethridge.getHandle())).isValid());
    }

    public void testNewUserWithSpacesHandle() {
        assertFalse("validation didn't detect spaces",
                new UserNameValidator(TestUtils.makeUser("d d")).validate(new StringInput("d d")).isValid());
    }



}