package cn.itcast.shop.product.action;

import java.util.List;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ModelDriven;

import cn.itcast.shop.category.service.CategoryService;
import cn.itcast.shop.category.vo.Category;
import cn.itcast.shop.product.service.ProductService;
import cn.itcast.shop.product.vo.Product;
import cn.itcast.shop.utils.PageBean;

/*
 * 商品的action
 */
public class ProductAction extends ActionSupport implements ModelDriven<Product> {
	// 用于接收数据的模型驱动
	private Product product = new Product();
	// 注入productService
	private ProductService productService;
	// 接收一级分类的cid
	private Integer cid;

	// 接收二级分类的cid
	private Integer csid;

	// 接收商品名称cname
	private Integer cname;

	// 注入一级分类得service
	private CategoryService categoryService;
	// 接收当前的页数
	private int page;

	public void setPage(int page) {
		this.page = page;
	}

	public void setCategoryService(CategoryService categoryService) {
		this.categoryService = categoryService;
	}

	public void setCname(Integer cname) {
		this.cname = cname;
	}

	public Integer getCid() {
		return cid;
	}

	public void setCid(Integer cid) {
		this.cid = cid;
	}

	public Integer getCsid() {
		return csid;
	}

	public void setCsid(Integer csid) {
		this.csid = csid;
	}

	public void setProductService(ProductService productService) {
		this.productService = productService;
	}

	@Override
	public Product getModel() {
		return product;
	}

	// 根据id查询商品
	public String findByPid() {
		// 调用Service方法来完成查询
		product = productService.findByPid(product.getPid());
		return "findByPid";
	}

	// 根据一级分类的id查询商品
	public String findByCid() {
		// List<Category> cList=categoryService.findAll();
		PageBean<Product> pageBean = productService.findByPageCid(cid, page);// 根据一级分类查询商品，带分页的查询
		// 将PageBean存入到值栈中去
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCid";
	}

	// 根据二级分类的id查询商品
	public String findByCsid() {
		// 调用service查询
		PageBean<Product> pageBean = productService.findByPageCsid(csid, page);
		// 将PageBean存入到值栈中去
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByCsid";
	}

	//首页搜索框：根据名称查询商品
	public String findByName() {
		// 调用service查询
		PageBean<Product> pageBean = productService.findByName(product.getPname(), page);// 根据名称查询商品，带分页的查询
		// 将PageBean存入到值栈中去
		ActionContext.getContext().getValueStack().set("pageBean", pageBean);
		return "findByName";
	}
}
