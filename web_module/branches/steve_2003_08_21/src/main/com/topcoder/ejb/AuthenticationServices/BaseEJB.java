package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import javax.naming.Context;
import javax.naming.InitialContext;


public abstract class BaseEJB implements SessionBean {

//****************************************************************************
//                                 Constants
//****************************************************************************

    private static final boolean VERBOSE = false;



//****************************************************************************
//                               Protected  Members
//****************************************************************************



    /**
     * This class returns the context.
     */
    protected Context getContext() {
        try {
            if (InitContext == null)
                InitContext = new InitialContext();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("Error occurred getting context");
        }

        return InitContext;
    }


    /**
     * Returns the tag to append to the default debug statement.
     * This may be overridden for verbose debugging.
     */
    protected String getTag() {
        return TAG;
    }




//****************************************************************************
//                                 Data Members
//****************************************************************************

    private SessionContext ctx;
    private transient Context InitContext;
    private static final String TAG = "BaseEJB";



//****************************************************************************
//                                 EJB lifecycle
//****************************************************************************

    /**
     * This method is required by the EJB Specification
     *
     */
    public void ejbActivate() {
        if (VERBOSE) System.out.println(getTag() + ":  ejbActivate called");
    }


    /**
     * This method is required by the EJB Specification
     *
     */
    public void ejbPassivate() {
        if (VERBOSE) System.out.println(getTag() + ":  ejbPassivate called");
    }


    /**
     * This method is required by the EJB Specification.
     * Used to get the context ... for dynamic connection pools.
     *
     */
    public void ejbCreate() throws CreateException {
        if (VERBOSE) System.out.println(getTag() + ":  ejbCreate called");

        InitContext = getContext();
    }


    /**
     * This method is required by the EJB Specification
     *
     */
    public void ejbRemove() {
        if (VERBOSE) System.out.println(getTag() + ":  ejbRemove called");
    }


    /**
     * Sets the transient SessionContext.
     * Sets the transient Properties.
     *
     */
    public void setSessionContext(SessionContext ctx) {
        if (VERBOSE) System.out.println("setSessionContext called");
        this.ctx = ctx;
    }


}
