package com.topcoder.web.openaim.dao;

import com.topcoder.web.openaim.model.MimeType;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 29, 2006
 */
public interface MimeTypeDAO {
    MimeType find(Integer id);

    MimeType find(String description);
}
