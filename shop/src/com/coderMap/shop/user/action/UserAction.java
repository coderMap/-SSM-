package cn.itcast.shop.user.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.order.vo.Order;
import cn.itcast.shop.user.service.UserService;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.utils.PageBean;

/*
 * 用户模块的action类
 */
public class UserAction extends ActionSupport implements ModelDriven<User> {
	// 模型驱动要使用的对象
	private User user = new User();
	// 注入userService
	private UserService userService;

	public void setUserService(UserService userService) {
		this.userService = userService;
	}

	// 接收验证码
	private String checkcode;

	public void setCheckcode(String checkcode) {
		this.checkcode = checkcode;
	}

	@Override
	public User getModel() {
		return user;
	}

	/*
	 * 跳转到注册页面的方法
	 */
	public String registPage() {

		return "registPage";
	}

	/**
	 * AJAX进行异步校验用户名的执行方法
	 * 
	 * @throws IOException
	 */
	public String findByName() throws IOException {
		// 调用Service进行查询:
		User existUser = userService.findByUsername(user.getUsername());
		// 获得response对象,项页面输出:
		HttpServletResponse response = ServletActionContext.getResponse();
		response.setContentType("text/html;charset=UTF-8");
		// 判断
		if (existUser != null) {
			// 查询到该用户:用户名已经存在
			response.getWriter().println("<font color='red'>用户名已经存在</font>");
		} else {
			// 没查询到该用户:用户名可以使用
			response.getWriter().println("<font color='green'>用户名可以使用</font>");
		}
		return NONE;
	}

	/**
	 * 用户注册的方法:
	 */
	public String regist() {
		// 判断验证码程序:
		// 从session中获得验证码的随机值:
		String checkcode1 = (String) ServletActionContext.getRequest().getSession().getAttribute("checkcode");
		if (!checkcode.equalsIgnoreCase(checkcode1)) {
			this.addActionError("验证码输入错误!");
			return "checkcodeFail";
		}
		userService.save(user);
		return "loginPage";
	}

	/*
	 * 跳转到登陆页面的方法
	 */
	public String loginPage() {
		return "loginPage";
	}

	/*
	 * 登陆的方法
	 */
	public String login() {
		User existUser = userService.login(user);
		// 判断
		if (existUser == null) {
			// 登录失败
			this.addActionError("登录失败:用户名或密码错误或用户未激活!");
			return LOGIN;
		} else {
			// 登录成功
			// 将用户的信息存入到session中
			ServletActionContext.getRequest().getSession().setAttribute("existUser", existUser);
			// 页面跳转
			return "loginSuccess";
		}
	}

	// 用户退出的方法
	public String quit() {
		// 销毁session
		ServletActionContext.getRequest().getSession().invalidate();
		return "quit";
	}

	// 跳转到个人信息页面的方法(获取数据)
	public String infoPage() {
		// 根据id查询用户
		user = userService.findByUid(user.getUid());
		return "infoPage";
	}

	// 修改个人信息
	public String update() {
		userService.update(user);
		return "updateSuccess";

	}

	// 后台管理系统
	// 后台用户管理系统
	// 接受page参数
	private Integer page;

	public void setPage(Integer page) {
		this.page = page;
	}

	// 带分页的用户查询
	public String findAll() {
		// 调用service完成查询操作
		// 分页查询
		PageBean<User> pageBean = userService.findByPage(page);
		// 通过值栈保存数据到页面
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		// 页面跳转
		return "findAll";
	}

	// 根据用户id修改用户状态
	public String delete() {
		// 1.根据id查询用户
		User currUser = userService.findByUid(user.getUid());
		// 2.修改用户状态
		if(currUser.getState()==0){
			currUser.setState(1);// 1:可用
		}else{
			currUser.setState(0);// 0:删除用户
		}
		userService.update(currUser);
		// 3.页面跳转
		return "delete";

	}
}
