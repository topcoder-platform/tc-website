package com.topcoder.web.openaim.validation;

import com.topcoder.web.common.validation.ListInput;
import com.topcoder.web.openaim.TCHibernateTestCase;
import com.topcoder.web.openaim.dao.OpenAIMDAOUtil;
import com.topcoder.web.openaim.model.OpenAIMFileType;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 25, 2006
 */
public class FileTypeValidatorTestCase extends TCHibernateTestCase {

    public void testValid() {
        List a = OpenAIMDAOUtil.getFactory().getFileTypeDAO().getFileTypes();
        List b = new ArrayList(a.size());
        for (Iterator it = a.iterator(); it.hasNext();) {
            b.add(((OpenAIMFileType) it.next()).getId().toString());
        }

        assertTrue("Did not validate vaild file types", new FileTypeValidator().validate(new ListInput(b)).isValid());
    }

    public void testInvalid() {
        ArrayList a = new ArrayList();
        a.add("-666");
        assertFalse("Did not validate vaild file types", new FileTypeValidator().validate(new ListInput(a)).isValid());
    }
}
