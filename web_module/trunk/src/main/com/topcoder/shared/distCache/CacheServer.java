package com.topcoder.shared.distCache;

import java.rmi.Naming;
import java.rmi.RemoteException;
import java.rmi.NotBoundException;
import java.net.MalformedURLException;

import java.rmi.registry.Registry;
import java.rmi.registry.LocateRegistry;
import com.topcoder.shared.util.logging.Logger;

public class CacheServer {
    private static Logger log = Logger.getLogger(CacheServer.class);
    static final int MODE_PRIMARY   = 1;
    static final int MODE_SECONDARY = 2;

    private Cache  _cache    = null;
    private int    _mode     = MODE_PRIMARY;
    private int    _size     = -1;

    public CacheServer() {
        _size = CacheConfiguration.getSize();

    }

    public void setMode(int mode) {
        if ((mode != MODE_PRIMARY) && (mode != MODE_SECONDARY)) {
            throw new RuntimeException("invalid mode: " + mode);
        }
        _mode = mode;
    }

    public void setSize(int size) {
        if (size <= 0) {
            size = -1; // unlimited
        }

        _size = size;
    }

    // --------------------------------------------------

    private String getLocalHost() {
        if (_mode == MODE_PRIMARY) {
            return CacheConfiguration.getPrimaryServerHost();
        } else {
            return CacheConfiguration.getSecondaryServerHost();
        }
    }

    private int getLocalPort() {
        if (_mode == MODE_PRIMARY) {
            return CacheConfiguration.getPrimaryServerPort();
        } else {
            return CacheConfiguration.getSecondaryServerPort();
        }
    }

    private String getLocalClientURL() {
        if (_mode == MODE_PRIMARY) {
            return CacheConfiguration.getPrimaryClientURL();
        } else {
            return CacheConfiguration.getSecondaryClientURL();
        }
    }

    private String getLocalServerURL() {
        if (_mode == MODE_PRIMARY) {
            return CacheConfiguration.getPrimaryServerURL();
        } else {
            return CacheConfiguration.getSecondaryServerURL();
        }
    }


    private String getRemoteServerURL() {
        if (_mode == MODE_PRIMARY) {
            return CacheConfiguration.getSecondaryServerURL();
        } else {
            return CacheConfiguration.getPrimaryServerURL();
        }
    }

    // --------------------------------------------------

    public Cache cache() {
        return _cache;
    }

    public void startCache() {
	initRegistry();

        long start = System.currentTimeMillis();
        _cache = findCache();
        long end = System.currentTimeMillis();

        log.info("CACHE xfer took " +  (end-start) + "ms");

        try {
            CacheClientImpl     client    = new CacheClientImpl(_cache);
            String              clienturl = getLocalClientURL();

            CacheServerSyncImpl server    = new CacheServerSyncImpl(this);
            String              serverurl = getLocalServerURL();

            // wont get exception on fail...  how then ?
	    log.info("BINDING @ " + clienturl);
            Naming.rebind(clienturl, client); 
            log.info("registered " + clienturl);

	    log.info("BINDING @ " + serverurl);
            Naming.rebind(serverurl, server);
            log.info("registered " + serverurl);

        } catch (Exception e) {
            log.error("Exception: " + e.getMessage());
	    
        }

	startSync();
        startExpiration();

    }

    private void startSync() {
	(new Thread(new CacheSynchronizer(this))).start();
    }

    private void startExpiration() {
	(new Thread(new CacheManager(this))).start();
    }


    public CacheServerSync getPeer() {
	CacheServerSync peer = null;
        try {
            peer = getPeer(getRemoteServerURL());
        } catch (Exception e) {
            log.error("Peer not located: " + e.getMessage());
        }
	return peer;
    }

    CacheServerSync getPeer(String url) 
	throws MalformedURLException, 
	       NotBoundException,
	       RemoteException
    {
	return (CacheServerSync) Naming.lookup(url);
    }


    Cache findCache() {
        try {
            CacheServerSync sync = getPeer(getRemoteServerURL());
            log.info("located peer, getting cache");
            return sync.getCache();
            
        } catch (MalformedURLException e) {
            log.error("problem A w/ peer - " + e.getMessage());
        } catch (NotBoundException e) {
            log.error("problem B w/ peer - " + e.getMessage());
        } catch (RemoteException e) {
            log.error("problem C w/ peer - " + e.getMessage());
        }


        log.info("No peer located");
        return new Cache(_size);
    }

    void initRegistry() {
	try {
	    Registry reg = LocateRegistry.getRegistry(getLocalPort());
	    log.info("Found registry - " + reg);

	    log.info("LIST: " + reg.list());
	    return;

	} catch (RemoteException e) {
	}

	try {
	    Registry reg = LocateRegistry.createRegistry(getLocalPort());
	    log.info("Created Registry!!");
	    return;
	} catch (RemoteException e) {
	}

	log.info("local registry not found, can't create - exit!");
	System.exit(0);

    }

}
