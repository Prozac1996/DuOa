package config;

import com.jfinal.config.*;
import com.jfinal.kit.PropKit;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.mchange.v2.resourcepool.ResourcePool;
import controller.DataController;
import controller.IndexController;
import controller.ManageController;
import controller.UserController;
import model.Report;
import model.User;

public class ServerConfig extends JFinalConfig {

    @Override
    public void configConstant(Constants me) {
        me.setDevMode(true);
        PropKit.use("config.properties");
    }

    @Override
    public void configRoute(Routes me) {
        me.add("/", IndexController.class);
        me.add("user", UserController.class);
        me.add("manage", ManageController.class);
        me.add("data", DataController.class);
    }

    @Override
    public void configPlugin(Plugins me) {
        C3p0Plugin c3p0Plugin = new C3p0Plugin(PropKit.get("jdbcurl"),PropKit.get("dbuser"),PropKit.get("dbpassword"));
        me.add(c3p0Plugin);
        ActiveRecordPlugin arp = new ActiveRecordPlugin("duOa",c3p0Plugin);
        me.add(arp);
        arp.addMapping("user","id", User.class);
        arp.addMapping("report","id", Report.class);

    }

    @Override
    public void configInterceptor(Interceptors me) {

    }

    @Override
    public void configHandler(Handlers me) {

    }
}
