package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.Document;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public interface DocumentDAO {
    Document find(Long id);

}
