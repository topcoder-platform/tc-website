package com.topcoder.mpsqas.compiler;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;

import java.io.*;
import java.net.Socket;
import java.net.SocketException;
import java.util.ArrayList;

/**
 * This class contains a compile method to be called by an outside object
 * so the results of the compile are returned "immediatly".  This class
 * makes a compile request, sends the request to the compilier, waits for a
 * response, and then returns the results
 *
 * @author mitalub
 */
public class CompilerWaiter extends Thread {
    private static Logger log = Logger.getLogger(CompilerWaiter.class);
    private boolean quit;
    private ArrayList compileRequest;
    private boolean compileComplete;
    private ArrayList compileResponse;

    /**
     * This method starts the thread to compile and then, when the compile is
     * complete, it returns the results, which are a boolean indicating the
     * success of the compile, followed by an error message of an ArrayList of
     * byte[] representing the class file.
     *
     * @param code The code to compile
     * @param fileName The name of the file in which the code should lie.
     * @param package The name of the package for the code.
     */
    public ArrayList compile(String code, String fileName, String packageName) {
        log.debug("In CompilerWaiter.compile");
        ArrayList compileReturn = new ArrayList(2);
        this.compileRequest = new ArrayList(3);
        this.compileRequest.add(code);
        this.compileRequest.add(fileName);
        this.compileRequest.add(packageName);
        long startTime = System.currentTimeMillis();
        this.compileComplete = false;
        this.quit = false;
        start();
        while (!compileComplete && System.currentTimeMillis()
                - startTime < ApplicationConstants.TIME_OUT_MILLIS) {
            try {
                Thread.sleep(10);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        if (!compileComplete) {
            this.quit = true;
            compileReturn.add(new Boolean(false));
            compileReturn.add("Compiler timed out.");
        } else {
            compileReturn = this.compileResponse;
        }
        return compileReturn;
    }

    /**
     * run gets a connection to the compiler, sends the compile request, and
     * the waits for the compile response.
     */
    public void run() {
        Socket compilerSocket = null;
        ObjectOutputStream outputStream = null;
        ObjectInputStream inputStream = null;
        boolean connected = false;

        //first, try to get connected to the compiler
        while (!connected && !this.quit) {
            try {
                compilerSocket = new Socket(ApplicationConstants.COMPILER_IP,
                        ApplicationConstants.PUT_COMPILE_PORT);
                outputStream = new ObjectOutputStream(new BufferedOutputStream(
                        compilerSocket.getOutputStream()));
                outputStream.flush();
                inputStream = new ObjectInputStream(compilerSocket.getInputStream());
                connected = true;
            } catch (Exception e) {
                log.debug("Can't get compile connection, trying again..");
                try {
                    Thread.sleep(500);
                } catch (Exception e2) {
                }
            }
        }

        if (this.quit) return;

        //next, send the compile request
        try {
            outputStream.writeObject(compileRequest);
            outputStream.flush();
        } catch (Exception e) {
            log.debug("Error sending compile request to compiler:");
            e.printStackTrace();
            compileResponse = new ArrayList(2);
            compileResponse.add(new Boolean(false));
            compileResponse.add(ApplicationConstants.SERVER_ERROR);
            compileComplete = true;
        }

        //finally, wait for the response
        while (!this.quit && !compileComplete) {
            try {
                compilerSocket.setSoTimeout(3000);
                compileResponse = (ArrayList) inputStream.readObject();
                compileComplete = true;
            } catch (InterruptedIOException iioe) {
            } catch (SocketException se) {
            } catch (Exception e) {
                System.out.println("Error getting compile response:");
                e.printStackTrace();
                compileResponse = new ArrayList(2);
                compileResponse.add(new Boolean(false));
                compileResponse.add("Server error.  Please try again.");
                compileComplete = true;
            }
        }

        //lastly, try closing stuff up
        try {
            inputStream.close();
        } catch (Exception e) {
        }
        try {
            outputStream.close();
        } catch (Exception e) {
        }
        try {
            compilerSocket.close();
        } catch (Exception e) {
        }
    }

}
