/*
 * PredictionHandler
 * 
 * Created Aug 19, 2008
 */
package com.topcoder.web.winformula.algorithm.eventhandler;

import javax.ejb.EJBException;
import javax.ejb.MessageDrivenBean;
import javax.ejb.MessageDrivenContext;
import javax.jms.Message;
import javax.jms.MessageListener;

import com.topcoder.shared.util.logging.Logger;

/**
 * @author Diego Belfer (Mural)
 * @version $Id$
 */
/**
 * Message driven bean responsible for handling asynchronous service calls.
 * 
 * @author Diego Belfer (mural)
 * @version $Id$
 */
public class PredictionHandlerMDB implements MessageListener, MessageDrivenBean  {
    private static final Logger log = Logger.getLogger(PredictionHandlerMDB.class);
    private static final Logger alertLog = Logger.getLogger("ALERT."+PredictionHandlerMDB.class.getName());
    private MessageDrivenContext ctx;
    
    public void onMessage(Message srcMsg) {
        if (log.isDebugEnabled()) {
            log.debug("Processing new incoming message: "+srcMsg);
        }
        try {
            
//        } catch (JMSException e) {
//            log.error("Exception while sending response" , e);
//            log.error(srcMsg);
//            throw new EJBException("Exception while sending response, forcing MDB removal");
        } finally {
            if (log.isDebugEnabled()) {
                log.debug("Message processed");
            }
        }
    }

    public void ejbCreate() {
    }

    public void ejbRemove() throws EJBException {
    }

    public void setMessageDrivenContext(MessageDrivenContext ctx) throws EJBException {
        this.ctx = ctx;
    }
}