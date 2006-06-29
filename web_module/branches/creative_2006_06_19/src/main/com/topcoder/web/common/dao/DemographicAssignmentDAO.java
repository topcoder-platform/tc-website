package com.topcoder.web.common.dao;

import com.topcoder.web.common.model.CoderType;
import com.topcoder.web.common.model.RegistrationType;
import com.topcoder.web.common.model.State;

import java.util.List;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: May 13, 2006
 */
public interface DemographicAssignmentDAO {

    List getAssignments(CoderType ct, State s, Set regTypes);

    List getAssignments(RegistrationType regType);

}
