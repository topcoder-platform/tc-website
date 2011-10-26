package com.topcoder.web.reg.validation;

import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.common.dao.DAOUtil;
import com.topcoder.web.common.model.User;
import com.topcoder.web.common.validation.StringInput;
import com.topcoder.web.common.validation.ValidationResult;
import com.topcoder.web.reg.TCHibernateTestCase;
import com.topcoder.web.reg.TestUtils;

/**
 * @author dok
 * @version $Revision: 49967 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 9, 2006
 */
public class UserNameValidatorTestCase extends TCHibernateTestCase {
    protected static final Logger log = Logger.getLogger(UserNameValidatorTestCase.class);

    User existingUser;

    public void setUp() {
        super.setUp();
        existingUser = DAOUtil.getFactory().getUserDAO().find("dok", true);
    }

/*    public void testUserNameNull() {
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
            new UserNameValidator(TestUtils.makeUser("dOk")).validate(new StringInput("dOk")).isValid());
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
}*/

    public void testNewUserMixedHandle() {
        UserNameValidator v = new UserNameValidator(TestUtils.makeUser("d-d3(3"));
        ValidationResult r = v.validate(new StringInput("d-d3(3"));
        assertTrue("validation didn't accept a valid mixed char username", r.isValid());
    }


}