package com.topcoder.web.openaim.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.openaim.model.OpenAIMFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO extends GenericDAO<OpenAIMFileType, Integer> {

    List<OpenAIMFileType> getFileTypes();

    OpenAIMFileType find(String mimeType);
}
