package CCTV.Tmall.Util;

import org.mybatis.generator.api.GeneratedFile;
import org.mybatis.generator.api.GeneratedXmlFile;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;

import java.lang.reflect.Field;
import java.util.List;

public class OverIsMergeablePlugin extends PluginAdapter{

    public boolean validate(List<String> list) {
        return true;
    }

    public boolean sqlMapGenerated(GeneratedXmlFile sqlMap, IntrospectedTable introspectedTable) {
        try {
            Field field = sqlMap.getClass().getDeclaredField("isMergeable");
            field.setAccessible(true);
            field.setBoolean(sqlMap, false);
        } catch (NoSuchFieldException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        }
        return true;
    }
}
