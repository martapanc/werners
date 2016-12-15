package wpb.tableorder;

import java.util.List;

public interface TableDao {
   
   public void addTableOrder(TableOrder to);
   public List<TableOrder> listTableOrders();
   public List<TableOrder> listTableOrders(int offset, int limit);
   public long getTotalCount();
   public TableOrder getTableOrderById(long id);
   public void updateTableOrder(long id, String name, double price, boolean available);
   public void deleteTableOrder(long id);

}
