import org.junit.Test;

public class MyTest {


    @Test
    public void test(){
        String s="1,2";
        String [] ss=s.split(",");
        for (String s1 : ss) {
            System.out.println(s1);
        }
    }

}
