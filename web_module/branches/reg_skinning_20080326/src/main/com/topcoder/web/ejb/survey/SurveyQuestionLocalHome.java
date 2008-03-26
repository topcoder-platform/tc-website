package com.topcoder.web.ejb.survey;

import javax.ejb.CreateException;
import javax.ejb.EJBLocalHome;

/**
 * @author dok
 * @version $Revision$ $Date$
 *          Create Date: Nov 2, 2005
 */
public interface SurveyQuestionLocalHome extends EJBLocalHome {

    public SurveyQuestionLocalHome create() throws CreateException;
}
