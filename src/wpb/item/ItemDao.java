package wpb.item;

import java.util.List;

public interface ItemDao {
   
   public void addItem(Item itm);
   public List<Item> listItems();
   public List<Item> listItems(int offset, int limit);
   public long getTotalCount();
   public Item getItemById(long id);
   public void updateItem(long id, String name, double price, boolean available);
   public void deleteItem(long id);

}
