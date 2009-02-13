package com.topcoder.web.ejb.longcompresult;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Dec 2, 2005
 */
public interface LongCompResultLocal extends EJBLocalObject {
    void createLongCompResult(long roundId, long coderId, String dataSource);

    void setPointTotal(long roundId, long coderId, double pointTotal, String dataSource);
    void setAttended(long roundId, long coderId, boolean attended, String dataSource);

    double getPointTotal(long roundId, long coderId, String dataSource);
    boolean getAttended(long roundId, long coderId, String dataSource);

    boolean exists(long roundId, long coderId, String dataSource);

}
