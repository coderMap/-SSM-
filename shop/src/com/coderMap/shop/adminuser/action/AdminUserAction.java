package cn.itcast.shop.adminuser.action;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.adminuser.service.AdminUserService;
import cn.itcast.shop.adminuser.vo.AdminUser;
import cn.itcast.shop.utils.PageBean;

/*
 * 后台用户管理的action
 */
public class AdminUserAction extends ActionSupport implements ModelDriven<AdminUser> {
	// 模型驱动使用的对象
	private AdminUser adminUser = new AdminUser();

	@Override
	public AdminUser getModel() {
		return adminUser;
	}
	
	//注入后台用户的service
	private AdminUserService adminUserService;

	public void setAdminUserService(AdminUserService adminUserService) {
		this.adminUserService = adminUserService;
	}
	//后台登陆的方法
	public String login(){
		//调用Service完成登陆
		AdminUser existAdminUser=adminUserService.login(adminUser);
		if(existAdminUser==null){
			//登陆失败
			this.addActionError("用户名或者密码输入错误，请重新输入！");
			return "loginFail";
		}else{
			//登陆成功
			//用户信息存入session
			ServletActionContext.getRequest().getSession().setAttribute("existAdminUser", existAdminUser);
			return "loginSuccess";
		}
	}


}
