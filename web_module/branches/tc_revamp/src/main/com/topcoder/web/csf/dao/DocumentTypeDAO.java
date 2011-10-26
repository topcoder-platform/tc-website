package com.topcoder.web.csf.dao;


import com.topcoder.web.csf.model.DocumentType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public interface DocumentTypeDAO {
    DocumentType find(Integer id);

    List getDocumentTypes();
}
