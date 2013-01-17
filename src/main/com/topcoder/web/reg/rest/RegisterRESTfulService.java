/*
 * Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
 */
package com.topcoder.web.reg.rest;

import javax.ws.rs.OPTIONS;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;
import com.topcoder.web.reg.UserDTO;

/**
 * <p>
 * This interface defines contracting methods for register service.
 * </p>
 * <p>
 * <strong>Thread Safety: </strong> Implementation of this interface should be thread-safe.
 * </p>
 * 
 * @author leo_lol
 * @version 1.0
 * @since 1.0
 */
@Path("/account")
@Produces(MediaType.APPLICATION_JSON)
public interface RegisterRESTfulService {
    
    /**
     * This method will be used to handle POST request to ${context}/account.
     * 
     * @param user
     *            New account to register.
     * @return Instance of {@link Response}, containing JSON data.
     */
    @POST
    public Response register(UserDTO userDTO);

    /**
     * This method handles pre-flight OPTIONS request before non-simple-request. See
     * https://developer.mozilla.org/en-US/docs/HTTP_access_control
     * 
     * @return {@link Response} instance allowing cross site access.
     */
    @OPTIONS
    public Response preflight();

}
