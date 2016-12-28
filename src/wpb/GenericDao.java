package wpb;

import java.io.Serializable;
import java.util.List;

public interface GenericDao <T, PK extends Serializable> {
	 
    /** Persist the newInstance object into database */
    PK add(T newInstance);
 
    /** Retrieve an object that was previously persisted to the database using
     *   the indicated id as primary key
     */
    T find(PK id, boolean lock);
    
    /** Get a list of all objects from persistent storage in the database */
    List<T> getAll();
    
    /** Get a partial list of all objects from persistent storage in the database */
    List<T> getPartial(int offset, int limit);
    
    /** Save changes made to a persistent object.  */
    void update(T transientObject);
 
    /** Remove an object from persistent storage in the database */
    void delete(T persistentObject);
    
    /** Remove an object from persistent storage in the database */
    public long getTotalCount();
    
}