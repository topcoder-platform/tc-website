package com.topcoder.mpsqas.compiler;

import com.topcoder.mpsqas.common.ApplicationConstants;
import com.topcoder.shared.util.logging.Logger;
import sun.tools.javac.Main;

import java.io.*;
import java.net.Socket;
import java.util.ArrayList;
import java.util.HashMap;

/**
 *
 *
 *
 * @author mitalub
 */
public class Compiler {
    private static Logger log = Logger.getLogger(Compiler.class);

    /**
     *
     */
    public static void main(String[] args) {
        Compiler c = new Compiler();
        c.getCompiles();
    }

    /**
     *
     *
     */
    public void getCompiles() {
        ArrayList compileRequest;
        ArrayList compileResponse;
        Socket socket;
        ObjectOutputStream outputStream;
        ObjectInputStream inputStream;

        while (true) {
            try {
                socket = new Socket(ApplicationConstants.COMPILER_IP, ApplicationConstants.GET_COMPILE_PORT);

                outputStream = new ObjectOutputStream(new BufferedOutputStream(socket.getOutputStream()));
                outputStream.flush();
                inputStream = new ObjectInputStream(socket.getInputStream());

                compileRequest = (ArrayList) inputStream.readObject();

                compileResponse = compile((String) compileRequest.get(0), (String) compileRequest.get(1), (String) compileRequest.get(2));
                outputStream.writeObject(compileResponse);
                outputStream.flush();

                try {
                    outputStream.close();
                } catch (Exception e1) {
                }
                try {
                    inputStream.close();
                } catch (Exception e2) {
                }
                try {
                    socket.close();
                } catch (Exception e3) {
                }
            } catch (Exception e) {
                log.error("Unknown exception in compiler:");
                e.printStackTrace();
            }
        }
    }

    /**
     * compile makes use of sun's compiler to compile some code.  The method returns an ArrayList
     * containing a boolean indicating the success of the compile followed by either an error message
     * or an ArrayList of byte[] representing the class files.
     * The method writes the code to the file system under the specified file name and prefixes it with
     * the specified package name.
     *
     * @param code The code to compile
     * @param fileName The name of the file in which the code should lie.
     * @param package The name of the package for the code.
     */
    private ArrayList compile(String code, String fileName, String packageName) {
        ArrayList results = new ArrayList();
        try {
            log.debug("In Compiler.compile()...");
            String sourcePath = ApplicationConstants.BASE_CODE_PATH + "/" + packageName.replace('.', '/') + "/";
            File sourcePathDir = new File(sourcePath);
            File sourceFile = new File(sourcePath + fileName);
            File[] fileList;
            int i;

            //create the directory for the file, if necessary
            if (!sourcePathDir.exists())
                sourcePathDir.mkdirs();

            fileList = sourcePathDir.listFiles();

            //delete any current files in the directory
            for (i = 0; i < fileList.length; i++)
                fileList[i].delete();

            //create the file for the source
            sourceFile.createNewFile();

            //write the package name and code to the file
            PrintWriter pw = new PrintWriter(new FileWriter(sourceFile));
            pw.write(code);
            pw.close();

            //set up the sun compiler
            ByteArrayOutputStream compileErrors = new ByteArrayOutputStream();
            Main javaCompiler = new Main(compileErrors, "Internal Java Compiler");
            String[] compilerArgs = {sourcePath + fileName};

            //compile
            boolean compileOK = javaCompiler.compile(compilerArgs);
            String compileErrorString = compileErrors.toString();
            compileErrors.close();

            //parse out package name
            int index;
            while ((index = compileErrorString.indexOf(sourcePath)) != -1)
                compileErrorString = compileErrorString.substring(0, index) +
                        compileErrorString.substring(index + sourcePath.length());

            log.debug("Results of compile: " + compileOK + "\n" + compileErrorString);

            if (!compileOK) {
                results.add(new Boolean(false));
                results.add(compileErrorString);
                return results;
            }

            //get a list of class files created
            fileList = sourcePathDir.listFiles();
            FileInputStream fis;
            byte[] classFileBytes;
            HashMap classFiles = new HashMap();
            String fullClassName;
            for (i = 0; i < fileList.length; i++) {
                if (fileList[i].toString().endsWith(".class")) {
                    fis = new FileInputStream(fileList[i]);
                    classFileBytes = new byte[fis.available()];
                    fis.read(classFileBytes);
                    fullClassName = packageName + "." + fileList[i].toString().substring(fileList[i].toString().lastIndexOf("/") + 1,
                            fileList[i].toString().length() - 6);
                    classFiles.put(fullClassName, classFileBytes);
                }
            }
            results.add(new Boolean(true));
            results.add(classFiles);
        } catch (Exception e) {
            results = new ArrayList();
            results.add(new Boolean(false));
            results.add("Server Error.  Please contact us.");
            log.error("Error in compiler: ");
            e.printStackTrace();
        }
        return results;
    }

    Socket client;
    ObjectInputStream inputStream;
    ObjectOutputStream outputStream;
}
