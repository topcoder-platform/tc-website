package com.topcoder.shared.util.logging;

public abstract class Logger {

    private static final LoggerFactory LOGGER_FACTORY;

    static {
        LOGGER_FACTORY=new LoggerFactoryLog4j11();
    }

    public static Logger getLogger(Class clazz) {
        return LOGGER_FACTORY.getLogger(clazz);
    }

    public abstract void debug(Object message);
    public abstract void debug(Object message, Throwable t);
    public abstract void info(Object message);
    public abstract void warn(Object message);
    public abstract void error(Object message);
    public abstract void error(Object message, Throwable t);
    public abstract void fatal(Object message, Throwable t);

    public abstract boolean isDebugEnabled();

}
