package com.topcoder.web.email.bean;


import java.util.Hashtable;


/**

 * TaskFactory.java

 *

 * Description: Factory class for creating Tasks.  Maintains a single copy of each

 *              Task class in a Hashtable indexed by class name.

 *

 * @author	James Lee (jameslee@cs.stanford.edu)

 * @version	1.0

 *

 */


public class TaskFactory {

    // Hashtable that maps class names to classes

    private Hashtable taskHashtable;



    // Private instance of a singleton TaskFactory

    private static TaskFactory taskFactory = null;


    /**

     * This constructor is private to ensure that nobody outside of

     * this class can instantiate a TaskFactory.

     */


    private TaskFactory() {

        taskHashtable = new Hashtable();

    }


    /**

     * Returns a singleton TaskFactory object.

     *

     * @return TaskFactory	the TaskFactory object

     */


    public static TaskFactory getTaskFactory() {

        // the taskFactory object is not created until the first request

        if (taskFactory == null) {

            taskFactory = new TaskFactory();

        }


        return taskFactory;

    }


    /**

     * Returns a Task object that is of the specified class.  If an object of

     * that class has previously been instantiated, this method will return that

     * existing object.  Objects are stored in a Hashtable indexed by class name.

     * Every time a new object is instantiated, it is placed into that Hashtable.

     *

     * @param className	a String containing the class name of the desired Task

     * @param classLoader	the ClassLoader used to load the specified class

     *

     * @throws ClassNotFoundException

     * @throws IllegalAccessException

     * @throws InstantiationException

     */


    public Task getTask(String className, ClassLoader classLoader)

            throws ClassNotFoundException, IllegalAccessException, InstantiationException {

        Task task = (Task) taskHashtable.get(className);



        // this task has not yet been created

        if (task == null) {

            Class taskClass = classLoader.loadClass(className);

            task = (Task) taskClass.newInstance();



            // store the newly created task in the hash

            taskHashtable.put(className, task);

        }


        return task;

    }

}



