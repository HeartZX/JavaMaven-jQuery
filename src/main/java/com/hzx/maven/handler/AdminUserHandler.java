package com.hzx.maven.handler;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hzx.maven.entity.Admin;
import com.hzx.maven.service.AdminService;
import com.hzx.maven.until.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminUserHandler {

    @Autowired
    private AdminService adminService;

    @ResponseBody
    @RequestMapping("/login")
    public Msg AdminLogin(Admin admin, HttpServletRequest request){
        Admin adminUser = adminService.getAdmin(admin);
        if(adminUser!=null){
            request.getSession().setAttribute("AdminUser",adminUser);
            return Msg.success();
        }else{
            return Msg.fail();
        }
    }

    @ResponseBody
    @RequestMapping("/getAdmin")
    public Msg getAdmin(Admin admin){
        Admin adminUser = adminService.getAdmin(admin);
        if(adminUser!=null){
            return Msg.success().add("adminUser",adminUser);
        }else{
            return Msg.fail();
        }
    }

    @ResponseBody
    @RequestMapping("/showAllAdmin")
    public Msg showAllAdmin(@RequestParam(value="pn",defaultValue="1") Integer pageNum) {

        PageHelper.startPage(pageNum,10);
        Admin admin = new Admin();
        List<Admin> admins=adminService.getAllAdmins(admin);
        PageInfo<Admin> pageInfo=new PageInfo<Admin>(admins,10);

        return  Msg.success().add("page", pageInfo);
    }

    @ResponseBody
    @RequestMapping("/addAdmin")
    public Msg showAllAdmin(Admin admin) {
        //查询用户是否已存在
        Admin tmpAdmin = new Admin();
        tmpAdmin.setAdUsername(admin.getAdUsername());
        Admin adminUser = adminService.getAdmin(tmpAdmin);
        if(adminUser==null){
            admin.setAdZctime(new Date());
            if(adminService.AddAdmin(admin)){
                return Msg.success();
            }else{
                return Msg.fail();
            }
        }else{
            return Msg.fail();
        }
    }

    @ResponseBody
    @RequestMapping("/modifyAdmin")
    public Msg modifyAdmin(Admin admin) {
        //查询用户是否已存在
        Admin tmpAdmin = new Admin();
        tmpAdmin.setAdUsername(admin.getAdUsername());
        Admin adminUser = adminService.getAdmin(tmpAdmin);
        if(adminUser==null){
            if(adminService.modifyAdmin(admin)){
                return Msg.success();
            }else{
                return Msg.fail();
            }
        }else{
            return Msg.fail();
        }
    }

    @ResponseBody
    @RequestMapping("/removeAdmin")
    public Msg removeAdmin(Integer[] ids) {
        for (int i:ids) {
            Admin admin = new Admin();
            admin.setId(i);
            adminService.removeAdmin(admin);
        }
        return Msg.success();
    }


}
