package com.topcoder.server.util;

import java.util.*;

import org.apache.log4j.Category;

public class StageQueue
{
    protected static Category trace = Category.getInstance( StageQueue.class.getName() );
    protected static List s_taskList = Collections.synchronizedList( new LinkedList() );
    protected static ArrayList s_taskRunners = new ArrayList();

    public static void addTask( Runnable r )
    {
        if( s_taskRunners.isEmpty() ) throw new RuntimeException( "StageQueue not initialized.  Call start first" );
        synchronized( s_taskList )
        {
            s_taskList.add( r );
            s_taskList.notifyAll();
        }
    }

    static class TaskRunner implements Runnable
    {
        protected boolean m_stopped = false;

        public void run()
        {
            try
            {
                while( !m_stopped )
                {
                    Runnable toRun = null;
                    synchronized( s_taskList )
                    {
                        while( !m_stopped && s_taskList.isEmpty() )
                        {
                            try
                            {
                                s_taskList.wait();
                            }
                            catch( InterruptedException ie )
                            {
                                trace.debug( "Interrupted waiting for tasks", ie );
                            }
                        }
                        if( !s_taskList.isEmpty() )
                        {
                            toRun = (Runnable)s_taskList.remove( 0 );
                        }
                    }
                    if( toRun != null )
                    {
                        try
                        {
                            toRun.run();
                        }
                        catch( Throwable t )
                        {
                            trace.error( "Error occured while running task:", t );
                        }
                    }
                }
            }
            finally
            {
                trace.debug( "Exiting run" );
            }
        }

        public void stop()
        {
            m_stopped = true;
        }
    }

    public static void start( int numThreads )
    {
        if( numThreads > s_taskRunners.size() )
        {
            for( int i = s_taskRunners.size(); i < numThreads; i++ )
            {
                TaskRunner r = new TaskRunner();
                s_taskRunners.add( r );
                Thread t = new Thread( r, "StageQueueRunner." + i );
                t.setDaemon( true );
                t.start();
            }
        }
    }

    public static void stop()
    {
        for( int i = 0; i < s_taskRunners.size(); i++ )
        {
            TaskRunner r = (TaskRunner)s_taskRunners.get( i );
            r.stop();
        }
        synchronized( s_taskList )
        {
            s_taskList.notifyAll();
        }
        s_taskRunners = new ArrayList();
    }
}
