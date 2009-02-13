/*
 * WinFormulaServicesException
 * 
 * Created Jul 29, 2008
 */
package com.topcoder.web.winformula.algorithm.services;

import com.topcoder.server.ejb.TestServices.LongContestServices;
import com.topcoder.shared.i18n.Message;

/**
 * @author Diego Belfer (Mural)
 * @version $Id: WinFormulaServicesException.java 72272 2008-08-11 16:58:57Z pwolfus $
 */
public class WinFormulaServicesException extends Exception {
private Message localizableMessage;
    
    public WinFormulaServicesException(String message) {
        super(message);
        this.localizableMessage = new Message(LongContestServices.class.getName(), message);
    }
    
    public WinFormulaServicesException(String message, Object[] messageArgs) {
        super(message);
        this.localizableMessage = new Message(LongContestServices.class.getName(), message, messageArgs);
    }
    
    public WinFormulaServicesException(Message message) {
        super(message.getKey());
        this.localizableMessage = message;
    }

    /**
     * Returns the localizable message describing the reason of the failure
     * 
     * @return the message
     * 
     * @see com.topcoder.shared.i18n.MessageProvider
     */
    public Message getLocalizableMessage() {
        return localizableMessage;
    }
}
