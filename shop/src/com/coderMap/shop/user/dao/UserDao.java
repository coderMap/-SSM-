package cn.itcast.shop.user.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.user.vo.User;
import cn.itcast.shop.utils.PageHibernateCallback;

/*
 * 用户模块持久层的代码
 */
public class UserDao extends HibernateDaoSupport {
	// 按名次查询是否有该用户:
	public User findByUsername(String username) {
		String hql = "from User where username = ?";
		List<User> list = this.getHibernateTemplate().find(hql, username);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}

	// 注册用户存入数据库的方法
	public void save(User user) {
		this.getHibernateTemplate().save(user);
	}
//用户登录的方法
	public User login(User user) {
		String hql = "from User where username = ? and password = ? and state = ?";
		List<User> list = this.getHibernateTemplate().find(hql,user.getUsername(), user.getPassword(), 1);
		if (list != null && list.size() > 0) {
			return list.get(0);
		}
		return null;
	}
	//持久层：用户修改个人信息的方法
	public User findByUid(Integer uid) {
		return this.getHibernateTemplate().get(User.class, uid);
	}
	//持久层：用户修改个人信息
	public void update(User user) {
		this.getHibernateTemplate().update(user);
	}
	//持久层：统计总人数
	public int findByCount() {
		String hql="select count(*) from User";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return 0;
	}
	//持久层：带分页的用户查询
	public List<User> findByPage(int begin, int limit) {
		String hql="from User order by uid desc";
		List<User> list=this.getHibernateTemplate().execute(new PageHibernateCallback<User>(hql,null,begin,limit));
		if(list != null && list.size() > 0){
			return list;
		}
		return null;
	}

}
