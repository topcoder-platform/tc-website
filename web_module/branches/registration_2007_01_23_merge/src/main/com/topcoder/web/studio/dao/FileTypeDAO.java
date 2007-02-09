package com.topcoder.web.studio.dao;

import com.topcoder.web.studio.model.StudioFileType;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Aug 23, 2006
 */
public interface FileTypeDAO {
    StudioFileType find(Integer id);

    List getFileTypes();

    StudioFileType find(String mimeType);
}
