package listener;

public class CountUtils {
   private static int loginCount;
   public static void add() {
	   loginCount++;
   }
   public static void substract() {
	   loginCount--;
   }
   public static int getlogincount() {
	   
	   return loginCount;
   }
}
