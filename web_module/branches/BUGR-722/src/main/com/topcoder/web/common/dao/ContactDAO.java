package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Contact;

/**
 * @author dok
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: May 11, 2006
 */
public interface ContactDAO {

    Contact find(Long id);

    void saveOrUpdate(Contact u);

}
