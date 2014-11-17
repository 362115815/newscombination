
import java.sql.Connection;
import java.util.TimerTask;
/**
 * Created by xiaomin on 2014/11/11.
 */
public class MyTimerTask extends TimerTask {
    public void run()
    {
        NewsUpdater updater=new NewsUpdater();
        try {
            updater.update();
        } catch (Exception e) {
            e.printStackTrace();
        }
        DBConnect db=new DBConnect();
        try {
            Connection cont=db.getConnection();

        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
