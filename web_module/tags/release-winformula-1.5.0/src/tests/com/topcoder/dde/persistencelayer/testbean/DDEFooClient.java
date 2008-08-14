package com.topcoder.dde.persistencelayer.testbean;

import java.util.Hashtable;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.rmi.PortableRemoteObject;

public final class DDEFooClient {

    private static Context getContext() throws NamingException {
        Hashtable environment = new Hashtable();
        environment.put(Context.PROVIDER_URL, "localhost:1099");
        environment.put(Context.INITIAL_CONTEXT_FACTORY, "org.jnp.interfaces.NamingContextFactory");
        return new InitialContext(environment);
    }

    public static void main(String[] args) {
        try {
            Context context = getContext();
            Object o = context.lookup("dde/persistence_layer/DDEFooEJB");
            DDEFooHome fooHome = (DDEFooHome) PortableRemoteObject.narrow(o, DDEFooHome.class);
            DDEFoo ddeFoo = fooHome.create();
            ddeFoo.testAll();
        } catch (Throwable e) {
            e.printStackTrace();
        }
    }

}
