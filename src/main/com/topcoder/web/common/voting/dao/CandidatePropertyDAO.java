package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.CandidateProperty;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Jan 31, 2007
 */
public interface CandidatePropertyDAO {
    CandidateProperty find(Integer id);

    List getProperties();

}
