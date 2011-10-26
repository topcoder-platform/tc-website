package com.topcoder.web.csf.dao;


import com.topcoder.web.csf.model.CSFFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO {
    CSFFileType find(Integer id);

    List getFileTypes();

    CSFFileType find(String mimeType);
}
