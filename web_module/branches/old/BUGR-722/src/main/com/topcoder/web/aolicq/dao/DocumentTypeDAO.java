package com.topcoder.web.aolicq.dao;

import com.topcoder.web.aolicq.model.DocumentType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 73726 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 1, 2006
 */
public interface DocumentTypeDAO {
    DocumentType find(Integer id);

    List getDocumentTypes();
}
