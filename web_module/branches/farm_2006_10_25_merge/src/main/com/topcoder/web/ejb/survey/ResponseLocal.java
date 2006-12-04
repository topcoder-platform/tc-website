package com.topcoder.web.ejb.survey;

import javax.ejb.EJBLocalObject;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface ResponseLocal extends EJBLocalObject {

    public void createResponse(long userId, long questionId, long answerId);

    public void createResponse(long userId, long questionId, String text);

    public boolean exists(long userId, long questionId);


}
