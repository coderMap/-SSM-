package cn.itcast.shop.categorysecond.adminaction;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;
import cn.itcast.shop.categorysecond.service.CategorySecondService;
import cn.itcast.shop.categorysecond.vo.CategorySecond;
import cn.itcast.shop.utils.PageBean;

/*
 * 后台二级分类的action
 */
public class AdminCategorySecondAction extends ActionSupport implements ModelDriven<CategorySecond>{
	// 模型驱动使用的对象
	private CategorySecond categorySecond = new CategorySecond();
	@Override
	public CategorySecond getModel() {
		return categorySecond;
	}
	//注入二级分类Service
	private CategorySecondService categorySecondService;
	public void setCategorySecondService(CategorySecondService categorySecondService) {
		this.categorySecondService = categorySecondService;
	}
	//接收page
	private Integer page;
	
	public void setPage(Integer page) {
		this.page = page;
	}
	//注入一级分类的service
	private CategoryService categoryService;

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}
	//查询二级分类的方法
	public String findAll(){
		//调用service
		PageBean<CategorySecond> pageBean=categorySecondService.findByPage(page);
		//将pageBean的数据保存到值栈中
		ActionContext.getContext().getValueStack().set("pageBean",pageBean);
		return "findAll"; 
	}
	//跳转到添加页面
	public String addPage(){
		//查询所有一级分类
		List<Category> cList=categoryService.findAll();
		//把数据显示到下拉列表中
		ActionContext.getContext().getValueStack().set("cList", cList);
		//页面跳转
		return "addPageSuccess";
	}
	//保存二级分类
	public String save(){
		categorySecondService.save(categorySecond);
		return "saveSuccess"; 
	}
	//删除二级分类
	public String delete(){
		//如果级联删除，先查询再删除
		categorySecond =categorySecondService.findByCsid(categorySecond.getCsid());
		categorySecondService.delete(categorySecond);
		return "deleteSuccess";
	}
	//编辑二级分类（跳转回显）
	public String edit(){
		//根据二级分类的id查询
		categorySecond=categorySecondService.findByCsid(categorySecond.getCsid());
		//查询所有一级分类
		List<Category> cList=categoryService.findAll();
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "editSuccess";
	}
	//修改二级分类
	public String update(){
		categorySecondService.update(categorySecond);
		return "updateSuccess"; 
	}
}
