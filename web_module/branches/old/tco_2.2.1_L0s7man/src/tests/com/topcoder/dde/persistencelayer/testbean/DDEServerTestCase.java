package com.topcoder.dde.persistencelayer.testbean;

import java.sql.Timestamp;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import junit.framework.TestCase;

abstract class DDEServerTestCase extends TestCase implements Testable {

    DDEServerTestCase() {
        super("test");
    }

    DDEServerTestCase(String name) {
        super(name);
    }


    static Object lookup(String name) throws NamingException {
        Context context = new InitialContext();
        Object object = context.lookup(name);
        context.close();
        return object;
    }

    static Timestamp currentTimestamp() {
        return new Timestamp(System.currentTimeMillis());
    }

}
