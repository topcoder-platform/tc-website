package com.topcoder.shared.util.logging;

/**
 * @author unknown
 * @version  $Revision$
 */
public abstract class Logger {

    private static final LoggerFactory LOGGER_FACTORY;

    static {
        LOGGER_FACTORY = new LoggerFactoryLog4j127();
    }

    /**
     *
     * @param clazz
     * @return
     */
    public static Logger getLogger(Class clazz) {
        return LOGGER_FACTORY.getLogger(clazz);
    }

    /**
     *
     * @param message
     */
    public abstract void debug(Object message);

    /**
     *
     * @param message
     * @param t
     */
    public abstract void debug(Object message, Throwable t);

    /**
     *
     * @param message
     */
    public abstract void info(Object message);

    /**
     *
     * @param message
     * @param t
     */
    public abstract void info(Object message, Throwable t);

    /**
     *
     * @param message
     */
    public abstract void warn(Object message);

    /**
     *
     * @param message
     * @param t
     */
    public abstract void warn(Object message, Throwable t);

    /**
     *
     * @param message
     */
    public abstract void error(Object message);

    /**
     *
     * @param message
     * @param t
     */
    public abstract void error(Object message, Throwable t);

    /**
     *
     * @param message
     * @param t
     */
    public abstract void fatal(Object message, Throwable t);

    /**
     *
     * @return
     */
    public abstract boolean isDebugEnabled();

}
