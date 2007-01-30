package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.Response;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 18, 2007
 */
public interface ResponseDAO {

    Event find(Long id);

    void saveOrUpdate(Response r);

}
