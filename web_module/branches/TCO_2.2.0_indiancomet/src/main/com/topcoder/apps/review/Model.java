/**
 * Copyright � 2003, TopCoder, Inc. All rights reserved
 */
package com.topcoder.apps.review;

/**
 * Interface for the Model classes in the business logic. The business logic model classes accept an ActionData object
 * as input, processes that input and returns a ResultData object as the result.
 *
 * @author adic
 * @version 1.0
 */
public interface Model {

    /**
     * This method does the business logic processing on the passed ActionData (which wraps the input data) and returns
     * the result wrapped in a ResultData object.
     *
     * @param data the action data input object
     *
     * @return the results wrapped in a ResultData implementation
     */
    ResultData start(ActionData data);

}

