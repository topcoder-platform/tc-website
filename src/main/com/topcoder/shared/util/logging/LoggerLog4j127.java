package com.topcoder.shared.util.logging;

final class LoggerLog4j127 extends com.topcoder.shared.util.logging.Logger {

    private final org.apache.log4j.Logger logger;

    LoggerLog4j127(Class clazz) {
        logger = org.apache.log4j.Logger.getLogger(clazz);
    }

    public void debug(Object message) {
        logger.debug(message);
    }

    public void debug(Object message, Throwable t) {
        logger.debug(message, t);
    }

    public void info(Object message) {
        logger.info(message);
    }

    public void info(Object message, Throwable t) {
        logger.info(message, t);
    }

    public void warn(Object message) {
        logger.warn(message);
    }

    public void warn(Object message, Throwable t) {
        logger.warn(message, t);
    }

    public void error(Object message) {
        logger.error(message);
    }

    public void error(Object message, Throwable t) {
        logger.error(message, t);
    }

    public void fatal(Object message, Throwable t) {
        logger.fatal(message, t);
    }

    public boolean isDebugEnabled() {
        return logger.isDebugEnabled();
    }

}
