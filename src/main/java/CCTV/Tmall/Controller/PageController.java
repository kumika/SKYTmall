package CCTV.Tmall.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PageController {

    @RequestMapping("registerSuccessPage")
    public String registerSuccessPage() {
        return "fore/registerSuccess";
    }


    @RequestMapping("registerPage")
    public String registerPage() {
        return "fore/register";
    }

    @RequestMapping("loginPage")
    public String loginPage() {
        return "fore/login";
    }


    @RequestMapping("forealipay")
    public String aliPay() {
        return "fore/alipay";
    }
}
