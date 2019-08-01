package cn.itcast.shop.categorysecond.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.utils.PageBean;
import cn.itcast.shop.utils.PageHibernateCallback;

/*
 * 持久层：二级分类
 */
public class CategorySecondDao extends HibernateDaoSupport {
	//持久层：统计二级分类
	public int findCount() {
		String hql="select count(*) from CategorySecond";
		List<Long> list=this.getHibernateTemplate().find(hql);
		if(list!=null&&list.size()>0){
			return list.get(0).intValue();
		}
		return 0;
	}
	//持久层：查询二级分类
	public List<CategorySecond> findByPage(int begin, int limit) {
		String hql="from CategorySecond order by csid desc";
		List<CategorySecond> list=this.getHibernateTemplate().executeFind(new PageHibernateCallback<CategorySecond>(hql, null, begin, limit));
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	//持久层：保存二级分类
	public void save(CategorySecond categorySecond) {
		this.getHibernateTemplate().save(categorySecond);
	}
	//持久层：根据二级分类id查询
	public CategorySecond findByCsid(Integer csid) { 
		return this.getHibernateTemplate().get(CategorySecond.class, csid);
	}
	//持久层：删除二级分类
	public void delete(CategorySecond categorySecond) {
		this.getHibernateTemplate().delete(categorySecond);
	}
	//持久层：修改二级分类
	public void update(CategorySecond categorySecond) {
		 this.getHibernateTemplate().update(categorySecond);
	}
	//持久层：查询所有二级分类
	public List<CategorySecond> finAll() { 
		String hql="from CategorySecond";
		return this.getHibernateTemplate().find(hql);
	}

}
