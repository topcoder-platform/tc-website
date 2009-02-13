package com.topcoder.web.aolicq.dao;

import com.topcoder.web.aolicq.model.Document;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public interface DocumentDAO {
    Document find(Long id);

}
