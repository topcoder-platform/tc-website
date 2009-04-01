package com.topcoder.web.oracle.dao;

import com.topcoder.web.oracle.model.Phase;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2007
 */
public interface PhaseDAO {
    Phase find(Integer id);

    List<Phase> getPhases();

}
