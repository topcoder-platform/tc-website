package com.topcoder.shared.distCache;

import java.io.*;
import java.rmi.RemoteException;
import java.util.Iterator;
import java.util.Date;
import java.util.ArrayList;

public class SimpleClient
{
    static CacheClient client = CacheClientFactory.createCacheClient();
    static private boolean confirm = false;

    public static void main(String[] args) {
        try {
            BufferedReader in = new BufferedReader(new InputStreamReader(System.in));

            while (readEval(in)) {
            }
        } catch (IOException e) {
            System.out.println(e.getMessage());
        }
    }


    static boolean readEval(BufferedReader in) 
        throws IOException
    {
        System.out.print("> ");
        System.out.flush();
        
        String line = in.readLine();

        if (line == null) {
            return false;
        }

        return processLine(line);
    }

    static boolean processLine(String line) {
        line = line.trim();
        if (line.length() == 0) {
            return true;
        }
        if(confirm)
        {
            if(line.charAt(0)=='Y' || line.charAt(0)=='y')
            {
                try
                {
                    confirm = false;
                    client.clearCache();
                    System.out.println("CLEARED");
                }
                catch (RemoteException e) {
                    System.out.println("Exception: " + e.getMessage());
                    e.printStackTrace();
                }
            }
            else if(line.charAt(0)=='N' || line.charAt(0)=='n')
            {
                confirm = false;
                System.out.println("NOT CLEARED");
            }
            else
                System.out.println("Please enter yes or no.");
            return true;
        }
        if (line.equals("info")) {
            System.out.println("client: " + client);
        } else if (line.equals("bulk")) {
            try {
                for (int i=0; i<100000; i++) {
                    client.set("foo." + i, new Integer(i), 10000);
                    client.get("foo." + i);
                    if (i%10 == 0) {
                        System.out.println(i);
                    }
                }
                System.out.println();

            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
            }
        } else if (line.startsWith("lock ")) {
            String key = line.substring(line.indexOf(' ')+1);
            try {
                System.out.println("LOCKED " + key + "=" + 
                                   client.getAndLock(key));
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }

        } else if (line.startsWith("unlock ")) {
            String key = line.substring(line.indexOf(' ')+1);
            try {
                client.releaseLock(key);
                System.out.println("UNLOCKED " + key);
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }

        } else if (line.startsWith("remove ")) {
            String key = line.substring(line.indexOf(' ')+1);
            try {
                Object o = client.remove(key);
                if(o==null)System.out.println("ATTEMPT TO REMOVE "+key+" FAILED.  IT IS NOT IN THE CACHE.");
                else System.out.println("SUCCESSFULLY REMOVED " + key);
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }

        } else if (line.equals("clear")) {
                confirm = true;
                System.out.println("Are you sure you want to clear the cache?");
        } else if (line.equals("values")) {
            try {
                ArrayList al = client.getValues();
                for(int i = 0; i<al.size();i++)
                {
                    CachedValue cv = (CachedValue)(al.get(i));
                    System.out.println("key = "+cv.getKey()+", value = "+cv.getValue()+", last used = "+new Date(cv.getLastUsed()));
                }
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }
        } else if (line.equals("keys")) {
            try {
                ArrayList al = client.getValues();
                for(int i = 0; i<al.size();i++)
                {
                    CachedValue cv = (CachedValue)(al.get(i));
                    System.out.println("key = "+cv.getKey()+", last used = "+new Date(cv.getLastUsed())+", expires on "+new Date(cv.getExpireTime()));
                }
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }
        } else if (line.equals("size")) {
            try {
                    System.out.println("The cache currently holds "+client.size()+" items");
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }
        } else {
            try {
                int pos = line.indexOf("<-");
                if (pos == -1) {
                    System.out.println(line + "=" +  client.get(line));
                } else {
                    client.set(line.substring(0,pos), line.substring(pos+2), 10000);
                }
            } catch (RemoteException e) {
                System.out.println("Exception: " + e.getMessage());
		e.printStackTrace();
            }
        }

        return true;
    }

}
