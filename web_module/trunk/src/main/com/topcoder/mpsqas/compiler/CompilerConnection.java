package com.topcoder.mpsqas.compiler;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;

import java.io.*;
import java.net.Socket;

/**
 * CompilerConnection manages communication between a compiler and a compilerwaiter via sockets.
 * It sends the compile information to the compiler, waits for a response, and then sends the
 * response to the compielrwaiter.
 *
 * @author mitalub
 */
public class CompilerConnection extends Thread {
    private static Logger log = Logger.getLogger(CompilerConnection.class);

    /**
     * The constructor stores some information about the compile and sockets.
     *
     * @param compileWaiterSocket The socket connection to the CompilerWaiter.
     * @param compilerSocket The socket connection to the compiler.
     */
    public CompilerConnection(Socket compileWaiterSocket, Socket compilerSocket) {
        this.compileWaiterSocket = compileWaiterSocket;
        this.compilerSocket = compilerSocket;
    }

    /**
     * Sets up the sockets and performs the compile.
     */
    public void run() {
        ObjectOutputStream compilerOut = null;
        ObjectInputStream compilerIn = null;
        ObjectOutputStream waiterOut = null;
        ObjectInputStream waiterIn = null;
        Object compileResponse;
        Object compileObject;
        boolean doCompile = true;

        //try setting up the streams.
        try {
            compilerOut = new ObjectOutputStream(new BufferedOutputStream(compilerSocket.getOutputStream()));
            compilerOut.flush();
            compilerIn = new ObjectInputStream(compilerSocket.getInputStream());
            compilerSocket.setSoTimeout((int) (2 * ApplicationConstants.TIME_OUT_MILLIS));

            waiterOut = new ObjectOutputStream(new BufferedOutputStream(compileWaiterSocket.getOutputStream()));
            waiterOut.flush();
            waiterIn = new ObjectInputStream(compileWaiterSocket.getInputStream());
            compileWaiterSocket.setSoTimeout(2 * (int) ApplicationConstants.TIME_OUT_MILLIS);
        } catch (Exception e1) {
            log.error("Error setting up compile: ");
            e1.printStackTrace();
            doCompile = false;
        }

        //perform the compile
        if (doCompile) {
            try {
                compileObject = waiterIn.readObject();
                log.debug("Got compile from CompilerWaiter.");

                compilerOut.writeObject(compileObject);
                compilerOut.flush();

                compileResponse = compilerIn.readObject();
                log.debug("Got compile results from Compiler.");

                waiterOut.writeObject(compileResponse);
                waiterOut.flush();
            } catch (Exception e2) {
                log.error("Error performing compile: ");
                e2.printStackTrace();
            }
        }


        //close everything
        try {
            compilerOut.close();
        } catch (Exception e3) {
        }

        try {
            compilerIn.close();
        } catch (Exception e4) {
        }

        try {
            compilerSocket.close();
        } catch (Exception e5) {
        }

        try {
            waiterOut.close();
        } catch (Exception e6) {
        }

        try {
            waiterIn.close();
        } catch (Exception e7) {
        }

        try {
            compileWaiterSocket.close();
        } catch (Exception e8) {
        }
    }

    private Socket compilerSocket;
    private Socket compileWaiterSocket;
}




