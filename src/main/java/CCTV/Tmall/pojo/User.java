package CCTV.Tmall.pojo;

public class User {
    private Integer id;

    private String name;

    private String password;


    /*显示评价者的时候进行匿名显示*/
    public String getAnonymousName() {
        if (null == name) {
            return null;
        }
        if (name.length() <= 1) {
            return "*";
        }
        if (name.length() == 2) {
            return name.substring(0, 2)+"*";
        }
        char[] category = name.toCharArray();
        for (int i = 1;i<category.length - 1;i++) {
            category[i] = '*';
        }
        return new String(category);
    }



    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}