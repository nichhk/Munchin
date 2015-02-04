import com.google.appengine.api.datastore.EmbeddedEntity;
import com.google.appengine.api.datastore.Entity;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by nich on 1/31/15.
 */
public class Order {
    List<Item> items = new ArrayList<Item>();
    public Order(Entity order){
        List<EmbeddedEntity> itemsEntity= (ArrayList<EmbeddedEntity>)(order.getProperty("items"));
        for(EmbeddedEntity item: itemsEntity){
            items.add(new Item(item,false));
        }
    }

    public class Item{
        public String foodItem;
        public String priceMax;
        public String comments;
        public Item alt = null;
        private boolean isAlt;

        public Item(EmbeddedEntity item, boolean isAlt) {
            this.isAlt = isAlt;
            this.foodItem = (String) item.getProperty("foodItem");
            this.priceMax = (String) item.getProperty("priceMax");
            this.comments = (String) item.getProperty("comments");
            if (!isAlt) {
                if (item.getProperty("alt") != null) {
                    alt = new Item((EmbeddedEntity) item.getProperty("alt"), true);
                }
            }
        }

    }
}
