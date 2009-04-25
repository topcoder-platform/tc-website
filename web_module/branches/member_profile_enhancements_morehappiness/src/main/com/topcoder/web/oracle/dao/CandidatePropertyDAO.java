package com.topcoder.web.oracle.dao;


import com.topcoder.web.oracle.model.CandidateProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 22, 2007
 */
public interface CandidatePropertyDAO {
    CandidateProperty find(Integer id);

    List<CandidateProperty> getProperties();

}
