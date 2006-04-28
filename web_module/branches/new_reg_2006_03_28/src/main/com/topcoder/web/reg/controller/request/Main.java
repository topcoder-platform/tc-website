package com.topcoder.web.reg.controller.request;

import com.topcoder.web.reg.dao.RegistrationTypeDAO;
import com.topcoder.web.reg.model.RegistrationType;
import com.topcoder.web.reg.Constants;
import com.topcoder.web.reg.RegFieldHelper;
import com.sun.corba.se.internal.core.Constant;

import java.util.HashSet;
import java.util.List;
import java.util.Iterator;
import java.util.Set;

/**
 * @author dok
 * @version $Revision$ Date: 2005/01/01 00:00:00
 *          Create Date: Mar 29, 2006
 */
public class Main extends Base {

    protected void registrationProcessing() throws Exception {

        List types = new RegistrationTypeDAO().getRegistrationTypes();

        RegistrationType rt;
        HashSet requestedTypes = new HashSet();
        for (Iterator it = types.iterator(); it.hasNext();) {
            rt = (RegistrationType)it.next();
            if ("on".equals(getRequest().getParameter(Constants.REGISTRATION_TYPE + rt.getId())) {
                requestedTypes.add(rt);
            }
        }

        if (requestedTypes.isEmpty()) {
            //error message, back to selection page
        } else {

            //todo we need to figure out how to put the user in the session, and detach at the end of every request
            //todo that means we need to add a couple servlet filters.  one to handle the session/factory stuff.  one to detach/attach
            
            //getRequest().setAttribute(Constants.FIELDS, RegFieldHelper.getMainFieldSet(requestedTypes, ));
        }


        //retrieve what things the user is attempting to register for
        //if they are attempting to register for nothing, give them an error and send them back.
           //perhaps tell them that if they would like to remove their account from topcoder, they
           //should send an email to service@topcoder.com

        //if they are attempting to register for high school, and they are not eligible,
          //give them a message saying they are not eligible to register for highschool

        //


    }
}
