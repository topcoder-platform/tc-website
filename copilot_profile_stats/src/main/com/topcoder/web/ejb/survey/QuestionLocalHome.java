package com.topcoder.web.ejb.survey;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface QuestionLocalHome extends EJBLocalHome {

    public QuestionLocalHome create() throws CreateException;
}
