package com.topcoder.web.winformula.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.winformula.model.WinformulaFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO extends GenericDAO<WinformulaFileType, Integer> {

    List<WinformulaFileType> getFileTypes();

    WinformulaFileType find(String mimeType);
}
