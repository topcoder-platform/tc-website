package com.topcoder.web.common.dao;

import java.util.List;

import com.topcoder.web.common.model.MemberContactMessage;

/**
 * @author cucu
 * @version $Revision: 53709 $ Date: 2005/01/01 00:00:00
 *          Create Date: July 18, 2006
 */
public interface MemberContactMessageDAO {

    MemberContactMessage find(Long id);

    List getAllSendersToUser(Long userId);

    void saveOrUpdate(MemberContactMessage u);

}
