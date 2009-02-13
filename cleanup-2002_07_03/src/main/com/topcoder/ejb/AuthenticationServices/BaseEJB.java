package com.topcoder.ejb.AuthenticationServices;

import javax.ejb.*;
import java.io.Serializable;
import java.rmi.RemoteException;
import javax.naming.InitialContext;
import javax.naming.Context;
import com.topcoder.shared.util.logging.Logger;


public abstract class BaseEJB implements SessionBean {
    private static Logger log = Logger.getLogger(BaseEJB.class);
//****************************************************************************
//                               Protected  Members
//****************************************************************************


    
/**
 * This class returns the context.
 */
    protected Context getContext()
    {
        try {
            if(InitContext == null)
                InitContext = new InitialContext();
        }
        catch(Exception e){
            e.printStackTrace();
            log.debug("Error occurred getting context");
        }
        
        return InitContext;
    }

    
/**
 * Returns the tag to append to the default debug statement.
 * This may be overridden for verbose debugging.
 */
    protected String getTag()
    {
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
    public void ejbActivate()
    {
        log.debug(getTag()+":  ejbActivate called");
    }

    
/**
 * This method is required by the EJB Specification
 *
 */
    public void ejbPassivate() 
    {
        log.debug(getTag()+":  ejbPassivate called");
    }

    
/**
 * This method is required by the EJB Specification.
 * Used to get the context ... for dynamic connection pools.
 *
 */
    public void ejbCreate () throws CreateException 
    {
        log.debug(getTag()+":  ejbCreate called");
        
        InitContext = getContext();
    }

    
/**
 * This method is required by the EJB Specification
 *
 */
    public void ejbRemove() 
    {
        log.debug(getTag()+":  ejbRemove called");
    }

    
/**
 * Sets the transient SessionContext.
 * Sets the transient Properties.
 *
 */
    public void setSessionContext(SessionContext ctx)
    {
        log.debug("setSessionContext called");
        this.ctx = ctx;
    }
    

}
