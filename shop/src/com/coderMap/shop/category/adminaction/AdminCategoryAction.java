package cn.itcast.shop.category.adminaction;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;

/*
 * 后台一级分类的action
 */
public class AdminCategoryAction extends ActionSupport implements ModelDriven<Category> {
	//模型驱动使用的类
	private Category category=new Category();
	@Override
	public Category getModel() {
		return category;
	}
	//注入一级分类的Service
	private CategoryService categoryService;
	
	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	//后台查询所有一级分类的方法
	public String findAll(){
		//查询所有一级分类
		List<Category> cList=categoryService.findAll();
		//将集合的数据显示到页面上
		ActionContext.getContext().getValueStack().set("cList", cList);
		return "findAll";
	}
	//后台保存一级分类的方法
	public String save(){
		//调用Service保存
		categoryService.save(category);
		this.addActionMessage("操作成功");
		//页面跳转
		return "saveSuccess"; 
	}
	//后台删除一级分类的方法
	public String delete(){
		//接收cid，使用模型驱动；删除一级分类的同时删除二级分类，必须先查询，再删除。
		category =categoryService.findByCid(category.getCid());
		//删除
		categoryService.delete(category);
		//页面跳转
		return "deleteSuccess"; 
	}
	//后台编辑一级分类的方法（查询）
	public String edit(){
		//查询一级分类
		category=categoryService.findByCid(category.getCid());
		//页面跳转 
		return "editSuccess"; 
	}
	//后台修改一级分类的方法
	public String update(){
		categoryService.update(category);
		//页面跳转
		return "updateSuccess";
		
	}
}
