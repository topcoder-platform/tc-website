package com.topcoder.shared.util.logging;

final class LoggerFactoryLog4j11 implements LoggerFactory {

    public Logger getLogger(Class clazz) {
        return new LoggerLog4j11(clazz);
    }

}
