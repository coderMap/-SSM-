package cn.itcast.shop.adminuser.service;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.adminuser.dao.AdminUserDao;
import cn.itcast.shop.adminuser.vo.AdminUser;
import cn.itcast.shop.utils.PageBean;

/*
 * 业务层：后台用户
 */
@Transactional
public class AdminUserService {
	//注入dao
	private AdminUserDao adminUserDao;

	public void setAdminUserDao(AdminUserDao adminUserDao) {
		this.adminUserDao = adminUserDao;
	}
	//业务层：用户登陆
	public AdminUser login(AdminUser adminUser) {
		return adminUserDao.login(adminUser);
	}
	
	
}
