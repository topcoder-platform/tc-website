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

import com.topcoder.server.ejb.TestServices.LongContestServiceEventListener;
import com.topcoder.server.ejb.TestServices.LongRoundOverallScore;
import com.topcoder.shared.serviceevent.ServiceEventMessageListener;
import com.topcoder.shared.util.logging.Logger;
import com.topcoder.web.winformula.algorithm.services.PredictionLoader;
import com.topcoder.web.winformula.algorithm.services.WisdomPredictionGenerator;

/**
 * Message driven bean responsible for handling events from the MM Engine
 * 
 * @author Diego Belfer (mural)
 * @version $Id: PredictionHandlerMDB.java 72590 2008-08-26 20:11:53Z pwolfus $
 */
public class PredictionHandlerMDB implements MessageListener, MessageDrivenBean  {
    private static final Logger log = Logger.getLogger(PredictionHandlerMDB.class);
    private static final Logger alertLog = Logger.getLogger("ALERT."+PredictionHandlerMDB.class.getName());
    private final ServiceEventMessageListener listener;
    private final PredictionLoader loader = new PredictionLoader();
    private final WisdomPredictionGenerator generator = new WisdomPredictionGenerator();
    
    @SuppressWarnings("unused")
    private MessageDrivenContext ctx;
    
    public PredictionHandlerMDB() {
        listener = new ServiceEventMessageListener(LongContestServiceEventListener.SERVICE_NAME);
        LongContestServiceEventListener.addEventHandler(listener, new LongContestServiceEventListener.Handler() {
            public void testCompleted(int roundId, int coder, int componentId, int submissionNumber, boolean example) {
                if (log.isDebugEnabled()) {
                    log.debug("Test completed roundId="+roundId+" coderId="+coder+" submissionNumber="+submissionNumber);
                }
            }
        
            public void systemTestCompleted(int roundId, int coderId, int componentId, int submissionNumber) {
                log.info("System Test complete roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber);
                loader.handleSystemTestCompleted(roundId, coderId, submissionNumber);
            }
        
            public void submissionMade(int roundId, int coderId, int componentId, boolean example, int submissionNumber) {
                if (log.isDebugEnabled()) {
                    log.debug("submissionMade roundId="+roundId+" coderId="+coderId+" submissionNumber="+submissionNumber);
                }
            }
        
            public void saved(int roundId, int coderId, int componentId, String source, int language) {
                if (log.isDebugEnabled()) {
                    log.debug("Saved roundId="+roundId+" coderId="+coderId+" language="+language);
                }
            }
        
            public void overallScoreRecalculated(LongRoundOverallScore scores) {
            }
        
            public void componentOpened(int roundId, int coderId, int componentId, long openTime) {
                if (log.isDebugEnabled()) {
                    log.debug("componentOpened roundId="+roundId+" coderId="+coderId+" openTime="+openTime);
                }
            }
        
            public void coderRegistered(int roundId, int coderId) {
                if (log.isDebugEnabled()) {
                    log.debug("Coder registered roundId="+roundId+" coderId="+coderId);
                }
            }

            public void roundSystemTestingCompleted(int roundId) {
                log.info("System Testing complete roundId="+roundId);
                generator.generatePredictionsForOpenedWeeksOfRound(roundId);
            }
        });
    }
    
    public void onMessage(Message srcMsg) {
        if (log.isDebugEnabled()) {
            log.debug("Processing new incoming message: "+srcMsg);
        }
        try {
            listener.onMessage(srcMsg);
        } catch (Exception e) {
            log.error("Exception while processing Event message " , e);
            alertLog.error("Exception while processing Event message " , e);
            throw new EJBException("Exception while sending response, forcing MDB removal");
        } finally {
            if (log.isDebugEnabled()) {
                log.debug("Message processing finished");
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