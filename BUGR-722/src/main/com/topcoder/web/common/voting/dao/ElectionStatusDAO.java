package com.topcoder.web.common.voting.dao;

import com.topcoder.web.common.voting.ElectionStatus;

import java.util.List;

/**
 * @author dok
 * @version $Revision: 57814 $ Date: 2005/01/01 00:00:00
 *          Create Date: Feb 5, 2007
 */
public interface ElectionStatusDAO {
    ElectionStatus find(Integer id);

    List getElectionStatuses();
}
