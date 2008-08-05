package com.topcoder.web.tc.dao;

import com.topcoder.web.common.dao.GenericDAO;
import com.topcoder.web.common.model.User;
import com.topcoder.web.tc.model.Nomination;

import java.util.List;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Jul 26, 2007
 */
public interface NominationDAO extends GenericDAO<Nomination, Integer> {

    List<Nomination> findNominations(User u);

    List<Nomination> findNominations(Long userId);
}
