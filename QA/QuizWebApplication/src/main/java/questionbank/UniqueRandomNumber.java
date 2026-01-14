package questionbank;

import java.util.HashSet;
import java.util.Random;
import java.util.Set;

public class UniqueRandomNumber {

    public static final int SET_SIZE_REQUIRED = 10;
    public static final int NUMBER_RANGE = 40;

    public Object[] unique()
    {
      Random random = new Random();

        Set<Integer> set = new HashSet<Integer>(SET_SIZE_REQUIRED);

        while(set.size()< SET_SIZE_REQUIRED) {
            while (set.add(random.nextInt(NUMBER_RANGE)) != true);
        }
        assert set.size() == SET_SIZE_REQUIRED;
        //System.out.println(set);
        Object a[] = set.toArray();
          for(int i=0;i<a.length;i++)
          {
             // System.out.println(a[i]);
          }
          return a;
    }
    
    public static void main(String[] args) {
       // new UniqueRandomNumber().unique();
    }
}