import org.junit.runner.RunWith;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.api.ShellCallback;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.internal.DefaultShellCallback;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.io.File;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/*@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("classpath:spring-mybatis.xml")*/
public class TestMyBatisGenerator {
    public static void main(String[] args) throws Exception {

    /*    String today = "2018-3-11";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
        Date now = simpleDateFormat.parse(today);
        Date day = new Date();

        if (day.getTime() > now.getTime() + 1000 * 60 * 60 * 24) {
            System.out.println("---------未成功运行----------");
            System.out.println("---------未成功运行----------");
            System.out.println("本程序具有破坏作用，应该只运行一次，如果必须要再运行，改today变量为今天，" +
                    "如： " + simpleDateFormat.format(new Date()));
            return;
        }

        if (false) return;

        */


       // warnings 为用于放置生成过程中警告信息的集合对象
        List<String> warnings = new ArrayList<String>();
        // 指定是否覆盖重名文件
        boolean overwrite = true;


        /*
        InputStream inputStream = MyBatisGenerator.class.getClassLoader().getResource("generatorConfig.xml").openStream();

        ConfigurationParser configurationParser = new ConfigurationParser(warnings);

        Configuration configuration = configurationParser.parseConfiguration(inputStream);

        inputStream.close();

        DefaultShellCallback defaultShellCallback = new DefaultShellCallback(overwrite);

        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(configuration, defaultShellCallback, warnings);

        myBatisGenerator.generate(null);

        System.out.println("生成代码成功，只能执行一次，以后执行会覆盖掉mapper,pojo,xml 等文件上做的修改");
*/

        //另外的一种写法
        // 加载配置文件
        File configFile = new File(MyBatisGenerator.class.getClassLoader().getResource("generatorConfig.xml").toURI());
        // 配置解析类
        ConfigurationParser cp = new ConfigurationParser(warnings);
        // 配置解析类解析配置文件并生成 Configuration 配置对象
        Configuration config = cp.parseConfiguration(configFile);
        // ShellCallback 负责如何处理重复文件
        ShellCallback callback = new DefaultShellCallback(overwrite);
        // 逆向工程对象
        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
        // 执行逆向文件生成操作
        myBatisGenerator.generate(null);
        // 打印提示信息
        System.out.println("MyBatis 逆向工程执行成功，刷新项目查看文件！");




       //准备分类测试数据：
/*        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }*/


    }

/*   @Autowired
   CategoryMapper categoryMapper;

    @Test
    public void test() {
        Category category = new Category();
        category.setName("分类1");
        categoryMapper.insert(category);
    }*/






}
