package com.topcoder.web.aolicq.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.aolicq.model.AolicqFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO extends GenericDAO<AolicqFileType, Integer> {

    List<AolicqFileType> getFileTypes();

    AolicqFileType find(String mimeType);
}
