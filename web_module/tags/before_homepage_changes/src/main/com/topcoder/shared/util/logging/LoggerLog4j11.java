package com.topcoder.shared.util.logging;

import org.apache.log4j.Category;

final class LoggerLog4j11 extends Logger {

    private final Category category;

    LoggerLog4j11(Class clazz) {
        category = Category.getInstance(clazz);
    }

    public void debug(Object message) {
        category.debug(message);
    }

    public void debug(Object message, Throwable t) {
        category.debug(message, t);
    }

    public void info(Object message) {
        category.info(message);
    }

    public void info(Object message, Throwable t) {
        category.info(message, t);
    }

    public void warn(Object message) {
        category.warn(message);
    }

    public void warn(Object message, Throwable t) {
        category.warn(message, t);
    }

    public void error(Object message) {
        category.error(message);
    }

    public void error(Object message, Throwable t) {
        category.error(message, t);
    }

    public void fatal(Object message, Throwable t) {
        category.fatal(message, t);
    }

    public boolean isDebugEnabled() {
        return category.isDebugEnabled();
    }

}
