package com.topcoder.shared.util.logging;

final class LoggerFactoryLog4j127 implements LoggerFactory {

    public Logger getLogger(Class clazz) {
        return new LoggerLog4j127(clazz);
    }

}
