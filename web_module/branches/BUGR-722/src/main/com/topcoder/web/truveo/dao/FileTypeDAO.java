package com.topcoder.web.truveo.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.truveo.model.TruveoFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 70119 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO extends GenericDAO<TruveoFileType, Integer> {

    List<TruveoFileType> getFileTypes();

    TruveoFileType find(String mimeType);
}
