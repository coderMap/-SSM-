package cn.itcast.shop.user.service;

import java.util.List;
import java.util.UUID;

import org.springframework.transaction.annotation.Transactional;

import cn.itcast.shop.adminuser.vo.AdminUser;
import cn.itcast.shop.user.dao.UserDao;
import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.utils.PageBean;
import cn.itcast.shop.utils.UUIDUtils;

/*
 * 用户模块业务层的代码
 */
@Transactional
public class UserService {
	// 注入UserDao
	private UserDao userDao;

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	// 按用户名查询用户的方法:
	public User findByUsername(String username) {
		return userDao.findByUsername(username);
	}

	// 业务层用户注册
	public void save(User user) {
		// 将数据存入数据库
		user.setName("");
		user.setPhone("");
		user.setAddr("");
		user.setState(0);// 0代表未激活，1代表已激活
		String code = UUIDUtils.getUUID() + UUIDUtils.getUUID();
		user.setCode(code);
		userDao.save(user);
	}

	// 用户登录的方法
	public User login(User user) {
		return userDao.login(user);
	}

	//业务层： 用户修改个人信息的方法
	public User findByUid(Integer uid) {
		return userDao.findByUid(uid);
	}
	//业务层： 修改个人信息的方法
	public void update(User user) {
		userDao.update(user);
	}
	
	
	
	//用户后台管理
	//业务层：带分页的用户查询
	public PageBean<User> findByPage(Integer page) {
		PageBean<User> pageBean=new PageBean<User>();
		//设置当前的页数
		pageBean.setPage(page);
		//设置每页显示条数
		int limit=10;
		pageBean.setLimit(limit);
		//设置总记录数
		int totalCount=userDao.findByCount();
		pageBean.setTotalCount(totalCount);
		//设置总页数
		//计算总页数
		int totalPage=0;
		if(totalCount % limit==0){
			totalPage=totalCount / limit;
		}else{
			totalPage=totalCount / limit+1;
		}
		pageBean.setTotalPage(totalPage);
		//设置每页显示数据的集合
		int begin=(page-1) * limit;
		List<User> list=userDao.findByPage(begin,limit);
		pageBean.setList(list);
		return pageBean;
	}

}
