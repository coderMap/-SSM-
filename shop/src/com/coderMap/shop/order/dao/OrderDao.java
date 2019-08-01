package cn.itcast.shop.order.dao;

import java.util.List;

import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.order.vo.Order;
import cn.itcast.shop.order.vo.OrderItem;
import cn.itcast.shop.utils.PageHibernateCallback;

/*
 * 持久层：订单模块
 */
public class OrderDao extends HibernateDaoSupport {
	// 保存订单
	public void save(Order order) {
		this.getHibernateTemplate().save(order);
	}

	// 持久层：我的订单个数统计
	public Integer findByCountUid(Integer uid) {
		String hql = "select count(*) from Order o where o.user.uid=?";
		List<Long> list = this.getHibernateTemplate().find(hql, uid);
		if (list != null && list.size() > 0) {
			return list.get(0).intValue();
		}
		return null;
	}

	// 持久层：我的订单查询
	public List<Order> findByPageUid(Integer uid, Integer begin, Integer limit) {
		String hql = "from Order o where o.user.uid=? order by ordertime desc";
		List<Order> list = this.getHibernateTemplate()
				.execute(new PageHibernateCallback<Order>(hql, new Object[] { uid }, begin, limit));
		return list;
	}

	// 持久层：根据id查询订单
	public Order findByOid(Integer oid) {
		return this.getHibernateTemplate().get(Order.class, oid);
	}
	// 持久层：统计订单个数
	public int findByCount() {
		String hql="select count(*) from Order";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}
	// 持久层：带分页查询订单
	public List<Order> findByPage(int begin, Integer limit) {
		String hql="from Order order by ordertime desc";
		List<Order> list=this.getHibernateTemplate().execute(new PageHibernateCallback<Order>(hql, null, begin, limit));
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	// 持久层：根据订单id查询订单项
	public List<OrderItem> finOrderItem(Integer oid) {
		String hql="from OrderItem oi where oi.order.oid=? ";
		List<OrderItem> list=this.getHibernateTemplate().find(hql,oid);
		if(list!=null&&list.size()>0){
			return list;
		}
		return null;
	}
	// 持久层：修改订单
	public void update(Order currOrder) {
		this.getHibernateTemplate().update(currOrder);
	}

}
