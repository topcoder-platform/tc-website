package com.topcoder.mpsqas.compiler;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;

import java.net.ServerSocket;
import java.net.Socket;
import java.util.Vector;

/**
 * CompilerQueue is class which holds all pending compiles.  Compiles can be added to the queue through a socket.
 * Compilers register themselves with the Queue as they are created / freed up.  When there is a free compiler
 * and a pending compile, the queue creates a CompilerConnection, which takes care of the compile.
 *
 * @author mitalub
 */
public class CompilerQueue extends Thread {
    private static Logger log = Logger.getLogger(CompilerQueue.class);

    /**
     * Starts up the CompilerQueue.
     */
    public static void main(String[] args) {
        CompilerQueue t = new CompilerQueue();
    }

    /**
     * The constructor starts up the queue, first to listen to connections to add to the queue, and second to listen
     * to connections to take from the queue.
     */
    public CompilerQueue() {
        pendingCompiles = new Vector();
        availableCompilers = new Vector();
        start();
        listenForGetCompile();
    }

    /**
     * Starts the queue listening for PutCompiles.
     */
    public void run() {
        listenForPutCompile();
    }

    /**
     * Starts a ServerSocket to listen for GetCompiles and then continuously waits for compiler connections, puts
     * the compile on the Vector, and distribute's a compile.
     */
    private void listenForGetCompile() {
        ServerSocket listener = null;
        Socket socket;

        try {
            listener = new ServerSocket(ApplicationConstants.GET_COMPILE_PORT);
        } catch (Exception e) {
            log.error("Error setting up ServerSocket for GetCompiles.");
            e.printStackTrace();
            return;
        }

        log.debug("Beginning to listen for compilers.");
        while (!isInterrupted()) {
            try {
                socket = listener.accept();
                availableCompilers.add(socket);
                log.debug("Adding Compiler to Queue.");
                distributeCompile();
            } catch (Exception e2) {
                log.error("Error getting GetCompile:");
                e2.printStackTrace();
            }
        }
    }

    /**
     * Starts a ServerSocket to listen for PutCompiles and then continously waits for compiles.
     */
    private void listenForPutCompile() {
        ServerSocket listener = null;
        Socket socket;

        try {
            listener = new ServerSocket(ApplicationConstants.PUT_COMPILE_PORT);
        } catch (Exception e) {
            log.error("Error initiating PutCompile socket.");
            e.printStackTrace();
            return;
        }

        log.debug("Beginning to listen for compiles.");
        while (!isInterrupted()) {
            try {
                socket = listener.accept();
                log.debug("Adding Pending Compile to Queue.");
                pendingCompiles.addElement(socket);
                distributeCompile();
            } catch (Exception e2) {
                log.error("Error getting PutCompile:");
                e2.printStackTrace();
            }
        }
    }

    /**
     * If there is a waiting compile and a waiting compiler, sets up a CompilerConnection to
     * do the compile.  Otherwise, does nothing.  Recusively calls itself if there
     * was a compile to ensure one of the queue's is left empty.
     */
    private synchronized void distributeCompile() {
        if (availableCompilers.isEmpty() || pendingCompiles.isEmpty()) return;

        log.debug("Distributing compile.");

        Socket compiler = (Socket) availableCompilers.remove(0);
        Socket waiter = (Socket) pendingCompiles.remove(0);

        CompilerConnection cs = new CompilerConnection(waiter, compiler);
        cs.start();

        distributeCompile();
    }

    private Vector availableCompilers;
    private Vector pendingCompiles;
}
